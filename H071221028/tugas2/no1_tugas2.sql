USE classicmodels;

```no1
SELECT customerName, city, country FROM customers WHERE country = 'USA';

``NO2
```pake distinct untuk mengekstrak karekter unik yang di minta pada soal.
SELECT distinct productVendor FROM products;


```no 3
SELECT* FROM payments WHERE customerNumber = '124' ORDER BY paymentDate DESC;

```no4
SELECT 
		productName AS "Nama Produk",
		buyPrice AS "Harga Beli",
		quantityInStock AS "Jumlah Dalam Stock"
FROM 
		products 
WHERE 
		quantityInStock 
		>= 1000 AND quantityInStock<=3000
ORDER BY
		buyPrice ASC
LIMIT 5,10;

SELECT orderDate, STATUS  FROM orders WHERE orderDate >= '2004-01-01' AND orderDate <= '2004-12-31';
	
SELECT * FROM orders;