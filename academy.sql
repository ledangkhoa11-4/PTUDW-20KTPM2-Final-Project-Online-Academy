-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2022 at 02:45 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineacademy`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `IDCate` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`IDCate`, `Name`) VALUES
(1, 'Development'),
(2, 'Design'),
(3, 'Office Productivity'),
(4, 'Finance & Accounting'),
(5, 'Marketing');

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
  `IDChapter` int(11) NOT NULL,
  `Topic` varchar(50) NOT NULL,
  `Image` text NOT NULL,
  `TinyDesc` text NOT NULL,
  `FullDesc` text NOT NULL,
  `CourseFee` int(11) NOT NULL,
  `IDDiscount` int(11) NOT NULL,
  `IDInstructor` int(11) NOT NULL,
  `IsCompleted` tinyint(1) NOT NULL,
  `CreatedTime` date NOT NULL DEFAULT current_timestamp(),
  `Viewer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`ID`, `Name`, `IDChapter`, `Topic`, `Image`, `TinyDesc`, `FullDesc`, `CourseFee`, `IDDiscount`, `IDInstructor`, `IsCompleted`, `CreatedTime`, `Viewer`) VALUES
(1, 'HTML CSS from Zero to Hero', 1, '1', '', 'Learn modern HTML5, CSS3 and web design by building a stunning website for your portfolio! Includes flexbox and CSS Grid', '<ul>\r\n    <li>Become a modern and confident HTML and CSS developer, no prior knowledge needed!</li>\r\n    <li>Design and build a stunning real-world project for your portfolio from scratch</li>\r\n    <li>Modern, semantic and accessible HTML5</li>\r\n    <li>Modern CSS (previous CSS3), including flexbox and CSS Grid for layout</li>\r\n    <li>Important CSS concepts such as the box model, positioning schemes, inheritance, solving selector conflicts, etc.</li>\r\n    <li>A web design framework with easy-to-use rules and guidelines to design eye-catching websites</li>\r\n    <li>How to plan, sketch, design, build, test, and optimize a professional website</li>\r\n    <li>How to make websites work on every possible mobile device (responsive design)</li>\r\n    <li>How to use common components and layout patterns for professional website design and development</li>\r\n    <li>Developer skills such as reading documentation, debugging, and using professional tools</li>\r\n    <li>How to find and use free design assets such as images, fonts, and icons</li>\r\n    <li>Practice your skills with 10+ challenges (solutions included)</li>\r\n</ul>', 500000, 0, 0, 0, '2022-12-10', 0),
(2, 'React Native - The Practical Guide [2023]', 1, '1', '', 'Use React Native and your React knowledge to build native iOS and Android Apps - incl. Push Notifications, Hooks, Redux', '<ul>\r\n    <li>Learn how to use ReactJS to build real native mobile apps for iOS and Android</li>\r\n    <li>Develop cross-platform (iOS and Android) mobile apps without knowing Swift, ObjectiveC or Java/ Android</li>\r\n    <li>Explore React Native basics and advanced features!</li>\r\n    <li>Learn how to use key mobile app features like Google maps or the device camera</li>\r\n    <li>Create real-world native apps using React Native</li>\r\n    <li>Make truly reusable components that look great</li>\r\n    <li>Understand the terminology and concepts of Redux</li>\r\n    <li>Prototype and deploy your own applications to the Apple and Google Play Stores</li>\r\n    <li>Get up to speed with React design principles and methodologies</li>\r\n    <li>Discover mobile design patterns used by experienced engineers</li>\r\n</ul>', 500000, 0, 0, 0, '2022-12-10', 0),
(3, 'Complete C# Unity Game Developer 2D', 1, '2', '', 'Learn Unity in C# & Code Your First Five 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap', '<ul>\r\n    <li>Learn C#, a powerful modern language, from scratch. No prior programming experience is necessary.</li>\r\n    <li>Become excellent at using the Unity game engine.</li>\r\n    <li>Build a solid foundation for game design and game development that will help you build your own games.</li>\r\n    <li>Learn how object oriented programming works in practice.</li>\r\n    <li>Create playable game projects - good for your portfolio, or just for your own sense of achievement.</li>\r\n    <li>Transfer your knowledge from this course to .NET, other languages, and more.</li>\r\n    <li>Develop highly transferable coding problem solving skills.</li>\r\n    <li>Be part of an amazing and supportive community of people similar to you.</li> \r\n</ul>', 1280000, 0, 0, 0, '2022-12-10', 0),
(4, 'Visual Effects for Games in Unity - Beginner To In', 1, '2', '', 'By the end of this course you will have started your own portfolio as a Triple-A Visual Effects artist for Games.', '<ul>\r\n    <li>Learn how to create effects for games with Unity.</li>\r\n    <li>Fundamental concepts about Visual Effects.</li>\r\n    <li>Creating Textures, Meshes and Shaders for Game VFX.</li>\r\n    <li>How to structure AAA Visual Effects.</li>\r\n</ul>', 800000, 0, 0, 0, '2022-12-10', 0),
(5, 'Master Microsoft Word Beginner to Advanced', 3, '1', '', 'Master the most popular Word Processing tool, Microsoft Word. Microsoft Word 2010, Word 2013, Word 2016, Word 2019', '<ul>\r\n    <li>You will learn how to take full advantage of Microsoft Word</li>\r\n    <li>Begin with the basics of creating Microsoft Word documents</li>\r\n    <li>Various techniques to create dynamic layouts</li>\r\n    <li>Preparing documents for printing and exporting</li>\r\n    <li>Format documents effectively using Microsoft Word Styles</li>\r\n    <li>Control page formatting and flow with sections and page breaks</li>\r\n    <li>Create and Manage Table Layouts</li>\r\n    <li>Work with Tab Stops to Align Content Properly</li>\r\n    <li>Perform Mail Merges to create Mailing Labels and Form Letters</li>\r\n    <li>Build and Deliver Word Forms</li>\r\n    <li>Manage Templates</li>\r\n    <li>Track and Accept/Reject Changes to a Document</li>\r\n</ul>', 0, 0, 0, 0, '2022-12-10', 0);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `ID` int(11) NOT NULL,
  `PercentDiscount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`ID`, `PercentDiscount`) VALUES
(1, 100);

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
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `IDCate` int(11) NOT NULL,
  `IDTopic` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`IDCate`, `IDTopic`, `Name`) VALUES
(1, 1, 'Web development'),
(1, 2, 'Game Development'),
(2, 1, '3D & Animation'),
(2, 2, 'Design Tools'),
(3, 1, 'Microsoft Office'),
(3, 2, 'PowerPoint'),
(4, 1, 'Investing & Trading'),
(4, 2, 'CryptoCurrency');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `IDUser` int(11) NOT NULL,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` text NOT NULL,
  `Bio` text NOT NULL,
  `Role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='r';

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
-- Indexes for table `participate`
--
ALTER TABLE `participate`
  ADD PRIMARY KEY (`IDCourse`,`IDStudent`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`IDCate`,`IDTopic`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IDUser`);

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
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `IDCate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IDUser` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
