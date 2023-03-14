-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

----- ANSWER 2 -----

-- 2. How many payments were made between $3.99 and $5.99?

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

----- ANSWER NONE -----

-- 3. What film does the store have the most of? (search in inventory)

SELECT SUM(film_id), inventory_id
FROM inventory
GROUP BY inventory_id
HAVING SUM(film_id)  >  0
ORDER BY inventory_id DESC


------- ANSWER film_id #1000 has an inventory_id of 4581, I am thinking
----  that means there are 4581 copies of the movie? But there are (8) 1000 film_id's

-- 4. How many customers have the last name ‘William’?

SELECT last_name
FROM customer
WHERE last_name = 'William';

----- ANSWER NONE ------

-- 5. What store employee (get the id) sold the most rentals?

SELECT *
FROM sales_invoice


------- ANSWER salesperson_id #655 has 457658 invoice_number 
---- this one I am not sure is correct. Not sure if I got the right folder. 



-- 6. How many different district names are there?

SELECT COUNT(district)
FROM address;

------ ANSWER 603 -------


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT MAX(film_id)
FROM film_actor;

-------- ANSWER 1000 -------


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT store_id
FROM customer
WHERE last_name LIKE ' ___es'

-------   ANWSER NONE  -------


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)


SELECT customer_id
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY customer_id
HAVING SUM(amount) > 250;

-------   ANWSER NONE  -------

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT rating
FROM film
GROUP BY rating
ORDER BY rating;

SELECT COUNT(title), rating
FROM film
GROUP BY rating
HAVING COUNT(title) > 0;



------- ANSWER 5 rating categories & PG-13 has the most movies total --------


