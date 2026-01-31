-- 5 VIEW JOIN

--view data barang lengkap
CREATE OR ALTER VIEW V_InventarisLengkap AS
SELECT 
    i.KodeInventaris,
    i.NamaInventaris,
    k.NamaKategori,
    l.NamaLokasi,
    ko.NamaKondisi,
    i.JumlahStok
FROM Inventaris i
JOIN KategoriInventaris k ON i.KategoriId = k.KategoriId
JOIN LokasiPenyimpanan l ON i.LokasiId = l.LokasiId
JOIN KondisiInventaris ko ON i.KondisiId = ko.KondisiId;

SELECT *
FROM V_InventarisLengkap;


--view orang yang meminjam
CREATE OR ALTER VIEW V_InfoPeminjam AS
SELECT 
    p.PeminjamanId,
    p.TanggalPinjam,
    p.StatusPeminjaman,
    m.NamaMurid,
    m.Kelas,
    m.Jurusan
FROM Peminjaman p
JOIN Murid m ON p.MuridId = m.MuridId;

SELECT *
FROM V_InfoPeminjam;


--view barang apa saja yang dipinjam
CREATE OR ALTER VIEW V_DetailBarangPinjam AS
SELECT 
    dp.PeminjamanId,
    i.KodeInventaris,
    i.NamaInventaris,
    dp.JumlahPinjam
FROM DetailPeminjaman dp
JOIN Inventaris i 
    ON dp.InventarisId = i.InventarisId;

SELECT *
FROM V_DetailBarangPinjam;


--view melihat lokasi barang
CREATE OR ALTER VIEW V_LokasiBarang AS
SELECT 
    l.NamaLokasi,
    l.Keterangan AS InfoRuangan,
    i.NamaInventaris,
    i.JumlahStok
FROM LokasiPenyimpanan l
JOIN Inventaris i ON l.LokasiId = i.LokasiId;

SELECT * 
FROM V_LokasiBarang;


--view mengetahui kondisi barang
CREATE OR ALTER VIEW V_KondisiBarang AS
SELECT 
    ko.NamaKondisi,
    i.NamaInventaris,
    i.JumlahStok,
    i.TanggalPengadaan
FROM KondisiInventaris ko
JOIN Inventaris i ON ko.KondisiId = i.KondisiId;

SELECT *
FROM V_KondisiBarang;