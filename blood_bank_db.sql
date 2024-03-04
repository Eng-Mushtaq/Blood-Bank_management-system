-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2024 at 01:24 AM
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
-- Database: `blood_bank_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `city`, `street`, `state`, `user_id`) VALUES
(6, 'Abha', 'main street', 'Abha', 12),
(7, 'Jeddah', 'King Kh', 'jeddah', 13),
(8, 'Ryadh', 'ryadh street ', 'Asir', 14),
(9, 'Makkah', 'makkah', '', 15),
(10, 'Tabuok', 'Tabuk', 'state', 16),
(11, 'jazan', 'asir', 'jazan', 17);

-- --------------------------------------------------------

--
-- Table structure for table `personal_information`
--

CREATE TABLE `personal_information` (
  `id` int(11) NOT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `total_donate` int(11) DEFAULT NULL,
  `last_donate` date DEFAULT NULL,
  `about_you` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personal_information`
--

INSERT INTO `personal_information` (`id`, `profession`, `religion`, `date_of_birth`, `total_donate`, `last_donate`, `about_you`, `user_id`) VALUES
(6, 'engineer', '', NULL, 2, '2024-02-29', '', 12),
(7, 'engineer', 'muslim', NULL, 0, '2024-02-29', 'i will give blood ', 13),
(8, 'Engineer', 'Muslim', NULL, 0, '2024-02-27', 'not', 14),
(9, '', 'muslim', NULL, 0, '2024-02-15', '', 15),
(10, 'engineer', 'muslim', NULL, 0, '0000-00-00', 'poiuytrew', 16),
(11, 'engineer', 'muslim', NULL, 6, '2024-02-22', 'oiuytrew', 17);

-- --------------------------------------------------------

--
-- Table structure for table `request_donor`
--

CREATE TABLE `request_donor` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `blood_type` varchar(10) DEFAULT NULL,
  `required_total_donate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request_donor`
--

INSERT INTO `request_donor` (`id`, `patient_id`, `date`, `blood_type`, `required_total_donate`) VALUES
(1, 11, '2024-02-26', 'B+', 5),
(2, 11, '2024-02-27', 'B+', 2),
(3, 17, '2024-02-27', 'B-', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `bloodtype` varchar(5) DEFAULT NULL,
  `usertype` tinyint(4) DEFAULT 0,
  `image_profile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `age`, `phone`, `gender`, `bloodtype`, `usertype`, `image_profile`) VALUES
(3, 'Wehad Mohammed', 'Wehad@example.com', 'password3', 28, '3456789012', 0, 'B+', 1, './assets/images/slider/women.jpg'),
(11, 'Mohammed', 'Moh@gmail.com', '', NULL, '017162150', NULL, NULL, 1, NULL),
(12, 'uaer', 'user@gmail.com', '', NULL, '555555555', NULL, NULL, 0, NULL),
(13, 'ALi Ahmed', 'ali@gmail.com', '', NULL, '123456789', NULL, NULL, 1, NULL),
(14, 'Anwar', 'anwar@gmail.com', '', NULL, '+967772089560', NULL, NULL, 1, NULL),
(15, 'Abdulrahman', 'abd@gmail.com', '', NULL, '12345678', NULL, NULL, 1, NULL),
(16, 'nnn', 'n@gmail.com', '', NULL, '017162150', NULL, 'A-', 1, NULL),
(17, 'Salem', 'Salem@gmail.com', '', NULL, '017162150', 0, 'B-', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `personal_information`
--
ALTER TABLE `personal_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `request_donor`
--
ALTER TABLE `request_donor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_information`
--
ALTER TABLE `personal_information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `request_donor`
--
ALTER TABLE `request_donor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `personal_information`
--
ALTER TABLE `personal_information`
  ADD CONSTRAINT `personal_information_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `request_donor`
--
ALTER TABLE `request_donor`
  ADD CONSTRAINT `request_donor_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
