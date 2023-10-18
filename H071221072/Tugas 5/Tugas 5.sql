-- No 1
USE classicmodels;

SELECT c.customerName, p.productName, pay.paymentDate, o.status
FROM customers AS c
JOIN payments AS pay
USING (customerNumber)
JOIN orders AS o
USING (customerNumber)
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE p.productName LIKE "%Ferrari%" AND o.`status` = "Shipped"
LIMIT 3;

-- No 2
-- a
SELECT c.customerName, pay.paymentDate, CONCAT(e.firstname," " ,e.lastname) AS "Full Name"
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments AS pay
ON c.customerNumber = pay.customerNumber
WHERE pay.paymentDate LIKE "%-11-%";
-- b
SELECT c.customerName, pay.paymentDate, CONCAT(e.firstname," " ,e.lastname) AS "Full Name", pay.amount
FROM customers AS c
JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments AS pay
ON c.customerNumber = pay.customerNumber
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
USING (orderNumber)
WHERE pay.paymentDate LIKE "%-11-%"
ORDER BY pay.amount DESC 
LIMIT 1;
-- c
SELECT c.customerName, p.productName
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE c.customerName = "Corporate Gift Ideas Co.";
-- d
SELECT c.customerName,  GROUP_CONCAT(p.productName) AS "Semua"
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
JOIN orderdetails AS od
USING (orderNumber)
JOIN products AS p
USING (productCode)
WHERE c.customerName = "Corporate Gift Ideas Co.";

-- No 3
SELECT c.customerName, o.orderDate, o.shippedDate,DATEDIFF(o.shippedDate, o.orderDate) AS "Menunggu selama"
FROM customers AS c
JOIN orders AS o
USING (customerNumber)
WHERE c.customerName LIKE "%GiftsForHim.com%"


-- No 4
-- a
USE world
SELECT c.Code, c.name
FROM country AS c
WHERE c.Code LIKE "c%k"
-- b
SELECT c.Name, c.LifeExpectancy
FROM country AS c
WHERE c.LifeExpectancy IS NOT NULL;

-- 
SELECT CONCAT(e.firstname, e.lastname), e.email
FROM employees AS e
WHERE e.email LIKE "%o%@%" 
