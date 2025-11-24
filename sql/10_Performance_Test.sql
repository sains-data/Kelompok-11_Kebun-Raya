SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Query: jumlah wisata per fasilitas per bulan
SELECT
    f.nama_fasilitas,
    w.bulan,
    COUNT(*) AS total_kunjungan
FROM Fact_Kunjungan fk
JOIN Dim_Fasilitas f ON f.fasilitas_id = fk.fasilitas_id
JOIN Dim_Waktu w ON w.waktu_id = fk.waktu_id
WHERE fk.tujuan = 'Wisata'
GROUP BY f.nama_fasilitas, w.bulan
ORDER BY total_kunjungan DESC;
