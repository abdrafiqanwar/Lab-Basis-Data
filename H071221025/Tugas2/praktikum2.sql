USE classicmodels;

-- no 1
SELECT customerName, city, country
FROM customers
WHERE country = 'USA';

-- no 2
SELECT DISTINCT productVendor
FROM products;

-- no 3
SELECT customerNumber, checkNumber, paymentDate, amount
FROM payments
WHERE customerNumber = 124
ORDER BY paymentDate DESC;

-- no 4
SELECT productName AS 'nama produk', buyPrice AS 'harga beli', quantityInStock AS  'stok'
FROM products 
WHERE quantityInStock >= 1000 AND quantityInStock <=3000
ORDER BY buyPrice
LIMIT 5,10;

-- no 5
SELECT * FROM orders WHERE comments IS NULL ORDER BY orderdate;


