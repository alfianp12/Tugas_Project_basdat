-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 21 Jun 2022 pada 13.27
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aksesori_com`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `acc_kom`
--

CREATE TABLE `acc_kom` (
  `id_acc` int(11) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `acc_kom`
--

INSERT INTO `acc_kom` (`id_acc`, `id_jenis`, `nama_barang`, `stok`, `harga`) VALUES
(1, 2, 'mouse k16 fantech', 100, 127000),
(2, 2, 'mouse k-one ', 50, 35000),
(3, 1, 'mouse k511 fantech', 100, 157000),
(4, 3, 'kabel printer 5M', 200, 6000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(100) DEFAULT NULL,
  `pass_admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `pass_admin`) VALUES
(1, 'ima', '1'),
(2, 'yuni', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `nama_customer` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_kulak`
--

CREATE TABLE `detail_kulak` (
  `id_acc` int(11) NOT NULL,
  `id_kulak` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detailtransaksi` int(11) NOT NULL,
  `id_acc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_acc`
--

CREATE TABLE `jenis_acc` (
  `id_jenis` int(11) NOT NULL,
  `nama_jenis` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jenis_acc`
--

INSERT INTO `jenis_acc` (`id_jenis`, `nama_jenis`) VALUES
(1, 'keyboard'),
(2, 'mouse'),
(3, 'headset'),
(4, 'kabel printer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(11) NOT NULL,
  `nama_kasir` varchar(100) DEFAULT NULL,
  `pass_kasir` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama_kasir`, `pass_kasir`) VALUES
(1, 'citra', '1'),
(2, 'tina', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kulakk`
--

CREATE TABLE `kulakk` (
  `id_kulak` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `totalharga_kulak` bigint(20) DEFAULT NULL,
  `tgl_kulak` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `tgl_transaksi` datetime DEFAULT NULL,
  `grand_total` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_kom`
--
ALTER TABLE `acc_kom`
  ADD PRIMARY KEY (`id_acc`),
  ADD KEY `FK_id_jenis_acc` (`id_jenis`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `detail_kulak`
--
ALTER TABLE `detail_kulak`
  ADD PRIMARY KEY (`id_acc`,`id_kulak`),
  ADD KEY `FK_id_kulak` (`id_kulak`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detailtransaksi`,`id_acc`),
  ADD UNIQUE KEY `id_detailtransaksi` (`id_detailtransaksi`),
  ADD KEY `FK_detail_transaksi` (`id_acc`);

--
-- Indexes for table `jenis_acc`
--
ALTER TABLE `jenis_acc`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indexes for table `kulakk`
--
ALTER TABLE `kulakk`
  ADD PRIMARY KEY (`id_kulak`),
  ADD UNIQUE KEY `FK_id_supplier` (`id_supplier`,`id_kulak`,`id_admin`),
  ADD KEY `FK_id_admin` (`id_admin`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `FK_customer` (`id_customer`),
  ADD KEY `FK_kasir` (`id_kasir`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_kom`
--
ALTER TABLE `acc_kom`
  MODIFY `id_acc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jenis_acc`
--
ALTER TABLE `jenis_acc`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `kasir`
--
ALTER TABLE `kasir`
  MODIFY `id_kasir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `acc_kom`
--
ALTER TABLE `acc_kom`
  ADD CONSTRAINT `FK_id_jenis_acc` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_acc` (`id_jenis`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_kulak`
--
ALTER TABLE `detail_kulak`
  ADD CONSTRAINT `FK_id_acc` FOREIGN KEY (`id_acc`) REFERENCES `acc_kom` (`id_acc`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_kulak` FOREIGN KEY (`id_kulak`) REFERENCES `kulakk` (`id_kulak`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `FK_detail_transaksi` FOREIGN KEY (`id_acc`) REFERENCES `acc_kom` (`id_acc`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_transaksi` FOREIGN KEY (`id_detailtransaksi`) REFERENCES `transaksi` (`id_transaksi`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kulakk`
--
ALTER TABLE `kulakk`
  ADD CONSTRAINT `FK_id_admin` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_kasir` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
