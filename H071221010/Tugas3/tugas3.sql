USE praktikum3;

-- nomor 1
CREATE TABLE mahasiswa (
NIM VARCHAR(10) PRIMARY KEY,
Nama VARCHAR(50) NOT NULL,
Kelas CHAR(1) NOT NULL,
Status VARCHAR(50) NOT NULL,
Nilai INT(11));

INSERT INTO mahasiswa
VALUES ('H071241056', 'Kotlina', 'A', 'Hadir', 100),
('H071241060', 'Pitonia', 'A', 'Alfa', 85),
('H071241063', 'Javano', 'A', 'Hadir', 50),
('H071241065', 'Ciplus Kuadra', 'B', 'Hadir', 65),
('H071241066', 'Pihap E', 'B', 'Hadir', 85),
('H071241079', 'Ruby', 'B', 'Alfa', 90);

-- nomor2
UPDATE mahasiswa SET Nilai = 0, Kelas = 'C' WHERE Status = 'Alfa';

-- nomor 3
DELETE FROM mahasiswa WHERE Kelas = 'A' AND Nilai > 90;

-- nomor 4
INSERT INTO mahasiswa (NIM, Nama, Kelas, Status)
VALUE ('H071221010', 'Andi Alisha Faiqihah', 'A', 'Pindahan');

UPDATE mahasiswa SET Nilai = 50 WHERE Status = 'Alfa';

UPDATE mahasiswa SET Kelas = 'A';

-- nomor 5 (input data sembarang yang nanti di tabelnya ada blank dan null)
INSERT INTO mahasiswa (NIM, Nama, Kelas, Nilai)
VALUE('H071261010', 'Aclisung', 'A', NULL);