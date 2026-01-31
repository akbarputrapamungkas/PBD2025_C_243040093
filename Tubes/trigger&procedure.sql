CREATE PROCEDURE SP_TambahMuridBaru
    @NamaMurid VARCHAR(100),
    @Kelas VARCHAR(10),
    @Jurusan VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Murid (NamaMurid, Kelas, Jurusan)
    VALUES (@NamaMurid, @Kelas, @Jurusan);
    
    PRINT 'Data murid ' + @NamaMurid + ' berhasil ditambahkan.';
END;
GO

/*
   2. SP_RestockBarang
   Deskripsi: Digunakan ketika sekolah membeli barang baru atau menambah stok barang yang sudah ada.
*/
CREATE PROCEDURE SP_RestockBarang
    @KodeInventaris VARCHAR(30),
    @JumlahTambahan INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cek apakah barang ada
    IF EXISTS (SELECT 1 FROM Inventaris WHERE KodeInventaris = @KodeInventaris)
    BEGIN
        UPDATE Inventaris
        SET JumlahStok = JumlahStok + @JumlahTambahan,
            TanggalPengadaan = GETDATE() -- Update tanggal pengadaan ke tanggal restock
        WHERE KodeInventaris = @KodeInventaris;

        PRINT 'Stok barang dengan kode ' + @KodeInventaris + ' berhasil ditambah sebanyak ' + CAST(@JumlahTambahan AS VARCHAR);
    END
    ELSE
    BEGIN
        PRINT 'Error: Kode Inventaris tidak ditemukan.';
    END
END;
GO

/*
   3. SP_ProsesPengembalian
   Deskripsi: Menangani proses pengembalian barang. Mengupdate status peminjaman 
   menjadi 'Selesai' dan mengisi TanggalKembali secara otomatis hari ini.
*/
CREATE PROCEDURE SP_ProsesPengembalian
    @PeminjamanId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cek status saat ini
    DECLARE @StatusSaatIni VARCHAR(30);
    SELECT @StatusSaatIni = StatusPeminjaman FROM Peminjaman WHERE PeminjamanId = @PeminjamanId;

    IF @StatusSaatIni IN ('Dipinjam', 'Terlambat')
    BEGIN
        UPDATE Peminjaman
        SET TanggalKembali = GETDATE(),
            StatusPeminjaman = 'Selesai'
        WHERE PeminjamanId = @PeminjamanId;

        PRINT 'Peminjaman ID ' + CAST(@PeminjamanId AS VARCHAR) + ' telah diselesaikan.';
    END
    ELSE
    BEGIN
        PRINT 'Peminjaman ini sudah selesai atau ID tidak valid.';
    END
END;
GO


-- =====================================================
-- BAGIAN 2: TRIGGERS (2 Trigger)
-- =====================================================

/*
   1. TR_KurangiStokOtomatis
   Deskripsi: Trigger ini akan berjalan otomatis ketika ada data baru di tabel DetailPeminjaman.
   Fungsi: Mengurangi stok di tabel Inventaris sesuai jumlah yang dipinjam.
*/
CREATE TRIGGER TR_KurangiStokOtomatis
ON DetailPeminjaman
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Update stok di tabel Inventaris berdasarkan data yang baru masuk (inserted)
    UPDATE i
    SET i.JumlahStok = i.JumlahStok - d.JumlahPinjam
    FROM Inventaris i
    JOIN inserted d ON i.InventarisId = d.InventarisId;

    PRINT 'Stok inventaris otomatis berkurang sesuai jumlah peminjaman.';
END;
GO

/*
   2. TR_ValidasiStokCukup
   Deskripsi: Trigger keamanan (Validation) untuk mencegah peminjaman jika stok habis.
   Fungsi: Jika jumlah pinjam melebihi stok yang tersedia, transaksi dibatalkan (Rollback).
*/
CREATE TRIGGER TR_ValidasiStokCukup
ON DetailPeminjaman
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cek jika ada stok yang menjadi negatif setelah dikurangi trigger sebelumnya
    -- Atau cek apakah jumlah pinjam > stok tersedia saat ini
    IF EXISTS (
        SELECT 1 
        FROM Inventaris i
        JOIN inserted d ON i.InventarisId = d.InventarisId
        WHERE i.JumlahStok < 0 -- Stok menjadi minus
    )
    BEGIN
        -- Batalkan transaksi
        RAISERROR ('Transaksi Dibatalkan: Stok barang tidak mencukupi untuk peminjaman ini.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO