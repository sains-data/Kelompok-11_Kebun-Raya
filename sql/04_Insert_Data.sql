USE KebunRaya_DWH;
GO

-------------------------------------------------------
-- INSERT DATA DIMENSI
-------------------------------------------------------

-- Dim_Pengunjung (5 + 300 random)
INSERT INTO Dim_Pengunjung VALUES
(301,'Rina Pratiwi','Mahasiswa','Lampung'),
(302,'Budi Santoso','Umum','Jakarta'),
(303,'Maya Lestari','Peneliti','Bandung'),
(304,'Andi Saputra','Wisatawan','Lampung'),
(305,'Sofia Anggraini','Pelajar','Palembang');

DECLARE @i INT = 306;
WHILE @i <= 600
BEGIN
    INSERT INTO Dim_Pengunjung(pengunjung_id,nama,kategori,asal)
    VALUES(@i,'Pengunjung '+CAST(@i AS VARCHAR),'Umum','Indonesia');
    SET @i = @i + 1;
END

-- Dim_Fasilitas
INSERT INTO Dim_Fasilitas VALUES
(201,'Greenhouse Anggrek','Rumah Tanam',50,'Zona Utama'),
(202,'Embung Utama','Air & Konservasi',200,'Tengah Kebun'),
(203,'Taman Labirin','Wisata',150,'Barat Kebun'),
(204,'Rumah Kaktus','Rumah Tanam',60,'Timur Kebun'),
(205,'Pusat Edukasi Botani','Edukasi',40,'Zona Edukasi');

-- Dim_Spesies
INSERT INTO Dim_Spesies VALUES
(101,'Anggrek Bulan','Anggrek','Indonesia'),
(102,'Kantong Semar','Non-Anggrek','Lampung'),
(103,'Mawar Merah','Non-Anggrek','Indonesia'),
(104,'Lavender Ungu','Non-Anggrek','Mediterania'),
(105,'Puring Hijau','Non-Anggrek','Indonesia');

-- Dim_Tanaman
INSERT INTO Dim_Tanaman VALUES
(1,'Anggrek Bulan','Langka','Indonesia'),
(2,'Kantong Semar','Langka','Lampung'),
(3,'Mawar Merah','Lokal','Indonesia'),
(4,'Lavender Ungu','Introduksi','Mediterania'),
(5,'Puring Hijau','Lokal','Indonesia');

-- Dim_Waktu (500 hari)
DECLARE @date DATE = '2023-01-01';
DECLARE @x INT = 1;
WHILE @x <= 500
BEGIN
    INSERT INTO Dim_Waktu(tanggal,hari,bulan,nama_bulan,tahun,kuartal)
    SELECT 
        @date,
        DATENAME(WEEKDAY,@date),
        MONTH(@date),
        DATENAME(MONTH,@date),
        YEAR(@date),
        DATEPART(QUARTER,@date);

    SET @date = DATEADD(DAY,1,@date);
    SET @x = @x + 1;
END
GO

-------------------------------------------------------
-- INSERT 8000 DATA Fact_Kunjungan
-------------------------------------------------------

DECLARE @a INT = 1;

WHILE @a <= 8000
BEGIN
    INSERT INTO Fact_Kunjungan(waktu_id,pengunjung_id,fasilitas_id,ulasan_id,jumlah_pengunjung,tujuan)
    SELECT 
        (ABS(CHECKSUM(NEWID())) % 500) + 1,
        (ABS(CHECKSUM(NEWID())) % 300) + 301,
        (ABS(CHECKSUM(NEWID())) % 5) + 201,
        NULL,
        1,
        CASE ABS(CHECKSUM(NEWID())) % 3
            WHEN 0 THEN 'Wisata'
            WHEN 1 THEN 'Edukasi'
            ELSE 'Penelitian'
        END;
    SET @a = @a + 1;
END
GO

-------------------------------------------------------
-- INSERT 2000 DATA Fact_Tanaman
-------------------------------------------------------

DECLARE @t INT = 1;

WHILE @t <= 2000
BEGIN
    INSERT INTO Fact_Tanaman(waktu_id,tanaman_id,spesies_id,kuantitas)
    SELECT
        (ABS(CHECKSUM(NEWID())) % 500) + 1,
        (ABS(CHECKSUM(NEWID())) % 5) + 1,
        (ABS(CHECKSUM(NEWID())) % 5) + 101,
        (ABS(CHECKSUM(NEWID())) % 3) + 1;

    SET @t = @t + 1;
END
GO



--CEK DATA
SELECT 'Dim_Waktu', COUNT(*) FROM Dim_Waktu UNION ALL
SELECT 'Dim_Pengunjung', COUNT(*) FROM Dim_Pengunjung UNION ALL
SELECT 'Dim_Fasilitas', COUNT(*) FROM Dim_Fasilitas UNION ALL
SELECT 'Dim_Spesies', COUNT(*) FROM Dim_Spesies UNION ALL
SELECT 'Dim_Tanaman', COUNT(*) FROM Dim_Tanaman UNION ALL
SELECT 'Fact_Kunjungan', COUNT(*) FROM Fact_Kunjungan UNION ALL
SELECT 'Fact_Tanaman', COUNT(*) FROM Fact_Tanaman;















