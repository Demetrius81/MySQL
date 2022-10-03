
--Задача: вывести последовательность символов A-Z, используя CTE с рекурсией A - 65, Z - 90

WITH RECURSIVE exp AS
(
    SELECT ASCII('A') AS sym 
    UNION ALL
    SELECT sym + 1
    FROM exp
    WHERE sym < ASCII('Z')
)
SELECT CHAR(sym) FROM exp;

--Собрать дэшборд, 
--1. в котором содержится информация о максимальной задолженности в каждом банке, 
--2. а также средний размер процентной ставки в каждом банке в зависимости от сегмента 
--3. и количество договоров всего всем банкам

CREATE TABLE offers (
    id_client INT,
    id_dog INT PRIMARY KEY,
    osz INT,
    procent_rate INT,
    rating INT,
    segment VARCHAR(10)
);

ALTER TABLE offers ADD COLUMN tb VARCHAR(5);

INSERT INTO offers VALUES
(1, 111, 100, 6, 10, 'SREDN', 'A'),
(1, 222, 150, 6, 10, 'SREDN', 'A'),
(2, 333, 50, 9, 15, 'MMB', 'A'),
(1, 444, 200, 7, 10, 'SREDN', 'B'),
(3, 555, 1000, 5, 16, 'CIB', 'B'),
(4, 666, 500, 10, 20, 'CIB', 'B'),
(4, 777, 10, 12, 17, 'MMB', 'B'),
(5, 888, 20, 11, 21, 'MMB', 'C'),
(5, 999, 200, 9, 13, 'SREDN', 'C');

--Собрать дэшборд, 
--1. в котором содержится информация о максимальной задолженности в каждом банке, 
--2. а также средний размер процентной ставки в каждом банке в зависимости от сегмента 
--3. и количество договоров всего всем банкам

SELECT
    *,
    MAX(osz)
OVER(
    PARTITION BY tb    
) AS `Максимальная задолженность`,
    AVG(procent_rate)
OVER(
    PARTITION BY tb, segment
) AS `Средний процент`,
    COUNT(id_dog)
OVER()
 AS `Количество договоров`
FROM offers;
