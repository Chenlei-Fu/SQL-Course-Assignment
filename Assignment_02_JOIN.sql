SELECT payment_id, payment.customer_id, first_name FROM payment
INNER JOIN customer
ON payment.customer_id = payment.customer_id;

/*left join: the order does matter!*/
SELECT film.film_id, title, inventory_id, store_id
FROM film
LEFT JOIN inventory 
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL;

/*JOIN Challenge Task*/
/*California sales tax laws have changed and we need to alert out customers to this through email
what are the emails of the customers who live in California*/
SELECT district, email
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE address.district = 'California';

/*A customer walks in and is a huge fan of the actor "Nick Wahlberg" and wants to know which movie he is in
Get a list of all the movies Nick Wahlberg has been in*/
SELECT title,first_name, last_name
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' AND last_name = 'Wahlberg'
