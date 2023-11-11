USE classicmodels;

-- 1.
SELECT YEAR(orderdate) 'Tahun',
		COUNT(ordernumber) 'Jumlah Pesanan',
		CASE
			WHEN COUNT(ordernumber) > 150 
				THEN 'Banyak'
			WHEN COUNT(ordernumber) < 75 
				THEN 'Sedikit'
			ELSE 'Sedang'
		END 'Kategori Pesanan'
FROM orders
GROUP BY `Tahun`
ORDER BY COUNT(ordernumber) desc;

-- 2.
SELECT CONCAT(e.firstname, ' ', e.lastname) 'Nama Pegawai',
		SUM(p.amount) 'Gaji',
		CASE
			WHEN SUM(p.amount) > (
					SELECT AVG(`Total`)
					FROM (SELECT SUM(p2.amount) 'Total'
							FROM payments p2
							JOIN customers c2
							USING (customernumber)
							JOIN employees e2
							ON c2.salesRepEmployeeNumber = e2.employeeNumber
							GROUP BY e2.employeeNumber) AS a
					)THEN 'Diatas rata-rata'
			ELSE 'Dibawah rata-rata'
		END 'Kategori Gaji'
FROM employees e
JOIN customers c
ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments p
USING (customernumber)
GROUP BY e.employeeNumber
ORDER BY SUM(p.amount) desc;

-- 3.
SELECT
    c.customerName 'Nama Pelanggan',
    GROUP_CONCAT(LEFT(p.productName, 4)) 'Tahun Pembuatan Produk',
    COUNT(p.productCode) 'Jumlah Produk',
    SUM(DATEDIFF(o.shippedDate, o.orderDate)) 'Total Durasi Pengiriman',
    CASE
        WHEN 
            MONTH(o.orderDate) % 2 = 1 AND
            SUM(DATEDIFF(o.shippedDate, o.orderDate)) > (
                SELECT AVG(`Total`) 
                FROM (SELECT SUM(DATEDIFF(o2.shippedDate, o2.orderDate)) 'Total'
                		FROM orders o2
                		GROUP BY customernumber) AS a
            ) THEN 'TARGET 1'
        
        WHEN 
            MONTH(o.orderDate) % 2 = 0 AND
            SUM(DATEDIFF(o.shippedDate, o.orderDate)) > (
                SELECT AVG(`Total`) 
                FROM (SELECT SUM(DATEDIFF(o2.shippedDate, o2.orderDate)) 
                		'Total'
                		FROM orders o2
                		GROUP BY customernumber) AS a
            ) THEN 'TARGET 2'
     END 'Keterangan'
FROM customers c
JOIN orders o 
USING (customernumber)
JOIN orderdetails od
USING (ordernumber)
JOIN products p
USING (productcode)
WHERE p.productName LIKE '18%'
GROUP BY c.customernumber
HAVING `Keterangan` IS NOT NULL

UNION

SELECT
    c.customerName 'Nama Pelanggan',
    GROUP_CONCAT(LEFT(p.productName, 4)) 'Tahun Pembuatan Produk',
    COUNT(p.productCode) 'Jumlah Produk',
    SUM(DATEDIFF(o.shippedDate, o.orderDate)) 'Total Durasi Pengiriman',
    CASE
        WHEN 
            MONTH(o.orderDate) % 2 <> 0 AND
            COUNT(p.productCode) > 10 * (
                SELECT AVG(product_count)
                FROM (
					 SELECT COUNT(p2.productCode) AS product_count
                    FROM products p2
                    GROUP BY p2.productCode
					 ) AS counts
				)   
				THEN 'TARGET 3'
				
        WHEN 
            MONTH(o.orderDate) % 2 = 0 AND
            COUNT(p.productCode) > 10 * (
                SELECT AVG(product_count)
                FROM (
					 SELECT COUNT(p2.productCode) AS product_count
                    FROM products p2
                    GROUP BY p2.productCode
					 ) AS counts
				)   
            THEN 'TARGET 4'
    END 'Keterangan'
FROM customers c
JOIN orders o 
USING (customernumber)
JOIN orderdetails od
USING (ordernumber)
JOIN products p
USING (productcode)
WHERE p.productName LIKE '19%'
GROUP BY c.customernumber
HAVING `Keterangan` IS NOT NULL
 	
UNION 

SELECT
    c.customerName 'Nama Pelanggan',
    GROUP_CONCAT(LEFT(p.productName, 4)) 'Tahun Pembuatan Produk',
    COUNT(p.productCode) 'Jumlah Produk',
    SUM(DATEDIFF(o.shippedDate, o.orderDate)) 'Total Durasi Pengiriman',
    	CASE
        WHEN 
            MONTH(o.orderDate) % 2 <> 0 AND
            COUNT(p.productCode) > 3 * (
                SELECT MIN(product_count)
                FROM (
                    SELECT COUNT(p2.productCode) AS product_count
                    FROM products p2
                    GROUP BY p2.productCode
                ) AS counts
				)
            THEN 'TARGET 5'
        
        WHEN 
            MONTH(o.orderDate) % 2 = 0 AND
            COUNT(p.productCode) > 3 * (
                SELECT MIN(product_count)
                FROM (
                    SELECT COUNT(p2.productCode) AS product_count
                    FROM products p2
                    GROUP BY p2.productCode
                ) AS counts
				)
            THEN 'TARGET 6'
    END 'Keterangan'
FROM customers c
JOIN orders o 
USING (customernumber)
JOIN orderdetails od
USING (ordernumber)
JOIN products p
USING (productcode)
WHERE productName LIKE '20%'
GROUP BY c.customernumber
HAVING `Keterangan` IS NOT NULL;