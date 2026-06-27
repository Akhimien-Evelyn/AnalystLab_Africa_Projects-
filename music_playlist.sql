SELECT *
FROM mediatype;

--- Total number of customers
SELECT COUNT(customerid) AS total_customer
FROM customer;

--- Total number of artist
SELECT COUNT(artistid) AS total_artist
FROM artist;

--- Total genre
SELECT COUNT(genreid) AS total_genre
FROM genre;

--- Get all artist
SELECT ArtistId, Name
FROM Artist;

--- All album by a specific artist
SELECT AlbumId, Title
FROM Album
WHERE ArtistId = (SELECT ArtistId FROM Artist WHERE Name = 'Queen');

--- OR using join
SELECT a.AlbumId, a.Title
FROM Album a
JOIN Artist ar ON a.ArtistId = ar.ArtistId
WHERE ar.Name = 'Queen';

--- Total number of tracks in each genre
SELECT g.Name AS GenreName, COUNT(t.TrackId) AS NumberOfTracks
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
GROUP BY g.Name
ORDER BY NumberOfTracks DESC;

--- Top 10 customers by total spending
SELECT c.FirstName, c.LastName, SUM(i.Total) AS TotalSpending
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY TotalSpending DESC
LIMIT 10;

--- Invoice for a specific customer
SELECT i.InvoiceId, i.InvoiceDate, i.Total
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE c.FirstName = 'John';

--- Tracks that have a particular composer 
SELECT t.Name AS TrackName, t.Composer
FROM Track t
WHERE t.Composer LIKE '%AC/DC%';

--- the average track duration in milliseconds for each album
SELECT al.Title AS AlbumTitle, AVG(t.Milliseconds) AS AverageDurationMs
FROM Album al
JOIN Track t ON al.AlbumId = t.AlbumId
GROUP BY al.Title
ORDER BY AverageDurationMs DESC;

--- customers who have not made any purchases
SELECT c.FirstName, c.LastName, c.Email
FROM Customer c
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

--- the most expensive track in the database
SELECT Name AS TrackName, UnitPrice
FROM Track
ORDER BY UnitPrice DESC
LIMIT 1;