-- Задания 2, 3

-- Название и продолжительность самого длительного трека.
select name_track, duration from track_list
order by duration desc 
limit 1;

-- Название треков, продолжительность которых не менее 3,5 минут.
select name_track from track_list
where duration >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name_collection from collection_list
where year_release between '2018-01-01%' and '2020-12-31%';

-- Исполнители, чьё имя состоит из одного слова.
select nickname 
from artists_list
where (length(nickname) - length(replace(nickname, ' ', ''))) < 1;

-- Название треков, которые содержат слово «мой» или «my».
select name_track from track_list
where name_track like '% My %' or name_track like '% My' or name_track like 'My %' or name_track like 'My';

-- Количество исполнителей в каждом жанре.
select GL.name_genre, COUNT(GL.name_genre) as Number_Artist 
from genres_list as GL
left join artists_genres AG on GL.genre_id = AG.genre_id 
group by GL.name_genre;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
select count(tl.name_track) as Number_Track  
from track_list as TL
join albums_list AL on al.album_id = TL.album 
where year_release between '2019-01-01%' and '2020-12-31%';



-- Средняя продолжительность треков по каждому альбому.
select al.name_album, avg(tl.duration)  
from albums_list as AL
left join track_list as TL on al.album_id = tl.album 
group by al.name_album;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
select nickname
from artists_list as AR 
where nickname not in (
	select nickname
	from artists_list as ar
	join albums_artists as AA on aa.artist_id = ar.artist_id 
	join albums_list as AL on al.album_id = aa.album_id 
	where extract(year from year_release) = 2020
);

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct cl.name_collection 
from collection_list as CL
join collections_tracks as CT on ct.collection_id = cl.collection_id 
join track_list as TL on tl.track_id = ct.track_id 
join albums_list as AL on al.album_id = tl.album 
join albums_artists as AA on aa.album_id = al.album_id 
join artists_list as AR on ar.artist_id = aa.artist_id 
where ar.nickname like 'Bruno Mars';

