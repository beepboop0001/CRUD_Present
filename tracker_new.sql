-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 02:20 PM
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
-- Table structure for table `monthly_summary_tb`
--

CREATE TABLE `monthly_summary_tb` (
  `summary_ID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Month` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Total_Expenses` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monthly_summary_tb`
--

INSERT INTO `monthly_summary_tb` (`summary_ID`, `Username`, `Month`, `Year`, `Total_Expenses`) VALUES
(2, 'eee', 2, 2025, 1076),
(3, 'jane', 2, 2025, 2900),
(4, 'me', 1, 2025, 2000),
(5, 'owen', 2, 2025, 2500),
(6, 'wew', 2, 2025, 1375),
(9, 'jonny', 2, 2025, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `tracker_tb`
--

CREATE TABLE `tracker_tb` (
  `tracker_ID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
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

INSERT INTO `tracker_tb` (`tracker_ID`, `Username`, `Food`, `Rent`, `Bills`, `Transportation`, `DateTime`, `Total_Cost`) VALUES
(14, 'wew', 321, 421, 312, 321, '2025-02-15 16:28:08', 1375),
(15, 'eee', 312, 312, 31, 421, '2025-02-15 16:28:15', 1076),
(19, 'me', 500, 1000, 200, 300, '2025-01-15 06:30:00', 2000),
(20, 'owen', 600, 1200, 300, 400, '2025-02-16 06:30:00', 2500),
(21, 'jane', 700, 1300, 400, 500, '2025-02-20 06:30:00', 2900),
(22, 'jonny', 100, 200, 300, 400, '2025-02-16 13:19:46', 1000);

--
-- Triggers `tracker_tb`
--
DELIMITER $$
CREATE TRIGGER `before_insert_tracker` BEFORE INSERT ON `tracker_tb` FOR EACH ROW BEGIN
    SET NEW.Total_Cost = NEW.Food + NEW.Bills + NEW.Rent + NEW.Transportation;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_tracker` BEFORE UPDATE ON `tracker_tb` FOR EACH ROW BEGIN
    SET NEW.Total_Cost = NEW.Food + NEW.Bills + NEW.Rent + NEW.Transportation;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_monthly_summary` AFTER INSERT ON `tracker_tb` FOR EACH ROW BEGIN
    INSERT INTO `monthly_summary_tb` (Username, Month, Year, Total_Expenses)
    VALUES (NEW.Username, MONTH(NEW.DateTime), YEAR(NEW.DateTime), NEW.Total_Cost)
    ON DUPLICATE KEY UPDATE Total_Expenses = Total_Expenses + NEW.Total_Cost;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `monthly_summary_tb`
--
ALTER TABLE `monthly_summary_tb`
  ADD PRIMARY KEY (`summary_ID`),
  ADD KEY `Username` (`Username`);

--
-- Indexes for table `tracker_tb`
--
ALTER TABLE `tracker_tb`
  ADD PRIMARY KEY (`tracker_ID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `monthly_summary_tb`
--
ALTER TABLE `monthly_summary_tb`
  MODIFY `summary_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tracker_tb`
--
ALTER TABLE `tracker_tb`
  MODIFY `tracker_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `monthly_summary_tb`
--
ALTER TABLE `monthly_summary_tb`
  ADD CONSTRAINT `monthly_summary_tb_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `tracker_tb` (`Username`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
