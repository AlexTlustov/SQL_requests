-- Заполнение таблицe "Жанры"
INSERT INTO genres_list (genre_id, name_genre)
VALUES 
(1, 'rock'),
(2, 'rap'),
(3, 'pop'),
(4, 'metal');

-- Заполнение таблицe "Альбомы"
INSERT INTO albums_list (album_id, name_album, year_release)
VALUES 
(1, 'Lateralus', '2001-05-15'),
(2, '10 000 Days', '2006-05-02'),
(3, 'Please Please Me', '1987-02-26'),
(4, 'Rubber Soul', '1965-12-06'),
(5, 'Infinite', '1996-11-12'),
(6, 'The Eminem Show', '2002-05-26'),
(7, 'The College Dropout', '2004-02-10'),
(8, 'Graduation', '2007-09-11'),
(9, 'Billionaire', '2010-03-09'),
(10, 'Finesse', '2019-11-17'),
(11, 'Bad', '1987-08-31'),
(12, 'Off the Wall', '1979-08-10');

-- Заполнение таблицы "Артисты"
INSERT INTO artists_list (artist_id, nickname)
VALUES 
(1, 'Tool'),
(2, 'The Beatles'),
(3, 'Eminem'),
(4, 'Kanye West'),
(5, 'Bruno Mars'),
(6, 'Michael Jackson');

-- Заполнение таблицы "Треки"
INSERT INTO track_list (track_id, name_track, duration, album)
VALUES
(1, 'The Grudge', '516', 1),
(2, 'The Patient', '433', 1),
(3, 'Right in Two', '535', 2),
(4, 'The Pot', '382', 2),
(5, 'I Saw Her Standing There', '174', 3),
(6, 'Misery', '110', 3),
(7, 'Backstabber', '204', 5),
(8, 'Never 2 Far', '218', 5),
(9, 'The Word', '161', 4),
(10, 'Nowhere Man', '160', 4),
(11, 'Without Me', '290', 6),
(12, 'Sing for the Moment', '339', 6),
(13, 'We Don’t Care', '239', 7),
(15, 'The Glory', '212', 8),
(17, 'Dope', '127', 9),
(19, 'Go My', '230', 10),
(21, 'Dirty Dianamy', '278', 11),
(23, 'Liberian Girl', '345', 12);

INSERT INTO track_list (track_id, name_track, duration)
VALUES
(14, 'Graduation Day', '82'),
(16, 'Everything I Am', '227'),
(18, 'Slide', '138'),
(20, 'Destiny', '195'),
(22, 'Smooth Criminal', '241'),
(24, 'The Way You Make Me Feel', '184');

-- Заполнение таблицы "Сборники"
INSERT INTO collection_list (collection_id, name_collection, year_release)
VALUES
(1, 'Curtain Call 2', '2005-09-10'),
(2, 'Loyal Bros 2', '2007-05-15'),
(3, 'Raw', '2015-07-15'),
(4, 'Look at Me: The Album', '2018-10-11');

-- Заполнение таблицы связей "Сборник-Трек"
INSERT INTO collections_tracks (connection_id, track_id, collection_id)
VALUES
(1, 10, 1),
(2, 11, 1),
(3, 13, 1),
(4, 14, 1),
(5, 5, 1),
(6, 1, 2),
(7, 2, 2),
(8, 18, 2),
(9, 19, 2),
(10, 24, 2),
(11, 22, 2),
(12, 20, 3),
(13, 7, 3),
(14, 8, 3),
(15, 9, 3),
(16, 16, 4),
(17, 17, 4),
(18, 21, 4),
(19, 23, 4);

-- Заполнение таблицы связей "Артист-Трек"
INSERT INTO artist_tracks (connection_id, artist_id, track_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 7),
(8, 3, 8),
(9, 2, 9),
(10, 2, 10),
(11, 3, 11),
(12, 3, 12),
(13, 4, 13),
(14, 4, 14),
(15, 4, 15),
(16, 4, 16),
(17, 5, 17),
(18, 5, 18),
(19, 5, 19),
(20, 5, 20),
(21, 6, 21),
(22, 6, 22),
(23, 6, 23),
(24, 6, 24);

-- Заполнение таблицы связей "Альбомы-Артисты"
INSERT INTO albums_artists (connection_id, artist_id, album_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8),
(9, 5, 9),
(10, 5, 10),
(11, 6, 11),
(12, 6, 12);

-- Заполнение таблицы связей "Артисты-Жанры"
INSERT INTO artists_genres (connection_id, artist_id, genre_id)
VALUES
(1, 1, 1),
(2, 1, 4),
(3, 2, 4),
(4, 3, 2),
(5, 4, 3),
(6, 5, 2),
(7, 5, 3),
(8, 6, 3);