SELECT *
FROM actor a 
WHERE last_name LIKE 'M%' 
	AND last_update BETWEEN '2017-01-01' AND '2017-12-01'
ORDER BY  last_name asc,first_name asc
LIMIT 15;

SELECT *
FROM staff s 
WHERE s.active = TRUE AND email LIKE '%.com'
ORDER BY last_name ASC, first_name ASC
LIMIT 10;

SELECT *
FROM payment p 
WHERE amount BETWEEN 8.00 AND 10.00
ORDER BY payment_date ASC,amount DESC
LIMIT 40;