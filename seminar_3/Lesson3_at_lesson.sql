use TestDB;

CREATE TABLE staff (
    id INT NOT NULL AUTO_INCREMENT,
    employeeName VARCHAR(50) NOT NULL,
    employeeSurname VARCHAR(50) NOT NULL,
    employeeSpeciality VARCHAR(50) NOT NULL,
    seniority INT NOT NULL,
    salary INT NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO staff (employeeName, employeeSurname, employeeSpeciality, seniority, salary, age)
VALUES
("Вася", "Васькин", "начальник", 40, 1000000, 60),
("Петя", "Петькин", "начальник", 8, 70000, 30),
("Катя", "Каткина", "инженер", 2, 70000, 25),
("Саша", "Сашкин", "инженер", 12, 50000, 35),
("Иван", "Иванов", "рабочий", 40, 30000, 59),
("Петр", "Петров", "рабочий", 20, 25000, 40),
("Сидор", "Сидоров", "рабочий", 10, 20000, 35),
("Антон", "Антонов", "рабочий", 8, 19000, 28),
("Юра", "Юркин", "рабочий", 5, 15000, 25),
("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24),
("Люся", "Люськина", "уборщик", 10, 10000, 49);

SELECT * FROM staff
ORDER BY age;

SELECT * FROM staff
ORDER BY employeeName;

SELECT employeeName, employeeSurname, age FROM staff
ORDER BY employeeName DESC;

SELECT employeeName, age FROM staff
ORDER BY (employeeName AND age) DESC;

--1.	Выведите уникальные (неповторяющиеся) значения полей "name"

SELECT DISTINCT employeeName FROM staff;

--2.	Выведите первые две первые записи из таблицы

SELECT * FROM staff
LIMIT 2;

--3.	Пропустите  первые 4 строки ("id" = 1, "id" = 2,"id" = 3,"id" = 4) и извлеките следующие 3 строки ("id" = 5, "id" = 6, "id" = 7)

SELECT * FROM staff
LIMIT 4, 3;

--4*. 	Пропустите две последнии строки (где id=12, id=11) и извлекаются следующие за ними 3 строки (где id=10, id=9, id=8)

SELECT * FROM staff
ORDER BY id DESC
LIMIT 2, 3;

CREATE TABLE employee_tbl (
    id INT NOT NULL AUTO_INCREMENT,
    employeeName VARCHAR(50) NOT NULL,
    work_date DATE NOT NULL,    
    daily_typing_pages INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO employee_tbl (employeeName, work_date, daily_typing_pages)
VALUES
('John', '2007-01-24', 250),
('Ram', '2007-05-27', 220),
('Jack', '2007-05-06', 170),
('Jack', '2007-04-06', 100),
('Jill', '2007-04-06', 220),
('Zara', '2007-06-06', 300),
('Zara', '2007-02-06', 350);

--1.	Рассчитайте общее количество всех страниц dialy_typing_pages

SELECT SUM(daily_typing_pages) FROM employee_tbl AS daily_typing_pages_sum;

--2.	Выведите общее количество напечатанных страниц каждым человеком (с помощью предложения GROUP BY)  

SELECT employeeName, SUM(daily_typing_pages) AS pages
FROM employee_tbl 
GROUP BY employeeName;

--3.	Посчитайте количество записей в таблице

SELECT COUNT(*) FROM employee_tbl;

--4.	Выведите количество имен, которые являются уникальными 

SELECT COUNT(DISTINCT employeeName) FROM employee_tbl;

--5. 	Найдите среднее арифметическое по количеству ежедневных страниц для набора (daily_typing_pages)

SELECT AVG(daily_typing_pages) FROM employee_tbl;

SELECT work_date, AVG(daily_typing_pages) AS pages
FROM employee_tbl 
GROUP BY work_date;

CREATE TABLE workers (
    id INT NOT NULL AUTO_INCREMENT,
    employeeName VARCHAR(50) NOT NULL,
    age INT NOT NULL,    
    salary INT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO workers (employeeName, age, salary)
VALUES
('Дима', 23, 100),
('Петя', 23, 200),
('Вася', 23, 300),
('Коля', 24, 1000),
('Емельян', 25, 1050),
('Василиса', 25, 1230),
('Иван', 24, 2000),
('Емельян', 25, 1050),
('Василиса', 25, 1230);

--1. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Для каждой группы  найдите суммарную зарплату 

SELECT SUM(salary) FROM workers AS sum_salary
GROUP BY age;

--2. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите максимальную заработную плату внутри группы

SELECT MAX(salary) FROM workers AS sum_salary
GROUP BY age;

--3. Сгруппируйте поля по возрасту (будет 3 группы - 23 года, 24 года и 25 лет). Найдите минимальную заработную плату внутри группы

SELECT MIN(salary) FROM workers AS sum_salary
GROUP BY age;

--1.	Выведите  только те строки, в которых суммарная зарплата больше или равна 1000

SELECT age, SUM(salary) AS sum_salary FROM workers
GROUP BY age
HAVING sum_salary > 1000;

--2. 	Выведите только те группы, в которых количество строк меньше или равно двум

SELECT age, COUNT(*) AS count_sum FROM workers
GROUP BY age
HAVING count_sum <= 2;

--3.	Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “BETWEEN”

SELECT age, COUNT(*) AS count_sum FROM workers
GROUP BY age
HAVING count_sum BETWEEN 0 AND 2;

--4.*	Выведите только те группы, в которых количество строк меньше или равно двум. Для решения используйте оператор “IN”

SELECT age, COUNT(*) AS count_sum FROM workers
GROUP BY age
HAVING count_sum IN (0, 1, 2);