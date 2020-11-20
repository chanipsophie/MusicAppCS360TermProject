-- Create Database 
CREATE DATABASE MusicLibrary
GO

USE MusicLibrary
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

-- Insert Values into the Tables
INSERT INTO Artist (ArtistFirstName, ArtistLastName, ArtistDOB, ArtistGenre)
VALUES ('Michael', 'Jackson', '08-29-1958', 'Pop, Soul, Funk');

CREATE TABLE Customer (
    CustomerID int NOT NULL IDENTITY,-- From Ip : add IDENTITY
	CustomerUsername varchar(60) NOT NULL UNIQUE,
	CustomerFirstName varchar(50) NOT NULL,
	CustomerLastName varchar(50) NOT NULL,
	CustomerGender varchar(12),
	CustomerAge int,
	CustomerRegistration datetime,
	PRIMARY KEY (CustomerID)
);
INSERT INTO Customer VALUES (1, 'SophieSophie', 'Sophie', 'Chan', 'F', 11, '4-15-2020');
INSERT INTO Customer VALUES (2, 'RosaRosa', 'Rosa', 'Van', 'F', 12, '5-15-2020');


CREATE TABLE Album (
    AlbumID int NOT NULL IDENTITY, -- From Ip : add IDENTITY
    AlbumName varchar(255) NOT NULL,
    AlbumReleaseDate date,
    -- From Ip : this column should be delect because AlumDuration can be computed during 
    -- round time from all of the track durtion in this album. If w eonclude this album 
    -- during here, we will likely have data inconsistancy.
    --AlbumDuration int,
    ArtistID int NOT NULL,
	PRIMARY KEY (AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);
INSERT INTO Album VALUES ('Thriller', '11-30-1982', 1);
INSERT INTO Album VALUES ('Bad', '8-31-1987', 1);

CREATE TABLE Track (
    TrackID int NOT NULL IDENTITY, -- From Ip : add IDENTITY
    TrackName varchar(255) NOT NULL,
    TrackDuration int,
    TrackReleaseDate date,
    ArtistID int NOT NULL,
	AlbumID int NOT NULL,
	PRIMARY KEY (TrackID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (AlbumID)  REFERENCES Album(AlbumID), -- From Ip: Albunm ID should be Foreign key
);
INSERT INTO Track VALUES ('Beat It', 258, '11-30-1982', 1, 1);
INSERT INTO Track VALUES ('Thriller', 417, '11-30-1982', 1, 1);
INSERT INTO Track VALUES ('Bad', 418, '8-31-1987', 1, 3);
INSERT INTO Track VALUES ('Dirty Diana', 426, '8-31-1987', 1, 3);



CREATE TABLE Playlist (
    PlaylistID int NOT NULL IDENTITY,-- From Ip : add IDENTITY
	PlaylistName varchar(255) NOT NULL,
	PlaylistCreatedDate date NOT NULL,
	CustomerID int NOT NULL,
    PlaylistTracks varchar(5000),
	PRIMARY KEY (PlaylistID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
INSERT INTO Playlist VALUES ('Sophie-Playlist', '4-15-2020', 1, '1,2,7' );
INSERT INTO Playlist VALUES ( 'Rosa-Playlist', '4-16-2020', 2, '1,2,8' );