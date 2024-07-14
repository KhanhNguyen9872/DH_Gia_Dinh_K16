-- phpMyAdmin SQL Dump
-- version 5.2.1-1.el9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 14, 2024 at 09:50 AM
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
  `type` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `email`, `type`) VALUES
(1, 'root', '$2y$10$wfAQUzWPdsVgIp7HS9NQB.5Ujml4HUH5./4EAdiHjvg6aiRi6c8vS', 'root@localhost.com', -1),
(2, 'user', '$2y$10$4.sYVA222k5Dge4AoyqVSO5NO5ZZ7yyqe0h/XhMxtQTaZGJU/81mW', 'user@localhost.com', 1),
(3, 'guest', '$2y$10$GmGiLEQXwZhLV2HklEr4buIVVPQ2t8TvqR1JhXJM.d.JtrTSLXcBK', 'guest@localhost.com', 0);

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
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`id`, `name`, `model`, `producer_id`, `phonetype_id`, `quantity`, `price`) VALUES
(1, 'Galaxy J5 (2016)', 'SM-J510FN', 2, 1, 13, 1250000.00),
(2, 'Pixel 8A', 'akita', 7, 1, 13, 10500000.00),
(3, 'Pixel Fold', 'felix', 7, 1, 21, 23999000.00),
(4, 'Xiaomi Pad 6', '23043RP34C', 5, 2, 4, 8500000.00),
(5, 'Realme C3', 'RMX2020', 4, 1, 6, 2000000.00),
(6, 'Xiaomi Mi 9', 'cepheus', 5, 1, 6, 2900000.00),
(7, 'iPhone 15 Pro Max', 'A3092', 8, 1, 8, 30999000.00),
(8, 'Galaxy Tab A9+ 5G', 'SM-X216B', 1, 2, 7, 6290000.00);

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
(1, 'Äiá»‡n thoáº¡i di Ä‘á»™ng'),
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
(11, 'ZTE', 'zte@localhost.com');

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
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `phonetype`
--
ALTER TABLE `phonetype`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
