-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2022 at 03:48 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `academy`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `IDCate` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chapter`
--

CREATE TABLE `chapter` (
  `IDCourse` int(11) NOT NULL,
  `IDChapter` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `circulativevideo`
--

CREATE TABLE `circulativevideo` (
  `IDCourse` int(11) NOT NULL,
  `IDChapter` int(11) NOT NULL,
  `No` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `URL` text NOT NULL,
  `Length` double NOT NULL,
  `IsPreview` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Topic` varchar(50) NOT NULL,
  `Image` text NOT NULL,
  `TinyDesc` text NOT NULL,
  `FullDesc` text NOT NULL,
  `CourseFee` int(11) NOT NULL,
  `IDDiscount` int(11) NOT NULL,
  `IDInstructor` int(11) NOT NULL,
  `IsCompleted` tinyint(1) NOT NULL,
  `CreatedTime` date NOT NULL,
  `Viewer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `ID` int(11) NOT NULL,
  `PercentDiscount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `IDInstructor` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  `Bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `participate`
--

CREATE TABLE `participate` (
  `IDCourse` int(11) NOT NULL,
  `IDStudent` int(11) NOT NULL,
  `Feedback` text NOT NULL,
  `Rating` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `IDStudent` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `IDCate` int(11) NOT NULL,
  `IDTopic` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `watched`
--

CREATE TABLE `watched` (
  `IDStudent` int(11) NOT NULL,
  `IDCourse` int(11) NOT NULL,
  `IDChapter` int(11) NOT NULL,
  `No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `watchhistory`
--

CREATE TABLE `watchhistory` (
  `IDStudent` int(11) NOT NULL,
  `IDCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`IDCate`);

--
-- Indexes for table `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`IDCourse`,`IDChapter`);

--
-- Indexes for table `circulativevideo`
--
ALTER TABLE `circulativevideo`
  ADD PRIMARY KEY (`IDCourse`,`IDChapter`,`No`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`IDInstructor`);

--
-- Indexes for table `participate`
--
ALTER TABLE `participate`
  ADD PRIMARY KEY (`IDCourse`,`IDStudent`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`IDStudent`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`IDCate`,`IDTopic`);

--
-- Indexes for table `watched`
--
ALTER TABLE `watched`
  ADD PRIMARY KEY (`IDStudent`,`IDCourse`,`IDChapter`,`No`);

--
-- Indexes for table `watchhistory`
--
ALTER TABLE `watchhistory`
  ADD PRIMARY KEY (`IDStudent`,`IDCourse`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
