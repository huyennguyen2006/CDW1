-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2019 at 04:40 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test1`
--

-- --------------------------------------------------------

--
-- Table structure for table `airways`
--

CREATE TABLE IF NOT EXISTS `airways` (
`id` int(11) NOT NULL,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `airways`
--

INSERT INTO `airways` (`id`, `airways_name`) VALUES
(1, 'Quatar Airlines'),
(2, 'Vietnam Airlines'),
(3, 'JetStar');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE IF NOT EXISTS `card` (
`id` int(11) NOT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` int(11) NOT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ccv_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cus_list`
--

CREATE TABLE IF NOT EXISTS `cus_list` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flights_booking`
--

CREATE TABLE IF NOT EXISTS `flights_booking` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flist_id` int(11) NOT NULL,
  `fclass_id` int(11) NOT NULL,
  `flight_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_per` int(11) NOT NULL,
  `ticket_buy` datetime NOT NULL,
  `total_price` double NOT NULL,
  `card_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flight_class`
--

CREATE TABLE IF NOT EXISTS `flight_class` (
`id` int(11) NOT NULL,
  `fclass_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flight_class`
--

INSERT INTO `flight_class` (`id`, `fclass_name`) VALUES
(1, 'Economy'),
(2, 'Business'),
(3, 'Premium Economy');

-- --------------------------------------------------------

--
-- Table structure for table `flight_list`
--

CREATE TABLE IF NOT EXISTS `flight_list` (
`id` int(11) NOT NULL,
  `airways_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `place_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_from` time NOT NULL,
  `place_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_to` time NOT NULL,
  `duration` text COLLATE utf8_unicode_ci NOT NULL,
  `transit` int(11) NOT NULL,
  `total_sit` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flight_list`
--

INSERT INTO `flight_list` (`id`, `airways_id`, `city_id`, `place_from`, `time_from`, `place_to`, `time_to`, `duration`, `transit`, `total_sit`) VALUES
(1, 1, 0, 'TP Hồ Chí Minh (SNG)', '18:45:00', 'Hà Nội (HAN)\r\n', '02:55:00', '11h 10m', 1, 1200000),
(2, 1, 0, 'Hanoi (HAN)', '22:50:00', 'Đà Nẵng (DN)', '10:50:00', '36h 00m', 2, 1200000);

-- --------------------------------------------------------

--
-- Table structure for table `list_cities`
--

CREATE TABLE IF NOT EXISTS `list_cities` (
`id` int(11) NOT NULL,
  `cityname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `list_cities`
--

INSERT INTO `list_cities` (`id`, `cityname`, `shortname`) VALUES
(1, 'Hồ Chí Minh', 'SGN'),
(2, 'Hà Nội', 'HAN'),
(3, 'Đà Nẵng', 'DN'),
(4, 'Huế', 'HU');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(13) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL,
  `attempt` int(11) NOT NULL,
  `last_access` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `phone`, `remember_token`, `created_at`, `updated_at`, `active`, `attempt`, `last_access`) VALUES
(12, 'huyen@gmail.com', 'Huyen Nguyen', '$2y$10$HLF2bvhmarYSk3GwBEtNY.C1L.D47sSNyGa4KBc.5hXwHWMVMDUPm', 1234567890, NULL, '2019-03-05 08:42:31', '2019-03-05 08:42:31', 0, 0, '0000-00-00 00:00:00'),
(13, 'huyen098@gmail.com1', 'Huyen', '$2y$10$qmqH8tGHNJjCvY70lsqph.qSboDFi92R2fg8Pv1JTj0IaaZQbotWC', 1234567893, NULL, '2019-03-05 16:18:18', '2019-03-05 16:18:18', 0, 0, '0000-00-00 00:00:00'),
(14, 'huyen11@gmail.com', 'Huyen', '$2y$10$iaeWnFYLx7zqm9cF.tHtlOkKAlgVQ1JKh9.BzUfSw023EBK2Hs8YS', 1234567890, NULL, '2019-03-05 16:19:19', '2019-03-05 16:19:19', 0, 0, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airways`
--
ALTER TABLE `airways`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `airways_id` (`id`), ADD KEY `airways_id_2` (`id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cus_list`
--
ALTER TABLE `cus_list`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `flights_booking`
--
ALTER TABLE `flights_booking`
 ADD PRIMARY KEY (`id`), ADD KEY `flight_id` (`flist_id`), ADD KEY `flights_booking_ibfk_1` (`user_id`), ADD KEY `card_id` (`card_id`), ADD KEY `fclass_id` (`fclass_id`);

--
-- Indexes for table `flight_class`
--
ALTER TABLE `flight_class`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flight_list`
--
ALTER TABLE `flight_list`
 ADD PRIMARY KEY (`id`), ADD KEY `airways_id` (`airways_id`);

--
-- Indexes for table `list_cities`
--
ALTER TABLE `list_cities`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airways`
--
ALTER TABLE `airways`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cus_list`
--
ALTER TABLE `cus_list`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `flights_booking`
--
ALTER TABLE `flights_booking`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `flight_class`
--
ALTER TABLE `flight_class`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `flight_list`
--
ALTER TABLE `flight_list`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `list_cities`
--
ALTER TABLE `list_cities`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cus_list`
--
ALTER TABLE `cus_list`
ADD CONSTRAINT `cus_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `flights_booking`
--
ALTER TABLE `flights_booking`
ADD CONSTRAINT `flights_booking_ibfk_1` FOREIGN KEY (`flist_id`) REFERENCES `flight_list` (`id`),
ADD CONSTRAINT `flights_booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
ADD CONSTRAINT `flights_booking_ibfk_3` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`),
ADD CONSTRAINT `flights_booking_ibfk_4` FOREIGN KEY (`fclass_id`) REFERENCES `flight_class` (`id`);

--
-- Constraints for table `flight_list`
--
ALTER TABLE `flight_list`
ADD CONSTRAINT `flight_list_ibfk_1` FOREIGN KEY (`airways_id`) REFERENCES `airways` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
