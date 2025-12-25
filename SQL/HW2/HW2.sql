 -- Задача 1. Выведите 15 актёров из таблицы actor, у которых фамилия начинается с буквы M, 
 -- а дата последнего обновления (last_update) попадает в 2017 год. Отсортируйте результат по фамилии (возр.),
 -- затем по имени (возр.).
 
SELECT *
FROM actor a 
WHERE last_name LIKE 'M%' 
	AND last_update BETWEEN '2017-01-01' AND '2017-12-01'
ORDER BY  last_name asc,first_name asc
LIMIT 15;

-- Задача 2.  Выведите сотрудников из таблицы staff, у которых active = 1 и адрес электронной почты 
--оканчивается на .com. Отсортируйте по фамилии (возр.), затем по имени (возр.). 
--Покажите только первые 10 строк.

SELECT *
FROM staff s 
WHERE s.active = TRUE AND email LIKE '%.com'
ORDER BY last_name ASC, first_name ASC
LIMIT 10;


-- Задача 3. Выведите список платежей, у которых сумма находится в диапазоне от 8.00 до 10.00 включительно. 
--Отсортируйте их по дате платежа (возрастание), а при совпадении даты — по сумме (убывание). 
--Покажите только первые 40 записей.

SELECT *
FROM payment p 
WHERE amount BETWEEN 8.00 AND 10.00
ORDER BY payment_date ASC,amount DESC
LIMIT 40;