CREATE DATABASE praktikum3
USE praktikum3

-- DROP DATABASE praktikum3
-- Nomor 1
DROP TABLE mahasiswa
CREATE TABLE mahasiswa (
NIM VARCHAR(10) PRIMARY KEY,
Nama VARCHAR(50) NOT NULL,
Kelas CHAR(1) NOT NULL,
STATUS VARCHAR(50) NOT NULL,
Nilai INT(11) 
);
DESCRIBE mahasiswa

SELECT * FROM mahasiswa
INSERT INTO mahasiswa
VALUES 
	("H071241056", "Kotlina", "A", "Hadir", 100),
	("H071241060", "Pitona", "A", "Alfa", 85),
	("H071241063", "Javano", "A", "Hadir", 50),
	("H071241065", "Ciplus Kuadra", "B", "Hadir", 65),
	("H071241066", "Pihap E", "B", "Hadir", 85),
	("H071241079", "Ruby", "B", "Alfa", 90);
	
-- Nomor2
UPDATE mahasiswa
SET Kelas = "C", Nilai = 0
WHERE STATUS = "Alfa";

-- Nomor3
DELETE FROM mahasiswa
WHERE Nilai >= 90;

-- Nomor4
INSERT INTO mahasiswa
VALUES ("H071221006", "Minhajul Khairi", "A", "Pindahan", NULL);

DELETE FROM mahasiswa
WHERE NIM = "0";

UPDATE mahasiswa
SET Nilai = 50
WHERE STATUS = "Alfa";

UPDATE mahasiswa
SET Kelas = "A";

-- Nomor5
INSERT INTO mahasiswa(NIM, Kelas, STATUS)
VALUES ("H071221190", "C", "Pindahan");

