1- who is the senior most employee based on job title?

SELECT * FROM employee 
ORDER BY levels DESC
LIMIT 1;

2- Which country have the most invoices?

SELECT COUNT(invoice_id), billing_country FROM invoice
GROUP BY billing_country
ORDER BY COUNT(invoice_id) DESC
LIMIT 1;

3- What are top 3 values of total invoice?

SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3;

4- Which city has the best customers? We would like to throw a promotional 
music festival in the city we made most money. write query that returns one city
that has the highest sum of invoice totals. Return both the city name & sum of all
invoice totals.

SELECT billing_city, SUM(total) AS total_sum FROM invoice
GROUP BY billing_city
ORDER BY total_sum DESC
LIMIT 1;

5- Who is the best customer? The customer who has spent the most money will be 
declared the best customer. write query that returns the person who has spent the 
most money?

SELECT customer.customer_id, customer.first_name, customer.last_name,
sum(invoice.total) AS total FROM customer
JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1;