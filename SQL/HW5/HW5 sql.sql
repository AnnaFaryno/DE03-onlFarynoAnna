-- Задача 1. Найти все фильмы, продолжительность которых больше средней продолжительности всех фильмов в базе.
-- Вариант с подзапросом

SELECT f.title, f.length 
FROM public.film f
WHERE f.length > (
    SELECT AVG(f.length)
    FROM public.film f)
GROUP BY f.length , f.title 
ORDER BY f.length 



-- Вариант без подзапроса

WITH calk_avg_length_cte AS (
    SELECT AVG(length) AS avg_length
    FROM public.film
)
SELECT f.title, f.length
FROM public.film f
JOIN calk_avg_length_cte a ON f.length > a.avg_length
ORDER BY f.length;



-- Задача 2. Найти сотрудников (staff), которые работают в том же магазине, что и клиент с фамилией SMITH.
-- Вариант с подзапросом

SELECT s.first_name, s.last_name
FROM public.staff s
WHERE s.store_id IN (
    SELECT cu.store_id
    FROM public.customer cu
    WHERE cu.last_name = 'SMITH'
    );


-- Вариант без подзапроса

SELECT s.first_name, s.last_name
FROM public.staff s
INNER JOIN public.customer cu ON s.store_id = cu.store_id 
WHERE cu.last_name = 'SMITH'




-- Задача 3. Найти клиентов, которые заплатили больше, чем средняя сумма платежа по всей базе.
-- Вариант с подзапросом
SELECT cu.first_name, cu.last_name
FROM public.customer cu 
INNER JOIN public.payment p ON cu.customer_id = p.customer_id 
WHERE p.amount > (
				   SELECT avg(p.amount) 
	   			   FROM payment p 
);
 

-- Вариант без подзапроса

WITH avg_payment AS (
    SELECT AVG(amount) AS avg_amount
    FROM public.payment
)
SELECT cu.first_name, cu.last_name, p.amount
FROM public.customer cu
JOIN public.payment p ON cu.customer_id = p.customer_id
JOIN avg_payment a ON p.amount > a.avg_amount;

