-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2023 at 08:27 AM
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

--
-- Dumping data for table `chapter`
--

INSERT INTO `chapter` (`IDCourse`, `IDChapter`, `Name`) VALUES
(1, 1, 'Introduction'),
(1, 2, 'JavaScript Language Fundmentals'),
(1, 3, 'DOM Manipulation & Events'),
(1, 4, 'DOM Projects'),
(2, 1, 'Introduction'),
(2, 2, 'React Basics & JSX'),
(2, 3, 'Components, Props & State'),
(2, 4, 'Forms, Validation & Simple Animation'),
(3, 1, 'Introduction'),
(4, 1, 'Introduction'),
(4, 2, 'Internal control'),
(4, 3, 'Language Fundmentals'),
(5, 1, 'Introduction'),
(5, 2, 'Non-current assets'),
(6, 1, 'Getting Started'),
(6, 2, 'Realistic Landscapes'),
(6, 3, 'Vectors, Rotators, and Trigonometry'),
(6, 4, 'Collision and Overlaps'),
(7, 1, 'Desktop Applications'),
(7, 2, 'Applets and Animation'),
(7, 3, 'Appendix'),
(8, 1, 'Before We Begin'),
(9, 1, 'How to crop an image in Adobe Photoshop CC'),
(9, 2, 'How to crop an image for a frame in Adobe Photosho'),
(9, 3, 'CHỈNH SỬA HÌNH ẢNH VỚI PHOTOSHOP'),
(9, 4, 'How to enhance colors in Photoshop using vibrance'),
(9, 5, 'Oil Painting'),
(10, 1, 'GIỚI THIỆU TỔNG QUAN VỀ ILLUSTRATOR'),
(11, 1, 'What can InDesign Create?'),
(11, 2, 'Typographical Settings'),
(11, 3, 'Gradients'),
(12, 1, 'Getting ready to start your first animation'),
(12, 2, 'Dive in for beginners: Create your first Motion Gr'),
(12, 3, 'How to use the Alpha Inverted Track Mattes'),
(12, 4, 'How to combine & Animate Animator Properties'),
(13, 1, 'Getting Ready For This Section'),
(13, 2, 'Getting Ready For This Section'),
(13, 3, 'Project — Removing an Item from Your Wishlist'),
(13, 4, 'Constructive Feedback'),
(14, 1, 'Introduction to Call Options and Put Options, Buye'),
(14, 2, 'Introduction to Time Decay, Implied Volatility and'),
(14, 3, 'Buying / Selling Call and Put Options - Options be'),
(14, 4, 'Options Market Structure, Strategy Box and Case St'),
(15, 1, 'Introduction and Course Orientation'),
(15, 2, 'Cryptocurrency Fundamentals.'),
(42, 1, 'Intro to Facebook marketing'),
(42, 2, 'Facebook Page'),
(42, 3, 'Facebook Ads'),
(43, 1, 'Modeling Our First Character'),
(43, 2, 'Texturing Our Character'),
(43, 3, 'Animating Non Proportional Eyes'),
(44, 1, 'How to Study this course?! In a Udemy-Technical-Se'),
(44, 2, 'More Sketch Commands: Mirror, Offset, Patterns and'),
(44, 3, 'The Features: Lofted Boss and Lofted Cut'),
(44, 4, 'Practice Exercises'),
(45, 1, 'Flash Fill in Excel - Updated'),
(45, 2, 'Pivot Table - Manage Field Area'),
(45, 3, 'Advance Math Function'),
(46, 1, 'Welcome to Office Ninja Training'),
(46, 2, 'Changing The Values Field Settings'),
(46, 3, 'Adding And Manipulating Multiple Fields'),
(47, 1, 'Edit Points - Advanced Tip'),
(47, 2, 'Adding a Vector File'),
(47, 3, 'Transition Basics'),
(48, 1, 'LinkedIn Digital Marketing'),
(48, 2, 'Image Ads 1'),
(48, 3, 'Facebook Digital Marketing');

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

--
-- Dumping data for table `circulativevideo`
--

INSERT INTO `circulativevideo` (`IDCourse`, `IDChapter`, `No`, `Name`, `URL`, `Length`, `IsPreview`) VALUES
(1, 1, 1, 'Audit and other assurance engagements', 'fLHejDNA_CM', 830, 1),
(1, 1, 2, 'Statutory audit and regulation', 'Ay3d_mNPEno', 3825, 0),
(1, 1, 3, 'Corporate governance', '6Kc5X_JhbxQ', 3802, 0),
(1, 1, 4, 'Non-current assets', 'VFXKFmbjmpw', 3812, 0),
(1, 1, 5, 'Receivables', '0nRKIqACHmo', 3806, 0),
(1, 2, 1, 'Type Conversion', '_mIpJ9H2ODk', 3838, 1),
(1, 2, 2, 'Numbers & The Math Object', '2U9xVnA_9mc', 3566, 0),
(1, 2, 3, 'String Methods & Concatenation', 'qyyZlGKBFCo', 3565, 0),
(1, 2, 4, 'Template Literals', '95zXiCITbNM', 3812, 0),
(1, 2, 5, 'Arrays & Array Methods', 'xQSXZqbBcG4', 3837, 0),
(1, 3, 1, 'DOM Selectors For Multiple Elements', 'fQTlI_Q3DQE', 3565, 1),
(1, 3, 2, 'Traversing The DOM', 'ivgUOJ1cOEw', 3800, 0),
(1, 3, 3, 'Creating Elements', 'fRCrUXteg0o', 3835, 0),
(1, 3, 4, 'Removing & Replacing Elements', 'XbR1oUj7fPo', 3825, 0),
(1, 3, 5, 'Event Listeners & The Event Object', '5UorbFfW9pc', 3838, 0),
(1, 4, 1, 'Task List [Part 1] - UI & Add Task Items', 'Rdmd10IYyOI', 3836, 1),
(1, 4, 2, 'Task List [Part 2] - Delete & Filter Tasks', 'VFXKFmbjmpw', 3812, 1),
(1, 4, 3, 'Task List [Part 3] - Persist To Local Storage', 'h4XC-fMfm7Y', 3812, 0),
(2, 1, 1, 'Environment Setup', 'fLHejDNA_CM', 830, 1),
(2, 1, 2, 'Code Repos', 'Ay3d_mNPEno', 3825, 0),
(2, 1, 3, 'Links & Resources', '6Kc5X_JhbxQ', 3802, 0),
(2, 2, 1, 'Initializing React', '95zXiCITbNM', 3812, 1),
(2, 2, 2, 'Intro To JSX', 'xQSXZqbBcG4', 3837, 1),
(2, 2, 3, 'Dynamic Values & LIsts in JSX', 'fQTlI_Q3DQE', 3565, 0),
(2, 3, 1, 'Creating Your First Component & Props', 'ivgUOJ1cOEw', 3800, 0),
(2, 3, 2, 'Adding Styles To A Component', 'fRCrUXteg0o', 3835, 0),
(2, 3, 3, 'State & useState Hook', 'XbR1oUj7fPo', 3825, 0),
(2, 4, 1, 'Form Input & State', '5UorbFfW9pc', 3838, 0),
(2, 4, 2, 'Custom Button Component', 'Rdmd10IYyOI', 3836, 0),
(2, 4, 3, 'Real-Time Validation', 'VFXKFmbjmpw', 3812, 0),
(3, 1, 1, 'Humanize-Duration', 'RK1K2bCg4J8', 7806, 0),
(4, 1, 1, 'Ethics', '95zXiCITbNM', 3812, 1),
(4, 1, 2, 'Internal audit', 'xQSXZqbBcG4', 3837, 1),
(4, 1, 3, 'Risk assessment', 'fQTlI_Q3DQE', 3565, 1),
(4, 2, 1, 'Introduction to audit evidence', 'fRCrUXteg0o', 3835, 0),
(4, 2, 2, 'Audit procedures and sampling', 'Rdmd10IYyOI', 3836, 0),
(4, 3, 1, 'Inventory', 'VFXKFmbjmpw', 3812, 0),
(4, 3, 2, 'Receivables', '0nRKIqACHmo', 3806, 0),
(4, 3, 3, 'Cash and bank', 'kjbTXfwZNSE', 3801, 0),
(5, 1, 1, 'Audit planning and documentation', 'ivgUOJ1cOEw', 3800, 0),
(5, 1, 2, 'Internal control', 'XbR1oUj7fPo', 3825, 0),
(5, 2, 1, 'Receivables', 'VFXKFmbjmpw', 3812, 0),
(5, 2, 2, 'Tests of control', '5UorbFfW9pc', 3838, 0),
(6, 1, 1, 'Installing Unreal Engine', 'u-xYr5fRsjY', 12884, 1),
(6, 1, 2, 'Navigating The Viewport', 'u-xYr5fRsjY', 12884, 1),
(6, 2, 1, 'Moving & Placing Actors', 'u-xYr5fRsjY', 12884, 0),
(6, 2, 2, 'Project Setup', 'u-xYr5fRsjY', 12884, 0),
(6, 3, 1, 'Pawns and Actor Location', 'u-xYr5fRsjY', 12884, 0),
(6, 3, 2, 'Get Forward Vector', 'u-xYr5fRsjY', 12884, 0),
(6, 4, 1, 'Booleans and Branches', 'u-xYr5fRsjY', 12884, 0),
(7, 1, 1, 'Video Quality', 'u-xYr5fRsjY', 0, 1),
(7, 1, 2, 'How to Get Help', 'u-xYr5fRsjY', 0, 0),
(7, 2, 1, 'Which Version of Java?', 'u-xYr5fRsjY', 0, 0),
(7, 3, 1, 'Introduction to Classes and Objects', 'u-xYr5fRsjY', 0, 1),
(8, 1, 1, 'Install necessary component', 'qsS4QA2GY8c', 3750, 0),
(9, 1, 1, 'How to fix an image using levels in Photoshop CC', 'u-xYr5fRsjY', 0, 1),
(9, 1, 2, 'How to fix an image using levels in Photoshop CC', 'u-xYr5fRsjY', 12884, 1),
(9, 2, 1, 'How to fix an image using levels in Photoshop CC', 'u-xYr5fRsjY', 12884, 0),
(9, 3, 1, 'How to create text in Adobe Photoshop CC', 'u-xYr5fRsjY', 12884, 0),
(9, 4, 1, 'How to fake realistic motion blur in Adobe Photosh', 'u-xYr5fRsjY', 12884, 0),
(9, 5, 1, 'The Lens Flare right of passage in Adobe Photoshop', 'u-xYr5fRsjY', 12884, 0),
(10, 1, 1, 'Những sắc màu đẹp nhất', 'RK1K2bCg4J8', 7806, 0),
(11, 1, 1, 'Panels', 'u-xYr5fRsjY', 12884, 1),
(11, 1, 2, 'Customizing the workspace', 'u-xYr5fRsjY', 12884, 1),
(11, 2, 1, 'Placing Text from a Microsoft Word Document', 'u-xYr5fRsjY', 12884, 0),
(11, 3, 1, 'Colors & Swatches', 'u-xYr5fRsjY', 12884, 0),
(11, 3, 2, 'Parent (Master) Pages Overview & Intro', 'u-xYr5fRsjY', 12884, 0),
(12, 1, 1, 'Dive in for beginners: Getting the Graphics', 'u-xYr5fRsjY', 12884, 1),
(12, 1, 2, '*Download your Resources: Assets/Graphics and Comp', 'u-xYr5fRsjY', 12884, 1),
(12, 2, 1, 'CC 2023 : Render your work and upload to Social Me', 'u-xYr5fRsjY', 12884, 0),
(12, 2, 2, 'How to Ease your animation on a Motion Path', 'u-xYr5fRsjY', 12884, 0),
(12, 3, 1, 'Revealing Layers with Track Mattes', 'u-xYr5fRsjY', 12884, 0),
(12, 3, 2, 'Practice Activity: The Luma Matte Challenge', 'u-xYr5fRsjY', 12884, 0),
(12, 4, 1, 'How to use Shape layer as Path', 'u-xYr5fRsjY', 12884, 0),
(13, 1, 1, 'Introduction To Sketching', 'u-xYr5fRsjY', 12884, 1),
(13, 1, 2, 'Sketching User Flows', 'u-xYr5fRsjY', 12884, 1),
(13, 2, 1, 'Prototyping in Figma — Flows and Starting Points', 'u-xYr5fRsjY', 12884, 0),
(13, 2, 2, 'Prototyping in Figma — Connections', 'u-xYr5fRsjY', 12884, 0),
(13, 3, 1, 'Project — Finding a Product', 'u-xYr5fRsjY', 12884, 0),
(13, 3, 2, 'Why Is Feedback Important?', 'u-xYr5fRsjY', 12884, 0),
(13, 4, 1, 'Prototyping in Figma — Prototype Presentation', 'u-xYr5fRsjY', 12884, 0),
(14, 1, 1, 'Importance of Options', 'u-xYr5fRsjY', 12884, 1),
(14, 2, 1, 'Trade set up for weekly Options (Indicators Settin', 'u-xYr5fRsjY', 12884, 1),
(14, 2, 2, 'Live Trade- Trading with Pivot Points (Reliance In', 'u-xYr5fRsjY', 12884, 0),
(14, 3, 1, 'Trade Results- Bull Call spread Strategy', 'u-xYr5fRsjY', 12884, 0),
(14, 3, 2, 'Live Trade (Indiabulls Housing)', 'u-xYr5fRsjY', 12884, 0),
(14, 4, 1, 'Trade Results- Bear Call spread Strategy', 'u-xYr5fRsjY', 12884, 0),
(14, 4, 2, 'A profitable condition for Call Back Spread contin', 'u-xYr5fRsjY', 12884, 0),
(15, 1, 1, 'Different Types of Cryptocurrency', 'u-xYr5fRsjY', 12884, 1),
(15, 1, 2, 'Tracking the Value of Cryptocurrencies', 'u-xYr5fRsjY', 12884, 0),
(15, 2, 1, 'Store Your Cryptocurrency', 'u-xYr5fRsjY', 12884, 1),
(42, 1, 1, 'A Few Quick Tips (CLICK \"Resources\")', 'LXb3EKWsInQ', 314, 1),
(42, 1, 2, 'Switch to Meta Business Manager', 'LXb3EKWsInQ', 314, 0),
(42, 2, 1, 'How to Create and Optimize a Facebook Page', 'KJwYBJMSbPI', 4219, 0),
(42, 2, 2, 'What Makes your Facebook Page Awesome?', 'KJwYBJMSbPI', 4219, 0),
(42, 3, 1, 'The Complete Facebook Ad Copy + Creative Guide', 'KJwYBJMSbPI', 4219, 0),
(42, 3, 2, 'Facebook Ads Funnel by Coursenvy', 'KJwYBJMSbPI', 4219, 0),
(43, 1, 1, 'Adding Materials to Our Character', 'KJwYBJMSbPI', 4219, 1),
(43, 1, 2, 'Making The Eyes & Mouth', 'KJwYBJMSbPI', 4219, 1),
(43, 1, 3, 'Parenting & Empties', 'KJwYBJMSbPI', 4219, 0),
(43, 2, 1, 'How to Setup Ik Constraints', 'KJwYBJMSbPI', 4219, 0),
(43, 2, 2, 'Modeling Miscellaneous Items For Scene', 'KJwYBJMSbPI', 4219, 0),
(43, 3, 1, 'Adding The Teeth & Tweaking', 'KJwYBJMSbPI', 4219, 0),
(44, 1, 1, 'What is SOLIDWORKS!?', 'KJwYBJMSbPI', 4219, 1),
(44, 1, 2, 'Select a Plane to Sketch on', 'KJwYBJMSbPI', 4219, 1),
(44, 2, 1, 'Section Conclusion: Let us Start Sketching', 'KJwYBJMSbPI', 4219, 0),
(44, 2, 2, 'Reference Geometries', 'KJwYBJMSbPI', 4219, 0),
(44, 3, 1, 'Selecting Materials for Your Parts', 'KJwYBJMSbPI', 4219, 0),
(44, 4, 1, 'EX1', 'KJwYBJMSbPI', 4219, 0),
(45, 1, 1, 'Text Function - Mid task and solution', 'KJwYBJMSbPI', 4219, 1),
(45, 1, 2, 'Concat and Textjoin Function - Updated', 'KJwYBJMSbPI', 4219, 0),
(45, 2, 1, 'Pivot Table - Value Field, Report and more', 'KJwYBJMSbPI', 4219, 0),
(45, 2, 2, 'Pivot Table - Value Field, Report and more', 'KJwYBJMSbPI', 4219, 1),
(45, 2, 3, 'Pivot Table - Insert Calculated Field', 'KJwYBJMSbPI', 4219, 0),
(45, 3, 1, 'NETWORKDAYS Function', 'KJwYBJMSbPI', 4219, 1),
(45, 3, 2, 'KJwYBJMSbPI', 'KJwYBJMSbPI', 4219, 0),
(46, 1, 1, 'Creating Your First Pivot Table', 'VyJrduH2rNM', 0, 0),
(46, 1, 2, 'Exercise: Create a Pivot Table', 'dOYXrTr7Txg', 6961, 1),
(46, 1, 3, 'Answer: Create a Pivot Table', 'DScZ-qSH4Bw', 2345, 1),
(46, 2, 1, 'Exercise: Changing the Values Field Settings', 'YdtBEFK_HgI', 17583, 0),
(46, 2, 2, 'Answer: Drill-To Feature', 'hhSTf2xF3wQ', 14862, 1),
(46, 2, 3, 'Formatting And Pivot Table Design', 'UmuUVRoWLlI', 2496, 1),
(46, 3, 1, 'Exercise: Adding and Manipulating Multiple Fields', 'uBj2cnuCA0A', 2544, 0),
(46, 3, 2, 'Filtering And Slicing Pivot Data', 'ldqfm5SaRhc', 3776, 1),
(46, 3, 3, 'Answer: Filtering & Slicing Pivot Data', 'LwtOD-Cza4A', 5886, 1),
(47, 1, 1, 'Selecting the Color Scheme (Concept)', 'UYBRXOxVDIA', 345, 1),
(47, 1, 2, 'Selecting the Fonts (Typography)', 'pwCaaico9M8', 296, 0),
(47, 1, 3, 'Adding a Vector File', 'v1ADEPnPt54', 221, 0),
(47, 2, 1, 'Slide 1, 2 - Animation', 'OqdA6DKV1Fs', 266, 1),
(47, 2, 2, 'Slide 3 - Animation', '0yE4wEi8CFM', 329, 0),
(47, 2, 3, 'Slide 4. 4 Steps', 'vVhKA9Av6vA', 300, 0),
(47, 3, 1, 'Slide 5 & 6. Timeline - Animation', 'xmS9kH9q17E', 330, 1),
(47, 3, 2, 'Slide 7. World Map', 'AiD1a2fFFLw', 326, 0),
(47, 3, 3, 'Slide 8. Country Map', 'rKUieRwoYAI', 217, 0),
(48, 1, 1, 'Message Ads', 'redFrGBZoJY', 248, 1),
(48, 1, 2, 'Conversation Ads', 'KhTCatAKVpk', 267, 0),
(48, 1, 3, 'Conversation Ads Tutorial', 'E1nxkY3NXEE', 12089, 0),
(48, 2, 1, 'Image Ads Tutorial', 'epgeyrCUpFU', 20151, 1),
(48, 2, 2, 'Video Ads', 'FTqrQsSIKR0', 10801, 0),
(48, 2, 3, 'Video Ads Tutorial', 'u-xYr5fRsjY', 12884, 0),
(48, 3, 1, 'Introduction to Facebook Ads for Consumer Marketin', 'u-xYr5fRsjY', 12884, 1),
(48, 3, 2, 'How to Set Up a Facebook Ads Awareness Campaign to', 'u-xYr5fRsjY', 12884, 0),
(48, 3, 3, 'Awareness Objective: People Need to Hear about You', 'u-xYr5fRsjY', 12884, 0);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `ID` int(11) NOT NULL,
  `Name` varchar(120) NOT NULL,
  `IDCategory` int(11) NOT NULL,
  `Topic` varchar(50) NOT NULL,
  `Image` text NOT NULL,
  `TinyDesc` text NOT NULL,
  `FullDesc` text NOT NULL,
  `CourseFee` int(11) NOT NULL,
  `IDDiscount` int(11) NOT NULL,
  `IDInstructor` int(11) NOT NULL,
  `IsCompleted` tinyint(1) NOT NULL,
  `CreatedTime` datetime NOT NULL DEFAULT current_timestamp(),
  `ModifiedTime` datetime NOT NULL DEFAULT current_timestamp(),
  `Viewer` int(11) NOT NULL,
  `disable` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`ID`, `Name`, `IDCategory`, `Topic`, `Image`, `TinyDesc`, `FullDesc`, `CourseFee`, `IDDiscount`, `IDInstructor`, `IsCompleted`, `CreatedTime`, `ModifiedTime`, `Viewer`, `disable`) VALUES
(1, 'HTML CSS from Zero to Hero', 1, '1', '', 'Learn modern HTML5, CSS3 and web design by building a stunning website for your portfolio! Includes flexbox and CSS Grid', '<ul>\r\n<li>Become a modern and confident HTML and CSS developer, no prior knowledge needed!</li>\r\n<li>Design and build a stunning real-world project for your portfolio from scratch</li>\r\n<li>Modern, semantic and accessible HTML5</li>\r\n<li>Modern CSS (previous CSS3), including flexbox and CSS Grid for layout</li>\r\n<li>Important CSS concepts such as the box model, positioning schemes, inheritance, solving selector conflicts, etc.</li>\r\n<li>A web design framework with easy-to-use rules and guidelines to design eye-catching websites</li>\r\n<li>How to plan, sketch, design, build, test, and optimize a professional website</li>\r\n<li>How to make websites work on every possible mobile device (responsive design)</li>\r\n<li>How to use common components and layout patterns for professional website design and development</li>\r\n<li>Developer skills such as reading documentation, debugging, and using professional tools</li>\r\n<li>How to find and use free design assets such as images, fonts, and icons</li>\r\n<li>Practice your skills with 10+ challenges (solutions included)</li>\r\n</ul>', 500000, 1, 2, 1, '2022-12-10', '2023-01-07', 82, 0),
(2, 'React Native - The Practical Guide [2023]', 1, '1', '', 'Use React Native and your React knowledge to build native iOS and Android Apps - incl. Push Notifications, Hooks, Redux', '<ul>\r\n<li>Learn how to use ReactJS to build real native mobile apps for iOS and Android</li>\r\n<li>Develop cross-platform (iOS and Android) mobile apps without knowing Swift, ObjectiveC or Java/ Android</li>\r\n<li>Explore React Native basics and advanced features!</li>\r\n<li>Learn how to use key mobile app features like Google maps or the device camera</li>\r\n<li>Create real-world native apps using React Native</li>\r\n<li>Make truly reusable components that look great</li>\r\n<li>Understand the terminology and concepts of Redux</li>\r\n<li>Prototype and deploy your own applications to the Apple and Google Play Stores</li>\r\n<li>Get up to speed with React design principles and methodologies</li>\r\n<li>Discover mobile design patterns used by experienced engineers</li>\r\n</ul>', 500000, 4, 2, 1, '2022-12-10', '2023-01-08', 4, 0),
(3, 'Complete C# Unity Game Developer 2D', 1, '2', '', 'Learn Unity in C# & Code Your First Five 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap', '<ul>\r\n<li>Learn C#, a powerful modern language, from scratch. No prior programming experience is necessary.</li>\r\n<li>Become excellent at using the Unity game engine.</li>\r\n<li>Build a solid foundation for game design and game development that will help you build your own games.</li>\r\n<li>Learn how object oriented programming works in practice.</li>\r\n<li>Create playable game projects - good for your portfolio, or just for your own sense of achievement.</li>\r\n<li>Transfer your knowledge from this course to .NET, other languages, and more.</li>\r\n<li>Develop highly transferable coding problem solving skills.</li>\r\n<li>Be part of an amazing and supportive community of people similar to you.</li>\r\n</ul>', 1280000, 7, 2, 0, '2022-12-10', '2022-12-10', 17, 0),
(4, 'Visual Effects for Games in Unity - Beginner To In', 1, '2', '', 'By the end of this course you will have started your own portfolio as a Triple-A Visual Effects artist for Games.', '<ul>\r\n<li>Learn how to create effects for games with Unity.</li>\r\n<li>Fundamental concepts about Visual Effects.</li>\r\n<li>Creating Textures, Meshes and Shaders for Game VFX.</li>\r\n<li>How to structure AAA Visual Effects.</li>\r\n</ul>', 800000, 6, 2, 1, '2022-12-10', '2023-01-08', 3, 0),
(5, 'Master Microsoft Word Beginner to Advanced', 3, '1', '', 'Master the most popular Word Processing tool, Microsoft Word. Microsoft Word 2010, Word 2013, Word 2016, Word 2019', '<ul>\r\n<li>You will learn how to take full advantage of Microsoft Word</li>\r\n<li>Begin with the basics of creating Microsoft Word documents</li>\r\n<li>Various techniques to create dynamic layouts</li>\r\n<li>Preparing documents for printing and exporting</li>\r\n<li>Format documents effectively using Microsoft Word Styles</li>\r\n<li>Control page formatting and flow with sections and page breaks</li>\r\n<li>Create and Manage Table Layouts</li>\r\n<li>Work with Tab Stops to Align Content Properly</li>\r\n<li>Perform Mail Merges to create Mailing Labels and Form Letters</li>\r\n<li>Build and Deliver Word Forms</li>\r\n<li>Manage Templates</li>\r\n<li>Track and Accept/Reject Changes to a Document</li>\r\n</ul>', 0, 4, 2, 0, '2022-12-10', '2022-12-10', 1, 0),
(6, 'Unreal Engine 5 C++ The Ultimate Game Developer Co', 1, '2', '', 'Learn Unreal Engine 5 C++ Programming by Creating an Action-RPG Style Open World Game!', '<h2>What you\'ll learn</h2>\r\n<ul>\r\n<li>How to code games in Unreal Engine 5</li>\r\n<li>An RPG action game with a third-person character</li>\r\n<li>Combat with swords and other melee weapons</li>\r\n<li>Creation of enemies that attack the player</li>\r\n<li>Health bars and player stats</li>\r\n<li>Unreal Engine 5\'s Open World system</li>\r\n<li>Level design and creation of realistic scenes with Quixel Megascans</li>\r\n<li>Motion Warping, Unreal Engine 5\'s new system for customized root motion animations</li>\r\n<li>Particle effects like blood splatter and weapon trails</li>\r\n<li>Unreal Engine 5\'s new MetaSounds system and high-quality sounds in game</li>\r\n<li>Best coding practices for coding games in Unreal Engine 5</li>\r\n<li>Use of data structures and algorithms for games</li>\r\n<li>Design patterns used in Unreal Engine</li>\r\n<li>Creation of multiple types of enemies, from humanoids wielding weapons to monsters and other creatures</li>\r\n<li>Importing entire dungeon levels into our Open World map with Packed Level Instances</li>\r\n</ul>', 1699900, 4, 2, 1, '2022-12-11', '2023-01-08', 1, 0),
(7, 'Java Swing (GUI) Programming: From Beginner to Exp', 1, '2', '', 'Learn how to create desktop and Internet GUI Java programs and take your Java programming to the next level.', '<ul>\r\n<li>Learn how to write GUI (graphical user interface) applications in Java</li>\r\n<li>Discover how to create database applications</li>\r\n<li>Understand the Java Swing framework</li>\r\n</ul>\r\n<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Learn the core Java skills needed to apply for Java developer positions in just 14 hours.</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Be able to sit for and pass the Oracle Java Certificate exam if you choose.</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Be able to demonstrate your understanding of Java to future employers.</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Learn industry \"best practices\" in Java software development from a professional Java developer who has worked in the language for 18 years.</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Acquire essential java basics for transitioning to the Spring Framework, Java EE, Android development and more.</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Obtain proficiency in Java 8 and Java 11.</span></div>\r\n</div>\r\n</li>\r\n</ul>', 499000, 4, 2, 1, '2022-12-11', '2023-01-08', 1, 0),
(8, 'The Complete 2020 Fullstack Web Developer Course', 1, '1', '', 'Learn HTML5, CSS3, JavaScript, Python, Wagtail CMS, PHP & MySQL from scratch!', '<ul>\r\n<li>Updated for 2020</li>\r\n<li>Learn HTML5, CSS3, Vanilla JS (ES6+), Python, Wagtail CMS, PHP and MySQL all from scratch</li>\r\n<li>Learn Python from beginner to advanced</li>\r\n<li>Learn JavaScript (ES6+)</li>\r\n<li>Wagtail Pythons top Content Management System (Like WordPress, but better)</li>\r\n<li>Get a free CSS3 eBook</li>\r\n<li>Lots of projects, big and small!</li>\r\n<li>Learn Git and Github</li>\r\n<li>Create a portfolio page and launch it</li>\r\n<li>Learn JavaScript from scratch</li>\r\n<li>Learn PHP for server code execution</li>\r\n<li>Learn MySQL for saving data (databases)</li>\r\n<li>Build a Login/Registration/Members-only website, just like Facebook</li>\r\n<li>How to get a job as a web developer</li>\r\n<li>Learn the LAMP Stack: Linux, Apache, PHP and MySQL</li>\r\n</ul>', 2199000, 4, 2, 0, '2022-12-11', '2022-12-11', 8, 0),
(9, 'Adobe Photoshop', 2, '2', '', 'Xử lý ảnh trong photoshop', '<ul class=\"i8Z77e\">\r\n<li class=\"TrT0Xe\">S&aacute;ng tạo kh&ocirc;ng giới hạn. ...</li>\r\n<li class=\"TrT0Xe\">Bạn c&oacute; thể s&aacute;ng tạo theo c&aacute;ch của m&igrave;nh. ...</li>\r\n<li class=\"TrT0Xe\">Bạn c&oacute; thể phục chế lại <strong>những</strong> bức h&igrave;nh cũ kỹ ...</li>\r\n<li class=\"TrT0Xe\">Biến đổi m&agrave;u (blend, retouch m&agrave;u) bức ảnh. ...</li>\r\n<li class=\"TrT0Xe\">Sửa lỗi h&igrave;nh ảnh. ...</li>\r\n<li class=\"TrT0Xe\">S&aacute;ng tạo t&aacute;c phẩm nghệ thuật từ chữ ...</li>\r\n<li class=\"TrT0Xe\">Thiết kế &aacute;o, đồ trang sức, lưu niệm để b&aacute;n. ...</li>\r\n<li class=\"TrT0Xe\">Thiết kế quảng c&aacute;o.</li>\r\n</ul>', 500000, 3, 2, 1, '2022-12-12', '2023-01-08', 2, 0),
(10, 'Adobe Illustrator', 2, '2', '', 'Tạo mẫu in ấn với Adobe Illustrator', '<ul>\r\n<li>Thiết kế logo, name card, bộ ấn phẩm văn ph&ograve;ng</li>\r\n<li>Thiết kế lịch thiệp</li>\r\n<li>Thiết kế catalogue, brochure, nh&atilde;n b&igrave;a CD</li>\r\n<li>Thiết kế Poster, standee</li>\r\n<li>Thiết kế bao b&igrave;, t&uacute;i x&aacute;ch</li>\r\n<li>Thiết kế cho c&aacute;c quảng c&aacute;o thương mại điện tử&hellip;</li>\r\n<li>Ho&agrave;n tất file thiết kế&hellip;</li>\r\n</ul>', 0, 4, 2, 0, '2022-12-12', '2022-12-12', 1, 0),
(11, 'Adobe Indesign', 2, '2', '', 'Xuất bản – In ấn Adobe Indesign', '<ul>\r\n<li>Bạn c&oacute; thể d&agrave;n trang s&aacute;ch b&aacute;o. Bạn c&oacute; thể l&agrave;m s&aacute;ch b&aacute;o, ấn phẩm điện tử.</li>\r\n<li>Bạn cũng c&oacute; thể l&agrave;m được những sản phẩm m&agrave; thường l&agrave;m bằng illustrator. V&iacute; dụ, poster, tờ gấp, baner, thực đơn, v&agrave; sử dụng vẽ minh họa b&igrave;nh thường như illustrator.</li>\r\n<li>Sau khi học xong về Indesign bạn ho&agrave;n to&agrave;n c&oacute; thể l&agrave;m tại c&aacute;c xưởng in, t&ograve;a soạn b&aacute;o, chế bản in&hellip;. Tất nhi&ecirc;n mức thu nhập nếu bạn l&agrave;m tốt cũng kh&ocirc;ng phải l&agrave; nhỏ.</li>\r\n</ul>', 0, 4, 2, 0, '2022-12-12', '2023-01-08', 34, 0),
(12, 'Adobe After Effect', 2, '2', '', 'After Effect là gì? Đây là một phần mềm đồ hoạ được tạo ra với mục đích xử lý hiệu ứng video, và làm chuyển động số. After Effect còn được gọi là AE hay phần mềm đồ hoạ động.', '<ul>\r\n<li>C&oacute; thể khi n&oacute;i đến dựng phim bạn sẽ nghĩ ngay đến camtasia, hay premiere. Bạn đọc những d&ograve;ng tr&ecirc;n th&igrave; bạn thấy AE cũng tương tự. Khoan đ&atilde; AE kh&ocirc;ng như bạn nghĩ, Cả After Effect v&agrave; Premiere đều do Adobe nghi&ecirc;n cứu v&agrave; ph&aacute;t triển. Kh&ocirc;ng l&yacute; n&agrave;o ch&uacute;ng lại giống nhau. Thật vậy AE l&agrave;m được rất nhiều điều m&agrave; c&aacute;c phần mềm kh&aacute;c kh&ocirc;ng thể l&agrave;m được</li>\r\n<li>After Effect tr&ecirc;n khả năng tạo hiệu ứng h&igrave;nh ảnh xuất sắc, nhanh v&agrave; v&ocirc; c&ugrave;ng mượt. Khả năng sử l&yacute; th&agrave;nh phần 3D, cho ph&eacute;p kiểm so&aacute;t chiều s&acirc;u, b&oacute;ng, phản xạ của nhiều đối tượng trong video. AE cho ph&eacute;p tạo Tạo đường viền chuẩn, D&ograve; tia, &eacute;p text v&agrave; khối. Khả năng tương th&iacute;ch v&agrave; xử l&yacute; chuyển động cho đối tượng được tạo bởi Illustrator tuyệt vời.</li>\r\n</ul>', 0, 4, 2, 1, '2022-12-12', '2023-01-08', 5, 0),
(13, 'Figma', 2, '2', '', 'Khóa học Figma từ căn bản đến thực chiến', '<ul>\r\n<li>Thuần thục c&aacute;ch sử dụng c&ocirc;ng cụ; hiểu r&otilde; ng&ocirc;n ngữ thiết kế; thấu hiểu tư duy b&agrave;i bản</li>\r\n<li>Tự tạo ra những thiết kế Website/App cực chất, sẵn s&agrave;ng để trở th&agrave;nh một Designer ở c&aacute;c Agency chuy&ecirc;n x&acirc;y dựng website.</li>\r\n<li>Tự tin thực hiện ho&aacute; &yacute; tưởng của m&igrave;nh tr&ecirc;n c&aacute;c thiết kế</li>\r\n<li>Tự tin thực hiện ho&aacute; &yacute; tưởng của m&igrave;nh tr&ecirc;n c&aacute;c thiết kế</li>\r\n<li>Đặc biệt, qu&agrave; tặng Ebook Figma Design Notebook được gửi tặng ngay sau kh&oacute;a học, được bi&ecirc;n soạn với kiến thức bổ sung, được hệ thống lại v&agrave; cập nhật từng đợt, đảm bảo chưa bao giờ bị lỗi nhịp với thời đạ</li>\r\n</ul>', 0, 4, 2, 1, '2022-12-12', '2023-01-08', 2, 0),
(14, 'Options Trading Basics (3-Course Bundle)', 4, '1', '', 'A bundle combines 1) Intro to Call and Put Options 2) Time decay, Implied Volatility, Greeks 3) Call and Puts Live trades', '<ul>\r\n<li>Master the basic nuts and bolts of Options trading</li>\r\n<li>Understand the theory and mathematics behind Options</li>\r\n<li>What are the factors that affect Options pricing</li>\r\n<li>How are Options different than Stocks</li>\r\n<li>How you can use Options even if you invest in Stocks and create superior Combo strategies</li>\r\n<li>Anyone interested in learning about Options trading</li>\r\n<li>Live trades using Thinkorswim platform</li>\r\n<li>Art of adjusting Single Options strategies</li>\r\n</ul>', 999000, 13, 2, 1, '2022-12-14', '2023-01-08', 10, 0),
(15, 'Cryptocurrency Fundamentals: Buy, Sell, Trade Cryp', 4, '2', '', 'Quickly learn how to use, buy, sell and trade Cryptocurrency in this top rated video course and accompanying PDF Guide.', '<ul>\r\n<li>Have a strong understanding of what cryptocurrency is and how different types of cryptocurrency work.</li>\r\n<li>Have a solid, working knowledge in order to discuss and use cryptocurrency safely and effectively in everyday situations.</li>\r\n</ul>', 899000, 4, 2, 1, '2022-12-14', '2023-01-08', 21, 0),
(42, 'Facebook Ads & Facebook Marketing MASTERY 2023 | Coursenvy ®', 4, '1', '', 'Facebook Marketing from beginner to advanced! Join 200,000+ students who MASTERED Facebook and are Facebook Ads experts!', '<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Connect with new audiences and lower your ad costs via Facebook Ads!</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Mass post quickly to various social media networks!</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">MASTER Facebook Ads Manager!</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Implement the Facebook Pixel and advanced tracking strategies.</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">MASTER your sales funnel... awareness, retargeting, and conversion!</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Average $0.01 per engagement/like/click with my Facebook ad strategies!</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Use the advanced features available in Facebook Business Manager.</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">MASTER Facebook Marketing all in one course!</span></div>\r\n</div>\r\n</li>\r\n</ul>', 250000, 9, 38, 0, '2023-01-08', '2023-01-08', 2, 0),
(43, 'Ultimate Blender 3D Character Creation & Animation Course', 2, '1', '', 'Learn 3D character creation & animation in Blender 2.8 with this A-Z course great for beginners and all levels of skill', '<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Students will learn how to make, texture, rig, animate &amp; make characters talk. Students will learn how to create several different animations from start to end</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">By the end of the course, students will be able to fully make, rig, texture and animate 3D characters including how to make them talk</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">By the end of the course, students will be equiped with the skills to make their own scenes and characters from start to finish and fully animate them</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">By the end of the course, students will learn the ins and outs of making characters, rigging them, animating them, making their own sounds for their animations!</span></div>\r\n</div>\r\n</li>\r\n</ul>', 600000, 4, 38, 1, '2023-01-08', '2023-01-08', 1, 0),
(44, 'SOLIDWORKS: Become a Certified Associate Today (CSWA)', 2, '1', '', 'SolidWorks Training: Learn to Master SolidWorks to the Associate Certification Level Even if You are a Complete Beginner', '<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Confidently list your SOLIDWORKS skills in your resume</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Use SOLIDWORKS to design/draft your next innovation</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Take, with confidence, the SOLIDWORKS Associate Certification test - CSWA</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Self-learn advanced functions in SOLIDWORKS</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Use SOLIDWORKS to make basic models</span></div>\r\n<div class=\"ud-block-list-item-content\">\r\n<ul class=\"ud-unstyled-list ud-block-list\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\">\r\n<div class=\"ud-block-list-item-content\">You will need SOLIDWORKS 2013 or newer to open the models we provide throughout the course.</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\">\r\n<div class=\"ud-block-list-item-content\">No prior knowledge. You just need the desire to learn and create awesome stuff.</div>\r\n</div>\r\n</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</li>\r\n</ul>', 800000, 4, 38, 1, '2023-01-08', '2023-01-08', 1, 0),
(45, 'MS Office Complete Training - Beginner to Expert Level', 3, '1', '', 'Complete Practical training in MS Office 2010, 2013, 2016, 2019 in MS Excel, MS Word, MS PowerPoint and MS Access.', '<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Data management in MS Excel</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Documentation expertise in MS Word</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Creating powerful presentation in PowerPoint</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Learn Database in MS Access</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Good understanding of Excel at MIS level</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Updated features of MS Office 2013, 2016 &amp; 2019 like Power Tools, Quick Analysis, Textjoin, XOR, IFS, Draw Tab and many more</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Expertise in Text Function</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Expertise in Logical Function</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Expertise in Math Function</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Expertise in Lookup and Reference Function with latest XLOOKUP Function</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Expertise in Date and Time Function</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Mastery in Pivot Table and Chart Preparation</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Mastery in \'What if Analysis\' tools</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Print Option in Excel</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Data Validation, Filter and Conditional Formatting</div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\">Mastery in Data organizing Tools in Excel.</div>\r\n</div>\r\n</li>\r\n</ul>', 800000, 10, 39, 1, '2023-01-08', '2023-01-08', 7, 0),
(46, 'Excel Deep Dive: Pivot Tables Workshop', 3, '1', '', 'Excel data mastery is possible! Learn how to use pivot tables in excel and learn how to use pivot tables to get a raise', '<h2 class=\"ud-heading-xl what-you-will-learn--title--2ztwE\">What you\'ll learn</h2>\r\n<div class=\"what-you-will-learn--content-spacing--3n5NU\">\r\n<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Master Excel Pivot Tables</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Learn to Harness these skills to get a raise</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Solve World Hunger</span></div>\r\n</div>\r\n</li>\r\n</ul>\r\n</div>', 1699000, 5, 39, 1, '2023-01-08', '2023-01-08', 1, 0),
(47, 'Powerpoint 2016 2019 365 - Master powerpoint presentation', 3, '2', '', 'Complete Powerpoint Masterclass, 20+ powerpoint 365 presentation slides. Learn Microsoft Powerpoint beginner to advanced', '<h2 class=\"ud-heading-xl what-you-will-learn--title--2ztwE\">What you\'ll learn</h2>\r\n<div class=\"what-you-will-learn--content-spacing--3n5NU\">\r\n<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Create a fully-animated and transition-filled business presentation</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Rapidly improve your workflow and design skills</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Minimize text quantity on presentations by using graphs and images</span></div>\r\n</div>\r\n</li>\r\n</ul>\r\n</div>', 800000, 11, 39, 1, '2023-01-08', '2023-01-08', 4, 0),
(48, 'Digital Marketing Mastery 2023 with Dekker Fraser, MBA', 5, '10', '', 'Comprehensive Digital Marketing Course', '<h2 class=\"ud-heading-xl what-you-will-learn--title--2ztwE\">What you\'ll learn</h2>\r\n<div class=\"what-you-will-learn--content-spacing--3n5NU\">\r\n<ul class=\"ud-unstyled-list ud-block-list what-you-will-learn--objectives-list--eiLce what-you-will-learn--objectives-list-two-column-layout--rZLJy\">\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Digital Marketing</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Social Media Marketing</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Advertising</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Product Marketing</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Marketing Strategy</span></div>\r\n</div>\r\n</li>\r\n<li>\r\n<div class=\"ud-block-list-item ud-block-list-item-small ud-block-list-item-tight ud-block-list-item-neutral ud-text-sm\" data-purpose=\"objective\">\r\n<div class=\"ud-block-list-item-content\"><span class=\"what-you-will-learn--objective-item--3b4zX\">Marketing Research</span></div>\r\n</div>\r\n</li>\r\n</ul>\r\n</div>', 1000000, 12, 40, 0, '2023-01-08', '2023-01-08', 4, 0);

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
(1, 100),
(2, 2),
(3, 50),
(4, 0),
(5, 20),
(6, 40),
(7, 70),
(9, 15),
(10, 80),
(11, 10),
(12, 25),
(13, 43);

-- --------------------------------------------------------

--
-- Table structure for table `participate`
--

CREATE TABLE `participate` (
  `IDCourse` int(11) NOT NULL,
  `IDStudent` int(11) NOT NULL,
  `Feedback` text DEFAULT NULL,
  `Rating` double DEFAULT NULL,
  `finish` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `participate`
--

INSERT INTO `participate` (`IDCourse`, `IDStudent`, `Feedback`, `Rating`, `finish`) VALUES
(1, 1, 'Bài giảng rất hay', 2, 0),
(1, 23, '', NULL, 1),
(1, 25, 'Bài giảng rất hay <3', 5, 1),
(1, 28, 'Quá tệ', 2.3, 0),
(2, 25, 'Thank you Brad,\n\nNow it\'s time to gather my portfolio, update my linkedIn photo, and also resume and get a job. Lets go!', 5, 0),
(2, 26, 'Hay!!\nRất tuyệt vời', 4, 0),
(3, 25, 'Overall good course but more explanation could have helped the learner understand things better. Instead of 4 projects, 3 projects were enough to cover all concepts, and remaining time could have been used for details explanation.', 3, 0),
(3, 26, 'Không quá đặc sắc', 3, 0),
(4, 25, 'Too advanced for rookies', 4, 0),
(8, 25, NULL, NULL, 0),
(8, 26, 'Không hay', 2, 0),
(10, 26, 'Hay', 4, 0),
(11, 25, 'Content is very good, but instructor\'s way of teaching is not good for beginners', 4, 0),
(12, 25, 'I learned a great deal from the course and appreciated that the material was up-to-date (Fall 2022) or that adjustments where added later; for example, React Router DOM v6.', 5, 0),
(14, 25, 'Rating it 2/5 from the perspective of someone who wanted to use Trading extensively. It doesn\'t go into any fundamentals and is codes mostly and why we are using them.', 2, 0),
(15, 25, 'Content is very good, but instructor\'s way of teaching is not good for beginners', 5, 0),
(45, 25, 'Sure it explains all I want to know about react by practice, Thanks!', 4, 0),
(47, 25, 'Too advanced for rookies', 1, 0),
(48, 25, 'It\'s one of the best course I have studied from and the way Brad teaches is so good.', 4, 0);

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
(4, 2, 'Crypto Currency'),
(5, 10, 'Digital Marketing');

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
  `CurrentJob` varchar(100) NOT NULL,
  `Role` int(11) NOT NULL,
  `OTP` int(11) NOT NULL,
  `IDSocial` text NOT NULL,
  `disable` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='r';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`IDUser`, `FullName`, `Email`, `Password`, `Bio`, `CurrentJob`, `Role`, `OTP`, `IDSocial`, `disable`) VALUES
(2, 'Brad Traversy', 'bradtraversy@gmail.com', '$2a$10$NcSTuFuXanh9F13WjjAvhefVN6DMKOo5UQuOhP4nvN98rky.LoOje', '<h2 class=\"ud-heading-lg instructor-profile--about-me--3D60O\">About me</h2>\r\n<div class=\"show-more--container--1bpj2\">\r\n<div class=\"show-more--content--3WBXb\">\r\n<div tabindex=\"-1\">\r\n<div data-purpose=\"instructor-description\">\r\n<p>Hi everyone, I\'m Brad, I has been programming for around 12 years and teaching for almost 5 years. He is the owner of Traversy Media which is a successful web development YouTube channel and specializes in everything from HTML5 to front end frameworks like Angular as well as server side technologies like Node.js, PHP and Python. Brad has mastered explaining very complex topics in a simple manner that is very understandable. Invest in your knowledge by watching Brad\'s courses.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Massachusetts Institute of Technology', 1, 0, '', 0),
(3, 'Administrator', 'admin@admin.com', '$2a$10$NcSTuFuXanh9F13WjjAvhefVN6DMKOo5UQuOhP4nvN98rky.LoOje', '', '', 0, 0, '', 0),
(4, 'Nguyễn Như Phước', 'phuocnhu@gmail.com', '', '', '', 2, 0, '', 0),
(20, 'Dương', 'duong2162002@gmail.com', '$2b$05$BV2FwWafCgH0l6H2.XL4..xu7SipKthxRs.fiIPTpQwJ3FiY7KVtG', '', '', 2, 0, '', 0),
(21, 'Phước', 'nguyennhuphuoc2002@gmail.com', '$2b$05$ZtDs1mJgJrr0wAYQpBDg3eGYJUU8bgfJ/bG.Gxdf4C5JMxO010.1C', '', '', 2, 0, '', 0),
(23, 'Lê Đăng Khoa', 'ledangkhoa1142002@gmail.com', '$2b$05$CxdANM829gs67aE6ALCLlu/CgI2TiJldJYOSGc9RzQJn99hdPExwS', '', '', 2, 0, '', 0),
(24, 'Khoa Lê Đăng', 'ldkhoa20@clc.fitus.edu.vn', '', '', '', 2, 0, '107425266660814136385', 0),
(25, 'Lê Khoa', 'ldkhoa.11402@gmail.com', '$2b$05$q4CiwkF1ubEnVeZLSB.sW.HBbkVD/p90USuPRyexWQiajy6df.6bS', '', '', 2, 0, '', 0),
(26, 'Nguyệt Quế', 'quequedang2002@gmail.com', '$2b$05$RwcN5rSMYhevHBsEM.6DU.WA.7p6AUWyBC7FqNbuEr9e7pHiShDQG', '', '', 2, 0, '', 0),
(27, 'Lê Quân - 7599', 'lequan2k2.ql@gmail.com', '', '', '', 2, 0, '104208726902023676394', 0),
(28, 'Quân Lê', 'lequan2002.ql@gmail.com', '', '', '', 2, 0, '104074695894483092070', 0),
(38, 'Dr. Angela Yu', 'angelayu@gmail.com', '$2b$05$E9LN4YR.Jdl6Oks02bJtcu4TOnR0QdgOzs2qJPauV8Aqt/8pmlgYK', '<p>I\'m Angela, I\'m a developer with a passion for teaching. I\'m the&nbsp;<strong>lead instructor</strong>&nbsp;at the London App Brewery, London\'s leading&nbsp;<strong>Programming Bootcamp</strong>. I\'ve helped hundreds of thousands of students learn to code and change their lives by becoming a developer. I\'ve been invited by companies such as Twitter, Facebook and Google to teach their employees.</p>\r\n<p>My first foray into programming was when I was just 12 years old, wanting to build my own Space Invader game. Since then, I\'ve made&nbsp;<strong>hundred of websites, apps and games</strong>. But most importantly, I realised that my&nbsp;<strong>greatest passion</strong>&nbsp;is teaching.</p>\r\n<p>I spend most of my time researching how to make&nbsp;<strong>learning to code fun</strong>&nbsp;and make&nbsp;<strong>hard concepts easy to understand</strong>. I apply everything I discover into my bootcamp courses. In my courses, you\'ll find lots of geeky humour but also lots of&nbsp;<strong>explanations and animations</strong>&nbsp;to make sure everything is easy to understand.</p>\r\n<p><strong>I\'ll be there for you every step of the way.</strong></p>', 'Developer and Lead Instructor', 1, 0, '', 1),
(39, 'Stephen Grider', 'stephengrider@gmail.com', '$2b$05$bTb1mcPESGm0EzKHS.GDo.DaiB3or3tClzaHUDj0VyP7FvzKPVQmu', '<h2 class=\"ud-heading-lg instructor-profile--about-me--3D60O\">About me</h2>\r\n<p>Stephen Grider has been building complex Javascript front ends for top corporations in the San Francisco Bay Area.&nbsp; With an innate ability to simplify complex topics, Stephen has been mentoring engineers beginning their careers in software development for years, and has now expanded that experience onto Udemy, authoring the highest rated React course. He teaches on Udemy to share the knowledge he has gained with other software engineers.&nbsp; Invest in yourself by learning from Stephen\'s published courses.</p>', 'Engineering Architect', 1, 0, '', 0),
(40, 'Alexa Horea', 'alexhorea@gmail.com', '$2b$05$ZdniFe9DgRCzKofvOND8re9sA7skk470G8N7IBmElZfY2FzMtMG7y', '<p><strong>Marketing Management Experience</strong></p>\r\n<p>&bull; Global Product Marketing &amp; Brand Manager for Sony PlayStation</p>\r\n<p>&bull; Vice President of Marketing for a Google accelerator startup</p>\r\n<p>&bull; Senior Product Marketing Manager for a Series-A startup</p>\r\n<p>&bull; Product Marketing Manager for a Google-backed Series-D startup</p>\r\n<p>&bull; Director of Marketing for Ironclad Games / Flame Design</p>\r\n<p>&bull; SaaS Marketing Consultant</p>\r\n<p><strong>Education</strong></p>\r\n<p>&bull; MBA in Marketing from Northwestern University - Kellogg School of Management</p>\r\n<p>&bull; Leadership Essentials from Columbia Business School</p>\r\n<p>&bull; Bachelor of Commerce from Mount Allison University</p>\r\n<p>&bull; Master\'s and bachelor\'s business courses at BI: Norwegian Business School</p>\r\n<p>&bull; Presidential Scholar at Saint Mary\'s University</p>\r\n<p><strong>Academic &amp; Volunteer Experience</strong></p>\r\n<p>&bull; University MBA Program Advisor</p>\r\n<p>&bull; College Marketing Lecturer for Digital Marketing &amp; Business Analytics</p>\r\n<p>&bull; Division Director and VP of Membership for Toastmasters International</p>\r\n<p>&bull; Board of Directors for a charity</p>\r\n<div class=\"ddict_div\" style=\"top: 42px; max-width: 150px; left: 5px;\"><img class=\"ddict_audio\" src=\"chrome-extension://cianljdimgjlpmjllcbahmpdnicglaap/img/audio.png\">\r\n<p><span class=\"ddict_translit\">Xiǎo</span></p>\r\n<p class=\"ddict_sentence\">B&eacute; nhỏ</p>\r\n<hr>\r\n<p class=\"ddict_didumean\">Did you mean <span class=\"ddict_spell\">小</span></p>\r\n</div>', 'Marketing Executive', 1, 0, '', 0);

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

--
-- Dumping data for table `watched`
--

INSERT INTO `watched` (`IDStudent`, `IDCourse`, `IDChapter`, `No`) VALUES
(23, 1, 1, 1),
(23, 1, 1, 2),
(23, 1, 1, 3),
(23, 1, 1, 4),
(23, 1, 1, 5),
(23, 1, 2, 1),
(23, 1, 2, 2),
(23, 1, 2, 3),
(23, 1, 2, 4),
(23, 1, 2, 5),
(23, 1, 3, 1),
(23, 1, 3, 2),
(23, 1, 3, 3),
(23, 1, 3, 4),
(23, 1, 3, 5),
(23, 1, 4, 1),
(23, 1, 4, 2),
(23, 1, 4, 3),
(25, 1, 1, 1),
(25, 1, 1, 2),
(25, 1, 1, 3),
(25, 1, 1, 4),
(25, 1, 1, 5),
(25, 1, 2, 1),
(25, 1, 2, 2),
(25, 1, 2, 3),
(25, 1, 2, 4),
(25, 1, 2, 5),
(25, 1, 3, 1),
(25, 1, 3, 2),
(25, 1, 3, 3),
(25, 1, 3, 4),
(25, 1, 3, 5),
(25, 1, 4, 1),
(25, 1, 4, 2),
(25, 1, 4, 3),
(25, 8, 1, 1),
(28, 1, 1, 1),
(28, 1, 1, 2),
(28, 1, 1, 3),
(28, 1, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

CREATE TABLE `watchlist` (
  `IDStudent` int(11) NOT NULL,
  `IDCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `watchlist`
--

INSERT INTO `watchlist` (`IDStudent`, `IDCourse`) VALUES
(25, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`IDCate`);
ALTER TABLE `category` ADD FULLTEXT KEY `Name` (`Name`);

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
ALTER TABLE `courses` ADD FULLTEXT KEY `Name` (`Name`,`TinyDesc`,`FullDesc`);

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
ALTER TABLE `topic` ADD FULLTEXT KEY `Name` (`Name`);

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
-- Indexes for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`IDStudent`,`IDCourse`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `IDCate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IDUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
