USE KebunRaya_DWH;
GO

---------------------------------------------------
-- NONCLUSTERED INDEX (Optimasi Join)
---------------------------------------------------
CREATE NONCLUSTERED INDEX IX_FKunj_Waktu
ON Fact_Kunjungan(waktu_id);

CREATE NONCLUSTERED INDEX IX_FKunj_Pengunjung
ON Fact_Kunjungan(pengunjung_id);

CREATE NONCLUSTERED INDEX IX_FKunj_Fasilitas
ON Fact_Kunjungan(fasilitas_id);

CREATE NONCLUSTERED INDEX IX_FTanaman_Waktu
ON Fact_Tanaman(waktu_id);

CREATE NONCLUSTERED INDEX IX_FTanaman_Tanaman
ON Fact_Tanaman(tanaman_id);

CREATE NONCLUSTERED INDEX IX_FTanaman_Spesies
ON Fact_Tanaman(spesies_id);


---------------------------------------------------
-- COLUMNSTORE INDEX (Analitik)
---------------------------------------------------
CREATE NONCLUSTERED COLUMNSTORE INDEX CSX_Fact_Kunjungan
ON Fact_Kunjungan
(
    waktu_id, pengunjung_id, fasilitas_id, jumlah_pengunjung
);

CREATE NONCLUSTERED COLUMNSTORE INDEX CSX_Fact_Tanaman
ON Fact_Tanaman
(
    waktu_id, tanaman_id, spesies_id, kuantitas
);
GO


