#No.1
SELECT * FROM customers
SELECT * FROM payments

SELECT c.customername AS 'Nama Customer', c.country AS 'Negara', p.paymentdate AS 'Tanggal'
FROM customers AS c
JOIN payments AS p
USING (customerNumber)
WHERE p.paymentdate >= '2005-01-01'
ORDER BY p.paymentdate DESC;

#No.2
SELECT * FROM customers
SELECT * FROM products
SELECT * FROM orderdetails
SELECT * FROM productlines

SELECT DISTINCT c.customerName AS 'Nama Customer',p.productName,pl.textdescription
FROM customers AS c
JOIN orders AS o
USING (customernumber)
JOIN orderdetails AS od
USING (ordernumber)
JOIN products AS p
USING (productcode)
JOIN productlines AS pl
WHERE p.productName = 'The Titanic';

#No.3
ALTER TABLE products
ADD STATUS VARCHAR(20);

SELECT * FROM orderdetails ORDER BY quantityOrdered DESC;

UPDATE products AS p
SET STATUS = 'best selling'
WHERE productCode = 'S12_4675';

SELECT p.productCode, p.productName, od.quantityOrdered, p.status
FROM products AS p
JOIN orderdetails AS od
USING (productcode)
ORDER BY od.quantityOrdered DESC 

#No.4
SHOW CREATE TABLE orderdetails
SHOW CREATE TABLE payments
SHOW CREATE TABLE orders

ALTER TABLE orderdetails
DROP CONSTRAINT orderdetails_ibfk_1
ALTER TABLE payments
DROP CONSTRAINT payments_ibfk_1
ALTER TABLE orders
DROP CONSTRAINT orders_ibfk_1

DELETE customers FROM customers
JOIN orders 
USING (customernumber)
WHERE STATUS = 'cancelled';

SELECT c.customername, o.status 
FROM customers AS c
JOIN orders AS o
USING (customernumber);

#No.Tambahan
SELECT * FROM customers
ORDER BY contactlastname;
SELECT * FROM employees
ORDER BY lastname;
SELECT * FROM payments;

SELECT c.customername, p.amount
FROM customers AS c
JOIN payments AS p
ON c.customernumber = p.customerNumber
JOIN employees AS e
ON e.employeenumber = c.salesrepemployeenumber










