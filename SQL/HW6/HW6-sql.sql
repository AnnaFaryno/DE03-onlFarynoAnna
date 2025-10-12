-- Задача 1. Повысить цену аренды всех фильмов категории Comedy на 10 процентов,
-- используя обновление с подзапросом к таблицам film_category и category.

UPDATE film f 
SET rental_rate = f.rental_rate * 1.10
WHERE f.film_id IN (
		SELECT fc.film_id
		FROM public.film_category fc
		JOIN public.category c ON fc.category_id = c.category_id
		WHERE c."name" = 'Comedy')



-- Задача 2. Удалить всех клиентов, которые находятся в статусе active = 0 и при этом не имеют ни одной записи в таблице rental.


DELETE FROM public.customer
WHERE active = 0
  AND customer_id NOT IN (             -- исключаем тех, кто хоть раз арендовал фильм
    SELECT DISTINCT customer_id
    FROM public.rental
);




-- Задача 3. Добавить новую запись в таблицу rental для любого фильма категории Action, при этом арендатором должен быть клиент 
-- с наибольшим количеством аренд в истории, используя вставку с подзапросом.
 

INSERT INTO public.rental (rental_date, inventory_id, customer_id, return_date, staff_id)
VALUES (
    current_date,
       (
        SELECT i.inventory_id
        FROM public.inventory i
        JOIN public.film f ON i.film_id = f.film_id
        JOIN public.film_category fc ON f.film_id = fc.film_id
        JOIN public.category c ON fc.category_id = c.category_id
        WHERE c.name = 'Action'
        LIMIT 1),
       (
        SELECT customer_id
        FROM public.rental
        GROUP BY customer_id
        ORDER BY COUNT(*) DESC
        LIMIT 1),
    DATE '2025-10-13', 1)
