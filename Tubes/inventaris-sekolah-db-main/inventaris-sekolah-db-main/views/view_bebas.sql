-- 7 VIEW BEBAS

-- View murid yang sedang meminjam inventaris
CREATE OR ALTER VIEW V_MuridSedangMeminjam AS
SELECT 
    p.PeminjamanId,
    m.NamaMurid,
    m.Kelas,
    p.TanggalPinjam,
    p.StatusPeminjaman
FROM Peminjaman p
JOIN Murid m 
    ON p.MuridId = m.MuridId
WHERE p.StatusPeminjaman = 'Dipinjam';

SELECT *
FROM V_MuridSedangMeminjam;


-- View inventaris yang tersedia
CREATE OR ALTER VIEW V_InventarisTersedia AS
SELECT
    InventarisId,
    KodeInventaris,
    NamaInventaris,
    JumlahStok
FROM Inventaris
WHERE JumlahStok > 0;

SELECT *
FROM V_InventarisTersedia;

-- View riwayat peminjaman
CREATE OR ALTER VIEW V_RiwayatPeminjaman AS
SELECT
    p.PeminjamanId,
    m.NamaMurid,
    i.NamaInventaris,
    dp.JumlahPinjam,
    p.TanggalPinjam,
    p.TanggalKembali,
    p.StatusPeminjaman
FROM Peminjaman p
JOIN Murid m 
    ON p.MuridId = m.MuridId
JOIN DetailPeminjaman dp 
    ON p.PeminjamanId = dp.PeminjamanId
JOIN Inventaris i 
    ON dp.InventarisId = i.InventarisId;

SELECT *
FROM V_RiwayatPeminjaman;


-- View inventaris dengan kondisi baik
CREATE OR ALTER VIEW V_InventarisKondisiBaik AS
SELECT
    i.KodeInventaris,
    i.NamaInventaris,
    ko.NamaKondisi,
    i.JumlahStok
FROM Inventaris i
JOIN KondisiInventaris ko
    ON i.KondisiId = ko.KondisiId
WHERE ko.NamaKondisi = 'Baik';

SELECT *
FROM V_InventarisKondisiBaik;

-- View inventaris dengan kondisi rusak ringan
CREATE OR ALTER VIEW V_InventarisKondisiRusakRingan AS
SELECT
    i.KodeInventaris,
    i.NamaInventaris,
    ko.NamaKondisi,
    i.JumlahStok
FROM Inventaris i
JOIN KondisiInventaris ko
    ON i.KondisiId = ko.KondisiId
WHERE ko.NamaKondisi = 'Rusak Ringan';

SELECT *
FROM V_InventarisKondisiRusakRingan;

-- View inventaris dengan kondisi rusak berat
CREATE OR ALTER VIEW V_InventarisKondisiRusakBerat AS
SELECT
    i.KodeInventaris,
    i.NamaInventaris,
    ko.NamaKondisi,
    i.JumlahStok
FROM Inventaris i
JOIN KondisiInventaris ko
    ON i.KondisiId = ko.KondisiId
WHERE ko.NamaKondisi = 'Rusak Berat';

SELECT *
FROM V_InventarisKondisiRusakBerat;