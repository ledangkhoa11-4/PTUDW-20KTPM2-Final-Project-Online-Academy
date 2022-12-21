-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2022 at 03:29 PM
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
(5, 'Marketing'),
(6, 'Test2');

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
(3, 2, 'First Steps'),
(3, 3, 'Your Portfolio Website'),
(3, 4, 'Niching Down'),
(3, 5, 'Services & Pricing'),
(6, 1, 'Getting Started'),
(6, 2, 'Realistic Landscapes'),
(6, 3, 'Vectors, Rotators, and Trigonometry'),
(6, 4, 'C++ in Unreal Engine'),
(6, 5, 'The Actor Class'),
(6, 6, 'Moving Objects with Code'),
(6, 7, 'The Pawn Class'),
(6, 8, 'The Character Class'),
(6, 9, 'The Animation Blueprint'),
(6, 10, 'Collision and Overlaps'),
(7, 1, 'Desktop Applications'),
(7, 2, 'Applets and Animation'),
(7, 3, 'Appendix'),
(8, 1, 'Before We Begin'),
(8, 2, 'The Ultimate HTML Developer: Introduction'),
(8, 3, 'The Ultimate HTML Developer: Getting Started'),
(8, 4, 'The Ultimate HTML Developer: Advanced HTML'),
(8, 5, 'The Ultimate HTML Developer: Your Project'),
(8, 6, 'CSS & CSS3 Masterclass: Introduction'),
(8, 7, 'CSS & CSS3 Masterclass: Getting Started'),
(8, 8, 'CSS & CSS3 Masterclass: Text Formatting'),
(8, 9, 'CSS & CSS3 Masterclass: Fonts and Font Styling'),
(8, 10, 'CSS & CSS3 Masterclass: Links and their \"states\"'),
(9, 1, 'TỔNG QUAN VỀ PHOTOSHOP'),
(9, 2, 'TÌM HIỂU THANH CÔNG CỤ'),
(9, 3, 'CHỈNH SỬA HÌNH ẢNH VỚI PHOTOSHOP'),
(9, 4, 'THIẾT KẾ HÌNH ẢNH CHUYÊN NGHIỆP'),
(9, 5, 'TỔNG KẾT'),
(10, 1, 'GIỚI THIỆU TỔNG QUAN VỀ ILLUSTRATOR'),
(10, 2, 'LÀM QUEN VỚI PHẦN MỀM AI'),
(10, 3, 'LÀM VIỆC VỚI LAYER'),
(10, 4, 'LÀM CHỦ CÁC CÔNG CỤ VẼ CƠ BẢN'),
(10, 5, 'CÁC THAO TÁC BIẾN ĐỔI ĐỐI TƯỢNG'),
(10, 6, 'LÀM VIỆC VỚI MÀU TÔ VÀ ĐƯỜNG VIỀN'),
(10, 7, 'LÀM VIỆC VỚI VĂN BẢN'),
(10, 8, 'IN VÀ XUẤT BẢN TÀI LIỆU'),
(11, 1, 'GIỚI THIỆU MÔI TRƯỜNG LÀM VIỆC CỦA ADOBE INDESIGN'),
(11, 2, 'THỬ HỌC INDESIGN CẤP TỐC'),
(11, 3, 'LÀM CHỦ GIAO DIỆN LÀM VIỆC VÀ CÁC CÔNG CỤ'),
(11, 4, 'BẮT ĐẦU VỚI MỘT TÀI LIỆU MỚI'),
(11, 5, 'QUẢN LÝ TRANG TÀI LIỆU'),
(11, 6, 'XUẤT BẢN VÀ IN ẤN'),
(12, 1, 'TỔNG QUAN VÈ KỸ XẢO CHO PHIM'),
(12, 2, 'CÁC HIỆU ỨNG TRONG AFFTER EFFECTS'),
(12, 3, 'CÁC CHỨC NĂNG NÂNG CAO TRONG AE'),
(12, 4, 'THỰC HIỆN TVC'),
(12, 5, 'THỰC HÀNH NÂNG CAO VÀ SỬ DỤNG TEMPLATE'),
(13, 1, 'CÁC YẾU TỐ CƠ BẢN'),
(13, 2, 'CÁC YẾU TỐ VỀ FRAME'),
(13, 3, 'AUTOLAYOUT'),
(13, 4, 'COMPONENT/INSTANCE/VARIANTS'),
(13, 5, 'HỆ THỐNG HÓA'),
(13, 6, 'PROTOTYPE'),
(14, 1, 'Introduction to Call Options and Put Options, Buye'),
(14, 2, 'Introduction to Time Decay, Implied Volatility and'),
(14, 3, 'Buying / Selling Call and Put Options - Options be'),
(14, 4, 'Options Market Structure, Strategy Box and Case St'),
(14, 5, 'Adjustments for Single Options'),
(14, 6, 'Using Stock and Options combo strategies for Stock'),
(15, 1, 'Introduction and Course Orientation'),
(15, 2, 'Cryptocurrency Fundamentals.'),
(15, 3, 'Review and Valuable Resources');

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
(1, 1, 1, 'Audit and other assurance engagements', 'fLHejDNA_CM', 50, 0),
(1, 1, 2, 'Statutory audit and regulation', 'Ay3d_mNPEno', 0, 0),
(1, 1, 3, 'Corporate governance', '6Kc5X_JhbxQ', 0, 0),
(1, 1, 4, 'Ethics', '95zXiCITbNM', 0, 0),
(1, 1, 5, 'Internal audit', 'xQSXZqbBcG4', 0, 0),
(1, 1, 6, 'Risk assessment', 'fQTlI_Q3DQE', 0, 0),
(1, 1, 7, 'Audit planning and documentation', 'ivgUOJ1cOEw', 0, 0),
(1, 1, 8, 'Introduction to audit evidence', 'fRCrUXteg0o', 0, 0),
(1, 1, 9, 'Internal control', 'XbR1oUj7fPo', 0, 0),
(1, 1, 10, 'Tests of control', '5UorbFfW9pc', 0, 0),
(1, 1, 11, 'Audit procedures and sampling', 'Rdmd10IYyOI', 0, 0),
(1, 1, 12, 'Non-current assets', 'VFXKFmbjmpw', 0, 0),
(1, 1, 13, 'Inventory', 'h4XC-fMfm7Y', 0, 0),
(1, 1, 14, 'Receivables', '0nRKIqACHmo', 0, 0),
(1, 1, 15, 'Cash and bank', 'kjbTXfwZNSE', 0, 0),
(1, 2, 1, 'Type Conversion', '_mIpJ9H2ODk', 0, 1),
(1, 2, 2, 'Numbers & The Math Object', '2U9xVnA_9mc', 0, 1),
(1, 2, 3, 'String Methods & Concatenation', 'qyyZlGKBFCo', 0, 1),
(1, 2, 4, 'Template Literals', '95zXiCITbNM', 0, 0),
(1, 2, 5, 'Arrays & Array Methods', 'xQSXZqbBcG4', 0, 0),
(1, 3, 1, 'DOM Selectors For Multiple Elements', 'fQTlI_Q3DQE', 0, 0),
(1, 3, 2, 'Traversing The DOM', 'ivgUOJ1cOEw', 0, 0),
(1, 3, 3, 'Creating Elements', 'fRCrUXteg0o', 0, 0),
(1, 3, 4, 'Removing & Replacing Elements', 'XbR1oUj7fPo', 0, 0),
(1, 3, 5, 'Event Listeners & The Event Object', '5UorbFfW9pc', 0, 0),
(1, 4, 1, 'Task List [Part 1] - UI & Add Task Items', 'Rdmd10IYyOI', 0, 0),
(1, 4, 2, 'Task List [Part 2] - Delete & Filter Tasks', 'VFXKFmbjmpw', 0, 0),
(1, 4, 3, 'Task List [Part 3] - Persist To Local Storage', 'h4XC-fMfm7Y', 0, 0),
(2, 1, 1, 'Environment Setup', 'fLHejDNA_CM', 0, 0),
(2, 1, 2, 'Code Repos', 'Ay3d_mNPEno', 0, 0),
(2, 1, 3, 'Links & Resources', '6Kc5X_JhbxQ', 0, 0),
(2, 2, 1, 'Initializing React', '95zXiCITbNM', 0, 0),
(2, 2, 2, 'Intro To JSX', 'xQSXZqbBcG4', 0, 0),
(2, 2, 3, 'Dynamic Values & LIsts in JSX', 'fQTlI_Q3DQE', 0, 0),
(2, 3, 1, 'Creating Your First Component & Props', 'ivgUOJ1cOEw', 0, 0),
(2, 3, 2, 'Adding Styles To A Component', 'fRCrUXteg0o', 0, 0),
(2, 3, 3, 'State & useState Hook', 'XbR1oUj7fPo', 0, 0),
(2, 4, 1, 'Form Input & State', '5UorbFfW9pc', 0, 0),
(2, 4, 2, 'Custom Button Component', 'Rdmd10IYyOI', 0, 0),
(2, 4, 3, 'Real-Time Validation', 'VFXKFmbjmpw', 0, 0),
(3, 1, 1, 'Welcome To The Course', 'fLHejDNA_CM', 0, 1),
(3, 1, 2, 'Meet Your Hosts - Brad', 'Ay3d_mNPEno', 0, 1),
(3, 1, 3, 'Meet Your Hosts - Kyle', '6Kc5X_JhbxQ', 0, 1),
(3, 2, 1, 'Services That You Can Offer', '95zXiCITbNM', 0, 1),
(3, 2, 2, 'Business Checklist', 'xQSXZqbBcG4', 0, 1),
(3, 2, 3, 'Business Structures', 'fQTlI_Q3DQE', 0, 0),
(3, 3, 1, 'The Purpose Of A Portfolio Website', 'ivgUOJ1cOEw', 0, 0),
(3, 3, 2, '4 Keys To A Successful Website', 'fRCrUXteg0o', 0, 0),
(3, 3, 3, 'Call To Action', 'XbR1oUj7fPo', 0, 0),
(3, 4, 1, 'Reasons To Niche Down', '5UorbFfW9pc', 0, 0),
(3, 4, 2, 'Examples Of Niching Down', 'Rdmd10IYyOI', 0, 0),
(3, 4, 3, 'How To Choose A Niche', 'VFXKFmbjmpw', 0, 0),
(3, 5, 1, 'Pricing Methods', 'h4XC-fMfm7Y', 0, 0),
(3, 5, 2, 'Detemining Value-Based Pricing', '0nRKIqACHmo', 0, 0),
(3, 5, 3, 'Website Packages', 'kjbTXfwZNSE', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `IDCategory` int(11) NOT NULL,
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

INSERT INTO `courses` (`ID`, `Name`, `IDCategory`, `Topic`, `Image`, `TinyDesc`, `FullDesc`, `CourseFee`, `IDDiscount`, `IDInstructor`, `IsCompleted`, `CreatedTime`, `Viewer`) VALUES
(1, 'HTML CSS from Zero to Hero', 1, '1', '', 'Learn modern HTML5, CSS3 and web design by building a stunning website for your portfolio! Includes flexbox and CSS Grid', '<ul>\r\n    <li>Become a modern and confident HTML and CSS developer, no prior knowledge needed!</li>\r\n    <li>Design and build a stunning real-world project for your portfolio from scratch</li>\r\n    <li>Modern, semantic and accessible HTML5</li>\r\n    <li>Modern CSS (previous CSS3), including flexbox and CSS Grid for layout</li>\r\n    <li>Important CSS concepts such as the box model, positioning schemes, inheritance, solving selector conflicts, etc.</li>\r\n    <li>A web design framework with easy-to-use rules and guidelines to design eye-catching websites</li>\r\n    <li>How to plan, sketch, design, build, test, and optimize a professional website</li>\r\n    <li>How to make websites work on every possible mobile device (responsive design)</li>\r\n    <li>How to use common components and layout patterns for professional website design and development</li>\r\n    <li>Developer skills such as reading documentation, debugging, and using professional tools</li>\r\n    <li>How to find and use free design assets such as images, fonts, and icons</li>\r\n    <li>Practice your skills with 10+ challenges (solutions included)</li>\r\n</ul>', 500000, 1, 2, 0, '2022-12-10', 50),
(2, 'React Native - The Practical Guide [2023]', 1, '1', '', 'Use React Native and your React knowledge to build native iOS and Android Apps - incl. Push Notifications, Hooks, Redux', '<ul>\r\n    <li>Learn how to use ReactJS to build real native mobile apps for iOS and Android</li>\r\n    <li>Develop cross-platform (iOS and Android) mobile apps without knowing Swift, ObjectiveC or Java/ Android</li>\r\n    <li>Explore React Native basics and advanced features!</li>\r\n    <li>Learn how to use key mobile app features like Google maps or the device camera</li>\r\n    <li>Create real-world native apps using React Native</li>\r\n    <li>Make truly reusable components that look great</li>\r\n    <li>Understand the terminology and concepts of Redux</li>\r\n    <li>Prototype and deploy your own applications to the Apple and Google Play Stores</li>\r\n    <li>Get up to speed with React design principles and methodologies</li>\r\n    <li>Discover mobile design patterns used by experienced engineers</li>\r\n</ul>', 500000, 0, 2, 0, '2022-12-10', 0),
(3, 'Complete C# Unity Game Developer 2D', 1, '2', '', 'Learn Unity in C# & Code Your First Five 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap', '<ul>\n    <li>Learn C#, a powerful modern language, from scratch. No prior programming experience is necessary.</li>\n    <li>Become excellent at using the Unity game engine.</li>\n    <li>Build a solid foundation for game design and game development that will help you build your own games.</li>\n    <li>Learn how object oriented programming works in practice.</li>\n    <li>Create playable game projects - good for your portfolio, or just for your own sense of achievement.</li>\n    <li>Transfer your knowledge from this course to .NET, other languages, and more.</li>\n    <li>Develop highly transferable coding problem solving skills.</li>\n    <li>Be part of an amazing and supportive community of people similar to you.</li> \n</ul>', 1280000, 0, 2, 0, '2022-12-10', 0),
(4, 'Visual Effects for Games in Unity - Beginner To In', 1, '2', '', 'By the end of this course you will have started your own portfolio as a Triple-A Visual Effects artist for Games.', '<ul>\r\n    <li>Learn how to create effects for games with Unity.</li>\r\n    <li>Fundamental concepts about Visual Effects.</li>\r\n    <li>Creating Textures, Meshes and Shaders for Game VFX.</li>\r\n    <li>How to structure AAA Visual Effects.</li>\r\n</ul>', 800000, 0, 2, 0, '2022-12-10', 0),
(5, 'Master Microsoft Word Beginner to Advanced', 3, '1', '', 'Master the most popular Word Processing tool, Microsoft Word. Microsoft Word 2010, Word 2013, Word 2016, Word 2019', '<ul>\r\n    <li>You will learn how to take full advantage of Microsoft Word</li>\r\n    <li>Begin with the basics of creating Microsoft Word documents</li>\r\n    <li>Various techniques to create dynamic layouts</li>\r\n    <li>Preparing documents for printing and exporting</li>\r\n    <li>Format documents effectively using Microsoft Word Styles</li>\r\n    <li>Control page formatting and flow with sections and page breaks</li>\r\n    <li>Create and Manage Table Layouts</li>\r\n    <li>Work with Tab Stops to Align Content Properly</li>\r\n    <li>Perform Mail Merges to create Mailing Labels and Form Letters</li>\r\n    <li>Build and Deliver Word Forms</li>\r\n    <li>Manage Templates</li>\r\n    <li>Track and Accept/Reject Changes to a Document</li>\r\n</ul>', 0, 0, 2, 0, '2022-12-10', 0),
(6, 'Unreal Engine 5 C++ The Ultimate Game Developer Co', 1, '2', '', 'Learn Unreal Engine 5 C++ Programming by Creating an Action-RPG Style Open World Game!', '<h2>What you\'ll learn</h2>\r\n<ul>\r\n    <li>How to code games in Unreal Engine 5</li>\r\n    <li>An RPG action game with a third-person character</li>\r\n    <li>Combat with swords and other melee weapons</li>\r\n    <li>Creation of enemies that attack the player</li>\r\n    <li>Health bars and player stats</li>\r\n    <li>Unreal Engine 5\'s Open World system</li>\r\n    <li>Level design and creation of realistic scenes with Quixel Megascans</li>\r\n    <li>Motion Warping, Unreal Engine 5\'s new system for customized root motion animations</li>\r\n    <li>Particle effects like blood splatter and weapon trails</li>\r\n    <li>Unreal Engine 5\'s new MetaSounds system and high-quality sounds in game</li>\r\n    <li>Best coding practices for coding games in Unreal Engine 5</li>\r\n    <li>Use of data structures and algorithms for games</li>\r\n    <li>Design patterns used in Unreal Engine</li>\r\n    <li>Creation of multiple types of enemies, from humanoids wielding weapons to monsters and other creatures</li>\r\n    <li>Importing entire dungeon levels into our Open World map with Packed Level Instances</li>\r\n</ul>\r\n', 1699900, 0, 2, 0, '2022-12-11', 0),
(7, 'Java Swing (GUI) Programming: From Beginner to Exp', 1, '2', '', 'Learn how to create desktop and Internet GUI Java programs and take your Java programming to the next level.', '<ul>\r\n    <li> Learn how to write GUI (graphical user interface) applications in Java</li>\r\n    <li> Discover how to create database applications</li>\r\n    <li>Understand the Java Swing framework</li>\r\n\r\n</ul>', 499000, 0, 2, 0, '2022-12-11', 0),
(8, 'The Complete 2020 Fullstack Web Developer Course', 1, '1', '', 'Learn HTML5, CSS3, JavaScript, Python, Wagtail CMS, PHP & MySQL from scratch!', '<ul>\r\n    <li>Updated for 2020</li>\r\n    <li>Learn HTML5, CSS3, Vanilla JS (ES6+), Python, Wagtail CMS, PHP and MySQL all from scratch</li>\r\n    <li>Learn Python from beginner to advanced</li>\r\n    <li>Learn JavaScript (ES6+)</li>\r\n    <li>Wagtail Pythons top Content Management System (Like WordPress, but better)</li>\r\n    <li>Get a free CSS3 eBook</li>\r\n    <li>Lots of projects, big and small!</li>\r\n    <li>Learn Git and Github</li>\r\n    <li>Create a portfolio page and launch it</li>\r\n    <li>Learn JavaScript from scratch</li>\r\n    <li>Learn PHP for server code execution</li>\r\n    <li>Learn MySQL for saving data (databases)</li>\r\n    <li>Build a Login/Registration/Members-only website, just like Facebook</li>\r\n    <li>How to get a job as a web developer</li>\r\n    <li>Learn the LAMP Stack: Linux, Apache, PHP and MySQL</li>\r\n</ul>', 2199000, 0, 2, 0, '2022-12-11', 0),
(9, 'Adobe Photoshop', 2, '2', '', 'Xử lý ảnh trong photoshop', '<ul class=\"i8Z77e\"><li class=\"TrT0Xe\">Sáng tạo không giới hạn. ... </li><li class=\"TrT0Xe\">Bạn có thể sáng tạo theo cách của mình. ... </li><li class=\"TrT0Xe\">Bạn có thể phục chế lại <b>những</b> bức hình cũ kỹ ... </li><li class=\"TrT0Xe\">Biến đổi màu (blend, retouch màu) bức ảnh. ... </li><li class=\"TrT0Xe\">Sửa lỗi hình ảnh. ... </li><li class=\"TrT0Xe\">Sáng tạo tác phẩm nghệ thuật từ chữ ... </li><li class=\"TrT0Xe\">Thiết kế áo, đồ trang sức, lưu niệm để bán. ... </li><li class=\"TrT0Xe\">Thiết kế quảng cáo.</li></ul>', 0, 0, 2, 0, '2022-12-12', 0),
(10, 'Adobe Illustrator', 2, '2', '', 'Tạo mẫu in ấn với Adobe Illustrator', '<ul>\r\n<li>Thiết kế logo, name card, bộ ấn phẩm văn phòng</li>\r\n<li>Thiết kế lịch thiệp</li>\r\n<li>Thiết kế catalogue, brochure, nhãn bìa CD</li>\r\n<li>Thiết kế Poster, standee</li>\r\n<li>Thiết kế bao bì, túi xách</li>\r\n<li>Thiết kế cho các quảng cáo thương mại điện tử…</li>\r\n<li>Hoàn tất file thiết kế…</li>\r\n</ul>', 0, 0, 2, 0, '2022-12-12', 0),
(11, 'Adobe Indesign', 2, '2', '', 'Xuất bản – In ấn Adobe Indesign', '<ul>\r\n<li>Bạn có thể dàn trang sách báo. Bạn có thể làm sách báo, ấn phẩm điện tử.</li>\r\n<li>Bạn cũng có thể làm được những sản phẩm mà thường làm bằng illustrator. Ví dụ, poster, tờ gấp, baner, thực đơn, và sử dụng vẽ minh họa bình thường như illustrator.</li>\r\n<li>Sau khi học xong về Indesign bạn hoàn toàn có thể làm tại các xưởng in, tòa soạn báo, chế bản in…. Tất nhiên mức thu nhập nếu bạn làm tốt cũng không phải là nhỏ.</li>\r\n</ul>', 0, 0, 2, 0, '2022-12-12', 0),
(12, 'Adobe After Effect', 2, '2', '', 'After Effect là gì? Đây là một phần mềm đồ hoạ được tạo ra với mục đích xử lý hiệu ứng video, và làm chuyển động số. After Effect còn được gọi là AE hay phần mềm đồ hoạ động.', '<ul>\r\n<li>Có thể khi nói đến dựng phim bạn sẽ nghĩ ngay đến camtasia, hay premiere. Bạn đọc những dòng trên thì bạn thấy AE cũng tương tự. Khoan đã AE không như bạn nghĩ, Cả After Effect và Premiere đều do Adobe nghiên cứu và phát triển. Không lý nào chúng lại giống nhau. Thật vậy AE làm được rất nhiều điều mà các phần mềm khác không thể làm được</li>\r\n<li>After Effect trên khả năng tạo hiệu ứng hình ảnh xuất sắc, nhanh và vô cùng mượt. Khả năng sử lý thành phần 3D, cho phép kiểm soát chiều sâu, bóng, phản xạ của nhiều đối tượng trong video. AE cho phép tạo Tạo đường viền chuẩn, Dò tia, ép text và khối. Khả năng tương thích và xử lý chuyển động cho đối tượng được tạo bởi Illustrator tuyệt vời.</li>\r\n</ul>', 0, 0, 2, 0, '2022-12-12', 0),
(13, 'Figma', 2, '2', '', 'Khóa học Figma từ căn bản đến thực chiến', '<ul>\r\n<li>Thuần thục cách sử dụng công cụ; hiểu rõ ngôn ngữ thiết kế; thấu hiểu tư duy bài bản</li>\r\n<li>Tự tạo ra những thiết kế Website/App cực chất, sẵn sàng để trở thành một Designer ở các Agency chuyên xây dựng website.</li>\r\n<li>Tự tin thực hiện hoá ý tưởng của mình trên các thiết kế</li>\r\n<li>Tự tin thực hiện hoá ý tưởng của mình trên các thiết kế\r\n</li>\r\n<li>Đặc biệt, quà tặng Ebook Figma Design Notebook được gửi tặng ngay sau khóa học, được biên soạn với kiến thức bổ sung, được hệ thống lại và cập nhật từng đợt, đảm bảo chưa bao giờ bị lỗi nhịp với thời đạ</li>\r\n</ul>', 0, 0, 2, 0, '2022-12-12', 0),
(14, 'Options Trading Basics (3-Course Bundle)', 4, '1', '', 'A bundle combines 1) Intro to Call and Put Options 2) Time decay, Implied Volatility, Greeks 3) Call and Puts Live trades', '<ul>\r\n<li>Master the basic nuts and bolts of Options trading</li>\r\n<li>Understand the theory and mathematics behind Options</li>\r\n<li>What are the factors that affect Options pricing</li>\r\n<li>How are Options different than Stocks</li>\r\n<li>How you can use Options even if you invest in Stocks and create superior Combo strategies</li>\r\n<li>Anyone interested in learning about Options trading</li>\r\n<li>Live trades using Thinkorswim platform</li>\r\n<li>Art of adjusting Single Options strategies</li>\r\n</ul>', 999000, 0, 2, 0, '2022-12-14', 0),
(15, 'Cryptocurrency Fundamentals: Buy, Sell, Trade Cryp', 4, '2', '', 'Quickly learn how to use, buy, sell and trade Cryptocurrency in this top rated video course and accompanying PDF Guide.', '<ul>\r\n<li> Have a strong understanding of what cryptocurrency is and how different types of cryptocurrency work.\r\n</li>\r\n<li>\r\nHave a solid, working knowledge in order to discuss and use cryptocurrency safely and effectively in everyday situations.\r\n</li>\r\n</ul>', 899000, 0, 2, 0, '2022-12-14', 0);

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
(2, 2);

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

--
-- Dumping data for table `participate`
--

INSERT INTO `participate` (`IDCourse`, `IDStudent`, `Feedback`, `Rating`) VALUES
(1, 1, 'Bài giảng rất hay', 2),
(1, 4, 'Quá tệ', 2.3);

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
(4, 2, 'Crypto Currency');

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
  `IDSocial` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='r';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`IDUser`, `FullName`, `Email`, `Password`, `Bio`, `CurrentJob`, `Role`, `OTP`, `IDSocial`) VALUES
(2, 'Brad Traversy', 'bradtraversy@gmail.com', '$2a$10$NcSTuFuXanh9F13WjjAvhefVN6DMKOo5UQuOhP4nvN98rky.LoOje', '<p><strong>We are changing the world one blockchain at a time.</strong></p>\r\n<p>I am on a mission to help people and organizations learn how to use and apply blockchain technology to make the world a better place.</p>\r\n<p>Through my lectures, videos&nbsp;and courses,&nbsp;along with my work with&nbsp;Blockchain Institute of Technology (BIT), The World Standard for Blockchain Education and Certification &trade;,&nbsp; I help people and organizations around the world&nbsp;understand and apply blockchain technology and cryptocurrency to increase their impact and make a greater positive contribution to the world.</p>\r\n<p>I believe we are changing the world one blockchain at a time, and if we use this technology properly - we are bound to make the world a better place for everyone.</p>\r\n<p><strong>What would you like to learn?</strong></p>\r\n<p>Would you like to&nbsp;<strong>know how blockchain technology is transforming the Internet?</strong></p>\r\n<p>Would you like to&nbsp;<strong>understand Bitcoin, cryptocurrencies&nbsp;and how they are&nbsp;disrupting the financial industry?</strong></p>\r\n<p>Would you like to<strong>&nbsp;be able to discuss blockchain effectively&nbsp;in business situations?</strong></p>\r\n<p>Would you like to<strong>&nbsp;have a firm grasp of&nbsp;where blockchain technology is headed and how you can leverage it?</strong></p>\r\n<p>A few of the leading corporations and organizations I have trained on blockchain and cryptocurrency include:&nbsp;<strong>World Bank, Ernst &amp;&nbsp;Young</strong>,&nbsp;<strong>Federal National Mortgage Association (FNMA) \"Fannie Mae\"</strong>,&nbsp;<strong>The Central Bank of Cura&ccedil;ao &amp; Sint Maarten, The Ministry of Economy of Mexico</strong>&nbsp;and many others.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>More About George Levy</strong></p>\r\n<p>George Levy is a Certified Senior&nbsp;Instructor on blockchain, Bitcoin and cryptocurrency at Blockchain Institute of Technology (BIT), The World Standard for Blockchain Education and Certification. &trade;<br><br>George is a Certified Senior Blockchain Professional (CSBCP) from Blockchain Institute of Technology, and Global Blockchain Professional (GBP) from Foundational Technologies Institute.</p>\r\n<p>-------------------</p>\r\n<p><strong>Estamos cambiando el mundo un blockchain&nbsp;a la vez.</strong></p>\r\n<p>Mi misi&oacute;n es crecer&nbsp;el impacto de la tecnolog&iacute;a blockchain (cadena de bloques) y mejorar negocios a nivel global. A trav&eacute;s de mis presentaciones, videos y cursos, y junto con mi trabajo con Blockchain Institute of Technology, ayudo a mis estudiantes y sus negocios alrededor del mundo a que entiendan y apliquen la tecnolog&iacute;a de blockchain&nbsp;y criptomonedas para aumentar su impacto y lograr crear un mundo mejor para todos.&nbsp; &nbsp;</p>\r\n<p>Estamos cambiando el mundo un blockchain a la vez, y si usamos esta tecnolog&iacute;a de forma adecuada - crearemos un mundo mejor para todos.&nbsp; &nbsp;</p>\r\n<p><strong>Qu&eacute; te gustar&iacute;a aprender?</strong>&nbsp;&nbsp; Te gustar&iacute;a aprender c&oacute;mo la&nbsp;<strong>tecnolog&iacute;a de cadena de bloques est&aacute; transformando la Internet?</strong>&nbsp;&nbsp;</p>\r\n<p>Te gustar&iacute;a&nbsp;<strong>entender Bitcoin, criptomonedas&nbsp;y c&oacute;mo est&aacute;n transformando a la industria financiera?</strong>&nbsp;&nbsp;</p>\r\n<p>Te gustar&iacute;a&nbsp;<strong>poder hablar sobre la cadena de bloques de manera efectiva en situaciones de negocios?</strong>&nbsp;&nbsp; Te gustar&iacute;a&nbsp;<strong>tener una idea firme a cerca de d&oacute;nde se dirige la tecnolog&iacute;a de blockchain&nbsp;y c&oacute;mo poder tomar ventaja de todo esto?</strong></p>\r\n<p>Algunas de las muchas empresas y organizaciones las cuales he entrenado en blockchain y criptomonedas incluyen:&nbsp;<strong>World Bank, Ernst &amp;&nbsp;Young</strong>,&nbsp;&nbsp;<strong>Federal National Mortgage Association (FNMA) \"Fannie Mae\"</strong>,&nbsp;<strong>El Banco Central de Curazao y Sint Maarten, La Secretar&iacute;a de Econom&iacute;a de M&eacute;xico</strong>&nbsp;y muchos otros.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>M&aacute;s acerca de George Levy</strong>&nbsp;&nbsp;</p>\r\n<p>George Levy es Instructor certificado en cadena de bloques (blockchain), Bitcoin y criptomonedas por Blockchain Institute of Technology (BIT), el est&aacute;ndar mundial para la educaci&oacute;n y certificaci&oacute;n en blockchain.&trade;</p>\r\n<p>George tiene los certificados de Certified Senior Blockchain Professional (CSBCP) de Blockchain Institute of Technology y Global Blockchain Professional (GBP) de Foundational Technologies Institute.</p>\r\n<p>&nbsp;</p>', 'Massachusetts Institute of Technology', 1, 0, ''),
(3, 'Administrator', 'admin@admin.com', '$2a$10$NcSTuFuXanh9F13WjjAvhefVN6DMKOo5UQuOhP4nvN98rky.LoOje', '', '', 0, 0, ''),
(4, 'Nguyễn Như Phước', 'phuocnhu@gmail.com', '', '', '', 2, 0, ''),
(20, 'Dương', 'duong2162002@gmail.com', '$2b$05$BV2FwWafCgH0l6H2.XL4..xu7SipKthxRs.fiIPTpQwJ3FiY7KVtG', '', '', 2, 0, ''),
(21, 'Phước', 'nguyennhuphuoc2002@gmail.com', '$2b$05$ZtDs1mJgJrr0wAYQpBDg3eGYJUU8bgfJ/bG.Gxdf4C5JMxO010.1C', '', '', 2, 0, ''),
(23, 'Lê Đăng Khoa', 'ledangkhoa1142002@gmail.com', '', '', '', 2, 0, '3592040987690146');

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
  MODIFY `IDCate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `IDUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
