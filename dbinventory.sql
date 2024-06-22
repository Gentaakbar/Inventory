-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jun 2024 pada 06.54
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbinventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangkeluar`
--

CREATE TABLE `barangkeluar` (
  `id` int(100) NOT NULL,
  `idtransaksi` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(35) NOT NULL,
  `namacustomer` varchar(200) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `kodebarang` int(100) NOT NULL,
  `namabarang` varchar(100) NOT NULL,
  `satuan` varchar(12) NOT NULL,
  `stok` int(12) NOT NULL,
  `jumlah` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Trigger `barangkeluar`
--
DELIMITER $$
CREATE TRIGGER `barangkeluar` BEFORE INSERT ON `barangkeluar` FOR EACH ROW BEGIN
	UPDATE databarang SET jumlah=jumlah-NEW.jumlah
    WHERE kodebarang = NEW.kodebarang; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barangkeluardelete` AFTER DELETE ON `barangkeluar` FOR EACH ROW UPDATE databarang set databarang.jumlah = databarang.jumlah + old.jumlah where databarang.kodebarang = old.kodebarang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barangkeluarupdate` AFTER UPDATE ON `barangkeluar` FOR EACH ROW UPDATE databarang set databarang.jumlah = databarang.jumlah + old.jumlah where databarang.kodebarang = old.kodebarang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barangkeluarupdate2` BEFORE UPDATE ON `barangkeluar` FOR EACH ROW UPDATE databarang set databarang.jumlah = databarang.jumlah - new.jumlah where databarang.kodebarang = new.kodebarang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barangmasuk`
--

CREATE TABLE `barangmasuk` (
  `id` int(100) NOT NULL,
  `idtransaksi` int(50) NOT NULL,
  `tanggal` date NOT NULL,
  `lokasi` varchar(35) NOT NULL,
  `namasupplier` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `kodebarang` int(35) NOT NULL,
  `namabarang` varchar(100) NOT NULL,
  `satuan` varchar(11) NOT NULL,
  `jumlah` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barangmasuk`
--

INSERT INTO `barangmasuk` (`id`, `idtransaksi`, `tanggal`, `lokasi`, `namasupplier`, `alamat`, `telepon`, `kodebarang`, `namabarang`, `satuan`, `jumlah`) VALUES
(131, 1700001, '2024-06-04', 'Gudang', 'nisin', 'jakar', '123131', 1, 'sabun', 'gr', 1);

--
-- Trigger `barangmasuk`
--
DELIMITER $$
CREATE TRIGGER `barangmasuk` BEFORE INSERT ON `barangmasuk` FOR EACH ROW BEGIN
	UPDATE databarang SET jumlah = jumlah+NEW.jumlah
    WHERE kodebarang = NEW.kodebarang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barangmasukdelete` AFTER DELETE ON `barangmasuk` FOR EACH ROW UPDATE databarang set databarang.jumlah = databarang.jumlah - old.jumlah where databarang.kodebarang = old.kodebarang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barangmasukupdate` AFTER UPDATE ON `barangmasuk` FOR EACH ROW UPDATE databarang set databarang.jumlah = databarang.jumlah - old.jumlah where databarang.kodebarang = old.kodebarang
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `barangmasukupdate2` BEFORE UPDATE ON `barangmasuk` FOR EACH ROW UPDATE databarang set databarang.jumlah = databarang.jumlah + new.jumlah where databarang.kodebarang = new.kodebarang
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `databarang`
--

CREATE TABLE `databarang` (
  `id` int(20) NOT NULL,
  `kodebarang` int(20) NOT NULL,
  `namabarang` varchar(100) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `jumlah` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `databarang`
--

INSERT INTO `databarang` (`id`, `kodebarang`, `namabarang`, `satuan`, `jumlah`) VALUES
(68, 1, 'sabun', 'gr', 13);

-- --------------------------------------------------------

--
-- Struktur dari tabel `datacustomer`
--

CREATE TABLE `datacustomer` (
  `id` int(11) NOT NULL,
  `namacustomer` varchar(100) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `datacustomer`
--

INSERT INTO `datacustomer` (`id`, `namacustomer`, `alamat`, `telepon`) VALUES
(11, 'genta', 'jakarta', '1423425252'),
(12, 'jadil', 'rumbut', '12141241');

-- --------------------------------------------------------

--
-- Struktur dari tabel `datasupplier`
--

CREATE TABLE `datasupplier` (
  `id` int(100) NOT NULL,
  `namasupplier` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `datasupplier`
--

INSERT INTO `datasupplier` (`id`, `namasupplier`, `alamat`, `telepon`) VALUES
(7, 'nisin', 'jakarta', '123131');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(2) NOT NULL,
  `avatar` varchar(32) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `role`, `avatar`, `created_at`, `last_login`) VALUES
(1, '', 'genta@gmail.com', 'Admin', '$2y$10$hEGpc.Nl2hsWGlueaAUcZ.fmYDRAt1IKBB.myeFP.f5B4dBtHT2WG', 1, NULL, '2022-05-20 16:27:14', '0000-00-00 00:00:00'),
(6152, '', 'genta@gmail.com', 'genta', '$2y$10$igkG68nfjHVy.MbL1kR3CecGXDOhvC5wg7NTOGbCpODfoVi1ILwf.', 1, NULL, '2022-11-21 04:16:03', NULL),
(6157, '', 'genta@gmail.com', 'genta', '$2y$10$XmY4tlVxGNzRNb4utw3Hm.dyWu8m5hNfeRumRKV1LBdX.OH90nRzu', 0, NULL, '2024-06-03 11:45:25', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barangkeluar`
--
ALTER TABLE `barangkeluar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barangmasuk`
--
ALTER TABLE `barangmasuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `databarang`
--
ALTER TABLE `databarang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `datacustomer`
--
ALTER TABLE `datacustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `datasupplier`
--
ALTER TABLE `datasupplier`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barangkeluar`
--
ALTER TABLE `barangkeluar`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT untuk tabel `barangmasuk`
--
ALTER TABLE `barangmasuk`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT untuk tabel `databarang`
--
ALTER TABLE `databarang`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `datacustomer`
--
ALTER TABLE `datacustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `datasupplier`
--
ALTER TABLE `datasupplier`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6158;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
