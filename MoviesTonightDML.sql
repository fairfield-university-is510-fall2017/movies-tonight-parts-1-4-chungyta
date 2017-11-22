#Create Theaters, Movies and Artist

ALTER TABLE credits
Modify column Ccode Varchar(1);

SET @@FOREIGN_KEY_checks = 1;

INSERT INTO Theaters (`Name`, Location, Phone)
	SELECT DISTINCT TName, Location, Phone FROM DATASHEET;

INSERT INTO Movies (Title, Rating)
	SELECT DISTINCT MTitle, Rating FROM DATASHEET;

INSERT INTO Artist (`Name`)
	SELECT DISTINCT CName FROM DATASHEET;

INSERT INTO `Show` (Showtime, MoviesID, TheatersID)
SELECT DISTINCT Showtime, Movies.MID, Theaters.TID
	FROM Movies JOIN DATASHEET ON (DATASHEET.MTitle = Movies.Title)
				JOIN Theaters ON (Theaters.Name  = DATASHEET.Tname);

INSERT INTO Credits (MoviesID, ArtistID, CCode)
SELECT DISTINCT Movies.MID, Artist.AID, CCode
	FROM  Artist join Datasheet ON (datasheet.CName = Artist.Name)
				JOIN Movies ON (Movies.Title  = DATASHEET.MTitle);

SELECT Tname, MTitle, Showtime, CName, CCode, count(*) As Rowcount
FROM DATASHEET
GROUP BY  Tname, MTitle, Showtime, CName, CCode
Having Rowcount > 1;

DROP TABLE DATASHEET;

SELECT * FROM Artist;

SELECT * FROM  Credits;

SELECT * FROM Movies;

SELECT * FROM `Show`;

SELECT * FROM Theaters;