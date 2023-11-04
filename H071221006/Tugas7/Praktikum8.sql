-- Nomor 1
(SELECT customerName, productName, SUM(quantityOrdered * priceEach) AS 'modal'
FROM customers 
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
JOIN products USING (productCode)
GROUP BY customerNumber
ORDER BY SUM(quantityOrdered * priceEach) DESC
LIMIT 3)
UNION
(SELECT customerName, productName, SUM(quantityOrdered * priceEach) AS 'modal'
FROM customers
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
JOIN products USING (productCode)
GROUP BY customerNumber
ORDER BY SUM(quantityOrdered * priceEach) ASC
LIMIT 3);
	
-- Nomor 2
SELECT kota FROM(
(SELECT CONCAT(firstname, ' ', lastname) AS nama_employee ,city AS kota FROM offices 
JOIN employees USING (officeCode)
WHERE employees.firstName LIKE 'L%'
GROUP BY officeCode
ORDER BY COUNT(*) DESC
LIMIT 1)
UNION
(SELECT customername, city AS kota FROM customers
WHERE customername LIKE 'L%'
GROUP BY city
ORDER BY COUNT(*) DESC
LIMIT 1)) AS tabel
GROUP BY kota
LIMIT 1;


-- Nomor 3
(SELECT customerName AS 'Nama Karyawan/Pelanggan', 'Pelanggan' AS 'status'
FROM customers 
JOIN employees ON customers.salesRepEmployeeNumber = employees.employeeNumber
WHERE officeCode IN (SELECT officeCode FROM employees
GROUP BY officeCode 
HAVING COUNT(employeeNumber) = ( SELECT COUNT(employeeNumber) FROM employees
GROUP BY (officeCode) 
ORDER BY COUNT(employeeNumber) 
LIMIT 1)))
UNION
(SELECT CONCAT(firstName, ' ', lastName), 'Karyawan'
FROM employees 
WHERE officeCode IN ( SELECT officeCode FROM employees
GROUP BY officeCode 
HAVING COUNT(employeeNumber) = ( SELECT COUNT(employeeNumber) FROM employees
GROUP BY (officeCode) 
ORDER BY COUNT(employeeNumber) 
LIMIT 1)))
ORDER BY `Nama Karyawan/Pelanggan`;

-- Nomor 4
(SELECT orderDate AS 'tanggal', 'membayar pesanan dan memesan barang' AS 'riwayat' FROM payments
JOIN orders ON orders.orderDate = payments.paymentDate
WHERE orderDate LIKE '2003-04-__')	
UNION
(SELECT orderDate , 'memesan barang' FROM orders
WHERE orderDate LIKE '2003-04-__' AND orderDate NOT IN (SELECT orderDate FROM payments
JOIN orders ON orderDate = paymentDate
WHERE orderDate LIKE '2003-04-__'))
UNION
(SELECT paymentDate , 'membayar pesanan' FROM payments
WHERE paymentDate LIKE '2003-04-__'  AND paymentDate NOT IN (SELECT orderDate FROM payments
JOIN orders ON orderDate = paymentDate
WHERE orderDate LIKE '2003-04-__'))
ORDER BY `tanggal`;

-- Nomor 5
