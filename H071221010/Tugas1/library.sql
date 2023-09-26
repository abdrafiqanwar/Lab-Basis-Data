-- membuat database library
CREATE DATABASE library;

-- membuat table books beserta atribut di dalamnya
CREATE TABLE books (
id INT PRIMARY KEY,
isbn VARCHAR(50) UNIQUE,
title VARCHAR(50) NOT NULL,
pages INT,
summary TEXT,
genre VARCHAR(50) NOT NULL);

-- mengubah tipe data atribut isbn yang ada di table books
ALTER TABLE books
MODIFY isbn CHAR(13);

-- menghapus atribut summary dari table books
ALTER TABLE books
DROP summary;

-- menampilkan struktur table books
DESCRIBE books;
