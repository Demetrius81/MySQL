WITH ts AS
(
  SELECT 
    *,
    LEAD(stantion_time) OVER(PARTITION BY train_id) AS next_stantion_time
  FROM train_schedule
)
SELECT
    train_id AS `Номер поезда`,
    stantion AS `Станция`, 
    stantion_time AS `Время убытия`,    
    TIMEDIFF(next_stantion_time, stantion_time) AS `Время в пути`
FROM ts;


CREATE TEMPORARY TABLE ttt (

);

CREATE PROCEDURE test(IN nun INT, OUT rez INT)
BEGIN

END;

CREATE FUNCTION test2(num INT) RETURN INT
BEGIN

RETURN 
END;


--Создайте хранимую функцию hello(), которая будет возвращать приветствие,
--в зависимости от текущего времени суток.
--С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
--с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
--с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

DROP PROCEDURE hello;

DELIMITER $$
CREATE PROCEDURE hello (OUT response VARCHAR(50))
BEGIN
  DECLARE time_now VARCHAR(45);
  SET time_now = curtime();  
  CASE TRUE
    WHEN time_now >= '06:00' AND time_now < '12:00' THEN SET response = 'Доброе утро';
    WHEN time_now >= '12:00' AND time_now < '18:00' THEN SET response = 'Добрый день';
    WHEN time_now >= '18:00' AND time_now < '23:59' THEN SET response = 'Добрый вечер';
  ELSE SET response = 'Доброй ночи';
  END CASE;
END $$
DELIMITER ;


CALL hello(@response);

SELECT @response, curtime();

--Реализуйте процедуру, внутри которой с помощью цикла выведите числа от N до 1:
--N = 5=>5,4,3,2,1,

DROP PROCEDURE get_numbers;

DELIMITER $$
CREATE PROCEDURE get_numbers (IN num INT, OUT response VARCHAR(50))
BEGIN
  DECLARE i INT;
  SET response = "";
  SET i = num;  
  WHILE i > 0 DO
    SET response = CONCAT(response, ' ', i);
    SET i = i - 1;    
  END WHILE;
END $$
DELIMITER ;

CALL get_numbers(5, @str);

SELECT @str;

--Выведите первые N чисел Фибоначчи, начиная от 1

DROP FUNCTION get_numbers;

DELIMITER $$
CREATE FUNCTION get_numbers (num INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
  DECLARE i INT;
  DECLARE prev INT;
  DECLARE rez INT;
  DECLARE prev2 INT;
  DECLARE response VARCHAR(50);
  SET prev2 = 1;
  SET response = "";
  SET i = 1;
  SET prev = 1;
  set rez = 1;
  --IF (num < 0, NULL);
  --IF (num = 1, '1');
  SET response = CONCAT(prev, ' ', rez);   
  WHILE i < num - 1 DO    
    SET rez = prev + prev2;
    SET response = CONCAT(response, ' ', rez);
    SET prev2 = prev;
    SET prev = rez;
    SET i = i + 1;
  END WHILE;
  RETURN response;
END $$
DELIMITER ;

SELECT get_numbers(8);
