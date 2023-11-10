-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2023 at 05:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wisata_smg`
--

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`id`, `nama`, `alamat`, `jenis`) VALUES
(1, 'Museum Mandala Bakti', 'Jl. Mgr. Soegijapranata No.1', 'Sejarah'),
(2, 'Museum Lawang Sewu', 'Jl. Pemuda no. 160', 'Sejarah'),
(3, 'Museum Ranggawarsita', 'Jl. Abdurahman Saleh No.1', 'Sejarah'),
(4, 'Museum Kota Lama', 'Jl. Cendrawasih No.1a', 'Sejarah'),
(5, 'Kampung Pelangi', 'Jl. DR. Sutomo No. 89', 'Alam'),
(6, 'Taman Wilis', 'Jl. Wilis No. 3', 'Alam'),
(7, 'Taman Diponegoro', 'Jl. Sultan Agung', 'Alam'),
(8, 'Bandeng Elrina', 'Jl. Pandanaran No.57', 'Kuliner'),
(9, 'Burjo Arjuna', 'Jl. Arjuna No.19', 'Kuliner'),
(10, 'Citra Sari', 'Jl. Senteran Tengah No.55', 'Kuliner');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
