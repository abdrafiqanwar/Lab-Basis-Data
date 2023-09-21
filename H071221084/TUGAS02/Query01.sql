SELECT customername, city, country FROM customers
WHERE country = 'usa'

SELECT DISTINCT productvendor FROM products

SELECT * FROM payments
WHERE customerNumber = 124
ORDER BY paymentDate DESC

SELECT productname AS 'Nama produk', buyprice AS 'Harga beli', quantityinstock AS 'Jumlah dalam stok' FROM products
wHERE quantityinstock > 1000 AND quantityinstock < 3000
ORDER BY buyprice
LIMIT 5

SELECT orderdate, status FROM orders
WHERE orderdate > '2004-01-02' AND orderdate < '2004-12-17' 
