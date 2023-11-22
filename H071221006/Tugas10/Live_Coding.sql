use sakila;
-- Minhajul Yusri Khairi

-- Nomor 1 Alisha
select actor_id, actor.first_name, actor.last_name 
from actor 
where actor.last_name like 'z%';


-- Nomor 2 Nadjwa
select customer_id as 'Customer ID', concat(customer.first_name, ' ', customer.last_name) as 'FullName', count(rental.rental_id) as 'Jumlah Rental', sum(amount) as 'Total Payment'
from customer
join rental using(customer_id)
join payment using(customer_id)
where customer.active = true
group by customer_id;


-- Nomor 3 Ori
select * from (
(select film.title as 'nama_film', 
case 
	when length = (select max(length) from film) then 'Film dengan durasi terlama'
    when length = (select max(length) from film) then 'Film dengan durasi terlama'
end as 'penghargaan'
from film)

union

(select film.title,
case 
	when category.name = 'action' and rental_rate = 
		(select max(rental_rate) from film) then 'Film action dengan rating terbaik'
	else null
end as 'penghargaan'
from film
join film_category using(film_id)
join category using(category_id))

union

(select concat(first_name, ' ', last_name) as 'nominasi',
	case
		when count(film_id) = (select max(film_count) from (select actor_id, count(film_id) as film_count
		from film_actor
		group by actor_id) as a) then 'aktor dengan film terbanyak'
		else null
	end as 'penghargaan'
from actor
join film_actor using(actor_id)
group by actor_id)

union

(select title as 'nominasi',
	case
		when COUNT(actor_id) = (select max(actor_count) 
			from (select film_id, COUNT(actor_id) as 'actor_count'
		from film_actor
		group by film_id) as a) then 'Film dengan aktor paling banyak'
		when count(actor_id) = (select min(actor_count) from (select film_id, count(actor_id) as actor_count
		from film_actor
		group by film_id) as a) then 'Flm dengan aktor paling sedikit'
	end as 'penghargaan'
from film 
join film_actor using(film_id)
group by film_id)
) as result
where 'penghargaan' is not null
order by 'penghargaan' desc;

