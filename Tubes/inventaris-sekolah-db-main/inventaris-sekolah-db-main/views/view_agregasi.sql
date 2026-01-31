-- 5 VIEW AGREGASI

--view stok per kategori
CREATE OR ALTER VIEW V_LaporanStokKategori 
AS
SELECT 
    k.KategoriId,
    k.NamaKategori,
    COUNT(i.InventarisId) AS JumlahSubkategori,
    SUM(i.JumlahStok) AS TotalStok
FROM KategoriInventaris k
LEFT JOIN Inventaris i 
    ON k.KategoriId = i.KategoriId
GROUP BY 
    k.KategoriId,
    k.NamaKategori;

SELECT *
FROM V_LaporanStokKategori


-- View ranking murid berdasarkan frekuensi peminjaman
CREATE VIEW V_RankingPeminjam 
AS
SELECT 
    m.MuridId,
    m.NamaMurid,
    m.Kelas,
    COUNT(p.PeminjamanId) AS TotalKaliPinjam
FROM Murid m
LEFT JOIN Peminjaman p 
    ON m.MuridId = p.MuridId
GROUP BY 
    m.MuridId,
    m.NamaMurid,
    m.Kelas;

SELECT *
FROM V_RankingPeminjam


--view barang yang paling sering dipinjam
CREATE OR ALTER VIEW V_BarangTerlaris AS
SELECT 
    i.InventarisId,
    i.NamaInventaris,
    SUM(dp.JumlahPinjam) AS TotalUnitDipinjam
FROM Inventaris i
JOIN DetailPeminjaman dp 
    ON i.InventarisId = dp.InventarisId
GROUP BY 
    i.InventarisId,
    i.NamaInventaris;

SELECT *
FROM V_BarangTerlaris


--view barang per lokasi
CREATE OR ALTER VIEW V_AsetPerLokasi AS
SELECT 
    l.LokasiId,
    l.NamaLokasi,
    COUNT(i.InventarisId) AS JenisBarang,
    SUM(i.JumlahStok) AS TotalAset
FROM LokasiPenyimpanan l
LEFT JOIN Inventaris i 
    ON l.LokasiId = i.LokasiId
GROUP BY 
    l.LokasiId,
    l.NamaLokasi;

SELECT *
FROM V_AsetPerLokasi


--view status yang meminjam
CREATE OR ALTER VIEW V_MonitoringStatus AS
SELECT 
    StatusPeminjaman,
    COUNT(*) AS JumlahPeminjaman
FROM Peminjaman
GROUP BY StatusPeminjaman;

SELECT *
FROM V_MonitoringStatus;