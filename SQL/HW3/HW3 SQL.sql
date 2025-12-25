-- Задача 1 Вывести названия фильмов жанра Action, которые сняты на английском языке. 
-- Отсортировать по году выпуска (от новых к старым) и вывести первые 20 строк.

SELECT f.title, f.release_year, c."name" 
FROM public.film f
JOIN public.language l ON f.language_id = l.language_id
JOIN public.film_category fc ON f.film_id = fc.film_id
JOIN public.category c ON fc.category_id = c.category_id
WHERE lower (c.name)= 'action' AND lower (l.name) = 'english'
ORDER BY f.release_year DESC
LIMIT 20;

-- Задача 2 Показать клиентов и города магазинов, к которым они относятся. 
--Вывести только тех клиентов, у которых город начинается на букву A. 
--Отсортировать по фамилии клиента, ограничить результат 25 строками.

SELECT c.first_name, c.last_name, ci.city
FROM public.customer c
JOIN public.address a ON c.address_id = a.address_id
JOIN public.city ci ON a.city_id =  ci.city_id 
WHERE lower (ci.city)  LIKE 'a%'
ORDER BY c.last_name ASC 
LIMIT 25;

--Задача 3 Показать список клиентов, фильмов и сумм платежей, где сумма оплаты 
--больше 5. Отсортировать по сумме (по убыванию), затем по дате платежа (по убыванию). 
--Ограничить результат 30 строками.
 
SELECT c.first_name, c.last_name, f.title, p.amount
FROM public.customer c
JOIN public.rental r ON c.customer_id = r.customer_id
JOIN public.payment p ON r.rental_id = p.rental_id
JOIN public.inventory i ON i.inventory_id = r.inventory_id
JOIN public.film f ON i.film_id = f.film_id 
WHERE p.amount > 5 
ORDER BY p.amount DESC, p.payment_date DESC 
LIMIT 30; 


--Задача 4 Вывести все фильмы, в которых снимался актёр или актриса с 
--фамилией MONROE. Отсортировать по названию фильма.

SELECT f.title, a.first_name, a.last_name
FROM public.film f 
JOIN public.film_actor fa ON f.film_id = fa.film_id
JOIN public.actor a ON fa.actor_id = a.actor_id
WHERE lower (a.last_name) = 'monroe'
ORDER BY f.title ASC

-- Задача 5 Показать список клиентов и фильмов, которые они арендовали
-- и ещё не вернули (return_date IS NULL). Отсортировать по дате аренды 
--(от новых к старым) и вывести 20 строк.

SELECT c.first_name, c.last_name,f.title
FROM customer c 
JOIN public.rental r ON c.customer_id = r.customer_id 
JOIN public.inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id 
WHERE r.return_date IS NULL 
ORDER BY r.rental_date DESC 
LIMIT 20;



