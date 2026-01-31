-- =====================================================
-- File        : create_tables.sql
-- Project     : Aplikasi Pencatatan Inventaris Sekolah
-- Deskripsi   : Script pembuatan seluruh tabel database
-- DBMS        : Microsoft SQL Server
-- Author      : Darryl Azzuri
-- =====================================================

-- =====================================================
-- STATUS FILE : LOCKED
-- Catatan     :
-- - Struktur tabel sudah final
-- - Tidak boleh diubah tanpa diskusi tim
-- =====================================================


-- Menyimpan data murid yang dapat melakukan peminjaman
CREATE TABLE Murid (
    MuridId INT IDENTITY(1,1) PRIMARY KEY,
    NamaMurid VARCHAR(100) NOT NULL,
    Kelas VARCHAR(10) NOT NULL,
    Jurusan VARCHAR(10) NOT NULL
);

CREATE TABLE KategoriInventaris (
    KategoriId INT IDENTITY(1,1) PRIMARY KEY,
    NamaKategori VARCHAR(50) NOT NULL
);

CREATE TABLE LokasiPenyimpanan (
    LokasiId INT IDENTITY(1,1) PRIMARY KEY,
    NamaLokasi VARCHAR(50) NOT NULL,
    Keterangan VARCHAR(100)
);

CREATE TABLE KondisiInventaris (
    KondisiId INT IDENTITY(1,1) PRIMARY KEY,
    NamaKondisi VARCHAR(25) NOT NULL
);

CREATE TABLE Inventaris (
    InventarisId INT IDENTITY(1,1) PRIMARY KEY,
    KodeInventaris VARCHAR(30) NOT NULL UNIQUE,
    NamaInventaris VARCHAR(100) NOT NULL,
    KategoriId INT NOT NULL,
    LokasiId INT NOT NULL,
    KondisiId INT NOT NULL,
    TanggalPengadaan DATE NOT NULL,
    JumlahStok INT NOT NULL,
    StatusInventaris VARCHAR(30) NOT NULL,

    CONSTRAINT FK_Inventaris_Kategori
        FOREIGN KEY (KategoriId) REFERENCES KategoriInventaris(KategoriId),

    CONSTRAINT FK_Inventaris_Lokasi
        FOREIGN KEY (LokasiId) REFERENCES LokasiPenyimpanan(LokasiId),

    CONSTRAINT FK_Inventaris_Kondisi
        FOREIGN KEY (KondisiId) REFERENCES KondisiInventaris(KondisiId)
);

CREATE TABLE Peminjaman (
    PeminjamanId INT IDENTITY(1,1) PRIMARY KEY,
    TanggalPinjam DATE NOT NULL,
    TanggalRencanaKembali DATE NOT NULL,
    TanggalKembali DATE NULL,
    MuridId INT NOT NULL,
    StatusPeminjaman VARCHAR(30) NOT NULL,

    CONSTRAINT FK_Peminjaman_Murid
        FOREIGN KEY (MuridId) REFERENCES Murid(MuridId)
);

CREATE TABLE DetailPeminjaman (
    DetailPeminjamanId INT IDENTITY(1,1) PRIMARY KEY,
    PeminjamanId INT NOT NULL,
    InventarisId INT NOT NULL,
    JumlahPinjam INT NOT NULL,

    CONSTRAINT FK_DetailPeminjaman_Peminjaman
        FOREIGN KEY (PeminjamanId) REFERENCES Peminjaman(PeminjamanId),

    CONSTRAINT FK_DetailPeminjaman_Inventaris
        FOREIGN KEY (InventarisId) REFERENCES Inventaris(InventarisId)
);

