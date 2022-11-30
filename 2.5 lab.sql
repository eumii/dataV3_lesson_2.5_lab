USE sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.

SELECT * 
FROM actor
WHERE first_name = 'Scarlett'
;

-- 2. How many films (movies) are available for rent and how many films have been rented?
SELECT return_date FROM rental;
SELECT inventory_id FROM rental;
SELECT * FROM rental
WHERE return_date IS NULL;
SELECT * FROM inventory;

SELECT
(SELECT  COUNT(*) 
FROM rental 
WHERE return_date IS NULL ) as "rented",
(SELECT COUNT(rental_date) 
FROM rental
WHERE return_date IS NOT NULL) as "Available"
;
 

-- we assume here that the null values are the values that are not imput for the return movies in the store / they could have been missing but only in the return date so i infer a non return object therfore a rented movie.


-- 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT max(length) AS "max_duration", min(length) AS "min_duration", title

FROM film
;

-- 4.  What's the average movie duration expressed in format (hours, minutes)?

select SEC_TO_TIME(round(avg(length*60),0)) AS "average" 
from film
;

-- 5.  How many distinct (different) actors' last names are there?

SELECT COUNT(distinct(last_name))
FROM actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(return_date), MIN(rental_date)) AS "Operating days"
FROM rental
;
-- Assuming the company was "operating as a renting company ! 


-- 7. Show rental info with additional columns month and weekday. Get 20 results.

SELECT *,
MONTHNAME(rental_date) AS month, DAYNAME(rental_date) AS weekday
FROM rental
LIMIT 20
;
-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, 
monthname(rental_date) AS month,
DAYNAME(rental_date) AS weekday,
CASE
WHEN DAYNAME(rental_date)
IN ('Saturday', 'Sunday')
THEN ('Week-end')
ELSE 'Week-day'
END
AS day_type 
FROM rental
LIMIT 20
;

-- 10.  Get release years.

SELECT release_year
FROM film
;

-- SELECT * 
-- FROM film
-- WHERE release_year BETWEEN 2000 AND 2022
-- ORDER BY release_year ASC
-- ;

-- 11. Get all films with ARMAGEDDON in the title.
SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%'
;

-- 12. Get all films which title ends with APOLLO.

SELECT *
FROM film
WHERE title LIKE '%APOLLO'
;

-- 13. Get 10 the longest films.

SELECT *
FROM film
ORDER BY length desc
LIMIT 10
;

-- 14.How many films include Behind the Scenes content?

SELECT special_features, COUNT(special_features) AS "films w/ BTS" 
FROM film
ORDER BY special_features
;





