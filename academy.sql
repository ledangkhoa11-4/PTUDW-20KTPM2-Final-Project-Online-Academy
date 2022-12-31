-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 31, 2022 lúc 07:36 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

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
(5, 'Marketing'),
(6, 'Test2');

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
(4, 1, 'Introduction'),
(4, 2, 'Internal control'),
(4, 3, 'Language Fundmentals'),
(5, 1, 'Introduction'),
(5, 2, 'Non-current assets'),
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
(9, 1, 'TỔNG QUAN VỀ PHOTOSHOP'),
(9, 2, 'TÌM HIỂU THANH CÔNG CỤ'),
(9, 3, 'CHỈNH SỬA HÌNH ẢNH VỚI PHOTOSHOP'),
(9, 4, 'THIẾT KẾ HÌNH ẢNH CHUYÊN NGHIỆP'),
(9, 5, 'TỔNG KẾT'),
(10, 1, 'GIỚI THIỆU TỔNG QUAN VỀ ILLUSTRATOR'),
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
(1, 4, 1, 'Task List [Part 1] - UI & Add Task Items', 'Rdmd10IYyOI', 3836, 0),
(1, 4, 2, 'Task List [Part 2] - Delete & Filter Tasks', 'VFXKFmbjmpw', 3812, 0),
(1, 4, 3, 'Task List [Part 3] - Persist To Local Storage', 'h4XC-fMfm7Y', 3812, 0),
(2, 1, 1, 'Environment Setup', 'fLHejDNA_CM', 830, 0),
(2, 1, 2, 'Code Repos', 'Ay3d_mNPEno', 3825, 0),
(2, 1, 3, 'Links & Resources', '6Kc5X_JhbxQ', 3802, 0),
(2, 2, 1, 'Initializing React', '95zXiCITbNM', 3812, 0),
(2, 2, 2, 'Intro To JSX', 'xQSXZqbBcG4', 3837, 0),
(2, 2, 3, 'Dynamic Values & LIsts in JSX', 'fQTlI_Q3DQE', 3565, 0),
(2, 3, 1, 'Creating Your First Component & Props', 'ivgUOJ1cOEw', 3800, 0),
(2, 3, 2, 'Adding Styles To A Component', 'fRCrUXteg0o', 3835, 0),
(2, 3, 3, 'State & useState Hook', 'XbR1oUj7fPo', 3825, 0),
(2, 4, 1, 'Form Input & State', '5UorbFfW9pc', 3838, 0),
(2, 4, 2, 'Custom Button Component', 'Rdmd10IYyOI', 3836, 0),
(2, 4, 3, 'Real-Time Validation', 'VFXKFmbjmpw', 3812, 0),
(3, 1, 1, 'Humanize-Duration', 'RK1K2bCg4J8', 7806, 0),
(4, 1, 1, 'Ethics', '95zXiCITbNM', 3812, 0),
(4, 1, 2, 'Internal audit', 'xQSXZqbBcG4', 3837, 0),
(4, 1, 3, 'Risk assessment', 'fQTlI_Q3DQE', 3565, 0),
(4, 2, 1, 'Introduction to audit evidence', 'fRCrUXteg0o', 3835, 0),
(4, 2, 2, 'Audit procedures and sampling', 'Rdmd10IYyOI', 3836, 0),
(4, 3, 1, 'Inventory', 'VFXKFmbjmpw', 3812, 0),
(4, 3, 2, 'Receivables', '0nRKIqACHmo', 3806, 0),
(4, 3, 3, 'Cash and bank', 'kjbTXfwZNSE', 3801, 0),
(5, 1, 1, 'Audit planning and documentation', 'ivgUOJ1cOEw', 3800, 0),
(5, 1, 2, 'Internal control', 'XbR1oUj7fPo', 3825, 0),
(5, 2, 1, 'Receivables', 'VFXKFmbjmpw', 3812, 0),
(5, 2, 2, 'Tests of control', '5UorbFfW9pc', 3838, 0),
(8, 1, 1, 'Install necessary component', 'qsS4QA2GY8c', 3750, 0),
(10, 1, 1, 'Những sắc màu đẹp nhất', 'RK1K2bCg4J8', 7806, 0);

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
  `ModifiedTime` date NOT NULL DEFAULT current_timestamp(),
  `Viewer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `courses`
--

INSERT INTO `courses` (`ID`, `Name`, `IDCategory`, `Topic`, `Image`, `TinyDesc`, `FullDesc`, `CourseFee`, `IDDiscount`, `IDInstructor`, `IsCompleted`, `CreatedTime`, `ModifiedTime`, `Viewer`) VALUES
(1, 'HTML CSS from Zero to Hero', 1, '1', '', 'Learn modern HTML5, CSS3 and web design by building a stunning website for your portfolio! Includes flexbox and CSS Grid', '<ul>\r\n<li>Become a modern and confident HTML and CSS developer, no prior knowledge needed!</li>\r\n<li>Design and build a stunning real-world project for your portfolio from scratch</li>\r\n<li>Modern, semantic and accessible HTML5</li>\r\n<li>Modern CSS (previous CSS3), including flexbox and CSS Grid for layout</li>\r\n<li>Important CSS concepts such as the box model, positioning schemes, inheritance, solving selector conflicts, etc.</li>\r\n<li>A web design framework with easy-to-use rules and guidelines to design eye-catching websites</li>\r\n<li>How to plan, sketch, design, build, test, and optimize a professional website</li>\r\n<li>How to make websites work on every possible mobile device (responsive design)</li>\r\n<li>How to use common components and layout patterns for professional website design and development</li>\r\n<li>Developer skills such as reading documentation, debugging, and using professional tools</li>\r\n<li>How to find and use free design assets such as images, fonts, and icons</li>\r\n<li>Practice your skills with 10+ challenges (solutions included)</li>\r\n</ul>', 500000, 1, 2, 1, '2022-12-10', '2022-12-26', 50),
(2, 'React Native - The Practical Guide [2023]', 1, '1', '', 'Use React Native and your React knowledge to build native iOS and Android Apps - incl. Push Notifications, Hooks, Redux', '<ul>\r\n<li>Learn how to use ReactJS to build real native mobile apps for iOS and Android</li>\r\n<li>Develop cross-platform (iOS and Android) mobile apps without knowing Swift, ObjectiveC or Java/ Android</li>\r\n<li>Explore React Native basics and advanced features!</li>\r\n<li>Learn how to use key mobile app features like Google maps or the device camera</li>\r\n<li>Create real-world native apps using React Native</li>\r\n<li>Make truly reusable components that look great</li>\r\n<li>Understand the terminology and concepts of Redux</li>\r\n<li>Prototype and deploy your own applications to the Apple and Google Play Stores</li>\r\n<li>Get up to speed with React design principles and methodologies</li>\r\n<li>Discover mobile design patterns used by experienced engineers</li>\r\n</ul>', 500000, 4, 2, 0, '2022-12-10', '2022-12-10', 0),
(3, 'Complete C# Unity Game Developer 2D', 1, '2', '', 'Learn Unity in C# & Code Your First Five 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap', '<ul>\r\n<li>Learn C#, a powerful modern language, from scratch. No prior programming experience is necessary.</li>\r\n<li>Become excellent at using the Unity game engine.</li>\r\n<li>Build a solid foundation for game design and game development that will help you build your own games.</li>\r\n<li>Learn how object oriented programming works in practice.</li>\r\n<li>Create playable game projects - good for your portfolio, or just for your own sense of achievement.</li>\r\n<li>Transfer your knowledge from this course to .NET, other languages, and more.</li>\r\n<li>Develop highly transferable coding problem solving skills.</li>\r\n<li>Be part of an amazing and supportive community of people similar to you.</li>\r\n</ul>', 1280000, 7, 2, 0, '2022-12-10', '2022-12-10', 0),
(4, 'Visual Effects for Games in Unity - Beginner To In', 1, '2', '', 'By the end of this course you will have started your own portfolio as a Triple-A Visual Effects artist for Games.', '<ul>\r\n<li>Learn how to create effects for games with Unity.</li>\r\n<li>Fundamental concepts about Visual Effects.</li>\r\n<li>Creating Textures, Meshes and Shaders for Game VFX.</li>\r\n<li>How to structure AAA Visual Effects.</li>\r\n</ul>', 800000, 6, 2, 0, '2022-12-10', '2022-12-10', 0),
(5, 'Master Microsoft Word Beginner to Advanced', 3, '1', '', 'Master the most popular Word Processing tool, Microsoft Word. Microsoft Word 2010, Word 2013, Word 2016, Word 2019', '<ul>\r\n<li>You will learn how to take full advantage of Microsoft Word</li>\r\n<li>Begin with the basics of creating Microsoft Word documents</li>\r\n<li>Various techniques to create dynamic layouts</li>\r\n<li>Preparing documents for printing and exporting</li>\r\n<li>Format documents effectively using Microsoft Word Styles</li>\r\n<li>Control page formatting and flow with sections and page breaks</li>\r\n<li>Create and Manage Table Layouts</li>\r\n<li>Work with Tab Stops to Align Content Properly</li>\r\n<li>Perform Mail Merges to create Mailing Labels and Form Letters</li>\r\n<li>Build and Deliver Word Forms</li>\r\n<li>Manage Templates</li>\r\n<li>Track and Accept/Reject Changes to a Document</li>\r\n</ul>', 0, 4, 2, 0, '2022-12-10', '2022-12-10', 0),
(6, 'Unreal Engine 5 C++ The Ultimate Game Developer Co', 1, '2', '', 'Learn Unreal Engine 5 C++ Programming by Creating an Action-RPG Style Open World Game!', '<h2>What you\'ll learn</h2>\r\n<ul>\r\n    <li>How to code games in Unreal Engine 5</li>\r\n    <li>An RPG action game with a third-person character</li>\r\n    <li>Combat with swords and other melee weapons</li>\r\n    <li>Creation of enemies that attack the player</li>\r\n    <li>Health bars and player stats</li>\r\n    <li>Unreal Engine 5\'s Open World system</li>\r\n    <li>Level design and creation of realistic scenes with Quixel Megascans</li>\r\n    <li>Motion Warping, Unreal Engine 5\'s new system for customized root motion animations</li>\r\n    <li>Particle effects like blood splatter and weapon trails</li>\r\n    <li>Unreal Engine 5\'s new MetaSounds system and high-quality sounds in game</li>\r\n    <li>Best coding practices for coding games in Unreal Engine 5</li>\r\n    <li>Use of data structures and algorithms for games</li>\r\n    <li>Design patterns used in Unreal Engine</li>\r\n    <li>Creation of multiple types of enemies, from humanoids wielding weapons to monsters and other creatures</li>\r\n    <li>Importing entire dungeon levels into our Open World map with Packed Level Instances</li>\r\n</ul>\r\n', 1699900, 0, 2, 0, '2022-12-11', '2022-12-11', 0),
(7, 'Java Swing (GUI) Programming: From Beginner to Exp', 1, '2', '', 'Learn how to create desktop and Internet GUI Java programs and take your Java programming to the next level.', '<ul>\r\n<li>Learn how to write GUI (graphical user interface) applications in Java</li>\r\n<li>Discover how to create database applications</li>\r\n<li>Understand the Java Swing framework</li>\r\n</ul>', 499000, 4, 2, 0, '2022-12-11', '2022-12-11', 0),
(8, 'The Complete 2020 Fullstack Web Developer Course', 1, '1', '', 'Learn HTML5, CSS3, JavaScript, Python, Wagtail CMS, PHP & MySQL from scratch!', '<ul>\r\n<li>Updated for 2020</li>\r\n<li>Learn HTML5, CSS3, Vanilla JS (ES6+), Python, Wagtail CMS, PHP and MySQL all from scratch</li>\r\n<li>Learn Python from beginner to advanced</li>\r\n<li>Learn JavaScript (ES6+)</li>\r\n<li>Wagtail Pythons top Content Management System (Like WordPress, but better)</li>\r\n<li>Get a free CSS3 eBook</li>\r\n<li>Lots of projects, big and small!</li>\r\n<li>Learn Git and Github</li>\r\n<li>Create a portfolio page and launch it</li>\r\n<li>Learn JavaScript from scratch</li>\r\n<li>Learn PHP for server code execution</li>\r\n<li>Learn MySQL for saving data (databases)</li>\r\n<li>Build a Login/Registration/Members-only website, just like Facebook</li>\r\n<li>How to get a job as a web developer</li>\r\n<li>Learn the LAMP Stack: Linux, Apache, PHP and MySQL</li>\r\n</ul>', 2199000, 4, 2, 0, '2022-12-11', '2022-12-11', 0),
(9, 'Adobe Photoshop', 2, '2', '', 'Xử lý ảnh trong photoshop', '<ul class=\"i8Z77e\">\r\n<li class=\"TrT0Xe\">S&aacute;ng tạo kh&ocirc;ng giới hạn. ...</li>\r\n<li class=\"TrT0Xe\">Bạn c&oacute; thể s&aacute;ng tạo theo c&aacute;ch của m&igrave;nh. ...</li>\r\n<li class=\"TrT0Xe\">Bạn c&oacute; thể phục chế lại <strong>những</strong> bức h&igrave;nh cũ kỹ ...</li>\r\n<li class=\"TrT0Xe\">Biến đổi m&agrave;u (blend, retouch m&agrave;u) bức ảnh. ...</li>\r\n<li class=\"TrT0Xe\">Sửa lỗi h&igrave;nh ảnh. ...</li>\r\n<li class=\"TrT0Xe\">S&aacute;ng tạo t&aacute;c phẩm nghệ thuật từ chữ ...</li>\r\n<li class=\"TrT0Xe\">Thiết kế &aacute;o, đồ trang sức, lưu niệm để b&aacute;n. ...</li>\r\n<li class=\"TrT0Xe\">Thiết kế quảng c&aacute;o.</li>\r\n</ul>', 500000, 1, 2, 0, '2022-12-12', '2022-12-12', 0),
(10, 'Adobe Illustrator', 2, '2', '', 'Tạo mẫu in ấn với Adobe Illustrator', '<ul>\r\n<li>Thiết kế logo, name card, bộ ấn phẩm văn ph&ograve;ng</li>\r\n<li>Thiết kế lịch thiệp</li>\r\n<li>Thiết kế catalogue, brochure, nh&atilde;n b&igrave;a CD</li>\r\n<li>Thiết kế Poster, standee</li>\r\n<li>Thiết kế bao b&igrave;, t&uacute;i x&aacute;ch</li>\r\n<li>Thiết kế cho c&aacute;c quảng c&aacute;o thương mại điện tử&hellip;</li>\r\n<li>Ho&agrave;n tất file thiết kế&hellip;</li>\r\n</ul>', 0, 4, 2, 0, '2022-12-12', '2022-12-12', 0),
(11, 'Adobe Indesign', 2, '2', '', 'Xuất bản – In ấn Adobe Indesign', '<ul>\r\n<li>Bạn có thể dàn trang sách báo. Bạn có thể làm sách báo, ấn phẩm điện tử.</li>\r\n<li>Bạn cũng có thể làm được những sản phẩm mà thường làm bằng illustrator. Ví dụ, poster, tờ gấp, baner, thực đơn, và sử dụng vẽ minh họa bình thường như illustrator.</li>\r\n<li>Sau khi học xong về Indesign bạn hoàn toàn có thể làm tại các xưởng in, tòa soạn báo, chế bản in…. Tất nhiên mức thu nhập nếu bạn làm tốt cũng không phải là nhỏ.</li>\r\n</ul>', 0, 0, 2, 0, '2022-12-12', '2022-12-12', 0),
(12, 'Adobe After Effect', 2, '2', '', 'After Effect là gì? Đây là một phần mềm đồ hoạ được tạo ra với mục đích xử lý hiệu ứng video, và làm chuyển động số. After Effect còn được gọi là AE hay phần mềm đồ hoạ động.', '<ul>\r\n<li>Có thể khi nói đến dựng phim bạn sẽ nghĩ ngay đến camtasia, hay premiere. Bạn đọc những dòng trên thì bạn thấy AE cũng tương tự. Khoan đã AE không như bạn nghĩ, Cả After Effect và Premiere đều do Adobe nghiên cứu và phát triển. Không lý nào chúng lại giống nhau. Thật vậy AE làm được rất nhiều điều mà các phần mềm khác không thể làm được</li>\r\n<li>After Effect trên khả năng tạo hiệu ứng hình ảnh xuất sắc, nhanh và vô cùng mượt. Khả năng sử lý thành phần 3D, cho phép kiểm soát chiều sâu, bóng, phản xạ của nhiều đối tượng trong video. AE cho phép tạo Tạo đường viền chuẩn, Dò tia, ép text và khối. Khả năng tương thích và xử lý chuyển động cho đối tượng được tạo bởi Illustrator tuyệt vời.</li>\r\n</ul>', 0, 0, 2, 0, '2022-12-12', '2022-12-12', 0),
(13, 'Figma', 2, '2', '', 'Khóa học Figma từ căn bản đến thực chiến', '<ul>\r\n<li>Thuần thục cách sử dụng công cụ; hiểu rõ ngôn ngữ thiết kế; thấu hiểu tư duy bài bản</li>\r\n<li>Tự tạo ra những thiết kế Website/App cực chất, sẵn sàng để trở thành một Designer ở các Agency chuyên xây dựng website.</li>\r\n<li>Tự tin thực hiện hoá ý tưởng của mình trên các thiết kế</li>\r\n<li>Tự tin thực hiện hoá ý tưởng của mình trên các thiết kế\r\n</li>\r\n<li>Đặc biệt, quà tặng Ebook Figma Design Notebook được gửi tặng ngay sau khóa học, được biên soạn với kiến thức bổ sung, được hệ thống lại và cập nhật từng đợt, đảm bảo chưa bao giờ bị lỗi nhịp với thời đạ</li>\r\n</ul>', 0, 0, 2, 0, '2022-12-12', '2022-12-12', 0),
(14, 'Options Trading Basics (3-Course Bundle)', 4, '1', '', 'A bundle combines 1) Intro to Call and Put Options 2) Time decay, Implied Volatility, Greeks 3) Call and Puts Live trades', '<ul>\r\n<li>Master the basic nuts and bolts of Options trading</li>\r\n<li>Understand the theory and mathematics behind Options</li>\r\n<li>What are the factors that affect Options pricing</li>\r\n<li>How are Options different than Stocks</li>\r\n<li>How you can use Options even if you invest in Stocks and create superior Combo strategies</li>\r\n<li>Anyone interested in learning about Options trading</li>\r\n<li>Live trades using Thinkorswim platform</li>\r\n<li>Art of adjusting Single Options strategies</li>\r\n</ul>', 999000, 0, 2, 0, '2022-12-14', '2022-12-14', 0),
(15, 'Cryptocurrency Fundamentals: Buy, Sell, Trade Cryp', 4, '2', '', 'Quickly learn how to use, buy, sell and trade Cryptocurrency in this top rated video course and accompanying PDF Guide.', '<ul>\r\n<li> Have a strong understanding of what cryptocurrency is and how different types of cryptocurrency work.\r\n</li>\r\n<li>\r\nHave a solid, working knowledge in order to discuss and use cryptocurrency safely and effectively in everyday situations.\r\n</li>\r\n</ul>', 899000, 0, 2, 0, '2022-12-14', '2022-12-14', 0);

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
(1, 100),
(2, 2),
(3, 50),
(4, 0),
(5, 20),
(6, 40),
(7, 70);

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

--
-- Đang đổ dữ liệu cho bảng `participate`
--

INSERT INTO `participate` (`IDCourse`, `IDStudent`, `Feedback`, `Rating`) VALUES
(1, 1, 'Bài giảng rất hay', 2),
(1, 28, 'Quá tệ', 2.3);

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
(4, 2, 'Crypto Currency');

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
  `CurrentJob` varchar(100) NOT NULL,
  `Role` int(11) NOT NULL,
  `OTP` int(11) NOT NULL,
  `IDSocial` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='r';

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`IDUser`, `FullName`, `Email`, `Password`, `Bio`, `CurrentJob`, `Role`, `OTP`, `IDSocial`) VALUES
(2, 'Brad Traversy', 'bradtraversy@gmail.com', '$2a$10$NcSTuFuXanh9F13WjjAvhefVN6DMKOo5UQuOhP4nvN98rky.LoOje', '<p><span style=\"background-color: rgb(224, 62, 45); color: rgb(236, 240, 241);\"><strong>We are changing the world one blockchain at a time.</strong></span></p>\r\n<p>I am on a mission to help people and organizations learn how to use and apply blockchain technology to make the world a better place.</p>\r\n<p>Through my lectures, videos&nbsp;and courses,&nbsp;along with my work with&nbsp;Blockchain Institute of Technology (BIT), The World Standard for Blockchain Education and Certification &trade;,&nbsp; I help people and organizations around the world&nbsp;understand and apply blockchain technology and cryptocurrency to increase their impact and make a greater positive contribution to the world.</p>\r\n<p>I believe we are changing the world one blockchain at a time, and if we use this technology properly - we are bound to make the world a better place for everyone.</p>\r\n<p><span style=\"color: rgb(236, 240, 241); background-color: rgb(224, 62, 45);\"><strong>What would you like to learn?</strong></span></p>\r\n<p>Would you like to&nbsp;<strong>know how blockchain technology is transforming the Internet?</strong></p>\r\n<p>Would you like to&nbsp;<strong>understand Bitcoin, cryptocurrencies&nbsp;and how they are&nbsp;disrupting the financial industry?</strong></p>\r\n<p>Would you like to<strong>&nbsp;be able to discuss blockchain effectively&nbsp;in business situations?</strong></p>\r\n<p>Would you like to<strong>&nbsp;have a firm grasp of&nbsp;where blockchain technology is headed and how you can leverage it?</strong></p>\r\n<p>A few of the leading corporations and organizations I have trained on blockchain and cryptocurrency include:&nbsp;<strong>World Bank, Ernst &amp;&nbsp;Young</strong>,&nbsp;<strong>Federal National Mortgage Association (FNMA) \"Fannie Mae\"</strong>,&nbsp;<strong>The Central Bank of Cura&ccedil;ao &amp; Sint Maarten, The Ministry of Economy of Mexico</strong>&nbsp;and many others.</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"color: rgb(236, 240, 241); background-color: rgb(224, 62, 45);\"><strong>More About George Levy</strong></span></p>\r\n<p>George Levy is a Certified Senior&nbsp;Instructor on blockchain, Bitcoin and cryptocurrency at Blockchain Institute of Technology (BIT), The World Standard for Blockchain Education and Certification. &trade;<br><br>George is a Certified Senior Blockchain Professional (CSBCP) from Blockchain Institute of Technology, and Global Blockchain Professional (GBP) from Foundational Technologies Institute.</p>\r\n<p>-------------------</p>\r\n<p><span style=\"color: rgb(236, 240, 241); background-color: rgb(224, 62, 45);\"><strong>Estamos cambiando el mundo un blockchain&nbsp;a la vez.</strong></span></p>\r\n<p>Mi misi&oacute;n es crecer&nbsp;el impacto de la tecnolog&iacute;a blockchain (cadena de bloques) y mejorar negocios a nivel global. A trav&eacute;s de mis presentaciones, videos y cursos, y junto con mi trabajo con Blockchain Institute of Technology, ayudo a mis estudiantes y sus negocios alrededor del mundo a que entiendan y apliquen la tecnolog&iacute;a de blockchain&nbsp;y criptomonedas para aumentar su impacto y lograr crear un mundo mejor para todos.&nbsp; &nbsp;</p>\r\n<p>Estamos cambiando el mundo un blockchain a la vez, y si usamos esta tecnolog&iacute;a de forma adecuada - crearemos un mundo mejor para todos.&nbsp; &nbsp;</p>\r\n<p><strong>Qu&eacute; te gustar&iacute;a aprender?</strong>&nbsp;&nbsp; Te gustar&iacute;a aprender c&oacute;mo la&nbsp;<strong>tecnolog&iacute;a de cadena de bloques est&aacute; transformando la Internet?</strong>&nbsp;&nbsp;</p>\r\n<p>Te gustar&iacute;a&nbsp;<strong>entender Bitcoin, criptomonedas&nbsp;y c&oacute;mo est&aacute;n transformando a la industria financiera?</strong>&nbsp;&nbsp;</p>\r\n<p>Te gustar&iacute;a&nbsp;<strong>poder hablar sobre la cadena de bloques de manera efectiva en situaciones de negocios?</strong>&nbsp;&nbsp; Te gustar&iacute;a&nbsp;<strong>tener una idea firme a cerca de d&oacute;nde se dirige la tecnolog&iacute;a de blockchain&nbsp;y c&oacute;mo poder tomar ventaja de todo esto?</strong></p>\r\n<p>Algunas de las muchas empresas y organizaciones las cuales he entrenado en blockchain y criptomonedas incluyen:&nbsp;<strong>World Bank, Ernst &amp;&nbsp;Young</strong>,&nbsp;&nbsp;<strong>Federal National Mortgage Association (FNMA) \"Fannie Mae\"</strong>,&nbsp;<strong>El Banco Central de Curazao y Sint Maarten, La Secretar&iacute;a de Econom&iacute;a de M&eacute;xico</strong>&nbsp;y muchos otros.</p>\r\n<p>&nbsp;</p>\r\n<p><span style=\"color: rgb(236, 240, 241); background-color: rgb(224, 62, 45);\"><strong>M&aacute;s acerca de George Levy</strong>&nbsp;&nbsp;</span></p>\r\n<p>George Levy es Instructor certificado en cadena de bloques (blockchain), Bitcoin y criptomonedas por Blockchain Institute of Technology (BIT), el est&aacute;ndar mundial para la educaci&oacute;n y certificaci&oacute;n en blockchain.&trade;</p>\r\n<p>George tiene los certificados de Certified Senior Blockchain Professional (CSBCP) de Blockchain Institute of Technology y Global Blockchain Professional (GBP) de Foundational Technologies Institute.</p>\r\n<p>&nbsp;</p>', 'Massachusetts Institute of Technology', 1, 0, ''),
(3, 'Administrator', 'admin@admin.com', '$2a$10$NcSTuFuXanh9F13WjjAvhefVN6DMKOo5UQuOhP4nvN98rky.LoOje', '', '', 0, 0, ''),
(4, 'Nguyễn Như Phước', 'phuocnhu@gmail.com', '', '', '', 2, 0, ''),
(20, 'Dương', 'duong2162002@gmail.com', '$2b$05$BV2FwWafCgH0l6H2.XL4..xu7SipKthxRs.fiIPTpQwJ3FiY7KVtG', '', '', 2, 0, ''),
(21, 'Phước', 'nguyennhuphuoc2002@gmail.com', '$2b$05$ZtDs1mJgJrr0wAYQpBDg3eGYJUU8bgfJ/bG.Gxdf4C5JMxO010.1C', '', '', 2, 0, ''),
(23, 'Lê Đăng Khoa', 'ledangkhoa1142002@gmail.com', '', '', '', 2, 0, '3592040987690146'),
(24, 'Khoa Lê Đăng', 'ldkhoa20@clc.fitus.edu.vn', '', '', '', 2, 0, '107425266660814136385'),
(25, 'Lê Khoa', 'ldkhoa.11402@gmail.com', '$2b$05$q4CiwkF1ubEnVeZLSB.sW.HBbkVD/p90USuPRyexWQiajy6df.6bS', '', '', 2, 0, ''),
(26, 'Nguyệt Quế', 'quequedang2002@gmail.com', '$2b$05$RwcN5rSMYhevHBsEM.6DU.WA.7p6AUWyBC7FqNbuEr9e7pHiShDQG', '', '', 2, 0, ''),
(27, 'Lê Quân - 7599', 'lequan2k2.ql@gmail.com', '', '', '', 2, 0, '104208726902023676394'),
(28, 'Quân Lê', 'lequan2002.ql@gmail.com', '', '', '', 2, 0, '104074695894483092070');

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

--
-- Đang đổ dữ liệu cho bảng `watched`
--

INSERT INTO `watched` (`IDStudent`, `IDCourse`, `IDChapter`, `No`) VALUES
(28, 1, 1, 1),
(28, 1, 1, 2),
(28, 1, 1, 3),
(28, 1, 1, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `watchlist`
--

CREATE TABLE `watchlist` (
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
ALTER TABLE `category` ADD FULLTEXT KEY `Name` (`Name`);

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
ALTER TABLE `courses` ADD FULLTEXT KEY `Name` (`Name`,`TinyDesc`,`FullDesc`);

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
ALTER TABLE `topic` ADD FULLTEXT KEY `Name` (`Name`);

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
-- Chỉ mục cho bảng `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`IDStudent`,`IDCourse`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `IDCate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `courses`
--
ALTER TABLE `courses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `discount`
--
ALTER TABLE `discount`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `IDUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
