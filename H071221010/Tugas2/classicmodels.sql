USE classicmodels;

-- nomor 1
SELECT customerName, city, country FROM customers WHERE country = 'USA';

-- nomor 2
SELECT DISTINCT productVendor FROM products;

-- nomor 3
SELECT customerNumber, checkNumber, paymentDate, amount FROM payments WHERE customerNumber = 124 ORDER BY paymentDate DESC;

-- nomor 4
SELECT productName AS 'Nama produk', buyPrice AS 'Harga beli', quantityInStock AS 'Jumlah dalam stok' FROM products WHERE quantityInStock > 1000 AND quantityInStock < 3000 ORDER BY buyPrice LIMIT 5, 10;

-- nomor 5 (tampilkan semua data yang ada pada tabel orders yang commentsnya null dan diurutkan berdasarkan orderDate dari yang terlama ke yang terbaru)
SELECT * FROM orders WHERE comments IS NULL ORDER BY orderDate;