USE classicmodels;

-- no1
SELECT CONCAT(employees.firstName, ' ', employees.lastName) AS 'Nama employee', 
   GROUP_CONCAT(orders.orderNumber SEPARATOR '|') AS 'Nomor Orderan', 
   COUNT(orders.orderNumber) AS 'Jumlah pesanan'
FROM employees 
JOIN customers 
ON employees.employeeNumber = customers.salesRepEmployeeNumber 
JOIN orders 
USING(customerNumber)
GROUP BY employees.employeeNumber 
HAVING COUNT(orders.orderNumber) > 10;

-- no2
SELECT 
    products.productCode, 
    products.productName, 
    products.quantityInStock, 
    orders.orderDate
FROM products 
JOIN orderdetails 
USING(productCode)
JOIN orders 
USING(orderNumber)
GROUP BY products.productCode
HAVING products.quantityInStock > 5000
ORDER BY orders.orderDate;

-- no3
-- SELECT * FROM offices;
-- SELECT * FROM employees;
-- SELECT * FROM customers;
-- SELECT * FROM payments;

SELECT o.addressLine1 AS Alamat,
CONCAT(LEFT(o.phone, 6), '* **') AS nomor_telp,
COUNT(DISTINCT e.employeeNumber) AS Jumlah_Karyawan,
COUNT(DISTINCT c.customerNumber) AS Jumlah_Pelanggan,
ROUND(AVG(p.amount), 2) AS 'Rata-rata Penghasilan'
FROM offices AS o
LEFT JOIN employees AS e
USING(officeCode)
LEFT JOIN customers  AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
USING(customerNumber)
GROUP BY o.phone;


-- no4
SELECT customers.customerName, 
   YEAR(orders.orderDate) AS 'tahun order', 
   MONTHNAME(orders.orderDate) AS 'bulan order', 
   COUNT(orders.orderNumber) AS 'Jumlah pesanan', 
   SUM(orderdetails.priceEach * orderdetails.quantityOrdered) AS 'uang total penjualan'
FROM customers 
JOIN orders 
USING(customerNumber)
JOIN orderdetails 
USING(orderNumber)
WHERE YEAR(orders.orderDate) = 2003 
GROUP BY customers.customerName, MONTH(orders.orderDate);


-- SOAL TAMBAHAN
SELECT customers.customerName AS 'Nama Pelanggan', 
SUM(payments.amount) AS 'Total Belanja', 
customers.creditLimit AS 'Batas Kredit', 
SUM(payments.amount) - creditLimit AS Selisih
FROM customers
JOIN payments
USING(customerNumber)
GROUP BY customerName
HAVING SUM(payments.amount) > creditLimit;
