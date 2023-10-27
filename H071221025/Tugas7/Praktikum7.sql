USE classicmodels;
#no1
SELECT o.addressLine1, o.addressLine2, o.city, o.country
FROM offices o
JOIN employees e
USING(officecode)
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
USING(customernumber)
GROUP BY c.customerNumber
HAVING COUNT(p.amount) = (
	 SELECT COUNT(p.amount)
	 FROM customers c 
	 JOIN payments p
	 USING(customerNumber)
	 GROUP BY c.customerNumber
	 ORDER BY COUNT(p.amount)
	 LIMIT 1);

#no2
SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'nama employee', sum(p.amount) AS pendapatan
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
USING(customernumber)
GROUP BY e.employeeNumber
HAVING SUM(p.amount) = 
	(SELECT SUM(p.amount)
	FROM employees e
	JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber
	JOIN payments p
	USING(customernumber)
	GROUP BY e.employeeNumber
	ORDER BY sum(p.amount) desc
	LIMIT 1) or
SUM(p.amount) = 
	(SELECT SUM(p.amount)
	FROM employees e
	JOIN customers c
	ON e.employeeNumber = c.salesRepEmployeeNumber
	JOIN payments p
	USING(customernumber)
	GROUP BY e.employeeNumber
	ORDER BY sum(p.amount) asc
	LIMIT 1);

-- no3
USE world;

SELECT
    c.Name 'Negara',
    c.Population * cl.Percentage AS 'Pengguna Bahasa'
FROM country c
JOIN countrylanguage cl
ON c.Code = cl.CountryCode
WHERE cl.`Language` = (SELECT cl.`Language` 
		FROM countrylanguage AS cl
		JOIN country c
		ON c.Code = cl.CountryCode
		WHERE c.Continent = "Asia"
		GROUP BY cl.`Language`
		ORDER BY COUNT(cl.`Language`) desc
		LIMIT 1
		);

-- NO 4
USE classicmodels;
SELECT c.customerName, 
		SUM(py.amount) AS 'Total pembayaran',
		SUM(od.quantityOrdered) 'banyak barang',
		GROUP_CONCAT(p.productName SEPARATOR '| ')'produk yang dibeli'
FROM payments py
JOIN customers c USING (customerNumber)
JOIN orders o USING (customerNumber)
JOIN orderdetails od USING (orderNumber)
JOIN products p USING (productCode)
GROUP BY customerNumber
HAVING SUM(py.amount) > (SELECT AVG(total) FROM 
					(SELECT SUM(py.amount) AS "total" FROM payments py
					GROUP BY py.customerNumber) AS rata_rata
					)ORDER BY SUM(od.quantityOrdered);
					
-- soal tambahan 
SELECT distinct c.country, LENGTH(country) AS "panjang karakter"
FROM customers c
WHERE LENGTH(country) = (SELECT MAX(LENGTH(country)) FROM customers c)
								OR 
								LENGTH(country) = 
								(SELECT MIN(LENGTH(country)) FROM customers c);
								
