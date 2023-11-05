# nomor 1
(SELECT c.customername, 
	p.productname, 
	p.buyprice*sum(od.quantityordered) "modal"
FROM customers c
JOIN orders o USING(customernumber)
JOIN orderdetails od USING(ordernumber)
JOIN products p USING(productcode)
GROUP BY c.customerNumber
ORDER BY p.buyprice*sum(od.quantityordered) DESC
LIMIT 3)
UNION 
(SELECT c.customername, 
	p.productname, 
	p.buyprice*sum(od.quantityordered)
FROM customers c
JOIN orders o USING(customernumber)
JOIN orderdetails od USING(ordernumber)
JOIN products p USING(productcode)
GROUP BY c.customerNumber
ORDER BY p.buyprice*sum(od.quantityordered)
LIMIT 3);

# nomor 2
SELECT city, COUNT(city) AS total
FROM (
   SELECT offices.city FROM employees
	JOIN offices USING(officeCode)
	WHERE firstName LIKE 'L%'
UNION ALL
	SELECT c.city
	FROM customers c
	WHERE c.customerName LIKE 'L%'
	) AS EmployeeCustomerCities
GROUP BY city
ORDER BY total DESC
LIMIT 1;

	
# nomor 3 (officecode 2 3 5 7)
SELECT CONCAT(firstName, " ", lastName) "Nama Karyawan/Pelanggan", "Karyawan" `status`
FROM employees
WHERE officeCode IN (
	SELECT officecode FROM employees
	GROUP BY officecode
	HAVING COUNT(*) = (
		SELECT MIN(jumlahEmployee)
		FROM(
		SELECT officecode, COUNT(*) jumlahEmployee
		FROM employees
		GROUP BY officecode
		)jumlahEmployeePerOffice
	)
)
UNION
SELECT c.customername "Nama Karyawan/Pelanggan", "Pelanggan" `status`
FROM customers c
JOIN employees e
ON c.salesrepemployeenumber = e.employeeNumber
WHERE e.officeCode IN (
	SELECT officecode FROM employees
	GROUP BY officecode
	HAVING COUNT(*) = (
		SELECT MIN(jumlahEmployee)
		FROM(
		SELECT officecode, COUNT(*) jumlahEmployee
		FROM employees
		GROUP BY officecode
		)jumlahEmployeePerOffice
	)
)
ORDER BY `Nama Karyawan/Pelanggan`;

# nomor 4
SELECT tanggal, GROUP_CONCAT(riwayat SEPARATOR " dan ") riwayat
FROM(
	SELECT paymentDate tanggal, "membayar pesanan" riwayat
	FROM payments
	WHERE MONTH(paymentdate) = 4 AND YEAR(paymentdate) = 2003
	UNION
	SELECT orderDate tanggal, "memesan barang" riwayat
	FROM orders
	WHERE MONTH(orderdate) = 4 AND YEAR(orderdate) = 2003
	) dataCustomers
GROUP BY tanggal;

# soal tambahan
(SELECT p.productLine, p.productName, max(od.quantityOrdered) `Total Penjualan`, "Terlaris" `status`
FROM products p
JOIN orderdetails od
USING(productcode)
WHERE od.quantityOrdered IN (
	SELECT MAX(od.quantityOrdered)
	FROM orderdetails od
	JOIN products p
	USING(productcode)
	GROUP BY p.productLine)
GROUP BY p.productLine)
UNION
(SELECT p.productLine, p.productName, min(od.quantityOrdered), "kurang laris"
FROM products p
JOIN orderdetails od
USING(productcode)
WHERE od.quantityOrdered IN (
	SELECT MIN(od.quantityOrdered)
	FROM orderdetails od
	JOIN products p
	USING(productcode)
	GROUP BY p.productLine)
GROUP BY p.productLine)
ORDER BY productLine;