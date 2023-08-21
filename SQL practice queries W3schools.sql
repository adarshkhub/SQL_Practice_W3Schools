-- SELECT statements

select * from sakila.actor
select * from sakila.film

select actor_id, first_name, last_name, last_update from sakila.actor

-- SELECT DISTINCT - shows only unique values

Select Count(Distinct first_name) from sakila.actor

Select Count(Distinct first_name, last_name) from sakila.actor
-- LIKE   IN
select * from sakila.actor where first_name like "Pen%"

-- AND OR NOT operators
select * from sakila.actor where first_name = 'penelope' and last_name like 'pink%'

select * from sakila.actor where first_name = 'penelope' and last_name like 'pink%' OR actor_id = 66

select * from sakila.actor where first_name = 'penelope' and last_name like 'pink%' 

select * from sakila.actor where actor_id NOT BETWEEN 1 and 75


-- ORDER BY
-- Default is ascending order
select * from sakila.actor ORDER BY first_name ASC


-- INSERT INTO

INSERT INTO sakila.actor (actor_id, first_name, last_name, last_update)
VALUES (201, 'BOBBY', 'DOBBARD', '2006-02-15 04:34:33');

-- 201, bobby dobbard 2006-02-15-04:34:33

-- NULL VALUES

select * from sakila.actor
where actor_id IS NULL;

select * from sakila.actor
where actor_id IS NOT NULL;

-- UPDATE
Update sakila.actor
SET first_name = 'Brad', last_name = 'Pitt'
Where actor_id = 201;

-- What happens if you try to update without using a key condition
Update sakila.actor
SET last_update = '2023-05-24 15:47:00'
Where last_update = '2006-02-15 04:34:33';

-- SET SQL_SAFE_UPDATES = 0;


DELETE FROM sakila.actor
Where actor_id = 201;


select * from sakila.actor
where last_name = 'guiness'
limit 1;

select MIN(last_name)
from sakila.actor

select MAX(last_name)
from sakila.actor

select*from sakila.actor 
Order By last_name DESC

select AVG(actor_id)
from sakila.actor

select * from sakila.actor
where first_name like '__'

select * from sakila.actor
where last_name like 'c___e'

select * from sakila.city
select * from sakila.film_actor

SELECT film_actor.film_id, actor.first_name, actor.last_name
FROM sakila.film_actor
INNER JOIN sakila.actor
ON actor.actor_id = film_actor.actor_id;

SELECT actor.actor_id, film_actor.film_id
FROM sakila.actor
INNER JOIN sakila.film_actor
ON actor.last_update = film_actor.last_update;

set sql_safe_updates = 0
set sql_safe_updates = 1

update sakila.actor
set last_update = '2006-02-15 05:05:03'
where actor_id = 63

SELECT film_actor.film_id, actor.first_name, actor.last_name
FROM sakila.film_actor
INNER JOIN sakila.actor
ON actor.actor_id = film_actor.actor_id;

-- Join actor name, film name together using a double join?

select * from sakila.film

-- JOINS
select 
actor.first_name
from
sakila.actor as a;

SELECT
  actor.first_name AS fname, film_actor.film_id AS fid
FROM sakila.actor, sakila.film_actor
  
  
-- INNER JOIN
select *
from actor a
inner join film_actor fa
on a.actor_id = fa.actor_id
  
  /*SELECT
  t1.column_name (AS) new_column_name,
  t2.column_name (AS) other_new_column_name,
  ...
FROM table1 (AS) t1
JOIN table2 (AS) t2
  ON t1.column_name = t2.column_name
*/

-- LEFT JOIN
select *
from actor a
left join film_actor fa 
on a.actor_id = fa.actor_id 
limit 10;

-- CROSS JOIN
select *
from film_actor fa
cross join actor a
on fa.actor_id = a.actor_id;

-- SELF JOINS
select *
from film_actor as a
inner join film_actor as b
on a.actor_id = b.film_id;

-- UNION
select actor_id, first_name, last_name from actor
union
select actor_id from film_actor;


select * from actor

-- GROUP BY

Select MAX(actor_id) from actor
Group By first_name

select * from actor

select count(actor_id), first_name from actor
group by first_name 
order by count(actor_id) DESC


-- EXISTS

SELECT first_name, last_name
FROM actor a
WHERE EXISTS (SELECT film_id FROM film_actor WHERE a.actor_id = film_actor.actor_id AND film_id = 166);

select * from film_actor

-- ANY
SELECT first_name, last_name
from actor
WHERE actor_id = any
(select actor_id from film_actor where film_id = 166)

SELECT ALL first_name
from actor
where TRUE;
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- INSERT INTO SELECT 

use sakila

insert into actor (film_id)
select film_id from film_actor
where film_actor.actor_id = 1;


INSERT INTO city
SELECT * FROM country

select * from actor

Alter table sakila.actor
add film_id smallint;

select * from actor where first_name is null

set sql_mode= ""

-- -- ----------------------------------------------------------------------------------------------------------------
-- CASE Statement
SELECT first_name 
Case
when first_name = 'PENELOPE' then 'good actor'
when first_name = 'MARK' then 'terrible actor'
else 'moderately good actor'
end as actor_rating
from first_name text

SELECT first_name,
CASE
    WHEN first_name = 'Penelope' THEN 'good actor'
    WHEN first_name = 'Mark' THEN 'terrible actor'
    ELSE 'moderately good actor'
END AS actor_rating
FROM actor;

use world

select COALESCE(null, 1919, 1975, null)


-- Select Into

CREATE TABLE Country_Capitall (
Capital Varchar (52),
Country Varchar (52),
Country_Code Varchar(52))

Insert Into Country_Capitall (Capital, Country, Country_Code)
select country.Capital, country.Name, country.Code
from country;

select * from Country_Capitall


