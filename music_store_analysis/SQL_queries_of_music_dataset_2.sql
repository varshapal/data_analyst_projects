---Medium Level Questions

/*1- Write query to return the email, first name, last name and genre of all rock music 
listeners. Return your list ordered alphabetically by email starting with A. */

SELECT DISTINCT email, first_name, last_name
FROM customer 
JOIN invoice
ON customer.customer_id = invoice.customer_id
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
JOIN track
ON invoice_line.track_id = track.track_id
JOIN genre
ON track.genre_id = track.genre_id
WHERE genre.name = 'Rock'
ORDER BY customer.email;


/* 2- Let's invite the artist who have written the most rock music in our dataset. 
write a query that returns the Artist name and total track count of the top 10 rock 
bands.*/

SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM artist
JOIN album ON artist.artist_id = album.artist_id
JOIN track ON album.album_id = track.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;


/* Return all the track names that have a song length longer than the average 
song length. Return the name and milliseconds for each track order by the song 
length with the longest songs listed first. */

SELECT name, milliseconds FROM track
WHERE milliseconds > (
	SELECT AVG(milliseconds) AS avg_song_length FROM track
	)
ORDER BY milliseconds DESC;







	
