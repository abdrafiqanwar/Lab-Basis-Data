-- No 1
CREATE DATABASE praktikum3;
USE praktikum3;
CREATE TABLE mahasiswa (
	NIM VARCHAR(10) PRIMARY KEY,
	Nama VARCHAR(50) NOT NULL,
	Kelas CHAR(1) NOT NULL,
	STATUS VARCHAR(50) NOT NULL,
	Nilai INT);

INSERT INTO mahasiswa
					 VALUES ("H071221056", "Kotlina", "A", "Hadir", 100),
					 		 ("H071221060", "Pitonia", "A", "Alfa", 85),
					 		 ("H071221063", "Javano", "A", "Hadir", 50),
					 		 ("H071241065", "Ciplus Kuadra", "B", "Hadir", 65),
					 		 ("H071241066", "Pihap E", "B", "Hadir", 85),
					 		 ("H071241079", "Ruby", "B", "Alfa", 90);
SELECT* FROM mahasiswa;

-- No 2
UPDATE mahasiswa
SET Nilai = 0, Kelas = "C"
WHERE STATUS = "Alfa";
SELECT* FROM mahasiswa;

-- No 3
DELETE FROM mahasiswa
WHERE Kelas = "A" AND  Nilai > 90;
SELECT* FROM mahasiswa;

-- No 4
INSERT INTO mahasiswa (NIM, Nama, Kelas, STATUS)
					 VALUE ("H071221073", "Orii", "D", "Pindahan");
SELECT* FROM mahasiswa;

UPDATE mahasiswa
SET Nilai = 50
WHERE STATUS = "Alfa";
SELECT* FROM mahasiswa;

UPDATE mahasiswa
SET kelas = "A";
SELECT* FROM mahasiswa;


-- No 5
INSERT INTO mahasiswa
				VALUE ("H071221075", "Akbar", "D");