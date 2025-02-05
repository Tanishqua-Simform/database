select first_name || ' ' || last_name as Full_name from customer order by last_name asc, first_name desc;

select distinct rental_rate from film order by rental_rate;

select last_name , first_name from customer where first_name like 'Ani%';

select 1 = 1 AND '0' as result;

select film_id from film where (film_id % 2) = 0 order by film_id;

select f1.first_name || ' ' || f1.last_name as Full_name, f2.first_name || ' ' || f2.last_name as Full_name from customer f1 Inner Join customer f2 on f1.customer_id > f2.customer_id where f1.first_name = f2.first_name;

