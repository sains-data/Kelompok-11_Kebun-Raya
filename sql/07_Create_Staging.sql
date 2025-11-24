USE KebunRaya_DWH;
GO

CREATE SCHEMA stg;
GO

CREATE TABLE stg.Kunjungan (
    waktu DATE,
    pengunjung_id INT,
    fasilitas_id INT,
    tujuan VARCHAR(100),
    jumlah INT,
    LoadDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE stg.Tanaman (
    waktu DATE,
    tanaman_id INT,
    spesies_id INT,
    kuantitas INT,
    LoadDate DATETIME DEFAULT GETDATE()
);
GO
