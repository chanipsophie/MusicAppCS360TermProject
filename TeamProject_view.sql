CREATE VIEW PlaylistView 
AS SELECT TOP (100) CustomerUsername As USER_NAME, CustomerFirstName + ' ' + CustomerLastName AS NAME, 
CustomerGender AS Gender, CustomerAge  AS Age, CustomerRegistration AS Registration_Date,
PlaylistName, PlaylistTracks, PlaylistCreatedDate AS Create_At 
FROM Customer c, Playlist p
WHERE c.CustomerID = p.CustomerID and YEAR(PlaylistCreatedDate) = '2020' and Month(PlaylistCreatedDate) = '04'
ORDER BY c.CustomerLastName;

ALTER VIEW PlaylistView 
AS SELECT TOP (100) CustomerUsername As USER_NAME, CustomerFirstName + ' ' + CustomerLastName AS NAME, 
CustomerGender AS Gender, CustomerAge  AS Age, CustomerRegistration AS Registration_Date,
PlaylistName, PlaylistTracks, PlaylistCreatedDate AS Create_At 
FROM Customer c, Playlist p
WHERE c.CustomerID = p.CustomerID and YEAR(PlaylistCreatedDate) = '2020' and Month(PlaylistCreatedDate) = '04'
ORDER BY c.CustomerLastName DESC;

SELECT * FROM PlaylistView;
