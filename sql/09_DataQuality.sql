USE KebunRaya_DWH;

-- Null check
SELECT 'Fact_Kunjungan' AS TableName, COUNT(*) AS NullWaktu
FROM Fact_Kunjungan WHERE waktu_id IS NULL;

-- Referential check
SELECT COUNT(*) AS Orphan_Pengunjung
FROM Fact_Kunjungan fk
LEFT JOIN Dim_Pengunjung dp ON fk.pengunjung_id = dp.pengunjung_id
WHERE dp.pengunjung_id IS NULL;

-- Duplicate check pada fact
SELECT tujuan, COUNT(*) AS DupCount
FROM Fact_Kunjungan
GROUP BY tujuan
HAVING COUNT(*) > 1;
