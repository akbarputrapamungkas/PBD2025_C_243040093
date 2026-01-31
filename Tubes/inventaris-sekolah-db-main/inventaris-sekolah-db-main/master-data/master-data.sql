-- =====================================================
-- File        : master-data.sql
-- Project     : Aplikasi Pencatatan Inventaris Sekolah
-- Deskripsi   : Script pengisian data untuk seluruh tabel
-- DBMS        : Microsoft SQL Server
-- Author      : Ilham Syaugi
-- =====================================================

-- =====================================================
-- STATUS FILE : LOCKED
-- Catatan     :
-- - Struktur tabel sudah final
-- - Tidak boleh diubah tanpa diskusi tim
-- =====================================================

-- Data Murid
INSERT INTO Murid (NamaMurid, Kelas, Jurusan) VALUES
('Ilham Saugi', 'XII', 'IPA'), 
('Muhamad Nur Salam', 'XII', 'IPS'),
('Afsal Prima Maula', 'X', 'IPA'), 
('Billy Wicaksono', 'XI', 'IPS'),
('Muhamad Phatur Rahman', 'XI', 'IPA'), 
('Yanto Santoso', 'XII', 'IPS'),
('Riski Pratama', 'XII', 'IPA'), 
('Muhammad Raehan', 'X', 'IPS'),
('Akbar Putra Pamungkas', 'XI', 'IPA'), 
('Siti Maimunah', 'XI', 'IPS'),
('Sabrina Azizah', 'XII', 'IPA'), 
('Ali Fauzi', 'XII', 'IPS'),
('Muhammad Thoriq', 'X', 'IPA'), 
('Rifky Pratama', 'XI', 'IPS'),
('Khoirun Rozan', 'XI', 'IPA'), 
('Reza Putra', 'XII', 'IPS'),
('Raffi Ahmad', 'XII', 'IPA'), 
('Bahllil Ilahi', 'X', 'IPS'),
('Rafli Rahman', 'XI', 'IPA'), 
('Rafii Khoirun', 'XI', 'IPS'),
('Arneu Samsul', 'XII', 'IPA'), 
('Vicka Aulia', 'XII', 'IPS'),
('Nazala Qisti', 'X', 'IPA'), 
('Areva Munira', 'XI', 'IPS'),
('Aditya Frahaz', 'XI', 'IPA'), 
('Daniel Aditya', 'XII', 'IPS'),
('Denis Figo', 'XII', 'IPA'), 
('Prima Maula', 'X', 'IPS'),
('Pratama Arhan', 'XI', 'IPA'),
('Farel Rahmat', 'XI', 'IPS');

-- Data Kategori Inventaris
INSERT INTO KategoriInventaris (NamaKategori) VALUES
('Peralatan Olahraga'),
('Peralatan Musik'), 
('Peralatan Laboratorium'), 
('Peralatan Seni Rupa'),
('Peralatan UKS'), 
('Peralatan Masak'),
('Peralatan Elektronik');

-- Data Lokasi Penyimpanan
INSERT INTO LokasiPenyimpanan (NamaLokasi, Keterangan) VALUES
('Ruang Lukis', 'Lantai 1 Gedung A'),
('Lab Komputer', 'Lantai 2 Gedung A'),
('Ruang Olahraga', 'Samping Lapangan'),
('Lab Kimia', 'Lantai 1 Tengah'),
('Ruang Musik', 'Lantai 2 Gedung A'),
('Ruang UKS', 'Lantai 1 Gedung A'),
('Kantin', 'Lantai 2 Gedung B');

-- Data Kondisi Inventaris
INSERT INTO KondisiInventaris (NamaKondisi) VALUES 
('Baik '), 
('Rusak Ringan'), 
('Rusak Berat');

-- Data Inventaris
INSERT INTO Inventaris (KodeInventaris, NamaInventaris, KategoriId, LokasiId, KondisiId, TanggalPengadaan, JumlahStok, StatusInventaris) VALUES
-- Peralatan Olahraga (KategoriId = 1) - Lokasi: Ruang Olahraga (LokasiId = 3)
('PO001', 'Bola Basket Spalding', 1, 3, 1, '2024-09-15', 8, 'Tersedia'),
('PO002', 'Matras Yoga', 1, 3, 1, '2023-10-10', 10, 'Tersedia'),
('PO003', 'Bola Voli Molten', 1, 3, 1, '2023-09-01', 12, 'Tersedia'),
('PO004', 'Net Badminton', 1, 3, 2, '2024-03-20', 5, 'Tersedia'),
('PO005', 'Raket Tenis Meja', 1, 3, 1, '2024-07-10', 15, 'Tersedia'),

-- Peralatan Musik (KategoriId = 2) - Lokasi: Ruang Musik (LokasiId = 5)
('PM001', 'Gitar Akustik Yamaha', 2, 5, 1, '2024-08-12', 4, 'Tersedia'),
('PM002', 'Keyboard Roland', 2, 5, 1, '2023-08-20', 2, 'Tersedia'),
('PM003', 'Drum Set Pearl', 2, 5, 2, '2024-02-15', 1, 'Tersedia'),
('PM004', 'Microphone Shure', 2, 5, 1, '2024-05-18', 6, 'Tersedia'),

-- Peralatan Laboratorium (KategoriId = 3) - Lokasi: Lab Kimia (LokasiId = 4)
('PL001', 'Mikroskop Cahaya', 3, 4, 1, '2022-12-05', 15, 'Tersedia'),
('PL002', 'Tabung Reaksi', 3, 4, 2, '2022-11-20', 100, 'Tersedia'),
('PL003', 'Bunsen Burner', 3, 4, 1, '2023-05-15', 10, 'Tersedia'),
('PL004', 'Gelas Ukur 500ml', 3, 4, 1, '2023-08-22', 25, 'Tersedia'),
('PL005', 'Pipet Tetes', 3, 4, 2, '2024-01-10', 50, 'Tersedia'),

-- Peralatan Seni Rupa (KategoriId = 4) - Lokasi: Ruang Lukis (LokasiId = 1)
('PSR001', 'Kanvas Lukis A3', 4, 1, 1, '2023-01-10', 50, 'Tersedia'),
('PSR002', 'Cat Akrilik Set', 4, 1, 1, '2024-04-05', 20, 'Tersedia'),
('PSR003', 'Kuas Lukis Set', 4, 1, 2, '2024-06-18', 30, 'Tersedia'),
('PSR004', 'Easel Kayu', 4, 1, 1, '2023-11-25', 10, 'Tersedia'),

-- Peralatan UKS (KategoriId = 5) - Lokasi: Ruang UKS (LokasiId = 6)
('PU001', 'Stetoskop', 5, 6, 1, '2022-10-15', 5, 'Tersedia'),
('PU002', 'Timbangan Badan', 5, 6, 2, '2022-09-30', 2, 'Tersedia'),
('PU003', 'Tensimeter Digital', 5, 6, 1, '2024-03-12', 3, 'Tersedia'),
('PU004', 'Tempat Tidur Pasien', 5, 6, 2, '2023-07-20', 4, 'Tersedia'),

-- Peralatan Masak (KategoriId = 6) - Lokasi: Kantin (LokasiId = 7)
('PMK001', 'Kompor Gas 2 Tungku', 6, 7, 1, '2024-01-15', 5, 'Tersedia'),
('PMK002', 'Panci Set Stainless', 6, 7, 2, '2023-12-08', 10, 'Tersedia'),
('PMK003', 'Blender Philips', 6, 7, 1, '2024-05-22', 3, 'Tersedia'),
('PMK004', 'Rice Cooker Miyako', 6, 7, 1, '2024-08-30', 4, 'Tersedia'),

-- Peralatan Elektronik (KategoriId = 7) - Lokasi: Lab Komputer (LokasiId = 2)
('PE001', 'Laptop ASUS ROG', 7, 2, 1, '2024-11-10', 15, 'Tersedia'),
('PE002', 'Proyektor Epson', 7, 2, 2, '2024-06-22', 12, 'Tersedia'),
('PE003', 'Printer HP Laserjet', 7, 2, 2, '2023-11-12', 4, 'Tersedia'),
('PE004', 'Scanner Brother', 7, 2, 3, '2023-12-25', 2, 'Tersedia'),
('PE005', 'Kamera Canon 80D', 7, 2, 1, '2024-07-05', 3, 'Tersedia');

-- Data Peminjaman
INSERT INTO Peminjaman (TanggalPinjam, TanggalRencanaKembali, TanggalKembali, MuridId, StatusPeminjaman) VALUES
('2024-09-15', '2024-09-29', '2024-09-29', 5, 'Selesai'),
('2024-09-20', '2024-10-04', '2024-10-04', 12, 'Selesai'),
('2024-10-05', '2024-10-19', '2024-10-21', 8, 'Terlambat'),
('2024-10-12', '2024-10-26', '2024-10-26', 23, 'Selesai'),
('2024-10-18', '2024-11-01', '2024-11-01', 3, 'Selesai'),
('2024-11-02', '2024-11-16', '2024-11-16', 17, 'Selesai'),
('2024-11-08', '2024-11-22', '2024-11-25', 29, 'Terlambat'),
('2024-11-15', '2024-11-29', '2024-11-29', 6, 'Selesai'),
('2024-11-22', '2024-12-06', '2024-12-06', 14, 'Selesai'),
('2024-11-28', '2024-12-12', '2024-12-12', 21, 'Selesai'),
('2024-12-03', '2024-12-17', '2024-12-17', 11, 'Selesai'),
('2024-12-09', '2024-12-23', '2024-12-26', 25, 'Terlambat'),
('2024-12-15', '2024-12-29', NULL, 4, 'Dipinjam'),
('2024-12-18', '2025-01-01', NULL, 19, 'Dipinjam'),
('2024-12-22', '2025-01-05', NULL, 7, 'Dipinjam'),
('2024-12-26', '2025-01-09', NULL, 16, 'Dipinjam'),
('2024-12-29', '2025-01-12', NULL, 28, 'Dipinjam'),
('2025-01-03', '2025-01-17', NULL, 2, 'Dipinjam'),
('2025-01-07', '2025-01-21', NULL, 13, 'Dipinjam'),
('2025-01-10', '2025-01-24', NULL, 22, 'Dipinjam'),
('2025-01-14', '2025-01-28', NULL, 9, 'Dipinjam'),
('2025-01-17', '2025-01-31', NULL, 30, 'Dipinjam'),
('2025-01-21', '2025-02-04', NULL, 1, 'Dipinjam'),
('2025-01-24', '2025-02-07', NULL, 15, 'Dipinjam'),
('2025-01-28', '2025-02-11', NULL, 26, 'Dipinjam'),
('2025-02-01', '2025-02-15', NULL, 10, 'Dipinjam'),
('2025-02-05', '2025-02-19', NULL, 18, 'Dipinjam'),
('2025-02-09', '2025-02-23', NULL, 24, 'Dipinjam'),
('2025-02-12', '2025-02-26', NULL, 20, 'Dipinjam'),
('2025-02-16', '2025-03-02', NULL, 27, 'Dipinjam');

-- Data Detail Peminjaman
INSERT INTO DetailPeminjaman (PeminjamanId, InventarisId, JumlahPinjam) VALUES
(1, 3, 2),(2, 15, 1),(3, 7, 1),(4, 22, 1),(5, 11, 3),
(6, 5, 2),(7, 18, 1),(8, 9, 1),(9, 26, 1),(10, 14, 2),
(11, 6, 4),(12, 28, 1),(13, 19, 5),(14, 8, 1),(15, 23, 1),
(16, 12, 2),(17, 19, 1),(18, 6, 1),(19, 17, 2),(20, 4, 3),
(21, 25, 1),(22, 13, 1),(23, 27, 1),(24, 12, 2),(25, 20, 1),
(26, 10, 1),(27, 16, 1),(28, 24, 1),(29, 21, 2),(24, 27, 1);