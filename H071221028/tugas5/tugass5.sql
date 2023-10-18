USE classicmodels;
#1
SELECT customers.customerName, products.productName, payments.paymentDate, orders.`status`
FROM customers
JOIN payments USING(customerNumber)
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
JOIN products USING (productCode)
WHERE products.productName LIKE '%Ferrari%' AND customers.customerName = 'Signal Gift Stores';


##2
#a
SELECT customers.customerName, payments.paymentDate,
	CONCAT (employees.firstName, " ", employees.lastName) AS "employees name"
FROM customers
JOIN payments USING (customerNumber)
JOIN employees on employees.employeeNumber = customers.salesRepEmployeeNumber
WHERE MONTH (payments.paymentDate) = 11;

#b
SELECT customers.customerName, payments.paymentDate, CONCAT (employees.firstName, " ", employees.lastName) AS "employees name", payments.amount
FROM customers
JOIN payments USING (customerNumber)
JOIN employees ON employees.employeeNumber = customers.salesRepEmployeeNumber
WHERE MONTH (payments.paymentDate) = 11 ORDER BY payments.amount DESC
LIMIT 1;

#c 
SELECT
    customers.customerName,
    products.productName
FROM
	customers
JOIN payments USING (customerNumber)
JOIN orders USING (customerNumber)
JOIN orderdetails USING (orderNumber)
JOIN products USING (productCode)
WHERE
    MONTH(payments.paymentDate) = 11 AND customers.customerName= 'Corporate Gift Ideas Co.';


#3
SELECT customers.customerName, orders.orderDate, orders.shippedDate, 
DATEDIFF(orders.shippedDate, orders.orderDate) AS 'lama menunggu'
FROM customers
JOIN orders USING(customerNumber)
WHERE customers.customerName = 'GiftsForHim.com';

#4
USE world;

SELECT country.Name, country.Code, country.LifeExpectancy
FROM country
WHERE country.Code LIKE 'c%k' ;


SELECT country.Name, country.Code, country.LifeExpectancy
FROM country
WHERE country.LifeExpectancy IS NOT NULL;

##soal tambahan
SELECT 
		CONCAT (employees.firstName, " ", employees.lastName) AS "employees name", employees.email
FROM employees 
WHERE employees.email LIKE '%o%@classicmodelcars.com'
