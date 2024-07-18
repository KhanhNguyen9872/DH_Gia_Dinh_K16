-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 18, 2024 at 03:29 PM
-- Server version: 10.5.22-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phoneStore`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `email`, `user_id`) VALUES
(1, 'root', '$2y$10$wfAQUzWPdsVgIp7HS9NQB.5Ujml4HUH5./4EAdiHjvg6aiRi6c8vS', 'root@localhost.com', 1),
(2, 'user', '$2y$10$4.sYVA222k5Dge4AoyqVSO5NO5ZZ7yyqe0h/XhMxtQTaZGJU/81mW', 'user@localhost.com', 2),
(3, 'guest', '$2y$10$GmGiLEQXwZhLV2HklEr4buIVVPQ2t8TvqR1JhXJM.d.JtrTSLXcBK', 'guest@localhost.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(20) NOT NULL,
  `name` mediumtext NOT NULL,
  `address` mediumtext DEFAULT NULL,
  `email` mediumtext DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(20) NOT NULL,
  `customerID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `producer_id` int(12) NOT NULL,
  `phonetype_id` int(12) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`id`, `name`, `model`, `producer_id`, `phonetype_id`, `quantity`, `price`, `img`) VALUES
(1, 'Galaxy J5 (2016)', 'SM-J510FN', 1, 1, 13, 1250000.00, '5QeY4PPByh.jpg'),
(2, 'Pixel 8A', 'akita', 6, 1, 13, 10500000.00, 'OIP (1).jpg'),
(3, 'Pixel Fold', 'felix', 6, 1, 21, 23999000.00, 'download.jpg'),
(4, 'Xiaomi Pad 6', '23043RP34C', 5, 2, 4, 8500000.00, 'xiaomi-pad-6-blue-thumb-600x600.jpg'),
(5, 'Realme C3', 'RMX2020', 4, 1, 6, 2000000.00, 'Realme-C3-64GB-3GB-Face-Unlock-6-5-Dual-SIM-GSM-Unlocked-US-4G-LTE-RMX2020_b18f926a-c353-4ebd-a0bd-282ce8b59b9a.6175e01e2c92cc792cde2ed6a712af3d.webp'),
(6, 'Xiaomi Mi 9', 'cepheus', 5, 1, 6, 2900000.00, 'xiaomi-mi-9-1-600x600.jpg'),
(7, 'iPhone 15 Pro Max', 'A3092', 8, 1, 8, 30999000.00, '15-pro-max-tu-nhien-2.webp'),
(8, 'Galaxy Tab A9+ 5G', 'SM-X216B', 1, 2, 7, 6290000.00, 'samsung-galaxy-a9-plus-den-thumb-600x600.jpg'),
(9, 'iPhone 15', 'A3090', 8, 1, 5, 22000000.00, 'image_2024-07-16_154044921.png'),
(10, 'iPhone 13 Pro Max', 'A2643', 8, 1, 8, 28490000.00, 'image_2024-07-16_154818521.png'),
(11, 'Oppo Reno8 Pro 5G', 'CPH2357', 2, 1, 20, 18990000.00, 'image_2024-07-16_155007785.png'),
(12, 'Xiaomi Redmi Note 11', '2201117TG', 5, 1, 32, 4290000.00, 'image_2024-07-16_155115276.png'),
(13, 'Vivo V25 Pro', 'V2202', 3, 1, 17, 7690000.00, 'image_2024-07-16_155224194.png'),
(14, 'iPad Pro 12.9-inch (2022)', 'A2764', 8, 2, 10, 30000000.00, 'image_2024-07-16_155405954.png'),
(15, 'Realme C55', 'RMX3710', 4, 1, 19, 4000000.00, 'image_2024-07-16_155612217.png'),
(17, 'Nokia G22', 'TA-1542', 13, 1, 28, 3900000.00, 'image_2024-07-16_155948684.png'),
(18, 'OnePlus Nord 2T', 'CPH2401', 10, 1, 9, 9990000.00, 'image_2024-07-16_160141185.png'),
(19, 'Pixel Fold', 'felix', 6, 1, 6, 23999000.00, 'download.jpg'),
(20, 'Tecno Camon 20 Premier 5G', 'CK9n', 7, 1, 30, 6500000.00, 'image_2024-07-16_160310998.png'),
(21, 'Samsung Galaxy S23 Ultra 5G', 'SM-S918B', 1, 1, 15, 29990000.00, 'images.jpg'),
(22, 'OPPO Find N2 Flip', 'CPH2437', 2, 1, 9, 9990000.00, 'image_2024-07-16_160443114.png'),
(24, 'iPhone 14 Pro Max', 'A2779', 8, 1, 12, 34990000.00, 'images (1).jpg'),
(25, 'Google Pixel 7 Pro', 'G22A', 6, 1, 25, 22490000.00, 'images (2).jpg'),
(26, 'Oppo Find X6 Pro 5G', 'CPH2375', 2, 1, 25, 25990000.00, 'images.jpg'),
(27, 'Xiaomi 13 Pro', '220713TG', 5, 1, 18, 21990000.00, 'images (1).jpg'),
(28, 'Galaxy Z Flip5', 'SM-F731B', 1, 1, 3, 25990000.00, 'download (1).jpg'),
(29, 'Realme GT Neo 3', 'Realme GT Neo 3', 4, 1, 17, 16990000.00, '3.jpg'),
(30, 'Samsung Galaxy Z Fold4 5G', 'SM-F936B', 1, 1, 20, 54990000.00, '4.jpg'),
(32, 'Samsung Galaxy Z Flip4 5G', 'SM-F937B', 1, 1, 19, 26990000.00, '5.jpg'),
(33, 'Nokia X21 5G', 'TA-1425', 13, 1, 20, 12990000.00, '6.jpg'),
(34, 'Samsung Galaxy A74 5G', 'SM-A747B', 1, 1, 22, 18490000.00, 'images (3).jpg'),
(35, 'Vsmart Joy 5', 'VJS05', 12, 1, 15, 5490000.00, 'images (4).jpg'),
(36, 'Xiaomi Poco X4 Pro 5G', 'null', 5, 1, 15, 9990000.00, 'OIP (1).jpg'),
(37, 'Samsung Galaxy M53 5G', 'SM-M536B', 1, 1, 15, 12990000.00, 'images (8).jpg'),
(39, 'Realme 9 Pro+ 5G', 'Realme 9 Pro+ 5G', 4, 1, 16, 11490000.00, 'images (10).jpg'),
(40, 'Vivo V23 5G', 'V2301', 3, 1, 22, 14990000.00, 'images (11).jpg'),
(41, 'OnePlus Nord 2T 5G', 'BB5A', 10, 1, 15, 13490000.00, 'images (12).jpg'),
(42, 'Nokia G400 5G', 'TA-1483', 13, 1, 16, 6990000.00, 'images.jpg'),
(43, 'Sony Xperia 10 IV', 'XQ-CQ73', 14, 1, 18, 22990000.00, 'images (13).jpg'),
(44, 'Tecno Pova 4 Pro', 'BCCH19	', 7, 1, 12, 6990000.00, 'images (14).jpg'),
(45, 'ASUS Zenfone 9', 'ASUS_Z9', 9, 1, 15, 13990000.00, 'images (15).jpg'),
(46, 'TECNO Camon 19 Pro Mondrian	', 'BCCH20', 7, 1, 17, 9490000.00, 'images.jpg'),
(47, 'Vivo Y35 5G', 'V2231', 3, 1, 22, 8490000.00, 'images (16).jpg'),
(48, 'Vivo Y35 5G', 'V2231', 3, 1, 22, 8490000.00, 'images (16).jpg'),
(49, 'Samsung Galaxy Z Fold 5', 'SM-F936B', 1, 1, 20, 55000000.00, 'images.jpg'),
(50, 'OnePlus 11 Pro', 'PBEM30', 10, 1, 22, 22000000.00, 'download.jpg'),
(51, 'Vivo X90 Pro+', 'V2303A', 3, 1, 25, 25000000.00, 'images (17).jpg'),
(52, 'iPad Pro 12.9 inch (2023)', 'M2', 8, 2, 20, 35490000.00, 'download (1).jpg'),
(53, 'Samsung Galaxy Tab S9 Ultra', 'SM-T908B', 1, 2, 22, 32990000.00, 'download (2).jpg'),
(54, 'Xiaomi Pad 6 Pro', '2208128TC', 5, 2, 25, 21990000.00, 'download (3).jpg'),
(55, 'OPPO Pad Air', 'CPH2205', 2, 2, 18, 16990000.00, 'download (4).jpg'),
(56, '	Realme Pad X', 'RMX3699', 4, 2, 17, 14990000.00, 'images (18).jpg');

-- --------------------------------------------------------

--
-- Table structure for table `phonetype`
--

CREATE TABLE `phonetype` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phonetype`
--

INSERT INTO `phonetype` (`id`, `name`) VALUES
(1, 'Äiá»‡n thoáº¡i'),
(2, 'MÃ¡y tÃ­nh báº£ng');

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`id`, `name`, `email`) VALUES
(1, 'Samsung', 'samsung@localhost.com'),
(2, 'Oppo', 'oppo@localhost.com'),
(3, 'Vivo', 'vivo@localhost.com'),
(4, 'Realme', 'realme@localhost.com'),
(5, 'Xiaomi', 'xiaomi@localhost.com'),
(6, 'Google', 'google@localhost.com'),
(7, 'Tecno', 'tecno@localhost.com'),
(8, 'Apple', 'apple@localhost.com'),
(9, 'Asus', 'asus@localhost.com'),
(10, 'Oneplus', 'oneplus@localhost.com'),
(11, 'ZTE', 'zte@localhost.com'),
(12, 'Vsmart', 'vsmart@localhost.com'),
(13, 'Nokia', 'nokia@localhost.com'),
(14, 'Sony', 'sony@localhost.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `type` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `gender`, `email`, `phone`, `type`) VALUES
(1, 'Nguyen Van Khanh', 0, 'khanh@localhost.com', '0123456788', -1),
(2, 'Le Lam Chien Thang', 0, 'thang@localhost.com', '0120120121', 1),
(3, 'Vu Duc Thinh', 0, 'thinh@localhost.com', '0989898989', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `phone`
--
ALTER TABLE `phone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phonetype_id` (`phonetype_id`),
  ADD KEY `producer_id` (`producer_id`);

--
-- Indexes for table `phonetype`
--
ALTER TABLE `phonetype`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `email` (`email`) USING HASH;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone`
--
ALTER TABLE `phone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `phonetype`
--
ALTER TABLE `phonetype`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`);

--
-- Constraints for table `phone`
--
ALTER TABLE `phone`
  ADD CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`phonetype_id`) REFERENCES `phonetype` (`id`),
  ADD CONSTRAINT `phone_ibfk_2` FOREIGN KEY (`producer_id`) REFERENCES `producer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
