USE classicmodels;
DESCRIBE customers;

#1
SELECT 
		customers.customerName, 
		customers.country, 
		payments.paymentDate
FROM customers  JOIN  payments ON customers.customerNumber = payments.customerNumber
WHERE YEAR (payments.paymentDate) >= 2005
ORDER BY payments.paymentDate DESC;

SELECT 
    c.customerName AS Nama_Customer,
    c.country AS Negara_Customer,
    p.paymentDate AS Tanggal_Pembayaran
FROM 
    customers AS c
INNER JOIN 
    payments AS p
ON 
    c.customerNumber = p.customerNumber
WHERE 
    YEAR(p.paymentDate) >= 2005
ORDER BY 
    p.paymentDate DESC;
    
#2
SELECT DISTINCT 
		customers.customerName, 
		products.productName, 
		products.productLine 
FROM 
		customers 	
INNER JOIN 
		orders ON customers.customerNumber = orders.customerNumber
INNER JOIN 
		orderdetails ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN 
		products ON orderdetails.productCode = products.productCode
WHERE 
		products.productName= 'The Titanic';
##
SELECT DISTINCT
    customers.customerName,
    products.productName,
    products.productLine
FROM
    customers
INNER JOIN
    orders ON customers.customerNumber = orders.customerNumber
INNER JOIN
    orderdetails ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN
    products ON orderdetails.productCode = products.productCode
WHERE
    products.productName = 'The Titanic';
    
##3
SELECT * FROM products;

ALTER TABLE products
ADD COLUMN `status` VARCHAR(20);

UPDATE products
SET STATUS = 'best selling'
WHERE productCode = 'S12_4675'

SELECT 
		products.productCode,
		products.productName,
		orderdetails.quantityOrdered,
		products.status
FROM 
		products 
JOIN 
		orderdetails 
ON 
		orderdetails.productCode = products.productCode
ORDER BY 
		orderdetails.quantityOrdered  
LIMIT 1;


SELECT 
    products.productCode,
    products.productName,
    orderdetails.quantityOrdered,
    products.status
FROM 
    products 
JOIN 
    orderdetails 
ON 
    orderdetails.productCode = products.productCode
ORDER BY 
    orderdetails.quantityOrdered  
LIMIT 1;

DELETE FROM customers
WHERE customerNumber IN (
    SELECT orders.customerNumber
    FROM orders
    WHERE orders.status = 'cancelled'
);


SELECT * FROM orders WHERE STATUS = 'cancelled';

SELECT pegawai.employeeNumber, pegawai.lastname,  boss.reportsTo, boss.lastName
FROM 
		employees AS boss
JOIN 
		employees AS pegawai
 ON 
 		pegawai.reportsTo = boss.employeeNumber;



