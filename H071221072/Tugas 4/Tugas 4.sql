-- No 1
SELECT c.customerName AS 'Nama Customer', c.country AS Negara, p.paymentdate AS tanggal
FROM customers AS c
JOIN payments AS p
USING (customerNumber)
WHERE p.paymentdate >= '2005-01-01'
ORDER BY p.paymentdate ASC;

-- No 2
SELECT DISTINCT c.customerName AS 'Nama Customer', p.productName, pl.textDescription
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
JOIN productlines AS pl
USING (productline)
WHERE p.productName = "The Titanic";

-- No 3
ALTER TABLE products
ADD STATUS VARCHAR(20);

UPDATE products AS p
JOIN orderdetails AS od 
USING (productCode)
SET p.STATUS = 'best selling'
WHERE p.productCode = 'S10_1678';

SELECT p.productCode, p.productName, od.quantityOrdered, p.`STATUS`
FROM products AS p, orderdetails AS od
ORDER BY od.quantityOrdered DESC;

-- No 4
SELECT * FROM orders
JOIN customers AS c
USING (customerNumber)
WHERE `status` = 'cancelled';
SELECT * FROM orderdetails;

ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
ALTER TABLE orders ADD FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE CASCADE;
ALTER TABLE orderdetails DROP CONSTRAINT orderdetails_ibfk_1;
ALTER TABLE orderdetails ADD FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE CASCADE;
ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1;
ALTER TABLE payments ADD FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE;

SHOW CREATE TABLE payments

DELETE customers FROM  customers
JOIN orders AS o
USING (customerNumber)
WHERE o.status = 'cancelled';

-- No 5
SELECT c.customername, c.city, p.productname
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (ordernumber)
JOIN products AS p
USING (productcode)
WHERE c.country = "france";

SELECT p.productName, p.productName, p.MSRP*80/100 AS "80% msrp", od.priceeach
FROM products AS p
JOIN orderdetails AS od
USING (productCode)
join orders AS o
USING (orderNumber)
WHERE od.priceeach <= (p.MSRP * 80/100);
 
 