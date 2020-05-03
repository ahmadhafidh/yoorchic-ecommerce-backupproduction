-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 10, 2019 at 02:20 PM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 5.6.40-8+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `olshopku`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_admin`
--

CREATE TABLE `t_admin` (
  `id_admin` tinyint(2) NOT NULL,
  `username` varchar(35) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `reset` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_admin`
--

INSERT INTO `t_admin` (`id_admin`, `username`, `fullname`, `password`, `email`, `reset`) VALUES
(1, 'admin', 'Administrator', '$2y$10$z7QgaEYTV4P.pHDugZqhY.mllCMEwBnXLYiSl1PjPgTNQKpc5iPZi', 'olshopku777@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_detail_order`
--

CREATE TABLE `t_detail_order` (
  `id_order` varchar(10) NOT NULL,
  `id_item` int(7) NOT NULL,
  `qty` smallint(4) NOT NULL,
  `biaya` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `t_detail_order`
--
DELIMITER $$
CREATE TRIGGER `penjualan_barang` AFTER INSERT ON `t_detail_order` FOR EACH ROW BEGIN
	UPDATE t_items i SET i.stok = i.stok - new.qty
    WHERE i.id_item = new.id_item;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `return_barang` AFTER DELETE ON `t_detail_order` FOR EACH ROW BEGIN
	UPDATE t_items i SET i.stok = i.stok + old.qty
    WHERE i.id_item = old.id_item;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_favorite`
--

CREATE TABLE `t_favorite` (
  `id_user` int(7) NOT NULL,
  `id_item` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_img`
--

CREATE TABLE `t_img` (
  `id_item` int(7) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_items`
--

CREATE TABLE `t_items` (
  `id_item` int(7) NOT NULL,
  `link` varchar(10) NOT NULL,
  `nama_item` varchar(255) NOT NULL,
  `harga` int(10) NOT NULL,
  `berat` int(5) NOT NULL,
  `stok` smallint(2) NOT NULL,
  `aktif` tinyint(1) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_kategori`
--

CREATE TABLE `t_kategori` (
  `id_kategori` smallint(6) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `url` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_order`
--

CREATE TABLE `t_order` (
  `id_order` varchar(15) NOT NULL,
  `nama_pemesan` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `total` double NOT NULL,
  `tujuan` varchar(255) NOT NULL,
  `pos` int(5) NOT NULL,
  `kota` varchar(25) NOT NULL,
  `kurir` varchar(5) NOT NULL,
  `service` varchar(50) NOT NULL,
  `tgl_pesan` date NOT NULL,
  `bts_bayar` date NOT NULL,
  `bukti` varchar(25) NOT NULL,
  `pengiriman` varchar(25) DEFAULT NULL,
  `status_proses` enum('belum','proses','selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_profil`
--

CREATE TABLE `t_profil` (
  `id_profil` tinyint(4) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alamat_toko` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `gplus` varchar(255) NOT NULL,
  `email_toko` varchar(50) NOT NULL,
  `pass_toko` varchar(50) NOT NULL,
  `api_key` varchar(50) NOT NULL,
  `asal` mediumint(9) NOT NULL,
  `rekening` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_profil`
--

INSERT INTO `t_profil` (`id_profil`, `title`, `alamat_toko`, `phone`, `facebook`, `twitter`, `gplus`, `email_toko`, `pass_toko`, `api_key`, `asal`, `rekening`) VALUES
(1, 'OlShopKu', 'Jl. Nanas No. 24 Mlandangan, Pace - Nganjuk', '085731109000', 'https://facebook.com/Olshopku', 'https://twitter.com/Olshopku', 'https://googleplus.com/Olshopku', 'olshopku777@gmail.com', 'Ev0lut!0ns', 'f3926faef502efb8e74c983c482c8618', 305, '9068795445634');

-- --------------------------------------------------------

--
-- Table structure for table `t_rkategori`
--

CREATE TABLE `t_rkategori` (
  `id_item` int(7) NOT NULL,
  `id_kategori` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_users`
--

CREATE TABLE `t_users` (
  `id_user` int(7) NOT NULL,
  `username` varchar(35) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `telp` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `reset` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_users`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `t_detail_order`
--
ALTER TABLE `t_detail_order`
  ADD KEY `fk_t_detail_order_1_idx` (`id_order`),
  ADD KEY `fk_t_detail_order_2_idx` (`id_item`);

--
-- Indexes for table `t_favorite`
--
ALTER TABLE `t_favorite`
  ADD KEY `fk_t_favorite_1_idx` (`id_user`),
  ADD KEY `fk_t_favorite_2_idx` (`id_item`);

--
-- Indexes for table `t_img`
--
ALTER TABLE `t_img`
  ADD KEY `fk_t_img_1_idx` (`id_item`);

--
-- Indexes for table `t_items`
--
ALTER TABLE `t_items`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `t_kategori`
--
ALTER TABLE `t_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `t_order`
--
ALTER TABLE `t_order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `t_profil`
--
ALTER TABLE `t_profil`
  ADD PRIMARY KEY (`id_profil`);

--
-- Indexes for table `t_rkategori`
--
ALTER TABLE `t_rkategori`
  ADD KEY `fk_t_rkategori_1_idx` (`id_item`),
  ADD KEY `fk_t_rkategori_2_idx` (`id_kategori`);

--
-- Indexes for table `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `id_admin` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_items`
--
ALTER TABLE `t_items`
  MODIFY `id_item` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `t_kategori`
--
ALTER TABLE `t_kategori`
  MODIFY `id_kategori` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `t_profil`
--
ALTER TABLE `t_profil`
  MODIFY `id_profil` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `id_user` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_detail_order`
--
ALTER TABLE `t_detail_order`
  ADD CONSTRAINT `fk_t_detail_order_1` FOREIGN KEY (`id_order`) REFERENCES `t_order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_t_detail_order_2` FOREIGN KEY (`id_item`) REFERENCES `t_items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_favorite`
--
ALTER TABLE `t_favorite`
  ADD CONSTRAINT `fk_t_favorite_1` FOREIGN KEY (`id_user`) REFERENCES `t_users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_t_favorite_2` FOREIGN KEY (`id_item`) REFERENCES `t_items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_img`
--
ALTER TABLE `t_img`
  ADD CONSTRAINT `fk_t_img_1` FOREIGN KEY (`id_item`) REFERENCES `t_items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_rkategori`
--
ALTER TABLE `t_rkategori`
  ADD CONSTRAINT `fk_t_rkategori_1` FOREIGN KEY (`id_item`) REFERENCES `t_items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_t_rkategori_2` FOREIGN KEY (`id_kategori`) REFERENCES `t_kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
