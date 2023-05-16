-- Задания 2, 3

-- Название и продолжительность самого длительного трека.
select name_track, duration from track_list
order by duration desc 
limit 1

-- Название треков, продолжительность которых не менее 3,5 минут.
select name_track from track_list
where duration >= 210

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name_collection from collection_list
where year_release between '2018-01-01%' and '2020-12-31%'

-- Исполнители, чьё имя состоит из одного слова.
select nickname 
from artists_list
where (length(nickname) - length(replace(nickname, ' ', ''))) < 1

-- Название треков, которые содержат слово «мой» или «my».
select name_track from track_list
where name_track like '% My %' or name_track like '% My%' or name_track like '%My %'

-- Количество исполнителей в каждом жанре.
select GL.name_genre, COUNT(GL.name_genre) as Number_Artist 
from genres_list as GL
left join artists_genres AG on GL.genre_id = AG.genre_id 
group by GL.name_genre 

-- Количество треков, вошедших в альбомы 2019–2020 годов.
select al.name_album, count(tl.name_track) as Number_Track  
from track_list as TL
left join albums_list AL on al.album_id = TL.album 
where year_release between '2019-01-01%' and '2020-12-31%'
group by al.name_album

-- Средняя продолжительность треков по каждому альбому.
select al.name_album, avg(tl.duration)  
from albums_list as AL
left join track_list as TL on al.album_id = tl.album 
group by al.name_album 

-- Все исполнители, которые не выпустили альбомы в 2020 году.
select distinct ar.nickname 
from albums_list as AL 
join albums_artists as AA on al.album_id = aa.album_id 
join artists_list as AR on ar.artist_id = aa.artist_id 
where extract(year from year_release) <> 2020;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
-- Для решения этой задаче я посчитал правильно будет если создать новую таблицу связей между Треками и Артистами. 
-- Иначе есть информация об артистах только тех чьb треки находятся в альбомах, но если трек не вошел в альбом, то не известно кому он принадлежит.
select distinct cl.name_collection 
from collection_list as CL
left join collections_tracks as CT on ct.collection_id = cl.collection_id 
left join artist_tracks as AR on ar.track_id = ct.track_id 
left join artists_list as AL on al.artist_id = ar.artist_id
where al.nickname like 'Bruno Mars'

