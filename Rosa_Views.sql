	USE MusicLibrary
	GO

	Select * From Customer
    SELECT * FROM Artist;
	SELECT * FROM Album;
	SELECT * FROM Playlist;

-- Create a view called MaleCustomer 
 CREATE VIEW MaleCustomer
 AS
 SELECT CustomerID, CustomerFirstName + ' ' + CustomerLastName AS 'Full Name', CustomerAge AS Age
 FROM Customer
 WHERE CustomerGender = 'M';

 SELECT * FROM MaleCustomer;

 -- Create a view name v_Tracks
CREATE VIEW v_Tracks
AS
SELECT
	 a.TrackID, 
	 a.TrackName, 
	 a.TrackDuration AS Duration, 
	 b.AlbumName AS Album, 
	 b.AlbumReleaseDate AS 'Release Date'
FROM Track AS a
INNER JOIN ALBUM AS b
ON a.AlbumID = b.AlbumID
	
SELECT * FROM v_Tracks
-- Modify the view just created
ALTER VIEW v_Tracks
AS
SELECT TOP (5)
	 a.TrackID,
	 a.TrackName, 
	 a.TrackDuration AS Duration, 
	 b.AlbumName AS Album, 
	 b.AlbumReleaseDate AS 'Release Date'
FROM Track AS a
INNER JOIN ALBUM AS b
ON a.AlbumID = b.AlbumID
ORDER BY TrackName;

SELECT * FROM v_Tracks

-- Delete the views: 

DROP VIEW IF EXISTS MaleCustomer;
DROP VIEW IF EXISTS v_Tracks;