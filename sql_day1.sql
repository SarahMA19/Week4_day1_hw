-- Hello World!
--This is a comment!

-- sql version of Hello World "command/control E" or right click run queary
SELECT *  -- what are we trying to grab?
FROM actor;  -- from where?

SELECT *
FROM address;

-- let's grab the first and last name

SELECT first_name, last_name
FROM actor;

-- WHERE clause
-- this is how wer filter out the results of our conditionals

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

-- Single quotes for Strings, literals vs Double for Database identifiers

-- WE can use LIKE instead of just = for strings
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- wildcards for use with like: _  and  % 
-- % is a true wildcard - any character AND number of characters
-- _ is one character wildcard

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'N%';

-- 3 underscores meas starts with J and 3 letters...
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J___';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J__%hy';

-- comparison operators:
--    = and like examples above
-- Greater/less >     <=      >=    all valid as usual
-- NOT equal  is  <>

SELECT * from address;

SELECT *
FROM address
WHERE district like 'Texas';

SELECT * FROM payment;

-- let's find customers who paid more than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2;

-- queary customers who paid less than 7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- we can use OR AND with the WHERE clause

SELECT customer_id, amount
FROM payment
WHERE amount < 7.99 AND amount > 0;

SELECT customer_id, amount
FROM payment
WHERE amount > 2 OR amount > 7.99;

-- we can also use BETWEEN, works the same as <=  >=

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99;

-- ORDER BY

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99
ORDER BY amount ASC; -- switch back and forth with ASC, DESC, DESC is default


-- NOT equal

SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount ASC;

SELECT customer_id, amount
FROM payment
WHERE amount > 10;

SELECT * FROM customer; -- checking out customer table

SELECT first_name, last_name
FROM customer
WHERE customer_id = 341;

-- Peter Menard is our big baller!

-- SQL aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

-- queary to show the sum of amounts greater than 5.99

SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- same but with averages!

SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- count
SELECT COUNT(amount)
FROM payment

SELECT * FROM payment;


-- what about individual amounts? Unique ... DISTINCT

SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

-- queary to display MIN amount greater than 6.99

SELECT MIN(amount)
FROM payment
WHERE amount > 6.99;

-- queary to display MAX amount greater than 6.99

SELECT MAX(amount) AS biggest_over_7
FROM payment
WHERE amount > 6.99;

-- GROUP BY
-- any column not in aggregate must be in group by used in conjuction
-- with the aggregates to modify behavior or aggregate groups rows


-- example of note from above!
SELECT amount, count(amount), sum(amount)
FROM payment
GROUP BY amount
ORDER BY sum(amount) DESC;


-- bring it back to more straight - forward examples
SELECT amount
FROM payment
WHERE amount = 6.99;

SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- let's look for customer id's with summed amounts for those ids
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- queary display cus_ids that show up more than 5 times

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;

-- general rules

SELECT customer_id,
    SUM(amount) --- what you want to see
FROM payment --- from where?
    --- these are the basic building blocks!
WHERE customer_id BETWEEN 70 AND 80 --- how?
GROUP BY customer_id --- using aggregates
HAVING SUM(amount) > 150 --- this is the how for aggregates or filter
ORDER BY customer_id
LIMIT                          --- always at/towards end
OFFSET 1;

SELECT * 
FROM payment
WHERE amount < -427.01
LIMIT 25
OFFSET 8

-- clauses we've talked about so far:
-- SELECT <columns> <aggregates>
-- FROM <table>
-- WHERE <conditional>
-- GROUP BY <columns>
-- HAVING <conditional>
-- ORDER BY <column>




