-- Задание 1. Создать базу данных library, внутри неё таблицу books с полями: book_id (целое число, первичный ключ, автоинкремент),
-- title (строка до 200 символов, не пустая), author (строка до 100 символов), published_year (целое число, год издания). 
-- После этого добавить в таблицу три книги.

CREATE DATABASE LIBRARY 
	WITH OWNER 'postgres'
	ENCODING = 'UTF8';
	
CREATE TABLE IF NOT EXISTS books (
	book_id SERIAL PRIMARY KEY,
	title VARCHAR (200) NOT NULL,
	author VARCHAR (100) NOT NULL,
	published_year INT NOT NULL);

INSERT INTO books (title, author, published_year)
VALUES 
      ('Чёрный обелиск', 'Эрих Мария Ремарк', 1956),
      ('Подземная железная дорога', 'Колсон Уайтхед', 2016),
      ('Братья Карамазовы', 'Фёдор Достоевский', 1880);
	
	

-- Задание 2.В таблице books нужно изменить структуру: добавить новый столбец genre типа VARCHAR(50),
-- переименовать столбец title в book_title, а затем удалить столбец published_year.

ALTER TABLE books
ADD COLUMN genre VARCHAR(50); -- обавить новый столбец genre типа VARCHAR(50)

ALTER TABLE books
RENAME COLUMN title TO book_title; -- переименовать столбец title в book_title

ALTER TABLE books
DROP COLUMN published_year; -- удалить столбец published_year



-- Задание 3.В таблице books удалить все записи, где автор равен 'Unknown'. Создать таблицу archived_books с теми же полями,
-- что и у books, перенести в неё все книги автора 'J.K. Rowling', после чего полностью удалить таблицу archived_books.

DELETE FROM books
WHERE author = 'Unknown'; 

CREATE TABLE IF NOT EXISTS archived_books (
	book_id SERIAL PRIMARY KEY,
	title VARCHAR (200) NOT NULL,
	author VARCHAR (100) NOT NULL,
	published_year INT NOT NULL);

INSERT INTO archived_books
SELECT *
FROM books
WHERE author = 'J.K. Rowling';

DROP TABLE archived_books;





