USE classicmodels;

# no 1
SELECT c.customerName, p.productName, pay.paymentDate, o.status
FROM customers c
JOIN payments pay
USING (customernumber)
-- ON c.customernumber = pay.customernumber
JOIN orders o
USING(customernumber)
-- ON c.customernumber = o.customernumber
JOIN orderdetails od
USING (ordernumber)
-- ON o.ordernumber = od.ordernumber
JOIN products p
USING (productcode)
-- ON od.productcode = p.productcode
WHERE productname LIKE '%ferrari%' AND STATUS = 'shipped'
LIMIT 3;

# no 2
## 2a
SELECT c.customerName, pay.paymentDate, CONCAT (e.firstName, ' ',e.lastName) AS 'Nama Karyawan'
FROM customers c
JOIN payments pay
USING (customernumber)
-- ON c.customernumber = pay.customernumber
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE MONTH (pay.paymentDate) =  11;

##2b
SELECT * FROM payments;

SELECT c.customerName, pay.paymentDate, CONCAT (e.firstName, ' ',e.lastName) AS 'Nama karyawan', pay.amount
FROM customers c
JOIN payments pay 
USING (customernumber)
-- ON c.customernumber = pay.customernumber
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE paymentDate LIKE '_____11%'
ORDER BY amount DESC
LIMIT 1;


##2c
SELECT c.customerName, p.productName
FROM customers c
JOIN payments pay 
USING (customernumber)
-- on pay.customerNumber = c.customerNumber
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
USING (ordernumber)
-- ON o.ordernumber = od.ordernumber
JOIN products p
USING (productCode)
-- ON od.productCode = p.productCode
WHERE MONTH (pay.paymentDate) = 11 AND customername = 'Corporate Gift Ideas Co.';

##2d
SELECT c.customerName,  GROUP_CONCAT(p.productName) AS 'nama produk'
FROM customers c
JOIN payments py 
USING (customernumber)
-- ON c.customernumber = py.customernumber
JOIN orders o
USING (customernumber)
-- c.customerNumber = o.customerNumber
JOIN orderdetails od
USING (ordernumber)
-- ON o.ordernumber = od.ordernumber
JOIN products p
USING (productCode)
-- od.productCode = p.productCode
WHERE MONTH (paymentdate) = 11 AND customername = 'Corporate Gift Ideas Co.';

# no 3
SELECT c.customerName, o.orderDate, o.shippedDate, DATEDIFF(o.shippedDate, o.orderDate) AS 'waktu tunggu'
FROM customers c
JOIN orders o
USING (customernumber)
-- ON c.customernumber = o.customernumber
WHERE c.customerName = 'giftsforhim.com';

# no4
USE world;
##4a
SELECT CODE, NAME
FROM country c 
WHERE CODE LIKE 'c%k';

##4b
SELECT NAME, lifeExpectancy
FROM country c
WHERE lifeExpectancy IS NOT NULL;


-- SOAL TAMBAHAN
SELECT*from orders;

SELECT c.customerName, comments
FROM orders o
JOIN customers c
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%order%' ;
