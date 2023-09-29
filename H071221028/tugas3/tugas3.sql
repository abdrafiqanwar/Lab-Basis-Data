CREATE DATABASE  praktikum3;
USE praktikum3;

DROP TABLE mahasiswa;

CREATE TABLE mahasiswa (
	NIM VARCHAR(10)  PRIMARY KEY ,
	Nama VARCHAR(50) NOT NULL,
	Kelas CHAR(1) NOT NULL,
	`Status` VARCHAR(50) NOT NULL,
	Nilai INT(11)
	
);

DESCRIBE mahasiswa;



INSERT INTO mahasiswa
VALUES
	('H071241056', 'Kotlina', 'A', 'Hadir', 100),
	('H071241060', 'Pitonia', 'A', 'Alfa', 85),
	('H071241063', 'Javano', 'A', 'Hadir', 50),
	('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65),
	('H071241066', 'Pihap E', 'B', 'Hadir', 85),
	('H071241079', 'Ruby', 'B', 'Alfa', 90);
	
UPDATE mahasiswa
SET Nilai = 0, Kelas = 'C'
WHERE `Status`= 'Alfa';

DELETE FROM mahasiswa 
WHERE Kelas='A' AND Nilai >90;

INSERT INTO mahasiswa
	(NIM,Nama,Kelas,`Status`)
VALUES 
	('H071221028', 'Nadjwa Amalia', 'B', 'Pindahan');	
	
SELECT * FROM mahasiswa;

UPDATE mahasiswa
SET Nilai = 50
WHERE `Status`='Alfa';	

UPDATE mahasiswa
SET Kelas='A';

`INSERT DATA baru salah satu kolom berisi blank dan NULL``

INSERT INTO mahasiswa
(NIM, Nama,	`Status`,Nilai)
VALUES 
('H071221029','awa','mahasiswa', NULL);

UPDATE mahasiswa
SET Kelas = 'A'
WHERE kelas = '';

UPDATE mahasiswa
SET Nilai = 90
WHERE Nilai IS  NULL;

