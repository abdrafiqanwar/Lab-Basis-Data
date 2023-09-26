-- membuat database db_praktikum
CREATE DATABASE db_praktikum

-- menggunakan database db_praktikum
USE db_praktikum

-- Membuat tabel students
CREATE TABLE students (
	name VARCHAR(50) NOT NULL,
	email VARCHAR(255) UNIQUE,
	gender CHAR(1),
	student_id INT(11) PRIMARY KEY 
)

-- Membuat tabel classes
CREATE TABLE classes (
	class_name VARCHAR(50),
	class_id INT(11) PRIMARY KEY AUTO_INCREMENT 
)

-- Membuat tabel class_student
CREATE TABLE class_student (
	grade CHAR(1) DEFAULT 'E',
	student_id INT(11),
	class_id INT(11),
	enrollment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
	
	FOREIGN KEY (student_id) REFERENCES students(student_id),

	FOREIGN KEY (class_id) REFERENCES classes(class_id)
)

-- Menampilkan daftar tabel yang ada di database
SHOW TABLES;

-- Menampilkan struktur tabel "classes"
DESCRIBE classes