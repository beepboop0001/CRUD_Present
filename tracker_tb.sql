-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2025 at 12:53 PM
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
-- Database: `tracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `tracker_tb`
--

CREATE TABLE `tracker_tb` (
  `tracker_ID` int(11) NOT NULL,
  `Food` int(11) NOT NULL,
  `Rent` int(11) NOT NULL,
  `Bills` int(11) NOT NULL,
  `Transportation` int(11) NOT NULL,
  `DateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Total_Cost` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tracker_tb`
--

INSERT INTO `tracker_tb` (`tracker_ID`, `Food`, `Rent`, `Bills`, `Transportation`, `DateTime`, `Total_Cost`) VALUES
(3, 700, 100, 500, 600, '2025-02-06 11:45:48', 1900);

--
-- Triggers `tracker_tb`
--
DELIMITER $$
CREATE TRIGGER `before_insert_tracker_tb` BEFORE INSERT ON `tracker_tb` FOR EACH ROW BEGIN
    SET NEW.Total_Cost = NEW.Food + NEW.Bills + NEW.Rent + NEW.Transportation;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_tracker_tb` BEFORE UPDATE ON `tracker_tb` FOR EACH ROW BEGIN
    SET NEW.Total_Cost = NEW.Food + NEW.Bills + NEW.Rent + NEW.Transportation;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tracker_tb`
--
ALTER TABLE `tracker_tb`
  ADD PRIMARY KEY (`tracker_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tracker_tb`
--
ALTER TABLE `tracker_tb`
  MODIFY `tracker_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
