USE KebunRaya_DWH;
GO

-- Fact Kunjungan
CREATE TABLE Fact_Kunjungan (
    kunjungan_key BIGINT IDENTITY(1,1) PRIMARY KEY,
    waktu_id INT,
    pengunjung_id INT,
    fasilitas_id INT,
    ulasan_id INT,
    jumlah_pengunjung INT,
    tujuan VARCHAR(100),

    CONSTRAINT FK_FKunj_Waktu FOREIGN KEY (waktu_id) REFERENCES Dim_Waktu(waktu_id),
    CONSTRAINT FK_FKunj_Peng FOREIGN KEY (pengunjung_id) REFERENCES Dim_Pengunjung(pengunjung_id),
    CONSTRAINT FK_FKunj_Fasil FOREIGN KEY (fasilitas_id) REFERENCES Dim_Fasilitas(fasilitas_id),
    CONSTRAINT FK_FKunj_Ulas FOREIGN KEY (ulasan_id) REFERENCES Dim_Ulasan(ulasan_id)
);

-- Fact Tanaman
CREATE TABLE Fact_Tanaman (
    tanaman_key BIGINT IDENTITY(1,1) PRIMARY KEY,
    waktu_id INT,
    tanaman_id INT,
    spesies_id INT,
    kuantitas INT DEFAULT 1,

    CONSTRAINT FK_FTan_Waktu FOREIGN KEY (waktu_id) REFERENCES Dim_Waktu(waktu_id),
    CONSTRAINT FK_FTan_Tanaman FOREIGN KEY (tanaman_id) REFERENCES Dim_Tanaman(tanaman_id),
    CONSTRAINT FK_FTan_Spesies FOREIGN KEY (spesies_id) REFERENCES Dim_Spesies(spesies_id)
);
GO
