-- soal1
(SELECT customerName, productName, (buyprice*sum(quantityOrdered)) AS modal
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
GROUP BY customerName
ORDER BY modal DESC
LIMIT 3)
UNION
(SELECT customerName, productName, (buyprice*sum(quantityOrdered)) AS modal
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
GROUP BY customerName
ORDER BY modal
LIMIT 3);

-- soal2
SELECT CITY, COUNT(city) AS TOTAL
FROM (
   SELECT OFFICES.CITY FROM EMPLOYEES
	JOIN OFFICES USING(OFFICECODE)
	WHERE FIRSTNAME LIKE 'L%'

    UNION ALL

	SELECT C.CITY
	FROM CUSTOMERS C
	WHERE C.CUSTOMERNAME LIKE 'L%'
) AS EMPLOYEECUSTOMERCITIES
GROUP BY CITY
ORDER BY TOTAL DESC
LIMIT 1;

-- soal 3
SELECT CONCAT(e.firstName, ' ', e.lastName) AS `Nama Karyawan/Pelanggan`, 'employee' AS status
FROM employees e
WHERE e.officeCode IN (
  SELECT officeCode
  FROM employees
  GROUP BY officeCode
  HAVING COUNT(*) = (
    SELECT MIN(numEmployees)
    FROM (
      SELECT officeCode, COUNT(*) AS numEmployees
      FROM employees
      GROUP BY officeCode
    ) AS OfficeEmployeeCounts
  )
)
UNION
SELECT C.customerName AS `Nama Karyawan/Pelanggan`, 'Customer' AS status
FROM customers C
WHERE C.salesRepEmployeeNumber IN (
  SELECT employeeNumber
  FROM employees
  WHERE officeCode IN (
    SELECT officeCode
    FROM employees
    GROUP BY officeCode
    HAVING COUNT(*) = (
      SELECT MIN(numEmployees)
      FROM (
        SELECT officeCode, COUNT(*) AS numEmployees
        FROM employees
        GROUP BY officeCode
      ) AS OfficeEmployeeCounts
    )
  )
)
ORDER BY `Nama Karyawan/Pelanggan`;

-- soal 4
SELECT tanggal, GROUP_CONCAT(riwayat SEPARATOR  ' dan ') AS riwayat
FROM (
    SELECT orderDate as tanggal, 'memesan barang' as riwayat
    FROM orders
    WHERE MONTH(orderDate) = 4 AND YEAR(orderDate) = 2003
    UNION
    SELECT paymentDate as tanggal, 'membayar pesanan' as riwayat
    FROM payments
    WHERE MONTH(paymentDate) = 4 AND YEAR(paymentDate) = 2003
     ) as dataCustomers
GROUP BY tanggal
ORDER BY tanggal;

-- soal tambahan
SELECT customername, productname, quantityOrdered, productline
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
WHERE productline = 'Motorcycles'
UNION
SELECT customername, productname, quantityOrdered, productline
FROM customers
JOIN orders ON customers.customerNumber = orders.customerNumber
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
JOIN products ON orderdetails.productCode = products.productCode
WHERE quantityOrdered > 50;

