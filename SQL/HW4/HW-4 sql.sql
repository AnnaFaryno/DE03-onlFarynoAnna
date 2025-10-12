 -- Задача 1. Выведите сводку по семейным фильмам (жанр Family), выпущенным начиная с 2007 года. Для каждого года выпуска 
 -- определите количество фильмов, среднюю, минимальную и максимальную продолжительность. Результат отсортируйте по 
 -- году выпуска в порядке убывания.
 
SELECT f.release_year,
	COUNT(*) AS film_count,
	AVG(f.length) AS avg_length,
	MIN(f.length) AS min_length,
	MAX(f.length) AS max_length
FROM film f
INNER JOIN public.film_category fc ON f.film_id = fc.film_id
INNER JOIN public.category c ON fc.category_id = c.category_id
WHERE f.release_year >= 2007 AND UPPER(c.name) = 'FAMILY'
GROUP BY f.release_year
ORDER BY f.release_year DESC;
 
 
 -- Задача 2. Определите суммарную выручку и количество транзакций за 2007 год по каждой стране проживания клиентов.
 -- Отсортируйте результат по выручке в порядке убывания и выведите только первые 10 стран.
 
 SELECT co.country AS country, 
 	SUM(p.amount) AS sum_amount,
 	COUNT(p.payment_id) AS count_transaction
 FROM public.customer c
 INNER JOIN public.payment p ON c.customer_id = p.customer_id 
 INNER JOIN public.address a ON c.address_id = a.address_id 
 INNER JOIN public.city ci ON a.city_id =ci.city_id 
 INNER JOIN public.country co ON ci.country_id = co.country_id 
 WHERE payment_date BETWEEN '2007-01-01' AND '2007-12-31'
 GROUP BY co.country
 ORDER BY sum_amount DESC 
 LIMIT 10;
 
 
 -- Задача 3. Найдите пять категорий фильмов с наибольшим количеством фильмов. 
 -- Для каждой категории выведите количество фильмов и среднюю стоимость аренды. 
 -- Результат отсортируйте по числу фильмов в порядке убывания, а при равенстве — по названию категории.
 
 
 SELECT c."name" AS category_name,
 count(*) AS count_films,
 AVG(p.amount) AS avg_amount
 FROM film f 
 INNER JOIN public.film_category fc ON f.film_id = fc.film_id 
 INNER JOIN public.category c ON fc.category_id = c.category_id 
 INNER JOIN public.inventory i ON f.film_id = i.film_id 
 INNER JOIN public.rental r ON i.inventory_id = r.inventory_id 
 INNER JOIN public.payment p ON r.rental_id = p.rental_id
 GROUP BY c.name
 ORDER BY count_films DESC ,c.name
 LIMIT 5
 
 
 
 
 
 
 
 