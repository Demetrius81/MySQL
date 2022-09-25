/*
1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
*/

use TestDB;

CREATE TABLE sales (
    id INT NOT NULL AUTO_INCREMENT,
    order_date DATE NOT NULL,
    amount INT NOT NULL,
    PRIMARY KEY (id)
);

-- Data from https://generatedata.com/
INSERT INTO sales (order_date, amount)
VALUES
  ("2021-10-26",285),
  ("2022-11-15",150),
  ("2023-03-19",283),
  ("2022-08-12",310),
  ("2023-05-03",141),
  ("2023-08-28",149),
  ("2023-02-02",105),
  ("2022-09-27",315),
  ("2022-03-10",209),
  ("2023-09-11",176),
  ("2022-03-28",291),
  ("2022-09-28",212),
  ("2022-06-29",122),
  ("2022-06-04",154),
  ("2022-08-22",187),
  ("2023-04-17",87),
  ("2023-01-25",315),
  ("2023-07-24",156),
  ("2021-10-18",314),
  ("2022-08-03",95);

/*
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
*/

--Реализация с помощью оператора IF

SELECT id, order_date, amount,
IF (amount < 100,
    'Маленький заказ',
    IF (amount >= 100 AND amount < 300,
        'Средний заказ',
        'Большой заказ'))
AS order_size
FROM sales;

--Реализация с помощью оператора CASE

SELECT id, order_date, amount,
CASE TRUE
    WHEN amount < 100 THEN 'Маленький заказ'
    WHEN amount >= 100 AND amount <= 300 THEN 'Средний заказ'
    ELSE 'Большой заказ'
END AS order_size
FROM sales;

--Оператор CASE, работа с типом данных INT

SELECT id, order_date, amount,
--Ищем значение столбца id
CASE id
    --WHEN <Значение столбца id == 2> THEN <выполняем действие_1>
    WHEN 2 THEN 'Заказ № 2'
    --WHEN <Значение столбца id == 3> THEN <выполняем действие_2>
    WHEN 3 THEN 'Заказ № 3'
    --ELSE <выполняем действие_3>
    ELSE 'Другой заказ заказ'
END AS order_number
FROM sales;

--Оператор CASE, работа с условиями

SELECT id, order_date, amount,
--Ищем значение TRUE (Работаем с булевым типом данных)
CASE TRUE
    --WHEN <условие_1 == true> THEN <выполняем действие_1>
    WHEN id = 2 THEN 'Заказ № 2'
    --WHEN <условие_2 == true> THEN <выполняем действие_2>
    WHEN id = 3 THEN 'Заказ № 3'
    --ELSE <выполняем действие_3>
    ELSE 'Другой заказ заказ'
END AS order_number
FROM sales;

/*
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
*/

CREATE TABLE orders (
    orderid INT NOT NULL AUTO_INCREMENT,
    employeeid VARCHAR(5) NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    orderstatus VARCHAR(45) NOT NULL,
    PRIMARY KEY (orderid)
);

INSERT INTO orders (employeeid, amount, orderstatus)
VALUES
("e03",50.65,"OPEN"),
  ("e02",33.34,"OPEN"),
  ("e03",7.90,"CLOSED"),
  ("e03",58.30,"CLOSED"),
  ("e03",15.02,"CANCELLED"),
  ("e05",28.46,"CLOSED"),
  ("e04",23.70,"OPEN"),
  ("e02",84.01,"OPEN"),
  ("e06",29.08,"OPEN"),
  ("e07",23.53,"OPEN"),
  ("e03",58.08,"CLOSED"),
  ("e03",58.88,"OPEN"),
  ("e02",14.36,"CLOSED"),
  ("e06",93.59,"CLOSED"),
  ("e05",59.20,"CANCELLED"),
  ("e03",8.40,"CLOSED"),
  ("e04",94.67,"CLOSED"),
  ("e05",79.53,"CANCELLED"),
  ("e06",65.51,"CLOSED"),
  ("e03",83.78,"CLOSED");

  SELECT orderid, orderstatus,
CASE orderstatus
    WHEN "OPEN" THEN 'Order is in open state.'
    WHEN "CLOSED" THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS order_summary
FROM orders;

/*

4. Чем NULL отличается от 0?

0 - это значение числового типа данных (к примеру int или 0M это decimal), это число. Под это число
в памяти выделено место и есть ссылка на это место, которая может быть записана в какую либо переменную.

NULL - это пустота, ничего, ссылка в космос где-то между Юпитером и Сатурном :)
Это специальное значение, которое означает, что поле пустое. Оно может быть записано в ячейку таблицы.
NULL может иметь тип данных NULL и любой другой тип данных. NULL не равен ни логическому значению ни 
пустой строке. При сравнении NULL с каким либо другим значением мы получим NULL.

*/