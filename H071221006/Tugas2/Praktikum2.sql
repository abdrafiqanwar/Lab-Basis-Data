USE classicmodels;

-- Nomor1
SELECT customerName, city, country FROM customers WHERE country = 'USA';

-- Nomor2
SELECT DISTINCT productVendor FROM products;

-- Nomor3
SELECT * FROM payments WHERE customerNumber = 124 ORDER BY paymentDate DESC;

-- Nomor4
SELECT productName AS 'Nama Produk', buyPrice AS 'Harga Beli', quantityInStock AS 'Jumlah dalam Stok' FROM products WHERE quantityInStock >= 1000 AND quantityInStock <= 3000 ORDER BY buyPrice ASC LIMIT 5, 10

-- Nomor5
SELECT orderDate, status FROM orders WHERE orderDate > '2003-12-09' AND orderDate < '2005-01-05'; 


