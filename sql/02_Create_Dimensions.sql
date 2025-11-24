USE KebunRaya_DWH;
GO

-- Dim Waktu
CREATE TABLE Dim_Waktu (
    waktu_id INT IDENTITY(1,1) PRIMARY KEY,
    tanggal DATE UNIQUE,
    hari VARCHAR(20),
    bulan INT,
    nama_bulan VARCHAR(20),
    tahun INT,
    kuartal INT
);

-- Dim Pengunjung
CREATE TABLE Dim_Pengunjung (
    pengunjung_id INT PRIMARY KEY,
    nama VARCHAR(255),
    kategori VARCHAR(100),
    asal VARCHAR(100)
);

-- Dim Fasilitas
CREATE TABLE Dim_Fasilitas (
    fasilitas_id INT PRIMARY KEY,
    nama_fasilitas VARCHAR(255),
    jenis VARCHAR(100),
    kapasitas INT,
    lokasi VARCHAR(255)
);

-- Dim Ulasan
CREATE TABLE Dim_Ulasan (
    ulasan_id INT PRIMARY KEY,
    isi_ulasan VARCHAR(255),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    tanggal_ulasan DATE
);

-- Dim Tanaman
CREATE TABLE Dim_Tanaman (
    tanaman_id INT PRIMARY KEY,
    nama_tanaman VARCHAR(255),
    status_konservasi VARCHAR(100),
    asal VARCHAR(100)
);

-- Dim Spesies
CREATE TABLE Dim_Spesies (
    spesies_id INT PRIMARY KEY,
    nama_spesies VARCHAR(255),
    jenis VARCHAR(100),
    asal VARCHAR(100)
);
GO
