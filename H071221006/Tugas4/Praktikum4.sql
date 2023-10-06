USE classicmodels;
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;

-- Nomor1
SELECT customers.customerName AS 'Nama Customer', customers.country AS 'Negara', payments.paymentDate AS 'tanggal' FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
WHERE payments.paymentDate >= '2005-01-05'
ORDER BY payments.paymentDate ASC;


-- Nomor2
SELECT DISTINCT c.customerName AS 'Nama Customer', p.productName, p.productLine AS 'textDescription' FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON od.orderNumber = o.orderNumber
JOIN products p
ON p.productCode = od.productCode
WHERE p.productName = 'The Titanic';


-- Nomor3
ALTER TABLE products
ADD status VARCHAR(20)
SELECT p.productCode, p.productName, od.quantityOrdered, p.STATUS FROM products p
JOIN orderdetails od
ON p.productCode = od.productCode
ORDER BY od.quantityOrdered DESC;
UPDATE products p
SET p.STATUS = 'best selling'
WHERE p.productCode = 'S12_4675';

-- Nomor4
SHOW CREATE TABLE payments
ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1

SHOW CREATE TABLE orders
ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1

SHOW CREATE TABLE orderdetails
ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_1

DELETE customers, orders FROM customers JOIN orders ON customers.customerNumber = orders.customerNumber WHERE orders.STATUS = 'cancelled'; 



-- Nomor5
SELECT c.customerName, c.city, p.productName FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON od.orderNumber = o.orderNumber
JOIN products p
ON p.productCode = od.productCode
WHERE c.country = 'France';


