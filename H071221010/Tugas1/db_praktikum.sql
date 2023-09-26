-- membuat database db_praktikum--
CREATE DATABASE db_praktikum;

-- membuat table students beserta atributnya
CREATE TABLE students (
name VARCHAR(50) NOT NULL,
email VARCHAR(255) UNIQUE,
gender CHAR(1),
student_id INT(11) PRIMARY KEY);

-- membuat table classes beserta atributnya
CREATE TABLE classes (
class_name VARCHAR(50),
class_id INT(11) PRIMARY KEY AUTO_INCREMENT);

-- membuat table class_student beserta atributnya
CREATE TABLE class_student (
grade CHAR(1) DEFAULT 'E',
student_id INT(11),
class_id INT(11),
enrollment_id INT(11) PRIMARY KEY AUTO_INCREMENT,
FOREIGN KEY(class_id) REFERENCES classes(class_id),
FOREIGN KEY(student_id) REFERENCES students(student_id));
