USE classicmodels
USE world

```NO 1
SELECT o.addressline1, o.addressLine2, o.city, o.country 
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN offices o
USING(officeCode)
JOIN payments 
USING(customerNumber)
GROUP BY customerNumber
HAVING count(payments.amount) = (SELECT count(payments.amount)
FROM payments
GROUP BY customerNumber 
ORDER BY count(payments.amount)
LIMIT 1);

```NO 2
SELECT CONCAT(e.firstName, ' ', e.lastName) 'nama employee', p.amount 'pendapatan'
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
USING (customernumber)
WHERE e.employeeNumber IN (
(SELECT employees.employeeNumber
FROM employees 
JOIN customers ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN payments 
USING (customerNumber)
GROUP BY employees.employeeNumber
ORDER BY SUM(payments.amount)
LIMIT 1),
(SELECT employees.employeeNumber
FROM employees 
JOIN customers ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN payments 
USING (customerNumber)
GROUP BY employees.employeeNumber
ORDER BY SUM(payments.amount) desc
LIMIT 1))
GROUP BY e.employeeNumber;


```NO 3
-- memperlihatkan bahasa yang paling banyak digunakan di benua asia
SELECT 
    c.Continent,
    cl.Language,
    COUNT(cl.Language) 'banyak negara'
FROM country c
JOIN countrylanguage cl 
ON c.Code = cl.CountryCode
WHERE c.Continent = 'Asia'
GROUP BY cl.Language
ORDER BY COUNT(cl.language) DESC
LIMIT 1;

SELECT
    c.Name 'Negara',
    c.Population * cl.Percentage 'Pengguna Bahasa'
FROM country c
JOIN countrylanguage cl
ON c.Code = cl.CountryCode
WHERE cl.language = 
(SELECT countrylanguage.language
FROM countrylanguage
JOIN country
ON country.Code = countrylanguage.CountryCode
WHERE country.Continent = 'Asia'
GROUP BY countrylanguage.language
ORDER BY COUNT(countrylanguage.language) DESC
LIMIT 1);

```NO 4
SELECT c.customerName,
    SUM(py.amount) 'Total pembayaran',
	 SUM(od.quantityOrdered) 'banyak barang',
    GROUP_CONCAT(p.productName SEPARATOR ', ') 'produk yang dibeli'
FROM customers c
JOIN orders o
USING (customernumber)
JOIN payments py
USING (customerNumber)
JOIN orderdetails od
USING (ordernumber)
JOIN products p
USING (productcode)
GROUP BY c.customerNumber
HAVING SUM(py.amount) > 
(SELECT AVG(jumlah) FROM (SELECT SUM(amount) AS jumlah FROM payments GROUP BY customerNumber)AS hitung)



SELECT distinct country, LENGTH(country) FROM customers
WHERE LENGTH(country) =
(SELECT MAX(LENGTH(country)) FROM customers)
OR LENGTH(country)=   
(SELECT MIN(LENGTH(country)) FROM customers)




