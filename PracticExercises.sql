--SELECT
--	Id,
--	Name
--FROM
--	Genre;

--SELECT
--	Id,
--	ArtistName,
--	YearEstablished
--FROM
--	Artist
--ORDER BY
--	ArtistName;

--SELECT
--	Song.Id,
--	Title,
--	SongLength,
--	ReleaseDate,
--	GenreId,
--	ArtistId,
--	AlbumId,
--	ArtistName
--FROM
--	Song
--LEFT JOIN
--	Artist
--ON
--	Song.ArtistId = Artist.Id;

--SELECT DISTINCT
--	a.ArtistName, g.Name
--FROM
--	Artist a
--JOIN
--	Album al
--ON
--	al.ArtistId = a.Id
--JOIN
--	Genre g
--ON 
--	al.GenreId = g.Id
--WHERE
--	g.Id = 1;

--SELECT DISTINCT
--	a.ArtistName, g.Name
--FROM
--	Artist a
--JOIN
--	Album al
--ON
--	al.ArtistId = a.Id
--JOIN
--	Genre g
--ON 
--	al.GenreId = g.Id
--WHERE
--	g.Id = 2 OR g.Id = 4;

--SELECT
--	al.Title
--FROM
--	Album al
--LEFT JOIN
--	Song s
--ON
--	al.Id = s.AlbumId
--WHERE
--	s.Id IS NULL;

--INSERT INTO Artist
--	(ArtistName,
--	YearEstablished)
--VALUES
--	('Daft Punk',
--	1993);

--INSERT INTO Album
--	(Title,
--	ReleaseDate,
--	AlbumLength,
--	Label,
--	ArtistId,
--	GenreId)
--VALUES
--	('Discovery',
--	'03/12/2001',
--	3654,
--	'Virgin Records',
--	28,
--	14);

--INSERT INTO Song
--	(Id,
--	Title,
--	SongLength,
--	ReleaseDate,
--	GenreId,
--	ArtistId,
--	AlbumId)
--VALUES
--	('Aerodynamic',
--	208,
--	'03/12/2001',
--	14,
--	28,
--	23);

--INSERT INTO Song
--	(Id,
--	Title,
--	SongLength,
--	ReleaseDate,
--	GenreId,
--	ArtistId,
--	AlbumId)
--VALUES
--	('Crescendolls',
--	212,
--	'03/12/2001',
--	14,
--	28,
--	23);

--INSERT INTO Song
--	(Id,
--	Title,
--	SongLength,
--	ReleaseDate,
--	GenreId,
--	ArtistId,
--	AlbumId)
--VALUES
--	('One More Time',
--	321,
--	'03/12/2001',
--	14,
--	28,
--	23);


--SELECT
--	s.Title,
--	al.Title,
--	a.ArtistName
--FROM
--	Song s
--LEFT JOIN
--	Album al ON s.AlbumId = al.Id
--LEFT JOIN
--	Artist a ON s.ArtistId = a.Id
--WHERE a.Id = 28;

--SELECT
--	al.Title, COUNT(s.Id) 'NumOfSongs'
--FROM
--	Album al
--LEFT JOIN
--	Song s
--ON
--	al.Id = s.AlbumId
--GROUP BY
--	al.Title
--ORDER BY
--	'NumOfSongs' DESC;

--SELECT
--	a.ArtistName, COUNT(s.Id) 'NumOfSongs'
--FROM
--	Artist a
--LEFT JOIN
--	Song s
--ON
--	a.Id = s.ArtistId
--GROUP BY
--	a.ArtistName
--ORDER BY
--	'NumOfSongs' DESC;

--SELECT
--	g.Name, COUNT(s.Id) 'NumOfSongs'
--FROM
--	Genre g
--LEFT JOIN
--	Song s
--ON
--	g.Id = s.GenreId
--GROUP BY
--	g.Name
--ORDER BY
--	'NumOfSongs' DESC;

--SELECT
--	a.ArtistName, COUNT(DISTINCT Label) 'Labels'
--FROM
--	Artist a
--JOIN
--	Album al
--ON
--	a.Id = al.ArtistId
--GROUP BY
--	a.ArtistName
--HAVING COUNT(DISTINCT Label) > 1;

--SELECT
--	al.Title, 
--	al.AlbumLength 'Longest Runtime'
--FROM
--	Album al
--WHERE
--	al.AlbumLength = (
--		SELECT 
--			MAX(al.AlbumLength)
--		FROM
--			Album al);

--SELECT
--	s.Title, 
--	s.SongLength 'Longest Runtime'
--FROM
--	Song s
--WHERE
--	s.SongLength = (
--		SELECT 
--			MAX(s.SongLength)
--		FROM
--			Song s);

SELECT
	s.Title, 
	s.SongLength 'Longest Runtime',
	al.Title 'Album'
FROM
	Song s
JOIN
	Album al
ON
	s.AlbumId = al.Id
WHERE
	s.SongLength = (
		SELECT 
			MAX(s.SongLength)
		FROM
			Song s);