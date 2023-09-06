CREATE DATABASE prints;
USE prints;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  customer_add VARCHAR(100),
  customer_city VARCHAR(50),
  customer_state VARCHAR(50),
  customer_zip VARCHAR(10),
  customer_phone VARCHAR(20)
);
CREATE TABLE items (
item_id INT PRIMARY KEY,
title VARCHAR(100),
artist VARCHAR(100),
unit_price DECIMAL(10,2),
on_hand INT
);
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  ship_date DATE
);
CREATE TABLE orderline (
  order_id INT,
  item_id INT,
  order_qty INT
);
INSERT INTO customers (customer_id, customer_name, customer_add, customer_city, customer_state, customer_zip, customer_phone) VALUES
(1000, 'Cora Blanca', '1555 Seminole Ct.', 'Charlotte', 'NC', '28210', '704/552.1810'),
(1100, 'Yash Reed', '878 Madison Ave.', 'Greensboro', 'NC', '27407', '336/316-5434'),
(1200, 'John Mills', '4200 Olive Ave.', 'Columbia', 'SC', '29206', '803/432.6225'),
(1300, 'David Cox', '608 Old Post Rd.', 'Decatur', 'GA', '30030', '404/243.7379'),
(1400, 'Tina Evans', '235 Easton Ave.', 'Jacksonville', 'FL', '32221', '904/992-7234'),
(1500, 'Will Allen', '2508 W. Shaw Rd.', 'Raleigh', 'NC', '27542', '919/809.2545'),
(1600, 'James Boyd', '200 Pembury Ln.', 'Columbia', 'SC', '29206', '803/432-7600'),
(1700, 'Will Parsons', '4990 S. Pine St.', 'Raleigh', 'NC', '27545', '919/355/0034'),
(1800, 'Walter Kelly', '1200 Little St.', 'Columbia', 'SC', '29206', '803/432-1987'),
(1900, 'Ann Damian', '7822 N. Ridge Rd.', 'Jacksonville', 'FL', '32216', '904/725-4672'),
(2000, 'Grace Hull', '4090Caldweld St.', 'Charlotte', 'NC', '28205', '704/365.7655'),
(2100, 'Jane Brown', '3320 W. Main St.', 'Charlotte', 'NC', '28210', '704/372/9000'),
(2200, 'Betty Draper', '1600 Sardis Rd.', 'Sarasota', 'FL', '32441', '918/941-9121');
INSERT INTO items (item_id, title, artist, unit_price, on_hand) VALUES
(100, 'Under the Sun', 'Donald Arley', 46.80, 340),
(200, 'Dark Lady', 'Keith Morris', 120.99, 250),
(300, 'Happy Days', 'Andrea Reid', 78.00, 210),
(350, 'Top of the Mountain', 'Janice Jones', 110.00, 290),
(400, 'Streets from Old', 'Sharon Brune', 123.00, 320),
(450, 'The Hunt', 'Walter Alford', 39.99, 390),
(600, 'Rainbow Row', 'Judy Ford', 46.00, 350),
(700, 'Skies Above', 'Alexander Wilson', 98.00, 275),
(800, 'The Seas and Moon', 'Susan Beeler', 67.81, 235),
(850, 'Greek Isles', 'Benjamin Caudle', 76.00, 300);
INSERT INTO orders (order_id, customer_id, order_date, ship_date) VALUES
(1, 1200, '2013-10-23', '2013-10-28'),
(2, 1500, '2013-10-30', '2013-11-03'),
(3, 1500, '2013-11-09', '2013-11-14'),
(4, 2100, '2013-11-15', '2013-11-20'),
(5, 1600, '2013-11-15', '2013-11-20'),
(6, 1900, '2013-12-15', '2013-12-19'),
(7, 2200, '2013-12-18', '2013-12-22'),
(8, 1600, '2013-12-20', '2013-12-22'),
(9, 1000, '2014-01-18', '2014-01-23'),
(10, 2200, '2014-01-31', '2014-02-04'),
(11, 1500, '2014-02-01', '2014-02-06'),
(12, 1400, '2014-02-27', '2014-03-02'),
(13, 1100, '2014-03-10', '2014-03-15'),
(14, 1400, '2014-03-14', '2014-03-19');
INSERT INTO orderline (order_id, item_id, order_qty) VALUES
(1, 800, 2),
(1, 600, 1),
(2, 700, 3),
(2, 300, 2),
(3, 850, 1),
(4, 200, 4),
(4, 100, 1),
(4, 850, 1),
(5, 450, 1),
(6, 800, 2),
(7, 300, 2),
(7, 600, 2),
(8, 100, 1),
(9, 100, 3),
(10, 450, 6),
(10, 600, 8),
(10, 200, 4),
(11, 700, 2),
(12, 300, 3),
(12, 700, 4),
(13, 200, 2),
(13, 600, 10),
(13, 450, 4),
(14, 700, 8),
(14, 200, 6),
(14, 800, 4),
(14, 450, 2);
-- Pretty Prints II
-- list all customers along with their address, city, state and zip. 
SELECT customer_name, customer_add, customer_city, customer_state, customer_zip
FROM customers;
-- List all customers and their phone numbers that live in GA. 
SELECT customer_name, customer_phone
FROM customers
WHERE customer_state = 'GA';
-- List all customers along with their zip codes that live in NC or SC.
SELECT customer_name, customer_zip
FROM customers
WHERE customer_state IN ('NC', 'SC');
-- List all titles that have been sold along with the artist, order date and ship date. 
SELECT items.title, items.artist, orders.order_date, orders.ship_date
FROM items
JOIN orderline ON items.item_id = orderline.item_id
JOIN orders ON orderline.order_id = orders.order_id;
-- List all item id, title, artist, unit price, and on hand in ascending order by price.
SELECT item_id, title, artist, unit_price, on_hand 
FROM items
ORDER BY unit_price ASC;
-- List all item id, title, artist, unit price, and on hand for all items with a unit price that is more than $100.00.
SELECT item_id, title, artist, unit_price, on_hand
FROM items
WHERE unit_price > 100.00;
-- List all item id, title, artist, unit price, and on hand for all items where there are more than 300 on hand.
SELECT item_id, title, artist, unit_price, on_hand
FROM items
WHERE on_hand > 300;
-- List all titles along with their unit price and retail price (retail price is unit price doubled).
SELECT title, unit_price, unit_price * 2 AS retail_price
FROM items;
-- List all customers that have placed an order in 2014 along with their phone numbers.
SELECT customers.customer_name, customers.customer_phone
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
WHERE YEAR(orders.order_date) = 2014;
-- List all titles that have a unit price between $40.00 and $100.00.
SELECT title FROM items
WHERE unit_price BETWEEN 40.00 AND 100.00;
-- List all customers, title, artist, quantity ordered.
SELECT customers.customer_name, items.title, items.artist, orderline.order_qty
FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN orderline ON orders.order_id = orderline.order_id
JOIN items ON orderline.item_id = items.item_id;
-- List all customers along with the total revenue received from that customer (revenue would be total retail price).
SELECT c.customer_id, c.customer_name, SUM(ol.order_qty * i.unit_price) AS total_revenue
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN orderline ol ON o.order_id = ol.order_id
INNER JOIN items i ON ol.item_id = i.item_id
GROUP BY c.customer_id, c.customer_name;
-- List each state and the number of customers from that state.
SELECT customer_state, COUNT(*) AS num_customers
FROM customers
GROUP BY customer_state;
-- Pretty Prints III
-- Create a view named Under_100. It consists of the item_id, title, artist, unit_price and order_qty for every print 
-- with a unit_price under 100 dollars.
CREATE VIEW Under_100 AS
SELECT i.item_id, i.title, i.artist, i.unit_price, ol.order_qty
FROM items i
JOIN orderline ol ON i.item_id = ol.item_id
WHERE i.unit_price < 100;
-- Create a view named Allen. It consists of the customer_id, customer_name, customer_phone, title, and artist of each
-- print ordered.
CREATE VIEW Allen AS
SELECT c.customer_id, c.customer_name, c.customer_phone, i.title, i.artist
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderline ol ON o.order_id = ol.order_id
JOIN items i ON ol.item_id = i.item_id
WHERE c.customer_name = 'Will Allen';
-- Create a view named orders. It consists of the item_id, title, artist, unit_price and order_qty for every print 
-- ordered in the range of 2014-01-01 and 2014-02-28.
CREATE VIEW Orders1 AS
SELECT items.item_id, title, artist, unit_price, order_qty
FROM items
JOIN orderline ON items.item_id = orderline.item_id
JOIN orders ON orderline.order_id = orders.order_id
WHERE orders.order_date BETWEEN '2014-01-01' AND '2014-02-28';
-- Create a view named zip_27. It consists of the customer_name, customer_phone, title, artist and date_shipped of 
-- each print ordered by a customer whose zip code begins with 27. 
CREATE VIEW zip_27 AS
SELECT c.customer_name, c.customer_phone, i.title, i.artist, o.ship_date AS date_shipped
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
JOIN orderline AS ol ON o.order_id = ol.order_id
JOIN items AS i ON ol.item_id = i.item_id
WHERE c.customer_zip LIKE '27%'
ORDER BY c.customer_name;
-- Create the following indexes. Use the indicated index name.
-- a. Create an index named customer_id on the customer_id field in the customers table.
CREATE INDEX customer_id ON customers(customer_id);
-- b. Create an index named name on the customer_name field in the customers table.
CREATE INDEX name ON customers(customer_name);
-- c. Create an index named shipped on the customer_id and ship_date in the orders table.
CREATE INDEX shipped ON orders(customer_id, ship_date);
-- Drop the name index.
DROP INDEX name ON customers;
-- Specify the integrity constraint that the unit_price of any print must be more than $35.
ALTER TABLE items
ADD CONSTRAINT check_unit_price CHECK (unit_price > 35);
-- Create the following foreign keys within the prints database.
-- a. customer_id is a foreign key in the orders table.
ALTER TABLE orders
ADD CONSTRAINT fk_customer_id
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);
-- b. Item_id is a foreign key in the orderline table.
ALTER TABLE orderline
ADD CONSTRAINT fk_item_id
FOREIGN KEY (item_id)
REFERENCES items(item_id);
-- Add to the items table a new character field named type that is one character in length.
ALTER TABLE items ADD COLUMN type CHAR(1);
-- Change the type field in the items table to M for the print titled Skies Above.
UPDATE items
SET type = 'M'
WHERE title = 'Skies Above';
-- Change the length of the artist field in the items table to 30.
ALTER TABLE items
MODIFY COLUMN artist VARCHAR(30);
-- What command would you use to delete the orders table from the prints database? (Do not delete the orders table.)
-- DROP TABLE orders;
-- Jessica Schatz --


