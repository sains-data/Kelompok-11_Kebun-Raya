USE KebunRaya_DWH;
GO

-- Load Fact_Kunjungan
CREATE OR ALTER PROCEDURE usp_Load_FactKunjungan
AS
BEGIN
    INSERT INTO Fact_Kunjungan(waktu_id,pengunjung_id,fasilitas_id,ulasan_id,jumlah_pengunjung,tujuan)
    SELECT 
        w.waktu_id,
        s.pengunjung_id,
        s.fasilitas_id,
        NULL,
        s.jumlah,
        s.tujuan
    FROM stg.Kunjungan s
    JOIN Dim_Waktu w ON w.tanggal = s.waktu;
END
GO


-- Load Fact_Tanaman
CREATE OR ALTER PROCEDURE usp_Load_FactTanaman
AS
BEGIN
    INSERT INTO Fact_Tanaman(waktu_id,tanaman_id,spesies_id,kuantitas)
    SELECT 
        w.waktu_id,
        t.tanaman_id,
        t.spesies_id,
        t.kuantitas
    FROM stg.Tanaman t
    JOIN Dim_Waktu w ON w.tanggal = t.waktu;
END
GO


-- Master ETL
CREATE OR ALTER PROCEDURE usp_Master_ETL
AS
BEGIN
    EXEC usp_Load_FactKunjungan;
    EXEC usp_Load_FactTanaman;
END
GO
