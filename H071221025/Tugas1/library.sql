-- membuat database "library" 
CREATE DATABASE library

-- Menggunakan database "library"
USE library

-- Membuat tabel "books"
CREATE TABLE books(
id INT AUTO_INCREMENT PRIMARY KEY,
isbn VARCHAR(50) UNIQUE,
title VARCHAR(50) NOT NULL,
pages INT,
summary TEXT,
genre VARCHAR(50) NOT NULL
);

-- Modifikasi atribut isbn menjadi char dengan panjang 13 karakter
ALTER TABLE books
MODIFY isbn CHAR(13);

-- Hapus attribut summary
ALTER TABLE books
DROP COLUMN summary;

-- tampilkan struktur tabel books
DESCRIBE books
