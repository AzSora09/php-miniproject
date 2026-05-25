-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2026 at 07:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoppingcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `first_name`, `last_name`, `email`, `password`, `role`) VALUES
(1, 'Adrian', 'Shepherd', 'halflife@gmail.com', 'HalfLife', 'admin'),
(2, 'Gordon', 'Freeman', 'anticitizen1@gmail.com', 'MITPhy', 'admin'),
(3, 'Isaac', 'Clarke', 'deadspace@gmail.com', 'DeadSpace2', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `img`) VALUES
(1, 'pencils', 'sum pencils', 'mechanical pencil.jpg'),
(2, 'gpu', 'aah', 'gpu.jpg'),
(3, 'laptop', 'smth', 'laptop.jpg'),
(4, 'watch', 'smth', 'watch.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item_table`
--

CREATE TABLE `order_item_table` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(500) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `quantity`, `image`, `cat_id`) VALUES
(1, 'mechanical pencil', 'made of metal', 250, 15, 'mechanical pencil.jpg', 1),
(2, 'rolex', 'luxurious', 100000, 10, 'rolex.jpg', 4),
(3, 'Dell laptop', 'Dell 15 Laptop DC15250-15.6-inch FHD 120Hz Display, Intel Core 3 Processor 100U, 8GB DDR4 RAM, 512GB SSD, Intel UHD Graphics, Windows 11 Home, Onsite Service - Carbon Black', 130000, 12, 'laptop2.jpg', 3),
(4, 'RTX 4070', 'ASUS Dual GeForce RTX™ 4070 EVO OC Edition 12GB GDDR6X is Designed for Broad Compatibility, with a 2.5-Slot Design, Axial-tech Fan Design, 0dB Technology, Auto-Extreme Technology, and More', 178000, 6, 'rtx.jpg', 2),
(5, 'ASUS Dual Radeon™ RX 9060 XT', 'ASUS Dual Radeon™ RX 9060 XT 16GB GDDR6 Graphics Card (PCIe 5.0, HDMI 2.1b, DisplayPort 2.1a, 2.5-Slot Design, Axial-tech Fan Design, 0dB Technology, and More)', 173000, 9, 'rx9060.jpg', 2),
(6, 'RTX 3050', 'ASUS Dual NVIDIA GeForce RTX 3050 6GB OC Edition Gaming Graphics Card - PCIe 4.0, 6GB GDDR6 Memory, HDMI 2.1, DisplayPort 1.4a, 2-Slot Design, Axial-tech Fan Design, 0dB Technology, Steel Bracket', 130000, 13, 'rtx 3050.jpg', 2),
(7, 'Radeon HD 6950', 'The AMD Radeon HD 6950 is a 40nm \"Cayman Pro\" graphics card released in December 2010 for $299, featuring 2GB/1GB GDDR5, 256-bit memory, and 1408 stream processors. It supports DirectX 11.2, OpenGL 4.4, and is noted for its ability to run roughly 70% of the top 13,000 PC games, though it is obsolete for modern gaming.', 12000, 5, 'Radeon HD 6950.jpg', 2),
(8, 'SKMEI 1787', 'Black watch', 50000, 3, 'SKMEI 1787.jpg', 4),
(9, 'Maxima GOLD', 'Gold watch', 45000, 6, 'Maxima GOLD.jpg', 4),
(10, 'Dollar Pencil', 'wooden', 300, 10, 'Dollar pencil.jpg', 1),
(11, 'Charcoal Pencil', 'Charcoal', 1000, 15, 'Charcoal pencil.jpg', 1),
(12, 'HP 15.6\" FHD Laptop 2026 Edition', 'HP 15.6\" FHD Laptop 2026 Edition with Copilot AI, 16GB RAM, 512GB SSD, Intel Processor, Long Battery Life, Lightweight 3.64 lbs, Microsoft 365, Windows 11 for Students & Office, Type-RJ45 Cable', 140000, 25, 'FHD Laptop.jpg', 3),
(13, 'ASUS ROG Strix G16 (2025) Gaming Laptop', 'ASUS ROG Strix G16 (2025) Gaming Laptop, 16” FHD+ 16:10 165Hz/3ms Display, NVIDIA® GeForce RTX™ 5050 Laptop GPU, Intel® Core™ i7 Processor 14650HX, 16GB DDR5, 1TB PCIe Gen 4 SSD, Wi-Fi 7, Win 11 Home', 380000, 4, 'ROG Strix.jpg', 3),
(14, 'Lenovo IdeaPad Slim', 'Lenovo IdeaPad Slim 3X - 2025 - Everyday AI Laptop - Copilot+ PC - 15.3\" WUXGA Display - 16 GB Memory - 512 GB Storage - Snapdragon® X - Luna Grey', 150000, 4, 'Lenovo IdeaPad Slim.jpg', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_item_table`
--
ALTER TABLE `order_item_table`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_item_table`
--
ALTER TABLE `order_item_table`
  ADD CONSTRAINT `order_item_table_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_table_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
