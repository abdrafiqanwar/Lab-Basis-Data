-- Nomor 1
USE classicmodels

SELECT o.addressLine1,
       o.addressLine2,
       o.city AS 'kota',
       o.country AS 'negara'
FROM employees e
JOIN customers c 
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices o 
USING (officeCode)
JOIN payments p 
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
HAVING COUNT(customerNumber) = (
        SELECT COUNT(customerNumber)
        FROM payments
        GROUP BY customerNumber
        ORDER BY COUNT(customerNumber)
        LIMIT 1 )

-- Nomor 2
USE classicmodels

SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'nama employee',
		 SUM(p.amount) AS 'pendapatan' 
FROM employees e 
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p 
USING (customerNumber)
GROUP BY e.employeeNumber
HAVING SUM(p.amount) =
		 (SELECT SUM(p.amount) FROM payments p
		 JOIN customers c
		 USING (customerNumber)
		 JOIN employees e
		 ON e.employeeNumber = c.salesRepEmployeeNumber
		 GROUP BY e.employeeNumber
		 ORDER BY SUM(p.amount) DESC 
		 LIMIT 1)
OR SUM(p.amount) =
		 (SELECT SUM(p.amount) FROM payments p
		 JOIN customers c
		 USING (customerNumber)
		 JOIN employees e
		 ON e.employeeNumber = c.salesRepEmployeeNumber
		 GROUP BY e.employeeNumber
		 ORDER BY SUM(p.amount)
		 LIMIT 1);

-- Nomor 3
USE world

SELECT c.`Name` AS 'Negara',
		 (c.Population * cl.Percentage) AS 'Pengguna Bahasa'
FROM country c
JOIN countrylanguage cl
ON c.`Code` = cl.CountryCode
WHERE cl.`Language` =
		(SELECT countrylanguage.`Language` 
		FROM countrylanguage
		JOIN country
		ON country.`Code` = countrylanguage.CountryCode
		WHERE country.Continent = 'Asia'
		GROUP BY countrylanguage.`Language`
		ORDER BY COUNT(countrylanguage.`Language`) DESC
		LIMIT 1)
ORDER BY (c.Population * cl.Percentage) DESC;	

-- Nomor 4
USE classicmodels 

SELECT c.customerName,
		 SUM(p.amount) AS 'Total pembayaran',
		 SUM(od.quantityOrdered) AS 'banyak barang',
		 GROUP_CONCAT(pr.productName SEPARATOR '; ') AS 'produk yang dibeli'
FROM payments p
JOIN customers c
USING (customerNumber)
JOIN orders o
USING (customerNumber)
JOIN orderdetails od
USING (orderNumber)
JOIN products pr
USING (productCode)
GROUP BY customerNumber
HAVING SUM(p.amount) >
		 (SELECT AVG(jumlah)
		 FROM (
		 		SELECT SUM(amount) AS 'jumlah'
		 		FROM payments 
		 		GROUP BY customerNumber) AS a)
ORDER BY SUM(p.amount) DESC;

SELECT DISTINCT country, LENGTH(country)
FROM customers
HAVING LENGTH(country) = 
		(SELECT LENGTH(country)
		FROM customers
		ORDER BY LENGTH(country) DESC
		LIMIT 1)
OR LENGTH(country) =
(SELECT LENGTH(country)
FROM customers
ORDER BY LENGTH(country)
LIMIT 1);