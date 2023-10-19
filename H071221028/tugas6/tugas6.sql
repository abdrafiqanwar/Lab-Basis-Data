USE classicmodels;

```NO 1

##1
SELECT concat(employees.firstName,' ',employees.lastName), group_concat(orders.orderNumber), COUNT(orders.orderNumber)
FROM employees
JOIN customers ON employees.employeeNumber = customers.salesRepEmployeeNumber
JOIN orders ON customers.customerNumber = orders.customerNumber
GROUP BY employees.employeeNumber
HAVING COUNT(orders.orderNumber)>10;

```NO 2

##2
SELECT products.productCode, products.productName, products.quantityInStock, orders.orderDate
FROM products 
JOIN orderdetails ON products.productCode = orderdetails.productCode
JOIN orders ON orderdetails.orderNumber = orders.orderNumber
GROUP BY products.productCode
HAVING products.quantityInStock > 5000
ORDER BY orders.orderDate


```NO 3 
SELECT offices.addressLine1 'Alamat', 
		CONCAT(LEFT(offices.phone, 6), '* **') 'No Telp', 
		count(DISTINCT employees.employeeNumber) 'Jumlah Karyawan', 
		count(DISTINCT customers.customerNumber) 'Jumlah Pelanggan',
		FORMAT(avg(payments.amount),2) 'Rata-Rata Penghasilan'
FROM offices 
JOIN employees USING(officecode)
left JOIN customers ON customers.salesRepEmployeeNumber = employees.employeeNumber
left JOIN payments USING(customernumber)
GROUP BY offices.officecode
ORDER BY offices.phone
 
```NO 4
SELECT customers.customerName, 
		YEAR(orders.orderDate) 'tahun order' , 
		MONTHNAME(orders.orderDate) 'bulan order',
		COUNT(orders.orderNumber) 'jumlah pesanan',
		SUM(orderdetails.priceEach * orderdetails.quantityOrdered) 'uang total penjualan'
FROM customers
JOIN orders USING(customernumber)
JOIN orderdetails USING(ordernumber)
WHERE year(orders.orderDate) = 2003
GROUP BY customers.customerName, MONTHNAME(orders.orderDate);


```soal tambahan
SELECT 
		customers.customerName, 
		sum(payments.amount), 
		customers.creditLimit,
		sum(payments.amount) - customers.creditLimit
FROM customers 
JOIN 
		payments USING(customerNumber)
GROUP BY customers.customerName
having sum(payments.amount) > customers.creditLimit

