-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 26, 2024 at 05:53 PM
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
-- Database: `taskmanager`
--

-- --------------------------------------------------------

--
-- Table structure for table `task_tbl`
--

CREATE TABLE `task_tbl` (
  `taskId` int(11) NOT NULL,
  `taskName` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` enum('comoleted','incompleted') NOT NULL DEFAULT 'incompleted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_tbl`
--

INSERT INTO `task_tbl` (`taskId`, `taskName`, `description`, `status`) VALUES
(2, 'analysis', 'test', 'incompleted'),
(3, 'analysis data', 'test1', 'comoleted'),
(4, 'analysis table', 'test 2', 'incompleted'),
(5, 'analysis row', 'test 3', 'incompleted'),
(6, 'analysis column', 'test 4', 'incompleted'),
(9, 'analysis', 'test', 'incompleted'),
(10, 'analysis', 'test', 'incompleted'),
(11, 'analysis', 'test', 'incompleted'),
(12, 'analysis', 'test', 'incompleted'),
(13, 'analysis', 'test', 'incompleted'),
(14, 'analysis', 'test', 'incompleted'),
(15, 'Desiging', 'test', 'incompleted'),
(16, 'Desiging123', 'test', 'incompleted'),
(17, 'Desiging123', 'test', 'incompleted'),
(18, 'Desiging123', 'test', 'incompleted'),
(19, 'Desiging123', 'test', 'incompleted'),
(20, 'Desigi', '', 'incompleted'),
(21, 'Desigi', '', 'incompleted');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `task_tbl`
--
ALTER TABLE `task_tbl`
  ADD PRIMARY KEY (`taskId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `task_tbl`
--
ALTER TABLE `task_tbl`
  MODIFY `taskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
