CREATE DATABASE library

USE library
DESCRIBE books
CREATE TABLE books (
ID INT PRIMARY KEY,
ISBN VARCHAR(50) UNIQUE,
Title VARCHAR(50) NOT NULL,
Pages INT,
Summary TEXT,
Genre VARCHAR(50) NOT NULL
);


ALTER TABLE books
MODIFY ISBN CHAR(13);

ALTER TABLE books DROP Summary
