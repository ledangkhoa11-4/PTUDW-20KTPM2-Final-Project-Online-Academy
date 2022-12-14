Skip to content
Search or jump to…
Pull requests
Issues
Codespaces
Marketplace
Explore
 
@QUanlE79 
ledangkhoa11-4
/
PTUDW-20KTPM2-Final-Project-Online-Academy
Private
Code
Issues
Pull requests
Actions
Projects
Security
Insights
PTUDW-20KTPM2-Final-Project-Online-Academy/academy.sql
@aduongdnai
aduongdnai add 3 more courses
Latest commit a49fd26 11 hours ago
 History
 3 contributors
@taotenphuoc@ledangkhoa11-4@aduongdnai
375 lines (313 sloc)  17.7 KB

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 14, 2022 lúc 11:24 AM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `academy`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `IDCate` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`IDCate`, `Name`) VALUES
(1, 'Development'),
(2, 'Design'),
(3, 'Office Productivity'),
(4, 'Finance & Accounting'),
(5, 'Marketing');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chapter`
--

CREATE TABLE `chapter` (
  `IDCourse` int(11) NOT NULL,
  `IDChapter` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chapter`
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
-- Cấu trúc bảng cho bảng `circulativevideo`
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
-- Đang đổ dữ liệu cho bảng `circulativevideo`
--

INSERT INTO `circulativevideo` (`IDCourse`, `IDChapter`, `No`, `Name`, `URL`, `Length`, `IsPreview`) VALUES
(1, 1, 1, 'Audit and other assurance engagements', 'fLHejDNA_CM', 0, 0),
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
-- Cấu trúc bảng cho bảng `courses`
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
-- Đang đổ dữ liệu cho bảng `courses`
--

INSERT INTO `courses` (`ID`, `Name`, `IDCategory`, `Topic`, `Image`, `TinyDesc`, `FullDesc`, `CourseFee`, `IDDiscount`, `IDInstructor`, `IsCompleted`, `CreatedTime`, `Viewer`) VALUES
(1, 'HTML CSS from Zero to Hero', 1, '1', '', 'Learn modern HTML5, CSS3 and web design by building a stunning website for your portfolio! Includes flexbox and CSS Grid', '<ul>\r\n    <li>Become a modern and confident HTML and CSS developer, no prior knowledge needed!</li>\r\n    <li>Design and build a stunning real-world project for your portfolio from scratch</li>\r\n    <li>Modern, semantic and accessible HTML5</li>\r\n    <li>Modern CSS (previous CSS3), including flexbox and CSS Grid for layout</li>\r\n    <li>Important CSS concepts such as the box model, positioning schemes, inheritance, solving selector conflicts, etc.</li>\r\n    <li>A web design framework with easy-to-use rules and guidelines to design eye-catching websites</li>\r\n    <li>How to plan, sketch, design, build, test, and optimize a professional website</li>\r\n    <li>How to make websites work on every possible mobile device (responsive design)</li>\r\n    <li>How to use common components and layout patterns for professional website design and development</li>\r\n    <li>Developer skills such as reading documentation, debugging, and using professional tools</li>\r\n    <li>How to find and use free design assets such as images, fonts, and icons</li>\r\n    <li>Practice your skills with 10+ challenges (solutions included)</li>\r\n</ul>', 500000, 0, 0, 0, '2022-12-10', 0),
(2, 'React Native - The Practical Guide [2023]', 1, '1', '', 'Use React Native and your React knowledge to build native iOS and Android Apps - incl. Push Notifications, Hooks, Redux', '<ul>\r\n    <li>Learn how to use ReactJS to build real native mobile apps for iOS and Android</li>\r\n    <li>Develop cross-platform (iOS and Android) mobile apps without knowing Swift, ObjectiveC or Java/ Android</li>\r\n    <li>Explore React Native basics and advanced features!</li>\r\n    <li>Learn how to use key mobile app features like Google maps or the device camera</li>\r\n    <li>Create real-world native apps using React Native</li>\r\n    <li>Make truly reusable components that look great</li>\r\n    <li>Understand the terminology and concepts of Redux</li>\r\n    <li>Prototype and deploy your own applications to the Apple and Google Play Stores</li>\r\n    <li>Get up to speed with React design principles and methodologies</li>\r\n    <li>Discover mobile design patterns used by experienced engineers</li>\r\n</ul>', 500000, 0, 0, 0, '2022-12-10', 0),
(3, 'Complete C# Unity Game Developer 2D', 1, '2', '', 'Learn Unity in C# & Code Your First Five 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap', '<ul>\r\n    <li>Learn C#, a powerful modern language, from scratch. No prior programming experience is necessary.</li>\r\n    <li>Become excellent at using the Unity game engine.</li>\r\n    <li>Build a solid foundation for game design and game development that will help you build your own games.</li>\r\n    <li>Learn how object oriented programming works in practice.</li>\r\n    <li>Create playable game projects - good for your portfolio, or just for your own sense of achievement.</li>\r\n    <li>Transfer your knowledge from this course to .NET, other languages, and more.</li>\r\n    <li>Develop highly transferable coding problem solving skills.</li>\r\n    <li>Be part of an amazing and supportive community of people similar to you.</li> \r\n</ul>', 1280000, 0, 0, 0, '2022-12-10', 0),
(4, 'Visual Effects for Games in Unity - Beginner To In', 1, '2', '', 'By the end of this course you will have started your own portfolio as a Triple-A Visual Effects artist for Games.', '<ul>\r\n    <li>Learn how to create effects for games with Unity.</li>\r\n    <li>Fundamental concepts about Visual Effects.</li>\r\n    <li>Creating Textures, Meshes and Shaders for Game VFX.</li>\r\n    <li>How to structure AAA Visual Effects.</li>\r\n</ul>', 800000, 0, 0, 0, '2022-12-10', 0),
(5, 'Master Microsoft Word Beginner to Advanced', 3, '1', '', 'Master the most popular Word Processing tool, Microsoft Word. Microsoft Word 2010, Word 2013, Word 2016, Word 2019', '<ul>\r\n    <li>You will learn how to take full advantage of Microsoft Word</li>\r\n    <li>Begin with the basics of creating Microsoft Word documents</li>\r\n    <li>Various techniques to create dynamic layouts</li>\r\n    <li>Preparing documents for printing and exporting</li>\r\n    <li>Format documents effectively using Microsoft Word Styles</li>\r\n    <li>Control page formatting and flow with sections and page breaks</li>\r\n    <li>Create and Manage Table Layouts</li>\r\n    <li>Work with Tab Stops to Align Content Properly</li>\r\n    <li>Perform Mail Merges to create Mailing Labels and Form Letters</li>\r\n    <li>Build and Deliver Word Forms</li>\r\n    <li>Manage Templates</li>\r\n    <li>Track and Accept/Reject Changes to a Document</li>\r\n</ul>', 0, 0, 0, 0, '2022-12-10', 0),
(6, 'Unreal Engine 5 C++ The Ultimate Game Developer Co', 1, '2', '', 'Learn Unreal Engine 5 C++ Programming by Creating an Action-RPG Style Open World Game!', '<h2>What you\'ll learn</h2>\r\n<ul>\r\n    <li>How to code games in Unreal Engine 5</li>\r\n    <li>An RPG action game with a third-person character</li>\r\n    <li>Combat with swords and other melee weapons</li>\r\n    <li>Creation of enemies that attack the player</li>\r\n    <li>Health bars and player stats</li>\r\n    <li>Unreal Engine 5\'s Open World system</li>\r\n    <li>Level design and creation of realistic scenes with Quixel Megascans</li>\r\n    <li>Motion Warping, Unreal Engine 5\'s new system for customized root motion animations</li>\r\n    <li>Particle effects like blood splatter and weapon trails</li>\r\n    <li>Unreal Engine 5\'s new MetaSounds system and high-quality sounds in game</li>\r\n    <li>Best coding practices for coding games in Unreal Engine 5</li>\r\n    <li>Use of data structures and algorithms for games</li>\r\n    <li>Design patterns used in Unreal Engine</li>\r\n    <li>Creation of multiple types of enemies, from humanoids wielding weapons to monsters and other creatures</li>\r\n    <li>Importing entire dungeon levels into our Open World map with Packed Level Instances</li>\r\n</ul>\r\n', 1699900, 0, 0, 0, '2022-12-11', 0),
(7, 'Java Swing (GUI) Programming: From Beginner to Exp', 1, '2', '', 'Learn how to create desktop and Internet GUI Java programs and take your Java programming to the next level.', '<ul>\r\n    <li> Learn how to write GUI (graphical user interface) applications in Java</li>\r\n    <li> Discover how to create database applications</li>\r\n    <li>Understand the Java Swing framework</li>\r\n\r\n</ul>', 499000, 0, 0, 0, '2022-12-11', 0),
(8, 'The Complete 2020 Fullstack Web Developer Course', 1, '1', '', 'Learn HTML5, CSS3, JavaScript, Python, Wagtail CMS, PHP & MySQL from scratch!', '<ul>\r\n    <li>Updated for 2020</li>\r\n    <li>Learn HTML5, CSS3, Vanilla JS (ES6+), Python, Wagtail CMS, PHP and MySQL all from scratch</li>\r\n    <li>Learn Python from beginner to advanced</li>\r\n    <li>Learn JavaScript (ES6+)</li>\r\n    <li>Wagtail Pythons top Content Management System (Like WordPress, but better)</li>\r\n    <li>Get a free CSS3 eBook</li>\r\n    <li>Lots of projects, big and small!</li>\r\n    <li>Learn Git and Github</li>\r\n    <li>Create a portfolio page and launch it</li>\r\n    <li>Learn JavaScript from scratch</li>\r\n    <li>Learn PHP for server code execution</li>\r\n    <li>Learn MySQL for saving data (databases)</li>\r\n    <li>Build a Login/Registration/Members-only website, just like Facebook</li>\r\n    <li>How to get a job as a web developer</li>\r\n    <li>Learn the LAMP Stack: Linux, Apache, PHP and MySQL</li>\r\n</ul>', 2199000, 0, 0, 0, '2022-12-11', 0),
(9, 'Adobe Photoshop', 2, '2', '', 'Xử lý ảnh trong photoshop', '<ul class=\"i8Z77e\"><li class=\"TrT0Xe\">Sáng tạo không giới hạn. ... </li><li class=\"TrT0Xe\">Bạn có thể sáng tạo theo cách của mình. ... </li><li class=\"TrT0Xe\">Bạn có thể phục chế lại <b>những</b> bức hình cũ kỹ ... </li><li class=\"TrT0Xe\">Biến đổi màu (blend, retouch màu) bức ảnh. ... </li><li class=\"TrT0Xe\">Sửa lỗi hình ảnh. ... </li><li class=\"TrT0Xe\">Sáng tạo tác phẩm nghệ thuật từ chữ ... </li><li class=\"TrT0Xe\">Thiết kế áo, đồ trang sức, lưu niệm để bán. ... </li><li class=\"TrT0Xe\">Thiết kế quảng cáo.</li></ul>', 0, 0, 0, 0, '2022-12-12', 0),
(10, 'Adobe Illustrator', 2, '2', '', 'Tạo mẫu in ấn với Adobe Illustrator', '<ul>\r\n<li>Thiết kế logo, name card, bộ ấn phẩm văn phòng</li>\r\n<li>Thiết kế lịch thiệp</li>\r\n<li>Thiết kế catalogue, brochure, nhãn bìa CD</li>\r\n<li>Thiết kế Poster, standee</li>\r\n<li>Thiết kế bao bì, túi xách</li>\r\n<li>Thiết kế cho các quảng cáo thương mại điện tử…</li>\r\n<li>Hoàn tất file thiết kế…</li>\r\n</ul>', 0, 0, 0, 0, '2022-12-12', 0),
(11, 'Adobe Indesign', 2, '2', '', 'Xuất bản – In ấn Adobe Indesign', '<ul>\r\n<li>Bạn có thể dàn trang sách báo. Bạn có thể làm sách báo, ấn phẩm điện tử.</li>\r\n<li>Bạn cũng có thể làm được những sản phẩm mà thường làm bằng illustrator. Ví dụ, poster, tờ gấp, baner, thực đơn, và sử dụng vẽ minh họa bình thường như illustrator.</li>\r\n<li>Sau khi học xong về Indesign bạn hoàn toàn có thể làm tại các xưởng in, tòa soạn báo, chế bản in…. Tất nhiên mức thu nhập nếu bạn làm tốt cũng không phải là nhỏ.</li>\r\n</ul>', 0, 0, 0, 0, '2022-12-12', 0),
(12, 'Adobe After Effect', 2, '2', '', 'After Effect là gì? Đây là một phần mềm đồ hoạ được tạo ra với mục đích xử lý hiệu ứng video, và làm chuyển động số. After Effect còn được gọi là AE hay phần mềm đồ hoạ động.', '<ul>\r\n<li>Có thể khi nói đến dựng phim bạn sẽ nghĩ ngay đến camtasia, hay premiere. Bạn đọc những dòng trên thì bạn thấy AE cũng tương tự. Khoan đã AE không như bạn nghĩ, Cả After Effect và Premiere đều do Adobe nghiên cứu và phát triển. Không lý nào chúng lại giống nhau. Thật vậy AE làm được rất nhiều điều mà các phần mềm khác không thể làm được</li>\r\n<li>After Effect trên khả năng tạo hiệu ứng hình ảnh xuất sắc, nhanh và vô cùng mượt. Khả năng sử lý thành phần 3D, cho phép kiểm soát chiều sâu, bóng, phản xạ của nhiều đối tượng trong video. AE cho phép tạo Tạo đường viền chuẩn, Dò tia, ép text và khối. Khả năng tương thích và xử lý chuyển động cho đối tượng được tạo bởi Illustrator tuyệt vời.</li>\r\n</ul>', 0, 0, 0, 0, '2022-12-12', 0),
(13, 'Figma', 2, '2', '', 'Khóa học Figma từ căn bản đến thực chiến', '<ul>\r\n<li>Thuần thục cách sử dụng công cụ; hiểu rõ ngôn ngữ thiết kế; thấu hiểu tư duy bài bản</li>\r\n<li>Tự tạo ra những thiết kế Website/App cực chất, sẵn sàng để trở thành một Designer ở các Agency chuyên xây dựng website.</li>\r\n<li>Tự tin thực hiện hoá ý tưởng của mình trên các thiết kế</li>\r\n<li>Tự tin thực hiện hoá ý tưởng của mình trên các thiết kế\r\n</li>\r\n<li>Đặc biệt, quà tặng Ebook Figma Design Notebook được gửi tặng ngay sau khóa học, được biên soạn với kiến thức bổ sung, được hệ thống lại và cập nhật từng đợt, đảm bảo chưa bao giờ bị lỗi nhịp với thời đạ</li>\r\n</ul>', 0, 0, 0, 0, '2022-12-12', 0),
(14, 'Options Trading Basics (3-Course Bundle)', 4, '1', '', 'A bundle combines 1) Intro to Call and Put Options 2) Time decay, Implied Volatility, Greeks 3) Call and Puts Live trades', '<ul>\r\n<li>Master the basic nuts and bolts of Options trading</li>\r\n<li>Understand the theory and mathematics behind Options</li>\r\n<li>What are the factors that affect Options pricing</li>\r\n<li>How are Options different than Stocks</li>\r\n<li>How you can use Options even if you invest in Stocks and create superior Combo strategies</li>\r\n<li>Anyone interested in learning about Options trading</li>\r\n<li>Live trades using Thinkorswim platform</li>\r\n<li>Art of adjusting Single Options strategies</li>\r\n</ul>', 999000, 0, 0, 0, '2022-12-14', 0),
(15, 'Cryptocurrency Fundamentals: Buy, Sell, Trade Cryp', 4, '2', '', 'Quickly learn how to use, buy, sell and trade Cryptocurrency in this top rated video course and accompanying PDF Guide.', '<ul>\r\n<li> Have a strong understanding of what cryptocurrency is and how different types of cryptocurrency work.\r\n</li>\r\n<li>\r\nHave a solid, working knowledge in order to discuss and use cryptocurrency safely and effectively in everyday situations.\r\n</li>\r\n</ul>', 899000, 0, 0, 0, '2022-12-14', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount`
--

CREATE TABLE `discount` (
  `ID` int(11) NOT NULL,
  `PercentDiscount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `discount`
--

INSERT INTO `discount` (`ID`, `PercentDiscount`) VALUES
(1, 100);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `participate`
--

CREATE TABLE `participate` (
  `IDCourse` int(11) NOT NULL,
  `IDStudent` int(11) NOT NULL,
  `Feedback` text NOT NULL,
  `Rating` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topic`
--

CREATE TABLE `topic` (
  `IDCate` int(11) NOT NULL,
  `IDTopic` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `topic`
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
-- Cấu trúc bảng cho bảng `user`
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
-- Cấu trúc bảng cho bảng `watched`
--

CREATE TABLE `watched` (
  `IDStudent` int(11) NOT NULL,
  `IDCourse` int(11) NOT NULL,
  `IDChapter` int(11) NOT NULL,
  `No` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `watchhistory`
--

CREATE TABLE `watchhistory` (
  `IDStudent` int(11) NOT NULL,
  `IDCourse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`IDCate`);

--
-- Chỉ mục cho bảng `chapter`
--
ALTER TABLE `chapter`
  ADD PRIMARY KEY (`IDCourse`,`IDChapter`);

--
-- Chỉ mục cho bảng `circulativevideo`
--
ALTER TABLE `circulativevideo`
  ADD PRIMARY KEY (`IDCourse`,`IDChapter`,`No`);

--
-- Chỉ mục cho bảng `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `participate`
--
ALTER TABLE `participate`
  ADD PRIMARY KEY (`IDCourse`,`IDStudent`);

--
-- Chỉ mục cho bảng `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`IDCate`,`IDTopic`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IDUser`);

--
-- Chỉ mục cho bảng `watched`
--
ALTER TABLE `watched`
  ADD PRIMARY KEY (`IDStudent`,`IDCourse`,`IDChapter`,`No`);

--
-- Chỉ mục cho bảng `watchhistory`
--
ALTER TABLE `watchhistory`
  ADD PRIMARY KEY (`IDStudent`,`IDCourse`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `IDCate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `courses`
--
ALTER TABLE `courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `IDUser` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
Footer
© 2022 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
PTUDW-20KTPM2-Final-Project-Online-Academy/academy.sql at main · ledangkhoa11-4/PTUDW-20KTPM2-Final-Project-Online-Academy