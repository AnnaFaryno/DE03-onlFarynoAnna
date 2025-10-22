-- Задача 1. Операции обновления с проверкой условий
--Создайте транзакцию для таблицы accounts, которая уменьшает баланс на 1000 для
--всех счетов, чей баланс превышает 5000. Если операция прошла успешно,
--зафиксируйте изменения. В случае ошибки откатите транзакцию.


CREATE TABLE IF NOT EXISTS accounts (
	account_id SERIAL PRIMARY KEY,         
    account_owner VARCHAR NOT NULL,  
    balance NUMERIC NOT NULL       
 );
 
INSERT INTO accounts (account_owner, balance)
VALUES 
('Hanna Faryno', 10560.00),
('Mark Orlov', 11300.00),
('Nick Petrov', 1230.00),
('Valentin Smirnov', 9800.00),
('Helena Sidorova', 4300.00);

DO $$
BEGIN
    BEGIN
        UPDATE accounts
        SET balance = balance - 1000
        WHERE balance > 5000;

        COMMIT;
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
        RAISE NOTICE 'Ошибка при обновлении баланса. Транзакция отменена.';
    END;
END;
$$;



 -- Задача 2. Последовательные вставки с проверкой ошибок
--Напишите транзакцию для таблицы inventory, которая добавляет новый товар и
--сразу же обновляет количество на складе. Если хотя бы одна из операций завершится с
--ошибкой, отмените транзакцию.

CREATE TABLE inventory (
    product_id SERIAL PRIMARY KEY,           
    product_name VARCHAR NOT NULL,      
    quantity INT NOT NULL DEFAULT 0,      
    price NUMERIC                  
   );

DO $$
BEGIN
    BEGIN
      
        INSERT INTO inventory (product_name, quantity, price) -- вставим новый товар
        VALUES ('Laptop Apple', 5, 700);

      
        UPDATE inventory
        SET quantity = quantity + 5
        WHERE lower(product_name) = 'laptop apple';

        COMMIT;
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
        RAISE NOTICE 'Ошибка при добавлении или обновлении товара. Транзакция отменена.';
    END;
END;
$$;



-- Задача 3. Создание резервной копии и удаление данных
--Создайте транзакцию, которая сначала создает резервную копию таблицы users в
--users_backup, а затем удаляет все записи из users, чей статус равен 'inactive'.
--Если операция удаления не удалась, откатите транзакцию.

 CREATE TABLE users_backup AS
SELECT * FROM users WHERE 1=0;  -- создаёт структуру без данных

DO $$
BEGIN
    BEGIN
        -- Копируем всех пользователей в резервную таблицу
        INSERT INTO users_backup
        SELECT * FROM users;

        -- Удаляем пользователей со статусом 'inactive'
        DELETE FROM users
        WHERE status = 'inactive';

        COMMIT;
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
        RAISE NOTICE 'Ошибка при удалении данных. Транзакция отменена.';
    END;
END;
$$;





