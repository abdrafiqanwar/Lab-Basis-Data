CREATE DATABASE kelas;

CREATE TABLE contoh1(
nama VARCHAR(100),
nim CHAR(10)
);

SELECT * FROM contoh1;
INSERT INTO contoh1 
VALUES('awa','H071221028');

START TRANSACTION;
INSERT INTO contoh1 
VALUES('freki','H071221029');

COMMIT /untuk simpan permanen

```untuk undo
ROLLBACK 


INSERT INTO contoh1 
VALUES('fara','H071221009');


INSERT INTO contoh1 
VALUES('nakita','H071221019');

BEGIN
DELETE FROM contoh1
WHERE nama = 'awa';

COMMIT
u

USE classicmodels

SELECT ordernumber, STATUS,
case 
when STATUS ='shipped' then 'dikirim'
when STATUS = 'cancelled' then 'batal'
ELSE 'unkknown'
END AS pesan
FROM orders

SELECT
    customers.customerName AS CustomerName,
    SUM(orderdetails.quantityOrdered) AS jumlah orderan
FROM
    customers 
JOIN
    orders ON customers.customerNumber = 
GROUP BY
    c.customerName
ORDER BY
    TotalOrderAmount DESC;
    

SELECT
    c.customerName AS CustomerName,
    SUM(od.quantityOrdered) AS TotalQuantityOrdered
FROM
    customers c
JOIN
    orders o ON c.customerNumber = o.customerNumber
JOIN
    orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY
    c.customerName
ORDER BY
    TotalQuantityOrdered DESC;

SELECT
    p.productName AS ProductName,
    SUM(od.quantityOrdered) AS TotalOrderedQuantity,
    o.orderDate AS OrderDate,
    p.buyPrice AS BuyPrice,
    p.MSRP AS SellPrice,
    SUM(od.quantityOrdered * p.buyPrice) AS TotalCost,
    SUM(od.quantityOrdered * p.MSRP) AS TotalRevenue,
    SUM(od.quantityOrdered * (p.MSRP - p.buyPrice)) AS TotalProfit
FROM
    products p
JOIN
    orderdetails od ON p.productCode = od.productCode
JOIN
    orders o ON od.orderNumber = o.orderNumber
JOIN
    customers c ON o.customerNumber = c.customerNumber
    
GROUP BY
    p.productCode, o.orderDate
ORDER BY
    TotalOrderedQuantity DESC;
    

SELECT
    p.productName AS ProductName,
    SUM(od.quantityOrdered) AS TotalOrderedQuantity,
    o.orderDate AS OrderDate,
    p.buyPrice AS BuyPrice,
    p.MSRP AS SellPrice,
    SUM(od.quantityOrdered * p.buyPrice) AS TotalCost,
    SUM(od.quantityOrdered * p.MSRP) AS TotalRevenue,
    SUM(od.quantityOrdered * (p.MSRP - p.buyPrice)) AS TotalProfit
FROM
    products p
JOIN
    orderdetails od ON p.productCode = od.productCode
JOIN
    orders o ON od.orderNumber = o.orderNumber
JOIN
    customers c ON o.customerNumber = c.customerNumber
WHERE
    p.productName LIKE '%Ferrari%'
GROUP BY
    p.productCode, o.orderDate
ORDER BY
    TotalOrderedQuantity DESC;

