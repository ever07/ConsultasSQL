--EJERCICIO 1
select
    title,
    replacement_cost
from
    film
where
    replacement_cost < (rental_rate * 4);

--EJERCICIO 2
select
    title,
    release_year,
    rental_rate,
    length,
    rating,
    rental_duration,
    c.name as category
from
    film f
    join film_category fc on f.film_id = fc.film_id
    join category c on fc.category_id = c.category_id
where
    release_year = 2006
and rental_rate between 0.99 and 2.99
and replacement_cost < 19.99
and length between 90 and 150
and rating in ('G', 'PG', 'PG-13')
and rental_duration <= 5
and c.name in ('Comedy','Family', 'Children');

--EJERCICIO 3
select 
    to_char(rental_date, 'DD-MON-YYYY') as fecha,
    to_char(rental_date, 'HH24:MI') as hora,
    f.title,
    concat(c.first_name, ' ', c.last_name) as customer,
    c.email,
    a.phone,
    a.address,
    a.district,
    a.postal_code,
    ct.city,
    cnt.country,
    concat(st.first_name, ' ', st.last_name) as employee
from
    rental r
    join inventory i on r.inventory_id = i.inventory_id
    join film f on i.film_id = f.film_id
    join customer c on r.customer_id = c.customer_id
    join address a on c.address_id = a.address_id
    join city ct on a.city_id = ct.city_id
    join country cnt on ct.country_id = cnt.country_id
    join staff st on r.staff_id = st.staff_id
where to_char(rental_date, 'DD-MON-YYYY') = '31-JUL-2005'
order by hora asc;

--EJERCICIO 4
select 
    to_char(rental_date, 'DD-MON-YYYY') as fecha,
    to_char(rental_date, 'HH24:MI') as hora,
    f.title as movie,
    concat(c.first_name, ' ', c.last_name) as customer,
    a.phone as phone_customer,
    cnt.country as country_customer,
    concat(st.first_name, ' ', st.last_name) as employee,
    ad_st.phone as phone_employee,
    cnt_st.country as country_employee
from
    rental r
    join inventory i on r.inventory_id = i.inventory_id
    join film f on i.film_id = f.film_id
    join customer c on r.customer_id = c.customer_id
    join address a on c.address_id = a.address_id
    join city ct on a.city_id = ct.city_id
    join country cnt on ct.country_id = cnt.country_id
    join staff st on r.staff_id = st.staff_id
    join address ad_st on st.address_id = ad_st.address_id
    join city ct_st on ad_st.city_id = ct_st.city_id
    join country cnt_st on ct_st.country_id = cnt_st.country_id
where to_char(rental_date, 'DD-MON-YYYY') = '31-JUL-2005'
order by hora asc;

--EJERCICIO 5
select
    title,
    rental_rate,
    amount
from
    film f
    join inventory i on f.film_id = i.film_id
    join rental r on i.inventory_id = r.inventory_id
    join payment p on r.rental_id = p.rental_id
where to_char(r.rental_date, 'MM-YYYY') = '08-2005'
and (amount % rental_rate) != 0