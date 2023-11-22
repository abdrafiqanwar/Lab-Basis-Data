-- 1. qia 2. ajul 3. awa 
use sakila;
-- nomor 1 qia
select film_id, title, description, release_year
from film
where release_year = 2006;

-- nomor 2 ajul
select title `Judul`, rating, count(inventory.inventory_id), sum(amount)
from film
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
where title like 'A%' and rental_rate > (select avg(rental_rate) from film)
group by film_id;

-- nomor 3 nadjwa
select concat(actor.first_name, " ", actor.last_name) `Full Name`, count(film.film_id) Total_film, count(category.name) Total_drama,
	case
		when count(film_id) > (select avg(`totalfilm`) from (select count(film_id) `totalfilm` from film_actor group by actor_id) subb) and count(film.film_id) > 5 then "Actor Polific"
        when count(film_id) > (select avg(`totalfilm`) from (select count(film_id) `totalfilm` from film_actor group by actor_id) subb) and count(film.film_id) <= 5 then "Actor Penuh Genre"
		when count(film_id) < (select avg(`totalfilm`) from (select count(film_id) `totalfilm` from film_actor group by actor_id) subb) and count(film.film_id) <= 5 then "Actor Standar"
	end as `kategori`
from film
join film_actor using(film_id)
join actor using(actor_id)
join film_category using(film_id)
join category using(category_id)
where category.name = "Drama"
group by actor.actor_id;

        

