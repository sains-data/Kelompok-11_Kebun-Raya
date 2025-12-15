# 🌱 Data Mart Kebun Raya ITERA

![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Power Bi](https://img.shields.io/badge/power_bi-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/status-completed-success)

> **Proyek Data Warehouse & Business Intelligence untuk mendukung mandat ganda Kebun Raya ITERA: Konservasi Tumbuhan & Destinasi Eduwisata.**

---

## 📖 Tentang Proyek

Proyek ini bertujuan untuk membangun solusi **Data Mart** yang terintegrasi guna mengatasi masalah fragmentasi data (*data silos*) di Kebun Raya ITERA. Sistem ini dirancang untuk menyatukan dua domain data utama—**Operasional Wisata** dan **Konservasi Botani**—ke dalam satu repositori terpusat untuk mendukung pengambilan keputusan berbasis data.

### 🎯 Tujuan Utama
1.  **Analisis Operasional:** Memantau tren kunjungan, efektivitas fasilitas, dan segmentasi pengunjung.
2.  **Pemantauan Konservasi:** Melacak status koleksi tanaman, distribusi spesies, dan kesehatan tanaman sesuai standar BGCI.
3.  **Kinerja Sistem:** Mengimplementasikan database yang berkinerja tinggi dengan indeksasi yang tepat pada infrastruktur Cloud.

---

## 🏗️ Arsitektur & Teknis

Proyek ini mengimplementasikan arsitektur **Galaxy Schema (Fact Constellation)**, yang memungkinkan analisis lintas domain menggunakan dimensi bersama (*Conformed Dimension*).

### Tech Stack
* **Infrastructure:** Microsoft Azure Virtual Machine (Windows Server).
* **Database:** SQL Server 2019/2022 (Enterprise/Developer Edition).
* **Modeling:** Dimensional Modeling (Galaxy Schema).
* **ETL:** T-SQL Stored Procedures & Bulk Insert.
* **Visualization:** Microsoft Power BI.

### Skema Database (Galaxy Schema)
Sistem terdiri dari dua Tabel Fakta utama yang terhubung oleh *Conformed Dimension*:

| Tabel Fakta | Fungsi | Dimensi Terkait |
| :--- | :--- | :--- |
| **Fact_Kunjungan** | Mencatat transaksi tiket & aktivitas pengunjung. | `Dim_Pengunjung`, `Dim_Fasilitas`, `Dim_Waktu` |
| **Fact_Tanaman** | Mencatat sensus koleksi & kesehatan tanaman. | `Dim_Tanaman`, `Dim_Waktu` |

> **Note:** `Dim_Waktu` bertindak sebagai jembatan untuk menganalisis korelasi antara keramaian pengunjung dan kondisi tanaman.

---

## 📊 Dashboard & Visualisasi

Berikut adalah hasil visualisasi data yang telah diimplementasikan menggunakan Power BI untuk menjawab kebutuhan analitik manajemen:

### 1. Dashboard Operasional & Konservasi
![Dashboard Preview](dashboard-kebunraya_page-0001.jpg)
*Gambar: Tampilan penuh dashboard yang mencakup analisis pengunjung dan tanaman.*

### Fitur Analitik:
* **Peringkat Fasilitas:** Mengidentifikasi fasilitas teramai (Taman Buah, Rumah Kaca, dll).
* **Tren Kunjungan:** Grafik *Line Chart* untuk melihat fluktuasi pengunjung musiman.
* **Status Konservasi:** Grafik batang untuk memantau jumlah tanaman "Terancam Punah" vs "Aman".
* **Distribusi Spesies:** *Treemap* untuk melihat dominasi famili tanaman (Orchidaceae, Dipterocarpaceae, dll).

---

## ⚡ Performance & Testing

Sistem telah melalui tahap pengujian yang ketat untuk memastikan keandalan:

1.  **User Acceptance Test (UAT):** Seluruh skenario pengujian fungsionalitas dan integritas data berstatus **Passed**.
2.  **Performance Testing:**
    * Query agregasi kompleks pada 5.000+ data baris diselesaikan dalam waktu **< 1 detik**.
    * Implementasi **Columnstore Index** dan **Non-Clustered Index** terbukti meningkatkan efisiensi I/O.

---

## 👥 Tim Penyusun (Kelompok 11)

Proyek ini dikerjakan dengan pembagian tugas spesifik untuk memastikan setiap aspek Data Warehouse tertangani dengan baik:

| Nama Anggota | NIM | Peran & Kontribusi Utama |
| :--- | :--- | :--- |
| **Kartini Lovian Simbolon** | 122450003 | **Business Analyst & Documentation**<br>• Analisis kebutuhan bisnis & KPI.<br>• Penyusunan laporan akhir (Requirement). |
| **Nasywa Nur Afifah** | 122450125 | **Data Engineer Support**<br>• Perancangan kode SQL dasar (DDL).<br>• Penyusunan laporan teknis database. |
| **Erma Daniar Safitri** | 123450061 | **Technical Writer & Presenter**<br>• Penyusunan laporan komprehensif.<br>• Pembuatan materi presentasi (PPT) & visualisasi alur. |
| **Ginda Fajar Riadi Marpaung** | 123450103 | **Cloud Architect & Lead Developer**<br>• Konfigurasi Azure VM & SQL Server.<br>• Implementasi kode ETL & Indexing.<br>• Pengembangan Dashboard Power BI. |

---

