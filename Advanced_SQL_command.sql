SELECT NOW();
SHOW TIMEZONE;
SELECT TIMEOFDAY();
SELECT CURRENT_TIME;
SELECT EXTRACT(QUARTER FROM payment_date) AS myyear
FROM payment;
SELECT AGE(payment_date)
FROM payment;
SELECT TO_CHAR(payment_date, 'MM/dd/YYYY')
FROM payment;

/*During which months aid payments occur?
Format your answer to return back the full month name*/
SELECT 
DISTINCT (TO_CHAR(payment_date, 'MONTH'))
FROM payment;

/* How many payments occurred on a Monday*/
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;

/*Math Functions*/
SELECT ROUND(rental_rate/replacement_cost,4) * 100 FROM film;

/*String Functions*/
SELECT upper(first_name) || ' ' || upper(last_name) AS full_name
FROM customer;

/*Create Email*/
SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com'
AS custom_email
FROM customer;

/*SubQuery*/
/*The EXISTS operator is used to test for existence of rows in a subquery. 
Typically a subquery is passed in the EXIST() function to check if any rows a returned with the sebquery*/

SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);


SELECT film_id, title 
FROM film
WHERE film_id IN 
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY title;

/*at least one payment larger than 13*/
SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS 
(SELECT * FROM payment as p 
WHERE p.customer_id = c.customer_id
AND amount > 11);

/*self join*/
SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film as f2
ON f1.film_id != f2.film_id
AND f1.length = f2.length