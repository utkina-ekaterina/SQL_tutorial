-- reference - https://www.youtube.com/watch?v=p3qvj9hO_Bo

CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE albums (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    band_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (band_id) REFERENCES bands(id)
);


INSERT INTO bands (name) 
VALUES ('TWICE');

INSERT INTO bands (name)
VALUES ('BTS'), ('BLACKPINK'), ('SEVENTEEN');

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT name FROM bands;

SELECT id AS 'ID', name AS 'Band Name' FROM bands;

SELECT * FROM bands ORDER BY name;

SELECT * FROM bands ORDER BY name DESC;

INSERT INTO albums (name, release_year, band_id) 
VALUES ('Ready To Be', 2023, 1), 
	   ('BE', 2020, 2),
       ('MAP OF THE SOUL: 7', 2020, 2),
       ('The Album', NULL, 3);
       
SELECT * FROM albums;

SELECT name FROM albums;

INSERT INTO albums (name, release_year, band_id) 
VALUES ('The Album', 2020, 3);

SELECT DISTINCT name FROM albums;

UPDATE albums 
SET release_year = 2023
WHERE id = 1;

SELECT * FROM albums 
WHERE release_year < 2022;

SELECT * FROM albums 
WHERE name LIKE '%be%' OR band_id = 2;

SELECT * FROM albums 
WHERE name LIKE '%be%' AND band_id = 2;

SELECT * FROM albums 
WHERE release_year BETWEEN 2019 AND 2022;

SELECT * FROM albums 
WHERE release_year IS NULL;

DELETE FROM albums WHERE id = 4;

SELECT * FROM albums;

SELECT * FROM bands 
JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands 
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM albums 
RIGHT JOIN bands ON bands.id = albums.band_id;



SELECT AVG(release_year) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums
GROUP BY band_id;


SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;


SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
WHERE b.name = 'TWICE'
GROUP BY b.id
HAVING num_albums = 1;


