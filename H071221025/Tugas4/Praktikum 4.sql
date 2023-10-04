USE classicmodels;

SELECT*FROM customers;
SELECT*FROM payments;
SELECT*FROM products;

#NO1
SELECT
c.customerName AS "nama customer",
c.country AS "negara",
p.paymentDate AS "tanggal pembayaran"
FROM
customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
WHERE
p.paymentDate > '2004-12-31'
ORDER BY p.paymentDate ASC;
    
#NO2
SELECT DISTINCT 
	c.customerName AS 'Nama customer',
	p.productName,
	pl.textDescription
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products AS p
ON od.productCode = p.productCode
JOIN productlines AS pl
ON p.productLine = pl.productLine
WHERE p.productName = 'The Titanic';
   
#NO3
ALTER TABLE products
ADD STATUS VARCHAR(20);

SELECT * FROM orderdetails ORDER BY quantityOrdered DESC;

UPDATE products AS p
SET STATUS = 'best selling'
WHERE productCode = 'S12_4675';

SELECT 
	p.productCode,
	p.productName,
	od.quantityOrdered,
	p.status
FROM products AS p
JOIN orderdetails AS od
ON p.productCode = od.productCode
WHERE p.status = 'best selling'
ORDER BY od.quantityOrdered DESC 
LIMIT 1;


#NO4
ALTER TABLE orders
DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (customerNumber)
REFERENCES customers (customerNumber)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE payments
DROP FOREIGN KEY payments_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT payments_ibfk_1
FOREIGN KEY (customerNumber)
REFERENCES customers (customerNumber)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE orderdetails
DROP FOREIGN KEY orderdetails_ibfk_1;

ALTER TABLE orderdetails
ADD CONSTRAINT orderdetails_ibfk_1
FOREIGN KEY (orderNumber)
REFERENCES orders (orderNumber)
ON DELETE CASCADE
ON UPDATE CASCADE;


DELETE c
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.status = 'cancelled';

# Cek Data
SELECT * FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE o.status = 'cancelled'

# SOAL TAMBAHAN
SELECT * FROM employees;

SELECT c.salesRepEmployeeNumber, e.employeeNumber, c.customerName, c.country
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE c.country = 'japan';