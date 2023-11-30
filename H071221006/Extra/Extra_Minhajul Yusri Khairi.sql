use sakila;

-- Minhajul Yusri Khairi

select * from film;
select * from category;
select * from customer;

# Nomor 1
select count(film.film_id) as total, category.name as 'Genre'
from film
join inventory using(film_id)
join rental using(inventory_id)
join film_category using(film_id)
join category using(category_id)
join customer using(customer_id)
join address using(address_id)
join city using(city_id)
join country using(country_id)
where film.film_id not in (select film.film_id 
				 from film
                 join inventory using(film_id)
                 join rental using(inventory_id)
                 join customer using(customer_id)
                 join address using(address_id)
                 join city using(city_id)
                 join country using(country_id)
                 where country.country = 'Indonesia') 
group by category.name;


# Nomor 2
select actor_id, concat(actor.first_name, ' ', actor.last_name) as nama_aktor, count(film_id) as total_movies
from film
join film_actor using(film_id)
join actor using(actor_id)
group by actor_id
having count(film_id) > 
			(select avg(m) from 
											(select count(film_id) as m from film
											 join film_actor using(film_id)
											 join actor using(actor_id)
											 group by actor_id) as p)
order by count(film_id) desc;


# Nomor 3
select customer_id, concat(customer.first_name, ' ', customer.last_name) as nama_pelanggan, film.title as film_title, rental.rental_date, rental.return_date, inventory_id
from customer 
join rental using(customer_id)
join inventory using(inventory_id)
join film using(film_id)
join film_category using(film_id)
join category using(category_id)
where inventory_id in (select rental.inventory_id from rental where month(rental_date) = 2) and 
datediff(return_date, rental_date) > 7 and (category.name = 'Comedy' or category.name = 'Action');


-- =====================================================================================


(select customer_id, concat(customer.first_name, ' ', customer.last_name) as nama_pelanggan, film.title as film_title, rental.rental_date, rental.return_date, inventory_id
from customer 
join rental using(customer_id)
join inventory using(inventory_id)
join film using(film_id)
join film_category using(film_id)
join category using(category_id)
where inventory_id in (select rental.inventory_id from rental where month(rental_date) = 2) and 
datediff(return_date, rental_date) > 7 and category.name = 'Comedy')

union

(select customer_id, concat(customer.first_name, ' ', customer.last_name) as nama_pelanggan, film.title as film_title, rental.rental_date, rental.return_date, inventory_id
from customer 
join rental using(customer_id)
join inventory using(inventory_id)
join film using(film_id)
join film_category using(film_id)
join category using(category_id)
where inventory_id in (select rental.inventory_id from rental where month(rental_date) = 2) and 
datediff(return_date, rental_date) > 7 and category.name = 'Action');
