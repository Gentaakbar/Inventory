-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Feb 2023 pada 08.49
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.0.13

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
(1, '', 'yosuak7@gmail.com', 'Admin', '$2y$10$r6ywVQmzGZQKW5pIabgoC.vyyABceBlTb.wa72MkAKl0vpPeUiaJ.', 1, NULL, '2022-05-20 16:27:14', '0000-00-00 00:00:00'),
(6152, '', 'eka1@gmail.com', 'eka12', '$2y$10$igkG68nfjHVy.MbL1kR3CecGXDOhvC5wg7NTOGbCpODfoVi1ILwf.', 1, NULL, '2022-11-21 04:16:03', NULL),
(6156, '', 'yosuak@gmail.com', 'yosua', '$2y$10$rw3j1Rv2uo0MXC5I6sKzVunysh7Qe5pKIBZzcVa8KJal.lrDU6xpS', 0, NULL, '2023-02-02 10:52:02', '0000-00-00 00:00:00');

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
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT untuk tabel `databarang`
--
ALTER TABLE `databarang`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT untuk tabel `datacustomer`
--
ALTER TABLE `datacustomer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `datasupplier`
--
ALTER TABLE `datasupplier`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6157;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
