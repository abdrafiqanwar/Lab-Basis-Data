USE classicmodels
USE world

-- Nomor1
SELECT customerName, productName, paymentDate, STATUS FROM payments 
JOIN customers USING(customerNumber) 
JOIN orders USING(customerNumber)
JOIN orderdetails USING(orderNumber)
JOIN products USING(productCode) 
WHERE productName LIKE '%Ferrari%' AND STATUS = 'Shipped';


-- Nomor2
-- A
SELECT customerName, paymentDate, CONCAT (firstName, ' ', lastName) AS nama FROM customers INNER JOIN employees
ON employees.employeeNumber = customers.salesRepEmployeeNumber 
INNER JOIN payments USING(customerNumber) WHERE MONTH(paymentDate) = '11';
-- B
SELECT DISTINCT checkNumber, customerName, amount, paymentDate FROM payments
JOIN customers USING(customerNumber)
JOIN orders USING(customerNumber) 
JOIN orderdetails USING(orderNumber)
WHERE MONTH(paymentDate) = '11' ORDER BY amount DESC LIMIT 1;

SELECT * FROM payments WHERE MONTH(paymentDate) = '11' ORDER BY amount DESC

-- C
SELECT customerName, productName, amount, paymentDate FROM payments
JOIN customers USING (customerNumber)
JOIN orders USING(customerNumber)
JOIN orderdetails USING(orderNumber)
JOIN products USING(productCode) 
WHERE customerName = 'Corporate Gift Ideas Co.' AND paymentDate LIKE '_____11%';



-- Nomor 3
SELECT customerName, orderDate, shippedDate, DATEDIFF(shippeddate, orderdate) AS 'Waktu menunggu' FROM customers
JOIN orders USING(customerNumber)
WHERE customerName LIKE '%GiftsForHim%';


-- Nomor 4
- A
SELECT * FROM country
SELECT code,NAME, lifeExpectancy FROM country WHERE code LIKE 'C%K';
-- B
SELECT NAME, lifeExpectancy FROM country WHERE lifeExpectancy IS NOT NULL 


-- Nomor 5
SELECT CONCAT (firstName, ' ', lastName) AS nama, email FROM employees WHERE email LIKE '%o%____________________'