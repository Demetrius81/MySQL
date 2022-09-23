/*
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
*/
use testdb;
create table phones (
  idPhones INT NOT NULL AUTO_INCREMENT,
  productName VARCHAR(45) NOT NULL,
  Manufacturer VARCHAR(45) NOT NULL,
  ProductCount INT NOT NULL,
  Price INT NOT NULL,
  PRIMARY KEY (idPhones),
  UNIQUE INDEX productName_UNIQUE (productName ASC) VISIBLE);
insert into phones (productName, Manufacturer, ProductCount, Price) values ('iPhone X', 'Apple', '3', '76000');
insert into phones (productName, Manufacturer, ProductCount, Price) values ('iPhone 8', 'Apple', '2', '51000');
insert into phones (productName, Manufacturer, ProductCount, Price) values ('Galaxy S9', 'Samsung', '2', '56000');
insert into phones (productName, Manufacturer, ProductCount, Price) values ('Galaxy S8', 'Samsung', '1', '41000');
insert into phones (productName, Manufacturer, ProductCount, Price) values ('P20 Pro', 'Huawei', '5', '36000');
/*
2. Выведите название, производителя и цену для товаров, количество которых превышает 2 (SQL - файл, скриншот, либо сам код)
*/
select productName, Manufacturer, ProductCount from phones where ProductCount > 2;
/*
3. Выведите весь ассортимент товаров марки “Samsung” ДЗ отправить в виде скриншотов, SQL-файла либо же SQL-коде Наполнение таблицы есть в прикрепленной презентации
*/
select * from phones where Manufacturer = 'Samsung';