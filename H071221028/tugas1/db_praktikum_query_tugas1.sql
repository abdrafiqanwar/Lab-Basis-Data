CREATE DATABASE IF NOT EXISTS db_praktikum;
USE db_praktikum;

DROP TABLE IF EXISTS class_student;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;

CREATE TABLE IF NOT EXISTS students(
	student_id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(50),
	email VARCHAR(255) UNIQUE,
	gender CHAR(1)
);

CREATE TABLE IF NOT EXISTS classes(students
	class_id INT AUTO_INCREMENT PRIMARY KEY ,
	class_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS class_student(
	enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
	grade CHAR(1) DEFAULT 'E',
	student_id INT,
	class_id INT,
	FOREIGN KEY (`student_id`) REFERENCES students (`student_id`),
	FOREIGN KEY (`class_id`) REFERENCES classes (`class_id`)
);