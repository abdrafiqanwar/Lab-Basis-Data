use sakila;

-- no1 nadjwa
select customer_id, concat(first_name, ' ', last_name) as 'Full name', email, active as 'status' 
from customer
where active = false;

-- no2 alisa
select concat(c.first_name, ' ', c.last_name) as 'nama pelanggan',
max(payment.amount) as 'nominal pembayaran',
payment.payment_date as 'tanggal pembayaran'
from customer c
join payment using(customer_id)
where concat(c.first_name, ' ', c.last_name) like 'a%z'
group by customer_id;

-- no 3 alisa
select concat(c.first_name, ' ', c.last_name) as 'Nama pelanggan/aktor',
ci.city as 'kota asal',
case 
when count(rental_id) >= 30 then 'pelanggan lama'
else 'pelanggan baru'
end as 'status'
from rental r
join customer c using(customer_id)
join address a using(address_id)
join city ci using(city_id)
group by customer_id, c.first_name, c.last_name
union
select concat(a.first_name, ' ', a.last_name),
' - ',
case
when count(fa.film_id) >= (select avg(num_film) 
from (select actor_id, count(film_id) as num_film
from film_actor
group by actor_id)as a) then 'Aktor lama'
else 'Aktor baru'
end as 'status'
from actor a
join film_actor fa
using(actor_id)
group by actor_id, a.first_name, a.last_name
order by `Nama pelanggan/aktor` ;