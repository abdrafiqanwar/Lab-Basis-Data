

SELECT 
	count(film.film_id) AS 'total',
	category.name AS 'genre'
FROM
	film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
JOIN inventory USING(film_id)
JOIN rental USING(inventory_id)
JOIN customer USING(customer_id)
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN country USING (country_id)
where film.film_id not in (select film.film_id 
				 from film
                 join inventory 	USING(film_id)
                 join rental USING(inventory_id)
                 join customer USING(customer_id)
                 join address USING(address_id)
                 join city USING(city_id)
                 join country USING(country_id)
                 where country.country = 'Indonesia') 
group by category.name;

#no2
SELECT actor.actor_id, CONCAT(actor.first_name, ' ', actor.last_name) AS 'nama aktor', COUNT(film_id) AS ' total film'
FROM 
	film
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
GROUP BY actor_id
HAVING COUNT(film_id) >
		 ( SELECT AVG(avgfilm) 
				FROM
					(SELECT COUNT(film_id) AS avgfilm 
					FROM film
					JOIN film_actor USING (film_id)
					JOIN actor USING(actor_id)
					GROUP BY actor_id) AS p)
ORDER BY COUNT(film_id) desc




USE sakila;


