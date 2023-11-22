SELECT lastName, firstName 
FROM employees 
WHERE officeCode IN (SELECT officeCode
	 FROM offices 
	 WHERE country ='USA')


SELECT customerNumber, customerName,
(SELECT COUNT(*) FROM payments WHERE customers.customerNumber =
payments.customerNumber) AS orderNumber
FROM customers

SELECT customers.customerNumber, customers.customerName,
(SELECT COUNT( customers

SELECT nama_pelanggan, produk
FROM (
    SELECT c.nama_pelanggan, p.produk
    FROM customers c
    JOIN purchases p ON c.id_pelanggan = p.id_pelanggan
    WHERE c.id_pelanggan = 124
) AS subquery_result;

SELECT p.productCode, p.productName, p.buyPrice, p.productLine
FROM products p
WHERE p.buyPrice < (
    SELECT AVG(p2.buyPrice)
    FROM products p2
    WHERE p2.productLine = p.productLine
);


SELECT p.productCode, p.productName
FROM products p
WHERE p.productCode NOT IN (
    SELECT od.productCode
    FROM orderdetails od
    WHERE od.orderNumber IN (
        SELECT o.orderNumber
        FROM orders o
        WHERE o.customerNumber = 151
    )
);

#5
tampilkan anama pelanggan yang memiliki nilai pembelian (jumlah barang sama harga satuan)


SELECT c.customerName, (SELECT p.productName
                        FROM customers c
                        JOIN orders o ON c.customerNumber = o.customerNumber
                        JOIN orderdetails od ON o.orderNumber = od.orderNumber
                        JOIN products p ON od.productCode = p.productCode
                        WHERE c.customerNumber = 124) AS products_purchased
FROM customers c
WHERE c.customerNumber = 124;

SELECT c.customerName, (SELECT p.productName
                        FROM customers c
                        JOIN orders o ON c.customerNumber = o.customerNumber
                        JOIN orderdetails od ON o.orderNumber = od.orderNumber
                        JOIN products p ON od.productCode = p.productCode
                        WHERE c.customerNumber = 124) AS products_purchased
FROM customers c
WHERE c.customerNumber = 124;

SELECT c.customerName, 
       (SELECT GROUP_CONCAT(p.productName SEPARATOR ', ')
        FROM customers c
        JOIN orders o ON c.customerNumber = o.customerNumber
        JOIN orderdetails od ON o.orderNumber = od.orderNumber
        JOIN products p ON od.productCode = p.productCode
        WHERE c.customerNumber = 124) AS products_purchased
FROM customers c
WHERE c.customerNumber = 124;

