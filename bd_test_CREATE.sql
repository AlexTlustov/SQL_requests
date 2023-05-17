-- Создание таблиц. 
CREATE TABLE IF NOT EXISTS genres_list (
    genre_id SERIAL PRIMARY KEY,
    name_genre VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists_list (
    artist_id SERIAL PRIMARY KEY,
    nickname VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS albums_list (
    album_id SERIAL PRIMARY KEY, 
    name_album VARCHAR(80) NOT NULL,
    year_release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS collection_list (
    collection_id SERIAL PRIMARY KEY,
    name_collection VARCHAR(80) NOT NULL,
    year_release DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS track_list (
    track_id SERIAL PRIMARY KEY,
    name_track VARCHAR(80) NOT NULL,
    duration INTEGER NOT NULL,
    album INTEGER REFERENCES albums_list(album_id)
);

CREATE TABLE IF NOT EXISTS artists_genres (
    connection_id SERIAL PRIMARY KEY,
    artist_id INTEGER NOT NULL REFERENCES artists_list(artist_id),
    genre_id INTEGER NOT NULL REFERENCES genres_list(genre_id)
);

CREATE TABLE IF NOT EXISTS albums_artists (
    connection_id SERIAL PRIMARY KEY,
    artist_id INTEGER NOT NULL REFERENCES artists_list(artist_id),
    album_id INTEGER NOT NULL REFERENCES albums_list(album_id)
);

CREATE TABLE IF NOT EXISTS collections_tracks (
    connection_id SERIAL PRIMARY KEY,
    track_id INTEGER NOT NULL REFERENCES track_list(track_id),
    collection_id INTEGER NOT NULL REFERENCES collection_list(collection_id)
);

CREATE TABLE IF NOT EXISTS artist_tracks (
    connection_id SERIAL PRIMARY KEY,
    artist_id INTEGER NOT NULL REFERENCES artists_list(artist_id),
    track_id INTEGER NOT NULL REFERENCES track_list(track_id)
);
