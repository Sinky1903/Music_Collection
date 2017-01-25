
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Artist;


CREATE TABLE Artist(
id SERIAL8 primary key,
name VARCHAR(255) not null
);


CREATE TABLE Album(
id SERIAL8 primary key,
title VARCHAR(255) not null,
genre VARCHAR(255) not null,
artist_id INT4 references artist(id)
);

