USE classicmodels;

-- No 1
SELECT YEAR(orderdate) tahun, COUNT(ordernumber) jumlah_pesanan,
	CASE
		WHEN COUNT(ordernumber) > 150 THEN 'Banyak'
		WHEN COUNT(ordernumber) < 75 THEN 'sedikit'
		ELSE 'sedang'
	END
AS kategori
FROM orders
GROUP BY tahun
ORDER BY COUNT(ordernumber) DESC;

-- No 2
SELECT nama_pegawai, gaji,
  CASE
    WHEN gaji > avg_gaji THEN 'Di atas rata-rata'
    WHEN gaji < avg_gaji THEN 'Di bawah rata-rata'
    ELSE 'Rata-rata'
  END 
AS kategori_gaji
FROM (
  SELECT
    CONCAT(e.firstName, ' ', e.lastName) AS nama_pegawai,
    SUM(p.amount) AS gaji,
    AVG(SUM(p.amount)) OVER () AS avg_gaji
  FROM
    employees AS e
    JOIN customers AS c ON c.salesrepemployeenumber = e.employeeNumber
    JOIN payments AS p USING (customerNumber)
  GROUP BY
    e.firstName, e.lastName
) AS salary_info;

SELECT CONCAT(e.firstName , '' ,e.lastName) AS 'Nama Pegawai', SUM(p.amount) AS 'Gaji', 
	  CASE
	    WHEN SUM(p.amount) >= (SELECT AVG(Total)
	    FROM (SELECT SUM(p.amount) AS 'Total'
		 FROM employees e
		JOIN customers c
		ON e.employeeNumber = c.salesRepEmployeeNumber
		JOIN payments p
		USING(customerNumber)
		GROUP BY e.employeeNumber) AS Total) 
		then 'Di atas rata-rata'
	    ELSE 'Dibawah Rata-rata'
	  END 
	AS 'Riwayat'
FROM employees e
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
JOIN payments p
USING(customerNumber)
GROUP BY e.employeeNumber


-- No 3
SELECT
    CONCAT(employees.firstname , '' ,employees.lastname) AS 'Nama Pelanggan',
     GROUP_CONCAT(LEFT(products.productName, 4)) AS 'Tahun Pembuatan',
    COUNT(products.productCode) AS 'Jumlah Produk',
    TIMESTAMPDIFF(DAY, orders.orderDate, orders.shippedDate) AS Durasi_Pengiriman,
    CASE
        WHEN 
            'Tahun Pembuatan' < 1900 AND 'Tahun Pembuatan' % 2 != 0
            AND TIMESTAMPDIFF(DAY, orders.orderDate, orders.shippedDate) > (SELECT AVG(TIMESTAMPDIFF(DAY, orders.orderDate, orders.shippedDate)) FROM orders)
        THEN 'TARGET 1'
        
        WHEN 
            'Tahun Pembuatan' < 1900 AND 'Tahun Pembuatan' % 2 = 0
            AND TIMESTAMPDIFF(DAY, orders.orderDate, orders.shippedDate) > (SELECT AVG(TIMESTAMPDIFF(DAY, orders.orderDate, orders.shippedDate)) FROM orders)
        THEN 'TARGET 2'
        
        ELSE 'Tidak Ada Target'
    END AS Keterangan

FROM employees
JOIN customers
ON customers.salesRepEmployeeNumber = employees.employeenumber
JOIN orders
USING(customerNumber)
JOIN orderdetails
USING(ordernumber)
JOIN products
USING(productCode)

GROUP BY customers.customerName, 'Tahun Pembuatan'
ORDER BY customers.customerName, 'Tahun Pembuatan';

