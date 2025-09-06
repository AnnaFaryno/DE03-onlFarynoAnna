CREATE TABLE IF NOT EXISTS movies (
	movie_id serial PRIMARY KEY,
	title text,
	genre text,
	release_year int,
	duration int
);

CREATE TABLE IF NOT EXISTS tickets (
	ticket_id int PRIMARY KEY,
	movie_id int,
	customer_name text,
	seat_number int,
	price float,
	FOREIGN KEY (movie_id) REFERENCES movies (movie_id)
);

INSERT INTO movies (title,genre, release_year, duration)
VALUES 
	('Партенопа', 'драма','2024','137'),
	('Гордость и предубеждение', 'драма','2005','169'),
	('1+1', 'комедия','2011','112'),
	('Константин', 'ужасы','2005','121'),
	('Варкрафт', 'фэнтези','2016','163')
	
INSERT INTO tickets (ticket_id, movie_id, customer_name,seat_number,price)
VALUES 
	('1','1', 'Василий Коляденков','3','10'),
	('2','1', 'Анастасия Саблина','4','10'),
	('3','2', 'Ольга Хиневич','24','15'),
	('4','2', 'Анна Фарино','6','15'),
	('5','3', 'Сергей Агеев','35','10'),
	('6','4', 'Есения Гриб','36','10'),
	('7','4', 'Андрей Гриб','38','10'),
	('8','5', 'Анна Бессонова','11','20'),
	('9','5', 'Светлана Барретт','12','20')
	
SELECT *
FROM movies m 
WHERE genre = 'драма'
	

SELECT *
FROM movies m 
WHERE release_year > 2011

SELECT *
FROM tickets t 
WHERE price > 10

SELECT *
FROM movies
WHERE title LIKE '% и %'


	