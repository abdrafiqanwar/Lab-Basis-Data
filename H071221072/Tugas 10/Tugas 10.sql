USE sakila;

-- No 1
SELECT f.title AS 'Judul', f.release_year AS 'Tahun Rilis', f.rental_duration AS 'Durasi Rental', f.rating 
FROM film f
WHERE title LIKE 'm%' AND f.rating = 'PG-13' AND f.release_year > 2000 < 2007

-- No 2
SELECT f.title AS judul_film, f.rating, COUNT(r.rental_id) AS jumlah_peminjaman, c.customer_id, CONCAT(c.first_name, ' ',c.last_name) AS nama_pelanggan
FROM film AS f
JOIN inventory AS i
ON f.film_id = i.film_id
JOIN rental AS r 
ON i.inventory_id = r.inventory_id
JOIN customer AS c 
ON r.customer_id = c.customer_id
where length(concat(c.first_name, ' ',c.last_name)) LIKE '13'
GROUP BY f.title, c.customer_id
ORDER BY f.rating DESC, jumlah_peminjaman DESC;

-- No 3
(SELECT film.film_id, film.title AS judul_film, category.name AS genre_film, film.rating, payment.payment_date,
    CASE
        WHEN payment.payment_date IS NOT NULL THEN 'sudah membayar'
        WHEN payment.payment_date IS NULL THEN 'belum membayar'
        ELSE 'tidak membayar'
    END AS keterangan
FROM film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
JOIN inventory USING(film_id)
JOIN rental USING(inventory_id)
JOIN payment ON rental.rental_id = payment.rental_id
WHERE (MONTH(rental.rental_date) % 2 = 0 AND DAY(rental.rental_date) % 2 = 1) AND LEFT(film.title, 1) NOT IN ('a', 'i', 'u', 'e', 'o')
GROUP BY judul_film
HAVING LENGTH(judul_film) > 13)

UNION 

(SELECT film.film_id, film.title AS judul_film, category.name AS genre_film, film.rating, payment.payment_date,
    CASE
        WHEN payment.payment_date IS NOT NULL THEN 'sudah membayar'
        WHEN payment.payment_date IS NULL THEN 'belum membayar'
        ELSE 'tidak membayar'
    END AS keterangan
FROM film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
JOIN inventory USING(film_id)
JOIN rental USING(inventory_id)
JOIN payment ON rental.rental_id = payment.rental_id
WHERE (MONTH(rental.rental_date) % 2 = 1 AND DAY(rental.rental_date) % 2 = 0) AND LEFT(film.title, 1) NOT IN ('a', 'i', 'u', 'e', 'o')
GROUP BY judul_film
HAVING LENGTH(judul_film) > 13)