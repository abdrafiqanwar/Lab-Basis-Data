# Nomor 1
SELECT 
	c.customerName 'Nama Customer', 
	c.country 'Negara', 
	p.paymentDate 'tanggal'
FROM customers c
JOIN payments p
ON c.customerNumber = 
p.customerNumber
WHERE p.paymentDate > "2004-12-31"
ORDER BY p.paymentDate;

# Nomor 2
SELECT DISTINCT c.customerName 'Nama customer', pr.productName, pl.textDescription
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderdetails od
ON o.orderNumber = od.orderNumber
JOIN products pr
ON od.productCode = pr.productCode
JOIN productlines pl
ON pr.productLine = pl.productLine
WHERE pr.productName = 'The Titanic';

# Nomor 3
-- add table status
ALTER TABLE products
ADD status VARCHAR(20);

--	mengupdate status jadi best selling apabila memiliki quantityOrdered tertinggi
UPDATE products
SET STATUS = 'best selling'
WHERE productCode = 'S12_4675';

-- menampilkan produk best selling yang memiliki quantityOrdered tertinggi
SELECT pr.productCode, pr.productName, od.quantityOrdered, pr.status 
FROM products pr
JOIN orderdetails od
ON pr.productCode = od.productCode
ORDER BY quantityOrdered DESC LIMIT 1;

# Nomor 4
-- Delete FK orders -> customers dan Add New FK On delete cascade
ALTER TABLE orders
DROP FOREIGN KEY orders_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT orders_ibfk_1
FOREIGN KEY (customerNumber)
REFERENCES customers (customerNumber)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Delete FK payments -> customers dan Add New FK On delete cascade
ALTER TABLE payments
DROP FOREIGN KEY payments_ibfk_1;

ALTER TABLE orders
ADD CONSTRAINT payments_ibfk_1
FOREIGN KEY (customerNumber)
REFERENCES customers (customerNumber)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- Delete FK orderdetails -> orders dan Add New FK On delete cascade
ALTER TABLE orderdetails
DROP FOREIGN KEY orderdetails_ibfk_1;

ALTER TABLE orderdetails
ADD CONSTRAINT orderdetails_ibfk_1
FOREIGN KEY (orderNumber)
REFERENCES orders (orderNumber)
ON DELETE CASCADE
ON UPDATE CASCADE;

-- menghapus data pelanggan yang statusnya cancelled
DELETE c
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'cancelled';

-- Cek Data Cancelled
SELECT * FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'cancelled';

# nomor 5 soal tambahan 
-- (tampilkan costumer yang memiliki salesRepEmployeeNumber di tabel costumers dan employeeNumber di employees dimana si pelanggan ini berasal dari jepang)
-- (secara tidak langsung costumer di sini adalah employee juga)
SELECT c.salesRepEmployeeNumber, e.employeeNumber, c.customerName, c.country
FROM customers c
JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE c.country = 'japan';