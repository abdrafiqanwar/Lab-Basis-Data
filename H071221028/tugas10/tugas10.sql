##1 ori
select *
from 
	city
where
	city like 'a%a' and country_id = 15
order by 
	city_id;
    
    
#2 ori
select
	concat(actor.first_name,' ', actor.last_name) nama_actor,
    count(film_actor.actor_id) jumlah_film
from film
join film_actor using (film_id)
join actor using (actor_id)
where film_actor.film_id >15
group by nama_actor
limit 5;

#3 ajul
(SELECT
    a.nama_film,
    a.tahun_rilis,
    a.rating,
    a.replacement_cost AS 'biaya ganti',
    CASE
        WHEN  a.replacement_cost> a.avg_replacement_cost then 'di atas rata rata'
    else 'dibawah rata rata'
end as 'keterangan'
from
(select
title as nama_film,
release_year as tahun_rilis,
rating,
replacement_cost,
avg(replacement_cost) over() as avg_replacement_cost
from 
	film
where
release_year = 2006
order by replacement_cost desc
limit 2) as a)
union
(SELECT
    a.nama_film,
    a.tahun_rilis,
    a.rating,
    a.replacement_cost AS 'biaya ganti',
    CASE
        WHEN  a.replacement_cost> a.avg_replacement_cost then 'di atas rata rata'
    else 'dibawah rata rata'
end as 'keterangan'
from
(select
title as nama_film,
release_year as tahun_rilis,
rating,
replacement_cost,
avg(replacement_cost) over() as avg_replacement_cost
from 
	film
where
release_year = 2006
order by replacement_cost asc
limit 2) as a)


