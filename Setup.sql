-- Create Database 
CREATE DATABASE MusicApp
GO

USE MusicApp
GO

-- Creates Tables 
CREATE TABLE Artist (
    ArtistID int NOT NULL IDENTITY,
    ArtistFirstName nvarchar(255) NOT NULL,
    ArtistLastName nvarchar(255) NOT NULL,
    ArtistDOB date,
    ArtistGenre nvarchar(50),
	PRIMARY KEY (ArtistID)
);

CREATE TABLE Customer (
    CustomerID int NOT NULL IDENTITY,
	CustomerUsername varchar(60) NOT NULL UNIQUE,
	CustomerFirstName varchar(50) NOT NULL,
	CustomerLastName varchar(50) NOT NULL,
	CustomerGender varchar(12),
	CustomerAge int,
	CustomerRegistration datetime,
	PRIMARY KEY (CustomerID)
);

CREATE TABLE Album (
    AlbumID int NOT NULL IDENTITY, 
    AlbumName varchar(255) NOT NULL,
    AlbumReleaseDate date,
    ArtistID int NOT NULL,
	PRIMARY KEY (AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);


CREATE TABLE Track (
    TrackID int NOT NULL IDENTITY,
    TrackName varchar(255) NOT NULL,
    TrackDuration int,
    TrackReleaseDate date,
    ArtistID int NOT NULL,
	AlbumID int NOT NULL,
	PRIMARY KEY (TrackID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (AlbumID)  REFERENCES Album(AlbumID),
);

CREATE TABLE Playlist (
    PlaylistID int NOT NULL IDENTITY,
	PlaylistName varchar(255) NOT NULL,
	PlaylistCreatedDate date NOT NULL,
	CustomerID int NOT NULL,
    PlaylistTracks varchar(5000),
	PRIMARY KEY (PlaylistID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Populate Data into the tables
INSERT INTO Artist VALUES ('Michael', 'Jackson', '08-29-1958', 'Pop, Soul, Funk');

INSERT INTO Customer  VALUES ('SophieSophie', 'Sophie', 'Chan', 'F', 11, '4-15-2020');
INSERT INTO Customer VALUES ('RosaRosa', 'Rosa', 'Van', 'F', 12, '5-15-2020');

INSERT INTO Album VALUES ('Thriller', '11-30-1982', 1);
INSERT INTO Album VALUES ('Bad', '8-31-1987', 1);

INSERT INTO Track VALUES ('Beat It', 258, '11-30-1982', 1, 1);
INSERT INTO Track VALUES ('Thriller', 417, '11-30-1982', 1, 1);
INSERT INTO Track VALUES ('Bad', 418, '8-31-1987', 1, 2);
INSERT INTO Track VALUES ('Dirty Diana', 426, '8-31-1987', 1, 2);

INSERT INTO Playlist VALUES ('Sophie-Playlist', '4-15-2020', 1, '1,2,7' );
INSERT INTO Playlist VALUES ('Rosa-Playlist', '4-16-2020', 2, '1,2,8' );

-- Now let's populate with some random values,
DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 5)
BEGIN
    DECLARE @ArtistGenre nvarchar(50)
    SET @ArtistGenre = 'BLUES, POP, FUNK'

    DECLARE @CustomerGender varchar(1)
    SET @CustomerGender = 'M'

    DECLARE @PlaylistTracks varchar(5000)
    SET @PlaylistTracks = '1,2,6,8,10,9'

    DECLARE @ArtistFirstName varchar(5)
    SELECT @ArtistFirstName = CONVERT(varchar(255), NEWID())

    DECLARE @ArtistLastName varchar(5)
    SELECT @ArtistLastName = CONVERT(varchar(255), NEWID())

    DECLARE @ArtistDOB date
    SET @ArtistDOB = GETDATE()

    DECLARE @CustomerFirstName varchar(5)
    SELECT @CustomerFirstName = CONVERT(varchar(255), NEWID())

    DECLARE @CustomerLastName varchar(5)
    SELECT @CustomerLastName = CONVERT(varchar(255), NEWID())

    DECLARE @CustomerUsername varchar(10)
    SELECT @CustomerUsername = CONVERT(varchar(255), NEWID())

    DECLARE @CustomerAge int
    SET @CustomerAge = FLOOR(RAND()*(50-10)+10);

    DECLARE @CustomerRegistration DATETIME
    SET @CustomerRegistration = GETDATE()

    DECLARE @AlbumName varchar(15)
    SELECT @AlbumName = CONVERT(varchar(255), NEWID())

    DECLARE @AlbumReleaseDate date
    SET @AlbumReleaseDate = GETDATE()

    DECLARE @TrackName varchar(15)
    SELECT @TrackName = CONVERT(varchar(255), NEWID())

    DECLARE @TrackDuration int
    SET @TrackDuration = FLOOR(RAND()*(500-300)+300);

    DECLARE @TrackReleaseDate date
    SET @TrackReleaseDate = GETDATE()

    DECLARE @PlaylistName varchar(20)
    SELECT @PlaylistName = CONVERT(varchar(255), NEWID())

    DECLARE @PlaylistCreatedDate date
    SET @PlaylistCreatedDate = GETDATE()
    
    INSERT INTO Artist VALUES (@ArtistFirstName, @ArtistLastName, @ArtistDOB, @ArtistGenre) 
    INSERT INTO Customer VALUES (@CustomerUsername, @CustomerFirstName, @CustomerLastName, @CustomerGender, @CustomerAge, @CustomerRegistration);
    INSERT INTO Album VALUES (@AlbumName, @AlbumReleaseDate, 1);
    INSERT INTO Track VALUES (@TrackName, @TrackDuration, @TrackReleaseDate, 1, 1);
    INSERT INTO Playlist VALUES (@PlaylistName, @PlaylistCreatedDate, 1, @PlaylistTracks);

    SET @Counter = @Counter + 1
END

