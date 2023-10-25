# NOMOR 1
USE classicmodels;
SELECT o.addressLine1,
		o.addressLine2, 
		o.city, 
		o.country,
		CONCAT(e.lastName, ' ', e.firstName) "Nama Karyawan",
		c.customerName,
		COUNT(p.amount) "Jumlah Transaksi"
FROM offices o
JOIN employees e   
USING(officeCode)
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
USING(customernumber)
GROUP BY c.customerNumber
HAVING count(p.amount) = (
	SELECT COUNT(p.amount)
	FROM customers c
	JOIN payments p
	USING(customernumber)
	GROUP BY c.customerNumber
	ORDER BY COUNT(p.amount)
	LIMIT 1
);

# NOMOR 2
-- MAX dan MIN
SELECT CONCAT(e.lastName, ' ',e.firstName) "nama employee", 
		SUM(p.amount) pendapatan
FROM employees e
JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p 
USING(customernumber)
GROUP BY e.employeeNumber
HAVING SUM(p.amount) = (
	SELECT MAX(pendapatan)
	FROM (
		SELECT SUM(p.amount) pendapatan
		FROM customers c
		JOIN payments p 
		USING (customerNumber)
		GROUP BY c.salesRepEmployeeNumber) max_pendapatan
) 
UNION ALL
SELECT CONCAT(e.lastName, ' ',e.firstName) "nama employee", 
		SUM(p.amount) pendapatan
FROM employees e
JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p 
USING(customernumber)
GROUP BY e.employeeNumber
HAVING SUM(p.amount) = (
	SELECT MIN(pendapatan)
	FROM (
		SELECT SUM(p.amount) pendapatan
		FROM customers c
		JOIN payments p 
		USING (customerNumber)
		GROUP BY c.salesRepEmployeeNumber) max_pendapatan
);

# NOMOR 3
USE world;

SELECT c.Name 'Negara', c.Population * cl.Percentage AS 'Pengguna Bahasa' 
FROM country c
JOIN countrylanguage cl
ON c.Code = cl.CountryCode
WHERE cl.`Language` = (
	SELECT cl.`Language`
	FROM countrylanguage cl
	JOIN country c
	ON c.Code = cl.CountryCode
	WHERE c.Continent = 'Asia'
	GROUP BY cl.`Language`
	ORDER BY COUNT(cl.`Language`) DESC
	LIMIT 1
);

# NOMOR 4
USE classicmodels;
SELECT c.customerName, 
		SUM(p.amount) "Total pembayaran", 
		SUM(od.quantityOrdered) "banyak barang", 
		GROUP_CONCAT(pr.productName SEPARATOR ', ') "produk yang dibeli"
FROM customers c
JOIN orders o 
USING(customernumber)
JOIN orderdetails od 
USING(ordernumber)
JOIN products pr 
USING(productcode)
JOIN payments p 
USING(customernumber)
GROUP BY c.customerNumber
HAVING SUM(p.amount) > (
	SELECT AVG(Total_Pembayaran)
	FROM (
		SELECT SUM(p.amount) Total_Pembayaran
		FROM payments p
		GROUP BY p.customerNumber)
		rata)
ORDER BY sum(od.quantityOrdered);

# SOAL TAMBAHAN
SELECT c.customerName "Nama Pelanggan", max(pembayaran), min(pembayaran)
FROM (
	SELECT p.amount pembayaran, p.customerNumber
	FROM payments p
) pembayarann
JOIN customers c
USING(customernumber)
GROUP BY c.customerNumber;