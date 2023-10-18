USE classicmodels;
# NOMOR 1
SELECT CONCAT(e.lastName, ' ', e.firstName) "Nama Employee", 
	GROUP_CONCAT(o.orderNumber SEPARATOR ', ') "Nomor Orderan", 
	COUNT(o.orderNumber) "Jumlah Pesanan"
FROM employees e
JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN orders o USING(customerNumber)
GROUP BY e.employeeNumber
HAVING COUNT(o.orderNumber) > 10;

# NOMOR 2
SELECT p.productCode,
	p.productName,
	p.quantityInStock, MIN(o.orderDate) "orderDate"
FROM products p
JOIN orderdetails od USING(productCode)
JOIN orders o USING(orderNumber)
WHERE quantityInStock > 5000
GROUP BY p.productCode
ORDER BY o.orderDate;

# NOMOR 3
SELECT ofc.addressLine1 "Alamat", 
	CONCAT(LEFT(ofc.phone, 6), '* **') "Nomor Telp", 
	COUNT(DISTINCT e.employeeNumber) "Jumlah Karyawan", 
	COUNT(DISTINCT c.customerNumber) "Jumlah Pelanggan", 
	ROUND(AVG(p.amount)) "Rata-rata Penghasilan"
FROM offices ofc
LEFT JOIN employees e USING(officeCode)
LEFT JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p USING(customerNumber)
GROUP BY ofc.phone;

# NOMOR 4
SELECT c.customerName, 
	YEAR(o.orderDate) "Tahun Order", 
	MONTHNAME(o.orderDate)"Bulan Order", 
	COUNT(o.orderNumber) "Jumlah Pesanan", 
	SUM(od.priceEach * od.quantityOrdered) "Uang Total Penjualan"
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
WHERE YEAR(o.orderDate) = 2003
GROUP BY c.customerName, MONTH(o.orderDate);

# SOAL TAMBAHAN (NOMOR 5)
SELECT CONCAT(MONTHNAME(p.paymentDate), ' ', 
	YEAR(p.paymentDate)), 
	COUNT(DISTINCT c.customerNumber), 
	GROUP_CONCAT(c.customerName SEPARATOR ', '), 
	SUM(p.amount)
FROM customers c
RIGHT JOIN payments p USING(customerNumber)
WHERE MONTH(p.paymentDate) = 2
GROUP BY YEAR(p.paymentDate)
ORDER BY SUM(p.amount) DESC;