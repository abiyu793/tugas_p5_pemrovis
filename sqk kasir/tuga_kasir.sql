-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Apr 2025 pada 09.36
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tuga_kasir`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `kd_brg` varchar(20) NOT NULL,
  `nm_brg` varchar(100) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `harga_beli` decimal(12,2) NOT NULL,
  `harga_jual` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`kd_brg`, `nm_brg`, `jenis`, `harga_beli`, `harga_jual`) VALUES
('1', 'kecambah', 'Makanan', 200000000.00, 1000000000.00),
('2', 'kacang', 'Makanan', 20000.00, 50000.00),
('3', 'susu', 'Minuman', 10000.00, 15000.00),
('4', 'kue', 'Minuman', 100000.00, 200000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `isi`
--

CREATE TABLE `isi` (
  `id_nota` varchar(20) NOT NULL,
  `kd_brg` varchar(20) NOT NULL,
  `hb` decimal(12,2) NOT NULL,
  `hj` decimal(12,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` varchar(20) NOT NULL,
  `nm_kasir` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nm_kasir`, `jenis_kelamin`, `no_telepon`, `agama`, `alamat`, `password`) VALUES
('ADM001', 'Administrator', 'Laki-laki', '081234567890', 'Islam', 'Jl. Administrasi No. 1', '0192023a7bbd73250516f069df18b500'),
('admin', 'Asep', 'Laki-laki', '081234567890', 'Islam', 'Jl. Administrasi No. 1', '0192023a7bbd73250516f069df18b500');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nota`
--

CREATE TABLE `nota` (
  `id_nota` varchar(20) NOT NULL,
  `tgl_nota` datetime NOT NULL,
  `id_pign` varchar(20) NOT NULL,
  `id_kasir` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pign` varchar(20) NOT NULL,
  `nmpign` varchar(100) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `telepon` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pign`, `nmpign`, `jenis`, `telepon`, `alamat`) VALUES
('1', 'adul', 'Laki-laki', '0895', 'kamboja'),
('2', 'suep', 'Laki-laki', '096', 'bekasi'),
('3', 'laras', 'Perempuan', '099', 'bedol'),
('4', 'ajak', 'Laki-laki', '0782', 'bogor'),
('5', 'laras', 'Perempuan', '099', 'bedol');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_brg`);

--
-- Indeks untuk tabel `isi`
--
ALTER TABLE `isi`
  ADD PRIMARY KEY (`id_nota`,`kd_brg`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indeks untuk tabel `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_pign` (`id_pign`),
  ADD KEY `id_kasir` (`id_kasir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pign`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `isi`
--
ALTER TABLE `isi`
  ADD CONSTRAINT `isi_ibfk_1` FOREIGN KEY (`id_nota`) REFERENCES `nota` (`id_nota`),
  ADD CONSTRAINT `isi_ibfk_2` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`);

--
-- Ketidakleluasaan untuk tabel `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `nota_ibfk_1` FOREIGN KEY (`id_pign`) REFERENCES `pelanggan` (`id_pign`),
  ADD CONSTRAINT `nota_ibfk_2` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
