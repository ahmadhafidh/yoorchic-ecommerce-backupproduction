-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 03, 2020 at 08:53 PM
-- Server version: 10.3.22-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yoorchic_toyoorchic`
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
(1, 'admin', 'Administrator', '$2y$10$z7QgaEYTV4P.pHDugZqhY.mllCMEwBnXLYiSl1PjPgTNQKpc5iPZi', 'olshopku777@gmail.com', ''),
(2, 'ahmadhafidh', 'Administrator', '$2y$10$z7QgaEYTV4P.pHDugZqhY.mllCMEwBnXLYiSl1PjPgTNQKpc5iPZi', 'ahmadhafyd@gmail.com', '');

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

--
-- Dumping data for table `t_img`
--

INSERT INTO `t_img` (`id_item`, `img`) VALUES
(4, 'img1576812161.jpg'),
(4, 'img15768123870.jpg');

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

--
-- Dumping data for table `t_items`
--

INSERT INTO `t_items` (`id_item`, `link`, `nama_item`, `harga`, `berat`, `stok`, `aktif`, `gambar`, `deskripsi`) VALUES
(4, '1576299109', 'Kireina Scarf (Watersplash)', 69000, 200, 18, 1, 'gambar1576812384.jpg', 'Deskripsi:\r\n- Bahan Voal Emerald atau dikenal juga dengan Voal Watersplash merupakan voal dengan bahan sangat lembut, kualitas kain Premium Grade A dan terbaik dikelasnya\r\n- Bahan tebal  dan tidak transparan\r\n- Anti air (tetap masih  bisa dicuci), dan sangat cocok bagi yang ingin mengutamakan hijab dengan kualitas kain sangat baik.\r\n\r\nUkuran: \r\n120cm x 120cm (Syar\'i Friendly)\r\n\r\nFisnishing:\r\nJahit Tepi\r\nPackaging Ziplock Pouch (Reuseable for make up pouch or other function)'),
(5, '1576299347', 'Voal Superfine', 65000, 190, 15, 1, 'gambar1576811887.jpg', 'Deskripsi:\r\n- Bahan Voal Ultrafine merupakan voal dengan bahan lembut, kualitas kain Premium Grade A\r\n- Bahan tebal  dan tidak transparan\r\n- Sangat cocok bagi yang ingin mengutamakan hijab dengan kualitas kain sangat baik.\r\n\r\nUkuran:\r\n120cm x 120cm (Syar\'i Friendly)\r\n\r\nFisnishing:\r\nJahit Tepi\r\nPackaging Ziplock Pouch (Reuseable for make up pouch or other function)'),
(6, '1576812697', 'Voal Miracle', 61000, 180, 9, 1, 'gambar1576812697.jpg', 'Deskripsi:\r\n- Bahan Voal Miracle atau dikenal juga dengan Arabian Voal merupakan voal dengan bahan sangat lembut, kualitas kain Premium Grade A dan terbaik dikelasnya\r\n- Bahan tebal  dan tidak transparan, sangat cocok bagi yang ingin mengutamakan hijab dengan kualitas kain sangat baik.\r\n\r\nUkuran:\r\n120cm x 120cm (Syar\'i Friendly)\r\n\r\nFisnishing:\r\nJahit Tepi\r\nPackaging Ziplock Pouch (Reuseable for make up pouch or other function)');

-- --------------------------------------------------------

--
-- Table structure for table `t_kategori`
--

CREATE TABLE `t_kategori` (
  `id_kategori` smallint(6) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `url` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_kategori`
--

INSERT INTO `t_kategori` (`id_kategori`, `kategori`, `url`) VALUES
(9, 'Voal Square', 'voal-square'),
(10, 'Voal Watersplash', 'voal-watersplash');

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
  `instagram` varchar(255) NOT NULL,
  `email_toko` varchar(50) NOT NULL,
  `pass_toko` varchar(50) NOT NULL,
  `api_key` varchar(50) NOT NULL,
  `asal` mediumint(9) NOT NULL,
  `rekening` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_profil`
--

INSERT INTO `t_profil` (`id_profil`, `title`, `alamat_toko`, `phone`, `facebook`, `twitter`, `gplus`, `instagram`, `email_toko`, `pass_toko`, `api_key`, `asal`, `rekening`) VALUES
(1, 'YOOR CHIC', 'Jl. Wonorejo IV No.141D, Tegalsari, Surabaya 60263', '081911790800', 'https://facebook.com/yoorchic/', 'https://twitter.com/yoorchic/', 'https://googleplus.com/Olshopku', 'https://www.instagram.com/yoorchic/', 'yoorchic@gmail.com', 'Ev0lut!0ns', 'f3926faef502efb8e74c983c482c8618', 444, '9068795445634');

-- --------------------------------------------------------

--
-- Table structure for table `t_rkategori`
--

CREATE TABLE `t_rkategori` (
  `id_item` int(7) NOT NULL,
  `id_kategori` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_rkategori`
--

INSERT INTO `t_rkategori` (`id_item`, `id_kategori`) VALUES
(5, 9),
(6, 9),
(4, 10);

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

INSERT INTO `t_users` (`id_user`, `username`, `fullname`, `email`, `password`, `jk`, `telp`, `alamat`, `status`, `reset`) VALUES
(3, 'atinminah', 'Atin Minah', 'atin0809@gmail.com', '$2y$10$SvGMNqLb8AIoBwDz40jakOelqhP2qEiyvo.5OcX6gdkPG.GEcPTPe', 'P', '081234288413', 'Jl.gus dur keling kepung kediri', 1, ''),
(4, 'Renita', 'Renita Septi', 'septirenita9@gmail.com', '$2y$10$/fACD0uHEuAcZm7nyxHI5e5UOmQCIZjnZHFagnzhPGjnf2cgtuDy6', 'P', '081333747872', 'Ds.Gayam Kec.Gurah ', 1, ''),
(5, 'Ayumutiara', 'Ayu Mutiara', 'ayumutiara0311@gmail.com', '$2y$10$Cpuo807g8A0OwV66AX1IBOkqytuRrpgt3JROSqPZOK8UfX6B4WUx.', 'P', '085892684088', 'Jl. Kedung Anyar Tengah No. 20\r\nKelurahan: Sawahan\r\nKecamatan: Sawahan\r\nKota: Surabaya\r\nProvinsi: Jawa Timur\r\nKode pos 60251', 1, '');

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
  MODIFY `id_admin` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_items`
--
ALTER TABLE `t_items`
  MODIFY `id_item` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_kategori`
--
ALTER TABLE `t_kategori`
  MODIFY `id_kategori` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_profil`
--
ALTER TABLE `t_profil`
  MODIFY `id_profil` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `id_user` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
