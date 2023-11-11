-- Nomor 1
SELECT YEAR(orders.orderdate) AS tahun, COUNT(orders.ordernumber) AS 'jumlah pesanan',
case
	when COUNT(orders.ordernumber) > 150 then 'banyak'
	when COUNT(orders.ordernumber) < 75 then 'sedikit'
	ELSE 'sedang'
END AS 'kategori pesanan'
FROM orders
GROUP BY tahun
ORDER BY `jumlah pesanan` DESC;

-- Nomor 2
SELECT CONCAT(firstname, ' ', lastname) AS 'nama pegawai', SUM(payments.amount) AS gaji,
case 
	when SUM(payments.amount) > (SELECT AVG(Total)
		FROM (SELECT SUM(payments.amount) AS Total
		FROM payments 
		JOIN customers USING(customernumber)
		JOIN employees 
		ON customers.salesRepEmployeeNumber = employees.employeeNumber
		GROUP BY employeenumber) AS ordered
		)then 'Di atas rata-rata'
	ELSE 'Dibawah rata-rata'
END AS kategori
FROM employees
JOIN customers 
ON employees.employeenumber = customers.salesRepEmployeeNumber
JOIN payments USING(customernumber)
GROUP BY employees.employeenumber
ORDER BY SUM(payments.amount) DESC;


-- Nomor 3
SELECT customername, GROUP_CONCAT(LEFT(productname, 4)) AS 'Tahun Pembuatan Produk', 
COUNT(productname) AS 'Jumlah Produk', SUM(DATEDIFF(shippeddate, orderdate)) AS 'Total Durasi Pengiriman',
case
	when MONTH(orderdate) % 2 = 1 AND SUM(DATEDIFF(shippeddate, orderdate)) > (SELECT AVG(Total)
		FROM (SELECT SUM(DATEDIFF(shippeddate, orderdate)) AS Total
		FROM orders
		GROUP BY customernumber) AS p) then 'TARGET 1'
	when MONTH(orderdate) % 2 = 0 AND SUM(DATEDIFF(shippeddate, orderdate)) > (SELECT AVG(Total)
		FROM (SELECT SUM(DATEDIFF(shippeddate, orderdate)) AS Total
		FROM orders
		GROUP BY customernumber) AS counts) then 'TARGET 2'
		END AS keterangan 
		FROM customers
		JOIN orders USING(customernumber)
		JOIN orderdetails USING(ordernumber)
		JOIN products USING(productcode)
		WHERE LEFT(productname, 4) LIKE '18%' 
		GROUP BY customers.customernumber
		HAVING keterangan IS NOT NULL
	
UNION

SELECT customername,  GROUP_CONCAT(LEFT(productname, 4)) AS 'Tahun Pembuatan Produk',
COUNT(productname) AS 'Jumlah Produk', SUM(DATEDIFF(shippeddate, orderdate)) AS 'Total Durasi Pengiriman',
case
	when  MONTH(orderDate) % 2 = 1 AND COUNT(productCode) > 10 * (SELECT AVG(product_count)
		FROM (SELECT COUNT(productCode) AS product_count
		FROM products
		GROUP BY products.productCode) AS counts) THEN 'TARGET 3'
	when  MONTH(orderDate) % 2 = 0 AND COUNT(productCode) > 10 * (SELECT AVG(product_count)
	   FROM (SELECT COUNT(productCode) AS product_count
	   FROM products 
	   GROUP BY products.productCode) AS counts) THEN 'TARGET 4'
	   END keterangan
		FROM customers 
		JOIN orders USING (customernumber)
		JOIN orderdetails USING (ordernumber)
		JOIN products USING (productcode)
		WHERE LEFT(productname, 4) LIKE '19%'
		GROUP BY customernumber
		HAVING keterangan IS NOT NULL
		
UNION 

SELECT customerName, GROUP_CONCAT(LEFT(productName, 4)) AS 'Tahun Pembuatan Produk', 
COUNT(productCode) 'Jumlah Produk', SUM(DATEDIFF(shippedDate, orderDate)) 'Total Durasi Pengiriman',
case
   when MONTH(orderDate) % 2 = 1 AND COUNT(productCode) > 3 * (SELECT MIN(product_count)
	   FROM (SELECT COUNT(productCode) AS product_count
	   FROM products 
	   GROUP BY productCode) AS counts) THEN 'TARGET 5'
   when MONTH(orderDate) % 2 = 0 AND COUNT(productCode) > 3 * (SELECT MIN(product_count)
	   FROM (SELECT COUNT(productCode) AS product_count
		FROM products
	   GROUP BY productCode) AS counts) THEN 'TARGET 6'
	   END keterangan
		FROM customers 
		JOIN orders USING (customernumber)
		JOIN orderdetails USING (ordernumber)
		JOIN products USING (productcode)
		WHERE LEFT(productname, 4) LIKE '20%'
		GROUP BY customernumber
		HAVING keterangan IS NOT NULL;