CREATE DATABASE praktikum3;

USE praktikum3;

-- membuat tabel mahasiswa
CREATE TABLE mahasiswa(
	NIM VARCHAR(10) PRIMARY KEY,
	Nama VARCHAR(50) NOT NULL,
	Kelas CHAR(1) NOT NULL,
	Status VARCHAR(50) NOT NULL,
	Nilai INT(11)
);
	
SELECT*FROM mahasiswa;

-- menambahkan data mahasiswa
INSERT INTO mahasiswa (NIM, Nama, Kelas, Status, Nilai)
VALUES
    ('H071241056', 'Kotlin', 'A', 'Hadir', 100),
    ('H071241060', 'Pitonia', 'A', 'Alfa', 85),
    ('H071241063', 'Javano', 'A', 'Hadir', 50),
    ('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65),
    ('H071241066', 'Pihap E', 'B', 'Hadir', 85),
    ('H071241079', 'Ruby', 'B', 'Alfa', 90);
    
-- memindahkan mahasiswa yang alfa dan mendapatkan nilai 0 ke kelas c
UPDATE mahasiswa
SET Kelas = 'C', Nilai = 0
WHERE Status = 'Alfa';

-- menghapus mahasiswa yang dari kelas dan nilainya lebih besar  dari 90
DELETE FROM mahasiswa
WHERE Kelas = 'A' AND Nilai > 90;

-- menambahkan data mahasiswa pindahan dan tidak memiliki nilai
INSERT INTO mahasiswa (NIM, Nama, Kelas, Status)
VALUES
    ('H071221025', 'Rezqia Nurqalbi', 'A', 'pindahan');

-- mengupdate mahasiwa yang alfa sudah melakukan remedial dan mendaptkan nilai 50
UPDATE mahasiswa
SET Nilai = 50
WHERE Status = 'Alfa';

--  seluruh mahasiswa di gabungkan dalam 1 kelas yaitu kelas A
UPDATE mahasiswa
SET Kelas = 'A';

-- soal tambahan
INSERT INTO mahasiswa (NIM, Nama, Kelas, Status, Nilai)
VALUES ('H071221009','Lia' ,'','Hadir', 80);