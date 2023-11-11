# NOMOR 1
SELECT YEAR(orderDate) tahun, 
		COUNT(orderNumber) `jumlah pesanan`,
	case 
		when COUNT(orderNumber) > 150 then 'banyak'
		when COUNT(orderNumber) < 75 then 'sedikit'
		ELSE 'sedang'
	END AS `kategori pesanan`
FROM orders
GROUP BY YEAR(orderDate)
ORDER BY `kategori pesanan`;

# NOMOR 2
SELECT CONCAT(e.firstName, " ", e.lastName) `nama pegawai`, 
		SUM(py.amount) gaji,
	case 
		when SUM(py.amount) > (SELECT AVG(total_gaji) FROM(SELECT SUM(py.amount) AS total_gaji FROM payments py
																		JOIN customers c USING(customerNumber)
																		JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
																		GROUP BY e.employeeNumber
																		) gajitotal
										) then 'di atas rata rata'
		ELSE 'di bawah rata rata'
	END AS `kategori gaji`
FROM payments py
JOIN customers c USING(customernumber)
JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber
ORDER BY `nama pegawai`;

# NOMOR 3
SELECT c.customerName Pelanggan, 
		GROUP_CONCAT(LEFT(p.productName, 4)) Tahun_Pembuatan, 
		COUNT(p.productName) `Jumlah Produk`,
		SUM(DATEDIFF(o.shippedDate,o.orderDate)) `Total Durasi Pengiriman`,
		case
			when MONTH(o.orderDate) % 2 = 1 AND SUM(DATEDIFF(o.shippedDate, o.orderDate)) > (SELECT AVG(total_durasi) FROM (SELECT SUM(DATEDIFF(shippedDate, orderDate)) total_durasi 
																																							FROM orders 
																																							GROUP BY customerNumber
																																						 	) AS durasitotal
																													  ) then 'TARGET 1'
		when MONTH(o.orderDate) % 2 = 0 AND SUM(DATEDIFF(o.shippedDate, o.orderDate)) > (SELECT AVG(total_durasi) FROM (SELECT SUM(DATEDIFF(shippedDate, orderDate)) total_durasi 
																																							FROM orders 
																																							GROUP BY customerNumber
																																						 	) AS durasitotal
																												  ) then 'TARGET 2'						
		END AS Keterangan
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products p USING(productCode)
WHERE p.productName LIKE '18%'
GROUP BY c.customerName
HAVING Keterangan IS NOT NULL
UNION
SELECT c.customerName Pelanggan, 
		GROUP_CONCAT(LEFT(p.productName, 4)), 
		COUNT(p.productName),
		SUM(DATEDIFF(o.shippedDate,o.orderDate)),
		case
			when MONTH(o.orderDate) % 2 = 1 AND COUNT(p.productName) > 10*(SELECT AVG(total_produk) FROM (SELECT COUNT(productName) total_produk 
																																		FROM products 
																																		GROUP BY productName
																																	 	) AS produktotal
																							  ) then 'TARGET 3'
			when MONTH(o.orderDate) % 2 = 0 AND COUNT(p.productName) > 10*(SELECT AVG(total_produk) FROM (SELECT COUNT(productName) total_produk 
																																		FROM products 
																																		GROUP BY productName
																																	 	) AS produktotal
																							  ) then 'TARGET 4'						
		END AS Keterangan
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products p USING(productCode)
WHERE p.productName LIKE '19%'
GROUP BY c.customerName
HAVING Keterangan IS NOT NULL
UNION
SELECT c.customerName, 
		GROUP_CONCAT(LEFT(p.productName, 4)), 
		COUNT(p.productName),
		SUM(DATEDIFF(o.shippedDate,o.orderDate)),
		case
			when MONTH(o.orderDate) % 2 = 1 AND COUNT(p.productName) > 3*(SELECT MIN(total_produk) FROM (SELECT COUNT(productName) total_produk 
																																		FROM products 
																																		GROUP BY productName
																																	  ) AS produktotal
																							 ) then 'TARGET 5'
			when MONTH(o.orderDate) % 2 = 0 AND COUNT(p.productName) > 3*(SELECT MIN(total_produk) FROM (SELECT COUNT(productName) total_produk 
																																		FROM products 
																																		GROUP BY productName
																																	  ) AS produktotal
																							 ) then 'TARGET 6'						
		END AS Keterangan
FROM customers c
JOIN orders o USING(customerNumber)
JOIN orderdetails od USING(orderNumber)
JOIN products p USING(productCode)
WHERE p.productName LIKE '2%'
GROUP BY c.customerName
HAVING Keterangan IS NOT NULL;