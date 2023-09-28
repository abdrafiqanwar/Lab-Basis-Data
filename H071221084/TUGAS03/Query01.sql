CREATE DATABASE praktikum3; 

USE praktikum3;

CREATE TABLE mahasiswa (
NIM VARCHAR(10) PRIMARY KEY,
Nama VARCHAR(50) NOT NULL, 
Kelas CHAR(1) NOT NULL, 
Status VARCHAR(50) NOT NULL,
Nilai INT(11)
);

INSERT INTO mahasiswa 
VALUES('H071241056', 'Kotlina', 'A', 'Hadir', 100),
    	('H071241060', 'Pitonia', 'A', 'Alfa', 85),
    	('H071241063', 'Javano', 'A', 'Hadir', 50),
    	('H071241065', 'Ciplu Kuadra', 'B', 'Hadir', 65),
    	('H071241066', 'Pihap E', 'B', 'Hadir', 85),
    	('H071241079', 'Ruby', 'B', 'Alfa', 90);
SELECT * FROM mahasiswa;

UPDATE mahasiswa 
SET nilai = 0, kelas = 'C'
WHERE STATUS = 'Alfa';
SELECT * FROM mahasiswa;  

DELETE FROM mahasiswa
WHERE Nilai > 90;
SELECT * FROM mahasiswa;

INSERT INTO mahasiswa (nim, nama, kelas, status)
VALUES('H071221084', 'Imam', 'D', 'Pindahan');
SELECT * FROM mahasiswa;

UPDATE mahasiswa 
SET nilai = 50
WHERE STATUS = 'Alfa';
SELECT * FROM mahasiswa;

UPDATE mahasiswa 
SET kelas = 'A';
SELECT * FROM mahasiswa;

INSERT INTO mahasiswa (nim, kelas, STATUS)
VALUES ('H071221089', 'A', 'hadir');
SELECT * FROM mahasiswa;
	



