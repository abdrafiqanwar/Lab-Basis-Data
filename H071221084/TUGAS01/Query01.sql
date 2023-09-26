CREATE DATABASE library;

USE library;

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    isbn CHAR(13) UNIQUE NOT NULL,
    title VARCHAR(50) NOT NULL,
    pages INT,
    summary TEXT,
    genre VARCHAR(50) NOT NULL
);

DESCRIBE books;