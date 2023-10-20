-- Nomor 1
SELECT CONCAT(employees.firstname, ' ', employees.lastName) AS 'nama employee', GROUP_CONCAT(orderNumber SEPARATOR " | ") AS 'Nomor orderan', COUNT(orders.orderNumber) AS 'Jumlah pesanan'
FROM employees 
JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN orders USING(customerNumber)
GROUP BY employeeNumber
HAVING COUNT(orders.orderNumber) > 10;

-- Nomor 2
SELECT productCode, productName, (quantityInStock), (orderDate) FROM orders
JOIN orderdetails USING(orderNumber)
JOIN products USING(productCode)
WHERE quantityInStock > 5000 
GROUP BY productcode
ORDER BY orderDate ASC;

-- Nomor 3
SELECT offices.addressLine1 AS 'Alamat',
		CONCAT(SUBSTRING(offices.phone,1,6),'* **') AS 'Nomor Telp', 
		COUNT(DISTINCT employees.employeeNumber) AS 'Jumlah Karyawan',
		COUNT(DISTINCT customers.customerNumber) AS 'Jumlah Pelanggan',
		AVG(payments.amount) AS 'Rata-rata Penghasilan'
FROM offices 
LEFT JOIN employees USING(officeCode)
LEFT JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
LEFT JOIN payments USING(customerNumber)
GROUP BY offices.officeCode
ORDER BY offices.phone


-- Nomor 4
SELECT customerName, 
		YEAR(orderDate) AS tahunOrder,
		MONTHNAME(orderdate) AS bulanOrder,
		COUNT(orderNumber) AS jumlahPesanan,
		SUM(priceEach * quantityOrdered) AS 'uang total penjualan'
FROM customers
JOIN orders USING(customerNumber)
JOIN orderdetails USING(orderNumber)
WHERE YEAR(orderDate) = 2003
GROUP BY customerName, tahunOrder, bulanOrder
ORDER BY customername,tahunOrder, bulanOrder;


-- Nomor 5
SELECT CONCAT(MONTHNAME(payments.paymentDate), ' ',YEAR(payments.paymentDate)) AS 'Hari Pembayaran',
		 COUNT(DISTINCT customers.customerNumber) AS 'Jumlah Pelanggan',
		 GROUP_CONCAT(DISTINCT customers.customerName SEPARATOR ", ") AS 'List Pelanggan',
		 SUM(payments.amount) AS 'Jumlah Pembayaran'
FROM payments
JOIN customers USING(customerNumber)
WHERE MONTHNAME(payments.paymentDate) = 'February'
GROUP BY YEAR(payments.paymentdate)
ORDER BY payments.paymentdate DESC;
		 


