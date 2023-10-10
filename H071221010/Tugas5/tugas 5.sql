USE classicmodels;

# Nomor 1
SELECT c.customerName, p.productName, py.paymentDate, o.`status`
FROM payments py
JOIN customers c
USING(customerNumber)
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
WHERE p.productName LIKE '%1992 Ferrari%' AND o.`status` = 'Shipped' AND c.customerName LIKE '%Signal%';

# Nomor 2a
SELECT c.customerName, py.paymentDate, CONCAT(e.firstName, " ", e.lastName) "Nama Karyawan"
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments py
USING(customerNumber)
WHERE py.paymentDate LIKE '_____11%';

# Nomor 2b
SELECT c.customerName, py.paymentDate, CONCAT(e.firstName, " ", e.lastName) "Nama Karyawan", py.amount
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments py
USING(customerNumber)
WHERE MONTH(py.paymentDate) = 11
ORDER BY py.amount DESC
LIMIT 1;

# Nomor 2c
SELECT c.customerName, p.productName
FROM payments py
JOIN customers c
USING(customerNumber)
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
WHERE MONTH(py.paymentDate) = 11 AND c.customerName = 'Corporate Gift Ideas Co.';

# Nomor 2d
SELECT c.customerName, GROUP_CONCAT(p.productName SEPARATOR ", ") AS "Nama Produk"
FROM payments py
JOIN customers c
USING(customerNumber)
JOIN orders o
USING(customerNumber)
JOIN orderdetails od
USING(orderNumber)
JOIN products p
USING(productCode)
WHERE MONTH(py.paymentDate) = 11 AND c.customerName = 'Corporate Gift Ideas Co.';

# Nomor 3
SELECT c.customerName, o.orderDate, o.shippedDate, DATEDIFF(o.shippedDate, o.orderDate) AS 'Lama Nunggu'
FROM customers c
JOIN orders o
USING(customerNumber)
WHERE c.customerName = 'GiftsForHim.com';

# Nomor 4
USE world;

# Nomor 4a
SELECT c.Name, c.Code
FROM country c
WHERE c.Code LIKE 'C%K';

# Nomor 4b
SELECT c.Name, c.LifeExpectancy
FROM country c
WHERE c.LifeExpectancy IS NOT NULL;

# Nomor 5 (soal tambahan)
# cara kakak
SELECT email FROM employees
WHERE email NOT LIKE '%o%____________________';
-- atau
# cara alisha
SELECT email FROM employees
WHERE email NOT LIKE '%o%@classicmodelcars.com';