--Задача 1
--Таблица cars

CREATE TABLE cars (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    cost INT NOT NULL
)

INSERT INTO cars(name, cost) VALUES
('Audi', 52624),
('Mersedes', 57127),
('Skoda', 9000),
('Volvo', 29000),
('Bentley', 350000),
('Citroen', 21000),
('Hummer', 41400),
('VolksWagen', 21600);

--1.	Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE VIEW cheap_cars AS
SELECT * FROM cars WHERE cost < 25000;

SELECT * FROM cheap_cars;

--2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW cheap_cars AS
SELECT * FROM cars WHERE cost < 30000;

SELECT * FROM cheap_cars;

--3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE VIEW skoda_audi AS
SELECT * FROM cars WHERE name IN ('Skoda', 'Audi');

SELECT * FROM skoda_audi;

--Задача 2
--Таблица Analysis

CREATE TABLE Analysis
(
    an_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    an_name VARCHAR(255) NOT NULL,
    an_cost DECIMAL(10,2) NOT NULL,
    an_price DECIMAL(10,2) NOT NULL,
    an_group INT NOT NULL,
    FOREIGN KEY (an_group) REFERENCES Groups (gr_id) ON DELETE CASCADE ON UPDATE CASCADE,
);

--Таблица Groups

CREATE TABLE `Groups`
(
    gr_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    gr_name VARCHAR(50) NOT NULL,    
    gr_temp INT NOT NULL
);

INSERT INTO `Groups` (gr_name, gr_temp) VALUES
('Глубокой заморозки', -70),
('Замороженные', -1),
('Нормальной температуры', 18),
('Теплые', 37),
('***HOT***', 100500);

SELECT * FROM `Groups`;

DROP TABLE `Groups`;

--Таблица Orders

CREATE TABLE Orders
(
    ord_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ord_datetime DATETIME NOT NULL,    
    ord_an INT NOT NULL,
    FOREIGN KEY (ord_an) REFERENCES Analysis (an_id) ON DELETE CASCADE ON UPDATE CASCADE
);

--Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

-- Задача 3
--Таблица train_schedule



-- Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, 
-- мы вычитаем время станций для пар смежных станций. 
-- Мы можем вычислить это значение без использования оконной функции SQL, но это может быть очень сложно. 
-- Проще это сделать с помощью оконной функции LEAD . 
-- Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
-- В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
