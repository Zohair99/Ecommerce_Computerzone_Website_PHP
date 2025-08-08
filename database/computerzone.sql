-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2025 at 09:44 AM
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
-- Database: `computerzone`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `Brand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `Brand`) VALUES
(1, 'Dell Laptops'),
(2, 'Hp Laptops'),
(3, 'Lenovo Laptops'),
(4, 'Asus Laptops'),
(5, 'Apple Laptops'),
(6, 'MSI Laptops');

-- --------------------------------------------------------

--
-- Table structure for table `brand_store`
--

CREATE TABLE `brand_store` (
  `id` int(11) NOT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand_store`
--

INSERT INTO `brand_store` (`id`, `brand`, `created_at`) VALUES
(3, 'UNITEK', '2025-04-11 06:05:54'),
(4, 'Ugreen', '2025-04-11 06:05:57'),
(5, 'Rivacase ', '2025-04-11 06:06:05'),
(6, 'Miscellaneous', '2025-04-11 06:06:10'),
(7, 'Lenovo', '2025-04-11 06:06:14'),
(8, 'HP', '2025-04-11 06:06:18'),
(9, 'Dukes', '2025-04-11 06:06:24'),
(10, 'Dell ', '2025-04-11 06:06:29');

-- --------------------------------------------------------

--
-- Table structure for table `cambrand_store`
--

CREATE TABLE `cambrand_store` (
  `id` int(11) NOT NULL,
  `cambrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cambrand_store`
--

INSERT INTO `cambrand_store` (`id`, `cambrand`, `created_at`) VALUES
(10, 'TP-Link', '2025-04-11 06:32:41'),
(11, 'Logitech', '2025-04-11 06:32:44'),
(12, 'Google', '2025-04-11 06:32:48'),
(13, 'EZVIZ', '2025-04-11 06:32:51'),
(14, 'Elgato', '2025-04-11 06:32:54'),
(15, 'Ease', '2025-04-11 06:32:57'),
(16, 'A4Tech', '2025-04-11 06:33:01');

-- --------------------------------------------------------

--
-- Table structure for table `camdrone_store`
--

CREATE TABLE `camdrone_store` (
  `id` int(11) NOT NULL,
  `camdrone` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camdrone_store`
--

INSERT INTO `camdrone_store` (`id`, `camdrone`, `created_at`) VALUES
(10, 'Webcams', '2025-04-11 06:31:13'),
(11, 'Video Conferencing Solutions', '2025-04-11 06:31:28'),
(12, 'Studio | Streaming | Post Production', '2025-04-11 06:31:32'),
(13, 'Wi-Fi | Security Camera', '2025-04-11 06:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `cameradrone`
--

CREATE TABLE `cameradrone` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cameradrone`
--

INSERT INTO `cameradrone` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(5, '', 'EASE PTZ3X 1080P HD Mini Video Conferencing Camera', '4', 2147483647, 'This device features a premium ultra-wide focal lens at a 90° angle, which offers a panoramic view.\r\n\r\n', '2-1540-17153-281024110316.jpg', 'Video Conferencing Solutions', 'Ease', '90° Wide-Angle Lens', '3X Optical Zoon + 16X Digital Zoom', 'TOF Auto Focus', 'Full-Featured USB Interface', '64800', ''),
(6, '', 'Google Nest Cam Indoor Security Cameras (3-Pack) - Black', '5', 2147483647, 'Nest Cam Security Cameras (3-Pack): Keep an eye on what matters by installing these 3 security cameras around the property. Just download the Nest app and pair with your compatible Apple® iOS or Android device to get started. You\'ll begin receiving n', '4682804-sd-1540-10555-231120100056.jpg', 'Wi-Fi | Security Camera', 'Google', 'Receive helpful alerts on your phone', 'Capture everything in HD', 'Night vision up to 20\'', '130° field of view', '114900', ''),
(7, '', 'EZVIZ H3c 2K+ Wi-Fi Smart Home Camera 4MP 2.8mm Color', '3', 2147483647, 'The camera captures everything in 2K+ clarity and sees color at night. The H3c 2K+ adds more smartness to an essential camera, it’s made to meet all outdoor security requirements, both during the day and at night. Waving hands recognition, two-way co', '5-czone.com.pk-1540-15692-060224090212.jpg', 'Wi-Fi | Security Camera', 'EZVIZ', 'Max. Resolution: 4MP, 2560 × 1440', 'Color Night Vision - Two-Way Talk', 'Customizable Voice Alerts - IP67 Weatherproof Design', 'AI-Powered Human Shape Detection - H.265 Video Technology', '12800', ''),
(8, '26', 'A4Tech PK-635G 480p Anti-glare Webcam Silver Black', '3', 2147483647, 'Enhance online communications, instant messaging, VoIP and social networking.\r\n\r\n', '6-czone.com.pk-1540-15392-261023084745.jpg', 'Webcams', 'A4Tech', 'Flexible Pivoting Tube', 'Intellegient Multisampling', 'Superior Low-light Performance', 'Anti-glare Coating', '3500', '4700'),
(9, '18', 'A4Tech PK-925H 1080p Full-HD WebCam Black, Digital MIC', '3', 2147483647, 'This 1080P webcam has a built-in microphone which enables you to enjoy chatting in real-time video with your family and friends. And the microphone has applied the noise-cancelling technology.\r\n\r\n', '3-czone.com.pk-1540-15391-261023084132.jpg', 'Webcams', 'A4Tech', '1080p Full-HD Sensor', 'High-fidelity Microphone', 'Anti-glare Coating', 'Superior Low-light Performance', '5300', '6500'),
(10, '', 'Elgato Key Light Neo Professional Video Call Light', '3', 2147483647, 'Glare-Free, Adjustable Monitor Stand, Manual or Wi-Fi Control, Office, Streaming, Teams, Zoom, Slack, Twitch, Youtube\r\n\r\n', '25-czone.com.pk-1540-17072-111024073132.jpg', 'Studio | Streaming | Post Production', 'Elgato', 'From showtime to downtime.', 'Mount it your way.', 'Hassle-Free Setup and Control', 'Edge Lighting Technology', '26500', ''),
(11, '', 'Elgato Cam Link 4K - 10GAM9901', '3', 2147483647, 'Turn your DSLR, camcorder or action cam into a webcam. You want your content to be visually captivating. With Cam Link 4K, simply hook up your DSLR, camcorder, or action cam to your PC or Mac. Set up your shot. And make it happen.\r\n\r\n', '24-czone.com.pk-1540-13910-261023102215.jpg', 'Studio | Streaming | Post Production', 'Elgato', 'Plug ’n’ produce.', 'Supports up to 4K 30p Resolution', '1 x USB 3.1 Gen 1 Type-A Connector', '1 x HDMI Port', '33500', ''),
(12, '9', 'Elgato Facecam Full HD Streaming Web Camera for Video Conferencing, Gaming, and Streaming 10WAA9901', '4', 2147483647, 'Introducing Facecam — professional optics in a webcam form factor. Perfectly engineered to make you look amazing.\r\n\r\n', '1-1540-15397-021024091218.jpg', 'Webcams', 'Elgato', 'Capture up to 1080p60 Resolution', 'Manual/Auto Focus and Exposure', '82° Diagonal Field of View', 'Sony Sensor, 24mm f/2.4 Glass Lens', '57990', '63900'),
(13, '', 'TP-Link Tapo C200 Pan/Tilt Home Security Wi-Fi Camera FHD 1080p', '3', 2147483647, 'Home burglary is the very thing we want to prevent. Set a camera towards the entrance of your home, garage, or basement to ensure the safety of your family and property.\r\n\r\n', '2-czone.com.pk-1540-10657-120224064423.jpg', 'Wi-Fi | Security Camera', 'TP-Link', 'Detects motion and sends you alerts right away', 'Advanced night view helps guard you while you sleep', 'Privacy Mode and Local Storage Ensure Privacy', 'F/NO: 2.4; Focal Length: 4mm 1080p Full HD H.264', '6300', ''),
(14, '', 'TP-Link Tapo C100 Home Security Wi-Fi Camera 1080p, Built-in Microphone and Speaker', '4', 2147483647, 'Receive a notification whenever your camera detects motion and see a video clip of the motion for closer inspection. Also, you can personalize your own experiences by setting the motion detection zones to only capture what happens in the area that yo', 'tapo-c100-1-large-1578559517394v-1540-10656-151220090317.jpg', 'Wi-Fi | Security Camera', 'TP-Link', '1080P HD (1920 x 1080 px) H.264', 'Advanced Night Vision - Provides a visual distance of up to 30 ft', 'Motion Detection and Notifications', 'Aperture: F2.0 - Focal Length: 3.15mm', '6400', ''),
(15, '', 'TP-Link Tapo C210 Pan/Tilt Home Security Wi-Fi Camera | Ver 1.0', '4', 2147483647, 'Ultra-High-Definition Video: Records every image in crystal-clear 3MP definition. Pan and Tilt: 360º horizontal range.\r\n\r\n', '2-czone.com.pk-1540-10657-120224064423.jpg', 'Wi-Fi | Security Camera', 'TP-Link', 'Advanced Night Vision: Provides a visual distance of up to 30 ft', 'Cover Every Corner.', 'Two-Way Audio - Night Vision', 'Motion Detection - Privacy Mode - Local Storage (SD card not included)', '9490', ''),
(16, '', 'TP-Link Tapo C400S2 Smart Wire-Free Security Camera System, 2-Camera System, 1080p FHD', '5', 2147483647, 'Install Anywhere with Long Battery Life\r\n\r\n', '2-czone.com.pk-1540-16990-240924080423.jpg', 'Wi-Fi | Security Camera', 'TP-Link', '1080p Full High Definition', '180-Day Battery Life*', 'Smart AI Detection and Notification', 'Wire-Free Placement', '33990', ''),
(17, '21', 'TP-Link Tapo C520WS Outdoor Pan/Tilt Security Wi-Fi Camera | 2K QHD Live View, Starlight Color Night Vision, Alexa and Google Assistant supported', '5', 2147483647, '1/3” Progressive Scan CMOS Starlight Sensor\r\n\r\n', '14-czone.com.pk-1540-17444-021224091636.jpg', 'Wi-Fi | Security Camera', 'TP-Link', '2K QHD Live View', 'Starlight Color Night Vision', '360° All-Round Protection', 'Comprehensive AI Detection', '16200', '20500'),
(18, '', 'Logitech C270 HD Webcam (Black) 720p 30 fps', '3', 2147483647, 'Look your best in most lighting environments including dim ones, as you work from home, attend business meetings, and stay in touch with family and friends via Skype, Google Hangouts, and FaceTime, with the C270 HD Webcam from Logitech. With a resolu', '1-czone.com.pk-1540-3153-160923075027.jpg', 'Webcams', 'Logitech', 'Up to 720p HD Resolution', 'Frame Rates up to 30 fps', '60° Field of View', 'Fixed Focus Lens', '4850', ''),
(19, '', 'Logitech C310 HD 720p 30fps Webcam | 5MP Still Photos', '3', 2147483647, 'Experience sharp, smooth video calling (720p/30fps) in a widescreen format with the C310 HD Webcam. Automatic light correction shows you in vibrant, natural colors.\r\n\r\n', 'c310-hd-webcam-refresh-1540-686-041120084906.jpg', 'Webcams', 'Logitech', 'Widescreen Video at 720p HD Resolution', 'Still Photos at Resolution of 5MP', 'Built-in Mic', 'Compatible w/ Most IM Programs', '6000', ''),
(20, '', 'Logitech Sight Tabletop Camera | 960-001510', '5', 2147483647, 'Tabletop companion camera with intelligent multi-participant framing. Get the best front-and-center view of the room, from anywhere.\r\n\r\n', '20-czone.com.pk-1540-15997-140524084546.jpg', 'Video Conferencing Solutions', 'Logitech', 'AI-powered meeting room camera', 'Supports Multiple Conferencing Platforms', 'Dual 4K Cameras and 7 Beamforming Mics', 'Accurately Frames Participants', '519000', ''),
(21, '', 'Logitech RALLY BAR All-in-One Video Bar Conferencing System 960-001324 | White', '5', 2147483647, 'Logitech Rally Bar is the premier video bar for medium to large meeting rooms. Discover remarkably simple, all-in-one video conferencing with built-in AI technology, brilliant optics, and powerful audio.\r\n\r\n', '54-czone.com.pk-1540-16101-250524114157.jpg', 'Video Conferencing Solutions', 'Logitech', 'All-In-One Video Bar for Medium and Large Rooms', 'Ensure Everyone Is Seen and Heard', 'Manage Remotely with Sync', 'All-in-one video conferencing', '825000', ''),
(22, '', 'Logitech RALLY PLUS - UHD 4K Conference Camera System with Speaker and Mic Pod Set | 960-001242', '5', 2147483647, 'In large rooms with one or two displays, deploy Rally with tremendous flexibility and ease.\r\n\r\n', '2-czone.com.pk-1540-13672-140524082718.jpg', 'Video Conferencing Solutions', 'Logitech', 'PTZ Camera with up to UHD 4K Resolution', 'For Small- to Medium-Size Rooms', '90° Field of View, 15x HD Zoom', 'Speaker Set, Mic Pod, Display Hub', '632500', ''),
(23, '', 'ogitech MeetUp Mic Extension Cable 10 Meter 950-000005', '5', 2147483647, 'Easily customize your conference room setup with the Logitech GROUP 10m Extended Cable. Use it to increase the distance from the hub to the camera or speakerphone.\r\n\r\n', '6-czone.com.pk-1540-11858-060721080039.jpg', 'Video Conferencing Solutions', 'Logitech', 'Extends Distance up to 32.8\'', 'Designed to Be a DIN Cable Replacement', 'Logitech GROUP Compatible', 'Velcro Straps Included', '27990', '');

-- --------------------------------------------------------

--
-- Table structure for table `capacity`
--

CREATE TABLE `capacity` (
  `c_storage` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `capacity`
--

INSERT INTO `capacity` (`c_storage`, `created_at`) VALUES
('10TB', '2025-03-22 10:14:08'),
('12TB', '2025-03-22 10:14:04'),
('14TB', '2025-03-22 10:13:56'),
('16TB', '2025-03-22 10:13:43'),
('18TB', '2025-03-22 10:13:39'),
('1TB', '2025-03-22 10:15:09'),
('20TB', '2025-03-22 10:13:12'),
('22TB', '2025-03-22 10:13:16'),
('2TB', '2025-03-22 10:15:03'),
('4TB', '2025-03-22 10:14:23'),
('5TB', '2025-03-22 10:14:20'),
('6TB', '2025-03-22 10:14:17'),
('8TB', '2025-03-22 10:14:12'),
('Cloud | Diskless', '2025-03-22 10:13:35');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_table` enum('menu','additional_items') NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carttrones`
--

CREATE TABLE `carttrones` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carttrones`
--

INSERT INTO `carttrones` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'Epson 003 Original Ink Bottle Set Black, Yellow, Magents, Cyan | Bulk', '5', 2147483647, 'For L3110 / L3150 / L3210 / L3250 Printer\r\n\r\n', '5-czone.com.pk-1540-17797-110225111202.jpg', 'Ink Bottle', 'Epson', '', '', '', '', '8500', ''),
(3, '', 'HP 05A Black LaserJet Toner Cartridge (CE505A)', '5', 2147483647, 'High-quality black for everyday printing. Performance and value for your reports, invoices and spreadsheets.\r\n\r\n', '1969-13072013024128-1540-1969-190617095241.jpg', 'Printer Toners', 'Miscellaneous', '', '', '', '', '27500', ''),
(4, '', 'HP GT53 90-ml Black Original Ink Bottle | 1VV22AA', '3', 2147483647, 'Get outstanding prints from your home and office.\r\n\r\n', '6-czone.com.pk-1540-11951-160821070636.jpg', 'Ink Bottle', 'HP', 'Accurate lines, sharp detail, and rich color quality.', 'Quality and permanence', 'Originals produced 180% more prints than refills.*', 'Protects your printer', '4200', ''),
(5, '', 'HP GT52 GT53 4 Color Set Genuine Official Ink Bottle For GT 5820 5810 410 310', '3', 103231120, 'Print thousands of quality pages without interruption – at an extremely low cost per page\r\n\r\n', 'untitled-1-1540-10182-120920070502.jpg', 'Ink Bottle', 'HP', 'GT series all-in-one.', 'Ink types: Pigment-based', 'Page yield (black and white) ~5,000 pages', '', '12000', ''),
(6, '', 'HP GT52 GT53 4 Color Set Genuine Official Ink Bottle For GT 5820 5810 410 310', '3', 103231120, 'Print thousands of quality pages without interruption – at an extremely low cost per page\r\n\r\n', 'untitled-1-1540-10182-120920070502.jpg', 'Ink Bottle', 'HP', 'GT series all-in-one.', 'Ink types: Pigment-based', 'Page yield (black and white) ~5,000 pages', '', '12000', ''),
(7, '', 'HP M0H50A Tri-Color Replacement GT Printhead', '3', 2147483647, 'HP Ink Tank 100/300/400 Series, HP Smart Tank 200 / 300 / 400 / 500 / 610 / 650 / 5100 Series.\r\n\r\n', '18-czone.com.pk-1540-14729-250523082837.jpg', 'Printhead Replacement Kit', 'HP', 'Value for money', 'Memories that last', 'Prints that care', 'Green Prints, Fewer Hassles', '4800', ''),
(8, '', 'HP X4E75AA Black Inktank Smart Tank 500, 510, 530, 610 Printhead', '3', 2147483647, 'Print high-quality text, graphics, and photos for your office with simple to replace printheads. It\'s easy with the high-capacity HP ink tank system, Original HP ink, and Original HP printheads.\r\n\r\n', '18-czone.com.pk-1540-14729-250523082837.jpg', 'Printhead Replacement Kit', 'HP', 'Black', 'Impress with outstanding HP quality', 'Print everyday documents with sharp lines, dark blacks, and grayscale', 'Count on reliable performance', '4800', ''),
(9, '', 'HP GT51/GT52 2-pack Black/Tri-color Printhead Replacement Kit 3JB06AA', '3', 2147483647, 'Make the most of every memory when you use Original HP Ink cartridges for your photos as every print is developed with quality in mind\r\n\r\n', '1252424002-1540-9326-200220093327.jpg', 'Printhead Replacement Kit', 'HP', 'Superior quality', 'Printing with Sustainability in Mind', 'Proven reliability', 'Better affordability', '8700', ''),
(10, '', 'HP 103A Black Original Neverstop Laser Toner Reload Kit - W1103A', '3', 2147483647, 'Your business productivity and office environment matter. HP toner cartridges are designed to be easy to use, dependable, secure, and part of a closed-loop economy.\r\n\r\n', 'a-2669-1-1540-10978-280121093607.jpg', 'Printer Toners', 'HP', 'Ultra Low Cost per Page', 'High-yield Printing', 'Quickly Restore Toner Levels', 'Print On and On', '5500', ''),
(11, '', 'HP 19A Original LaserJet Imaging Drum (CF219A)', '4', 2147483647, 'Count on consistent, impressive quality and performance, using Original HP imaging drums with JetIntelligence—designed to help protect your investment and help your printer work its best.\r\n\r\n', 'czone38d51bad55855af9c91d77528a12ea46127dfcab-gallery.jpg-1540-8153-290519105913.jpg', 'Printer Toners', 'HP', '', '', '', '', '13500', ''),
(12, '', 'HP 56A Black Original LaserJet Toner Cartridge CF256A', '3', 2147483647, 'Original HP is proven superior to compatible and manufactured Cartridges.\r\n\r\n', 'czonecf256a-1-t1539228234.png-1540-8224-170619080006.jpg', 'Printer Toners', 'HP', 'Designed to work first time, every time', 'Quality prints you can take pride in', 'The environmental choice', '', '15000', ''),
(13, '', 'HP 207A Original 4 Colour Toner Cartridge Multipack M255 M282 M283', '4', 2147483647, 'Colour LaserJet Pro M255dw, Colour LaserJet Pro M255nw, Colour LaserJet Pro MFP M282nw, Colour LaserJet Pro MFP M283fdn, Colour LaserJet Pro MFP M283fdw, LaserJet Pro M283fdw\r\n\r\n', '2-czone.com.pk-1540-11138-270422063859.jpg', 'Printer Toners', 'HP', 'W2211A Cyan', 'W2210A Black', 'W2213A Magenta', 'W2212A Yellow', '86000', ''),
(14, '', 'HP 203A Original Laserjet Toners Complete Set - (CF540A/CF541A/CF542A/CF543A)', '4', 2147483647, 'Compatible Printers: M254dw, M254nw, MFP M280nw, MFP M281fdw, MFP M281fdn\r\n\r\n', 'hp-203a-cmyk-multipack-toner-cartridges-1540-7405-100119085410.jpg', 'Printer Toners', 'HP', 'Pack of 4 toner cartridges', 'Contains 1 x Black, 1 x Cyan, 1 x Magenta and 1 x Yellow Cartridge', 'Operating temperature range 15 to 30°C', 'Storage temperature range -20 to 40°C', '88500', ''),
(17, '', 'HP 230A 4 Pack LaserJet Toner Cartridge Set', '5', 2147483647, 'Hardware Compatibility: HP Color LaserJet Pro 4201-4203 series, HP Color LaserJet Pro MFP 4301-4303 Series\r\n\r\n', '12-czone.com.pk-1540-16756-150824125505.jpg', 'Printer Toners', 'HP', '', '', '', '', '119900', ''),
(18, '', 'HP 415A Toner Cartridges Set for HP Color LaserJet Pro M454 MFP M479 M455 M480', '5', 2147483647, 'HP Color LaserJet Enterprise M455dn (3PZ95A) HP Color LaserJet Enterprise MFP M480f (3QA55A) HP Color LaserJet Pro M454dn (W1Y44A) HP Color LaserJet Pro M454dw (W1Y45A) HP Color LaserJet Pro MFP M479dw (W1A77A) HP Color LaserJet Pro MFP M479fdn (W1A7', '1-czone.com.pk-1540-11140-270422063051.jpg', 'Printer Toners', 'HP', 'HP 415A Black Toner Cartridge W2030A', 'HP 415A Cyan Toner Cartridge W2031A', 'HP 415A Yellow Toner Cartridge W2032A', 'HP 415A Magenta Toner Cartridge W2033A', '120000', '');

-- --------------------------------------------------------

--
-- Table structure for table `carttrones_brand`
--

CREATE TABLE `carttrones_brand` (
  `id` int(11) NOT NULL,
  `carttronesbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carttrones_brand`
--

INSERT INTO `carttrones_brand` (`id`, `carttronesbrand`, `created_at`) VALUES
(3, 'Epson', '2025-04-14 09:41:56'),
(4, 'HP', '2025-04-14 09:42:11'),
(5, 'Miscellaneous', '2025-04-14 09:42:21');

-- --------------------------------------------------------

--
-- Table structure for table `carttrones_store`
--

CREATE TABLE `carttrones_store` (
  `id` int(11) NOT NULL,
  `cattronesstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carttrones_store`
--

INSERT INTO `carttrones_store` (`id`, `cattronesstore`, `created_at`) VALUES
(3, 'Printer Toners', '2025-04-14 09:41:56'),
(4, 'Printhead Replacement Kit', '2025-04-14 09:42:11'),
(5, 'Ink Bottle', '2025-04-14 09:42:21');

-- --------------------------------------------------------

--
-- Table structure for table `casing`
--

CREATE TABLE `casing` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casing`
--

INSERT INTO `casing` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Asus TUF Gaming GT301 ATX Mid-Tower Compact Case | 90DC0040-B40000', '3', 2147483647, 'ASUS TUF Gaming GT301 ATX mid-tower compact case with tempered glass side panel, honeycomb front panel, 120mm AURA Addressable RGB fan, headphone hanger and 360mm radiator support.\r\n\r\n', '2-czone.com.pk-1540-13968-311022094134.jpg', 'Asus Casing', 'Asus', 'Combat-ready performance', 'Fitted addressable RGB-enabled fans', '4 x 2.5\" Bay | 2 x 2.5\"/3.5\" Combo Bay', '7 Expansion Slots', '22000', ''),
(4, '', 'ASUS A21 micro-ATX Case Black', '3', 2147483647, 'The ASUS A21 micro-ATX case offers support for 360 mm radiators, and 380 mm graphics card, with two color options and clean cable management.\r\n\r\n', '5-czone.com.pk-1540-17788-070225091006.jpg', 'Asus Casing', 'Asus', 'Broad Compatibility', 'Capable Cooling', 'Ample cable management', 'Discover Hidden Potential', '24990', ''),
(5, '', 'ASUS A21 micro-ATX Case White', '4', 2147483647, 'The ASUS A21 micro-ATX case offers support for 360 mm radiators, and 380 mm graphics card, with two color options and clean cable management.\r\n\r\n', '1-czone.com.pk-1540-17787-070225090923.jpg', 'Asus Casing', 'Asus', 'Broad Compatibility', 'Capable Cooling', 'Ample cable management', 'Discover Hidden Potential', '24990', ''),
(6, '', 'Asus ROG Strix Helios White Edition GX601 RGB ATX/EATX Mid-Tower Gaming Case', '5', 2147483647, 'ROG Strix Helios White Edition RGB ATX/EATX mid-tower gaming case with tempered glass, aluminium frame, GPU braces, 420mm radiator support and Aura Sync.\r\n\r\n', '20-czone.com.pk-1540-13923-241022085926.jpg', 'Asus Casing', 'Asus', 'Made for Showcase Builds', 'Premium Design & Aesthetics', 'AURA Sync RGB Lighting', 'Effortless Cable Management', '89990', ''),
(7, '', 'Corsair iCUE 7000X RGB Tempered Glass Full-Tower ATX PC Case — Black | CC-9011226-WW', '4', 2147483647, 'The CORSAIR iCUE 7000X RGB full-tower ATX case puts your build on display behind three tempered glass panels, with room for up to three simultaneous 360mm radiators, hidden cable management, and four included CORSAIR SP140 RGB ELITE fans.\r\n\r\n', '21-czone.com.pk-1540-14982-050823085839.jpg', 'Corsair Casings', 'Corsair', 'Get Some Breathing Room', 'A Fully-Featured Full-Tower', 'iCUE Smart Lighting Control', 'All-Around Easy Access', '83900', ''),
(8, '', 'Corsair iCUE 5000X RGB QL Edition Tempered Glass Mid-Tower Smart Case | True White | CC-9011233-WW', '5', 2147483647, 'The CORSAIR iCUE 5000X RGB QL Edition Mid-Tower Case includes four pre-installed QL120 RGB fans and an iCUE Lighting NodeCORE, in a stunning all-white 5000X RGB case.\r\n\r\n', '1-czone.com.pk-1540-17885-280225090105.jpg', 'Corsair Casings', 'Corsair', 'A Captivating Start to a White PC Build', 'Four Included QL120 RGB Fans', 'Four Tempered Glass Panels', 'Smart RGB Lighting Out-of-the-Box', '86990', ''),
(9, '', 'Corsair Obsidian Series 1000D Super-Tower Case - CC-9011148-WW', '5', 2147483647, 'The CORSAIR Obsidian Series 1000D is the ultimate super-tower PC case with iconic tempered glass design, smart lighting and fan control and the ability to house two systems simultaneously for the most epic builds.\r\n\r\n', 'czonecc-9011148-ww-1000d-hero.png-1540-7822-290319010959.jpg', 'Corsair Casings', 'Corsair', 'The ultimate super-tower pc case', 'Stream and game simultaneously', 'Massive cooling options', 'Built-in smart lighting and fan control', '139990', ''),
(10, '', 'HYTE Y40 S-Tier Aesthetic Case - Cherry', '3', 2147483647, 'The all-new Y40 is designed to wow and priced to thrill while defining new industry standards for ATX cases everywhere. Elevate your expectations of multi-dimensional case design, next-gen GPU compatibility, and overall system harmony today.\r\n\r\n', '72-czone.com.pk-1-1540-17933-010325010741.jpg', ' HYTE', 'HYTE', 'Designed From Every Dimension', 'Multi-Dimensional Design', 'Ginormous Vertical Graphics Support', 'Included Luxury PCIE 4.0 Riser Cable', '34990', ''),
(11, '', 'HYTE Y70 Touch Infinite Modern Aesthetic Case - Snow White', '5', 2147483647, 'Y70 is an upgraded dual chamber ATX mid tower modern aesthetic case that delivers next gen gaming experiences with massive 4 slot vertical graphics and unlocks maximum performance via ginormous cooling capacity. All while celebrating your favorite ha', '23-czone.com.pk-1540-17155-281024114432.jpg', ' HYTE', 'HYTE', 'Mesmerizing 14.9\" Integrated IPS Touchscreen', 'Massive 4 Slot Vertical Graphics', 'Included Luxury PCIE 4.0 Riser Cable', 'Ginormous Cooling Capacity', '167990', ''),
(12, '', 'HYTE Y70 Touch Infinite Modern Aesthetic Case - Black Cherry', '5', 2147483647, 'Y70 is an upgraded dual chamber ATX mid tower modern aesthetic case that delivers next gen gaming experiences with massive 4 slot vertical graphics and unlocks maximum performance via ginormous cooling capacity. All while celebrating your favorite ha', '35-czone.com.pk-1540-17158-281024115048.jpg', ' HYTE', 'HYTE', 'Mesmerizing 14.9\" Integrated IPS Touchscreen', 'Massive 4 Slot Vertical Graphics', 'Included Luxury PCIE 4.0 Riser Cable', 'Ginormous Cooling Capacity', '167990', ''),
(13, '', 'Cooler Master MasterFrame 700 Customizable Open-Air Frame ATX Case | MCF-MF700-KGNN-S00', '5', 2147483647, 'The MasterFrame 700 is a highly customizable open-air frame that can convert between a showcase PC chassis or a highly flexible test bench.\r\n\r\n', '24-czone.com.pk-1540-16161-010624102425.jpg', 'Cooler Master Casings', 'Cooler Master', 'Premium Variable Friction Hinges', 'Open Air Design', 'Un-matched Hardware Support', 'Extreme Water-Cooling Support', '149000', ''),
(14, '', 'Cooler Master HAF 700 EVO E-ATX Compatible Full Tower PC Case | Black | H700E-IGNN-S00', '5', 2147483647, 'HAF 700 EVO unveils a new era of thermal efficiency through unique features designed to transcend the standards of contemporary cooling solutions. Rediscover PC DIY: a form of entertainment, a polished skillset, an exquisite art form, and a way of li', '9-czone.com.pk-1540-16157-010624101007.jpg', 'Cooler Master Casings', 'Cooler Master', 'Unparalleled Hardware & Cooling Capabilities', 'Mammoth Water Cooling Support', 'Exclusive Tool-Less Technology', 'IRIS: Personal LCD Assistant', '120000', ''),
(15, '', 'Cooler Master COSMOS C700M E-ATX Full-Tower Case | Curved Tempered Glass Panel | MCC-C700M-WG5N-S00 | Silver White', '5', 2147483647, 'The unique frame design supports a conventional, chimney, inverse layout, or a fully customized layout. Each part of the frame enables a high level of versatility. From multi-functional brackets to options in component positioning, the COSMOS C700M e', '13-czone.com.pk-1540-16159-010624101908.jpg', 'Cooler Master Casings', 'Cooler Master', 'Highly Versatile Layout', 'Graphics Card Mounting with Riser Cable', 'Addressable RGB Lighting', 'Extensive Cable Cover System', '130000', ''),
(16, '', 'COUGAR FV270 RGB MidTower E-ATX Case, 420mm GPU Supported,Build-in ARGB PWM Fans,Breathe Streams,Prism of Light, RGB Hub,Filter Guard, Tool-Less Bracket, Center Stage,Cable Management (RGB, White)', '5', 2147483647, 'Through A Glass Brightly\r\n\r\n', 'czone.com.pk-16-1540-17983-070325113832.jpg', 'Cougar', 'Cougar', 'Angled cooling fan', 'Tempered, curved glass panoramic perimeter', 'Additional air intake accessed by lifted front', 'Reverse cable management eliminates clutter', '45990', ''),
(17, '', 'Cougar FV150 RGB Gaming Case, Black', '3', 2147483647, 'Build Visibility and Hardware Management, Perfectly Balanced\r\n\r\n', 'czone.com.pk-5-1540-17976-070325110658.jpg', 'Cougar', 'Cougar', 'Supports up to 400mm GPUs and vertical GPU orientation.', 'Supports Mini-ITX, Micro-ATX, ATX motherboards.', 'Dual Chamber', 'Easy Fan Installation', '20990', ''),
(18, '', 'LianLi O11 DYNAMIC EVO XL Case | O11DEXL-X Black', '4', 2147483647, 'Full-tower chassis with two modes: Normal Mode/ Reverse Mode.\r\n\r\n', '49-czone.com.pk-1540-16563-260724123814.jpg', 'Lian Li', 'Lian Li', 'Tower Chassis', '(D) 522mm x (W) 304mm x (H) 531.9mm', 'Steel 4.0mm Tempered Glass Aluminum', 'Motherboard Support: E-ATX (Under 280mm)/ATX/Micro-ATX/Mini-ITX', '89990', ''),
(19, '', 'Lian Li O11 DYNAMIC EVO XL Case | O11DEXL-W White', '4', 2147483647, 'Full-tower chassis with two modes: Normal Mode/ Reverse Mode.\r\n\r\n', '55-czone.com.pk-1540-16564-260724123943.jpg', 'Lian Li', 'Lian Li', 'Tower Chassis', '(D) 522mm x (W) 304mm x (H) 531.9mm', 'Steel 4.0mm Tempered Glass Aluminum', 'Motherboard Support: E-ATX (Under 280mm)/ATX/Micro-ATX/Mini-ITX', '89990', ''),
(20, '10', 'MSI MAG Forge M100A Mesh Certified Micro-ATX Tower Tempered Glass PC Case Black', '3', 2147483647, 'The MAG FORGE M100 Series is optimized to provide generous and effective airflow for system cooling. The MAG FORGE M100 Series can mount up to 6 fans.\r\n\r\n', '9-czone.com.pk-1-1540-16775-190824114255.jpg', 'MSI', 'MSI', 'Built-in Auto RGB fans with striking lighting and vivid lighting effects.', 'The magnetic filter on the top vents being easily remove for cleaning.', 'Support up to 300 mm graphics card', 'Optimized Airflow', '10800', '12000'),
(21, '', 'MSI MAG FORGE 100R Mid Tower Gaming Computer Case | Black, 2x 120mm ARGB PWM Fan', '3', 2147483647, 'MSI MAG Forge 100R chassis can support up to ATX motherboard, side panel of 4mm tempered glass, up to 140 mm RGB fan, reserved cooling space and front USB 3.2 Gen 1 Type A\r\n\r\n', '17-czone.com.pk-1540-17597-090125110921.jpg', 'MSI', 'MSI', 'Optimize Airflow', 'ARGB Fan included', '4mm Tempered Glass', '240 mm Radiator Support', '13990', ''),
(22, '', 'MSI MPG GUNGNIR 110R WHITE | MPG Series Tempered Glass ATX Case', '3', 2147483647, 'The MPG series brings out the best in gamers by allowing full expression in color with advanced RGB lighting control and synchronization.\r\n\r\n', '25-czone.com.pk-1540-16779-190824121238.jpg', 'MSI', 'MSI', 'Built-in ARGB fans with striking lighting and vivid lighting effects', 'Bundle with 1 to 6 ARGB LED control board', 'Premium-grade 4mm thick tempered glass', 'Magnetic filter on top', '23990', ''),
(23, '', 'MSI MPG GUNGNIR 300R AIRFLOW WHITE Mid-Tower PC Gaming Case', '5', 2147483647, 'One-piece 1mm perforated front panel, supporting dual 360mm AIO liquid cooler at front/top and Push-Pull setup.\r\n\r\n', '21-czone.com.pk-1540-16778-190824120801.jpg', 'MSI', 'MSI', '4 x 120mm ARGB fans pre-installed (Mystic Light compatible).', 'Tempered Glass Side Panel', 'Liquid Cooling Support up to 360mm Radiator', 'USB Type-C', '33990', ''),
(24, '', 'HYTE Y60 Modern Aesthetic Case - Snow White', '5', 2147483647, '3-Piece panoramic glass with 3-times more satisfying plastic wrap removal. We know how much you just spent on that GPU, so we threw in the riser cable.\r\n\r\n', '62-czone.com.pk-1540-17164-281024121030.jpg', ' HYTE', 'HYTE', 'A new build should feel new', 'Panoramic Views', 'Exclusively Vertical GPU Mounted', 'Included PCIE 4.0 Riser Cable', '47990', '');

-- --------------------------------------------------------

--
-- Table structure for table `casing_brand`
--

CREATE TABLE `casing_brand` (
  `id` int(11) NOT NULL,
  `casingbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casing_brand`
--

INSERT INTO `casing_brand` (`id`, `casingbrand`, `created_at`) VALUES
(11, 'MSI', '2025-04-14 21:50:04'),
(12, 'Lian Li', '2025-04-14 21:50:07'),
(13, 'HYTE', '2025-04-14 21:50:10'),
(14, 'Cougar', '2025-04-14 21:50:13'),
(15, 'Corsair', '2025-04-14 21:50:16'),
(16, 'Cooler Master', '2025-04-14 21:50:20'),
(17, 'Asus', '2025-04-14 21:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `casing_store`
--

CREATE TABLE `casing_store` (
  `id` int(11) NOT NULL,
  `casingstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `casing_store`
--

INSERT INTO `casing_store` (`id`, `casingstore`, `created_at`) VALUES
(11, ' HYTE', '2025-04-14 21:49:36'),
(12, 'Asus Casing', '2025-04-14 21:49:40'),
(13, 'Lian Li', '2025-04-14 21:49:42'),
(14, 'MSI', '2025-04-14 21:49:46'),
(15, 'Cougar', '2025-04-14 21:49:49'),
(16, 'Cooler Master Casings', '2025-04-14 21:49:53'),
(17, 'Corsair Casings', '2025-04-14 21:49:56');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(1, '9', 'jdchkjahdfjhkjc2GB SSD, 15.6\" FHD 120Hz Display, Carbon Black', '2', 2147483647, 'njsxnkjns', '2-czone.com.pk-1540-16449-200724075120.jpg', 'ascascc', 'ascdc', 'wfesfc', 'adscazdsc', 'acsa', '', '34333', '');

-- --------------------------------------------------------

--
-- Table structure for table `categories_brand`
--

CREATE TABLE `categories_brand` (
  `id` int(11) NOT NULL,
  `catbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories_brand`
--

INSERT INTO `categories_brand` (`id`, `catbrand`, `created_at`) VALUES
(1, 'ascdc', '2025-04-10 18:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories_store`
--

CREATE TABLE `categories_store` (
  `id` int(11) NOT NULL,
  `cattrones` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories_store`
--

INSERT INTO `categories_store` (`id`, `cattrones`, `created_at`) VALUES
(2, 'ascascc', '2025-04-10 18:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `chipset`
--

CREATE TABLE `chipset` (
  `chip_id` int(11) NOT NULL,
  `chip_set` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chipset`
--

INSERT INTO `chipset` (`chip_id`, `chip_set`) VALUES
(7, 'GeForce GT 730'),
(8, 'GeForce RTX 3050'),
(9, 'GeForce RTX 3060'),
(11, 'GeForce RTX 4060'),
(12, 'GeForce RTX 4060 Ti'),
(14, 'Intel ARC B580'),
(16, 'GeForce RTX 5070 Ti'),
(18, 'GeForce RTX 5070'),
(20, 'GeForce RTX 5080');

-- --------------------------------------------------------

--
-- Table structure for table `cooling`
--

CREATE TABLE `cooling` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cooling`
--

INSERT INTO `cooling` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Asus TUF Gaming LC II 360 ARGB All-In-One CPU Liquid Cooler', '3', 2147483647, 'TUF Gaming radiator fans upgraded with brighter ARGB lighting and grooved fins for improved airflow and lower noise\r\n\r\n', '39-czone.com.pk-1540-16644-010824085607.jpg', 'CPU Coolers', 'Asus', 'Support for Intel LGA 1700, 1200, 115x, and AMD AM5 and AM4 sockets', 'Fan Blade Groove Design', 'IP5X-Certified Dust Resistance', 'PWM-Controlled Pump and Fans', '35990', ''),
(4, '', 'Asus ROG Strix LC III 360 ARGB White Edition All-in-one Liquid CPU Cooler', '4', 2147483647, 'With 360° rotating water block, new Asetek Gen7 v2 pump, premium ROG ARGB fans, and 10+ color effects. New water block with 360° rotating ROG logo and 10+ custom Aura lighting effects.\r\n\r\n', '64-czone.com.pk-1540-16801-200824105327.jpg', 'CPU Coolers', 'Asus', 'Lighting Brilliance', 'Cool & Quiet Mastery', 'Cooling on Display', 'Reinforced sleeved tubes offer greater durability', '62000', ''),
(5, '', 'Boost Hydra Pro Premium CPU Liquid Cooler 120mm', '3', 2147483647, 'Features a PWM + ARGB fan connector for precise speed control and customizable lighting effects.\r\n\r\n', '14-czone.com.pk-1540-17335-181124101150.jpg', 'CPU Coolers', 'Boost', 'Fan Connector: PWM + ARGB', 'Airflow: 79.83 CFM (Max)', 'Pump Connector: 3-Pin + ARGB', 'Pump Speed: 2500 RPM ± 10%', '12490', ''),
(6, '', 'Boost Hydra Pro Premium CPU Liquid Cooler 240mm', '5', 2147483647, 'Features a PWM + ARGB fan connector for precise speed control and customizable lighting effects.\r\n\r\n', '16-czone.com.pk-1540-17336-181124101454.jpg', 'CPU Coolers', 'Boost', 'Fan Connector: PWM + ARGB', 'Airflow: 79.83 CFM (Max)', 'Pump Connector: 3-Pin + ARGB', 'Pump Speed: 2500 RPM ± 10%', '15490', ''),
(7, '', 'Cooler Master THERMAL PAD 0.5mm | TPX-NOPP-9005-R1', '2', 2147483647, 'Cooler Master’s new Thermal Pad is an innovative solution to device cooling for a vast range of your electronic devices and components.\r\n\r\n', '16-czone.com.pk-1540-16192-070624092336.jpg', 'Thermal Grease', 'Cooler Master', 'Non-Toxic and Non-Corrosive', 'Double-Sided Adhesive', 'Wide Range of Application', '95 x 45mm', '990', ''),
(8, '', 'Cooler Master Sickle Flow 120 ARGB White Edition 3 IN 1 Square Frame Fan, Customizable LEDs, Air Balance Curve Blade, 120mm PWM Control MFX-B2DW-183PA-R1', '4', 2147483647, 'SickleFlow 120 ARGB White Edition, a new series of the CoolerMaster Fan family.\r\n\r\n', '21-czone.com.pk-1540-17528-171224095519.jpg', 'Case Fans', 'Cooler Master', 'Next Generation of SickleFlow Fans', 'Enhanced Fan Frame', 'Sealed Bearing Structure', 'New Blade Design', '7200', ''),
(9, '', 'Corsair TM30 Performance Thermal Paste CT-9010001-WW', '3', 2147483647, 'CORSAIR TM30 thermal paste helps you push your PC to its limit, with a low-viscosity premium zinc oxide thermal material that’s easy to apply.\r\n\r\n', '10-czone.com.pk-1540-7703-261222074236.jpg', 'Thermal Grease', 'Corsair', 'Enthusiast CPU & GPU thermal compound', 'Improved cpu cooling', 'Fill in the gap', 'Reliable and safe', '2450', ''),
(10, '', 'Corsair RS140 ARGB 140mm PWM Fans - Dual Pack - CO-9050187-WW - White', '3', 2147483647, 'CORSAIR RS140 ARGB PWM 140mm PC Case Fan for Daisy Chain Dual Pack White CO-9050187-WW\r\n\r\n', '49-czone.com.pk-1540-17897-280225095211.jpg', 'Case Fans', 'Corsair', 'Daisy-chained 4-pin PWM connectors', 'Daisy-chained +5V ARGB lighting with eight LEDs per fan', 'CORSAIR AirGuide technology for concentrated airflow', 'CORSAIR Magnetic Dome bearing for longevity and low noise', '8850', ''),
(11, '', 'Cougar FORZA 50 Premium single Tower Air Cooler', '3', 2147483647, 'As a CPU tower cooler for entry-level CPU, Forza 50 with its uniquely designed front cover, paired with COUGAR MHP120 high-performance fan, provides users with perfect heat dissipation. Forza 50 is absolutely suitable for default-setting users.\r\n\r\n', 'czone.com.pk-12-1540-17961-060325070400.jpg', 'CPU Coolers', 'Cougar', 'Elegant Pipe Caps Decoration', 'Extremely Hyper Fan With 2000 RPM(max)', 'Vacuum Tunnel Design', 'HDT Technology With 4 Heat Pipes', '10500', ''),
(12, '', 'Cougar Poseidon Elite 360 ARGB White CPU Cooler, High Performance ARGB AIO Liquid Cooler, Black', '5', 2147483647, 'The Poseidon Elite ARGB AIO liquid cooler delivers high cooling performance.\r\n\r\n', 'czone.com.pk-24-1540-17955-040325072734.jpg', 'CPU Coolers', 'Cougar', 'Brilliant ARGB Lighting with Infinity Mirror Design', 'Rotatable Pump Head For Logo Orientation', 'High-efficiency Fan for Radiator', 'Control Fans & Lighting with Motherboard Sync Software', '24990', ''),
(13, '', 'Cougar Poseidon Elite 240 ARGB White CPU Cooler, High Performance ARGB AIO Liquid Cooler, Black', '5', 2147483647, 'The Poseidon Elite ARGB AIO liquid cooler delivers high cooling performance.\r\n\r\n', 'czone.com.pk-15-1540-17953-040325072520.jpg', 'CPU Coolers', 'Cougar', 'Brilliant ARGB Lighting with Infinity Mirror Design', 'Rotatable Pump Head For Logo Orientation', 'High-efficiency Fan for Radiator', 'Control Fans & Lighting with Motherboard Sync Software', '19990', ''),
(14, '', 'Cougar APOLAR 120 ARGB | 3 Fan Pack Black | Elite Universal Modular Fan | Daisy Chaining', '4', 2147483647, 'A fully circumscribed fan maximizes the surface area of the fan blades, delivering maximum performance without compromising style.\r\n\r\n', 'czone.com.pk-3-1540-17959-060325065232.jpg', 'Case Fans', 'Cougar', 'Q-Stop double vibration suppression eliminates noise and oscillatory load.', 'Light bar placement ensures full view of ARGB lighting from any angle.', 'Cooling Mastery', 'Chain Combo', '15990', ''),
(15, '', 'HYTE Thicc FP12 Nexus Portal NP50 Bundle, 120mm x 32mm Performance Fans, 3 Pack, Includes Nexus Link Primary Node, White Black', '4', 2147483647, 'Digital Processor Cooling\r\n\r\n', '15-czone.com.pk-1540-17877-260225101938.jpg', 'Case Fans', 'HYTE', 'Cooling unlocks potential', 'Fans should be seen and not heard', 'THICC: Technology Harnessing Innovative Chonk for Cooling', 'Fits in any 2.5” mounting location with ease', '32990', ''),
(16, '', 'HYTE THICC Q60 Digital Liquid Cooling System - Liquid Cooler', '5', 2147483647, '720 x 1280 resolution, 60Hz refresh rate, and 300 nits of brightness for an incredibly crisp and smooth visual experience delivered to your physical world with real life depth\r\n\r\n', '91-czone.com.pk-1540-17172-281024123627.jpg', 'CPU Coolers', 'HYTE', 'Digital Processor Cooling', 'Cables are just super gross, so we got rid of like all the cables', 'THICC: Technology Harnessing Innovative Chonk for Cooling', '5” Ultraslim IPS Display', '67990', ''),
(17, '', 'Lian Li UNI Fan SL120 ARGB White, 3 x Fans with Controller, UF-SL120-3W', '3', 2147483647, 'Revolutionary fan with modular design, an interlocking fan that can be linked up and operate with a fan and RGB cable.\r\n\r\n', '624498-126722-01-front-zoom-1540-11296-190321080334.jpg', 'Case Fans', 'Lian Li', '124 X 122.5 X 25 ( mm )', 'Fan Speed 800~1900RPM', 'Fluid Dynamic Bearing (FDB)', 'UNI FAN SL120', '22500', ''),
(18, '', 'Lian Li UNI FAN SL120 V2 RGB Revolutionized Daisy-Chain ARGB Case Fan 120mm Triple Pack with Controller White SL120V2-3W', '3', 2147483647, 'UNI FAN SL V2 revised its interlocking style to connect up to 6 fans in two clusters to a single controller port, making cable management simpler.\r\n\r\n', '20-czone.com.pk-1540-14598-190423071740.jpg', 'Case Fans', 'Lian Li', 'Improved daisy chain design to connect 2 clusters of fans.', 'Removable interlocking keys to provide better radiator clearance.', 'Start/stop fan RPM support for a quieter environment.', 'Smoother side lighting for a better aesthetic.', '25500', ''),
(19, '', 'Lian Li UNI Fan SL-Infinity 120 RGB Daisy-Chain ARGB Fan | White - UF-SLIN120-3W - 3 x 120mm Fans', '4', 2147483647, 'Introducing a new look to PC fans and a new level of installation simplicity and light effect customizability.\r\n\r\n', '27-czone.com.pk-1540-13611-300822081625.jpg', 'Case Fans', 'Lian Li', 'Software controlled fan speed/ LED lighting', 'Daisy-Chain Design', 'Quick PIN connection to provide ease of installation', 'Low noise level at high RPM', '27500', ''),
(20, '', 'Lian Li Hydroshift 360 AIO - Pre-Installed 3 TL Fans, Side-Mounted Coolant Pathway, 2.88” LCD White', '5', 2147483647, '2.88” LCD Screen 480 x 480 Res. Captured Images & Recorded Videos -LGA 1851,1700, 1200, AM5, AM4 HSLCD36TB\r\n\r\n', '68-czone.com.pk-1-1540-17932-010325125205.jpg', 'Case Fans', 'Lian Li', 'Shifted AIO tubes for a near-tubeless aesthetic.', 'Features server-style ribbed tubes for tight bending radius', 'Performance-enhanced and noise-optimized pump.', 'Features a 2.88” IPS LCD screen with a 480×480 resolution.', '74990', ''),
(21, '', 'Lian Li Hydroshift 360 AIO - Pre-Installed 3 TL Fans, Side-Mounted Coolant Pathway, 2.88” LCD Black', '5', 2147483647, '2.88” LCD Screen 480 x 480 Res. Captured Images & Recorded Videos -LGA 1851,1700, 1200, AM5, AM4 HSLCD36TB\r\n\r\n', '66-czone.com.pk-1-1540-17931-010325124932.jpg', 'Case Fans', 'Lian Li', 'Shifted AIO tubes for a near-tubeless aesthetic.', 'Features server-style ribbed tubes for tight bending radius', 'Performance-enhanced and noise-optimized pump.', 'Features a 2.88” IPS LCD screen with a 480×480 resolution.', '74990', ''),
(22, '', 'MSI MAG CORELIQUID E360 | AIO Liquid Cooler White', '4', 2147483647, 'The MAG series fights alongside gamers in pursuit of honor. With added military-inspired elements in these gaming products, they were reborn as the symbol of sturdiness and durability.\r\n\r\n', '9-czone.com.pk-1540-16905-050924080117.jpg', 'CPU Coolers', 'MSI', 'Rotatable Blockhead', 'Achieve Full CPU Coverage', 'Pump Cooling Design', 'High Thermal Dissipation', '31990', ''),
(23, '', 'MSI MAG CORELIQUID E360 | AIO Liquid Cooler', '4', 2147483647, 'The MAG series fights alongside gamers in pursuit of honor. With added military-inspired elements in these gaming products, they were reborn as the symbol of sturdiness and durability.\r\n\r\n', '10-czone.com.pk-1540-16252-150624100221.jpg', 'CPU Coolers', 'MSI', 'Rotatable Blockhead', 'Achieve Full CPU Coverage', 'Pump Cooling Design', 'High Thermal Dissipation', '31990', ''),
(24, '', 'MSI MPG CORELIQUID D360 CPU Cooler 360mm Aluminum Radiator, ARGB, MSI\'s TORX FAN 4.0, 2.4” Customizable IPS Display', '5', 2147483647, '60 mm TORX FAN 3.0 within the water block provides heat dissipation to the power solutions.\r\n\r\n', '17-czone.com.pk-1540-16966-190924112532.jpg', 'CPU Coolers', 'MSI', 'MSI\'s TORX FAN 4.0 provides supreme cooling to the radiator.', '2.4” Customizable IPS display', 'Latest CPU socket supported: Intel LGA 1700 & AMD AM5.', 'Mystic Light Compatible', '67990', ''),
(25, '', 'NZXT Aer RGB 2 120mm Case Fan - Matte White - HF-28120-BW', '3', 2147483647, 'These RGB case fans deliver optimal airflow and advanced lighting effects powered by NZXT CAM.\r\n\r\n', '12-czone.com.pk-1540-13958-291022065555.jpg', 'Case Fans', 'NZXT', 'Connect up to ?ve fans per channel', 'Mix-and-match with any RGB Lighting & Fan Control accessory*', 'Daisy chain and group fans together for additional lighting effects', 'PWM fan with optimized cooling and whisper-low 22 dBA', '7990', ''),
(26, '', 'NZXT Aer RGB 2 140mm Case Fan - Matte Black - HF-28140-B1', '3', 2147483647, 'These RGB case fans deliver optimal air?ow and advanced lighting effects powered by NZXT CAM.\r\n\r\n', '2-czone.com.pk-1540-13956-291022064628.jpg', 'Case Fans', 'NZXT', 'Connect up to ?ve fans per channel', 'Mix-and-match with any RGB Lighting & Fan Control accessory*', 'PWM fan with optimized cooling and whisper-low 22 dBA', 'Fluid dynamic bearing engineered to last over six years', '8900', ''),
(27, '', 'NZXT F140 RGB DUO 140mm Dual-sided RGB Fan Black', '5', 2147483647, 'The RGB Duo Fans strike a balance between bright style and performance with twenty individually addressable RGBs and high static pressure.\r\n\r\n', '19-czone.com.pk-1540-15557-051223100647.jpg', 'Case Fans', 'NZXT', '20 Individually Addressable LED', 'Balanced Airflow and Static Pressure', 'Fluid Dynamic Bearing – PWM Control', 'Anti-Vibration Rubber Corners', '10890', ''),
(28, '', 'Thermal Grizzly Aeronaut Thermal Paste TG-A-001-RS 1 Gram', '3', 2147483647, 'The Aeronaut thermal paste is an ideal entry-level product with very good effectiveness: The high surface protection and good thermal conductivity of Aeronaut is ideal for all users who want to optimize their cooling system effectively', '2021-05-22-23-37-39-thermal-grizzly-aeronaut-high-performanc-1540-11560-220521063758.jpg', 'Thermal Grease', 'Thermal Grizzly', 'Very good thermal conductivity', 'High long-term stability', 'No curing', 'Not electrically conductive', '2500', ''),
(29, '', 'Thermal Grizzly HYDRONAUT Thermal Paste TG-H-001-RS 1G', '3', 2147483647, 'Applicable to aluminium coolers\r\n\r\n', '3-czone.com.pk-1540-11761-101224082908.jpg', 'Thermal Grease', 'Thermal Grizzly', 'Suitable for overclocking', 'Excellent thermal conductivity', 'Silicone free', 'Not electrically conductive', '2650', ''),
(30, '', 'Thermal Grizzly Kryonaut Thermal Paste 1g TG-K-001-RS', '3', 2147483647, 'The Kryonaut thermal paste was specially developed for the extremely demanding applications and the highest demands of the overlocking community. Kryonaut is also recommended as a top product for critical cooling systems in the industrial sector.\r\n\r\n', '11-czone.com.pk-1540-11595-280521115600.jpg', 'Thermal Grease', 'Thermal Grizzly', 'Especially for overclocking', 'Excellent thermal conductivity', 'High long-term stability', 'Not electrically conductive', '3000', ''),
(31, '', 'Thermal Grizzly Kryonaut Extreme High-Performance Thermal Paste TG-KE-002-R', '3', 2147483647, 'Thermal Grizzly Kryonaut Extreme is a high-performance thermal paste based on our proven Kryonaut paste. Maximum thermal conductivity through the smallest particle size and layer thickness, combined with improved low-temperature resilience is the bas', 'prod-16928693828-1540-11558-220521062427.jpg', 'Thermal Grease', 'Thermal Grizzly', 'Especially for overclocking', '14.2 W / m * K thermal conductivity', 'No curing', 'High long-term stability', '5800', ''),
(32, '8', 'Thermalright Assassin King 120 SE White ARGB CPU Air Cooler, AK120 SE ARB, 5 Heatpipes, TL-C12C-S PWM Quiet Fan CPU Cooler with S-FDB Bearing, for AMD AM4/AM5 Intel LGA1700/1150/1151/1200', '4', 2147483647, 'Premium THERMALRIGHT TF-4 thermal paste is also included with a CPU cooler for the best out-of-the-box performance. The redesigned Thermalright SS2 mounting system offers an easy installation process and optimal mounting pressure.\r\n\r\n', '19-czone.com.pk-1540-17239-041124091104.jpg', 'CPU Coolers', 'Thermalright', 'Excellence User Experience', '5 AGHP (Anti-Gravity Heat Pipe) Technology Heat Pipes', 'Balance Performance TL-C12 C-S Fan', 'Power Connector Type 4-Pin', '8750', '9500'),
(33, '', 'Thermalright Frozen Vision 360 White Liquid CPU Water Cooler', '5', 2147483647, 'With 120 mm PWM Fan\r\n\r\n', '39-czone.com.pk-1540-17808-130225091557.jpg', 'CPU Coolers', 'Thermalright', '2.88 Inch Square IPS LCD Screen', 'Computer Water Cooler', 'Intel | LGA115X/1200/1700/1851/2011/2066', 'AMD | AM4/AM5', '38900', ''),
(34, '', 'XPG HURRICANE 120 ARGB PWM Case Fan White, Daisy Chain Capability', '3', 2147483647, 'XPG HURRICANE 120 ARGB PWM fan offers more than just mesmerizing dual-ring lighting effects. The fan speed runs up to 2,000 RPM, generating up to 61.5 CFM of cool air with 1.42 mmAq of static pressure.\r\n\r\n', '1-czone.com.pk-1540-16940-120924110710.jpg', 'Case Fans', 'XPG', 'Dual-Ring ARGB LED Design', 'Efficient Cooling Performance', 'Fluid Dynamic Bearing (FDB)', 'Patented Fan Blade Design, Daisy Chain Capability', '2900', ''),
(35, '', 'XPG HURRICANE 140 ARGB PWM Case Fan 140mm White', '3', 2147483647, 'XPG HURRICANE ARGB PWM fans are available in 120mm and 140mm models. Both offer mesmerizing dual-ring lighting effects and are compatible with most major motherboard ARGB software.\r\n\r\n', '1-czone.com.pk-1540-16940-120924110710.jpg', 'Case Fans', 'XPG', 'Dual-Ring ARGB LED Design', 'Efficient Cooling Performance', 'Fluid Dynamic Bearing (FDB)', 'Patented Fan Blade Design, with Daisy Chain Capability', '3300', '');

-- --------------------------------------------------------

--
-- Table structure for table `cooling_brand`
--

CREATE TABLE `cooling_brand` (
  `id` int(11) NOT NULL,
  `coolingbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cooling_brand`
--

INSERT INTO `cooling_brand` (`id`, `coolingbrand`, `created_at`) VALUES
(4, 'Asus', '2025-04-14 22:27:29'),
(5, 'Boost', '2025-04-14 22:27:35'),
(6, 'Cooler Master', '2025-04-14 22:27:38'),
(7, 'Corsair', '2025-04-14 22:27:43'),
(8, 'Cougar', '2025-04-14 22:27:48'),
(9, 'HYTE', '2025-04-14 22:27:50'),
(10, 'Lian Li', '2025-04-14 22:27:59'),
(11, 'MSI', '2025-04-14 22:28:36'),
(12, 'NZXT', '2025-04-14 22:28:40'),
(13, 'Thermal Grizzly', '2025-04-14 22:28:45'),
(14, 'Thermalright', '2025-04-14 22:28:49'),
(15, 'XPG', '2025-04-14 22:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `cooling_store`
--

CREATE TABLE `cooling_store` (
  `id` int(11) NOT NULL,
  `coolingstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cooling_store`
--

INSERT INTO `cooling_store` (`id`, `coolingstore`, `created_at`) VALUES
(4, 'CPU Coolers', '2025-04-14 22:26:15'),
(5, 'Case Fans', '2025-04-14 22:26:18'),
(6, 'Thermal Grease', '2025-04-14 22:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `deskcomp`
--

CREATE TABLE `deskcomp` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deskcomp`
--

INSERT INTO `deskcomp` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '5', 'CyberTech Gaming PC | AMD Ryzen 5 5600', '4', 2147483647, 'MSI MAG Forge M100A Mesh Certified Micro-ATX Tower Tempered Glass PC Case Black. Boost Blizzard ARGB CPU Cooler\r\n\r\n', '35-czone.com.pk-1540-17768-050225083617.jpg', 'Gaming PC', 'AMD', 'AMD Ryzen 5 5600 Desktop Processor | 6-Core 12 Thread', 'Lexar DDR4-3200 UDIMM Memory 16GB | Lexar NM620 M.2 2280 NVMe SSD 1TB', 'ZOTAC GAMING GeForce RTX 3050 6GB GDDR6 Twin Edge OC Video Graphics Card', 'MSI A520M-A PRO - Corsair CX Series CX550 - 550 Watt 80 PLUS PSU', '162950', '171270'),
(5, '', 'CyberTech Extreme Gaming PC | AMD Ryzen 5 5600 | RTX 3050 ECO 8GB', '4', 2147483647, 'Power up your gaming with this budget-friendly yet powerful PC build, featuring the AMD Ryzen 5 5600 6-core processor and ZOTAC RTX 3050 8GB GPU for smooth 1080p gaming.\r\n\r\n', 'copy-35-czone.com.pk-1540-17768-050225083617.jpg', 'Gaming PC', 'AMD', 'AMD Ryzen 5 5600 Desktop Processor | MSI A520M-A PRO', 'Lexar DDR4-3200 UDIMM Memory 16GB | Lexar NM620 M.2 2280 NVMe SSD 1TB', 'ZOTAC GAMING GEFORCE RTX 3050 ECO 8GB GDDR6 | Boost Blizzard ARGB Cooler', 'MSI MAG Forge M100A Mesh - Corsair CX Series CX550 - 550 Watt 80 PLUS PSU', '177300', ''),
(6, '', 'HP Pro Tower 290 G9 Desktop PC, Intel Core i3-12100 8GB 512GB SSD', '4', 2147483647, 'Easily manage your daily business with an Intel® processor, powerful memory, drives, and graphics.\r\n\r\n', '18-czone.com.pk-1540-15444-131123111225.jpg', 'HP Desktop', 'HP', 'Intel® Core™ i3-12100, 4 Cores', '8 GB DDR4-3200 MHz, 512GB SATA SSD', 'Intel® H670 Chipset - Intel® UHD Graphics 730', 'HP Wired Mouse, HP Wired Keyboard', '105000', ''),
(7, '', 'HP Pro Tower 290 G9 Desktop PC | Intel Core i3-13100 4GB 256GB SSD', '4', 2147483647, 'Easily manage your daily business with an Intel® processor, powerful memory, drives, and graphics.\r\n\r\n', '18-czone.com.pk-1540-15444-131123111225.jpg', 'HP Desktop', 'HP', 'Intel® Core™ i3-13100 Processor', '4 GB DDR4-3200 MHz, 256GB SSD', 'Intel Graphics', 'HP Wired Mouse, HP Wired Keyboard', '111900', ''),
(8, '5', 'Inferno Gaming Desktop PC | AMD Ryzen 5 5600 | ZOTAC GAMING GeForce RTX 3050 6GB', '3', 2147483647, 'It is a good choice for mid-range gaming, content creation, and general productivity tasks.\r\n\r\n', '35-czone.com.pk-1540-17768-050225083617.jpg', 'Gaming PC', 'Miscellaneous', 'AMD Ryzen 5 5600 Desktop Processor | MSI A520M-A PRO Gaming Motherboard', 'Lexar DDR4-3200 UDIMM Desktop Memory 16GB | Lexar NS100 512GB SSD', 'ZOTAC GeForce RTX 3050 6GB | Thermalright Assassin X 120 Refined SE ARGB', 'Gigabyte P450B 80 PLUS Bronze Certified 450W | MSI MAG Forge M100A', '151990', '160260'),
(9, '3', 'Phantom Vortex Gaming PC | Intel Core i5-12400F | ASUS Dual GeForce RTX 3050 8GB', '3', 2147483647, 'Ideal For: 1080p Gaming, Streaming, Content Creation\r\n\r\n', '35-czone.com.pk-1540-17768-050225083617.jpg', 'Gaming PC', 'Miscellaneous', 'Intel Core i5-12400F | MSI PRO H610M-E DDR5', 'Kingston 16GB DDR5 5600MHz (1x16GB) | Kingston NV3 1TB NVMe Gen4 SSD', 'ASUS Dual GeForce RTX 3050 8GB GDDR6 | Thermalright Assassin X 120 ARGB', 'Corsair CX550 80+ Bronze | MSI MAG Forge M100A Mesh', '194500', '200140'),
(10, '7', 'HyperNova Gaming PC | Intel Core i5-12400F, RTX 3050 8GB', '5', 2147483647, 'This high-performance gaming PC is perfect for smooth 1080p and 1440p gaming, multitasking, and content creation.\r\n\r\n', '28-czone.com.pk-1540-15967-080524100432-1540-17769-050225085342.jpg', 'Gaming PC', 'Intel', 'Intel Core i5-12400F Processor | MSI B760M PROJECT ZERO Motherboard', 'XPG LANCER BLADE RGB 16GB DDR5 5600 | Kingston NV3 1TB PCIe 4.0 NVMe SSD', 'ZOTAC GAMING GeForce RTX 3050 8GB | Thermalright Assassin King 120 SE', 'Antec CUPRUM STRIKE CSK 550W PSU | XPG VALOR AIR Compact Mid-Tower Chassis', '228000', '245080'),
(11, '', 'Asus ExpertCenter D5 Tower D500TC - Intel® Core™ i5-11400 - 8GB Memory - 1TB HDD - Windows 11 (Official Warranty)', '3', 2147483647, 'ASUS ExpertCenter D5 Tower is a refreshed desktop PC with more than enough processing power and reliable components. It’s easy to upgrade, so it can become more powerful and versatile as your business grows.\r\n\r\n', '1-czone.com.pk-1540-17175-291024094413.jpg', 'Asus', 'Asus', 'Intel® Core™ i5-11400 Processor', '8GB Memory - 1TB HDD', 'Keyboard | Mouse | Windows 11 Home', 'Official Warranty', '107000', ''),
(12, '7', 'Asus ROG NUC 970 Mini PC | Built for Gamers | Intel Core Ultra 9 Processor 185H - 32GB DDR5 5600 - 1TB PCIe Gen4 SSD - NVIDIA GeForce RTX 4070 8GB GDDR6 | RNUC14SRKU9189A0I', '5', 2147483647, 'Introducing the revolutionary gaming Mini PC - ROG NUC powered by Intel® Core™ Ultra\r\n\r\n', '28-czone.com.pk-1540-17541-191224090935.jpg', 'Asus', 'Asus', 'Intel® Core™ Ultra 9 Processor 185H, cTDP 65W', '32GB Memory - 1TB SSD', 'NVIDIA® GeForce RTX™ 4070 Laptop GPU 8GB GDDR6', '?Windows 11 - Intel® Arc™ GPU2', '789990', '850000'),
(13, '', 'Apple iMac 24\" | Apple M3 8-Core CPU, 8GB, 512GB SSD, 10-Core GPU | Blue | MQRR3', '5', 2147483647, 'The world’s best all-in-one computer, is now supercharged by the M3 chip. With a stunning 24-inch display* that gives you all the space you need and an iconic design that livens up any space, iMac is perfect for work and play.\r\n\r\n', 'copy-42-czone.com.pk-1540-15890-020524100539.jpg', 'Apple iMac', 'Apple', 'Apple M3 8-Core CPU', '8GB Unified RAM | 512GB SSD', '10-Core GPU | 16-Core Neural Engine', '24\" 4480 x 2520 Retina Display', '542000', ''),
(14, '', 'Apple Mac Studio - M1 Max 10-Core CPU, 32GB RAM, 512GB SSD | MJMV3 - MJMV2', '5', 2147483647, 'Creative professionals can run multiple apps, sort and edit thousands of photos, play back 9 streams of 8K ProRes video, record and mix pro-quality music, and more using the Apple Mac Studio.\r\n\r\n', '10-czone.com.pk-1540-13327-210622094622.jpg', 'Apple Mac Studio', 'Apple', 'Apple M1 Max 10-Core CPU', '32GB Unified RAM | 512GB SSD', '24-Core GPU | 16-Core Neural Engine', 'UHS-II SDXC Card Reader', '655000', ''),
(15, '', 'Apple iMac 24\" M4 10-Core CPU 32GB 2TB 10-Core GPU | Silver', '5', 10000000, 'Supercharged with an M4 chip and Apple Intelligence, the Apple 24\" iMac delivers performance boosts to everyday activities and intense workloads.\r\n\r\n', 'copy-copy-copy-18-czone.com.pk-1540-17677-170125101136.jpg', 'Apple iMac', 'Apple', 'Apple M4 10-Core CPU', '32GB Unified RAM | 2TB SSD', '10-Core GPU | 16-Core Neural Engine', '24\" 4480 x 2520 Retina Display', '997000', ''),
(16, '', 'Apple iMac 24\" M4 10-Core CPU 16GB 2TB 10-Core GPU | Blue', '5', 1, 'Supercharged with an M4 chip and Apple Intelligence, the Apple 24\" iMac delivers performance boosts to everyday activities and intense workloads.\r\n\r\n', '22-czone.com.pk-1540-17681-170125110421.jpg', 'Apple iMac', 'Apple', 'Apple M4 10-Core CPU', '16GB Unified RAM | 2TB SSD', '10-Core GPU | 16-Core Neural Engine', '24\" 4480 x 2520 Retina Display', '840000', ''),
(17, '10', 'Apple Mac mini | Apple M4 10-Core Chip, 16GB Unified RAM, 256GB SSD, 10-Core GPU | MU9D3', '3', 2147483647, 'At just five by five inches, the Apple Mac mini is less than half the size of the previous Mac mini.\r\n\r\n', '1-czone.com.pk-1-1540-17286-111124105416.jpg', 'Apple Mac Mini', 'Apple', 'Apple M4 10-Core Chip', 'Wi-Fi 6E (802.11ax) | Bluetooth 5.3', '16GB Unified RAM | 256GB SSD', '10-Core GPU | 16-Core Neural Engine - Gigabit Ethernet', '198000', '220000'),
(18, '', 'Apple Mac mini with M4 Pro Chip, Apple M4 Pro 14-Core Chip, 24GB 1TB, System Active Z1JV000KL', '4', 2147483647, 'At just five by five inches, the Apple Mac mini is less than half the size of the previous Mac mini.\r\n\r\n', '1-czone.com.pk-1-1540-17286-111124105416.jpg', 'Apple Mac Mini', 'Apple', 'Apple M4 Pro 14-Core Chip', '24GB Unified RAM | 1TB SSD', '20-Core GPU | 16-Core Neural Engine', 'Wi-Fi 6E (802.11ax) | Bluetooth 5.3', '475000', ''),
(19, '', 'Apple Mac Studio - Apple M2 Max 12-Core CPU - 64GB Unified RAM | 1TB SSD - 30-Core GPU | Z17Z000JX Z17Z000HX', '5', 2147483647, 'With the M2 Max 12-core processor at its heart, the compact Apple Mac Studio empowers creative professionals to take on almost any project, ranging from editing your first video to putting together a feature-length film.\r\n\r\n', '10-czone.com.pk-1540-13327-210622094622.jpg', 'Apple Mac Studio', 'Apple', 'Apple M2 Max 12-Core CPU', '64GB Unified RAM | 1TB SSD', '30-Core GPU | 16-Core Neural Engine', 'UHS-II SDXC Card Reader', '985000', ''),
(20, '', 'Dell OptiPlex 7000 Tower Desktop Computer - Intel Core i7-12700, 8GB, 1TB HDD', '3', 2147483647, 'Modern designs allow the OptiPlex 7000 Towers to fit in beautifully in any modern workspace.\r\n\r\n', '1-czone.com.pk-1-1540-14073-051222082055.jpg', 'Dell Desktop', 'Dell', 'Intel Core i7-12700 12-Core (12th Gen)', '8GB DDR5 RAM - 1TB SATA HDD', 'Integrated Intel UHD Graphics 770', 'Keyboard / Mouse / DVD', '220000', ''),
(21, '', 'Dell OptiPlex Tower Plus Computer 7020 Plus | Intel Core i7 14700 8GB DDR5 512GB SSD', '3', 2147483647, 'High performance commercial desktop with DDR5 memory.\r\n\r\n', '6-czone.com.pk-1540-17402-261124114524.jpg', 'Dell Desktop', 'Dell', 'Intel® Core™ i7 14700', '8GB DDR5 - 512GB M.2 2230 PCIe NVMe SSD', 'Intel® Graphics, USB-C, Wi-Fi 6 2x2, Bluetooth', 'Keyboard, Mouse, 260W Bronze Power Supply', '225000', ''),
(22, '', 'Lenovo IdeaCentre AIO 24IRH9 All-in-One Desktop PC | Intel Core i5-13420H | 8GB 512GB SSD | 23.8\" FHD Touchscreen | 1 - Year Warranty', '4', 2147483647, 'Model: F0HN000SA\r\n\r\n', 'czone.com.pk-6-1540-18141-120425042229.jpg', 'Lenovo Desktop', 'Lenovo', 'Intel Core i5-13420H, 8C (4P + 4E)', '8GB SO-DIMM DDR5-5200 | 512GB SSD M.2 2280 PCIe 4.0x4 NVMe', 'Integrated Intel UHD Graphics', '23.8\" FHD (1920x1080) IPS TouchScreen', '225000', ''),
(23, '', 'Lenovo IdeaCentre AIO 3 24IAP7 Desktop PC | Intel Core i7-13620H 8GB 512GB SSD | NVIDIA GeForce MX550 4GB GDDR6 | 23.8\" FHD | 1-Year Warranty | All in One', '4', 2147483647, 'F0GH010KAK\r\n\r\n', 'czone.com.pk-5-1540-18140-120425041355.jpg', 'Lenovo Desktop', 'Lenovo', 'Intel Core i7-13620H, 10C', '8GB SO-DIMM DDR4-3200, 512GB SSD M.2 2280 PCIe 4.0x4 NVMe', 'NVIDIA GeForce MX550 4GB GDDR6', '23.8\" FHD (1920x1080) IPS 250nits Anti-glare, Touch', '295000', ''),
(24, '', 'HyperNova Gaming PC | Intel Core i7-12400F, RTX 3050 32GB', '5', 2147483647, 'This high-performance gaming PC is perfect for smooth 1080p and 1440p gaming, multitasking, and content creation.\r\n\r\n', '28-czone.com.pk-1540-15967-080524100432-1540-17769-050225085342.jpg', 'Gaming PC', 'Intel', 'Intel Core i7-12400F Processor | MSI B760M PROJECT ZERO Motherboard', 'XPG LANCER BLADE RGB 16GB DDR5 5600 | Kingston NV3 1TB PCIe 4.0 NVMe SSD', 'ZOTAC GAMING GeForce RTX 3050 8GB | Thermalright Assassin King 120 SE', 'Antec CUPRUM STRIKE CSK 550W PSU | XPG VALOR AIR Compact Mid-Tower Chassis', '318000', '');

-- --------------------------------------------------------

--
-- Table structure for table `deskcomp_brand`
--

CREATE TABLE `deskcomp_brand` (
  `id` int(11) NOT NULL,
  `deskcompbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deskcomp_brand`
--

INSERT INTO `deskcomp_brand` (`id`, `deskcompbrand`, `created_at`) VALUES
(2, 'Miscellaneous', '2025-04-29 09:07:06'),
(3, 'Lenovo', '2025-04-29 09:07:10'),
(4, 'Intel', '2025-04-29 09:07:12'),
(5, 'HP', '2025-04-29 09:07:15'),
(6, 'Dell', '2025-04-29 09:07:25'),
(7, 'Asus', '2025-04-29 09:07:32'),
(8, 'Apple', '2025-04-29 09:07:35'),
(9, 'AMD', '2025-04-29 09:07:39');

-- --------------------------------------------------------

--
-- Table structure for table `deskcomp_store`
--

CREATE TABLE `deskcomp_store` (
  `id` int(11) NOT NULL,
  `deskcompstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deskcomp_store`
--

INSERT INTO `deskcomp_store` (`id`, `deskcompstore`, `created_at`) VALUES
(6, 'Apple iMac', '2025-04-29 09:06:31'),
(7, 'Gaming PC', '2025-04-29 09:06:38'),
(8, 'Apple Mac Studio', '2025-04-29 09:06:42'),
(9, 'Lenovo Desktop', '2025-04-29 09:06:46'),
(10, 'Asus', '2025-04-29 09:06:49'),
(11, 'Apple Mac Mini', '2025-04-29 09:06:52'),
(12, 'HP Desktop', '2025-04-29 09:06:54'),
(14, 'Dell Desktop', '2025-04-29 09:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `gamingconsoles`
--

CREATE TABLE `gamingconsoles` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamingconsoles`
--

INSERT INTO `gamingconsoles` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Microsoft Xbox Wireless Controller | Carbon Black', '3', 2147483647, 'Microsoft - Xbox Wireless Controller for Xbox Series X, Xbox Series S, Xbox One, Windows Devices\r\n\r\n', '7-czone.com.pk-1-1540-16086-250524084812.jpg', 'Controllers', 'Microsoft', 'Elevate your game', 'Custom mapping', 'Xbox Wireless and Bluetooth technology', 'Stay on target', '16490', ''),
(4, '', 'Microsoft Xbox Wireless Controller | Robot White', '3', 2147483647, 'Microsoft - Xbox Wireless Controller for Xbox Series X, Xbox Series S, Xbox One, Windows Devices\r\n\r\n', '11-czone.com.pk-1-1540-16087-250524084939.jpg', 'Controllers', 'Microsoft', 'Elevate your game', 'Custom mapping', 'Xbox Wireless and Bluetooth technology', 'Stay on target', '16990', ''),
(5, '', 'Microsoft Xbox Wireless Controller | Shock Blue', '3', 2147483647, 'Microsoft - Xbox Wireless Controller for Xbox Series X, Xbox Series S, Xbox One, Windows Devices\r\n\r\n', '1-czone.com.pk-1540-16355-050724021343.jpg', 'Controllers', 'Microsoft', 'Elevate your game', 'Custom mapping', 'Xbox Wireless and Bluetooth technology', 'Stay on target', '17500', ''),
(6, '', 'Sony DualSense Wireless Controller for PS5 PlayStation 5 | Nova Pink', '4', 2147483647, 'Bring gaming worlds to life - Feel your in-game actions and environment simulated through haptic feedback. Experience varying force and tension at your fingertips with adaptive triggers.\r\n\r\n', '15-czone.com.pk-1540-15229-160923083224.jpg', 'Controllers', 'Sony', 'Haptic Feedback', 'Dynamic Adaptive Triggers', 'Built-In Microphone', 'Signature PlayStation Comfort', '19500', ''),
(7, '', 'Sony DualSense Wireless Controller for PS5 PlayStation 5 | Cosmic Red', '4', 2147483647, 'Discover a deeper, highly immersive gaming experience1 that brings the action to life in the palms of your hands. The DualSense wireless controller offers immersive haptic feedback2, dynamic adaptive triggers2 and a built-in microphone', '14-czone.com.pk-1540-14528-250323102726.jpg', 'Controllers', 'Sony', 'Haptic Feedback', 'Dynamic Adaptive Triggers', 'Built-In Microphone', 'Signature PlayStation Comfort', '19500', ''),
(8, '', 'Sony DualSense Wireless Controller for PS5 PlayStation 5 | Midnight Black', '4', 2147483647, 'Discover a deeper, highly immersive gaming experience1 that brings the action to life in the palms of your hands. The DualSense wireless controller offers immersive haptic feedback2, dynamic adaptive triggers2 and a built-in microphone', '6-czone.com.pk-1540-14701-170523084841.jpg', 'Controllers', 'Sony', 'Haptic Feedback', 'Dynamic Adaptive Triggers', 'Built-In Microphone', 'Signature PlayStation Comfort', '20500', ''),
(9, '', 'Sony DualSense Wireless Controller for PS5 PlayStation 5 | White', '4', 2147483647, 'Discover a deeper, highly immersive gaming experience* that brings the action to life in the palms of your hands. The DualSense wireless controller offers immersive haptic feedback*, dynamic adaptive triggers* and a built-in microphone', '16-czone.com.pk-1540-14529-250323103016.jpg', 'Controllers', 'Sony', 'Haptic Feedback', 'Dynamic Adaptive Triggers', 'Built-In Microphone', 'Signature PlayStation Comfort', '20500', ''),
(10, '', 'Sony DualSense Wireless Controller for PS5 PlayStation 5 | Volcanic Red', '4', 2147483647, 'Discover a deeper, highly immersive gaming experience1 that brings the action to life in the palms of your hands. The DualSense wireless controller offers immersive haptic feedback2, dynamic adaptive triggers2 and a built-in microphone', '1-czone.com.pk-1540-16396-110724071606.jpg', 'Controllers', 'Sony', 'Haptic Feedback', 'Dynamic Adaptive Triggers', 'Built-In Microphone', 'Signature PlayStation Comfort', '20800', ''),
(11, '', 'Sony DualSense Wireless Controller for PS5 PlayStation 5 | Cobalt Blue', '4', 2147483647, 'Discover a deeper, highly immersive gaming experience1 that brings the action to life in the palms of your hands. The DualSense wireless controller offers immersive haptic feedback2, dynamic adaptive triggers2 and a built-in microphone', '14-czone.com.pk-1540-16398-110724072417.jpg', 'Controllers', 'Sony', 'Haptic Feedback', 'Dynamic Adaptive Triggers', 'Built-In Microphone', 'Signature PlayStation Comfort', '20990', ''),
(12, '27', 'Nintendo Switch OLED Model White Set - Japan', '4', 2147483647, 'Get the gaming system that lets you play the games you want, wherever you are, however you like. Bring the full home gaming system experience with you to the park, on an airplane, in a car, or to a friend’s apartment.\r\n\r\n', '37-czone.com.pk-1540-15419-021123122005.jpg', 'Gaming Consoles', 'Nintendo', 'Play anytime, anywhere', '7-inch OLED screen', 'Wide adjustable stand', 'Wired LAN port - Enhanced audio', '79900', '110000'),
(13, '10', 'Asus ROG Ally RC71L-NH019W (2023) Handheld Gaming PC', '5', 2147483647, 'The ROG Ally is a truly next-gen handheld, offering Full HD (FHD) gaming on the go, and able to run even modern AAA titles faster and smoother than any other handheld on the market.\r\n\r\n', '1-czone.com.pk-1540-16805-210824084729.jpg', 'Gaming Consoles', 'Asus', 'AMD Ryzen™ Z1 Processor | Windows 11 Home', '16GB LPDDR5 on board - 512GB PCIe® 4.0 NVMe™ M.2 SSD', 'AMD Radeon™ Graphics | AMD RDNA™ 3, 4 CUs, upto 2.5 GHz, up to2.8 Teraflop', '7-inch, FHD (1920 x 1080) 16:9, Refresh Rate: 120Hz', '152900', '170000'),
(14, '10', 'Sony PlayStation 5 Slim Disc Edition 1TB Gaming Console - PS5 8K 4K @ 120Hz HDR - UK UAE Region CFI-2016 - New Model', '5', 2147483647, 'The PS5® console* unleashes new gaming possibilities that you never anticipated. Experience lightning-fast loading with an ultra-high speed SSD, deeper immersion with support for haptic feedback, adaptive triggers, and 3D Audio**, and an all-new gene', 'copy-1-czone.com.pk-1540-15551-041223104806.jpg', 'Gaming Consoles', 'Sony', 'Lightning speed, Breathtaking immersion, Stunning games', 'Marvel at incredible graphics and experience new PS5 features.', 'Adaptive Triggers*, Haptic Feedback*', '', '179990', '200000'),
(15, '', 'ASUS ROG Ally 7\" 120Hz FHD 1080p Gaming Handheld Console | AMD Ryzen Z1 Extreme | 512GB | White', '5', 2147483647, 'Play your way with the ROG Ally gaming handheld. Access any game that runs on Windows across all game platforms, including Steam, GOG, Xbox Game Pass, cloud gaming services, Android apps and more.\r\n\r\n', '55-czone.com.pk-1540-16074-220524091320.jpg', 'Gaming Consoles', 'Asus', 'Dolby Atmos, 1080p', 'Compatible Platform(s): Windows', '7 inches LED IPS Touch Screen', '', '185000', '');

-- --------------------------------------------------------

--
-- Table structure for table `gamingconsoles_brand`
--

CREATE TABLE `gamingconsoles_brand` (
  `id` int(11) NOT NULL,
  `gamingconsolesbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamingconsoles_brand`
--

INSERT INTO `gamingconsoles_brand` (`id`, `gamingconsolesbrand`, `created_at`) VALUES
(4, 'Asus', '2025-05-02 08:06:11'),
(5, 'Microsoft', '2025-05-02 08:06:14'),
(6, 'Nintendo', '2025-05-02 08:06:18'),
(7, 'Sony', '2025-05-02 08:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `gamingconsoles_store`
--

CREATE TABLE `gamingconsoles_store` (
  `id` int(11) NOT NULL,
  `gamingconsolesstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamingconsoles_store`
--

INSERT INTO `gamingconsoles_store` (`id`, `gamingconsolesstore`, `created_at`) VALUES
(4, 'Controllers', '2025-05-02 08:06:03'),
(5, 'Gaming Consoles', '2025-05-02 08:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `gamingproducts`
--

CREATE TABLE `gamingproducts` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamingproducts`
--

INSERT INTO `gamingproducts` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'MXG LH-01 Universal Laptop Holder for Monitor Arms', '3', 1202111024, 'Good Ventilation: open design offers increased air circulation – working as a heat sink\r\n\r\n', '17-czone.com.pk-1540-17069-111024070455.jpg', 'Monitor Mounts', 'MXG', 'Width Adjustment: fits a variety of appliance/device sizes and shapes', 'VESA Compatible: supports mounted on panel with standard VESA holes', 'Material: Steel, Plastic', 'Safety Ledge Stopper: prevents your devices from slipping', '2200', ''),
(3, '', 'Logitech F310 Gamepad - Console Style - 940-000112', '3', 2147483647, 'Four-switch D-pad for precise control and familiar console layout. Plug-and-play on PC.\r\n\r\n', '52-czone.com.pk-1540-324-110622104109.jpg', 'Game Pads', 'Logitech', 'Steam big picture', 'Exclusive 4-switch d-pad', 'Familiar console-like layout', 'Works with android tv', '5650', ''),
(4, '', 'Razer PBT Keycap Upgrade Set Backlight Compatible - Mercury White - RC21-01490200', '4', 2147483647, 'It’s time to get tough and secure your keys to victory with the Razer PBT Keycap Upgrade Set. Designed to endure the most intense gaming, these Doubleshot PBT keycaps aren’t here to win one battle—they’re here to win the war.\r\n\r\n', '9-czone.com.pk-1540-12622-211221075611.jpg', 'Keycaps and Accessories', 'Razer', 'Superior PBT Material', 'Doubleshot Molding With Ultra-Thin Font', 'Works With Popular Keyboard Layouts', 'Doubleshot Durability', '7500', ''),
(5, '', 'MXG EMA-12 Economical Mechanical Spring Monitor Arm', '4', 2147483647, 'The EMA-12 is an economical monitor arm model with great performance and quality.\r\n\r\n', 'czone.com.pk-1-1540-18007-140325095506.jpg', 'Monitor Mounts', 'MXG', 'Keyhole Pattern: allows for easy installation', 'Built-in Cable Management: for an organized and neat workspace', 'Swivel Ability: for multiple screen viewing angles', 'Built-in Spring Tension Mechanism: for perfect weight adjustments', '7500', ''),
(6, '', 'Twisted Minds Single Monitor Pipe Shaped Counterbalance Spring Assisted Monitor Arm TM-71-C06', '4', 2147483647, 'Pipe-shaped single monitor arm with a counterbalance spring.\r\n\r\n', '11-czone.com.pk-1540-15716-120224080610.jpg', 'Monitor Mounts', 'Twisted Minds', 'Material: Aluminium, Plastic,Steel', 'Designed for screen sizes ranging from 17\" to 32\"', 'Weight Capacity per screen: 0 to 8kg', 'Allows effortless positioning and alignment of the monitor', '7990', ''),
(7, '', 'Twisted Minds Single Monitor Pipe Shaped Counterbalance Spring Assisted Monitor Arm TM-71-C06', '4', 2147483647, 'Pipe-shaped single monitor arm with a counterbalance spring.\r\n\r\n', '11-czone.com.pk-1540-15716-120224080610.jpg', 'Monitor Mounts', 'Twisted Minds', 'Material: Aluminium, Plastic,Steel', 'Designed for screen sizes ranging from 17\" to 32\"', 'Weight Capacity per screen: 0 to 8kg', 'Allows effortless positioning and alignment of the monitor', '7990', ''),
(8, '', 'Twisted Minds Single Monitor Economical Spring-Assisted Monitor Arm TM-63-C06', '4', 2147483647, 'Features a spring-assisted mechanism\r\n\r\n', 'czone.com.pk-19-1540-18133-110425103115.jpg', 'Monitor Mounts', 'Twisted Minds', 'Designed for screen sizes ranging from 17\" to 32“', 'Single Monitor Economical Spring-Assisted Monitor Arm', 'Weight Capacity per screen: 2 to 9kg', 'Designed to hold a single monitor', '9000', ''),
(9, '', 'Logitech Extreme 3D Pro Joystick | 942-000031', '5', 2147483647, 'It’s all in the wrist. Research has shown that advanced flying comes down to instincts and reaction time. To assist pilots, our lab boys designed a custom twist-handle rudder for Extreme 3D Pro, resulting in natural one-handed control with a smaller ', '14-czone.com.pk-1540-1564-150624121453.jpg', 'Driving Wheels | Flight Control Joystick', 'Logitech', '12 Programmable Buttons*', '8-Way Hat Switch', 'Rapid-Fire Trigger', 'Comfortable Hand Grip', '12990', ''),
(10, '', 'Kaloc DS110 Single Monitor Desk Mount', '5', 1200080823, 'The DS110 is a modern, lightweight yet durable monitor mount built with the latest technology that is capable of holding up to 9kg/19.8lbs of monitor panel. The sophisticated black color easily blends into a wide variety of working environments or in', '2-czone.com.pk-1540-14987-080823070615.jpg', 'Monitor Mounts', 'Kaloc', 'Recommended Screen Size: 17” – 35”', 'VESA 75x75/100x100mm', 'Multiple movement for maximum ergonomic setup', 'Support monitors’ weight from 3-10kg', '14500', '');

-- --------------------------------------------------------

--
-- Table structure for table `gamingproducts_brand`
--

CREATE TABLE `gamingproducts_brand` (
  `id` int(11) NOT NULL,
  `gamingproductsbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamingproducts_brand`
--

INSERT INTO `gamingproducts_brand` (`id`, `gamingproductsbrand`, `created_at`) VALUES
(3, 'Kaloc', '2025-05-02 08:49:21'),
(4, 'Logitech', '2025-05-02 08:49:24'),
(5, 'Twisted Minds', '2025-05-02 08:49:40'),
(6, 'Razer', '2025-05-02 08:49:43'),
(7, 'MXG', '2025-05-02 08:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `gamingproducts_store`
--

CREATE TABLE `gamingproducts_store` (
  `id` int(11) NOT NULL,
  `gamingproductsstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gamingproducts_store`
--

INSERT INTO `gamingproducts_store` (`id`, `gamingproductsstore`, `created_at`) VALUES
(3, 'Game Pads', '2025-05-02 08:49:05'),
(4, 'Driving Wheels | Flight Control Joystick', '2025-05-02 08:49:10'),
(5, 'Keycaps and Accessories', '2025-05-02 08:49:14'),
(6, 'Monitor Mounts', '2025-05-02 08:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `gpu`
--

CREATE TABLE `gpu` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `codee` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `gpu_name` varchar(255) DEFAULT NULL,
  `chip_set` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `old_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gpu`
--

INSERT INTO `gpu` (`id`, `offer`, `name`, `review`, `codee`, `description`, `image`, `gpu_name`, `chip_set`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(7, '', 'MSI GeForce GT 730 4GB Video Graphics Card | N730-4GD3V2 - 4GB DDR3 128 bits', '3', 2147483647, 'NVIDIA GeForce GT 730 GPU\r\n\r\n', '11-czone.com.pk-1540-17456-061224102717.jpg', 'Nvidia GeForce', 'GeForce GT 730', 'NVIDIA GeForce® GT 730 PCI Express 2.0', '700 Core Clocks', '4GB DDR3 128 bits', 'Dual-link DVI-I x 1 HDMI™ x 1 D-Sub x 1', '24990', '0'),
(8, '', 'MSI GeForce® GT 1030 4GD4 LP OC Video Graphics Card', '3', 2147483647, 'Lower temperature and higher efficiency.\r\n\r\nAluminium core for higher stability. Low-Profile.\r\n\r\n', '1-czone.com.pk-1540-16688-070824080333.jpg', 'Nvidia GeForce', 'GeForce GT 730', 'NVIDIA® GeForce® GT 1030', 'PCI Express 3.0 x16 (uses x4)', 'Boost: 1430 MHz, 384 Units CUDA® CORES', '4GB DDR4 64-bit', '29400', ''),
(9, '', 'ZOTAC GAMING GeForce RTX 3050 6GB GDDR6 Twin Edge OC Video Graphics Card - ZT-A30510H-10L', '4', 2147483647, 'Get Amplified with the ZOTAC GAMING GeForce RTX™ 30 Series based on the NVIDIA Ampere architecture. Built with enhanced RT Cores and Tensor Cores, streaming multiprocessors, and high-speed GDDR6 memory, the ZOTAC GAMING GeForce RTX 3050 6GB GDDR6 Twin Edg', '51-czone.com.pk-1540-17360-201124121042.jpg', 'Nvidia GeForce', 'GeForce RTX 3050', 'GeForce RTX 3050 6GB', 'CUDA cores 2304', '6GB GDDR6 96-bit', 'Boost: 1477 MHz', '63500', ''),
(10, '', 'ASUS Dual GeForce RTX™ 3050 OC Edition 6GB GDDR6 Video Graphics Card, NVIDIA Ampere Streaming Multiprocessors, PCI Express 4.0, 96-bit | DUAL-RTX3050-O6G', '4', 2147483647, 'ASUS Dual GeForce RTX™ 3050 OC Edition 6GB GDDR6 with two powerful fans AAA gaming performance and ray tracing\r\n\r\n', '57-czone.com.pk-1540-17247-041124104301.jpg', 'Nvidia GeForce', 'GeForce RTX 3050', 'CUDA Core 2304', 'OC mode : 1537 MHz (Boost Clock)', '6GB GDDR6 14 Gbps 96-bit', 'Digital Max Resolution 7680 x 4320', '72500', ''),
(11, '', 'ZOTAC GAMING GEFORCE RTX 3050 ECO 8GB GDDR6 Video Graphics Card | ZT-A30500K-10M', '4', 2147483647, 'Active Fan Control with FREEZE Fan Stop\r\n\r\nWraparound Metal Backplate\r\n\r\n', '2-czone.com.pk-1-1540-17738-300125010018.jpg', 'Nvidia GeForce', 'GeForce RTX 3050', '2nd Gen Ray Tracing Cores - 3rd Gen Tensor Cores', 'CUDA cores 2560', '8GB GDDR6 128-bit', 'Boost: 1777 MHz', '74990', ''),
(12, '', 'ZOTAC GAMING GeForce RTX 4060 8GB Twin Edge Video Graphics Card ZT-D40600E-10M', '5', 2147483647, 'The ZOTAC GAMING GeForce RTX 4060 8GB Twin Edge is a compact and capable graphics card, featuring the NVIDIA Ada Lovelace architecture and an aerodynamic-inspired design. With a reduced 2-slot size, it\'s an excellent choice for those who want to build an ', '7-czone.com.pk-1-1540-15343-111023080631.jpg', 'Nvidia GeForce', 'GeForce RTX 4060', '3072 CUDA cores', 'Boost: 2460 MHz Engine Clock', '8GB GDDR6 128-bit 17 Gbps Memory', 'Freeze Fan Stop - Metal Backplate', '94990', ''),
(13, '10', 'MAXSUN Intel Arc B580 iCraft 12G Video Graphics Card | 12GB | ARGB Lighting', '5', 2147483647, 'Intel Arc B580 GPU with PCIe 4.0 for fast, responsive gameplay.\r\n\r\n', '7-czone.com.pk-1540-17864-220225084923.jpg', 'Intel ARC', 'Intel ARC B580', 'Xe-cores 20', 'Graphics Clock Boost 2850 MHz', '12GB 192-bit 19 Gbps GDDR6', 'PCIe 4.0 x8', '98990', '110000'),
(14, '4', 'MSI GeForce RTX™ 3060 VENTUS 2X 12G OC Graphics Card 12GB GDDR6 192-bit', '4', 2147483647, 'VENTUS brings a performance-focused design that maintains the essentials to accomplish any task at hand. Rocking a trusted dual-fan arrangement laid into a rigid industrial design lets this sharp-looking graphics card fit into any build.\r\n\r\n', '16-czone.com.pk-1540-12831-250122082030.jpg', 'Nvidia GeForce', 'GeForce RTX 3060', 'Cores 3584', 'Boost: 1807 MHz', '12GB GDDR6 192-bit 15 Gbps', 'PCI Express® Gen 4', '100490', '105000'),
(15, '', 'ZOTAC GAMING GeForce RTX 4060 Ti 8GB Twin Edge Video Graphics Card ZT-D40610E-10M', '5', 2147483647, 'The ZOTAC GAMING GeForce RTX 4060 Ti 8GB Twin Edge is a compact and powerful graphics card, featuring the NVIDIA Ada Lovelace architecture and an aerodynamic-inspired design. With a reduced 2.2 slot size, it\'s an excellent choice for those who want to bui', '15-czone.com.pk-1540-14880-110723084501.jpg', 'Nvidia GeForce', 'GeForce RTX 4060 Ti', 'CUDA cores 4352', 'Engine Clock Boost: 2535MHz', '8GB GDDR6 128-bit', 'PCI Express 4.0 x8', '127990', ''),
(16, '0', 'ZOTAC GAMING GeForce RTX 4060 Ti 16GB Twin Edge Video Graphics Card ZT-D40620E-10M', '4', 522181024, 'Powered by NVIDIA DLSS 3, ultra-efficient Ada Lovelace arch, and full ray tracing. IceStorm 2.0 Advanced Cooling.\r\n\r\n', '1-czone.com.pk-1540-17125-191024085119.jpg', 'Nvidia GeForce', 'GeForce RTX 4060 Ti', 'CUDA cores 4352, GeForce RTX 4060Ti', '16GB GDDR6 128-bit 18 Gbps', 'IceStorm 2.0 Cooling', 'Engine Clock Boost: 2535MHz', '149990', '150000'),
(17, '0', 'ZOTAC GAMING GeForce RTX 4060 Ti 16GB Twin Edge Video Graphics Card ZT-D40620E-10M', '4', 353080724, 'Powered by NVIDIA DLSS 3, ultra-efficient Ada Lovelace arch, and full ray tracing. IceStorm 2.0 Advanced Cooling.\r\n\r\n', '1-czone.com.pk-1540-17125-191024085119.jpg', 'Nvidia GeForce', 'GeForce RTX 4060 Ti', 'CUDA cores 4352, GeForce RTX 4060Ti', '16GB GDDR6 128-bit 18 Gbps', 'IceStorm 2.0 Cooling', 'Engine Clock Boost: 2535MHz', '149990', '150000'),
(18, '0', 'ZOTAC GAMING GeForce RTX 4060 Ti 16GB Twin Edge Video Graphics Card ZT-D40620E-10M', '4', 2147483647, 'Powered by NVIDIA DLSS 3, ultra-efficient Ada Lovelace arch, and full ray tracing. IceStorm 2.0 Advanced Cooling.\r\n\r\n', '1-czone.com.pk-1540-17125-191024085119.jpg', 'Nvidia GeForce', 'GeForce RTX 4060 Ti', 'CUDA cores 4352, GeForce RTX 4060Ti', '16GB GDDR6 128-bit 18 Gbps', 'IceStorm 2.0 Cooling', 'Engine Clock Boost: 2535MHz', '149990', '150000'),
(19, '', 'Gigabyte GeForce RTX 5070Ti GAMING OC 16G Video Graphics Card, 16GB GDDR7', '3', 245260124, 'Powered by the NVIDIA Blackwell architecture and DLSS 4\r\n\r\n', '12-czone.com.pk-1540-17936-030325083028.jpg', 'Nvidia GeForce', 'GeForce RTX 5070 Ti', '2588 MHz (Reference: 2452 MHz)', 'CUDA® Cores 8960', '16GB GDDR7 256 bit', 'PCI-E 5.0', '419990', ''),
(20, '', 'ZOTAC Gaming GeForce RTX 5070 Solid OC DLSS 4 12GB GDDR7 192-bit PCIE 5.0 Gaming Graphics Card ZT-B50700J-10P', '5', 2147483647, 'Powered by the NVIDIA Blackwell architecture and DLSS 4\r\n\r\n', 'czone.com.pk-3-1540-18013-180325103018.jpg', 'Nvidia GeForce', 'GeForce RTX 5070', 'CUDA cores 6144', 'Video Memory 12GB GDDR7 192-bit', 'Engine Clock 2542 MHz', 'PCI Express PCI Express 5.0 x16', '259990', ''),
(21, '', 'MSI GeForce RTX 5080 16G SUPRIM SOC Video Graphics Card, 16GB GDDR7', '5', 2147483647, 'Unleash extraordinary performance with the MSI SUPRIM graphics card—crafted with premium design and materials.\r\n\r\n', '2-czone.com.pk-1540-17934-030325082304.jpg', 'Nvidia GeForce', 'GeForce RTX 5080', 'PCI Express® Gen 5 x16', 'Extreme Performance: 2760 MHz (MSI Center)', 'CUDA® CORES 10752 Units', '16GB GDDR7 256-bit', '579990', '');

-- --------------------------------------------------------

--
-- Table structure for table `graphictablets`
--

CREATE TABLE `graphictablets` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `graphictablets`
--

INSERT INTO `graphictablets` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Wacom Pen 4K Stylus LP1100K', '5', 2147483647, 'The Wacom Pen 4K Stylus is designed for use with select small and medium Wacom Intuos Creative Pen tablets. It\'s cordless, battery-free, and features 4096 levels of pressure sensitivity.\r\n\r\n', '33-czone.com.pk-1540-9998-050823091454.jpg', 'Stylus Pens', 'Wacom', 'Compatible with Select Intuos Tablets', '4096 Levels of Pressure Sensitivity', 'Battery-Free', 'Programmable Side Switch', '11990', ''),
(4, '', 'One by Wacom CTL-472/K0-C Small Creative Pen Tablet Black | Red', '3', 2147483647, 'One by Wacom CTL-472. You and your computer are in creative harmony. Sketch, draw and edit photos with a simply natural pen experience. It couldn’t be easier.\r\n\r\n', 'copy-51yyjtywvel.-ac-sl1000--1540-9038-241219105649.jpg', 'Wacom Intuos | One', 'Wacom', 'Precise pen tablet', 'Usb connection', 'Size: S (small)', 'Colour: Black', '19990', ''),
(5, '', 'One by Wacom Medium Creative Pen Graphics Tablet - CTL-672 - Black / Red, USB', '4', 2147483647, 'From learning to draw and edit photos to collaborating in online classes or completing academic assignments with natural handwriting, One by Wacom brings an easy-to-use digital pen to PC, Macs and most Chromebooks. Digital learning and creativity cou', 'copy-copy-copy-copy-51yyjtywvel.-ac-sl1000--1540-9038-241219105649.jpg', 'Wacom Intuos | One', 'Wacom', 'Work surface 216 x 135 mm', '277 x 189 x 8.7 mm / 10.9 x 7.4 x 0.3 in', 'Battery-free pen - Ergonomics: Right or Left-handed use', 'Resolution 2540 lpi | Pen pressure levels 2048', '32900', ''),
(6, '', 'Wacom Intuos Pro Medium PTH-860-K1-CX – 8×13 Inch, Digital Graphic Drawing Tablet', '5', 2147483647, 'New pen technology supports 8192 levels of pressure sensitivity, tilt-response and virtually lag-free tracking.Wacom Intuos Pro is our finest creative pen tablet to date, redefining the professional standard in creative pen tablets\r\n\r\n', 'wacom-intuos-pro-pen-tablet-large-pth-860-k0-c-myhotdeal-170-1540-6132-291217015451.jpg', 'Wacom Intuos | One', 'Wacom', 'Directly digital, better than ever', '430 x 287 x 8mm / 16.8 x 11.2 x 0.3 in', 'Wacom Pro Pen 2', '8192 Pen Pressure levels', '145000', '');

-- --------------------------------------------------------

--
-- Table structure for table `graphictablets_brand`
--

CREATE TABLE `graphictablets_brand` (
  `id` int(11) NOT NULL,
  `graphictabletsbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `graphictablets_brand`
--

INSERT INTO `graphictablets_brand` (`id`, `graphictabletsbrand`, `created_at`) VALUES
(4, 'Wacom', '2025-05-04 11:29:28');

-- --------------------------------------------------------

--
-- Table structure for table `graphictablets_store`
--

CREATE TABLE `graphictablets_store` (
  `id` int(11) NOT NULL,
  `graphictabletsstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `graphictablets_store`
--

INSERT INTO `graphictablets_store` (`id`, `graphictabletsstore`, `created_at`) VALUES
(4, 'Stylus Pens', '2025-05-04 11:29:18'),
(5, 'Wacom Intuos | One', '2025-05-04 11:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `graphic_card`
--

CREATE TABLE `graphic_card` (
  `gpu_id` int(11) NOT NULL,
  `gpu_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `graphic_card`
--

INSERT INTO `graphic_card` (`gpu_id`, `gpu_name`) VALUES
(11, 'Nvidia GeForce'),
(12, 'Intel ARC');

-- --------------------------------------------------------

--
-- Table structure for table `hdd`
--

CREATE TABLE `hdd` (
  `hard_disk` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hdd`
--

INSERT INTO `hdd` (`hard_disk`, `created_at`) VALUES
('Desktop SATA Hard Drives', '2025-03-22 10:11:55'),
('Enterprise Hard Drives', '2025-03-22 10:12:13'),
('External Hard Drives', '2025-03-22 10:12:00'),
('Hard Drive Arrays | NAS', '2025-03-22 10:12:18'),
('NAS Drives', '2025-03-22 10:12:08'),
('Surveillance HDD\'s', '2025-03-24 12:16:53');

-- --------------------------------------------------------

--
-- Table structure for table `hdd_data`
--

CREATE TABLE `hdd_data` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `hd` varchar(255) DEFAULT NULL,
  `store` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hdd_data`
--

INSERT INTO `hdd_data` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `hd`, `store`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'ADATA HV320 1TB Black External Hard Drive AHV320-1TU31-CBK', '3', 2147483647, 'What’s both big and small, and keeps your data secure? Introducing the ADATA HV320 external HDD with up to 5TB of capacity, a slender 10.7mm* form factor, shock sensors, and E2E (End-to-End) Data Protection.\r\n\r\n', 'd.webp', 'External Hard Drives', '1TB', 'Very Slim. Your Data Is Safe with AES Encryption.', 'Eye-Catching Design', 'Plenty of Storage Space', 'Shock Sensors', 15690.00, 0.00),
(3, '11', 'ADATA HD710M Pro External Hard Drive 1TB', '3', 2147483647, 'Camouflage, Heavily Armed and Undefeated Strong\r\n\r\n', 'copy-1-czone.com.pk-1-1540-17700-210125111000.jpg', 'External Hard Drives', '1TB', 'Military - Grade Anti - Shock Technology', 'Ingress Protection Beyond IP68', 'Huge Capacity for Huge Convenience', 'User-Friendly Waterproof Covering', 15990.00, 18000.00),
(4, '', 'ADATA HD650 1TB Blue External Hard Drive AHD650-1TU31-CBL', '3', 2147483647, 'HD650 External Hard Drive\r\n\r\n', '1-czone.com.pk-1540-9765-010323070241.jpg', 'External Hard Drives', '1TB', 'Designed to Absorb the Hardest Knocks', 'Bigger capacity handles more storage needs', 'Dazzling Blue LED Indicator', 'Surface Protected', 15990.00, 0.00),
(5, '', 'Seagate Expansion Portable 1TB External Hard Drive USB 3.0 For Mac and PC STKM1000400', '3', 2147483647, 'Sleek and simple portable drive design for taking photos, movies, music, and more on the go.\r\n\r\n', '11-czone.com.pk-1540-12537-061222080843.jpg', 'External Hard Drives', '1TB', 'Drag-and-drop file saving', 'USB 3.0 powered', 'Automatic recognition of Windows and Mac computers for simple setup*', 'Rescue Data Recovery Services', 15990.00, 0.00),
(12, '', 'WD My Passport 1TB External USB 3.0 Portable Hard Drive - Black - WDBYVG0010BBK', '3', 2147483647, 'My Passport drive is trusted, portable storage that gives you the confidence and freedom to drive forward in life.\r\n\r\n', '10-czone.com.pk-1540-9309-061222080639.jpg', 'External Hard Drives', '1TB', 'Every journey needs a passport.', 'New Slim style', 'Equipped with WD Backup™ software', 'Secure with My Passport password protection', 16990.00, 0.00),
(13, '', 'Seagate Expansion 2TB Portable External USB 3.0 HDD STKM2000400, Portable Hard Drive', '3', 2147483647, 'Built with a compact form factor and ready for on-the-go usage, the 2TB Expansion Portable USB 3.0 External Hard Drive from Seagate is preformatted exFAT, meaning it is compatible with Windows and Mac right out of the box.\r\n\r\n', '11-czone.com.pk-1540-12537-061222080843.jpg', 'External Hard Drives', '2TB', '2TB Storage Capacity', 'Micro-USB 3.0 Interface', 'Bus Powered', 'Rescue Data Recovery Services', 19990.00, 0.00),
(14, '', 'WD - My Passport 2TB External USB 3.0 Portable Hard Drive - Black', '3', 2147483647, 'My Passport drive is trusted, portable storage that gives you the confidence and freedom to drive forward in life.\r\n\r\n', '10-czone.com.pk-1540-9309-061222080639.jpg', 'External Hard Drives', '2TB', 'Every journey needs a passport.', 'New Slim style', 'Equipped with WD Backup™ software', 'Secure with My Passport password protection', 20500.00, 0.00),
(15, '', 'Seagate One Touch With Password 1TB External Portable Hard Drive | STKB1000400 - Black', '3', 2147483647, 'We can all use some extra space. To store our digital content, that is. That’s why we designed the One Touch family of HDDs and SSDs — premium, high-capacity, portable storage to help you manage your digital world with ease and confidence.\r\n\r\n', '22-czone.com.pk-1540-15588-141223113228.jpg', 'External Hard Drives', '1TB', 'With Rescue Data Recovery Services', 'Textured metal finish fits in with modern lifestyle elements', 'Bus Powered', 'Formatted exFAT for Windows & Mac', 20900.00, 0.00),
(16, '', 'Seagate Barracuda ST2000DM008 2TB 3.5\" Internal Hard Drive - SATA', '3', 246210923, 'Seagate brings over 20 years of trusted performance and reliability to the Seagate® BarraCuda® 3.5-inch HDD.\r\n\r\n', 'czone41owd2xn5ol.jpg-1540-7740-140319072359.jpg', 'Desktop SATA Hard Drives', '2TB', 'SATA 6Gb/s', '220MB/s Max. Sustained Transfer Rate OD (MB/s)', '256 Cache, Multisegmented (MB)', '300,000 Load/Unload Cycles', 21200.00, 0.00),
(17, '', 'Seagate One Touch 2TB External Portable Hard Drive | STKB2000400', '3', 2147483647, 'We can all use some extra space. To store our digital content, that is. That’s why we designed the One Touch family of HDDs and SSDs — premium, high-capacity, portable storage to help you manage your digital world with ease and confidence.\r\n\r\n', '22-czone.com.pk-1540-15588-141223113228.jpg', 'External Hard Drives', '2TB', 'With Rescue Data Recovery Services', 'USB 3.2 Gen 1 (USB 3.0) Interface', 'Bus Powered', 'Formatted exFAT for Windows & Mac', 27900.00, 0.00),
(18, '', 'WD My Passport 4TB External USB 3.0 Portable Hard Drive - Red', '4', 2147483647, 'The My Passport drive comes equipped with backup software(2) to help make sure everything you create while on your own life journey - photos, videos, music and documents - doesn’t get lost. You can set it to run automatically to your schedule.\r\n\r\n', '1-czone.com.pk-1540-15124-310823090159.jpg', 'Enterprise Hard Drives', '4TB', 'Every journey needs a passport.', 'New Slim style', 'Equipped with WD Backup™ software', 'Secure with My Passport password protection', 30990.00, 0.00),
(19, '', 'Seagate Expansion 4TB Portable USB 3.0 External Hard Drive | STKM4000400', '4', 2147483647, 'Built with a compact form factor and ready for on-the-go usage, the 4TB Expansion Portable USB 3.0 External Hard Drive from Seagate is preformatted exFAT, meaning it is compatible with Windows and Mac right out of the box.\r\n\r\n', '11-czone.com.pk-1540-12537-061222080843.jpg', 'External Hard Drives', '4TB', '4TB Storage Capacity', 'Micro-USB 3.0 Interface', 'Bus Powered', 'Rescue Data Recovery Services', 30990.00, 0.00),
(20, '', 'WD - My Passport 4TB External USB 3.0 Portable Hard Drive - Black - WDBPKJ0040BBK', '4', 2147483647, 'My Passport drive is trusted, portable storage that gives you the confidence and freedom to drive forward in life.\r\n\r\n', '10-czone.com.pk-1540-9309-061222080639.jpg', 'External Hard Drives', '4TB', 'Every journey needs a passport.', 'New Slim style', 'Equipped with WD Backup™ software', 'Secure with My Passport password protection', 31500.00, 0.00),
(21, '', 'ADATA HD650 4TB External Hard Drive - AHD650-4TU31-CBK - Surface Protected - Black', '4', 2147483647, 'The ADATA HD650 External Hard Drive is back stronger and bigger than before. Its impact-absorbing rubber coating and three-layer construction make it extremely durable to protect your contents, all while looking cool.\r\n\r\n', '5-czone.com.pk-1540-13887-151022071353.jpg', 'External Hard Drives', '4TB', 'Designed to Absorb the Hardest Knocks', 'Bigger capacity handles more storage needs', 'Dazzling Blue LED Indicator', 'Surface Protected', 32500.00, 0.00),
(22, '9', 'Seagate 4TB IronWolf NAS ST4000VN006 SATA 6Gb/s 3.5\" Internal Hard Drive 256MB Cache', '4', 215220124, 'Ironwolf internal Hard drives are the ideal solution for up to 8-Bay, multi-user NAS environments craving powerhouse performance. IronWolf Drives Are Right for Home, SOHO, and Small- to Medium-Sized Business.\r\n\r\n', '1-czone.com.pk-1540-4575-170423070254.jpg', 'NAS Drives', '4TB', 'Optimized for NAS with AgileArray', '5400-RPM Performance Delivered - 256MB Cache', 'Drive Health Monitoring', 'NAS-vendor Approved', 34500.00, 37900.00),
(23, '', 'WD My Passport 5TB External USB 3.0 Portable Hard Drive - Black | WDBPKJ0050BBK', '3', 2147483647, 'My Passport drive is trusted, portable storage that gives you the confidence and freedom to drive forward in life.\r\n\r\n', '10-czone.com.pk-1540-8929-061222080549.jpg', 'External Hard Drives', '5TB', 'Every journey needs a passport.', 'New Slim style', 'Equipped with WD Backup™ software', 'Secure with My Passport password protection', 35990.00, 0.00),
(24, '', 'Seagate One Touch 5TB External Hard Drive | STKZ5000400 Black - With Password', '4', 2147483647, 'We can all use some extra space. To store our digital content, that is. That’s why we designed the One Touch family of HDDs and SSDs — premium, high-capacity, portable storage to help you manage your digital world with ease and confidence.\r\n\r\n', '22-czone.com.pk-1540-15588-141223113228.jpg', 'External Hard Drives', '5TB', 'With Rescue Data Recovery Services', 'Micro-USB 3.2 Gen 1 Interface', 'Bus Powered', 'Password Activated Hardware Encryption', 36990.00, 0.00),
(25, '', 'My Book from WD 4TB WDBBGB0040HBK-EESN Black Desktop External Hard Drive', '4', 2147483647, 'Compact outside. Powerful inside. Store massive amounts of photos, videos, music, and documents with My Book desktop storage. Complete Backup: Equipped with WD Backup software for Windows and Apple Time Machine compatibility for Mac, the My Book desktop h', 'my-book-new-left.png.thumb.1280.1280-1540-10561-241120091104.jpg', 'External Hard Drives', '4TB', 'Complete Backup', 'Password Protection', 'WD Reliability', 'Watch the Power of My Book Come to Life', 39990.00, 0.00),
(26, '', 'WD My Passport 6TB External Portable Hard Drive - Black', '4', 2147483647, 'My Passport drive is trusted, portable storage that gives you the confidence and freedom to drive forward in life.\r\n\r\n', '10-czone.com.pk-1540-9309-061222080639.jpg', 'External Hard Drives', '6TB', 'Every journey needs a passport.', 'New Slim style', 'Equipped with WD Backup™ software', 'Secure with My Passport password protection', 49990.00, 0.00),
(27, '', 'Seagate IronWolf ST6000VN0033 6TB SATA 6.0Gb/s 3.5\" Internal NAS Hard Drive', '4', 0, 'For everything NAS, there’s IronWolf and IronWolf Pro. Always on and always working, IronWolf is enhanced with AgileArray technology for optimal reliability and system agility. Multi-user technology and extreme workload rates allow IronWolf to perform and', '91rriuvjtml.-sl1500--1540-6676-190618094007.jpg', 'NAS Drives', '6TB', '7200 RPM 256MB Cache', 'SATA 6.0Gb/s', 'For NAS systems', '', 58990.00, 0.00),
(28, '', 'WD My Book 8TB Desktop External Hard Drive WDBBGB0080HBK-EESN', '4', 2147483647, 'Compact outside. Powerful inside. Store massive amounts of photos, videos, music and documents with My Book desktop storage.\r\n\r\n', '71etw--2wyl.-ac-sl1500--1540-7568-170125063548.jpg', 'External Hard Drives', '8TB', 'Auto backup with included WD Backup software and Time Machine compatibility', 'Password protection with hardware encryption', 'Reimagined design.Trusted drive built with WD reliability', 'USB 3.0 port; USB 2.0 compatible', 59990.00, 0.00),
(29, '', 'Seagate Exos 7E10 Enterprise Hard Drive 8TB 512e 4KN (FastFormatTM) SATA ST8000NM017B', '4', 2147483647, 'Purpose-built for bulk data applications and workloads.\r\n\r\n', '1-czone.com.pk-1540-17687-180125070930.jpg', 'Enterprise Hard Drives', '8TB', 'Trusted. Efficient. Versatile.', 'Optimised for Enterprise Workloads', 'Robust 24×7 Performance', 'Cost-Effective Footprint', 63000.00, 0.00),
(30, '', 'Transcend StoreJet 35T3 8TB External Hard Drive (TS8TSJ35T3)', '4', 0, 'The StoreJet 35T3 not only supports the next-generation USB 3.1 Gen 1 standard that boosts data transfer rates, but also offers enormous storage space for a seemingly endless amount of large files.\r\n\r\n', '2-czone.com.pk-1540-6326-031224115707.jpg', 'External Hard Drives', '8TB', 'USB 3.1 Gen 1 interface', 'Slim vertically-oriented design saves desk space', 'Fanless low-noise operation', 'One Touch auto-backup button*', 66500.00, 0.00),
(31, '', 'QNAP TR-002 2 Bay USB Type-C Direct Attached Storage (DAS) with Hardware RAID (Diskless)', '5', 2147483647, 'High-speed direct-attached storage Device via USB Type-C for Windows, macOS and Linux\r\n\r\n', '8-czone.com.pk-1540-17691-180125092022.jpg', 'Hard Drive Arrays | NAS', 'Cloud | Diskless', 'USB 3.2 Gen 2 (10Gbps)', 'Supports SATA drives', 'Disk mode DIP switch', 'Lockable drive trays', 67900.00, 0.00),
(32, '', 'WD My Cloud EX2 Ultra 2-Bay Personal Cloud Storage Server (Diskless) NAS', '4', 2147483647, 'Keep your media safe in a single place on this high-performance Network Attached Storage (NAS) device, and access and stream it from anywhere with an internet connection.', 'mycloud-ex2-ultra-front.webp', 'Hard Drive Arrays | NAS', 'Cloud | Diskless', 'Centralized Network Storage', 'Access from Anywhere', 'Robust Data Protection', 'Powered By My Cloud OS 3', 70000.00, 0.00),
(33, '', 'Seagate 8TB IronWolf NAS SATA 6Gb/s 3.5-Inch Internal Hard Drive', '4', 2147483647, 'Optimized for NAS enclosures with AgileArray\r\n\r\n', 'st8000vn004-1540-8596-240919084015.jpg', 'NAS Drives', '8TB', 'NCQ 256MB Cache', 'Multi-User technology for increased user workload rate', '24×7 always on, always accessible with NAS enclosures', 'Do more with up to 8TB of storage', 76500.00, 0.00),
(34, '', 'Seagate 10TB IronWolf NAS SATA 6Gb/s 3.5-Inch Internal Hard Drive (ST10000VN0008)', '4', 0, 'Optimized for NAS enclosures with AgileArray\r\n\r\n', '1-czone.com.pk-1540-14030-161122090623.jpg', 'NAS Drives', '10TB', '10TB Storage Capacity', '3.5\" Form Factor', 'SATA III 6 Gb/s Interface', '256MB Cache', 78000.00, 0.00),
(35, '', 'Seagate Exos 7E10 Enterprise Hard Drive 10TB 512e 4KN (FastFormatTM) SATA ST10000NM017B', '4', 2147483647, 'Purpose-built for bulk data applications and workloads.\r\n\r\n', '1-czone.com.pk-1540-17687-180125070930.jpg', 'Enterprise Hard Drives', '10TB', 'Trusted. Efficient. Versatile.', 'Optimised for Enterprise Workloads', 'Robust 24×7 Performance', 'Cost-Effective Footprint', 85000.00, 0.00),
(36, '', 'Seagate One Touch Hub 10TB Desktop External Drive with Built-In Hub (Black) STLC10000400', '4', 0, 'Let’s face it, life’s busy. And backing up digital memories is always on the to-do list. Check it off — with One Touch Hub. Password-protected storage with a front-facing USB-C and USB 3.0 port lets you quickly backup files AND charge multiple devices sim', '7-czone.com.pk-1540-14834-220623084456.jpg', 'External Hard Drives', '10TB', 'USB 3.2 Type-A & Type-C Ports', 'Compatible with Windows and Mac', 'Seagate Toolkit Backup Software Included', 'Password Protection', 88000.00, 0.00),
(37, '', 'WD My Book 12TB External Desktop Hard Drive | WDBBGB0120HBK', '4', 0, 'Compact outside. Powerful inside. Store massive amounts of photos, videos, music, and documents with My Book desktop storage.\r\n\r\n', 'copy-2-czone.com.pk-1540-12256-071021064838.jpg', 'External Hard Drives', '12TB', 'Equipped with WD Backup software', 'Password Protection', 'USB 3.0 Interface', '256-Bit AES Hardware Encryption', 88900.00, 0.00),
(38, '', 'WD My Book 14TB Desktop External Hard Drive with Password Protection and Backup Software', '4', 2147483647, 'The My Book® drive is your dependable desktop storage companion, dedicated to protecting your entire digital world.\r\n\r\n', '71mqwzkjqvl.-ac-sl1500--1540-17668-170125064311.jpg', 'Enterprise Hard Drives', '14TB', 'USB 3.2 Gen 1', 'Back up smarter with included device management software', 'Versatile and easy-to-use', 'Archiving that’s simple. Protect against ransomware', 103000.00, 0.00),
(40, '', 'QNAP TR-004 4 Bay USB Type-C Direct Attached Storage with Hardware RAID Diskless', '4', 2147483647, 'USB 3.2 Gen 1 Type-C port* for faster data transfer.\r\n\r\n', '12-czone.com.pk-1540-17692-180125092326.jpg', 'Hard Drive Arrays | NAS', 'Cloud | Diskless', 'USB 3.2 Gen 1 (5Gbps)', 'Supports SATA drives', 'Disk mode DIP switch', 'Lockable drive trays', 105500.00, 0.00),
(43, '', 'WD My Book 16TB External Desktop Hard Drive', '4', 2147483647, 'Compact outside. Powerful inside. Store massive amounts of photos, videos, music, and documents with My Book desktop storage.\r\n\r\n', 'copy-copy-2-czone.com.pk-1540-12256-071021064838.jpg', 'External Hard Drives', '16TB', 'Equipped with WD Backup software', 'Password Protection', 'USB 3.0 Interface', '256-Bit AES Hardware Encryption', 114000.00, 0.00),
(44, '', 'Seagate Exos X20 20TB SATA 6 Gb/s Standard Enterprise Hard Drive | ST20000NM007D', '4', 2147483647, 'Delivering maximum storage capacity with the highest rack-space efficiency.\r\n\r\n', '2-czone.com.pk-1540-17689-180125071501.jpg', 'Enterprise Hard Drives', '20TB', 'Scalable. Responsive. Innovative.', 'Superior Reliability', 'Customisation Power Options', 'Amazing Performance', 134900.00, 0.00),
(45, '', 'WD My Book 18TB External Desktop Hard Drive', '4', 2147483647, 'Compact outside. Powerful inside. Store massive amounts of photos, videos, music, and documents with My Book desktop storage.\r\n\r\n', 'copy-copy-copy-2-czone.com.pk-1540-12256-071021064838.jpg', 'External Hard Drives', '18TB', 'Equipped with WD Backup software', 'Password Protection', 'USB 3.0 Interface', '256-Bit AES Hardware Encryption', 142000.00, 0.00),
(46, '', 'WD Red Pro NAS Hard Drive - 16TB', '4', 2147483647, 'Enterprise-class hard drives engineered to deliver high performance and reliability to commercial and enterprise NAS environments.\r\n\r\n', '7-czone.com.pk-1540-17853-200225085301.jpg', 'NAS Drives', '16TB', 'Optimized for NAS with NASware™', 'Designed for Continuous Operation', 'Tested for Dependable Compatibility', 'Protected against Excessive Vibration', 144500.00, 0.00),
(48, '', 'Seagate 22TB Exos X22 7200 rpm SATA III 6 Gb/s 3.5\" Internal HDD', '4', 2147483647, 'ST22000NM001E\r\n\r\n', '2-czone.com.pk-1540-17758-040225073018.jpg', 'Enterprise Hard Drives', '22TB', '22TB Storage Capacity', '3.5\" Form Factor', 'SATA III 6 Gb/s Interface', '512MB Cache', 155000.00, 0.00),
(49, '', 'QNAP TS-433-4G 4 Bay NAS 2.5GbE Network Enclosure | Diskless', '4', 2147483647, 'Build a personal private cloud & home multimedia center with a built-in NPU to boost AI-powered face recognition\r\n\r\n', '8-czone.com.pk-1540-17695-200125111455.jpg', 'Hard Drive Arrays | NAS', 'Cloud | Diskless', 'Centralized multimedia management', 'AI-powered image recognition', 'Home entertainment center', 'Secure remote access', 156500.00, 0.00),
(51, '', 'Synology 4-Bay DiskStation DS423 (Diskless)', '4', 2147483647, 'Versatile data management platform for work and more.\r\n\r\n', '5-czone.com.pk-1540-15786-060324101138.jpg', 'Hard Drive Arrays | NAS', 'Cloud | Diskless', '4-Bay; 2GB DDR4', 'Secure cloud storage', 'Data sharing made easy', 'Versatile video surveillance', 159900.00, 0.00),
(52, '', 'QNAP TS-464-8G 4 Bay High-Performance Desktop NAS Enclosure | Diskless', '4', 2147483647, 'Bye-bye Gigabit NAS, hello 2.5GbE NAS.\r\n\r\n', '3-czone.com.pk-1540-17694-200125111243.jpg', 'Hard Drive Arrays | NAS', 'Cloud | Diskless', '2.5GbE is a must!', 'Quad-core for multitasking', 'Smooth video conversion', 'Upgrade to dual-port 10GbE', 225000.00, 0.00),
(53, '', 'QNAP TS-832PX 8 Bay High-Capacity NAS with 10GbE SFP+ and 2.5GbE Enclosure', '5', 2147483647, 'High-capacity NAS with 10GbE SFP+ and 2.5GbE, Supports PCIe Expansion for M.2 SSDs to Accelerate Applications\r\n\r\n', '2-czone.com.pk-1540-17693-200125110723.jpg', 'Hard Drive Arrays | NAS', 'Cloud | Diskless', 'Two 10GbE SFP+ and two 2.5GbE RJ45 network ports', 'PCIe expansion', 'Snapshots record your system status', 'Cloud storage gateways realize hybrid cloud applications', 375000.00, 0.00),
(58, '', 'Seagate Skyhawk AI 20TB Video Internal Surveillance Hard Drive HDD ST20000VE002 256MB Cache', '3', 2147483647, 'Designed for NVR (network video recorders) and AI-enabled NVR systems, the 20TB SkyHawk AI 7200 rpm SATA III 3.5\\\" Internal Surveillance HDD from Seagate is well-suited for units with 16 or more drive bays.\\r\\n\\r\\n', '1708605234-img-2193539-1540-18058-270325090409.jpg', 'Desktop SATA Hard Drives', '12TB', 'Designed for 24/7 Surveillance', '20TB Storage Capacity', '3.5\\\" Form Factor', 'SATA III 6 GB/s Interface', 137500.00, 0.00),
(59, '', 'WD My Book 14TB Desktop External Hard Drive', '3', 2147483647, 'The My Book® drive is your dependable desktop storage companion, dedicated to protecting your entire digital world.\\r\\n\\r\\n', '71mqwzkjqvl.-ac-sl1500--1540-17668-170125064311.jpg', 'External Hard Drives', '14TB', 'USB 4.6 Gen 3', 'Back up smarter with included device management software', 'Versatile and easy-to-use', 'Archiving that’s simple. Protect against ransomware', 100000.00, 0.00),
(60, '', 'Seagate 18TB HDD Exos X16 7200 RPM 512e/4Kn SATA 6Gb/s 256MB Cache 3.5-Inch Enterprise Hard Drive (ST16000NM001G)e/4Kn SATA 6Gb/s 256MB Cache 3.5-Inch Enterprise Hard Drive (ST16000NM001G)', '3', 2147483647, 'Performance-optimized hard drives for heavy application usage, support workloads of up to 550TB per year—10× that of desktop hard drives\\r\\n\\r\\n', '71mqwzkjqvl.-ac-sl1500--1540-17668-170125064311.jpg', 'Enterprise Hard Drives', '18TB', 'Bare Drive', 'SATA 6.0Gb/s 16TB', '7200 RPM 256MB', 'PowerBalance feature optimizes Watts/TB', 112000.00, 0.00),
(61, '', 'WD My Book 22TB Desktop External Hard Drive with Password Protection and Backup Software', '4', 2147483647, 'The My Book® drive is your dependable desktop storage companion, dedicated to protecting your entire digital world.\\r\\n\\r\\n', '71mqwzkjqvl.-ac-sl1500--1540-17668-170125064311.jpg', 'Enterprise Hard Drives', '22TB', 'USB 3.2 Gen 1', 'Back up smarter with included device management software', 'Versatile and easy-to-use', 'Archiving that’s simple. Protect against ransomware', 184000.00, 0.00),
(62, '', 'Seagate One Touch Hub 20TB External Hard Drive Desktop HDD | USB-C and USB 3.0 Port | Password-Protected | Windows and Mac', '4', 2147483647, 'Let’s face it, life’s busy. And backing up digital memories is always on the to-do list.\\r\\n\\r\\n', '5-czone.com.pk-1540-17863-220225065103.jpg', 'Enterprise Hard Drives', '20TB', 'Password-Protected', 'Out-of-the-box compatibility with Windows® and Mac® computers.', 'Includes Seagate® Toolkit backup software', 'Seagate One Touch Hub', 169990.00, 0.00),
(63, '', 'Seagate Skyhawk AI 20TB Video Internal Surveillance Hard Drive HDD ST20000VE002 256MB Cache', '5', 2147483647, 'Designed for NVR (network video recorders) and AI-enabled NVR systems, the 20TB SkyHawk AI 7200 rpm SATA III 3.5\\\" Internal Surveillance HDD from Seagate is well-suited for units with 16 or more drive bays.\\r\\n\\r\\n', '1708605234-img-2193539-1540-18058-270325090409.jpg', 'Surveillance HDD\'s', '20TB', 'Designed for 24/7 Surveillance', '20TB Storage Capacity', '3.5\\\" Form Factor', 'SATA III 6 GB/s Interface', 137500.00, 0.00),
(64, '', 'WD Purple Pro 12TB Surveillance Hard Drive HDD | Internal SATA, 256 MB Cache', '4', 2147483647, 'WD Purple Pro drives are designed for advanced AI-enabled recorders, video analytics servers and deep learning solutions requiring additional capacity, performance and workload capability.\\r\\n\\r\\n', 'czone.com.pk-17-1540-18039-250325095107.jpg', 'Surveillance HDD\'s', '12TB', 'SATA 6 Gb/s 3.5\\\"', '256 MB Cache', 'Purpose-built storage for your smart video solution', 'Multiple cameras, multiple streams', 96500.00, 0.00),
(65, '', 'WD Purple 8TB Surveillance Hard Drive', '3', 0, 'WD Purple drives are designed to meet the challenges of 24x7 video surveillance recording. These drives are engineered specifically for surveillance t\\r\\n\\r\\n', '35-czone.com.pk-1540-8284-230823114335.jpg', 'Surveillance HDD\'s', '8TB', 'SATA interface', 'up to 175MB/s transfer rate', 'Uncompromising Surveillance Storage', 'Industry-Leading Storage. Surveillance You Can Trust', 58500.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `headsetheadphonemic`
--

CREATE TABLE `headsetheadphonemic` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `headsetheadphonemic`
--

INSERT INTO `headsetheadphonemic` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'A4Tech HS-5P Internet Headset - 3.5mm Plug', '3', 2147483647, 'Adds balance and tone to your favourite tunes and clarity to your calls. Stunning Sound. Superior Comfort! Fully compatible with applications such as calls, Skype, Messenger and other conversations online.\r\n\r\n', '7-czone.com.pk-1540-492-131022081727.jpg', 'A4Tech | Bloody', 'A4Tech', 'Sleek Behind-the-neck Design', '3.5mm Earphone and Microphone Plug', 'Crystal Clear Chat Headset - Omnidirectional Noise-cancelling Mic', 'Tangle-free Cable - Headset Hook', '2250', ''),
(3, '', 'A4Tech HU-8 USB Stereo Headset Black', '3', 2147483647, 'The soft ear-pad covers comfortably on the ear to provide absolute sound quality as if you\'re in your own world.\r\n\r\n', '12-czone.com.pk-1540-15330-091023093920.jpg', 'A4Tech | Bloody', 'A4Tech', 'USB Digital Stereo Sound', '40mm Speaker Unit', 'Optimum Fit Headband', 'Soft Leather Ear Pads', '2550', ''),
(4, '', 'A4Tech HS-7P ComfortFit Stereo Headset - Black - 3.5mm Plug', '3', 2147483647, 'Adds balance and tone to your favourite tunes and clarity to your calls. Stunning Sound. Superior Comfort! Fully compatible with applications such as calls, Skype, Messenger and other conversations online.\r\n\r\n', '6-czone.com.pk-1540-503-131022081255.jpg', 'A4Tech | Bloody', 'A4Tech', '3.5mm Earphone and Microphone Plug', 'Crystal Clear Chat Headset', 'Omnidirectional Noise-cancelling Mic.', 'Tangle-free Cable', '2890', ''),
(5, '', 'A4tech HU-35 ComfortFit Stereo USB Headset  ', '3', 2147483647, 'An Ultra good noise-cancelling microphone reduces unwanted background noise effectively. For hours of comfortable listening. Lightweight and adjustable headband for optimum fit and long-term comfort.\r\n\r\n', 'a4-tech-hu-35-usb-black-21601902117-1540-11426-160421063050.jpg', 'A4Tech | Bloody', 'A4Tech', 'Controller: Volume knob on the headset', 'RMS: 50 mW', 'Sensitivity: 102 dB', 'MIC Sensitivity: -45 dB', '2940', ''),
(6, '', 'A4Tech HU-7P ComfortFit Stereo USB Headset', '3', 2147483647, 'Adds balance and tone to your favourite tunes and clarity to your calls. Stunning Sound. Superior Comfort! Fully compatible with applications such as calls, Skype, Messenger and other conversations online.\r\n\r\n', '2604403851569015-1540-10034-200820044853.webp', 'A4Tech | Bloody', 'A4Tech', 'Stereo Sound', 'Single-Directional Mic.', 'Volume Switch', 'Adjustable Headband', '2990', ''),
(8, '', 'Anker Soundcore R50i True Wireless Earbuds | White', '3', 2147483647, '10mm Drivers with Big Bass, Bluetooth 5.3, 30H Playtime, IPX5-Water Resistant, AI Clear Calls with 2 Mics, 22 Preset EQs via App. A3949H11.\r\n\r\n', 'czone.com.pk-20-1540-18123-100425100746.jpg', 'Anker', 'Anker', 'Big 10mm Drivers', '22 Preset EQs', '2 Mics and Ai Processing', 'IPX5 Water-Resistant', '4600', ''),
(9, '12', 'Anker Soundcore A30i A3958H31 True Wireless Earbuds Blue', '5', 2147483647, 'Smart Noise Cancelling: Adaptive ANC for peace and tranquillity.\r\n\r\n', 'czone.com.pk-50-1540-18109-080425111513.jpg', 'Anker', 'Anker', 'Long Battery Life: Up to 60 hours with charging case.', 'Thumping Beats: 11mm drivers with BassUp technology.', 'Superior Call Quality: 6 mics and AI for clear communication.', 'Dual Charging Case: Functions as a phone stand.', '7500', '8500'),
(10, '', 'CORSAIR HS65 WIRELESS CARBON Wireless Gaming Headset PC/PS5/PS4', '4', 2147483647, 'Wireless connection via dedicated USB adapter. Lightweight 9.5 oz (274 g), so you can use it comfortably for a long time\r\n\r\n', '109-czone.com.pk-1540-17912-280225105233.jpg', 'Corsair Headphones', 'Corsair', 'Equipped with an omni-directional microphone', 'Low-Latency Wireless Connectivity', 'Sound Perfected for You', 'Ready to Game', '31990', ''),
(11, '', 'CORSAIR Virtuoso PRO Wired Open Back Gaming Headset - Detachable Uni-Directional Microphone - 50mm Graphene Drivers - 20Hz-40 kHz Frequency Response - Carbon', '5', 2147483647, 'Hear What Matters: Open your world to a new audio experience tailor-made for streamers, gamers, and creators. VIRTUOSO PRO reproduces sound with incredible accuracy, clarity, and spaciousness\r\n\r\n', '105-czone.com.pk-1540-17911-280225104844.jpg', 'Corsair Headphones', 'Corsair', 'Virtuoso Pro Open Back Streaming/gaming Headset', 'Captivating Clarity', 'Ready for A Close-Up', 'Just Plug in And Press Play', '50990', ''),
(12, '', 'Apple EarPods with USB-C Connector MYQY3', '3', 2147483647, 'Designed by Apple\r\n\r\n', '6-czone.com.pk-1-1540-17829-190225092410.jpg', 'Earbuds | In Ear Headphones', 'Apple', 'USB-C Connection', 'Deep, Rich Bass', 'Protects Against Sweat & Water', 'Inline Remote Controls Playback and Calls', '7200', ''),
(13, '', 'Sony WF-1000XM5 Wireless Noise Cancelling Earbuds | Black | WF1000XM5BC', '5', 2147483647, 'Featuring Cutting-Edge Technology to Deliver Premium Sound Quality and The Best Noise-Cancelling* Performance on The Market.\r\n\r\n', '13-czone.com.pk-1540-15977-130524095844.jpg', 'Earbuds | In Ear Headphones', 'Sony ', 'Industry-leading noise cancellation', 'High-Resolution Audio', 'Superior call quality with AI noise reduction', 'Get hands-free help by saying \"Ok Google\" or \"Alexa', '64990', ''),
(14, '', 'A4 Tech HS-50 ComfortFit Stereo HeadSet', '3', 2147483647, 'Stereo 3.5 mm audio jack gaming headset with over ear soft cushion and high sensitivity microphone.\r\n\r\n\r\n', '42398886-2218914298138483-8953984648598257664-n-1540-7142-191018105858.jpg', 'Headsets | Headphones', 'A4Tech', 'Microphone sensitivity : -45 ±3dB', 'Microphone resistance : 2.2KO', 'Loudhailer diameter : 40mm', 'Frequency response : 20Hz-20kHz', '3190', ''),
(15, '', 'SteelSeries Arctis Nova 5P Wireless Gaming Headset for PS5, PS4 - White 61674 - Surround 7.1', '5', 2147483647, 'Unlock 100+ game audio presets with Arctis Nova 5P and the Companion App. Switch detailed EQ profiles for games like Fortnite, Apex Legends, Minecraft, and more without leaving the game. With 60-hour battery life, and 2.4GHz/Bluetooth wireless, plays', '1-czone.com.pk-1540-17259-071124092153.jpg', 'Headsets | Headphones', 'SteelSeries', '100+ Game Audio Presets', 'Maximum Wireless Range 30 feet', '60-Hour Battery', 'HighFidelity Audio', '50000', ''),
(16, '', 'HyperX Cloud Mini Gaming Headset | Black', '3', 2147483647, 'The HyperX Cloud Mini is a comfortable wireless headset built for the younger generation of gamers.\r\n\r\n', '13-czone.com.pk-1540-17859-200225022036.jpg', 'HyperX', 'HyperX', 'Volume level below 85dB', 'Immersive audio', 'Durable tuck-away boom microphone', 'Lightweight comfort', '8990', ''),
(17, '', 'HyperX Cloud Alpha Wireless Gaming Headset | 4P5D4AA | Black and Red', '5', 2147483647, 'Get a massive 300 hours of battery life and play for over a week without the battery getting low.\r\n\r\n', '16-czone.com.pk-1540-17855-200225012211.jpg', 'HyperX', 'HyperX', 'Over 300 hours of battery', 'DTS® Headphone:X® Spatial Audio', 'HyperX Dual Chamber Drivers', 'Signature HyperX comfort and durability', '48990', ''),
(18, '', 'JBL Tune T110 In-Ear Headphones | Red', '2', 2147483647, 'Introducing JBL TUNE110 in-ear headphones. They\'re lightweight, comfortable and compact.\r\n\r\n', 'czone.com.pk-1540-18128-100425102447.jpg', 'JBL', 'JBL', 'JBL Pure Bass sound', '1-button remote with microphone', 'Tangle-free flat cable', 'Hands Free Call', '2650', ''),
(19, '', 'JBL Tune 670NC Wireless Headphones, Adaptive Noise Cancelling with Smart Ambient, Bluetooth 5.3, JBL Pure Bass Sound - Purple', '5', 2147483647, 'Made with JBL Pure Bass – the same technology that powers music venues around the world – to put some extra pep in your step, whether you\'re commuting, at the gym or just vibing to music\r\n\r\n', '11-czone.com.pk-1540-17750-030225085435.jpg', 'JBL', 'JBL', 'Adaptive Noise Cancelling with Smart Ambient', 'Bluetooth 5.3 with LE Audio (*)', 'JBL Pure Bass Sound', 'Hands-free calls with VoiceAware', '19500', ''),
(20, '', 'Logitech H111 Stereo 3.5mm Multi-Device Headset - 981-000588', '3', 2147483647, 'Get just what you need to hear and be heard clearly. H111 features a standard 3.5mm audio jack, it’s compatible with most operating systems and platforms.\r\n\r\n', '13-czone.com.pk-1540-14178-281222073550.jpg', 'Logitech Headphones', 'Logitech', 'An Affordable Headset for All Your Devices', 'Stereo Sound', 'Rotating Microphone', 'Adjustable Headband', '2250', ''),
(21, '', 'Logitech PRO X Wireless Lightspeed Gaming Headset Black 981-000907', '5', 2147483647, 'Step up to the pro-grade communications and precision audio you need to win, all with the freedom and mobility of LIGHTSPEED wireless. BLUE VO!CE microphone technology gives you a choice of real-time voice filters. Reduce noise, add compression, and ', 'pro-wireless-hero-1540-11551-200521113547.jpg', 'Logitech Headphones', 'Logitech', 'Award-Winning Design: Created by and for gaming pros', 'PRO-GRADE Wireless: Designed to withstand long gaming sessions', 'Blue Vo!ce Microphone', 'Next generation DTS Headphone:X 2.0 surround sound', '57990', ''),
(22, '16', 'Bloody GM20 USB Gaming Microphone', '4', 2147483647, 'High-Definition Microphone\r\n\r\n', '3-czone.com.pk-1540-17567-060125104828.jpg', 'Microphone | Mic', 'A4Tech', '10 mm electret condenser captures crisp, clear sound.', 'Cardioid Pickup Pattern', 'Built-in Pop Filter Muffles', 'Microphone Volume Control', '4600', '5500'),
(23, '', 'Razer SEIREN V3 MINI USB Microphone | Black - RZ19-05050100-R3M1', '5', 2147483647, 'Meet the Razer Seiren V3 Mini—an ultra-compact USB microphone that now packs even more. Featuring a new tap-to-mute function and advanced audio customization, enjoy studio-quality voice capture with the perfect pint-sized companion for gaming, stream', '41-czone.com.pk-1540-16070-220524082031.jpg', 'Microphone | Mic', 'Razer', 'Clarity Made Compact', 'Condenser MIC - Crystal-clear Voice Capture', 'Supercardioid Pickup Pattern - Greater Voice Isolation', 'Tap-To-Mute Sensor with LED Indicator', '19990', ''),
(24, '', 'Redragon Ares RGB H120-RGB Gaming Headset Black', '4', 2147483647, 'The Redragon Ares RGB headphones are an excellent choice for gamers who want a combination of quality audio performance and captivating design. With RGB lighting, universal compatibility and a built-in microphone, these headphones are designed to enh', 'czone.com.pk-28-1540-18314-170525114507.jpg', 'Redragon', 'Redragon', 'Wired connectivity', 'Built-in microphone', 'Universal compatibility', 'Optimized impedance', '3880', ''),
(25, '', 'Redragon H510 ZEUS PRO 7.1 Surround Sound Wireless Gaming Headset – Black', '5', 2147483647, 'The Redragon H510 ZEUS PRO Wireless Gaming Headset redefines immersive gaming with its 7.1 Surround Sound capability, delivering crystal-clear audio for an unparalleled gaming experience.\r\n\r\n', 'czone.com.pk-27-1540-18139-110425111950.jpg', 'Redragon', 'Redragon', '7.1 Surround sound headset', 'Connect easily via 2.4GHz Wireless, Bluetooth 5.2, and USB', 'Noise-cancelling microphone', 'Soft, flexible over-ear pads and flexible headband', '13700', ''),
(26, '', 'Sony MDR-ZX310AP Wired On Ear Headphones, Black', '3', 2147483647, 'The black MDR-ZX310AP ZX Series Stereo Headset from Sony allow you to playback audio and take calls from your compatible smartphone.\r\n\r\n', '4-czone.com.pk-1540-11872-080721070621.jpg', 'Sony', 'Sony ', 'Lightweight, folding design for ultimate music mobility', '30mm ferrite drivers for powerful, balanced sound', '10–24,000Hz frequency range', 'Padded earcups for comfortable listening', '5990', ''),
(27, '14', 'Sony WH-1000XM5 Wireless Headphones, Auto Noise Canceling Optimizer, Alexa Voice Control | Black', '5', 2147483647, 'Specially developed by Sony, the new Integrated Processor V1 unlocks the full potential of our HD Noise Canceling Processor QN1. This unique combination of technology controls 8 microphones to deliver unprecedented noise-cancelling quality.\r\n\r\n', '1-czone.com.pk-1540-15140-040923091338.jpg', 'Sony', 'Sony ', 'Two processors control 8 microphones', 'Industry Leading Noise Cancellation', 'All day power and quick charging', 'Crystal clear hands-free calling', '84990', '99000'),
(28, '', 'Vention True Wireless Bluetooth Earbuds | NBNB0 ANC', '5', 2147483647, 'Transparent Mode / Normal Mode / Noise Cancellation Mode\r\n\r\n', '13-czone.com.pk-1540-17672-170125074347.jpg', 'Vention', 'Vention', 'ANC + ENC Tech', 'Dual Mode Switch', 'Digital Battery Display', 'ANC Noise Cancellation Depth -30db', '7300', ''),
(29, '', 'Arozzi Colonna Professional USB Condenser Microphone | Black', '5', 2147483647, 'The Colonna offers studio-quality sound with a USB plug-in to PCs, Macs, and popular gaming consoles.\r\n\r\n', 'czone.com.pk-14-1540-18130-110425090349.jpg', 'Microphone | Mic', 'Arozzi', 'Plug & Play for easy use', 'Pick-up patterns: Cardioid, Omnidirectional, and Bidirectional', 'Headphone jack with volume controller', 'Microphone pickup gain controller', '15990', ''),
(30, '', 'Arozzi Colonna Professional USB Condenser Microphone | Black', '5', 2147483647, 'The Colonna offers studio-quality sound with a USB plug-in to PCs, Macs, and popular gaming consoles.\r\n\r\n', 'czone.com.pk-14-1540-18130-110425090349.jpg', 'Microphone | Mic', 'Arozzi', 'Plug & Play for easy use', 'Pick-up patterns: Cardioid, Omnidirectional, and Bidirectional', 'Headphone jack with volume controller', 'Microphone pickup gain controller', '15990', ''),
(31, '12', 'Beats Studio Buds True Wireless Noise Cancelling Earbuds - Red', '4', 2147483647, 'True wireless noise cancelling Beats Studio Buds are made for music. Beats Studio Buds support spatial audio for immersive music, movies, and games — delivering a surround sound experience that you can take with you anywhere.*\r\n\r\n', '22-czone.com.pk-1540-17539-191224085101.jpg', 'Earbuds | In Ear Headphones', 'Beats by Dre', 'Supports spatial audio*', 'Active Noise Cancelling', 'Up to 8 hours of listening time*', 'Compatible with Apple & Android', '26500', '30000');

-- --------------------------------------------------------

--
-- Table structure for table `headsetheadphonemic_brand`
--

CREATE TABLE `headsetheadphonemic_brand` (
  `id` int(11) NOT NULL,
  `headsetheadphonemicbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `headsetheadphonemic_brand`
--

INSERT INTO `headsetheadphonemic_brand` (`id`, `headsetheadphonemicbrand`, `created_at`) VALUES
(6, 'Vention', '2025-05-04 12:15:14'),
(7, 'SteelSeries', '2025-05-04 12:15:19'),
(8, 'Sony ', '2025-05-04 12:15:22'),
(10, 'Redragon', '2025-05-04 12:36:07'),
(11, 'Razer', '2025-05-04 12:36:10'),
(13, 'Logitech', '2025-05-04 12:36:17'),
(14, 'JBL', '2025-05-04 12:36:20'),
(15, 'HyperX', '2025-05-04 12:36:23'),
(18, 'Corsair', '2025-05-04 12:36:40'),
(20, 'Beats by Dre', '2025-05-04 12:36:47'),
(22, 'Arozzi', '2025-05-04 12:36:55'),
(23, 'Apple', '2025-05-04 12:36:58'),
(24, 'Anker', '2025-05-04 12:37:01'),
(25, 'A4Tech', '2025-05-04 12:37:13');

-- --------------------------------------------------------

--
-- Table structure for table `headsetheadphonemic_store`
--

CREATE TABLE `headsetheadphonemic_store` (
  `id` int(11) NOT NULL,
  `headsetheadphonemicstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `headsetheadphonemic_store`
--

INSERT INTO `headsetheadphonemic_store` (`id`, `headsetheadphonemicstore`, `created_at`) VALUES
(18, 'Logitech Headphones', '2025-05-04 11:45:47'),
(19, 'A4Tech | Bloody', '2025-05-04 11:45:51'),
(20, 'Corsair Headphones', '2025-05-04 11:45:54'),
(21, 'Earbuds | In Ear Headphones', '2025-05-04 11:45:56'),
(22, 'Headsets | Headphones', '2025-05-04 11:45:59'),
(23, 'Sony', '2025-05-04 11:46:00'),
(25, 'Microphone | Mic', '2025-05-04 12:13:36'),
(26, 'Vention', '2025-05-04 12:13:42'),
(28, 'JBL', '2025-05-04 12:13:48'),
(29, 'Redragon', '2025-05-04 12:13:51'),
(30, 'HyperX', '2025-05-04 12:13:54'),
(31, 'Anker', '2025-05-04 12:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `home`
--

CREATE TABLE `home` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home`
--

INSERT INTO `home` (`id`, `offer`, `name`, `description`, `image`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(10, '6', 'Apple MacBook Air 13.3\" MGN63 Space Gray, M1 8-Core 8GB 256GB SSD', 'The Apple 13\" MacBook Air features Apple\'s first chip designed specifically for Mac. The Apple M1 integrates the CPU, GPU, Neural Engine, I/O, and more into a single system on a chip (SoC). Tackle your projects with the fast 8-Core CPU and take on gr', '4-czone.com.pk-1540-10682-140225042022.jpg', 'Apple M1 8-Core CPU', '8GB Unified RAM | 256GB SSD', '13.3\" 2560 x 1600 Retina IPS Display', '7-Core GPU | 16-Core Neural Engine', '201990', '215000'),
(11, '9', 'HP Victus 16T-R000 Gaming Laptop 76S93AV | Intel Core i7-13700H | 16GB DDR5 | 512GB SSD | NVIDIA GeForce RTX 4070 8GB | 16\" 144Hz FHD IPS Display | Backlit KB | Windows 11', 'The HP Victus Laptop is made for peak PC gaming. This sleek machine touts a 13th Gen Intel Core processor and modern NVIDIA graphics card.\r\n', '3-czone.com.pk-1540-15522-140225041836.jpg', 'Intel Core i7-13700H 2.4 - 5GHz 14C - 24 MB Smart Cache', '16GB DDR5 Memory - 512GB NVMe SSD', 'NVIDIA GeForce RTX 4070 8 GB - WiFi 6 - Gigabit LAN', '16\" 144Hz FHD IPS Display - Backlit KB - Windows 11 Home', '369000', '405000'),
(12, '', 'HP ProBook 460 G11 Notebook PC | Intel Core Ultra 5 125U | 16GB DDR5 | 512GB SSD | Backlit KB | Fingerprint Reader | 16\" WUXGA IPS Display', 'HP ProBook 460 16 inch G11 Notebook PC (A23BKEA)\r\n', 'copy-copy-22-czone.com.pk-1540-16742-120824123202.jpg', 'Intel Core Ultra 5 125U | FreeDOS | Pike Silver', '16 GB DDR5-5600 MT/s (1 x 16 GB) | 512 GB PCIe® NVMe™ SSD', 'Intel® Graphics, Backlit KB, 1080p FHD camera, Fingerprint Reader', '16\" Diagonal WUXGA (1920 x 1200) IPS Display', '186990', ''),
(13, '21', 'HP Victus 16-S1023DX Gaming Laptop | AMD Ryzen™ 7 8845HS 16GB 512GB, NVIDIA GeForce RTX 4070 8GB, 16.1\" FHD 144Hz IPS, Backlit KB | Mica Silver', 'Unlock your true gaming potential. Stop throttling your gaming potential and give your games the max graphics settings they yearn for with the latest AMD processor and graphics card. \r\n', '1-czone.com.pk-1-1540-16655-030824075807.jpg', 'AMD Ryzen™ 7 8845HS 8C | Windows 11 Home', '16GB DDR5 5600MHz Memory - 512GB PCIe 4.0 SSD', 'NVIDIA GeForce RTX 4070 8GB GDDR6', '16.1\" FHD 144Hz IPS, Backlit KB', '307990', '390000'),
(14, '', 'HP 15-FD0343NIA Laptop | Intel® Core™ i7-1355U 8GB 512GB Intel Iris Xe Graphics Backlit KB 15.6\" FHD | Warm Gold', 'Say hello to the reliable PCs that easily pass the vibe check. HP PCs are built with dependable technology, next-level power, and rock-solid performance that turn your to-do lists into to-done lists.\r\n', '1-czone.com.pk-1540-16040-180524082915.jpg', 'Intel® Core™ i7-1355U', '8 GB DDR4-3200 MHz RAM (1 x 8 GB), 512 GB PCIe® NVMe™ M.2 SSD', 'Intel Iris Xe Graphics, Backlit KB', '15.6\" FHD Display, FreeDOS 3.0', '173900', ''),
(15, '', 'ASUS ProArt Display PA279CRV Professional Monitor | 27\" IPS 4K | 99% Adobe RGB | VESA DisplayHDR 400 | USB-C', 'ASUS ProArt Display PA279CRV Professional Monitor – 27-inch, IPS, 4K UHD (3840 x 2160), 99% DCI-P3, 99% Adobe RGB, Color Accuracy ?E < 2, Calman Verified, USB-C PD 96W, VESA DisplayHDR 400, VESA MediaSync, Ergonomic Stand, Green Sustainability\r\n', '10-czone.com.pk-1540-16122-290524084016.jpg', 'Panel Size (inch) : 27', 'Panel Type : IPS', 'Resolution : 3840x2160', 'Color Space (sRGB) : 100% | Color Space (Adobe RGB) : 99%', '179900', ''),
(16, '', 'HP ProBook 450 G10 Notebook PC 85D06EA Intel Core i7-1355U 8GB DDR4 512GB SSD Wi-Fi 6E Backlit KB Fingerprint Reader 15.6\" FHD Display | Pike Silver Aluminum', 'The HP ProBook 450 15-inch laptop provides growing businesses with a durable PC featuring built-in collaboration and connectivity tools with multi-layered endpoint security— meeting commercial-grade expectations.\r\n', 'copy-11-czone.com.pk-1540-15103-280823090936.jpg', 'Intel® Core™ i7-1355U Processor, 10C - Intel® UHD Graphics', '8 GB DDR4-3200 MHz RAM, 512 GB PCIe® NVMe™ SSD', 'Intel Graphics, Wi-Fi 6E, Backlit KB, Fingerprint Reader', '15.6\" FHD AG 250n Narrow Bezel Display', '211500', ''),
(17, '', 'Dell Vostro 3520 Laptop - Intel Core i3-1215U, 8GB DDR4, 512GB SSD, 15.6\" FHD 120Hz Display, Carbon Black', 'Everyday tasks are quickly handled with ease using up to 12th Gen Intel® Core™ Processors.\r\n', '4-czone.com.pk-1540-15668-240624060743.jpg', 'Intel® Core™ i3-1215U Processor 6C, Intel® UHD Graphics', '8GB DDR4 2666MHz, 512GB M.2 PCIe NVMe SSD', '802.11ac 1x1 WiFi, Carbon Black Color', '15.6\" FHD 120Hz 250n Narrow Border Display - Ubuntu Linux', '98990', ''),
(18, '', 'Asus TUF Gaming A15 FA506NCR Gaming Laptop | AMD Ryzen 7 7435HS 8GB 512GB | RTX 3050 4GB | 15.6\" FHD 144Hz | Graphite Black', '90NR0JV7-M006Y0\r\n', '6-czone.com.pk-1-1540-17742-310125110910.jpg', 'AMD Ryzen™ 7 7435HS, Windows 11 Home', '8GB DDR5-4800 SO-DIMM RAM, 512GB PCIe® 4.0 NVMe™ M.2 SSD Storage', 'NVIDIA® GeForce RTX™ 3050 4GB', '15.6\" FHD (1920 x 1080) 144Hz', '199990', ''),
(19, '11', 'MSI Thin 15 B13UC-1000US Gaming Laptop | Intel Core i5-13420H 16GB 512GB NVIDIA Geforce RTX 3050 4GB Windows 11 15.6\" FHD 144Hz', 'More power from the jump. Get ready to game on your terms.\r\n', '3-czone.com.pk-1540-17705-120225120233.jpg', 'Intel Core i5-13420H - Windows 11 Home', '16GB (8G*2) DDR4 3200MHz - 512GB NVMe SSD', 'NVIDIA Geforce RTX 3050 (4GB GDDR6) | Wi-Fi 6E (802.11ax)', '15.6\" FHD 1920 x 1080 144Hz Display', '183400', '215000'),
(20, '', 'ASUS Zenbook 14 OLED Q425MA Touchscreen Laptop | Intel Core Ultra 7 155H 16GB LPDDR5X 1TB PCIe SSD Backlit KB 14\" FHD OLED Display', 'Go the extra mile with the remarkably sleek Zenbook 14 OLED — the ultimate ultraportable laptop that takes sophistication to a whole new level.\r\n', '1-czone.com.pk-1540-16828-080225072508.jpg', 'Intel Core Ultra 7 Processor 155H, Windows 11 Home', '16GB LPDDR5X on Board - 1TB M.2 NVMe™ PCIe® 4.0 SSD', 'Backlit Chiclet Keyboard | FHD Camera with IR Function', '14\" FHD (1920 x 1200) OLED Touchscreen Display | Wi-Fi 6E', '259990', ''),
(21, '', 'ASUS Zenbook 14 OLED Q415MA Business Touchscreen Laptop | Intel® Core™ Ultra 5 Processor 125H, 8GB DDR5, 512GB SSD, Backlit KB, 14\" FHD OLED 0.2ms HDR 100% DCI-P3, Windows 11, Jasper Gray', 'New Zen with AI. Go the extra mile with the remarkably sleek Zenbook 14 OLED — the ultimate ultraportable laptop that takes sophistication to a whole new level.\r\n', '1-czone.com.pk-1540-16828-080225072508.jpg', 'Intel® Core™ Ultra 5 Processor 125H 14C, Windows 11 Home', '8GB LPDDR5 On Board, 512GB M.2 NVMe™ PCIe® 4.0 SSD', '2x Thunderbolt™ 4, Backlit Chiclet Keyboard, Wi-Fi 6E', '14\" FHD OLED 0.2ms HDR 100% DCI-P3 Touchscreen', '173990', ''),
(22, '11', 'Lenovo IdeaPad Slim 3 15AMN8 Laptop - AMD Ryzen 3 7320U, 8GB DDR5, 256GB SSD, 15.6\" FHD IPS Display, WiFi 6 - 82XQ00B5PS - Arctic Grey (Official Warranty)', 'Make a statement wherever you go with the IdeaPad Slim 3 Gen 8 laptop, built for lightness and thinness, measuring up to 10% slimmer than the previous generation.\r\n', '1-czone.com.pk-1540-15436-101123091100.jpg', 'AMD Ryzen™ 3 7320U Processor, 4 Core', '8GB Soldered LPDDR5-5500, 256GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'Integrated AMD Radeon™ 610M Graphics, FHD 1080p with Privacy Shutter Camera', '15.6\" FHD (1920x1080) IPS 300nits Anti-glare, WiFi 6', '101900', '115000'),
(23, '18', 'HP Envy x360 2-in-1 Laptop 16-AD0023DX | AMD Ryzen™ 7 8840HS 16GB 1TB SSD 16\" IPS WUXGA Touchscreen Backlit KB, Poly Studio - Meteor Silver', 'Power your every passion. The HP ENVY Laptop is designed to help you power your passions with built-in AI technology that delivers hard-hitting processing power to help you do more faster. This innovative tech comes in a thin and light, versatile 2-i', '17-czone.com.pk-1540-16930-100924111431.jpg', 'AMD Ryzen™ 7 8840HS Zen 4 8C, Windows 11 Home', '16GB LPDDR5 6400MHz, 1 TB PCIe® Gen4 NVMe™ M.2 SSD', 'Wi-Fi 6E, Privacy Camera, Backlit KB, HP Audio Boost Poly Studio', '16\" IPS 1920 x 1200 (WUXGA) Touchscreen', '235000', '285000');

-- --------------------------------------------------------

--
-- Table structure for table `inches`
--

CREATE TABLE `inches` (
  `size` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inches`
--

INSERT INTO `inches` (`size`) VALUES
('15\" - 15.6\"'),
('23\" - 24\"'),
('24.5\" - 25.0\"'),
('27\" - 28\"'),
('31\" - 32\"'),
('34\"'),
('43\"'),
('49\"');

-- --------------------------------------------------------

--
-- Table structure for table `keyboard`
--

CREATE TABLE `keyboard` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keyboard`
--

INSERT INTO `keyboard` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(4, '', 'Logitech K120 USB Keyboard', '5', 2147483647, 'Getting things done should be simple. That’s what makes this full-sized keyboard the right fit. It’s a reliable and durable partner equipped with a number pad with an easy-to-use design that works right out of the box. Just plug in this corded keyboa', 'k120-gallery-01-new-1540-384-280321052530.jpg', 'Logitech Keyboards', 'Logitech', 'Comfortable and Full-Size', 'Easy Plug & Play', 'Durable and Spill-Resistant', 'Built to Keep Going', '2100', ''),
(5, '6', 'Logitech MX Keys Combo for Business | Gen 2 Keyboard Mouse - 920-010934 - Arabic (Qwerty)', '5', 2147483647, 'Performance Combo: MX Keys for Business, MX Master 3S for Business, and MX Palm Rest\r\n\r\n', 'czone001179-1540-17291-111124122539.jpg', 'Logitech Keyboards', 'Logitech', 'The MX Series Experience', 'Multi-Device, Multi-OS Compatibility', 'Greater Productivity with Logi Options+', 'All-Day Comfort', '60990', '65000'),
(6, '', 'Apple Magic Keyboard MK2A3', '5', 2147483647, 'Enhance your productivity with compatible Mac, iPad, iPhone, and iPod touch devices with the Apple Magic Keyboard.\r\n\r\n', '1-czone.com.pk-1540-12943-270222071815.jpg', 'Apple', 'Apple', 'Wireless Bluetooth Connectivity', 'Built-In Rechargeable Battery', 'Low-Profile, Compact Design', 'Lightning to USB Type-C Cable Included', '35500', ''),
(7, '', 'Apple Magic Keyboard with Touch ID and Numeric Keypad (USB-C, Black Keys) MXK83', '5', 2147483647, 'With the Apple Magic Keyboard with Touch ID and Numeric Keypad, you\'ll be able to use Touch ID for fast, easy, and secure authentication for logins and purchases.\r\n\r\n', 'czone.com.pk-8-1540-18094-080425080233.jpg', 'Apple', 'Apple', 'USB-C Port', 'Numeric Keypad | Touch ID Sensor', 'Pairs Automatically with Mac', 'Wireless and Rechargeable', '78990', ''),
(8, '', 'HyperX Alloy Origins Core PBT HX Aqua - Mechanical Gaming Keyboard Black 639N7AA - HyperX Red - Linear', '5', 2147483647, 'The HyperX Alloy Origins Core PBT is an ultra-compact, sturdy tenkeyless keyboard featuring custom HyperX mechanical switches designed to give gamers the best blend of style, performance, and reliability.\r\n\r\n', '33-czone.com.pk-1540-17107-171024100520.jpg', 'HyperX', 'HyperX', 'High-quality, durable PBT keycaps', 'Responsive HyperX Mechanical Switches', 'Built strong: Aircraft-grade aluminum body', 'Compact tenkeyless design to maximize space', '28990', '35000'),
(9, '', 'A4Tech KK-3 Multimedia SmartKey FN Keyboard', '4', 2147483647, 'Laser printing keycaps make the letter or character always new even after your long-term use.\r\n\r\n', '20-czone.com.pk-1540-13159-260422083421.jpg', 'A4 Tech Keyboards', 'A4Tech', 'Adjustable Keyboard Height', 'Large Enter Key', 'High-Elasticity Silicon', 'Easy to access to 12 multimedia & internet functions.', '1960', ''),
(10, '', 'A4Tech 3330N | 3330NS Wireless Desktop - Black - Keyboard & Mouse', '5', 2147483647, 'A comfortable full-size keyboard and easy-to-carry mouse with snap-on wireless receiver increase freedom, so you can work comfortably away from your computer.\r\n\r\n', '13-czone.com.pk-1540-13884-131022083616.jpg', 'A4 Tech Keyboards', 'A4Tech', 'Consistent Wireless Stability', 'Up to 12 Months Battery Life', 'Auto Power Saving', 'Smart Wireless SoC Technology', '4550', ''),
(11, '', 'MSI FORGE GK310 Combo | Red Switches - Gaming RGB Mechanical Keyboard - Forge Mouse', '4', 2147483647, 'The FORGE series blends gaming and creative pursuits, offering users a platform to craft personalized experiences. Powered by MSI GEAR, the FORGE series not only fuels creativity but also enhances gameplay, enabling users to bring their visions to li', '40-czone.com.pk-1540-17576-060125014645.jpg', 'MSI', 'MSI', 'Delightful Typing Sensation', 'Tailor Your Switch Anytime', 'Layers of Completion', 'Play with Your Style', '11990', ''),
(12, '', 'MSI VIGOR GK30 Gaming Keyboard, Plunger Switches, RGB', '5', 2147483647, 'Mechanical-like plunger switches with 3-part construction provides a crisp typing experience with over 12 million life span.\r\n\r\n', '7-czone.com.pk-1540-11544-180521113508.jpg', 'MSI', 'MSI', 'RGB Mystic Light', 'MECH. Membrane', 'Water Repellent', 'Dragon Center', '12490', '');

-- --------------------------------------------------------

--
-- Table structure for table `keyboard_brand`
--

CREATE TABLE `keyboard_brand` (
  `id` int(11) NOT NULL,
  `keyboardbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keyboard_brand`
--

INSERT INTO `keyboard_brand` (`id`, `keyboardbrand`, `created_at`) VALUES
(13, 'Logitech', '2025-05-26 22:08:44'),
(14, 'A4Tech', '2025-05-26 22:09:18'),
(15, 'HyperX', '2025-05-26 22:09:46'),
(16, 'MSI', '2025-05-26 22:10:01'),
(17, 'Apple', '2025-05-26 22:10:16');

-- --------------------------------------------------------

--
-- Table structure for table `keyboard_store`
--

CREATE TABLE `keyboard_store` (
  `id` int(11) NOT NULL,
  `keyboardstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keyboard_store`
--

INSERT INTO `keyboard_store` (`id`, `keyboardstore`, `created_at`) VALUES
(13, 'Logitech Keyboards', '2025-05-26 22:08:44'),
(14, 'A4 Tech Keyboards', '2025-05-26 22:09:18'),
(15, 'HyperX', '2025-05-26 22:09:46'),
(16, 'MSI', '2025-05-26 22:10:01'),
(17, 'Apple', '2025-05-26 22:10:16');

-- --------------------------------------------------------

--
-- Table structure for table `laptopacc`
--

CREATE TABLE `laptopacc` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptopacc`
--

INSERT INTO `laptopacc` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'HP 14\" Chroma CMF Geo Laptop Sleeve SHR66AV', '3', 2147483647, 'Wrap your laptop in a colourful, comfortable sleeve. The durable neoprene material helps protect your personal computer from the elements, as well as bumps and scratches. Easily reversible so you can change colors to suit your mood.\r\n\r\n', '11-czone.com.pk-1540-14574-120423084048.jpg', 'Sleeves', 'HP', '14\" Reversible Sleeve', 'Colour Grey', 'PC and Mac', 'Fits up to 35.56 cm (14?) Diagonal Laptops', '1400', ''),
(4, '', 'Lenovo Casual Toploader T210 for 15.6\" Laptops Bag, Black', '4', 2147483647, 'The Lenovo 15.6\" Laptop Casual Toploader T210 utilizes a water-repellent fabric and a clean, streamlined design to create a case that is perfectly suited to modern life.\r\n\r\n', '15-czone.com.pk-1540-16110-280524081103.jpg', 'Bags & Backpacks', 'Lenovo', 'Shoulder/Messenger Bag', 'GX40Q17229', 'Pattern: Solid', 'Water-Resistant, Padded', '3000', ''),
(5, '', 'Aluminum Alloy Creative Laptop Stand GL069', '3', 354300524, 'Foldable Laptop Stand, Aluminum Alloy Laptop Stand Basic Portable Notebook Stand Holder.\r\n\r\n', '40-czone.com.pk-1540-16138-300524105911.jpg', 'Stands', 'Miscellaneous', 'Riser For Any 10\"~ 15.6\" Notebook', 'Wide Compatibility', 'Portable and Foldable', 'Multi-angle adjustment', '3500', ''),
(6, '', 'UGREEN Desktop Laptop Stand for Desk Adjustable Portable Laptop Riser Holder Notebook Computer Stand 80348', '3', 2147483647, 'Sturdy & Durable: UGREEN laptop stand is made of stainless steel, and both inner and outer contact surfaces of the holder are equipped with silicone anti-skid pads to increase friction and prevent sliding. The travel laptop stand adopts a triangular ', '75-czone.com.pk-1540-14930-010823112505.jpg', 'Stands', 'Ugreen', 'Perfect to improve your posture and cool down the laptop', 'Adjustable ergonomic design, comfortable to hold', 'Only 110g, as lightweight as a mobile phone.', 'Broad Compatibility', '3500', ''),
(7, '', 'UNITEK Mechanical Foldable Laptop Stand OT155SL', '5', 2147483647, 'This laptop raiser is foldable and good for portable, with 6 adjustable levels of tilt, it is excellent to create comfort for your neck and cervical spine during reading and typing.\r\n\r\n', '24-czone.com.pk-1540-17010-270924123112.jpg', 'Stands', 'UNITEK', 'Create Comfortable Angle', 'Help In Ventilation & Cooling', 'Mechanic Design', '6 adjustable levels of tilt', '3570', ''),
(8, '', 'Dell EcoLoop Pro Briefcase 15 Laptop Carry Bag', '4', 2147483647, 'For 15.6\" Laptop/Notebook - Weather resistant - adjustable shoulder strap - luggage pass-through - reflective accent.\r\n\r\n', '3-czone.webp', 'Bags & Backpacks', 'Dell ', 'Product Material: 840D Fabric, 100% Recycled Ocean-Bound Plastic', 'Adjustable Shoulder Strap', 'Luggage Pass Through', 'Padded Carry Handles', '3800', ''),
(9, '', 'Ibex Folding Portable Wooden Study Laptop Stand with Drawer', '4', 2147483647, 'This Wooden Laptop Table will protect both the laptop from overheating and the user from suffering heat-related discomfort. In addition, it can also be used as a coffee table/study table. You can play card games, study, write a diary and do much more', 'czone.com.pk-1540-17958-060325063134.jpg', 'Stands', 'Miscellaneous', 'Length: 23.6\" - Width: 15.7\" - Height: 11\"', 'Anti-Skid Foam Gripping', 'Sturdy Powder-Coated Metal Tubes', 'Laminated Ergonomically Designed Edges', '3950', ''),
(10, '', 'Rivacase 7703 Black ECO Laptop Sleeve 13.3-14\" - Suzuka Collection', '4', 2147483647, 'The series of sleeves are ideal for most popular Laptops, Ultrabooks, and Tablets.\r\n\r\n', '31-czone.com.pk-1540-17213-011124093301.jpg', 'Sleeves', 'Rivacase ', 'Delicate Sporty Style and Quality of The Craftsmanship', 'Stylish Protection', 'Convenience, Storage and Accessibility', 'Protective plush interior', '4298', ''),
(11, '', 'Rivacase 8027 Black Laptop Bag 14\" | Regent Collection', '5', 2147483647, 'This elegant Laptop bag embodies our brand DNA, engineered for both versatility and style.\r\n\r\n', '58-czone.com.pk-1540-17225-011124114910.jpg', 'Bags & Backpacks', 'Rivacase ', 'Multifunctional bag aimed at entry price level for Laptops up to 14\"', 'Made of durable polyester fabric', 'Padded Laptop compartment provides extra protection', 'Front zipped pocket for smartphone, business cards, accessories', '4400', ''),
(12, '', 'RIVACASE 5556 Cooling Pad for Laptop Up to 17.3\'\'', '5', 2147483647, 'RIVACASE Laptop cooling pad with built-in silent cooling fan developed for a comfortable typing position and protected against overheating.\r\n\r\n', '71-czone.com.pk-1540-17228-011124122004.jpg', 'Laptop Cooling Pads', 'Rivacase ', 'Laptop pad helps keep laptops running cooler to help reduce crashes', 'Ergonomic comfort: 2 height settings', 'Two anti-skid arms', 'Nonslip feet', '4500', ''),
(13, '', 'Dell Pro Sleeve 13 for 13\" Laptop', '5', 2147483647, 'The Dell Pro Sleeve 13 protects your 13\" laptop wherever your busy day takes you. The professionally-stylish heather grey exterior is also water-resistant to protect your laptop from the weather.\r\n\r\n', '24-czone.com.pk-1540-13200-050924091804.jpg', 'Sleeves', 'Dell ', 'Stylish protection for your laptop on-the-go', 'Lightweight and comfortable design', 'Weather resistant materials prevent damage', 'Superb functionality for easy transport', '4500', ''),
(14, '', 'Dell Pro Sleeve 13 for 13\" Laptop', '5', 2147483647, 'The Dell Pro Sleeve 13 protects your 13\" laptop wherever your busy day takes you. The professionally-stylish heather grey exterior is also water-resistant to protect your laptop from the weather.\r\n\r\n', '24-czone.com.pk-1540-13200-050924091804.jpg', 'Sleeves', 'Dell ', 'Stylish protection for your laptop on-the-go', 'Lightweight and comfortable design', 'Weather resistant materials prevent damage', 'Superb functionality for easy transport', '4500', ''),
(15, '', 'DUKES DM-2304 Laptop Backpack | Black', '5', 1153100824, 'Introducing the DUKES DM-2304 Laptop Backpack, the ultimate accessory for those who demand both style and functionality in their everyday carry.\r\n\r\n', '11-czone.com.pk-1540-16730-100824065653.jpg', 'Bags & Backpacks', 'Dukes', 'Size: 13” to 17” Notebook', 'Capacity: 20 to 25 liters', 'Compartments: Double compartment with interlayer design', 'USB Port: 1 x USB charging port', '7990', ''),
(16, '', 'RIVACASE 5555 Cooling Pad Up to 15.6\"', '5', 2147483647, 'RIVACASE Laptop cooling pad with 2 built-in silent cooling fans for a comfortable typing position protection against overheating\r\n\r\n', '64-czone.com.pk-1540-17227-011124121344.jpg', 'Laptop Cooling Pads', 'Rivacase ', 'Laptop pad helps keep Laptops running cooler to help reduce crashes', 'Ergonomic comfort: 2 height setting', 'Two anti-skid arms', 'Nonslip feet', '5500', ''),
(17, '', 'DUKES DTL-985 Top Load Laptop Shoulder Bag | Black', '5', 1140100824, 'Introducing the DUKES DTL-985 Top Load Laptop Shoulder Bag, designed for the professional on the go. This sleek shoulder bag combines style, durability, and practicality, making it the perfect choice for business travellers, students, and anyone need', '6-czone.com.pk-1540-16728-100824064235.jpg', 'Bags & Backpacks', 'Dukes', 'Material: Oxford', 'Size: 11” to 17” Notebook', 'Capacity: 20 to 39 liters', 'USB Port: 1 x USB charging port', '6700', ''),
(18, '', 'DUKES Top-Load Laptop Bag | DTL-980 - Blue', '4', 2147483647, 'Introducing the DUKES DTL-980BK top-load laptop shoulder bag, a sophisticated and durable accessory designed for the modern professional. Crafted from high-quality PVC, this shoulder bag offers excellent protection for your laptop and essentials, whe', '11-czone.com.pk-1540-17345-191124103153.jpg', 'Bags & Backpacks', 'Dukes', 'Stylish and Functional Protection for Your Devices', 'Versatile Storage and Organization', 'Designed for Comfort and Durability', 'Size: 11” to 17” Notebook', '7990', '');

-- --------------------------------------------------------

--
-- Table structure for table `laptopacc_store`
--

CREATE TABLE `laptopacc_store` (
  `id` int(11) NOT NULL,
  `laptopacc` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptopacc_store`
--

INSERT INTO `laptopacc_store` (`id`, `laptopacc`, `created_at`) VALUES
(3, 'Bags & Backpacks', '2025-04-11 06:04:38'),
(4, 'Stands', '2025-04-11 06:04:44'),
(5, 'Laptop Cooling Pads', '2025-04-11 06:04:53'),
(6, 'Sleeves', '2025-04-11 06:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `laptopused`
--

CREATE TABLE `laptopused` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptopused`
--

INSERT INTO `laptopused` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'HP EliteBook 840 G5 Business Laptop - Intel Core i5-8350U, 8GB, 256GB SSD, Backlit KB, 14\" FHD, Windows 10 Pro | Used', '3', 1204270224, 'This pre-owned product has been professionally inspected, tested and cleaned. This product is in \"Excellent condition\". The screen and body show no signs of cosmetic damage visible from 12 inches away. Accessories may not be original but will be comp', 'copy-4-czone.com.pk-1-1540-14768-010623094851.jpg', 'HP', 'Core i5 8th', 'Intel® Core™ i5-8350U Processor | Intel® UHD Graphics 620', '8GB DDR4 Memory - 256GB SSD', 'WLAN 11AC - Backlit KB - Fingerprint Reader - Bang & Olufsen', '14\" FHD Anti Glare Display - Windows 10 Pro', '69000', ''),
(4, '', 'HP ProBook 440 G7 Laptop | Intel® Core™ i5-10210U 8GB 256GB Backlit KB Windows 10 Pro 14\" FHD | Used', '4', 2147483647, 'Designed for business comfort. A lightweight, secure and powerful PC, with advanced collaboration features.\r\n\r\n', 'copy-copy-5-czone.com.pk-1-1540-14216-060123081048.jpg', 'HP', 'Core i5 10th', 'Intel® Core™ i5-10210U Processor | 4C', '8GB DDR4 Memory - 256GB SSD', 'Intel® UHD Graphics | Backlit KB', 'Windows 10 Pro, 14\" FHD Display', '72000', ''),
(5, '', 'HP EliteBook 840 G7 Notebook PC | Intel Core i5-10310U 16GB 256GB SSD Fingerprint Reader Windows 10 Pro 14\" FHD Backlit KB | Used', '4', 2147483647, 'This pre-owned product has been professionally inspected, tested and cleaned. This product is in \"Excellent condition\". The screen and body show no signs of cosmetic damage visible from 12 inches away. Accessories may not be original but will be comp', 'copy-12-czone.com.pk-1540-15352-131023110614.jpg', 'HP', 'Core i5 10th', 'Intel® Core™ i5-10310U Processor vPRO', '16GB DDR4 Memory, 256GB M.2 2280 PCIe SSD', 'WLAN 11ax, Intel® UHD Graphics, Fingerprint Reader', 'Windows 10 Pro, 14\" FHD Display, Backlit KB', '84990', ''),
(6, '', 'Dell Latitude 7420 Touchscreen Laptop | Intel® Core™ i5-1145G7 16GB 256GB Backlit KB 14\" FHD Touchscreen Windows 11 Pro | Used | A+ Condition', '4', 2147483647, 'Dell Latitude 7420 Core-i5 11th Generation Laptops are amazingly powerful and great performing high tech laptop with intel processor and intel graphics.\r\n\r\n', 'copy-copy-1-czone.com.pk-1540-16371-090724093159.jpg', 'Dell', 'Core i5 11th', 'Intel® Core™ i5-1145G7 Processor 4C', '16GB Memory - 256GB SSD', 'Intel® Iris® Xe Graphics, Backlit KB', '14\" FHD Touchscreen Display, Windows 11 Pro', '92500', ''),
(7, '', 'HP EliteBook 840 G7 Notebook PC | Intel Core i7-10810U | 16GB DDR4 | 256GB SSD | Fingerprint Reader | Backlit KB | 14\" FHD Display | Windows 10 Pro | Used', '4', 2147483647, 'This pre-owned product has been professionally inspected, tested and cleaned. This product is in \"Excellent condition\". The screen and body show no signs of cosmetic damage visible from 12 inches away. Accessories may not be original but will be comp', 'copy-copy-copy-12-czone.com.pk-1540-15352-131023110614.jpg', 'HP', 'Core i7 10th', 'Intel Core i7-10810U Processor', '16GB DDR4 Memory, 256GB SSD', 'Fingerprint Reader, Backlit KB', '14\" FHD Display, Windows 10 Pro', '96000', ''),
(8, '', 'HP EliteBook 840 G7 Notebook PC | Intel Core i7-10610U 16GB DDR4 256GB SSD Fingerprint Reader Backlit KB 14\" FHD Display Windows 10 Pro | Used A+ Condition', '3', 2147483647, 'This pre-owned product has been professionally inspected, tested and cleaned. This product is in \"Excellent condition\". The screen and body show no signs of cosmetic damage visible from 12 inches away. Accessories may not be original but will be comp', 'copy-12-czone.com.pk-1540-15352-131023110614.jpg', 'HP', 'Core i5 11th', 'Intel® Core™ i7-10610U Processor', '16GB DDR4 Memory, 256GB SSD', 'Fingerprint Reader, Backlit KB', '14\" FHD Display, Windows 10 Pro', '96000', ''),
(9, '', 'HP EliteBook 840 G8 Laptop - Intel® Core i5-1145G7 16GB 256GB Fingerprint Reader Backlit KB 14\" FHD Display Windows 11 Pro - Used - A+ Condition', '3', 450101024, 'This pre-owned product has been professionally inspected, tested and cleaned. This product is in \"Excellent condition\". The screen and body show no signs of cosmetic damage visible from 12 inches away. Accessories may not be original but will be comp', '2-czone.com.pk-1540-17064-101024115320.jpg', 'HP', 'Core i5 11th', 'Intel® Core™ i5-1145G7 Processor 4C, Intel® Iris® Xe Graphics', '16GB Memory - 256GB SSD', 'Fingerprint Reader, Backlit KB', '14\" FHD Display - Windows 11 Pro', '97990', ''),
(11, '', 'HP EliteBook 850 G7 Touchscreen Notebook PC - Intel Core i5-10310U 16GB 256GB Fingerprint Reader Backlit KB 15.6\" FHD Touchscreen Windows 11 Pro - Used', '4', 434101024, 'The HP EliteBook 850 G7 is a high-performance business laptop with a 10th Gen Intel Core i5-10310U processor, 16GB RAM, and a 256GB SSD for seamless multitasking. Featuring a 15.6\" FHD touchscreen, fingerprint reader, backlit keyboard, and Windows 11', 'copy-10-czone.com.pk-1540-15076-230823084632.jpg', 'HP', 'Core i5 10th', 'Intel Core i5-10310U Processor - Intel UHD Graphics', '16GB DDR4 Memory - 256GB SSD', 'Fingerprint Reader, Backlit KB', '15.6\" FHD Touchscreen, Windows 11 Pro', '100990', ''),
(12, '', 'HP EliteBook 830 G7 Notebook PC - Intel® Core™ i7-10610U 32GB DDR4 256GB SSD Backlit KB 13.3\" FHD Windows 10 Pro | Used', '5', 252060524, 'A collaborative approach to work requires a powerful, secure, and durable laptop that keeps users connected and productive in any setting. Meet the demands of your multitasking, multi-place workday with the beautifully designed HP EliteBook 830 G7. ', '2-czone.com.pk-1540-17064-101024115320.jpg', 'HP', 'Core i7 10th', 'Intel® Core™ i7-10610U Processor | Intel vPro® Platform', '32GB DDR4 - 256GB SSD', 'Intel UHD Graphics, Backlit KB', '13.3\" FHD Display, Windows 10 Pro', '104900', ''),
(13, '7', 'HP EliteBook 830 G7 Touchscreen Laptop Intel Core i7-10610U 32GB 256GB SSD Backlit KB Windows 10 Pro 13.3\" FHD Touchscreen | Used', '4', 2147483647, 'The HP EliteBook 830 G7 is a premium business laptop featuring a 10th Generation Intel Core i7-10610U processor, 32GB DDR4 RAM, and a 256GB PCIe NVMe SSD, delivering robust performance for multitasking ', '1-czone.com.pk-1-1540-17552-050125063743.jpg', 'HP', 'Core i7 10th', 'Intel® Core™ i7-10610U Processor | Intel vPro® Platform', '32GB DDR4 - 256GB SSD', 'Intel UHD Graphics, Backlit KB', '13.3\" FHD Display, Touch Screen, Windows 10 Pro', '106490', '115000'),
(14, '', 'HP EliteBook 830 G8 Touchscreen Laptop | Intel Core i7-1185G7, 32GB, 256GB SSD, Intel Iris Xe Graphics, Backlit KB, Windows 10 Pro, 13.3\" FHD Touchscreen | Used', '5', 2147483647, 'The HP EliteBook 830 G8 is a high-performance business laptop powered by an Intel Core i7-1185G7 processor, 32GB RAM, and a 256GB SSD for seamless multitasking and rapid data access. Its 13.3\" Full HD touchscreen delivers sharp visual', 'czone.com.pk-1540-18061-280325083944.jpg', 'HP', 'Core i7 11th', 'Intel® Core™ i7-1185G7 Processor', '32GB DDR4 Memory, 256GB SSD M.2 2280', 'Intel® Iris Xe Graphics, Backlit KB', 'Windows 10 Pro, 13.3\" FHD Touchscreen Display', '113490', ''),
(15, '', 'Dell Latitude 7420 Laptop | Intel® Core™ i7-1185G7 32GB 512GB Backlit KB 14\" FHD Touchscreen Windows 10 Pro | Used', '4', 227090724, 'This pre-owned product has been professionally inspected, tested and cleaned. This product is in \"Excellent condition\". The screen and body show no signs of cosmetic damage visible from 12 inches away. Accessories may not be original but will be comp', 'copy-copy-1-czone.com.pk-1540-16371-090724093159.jpg', 'Dell', 'Core i7 11th', 'Intel® Core™ i7-1185G7 Processor', '32GB Memory - 512GB SSD', 'Intel® Iris® Xe Graphics, Backlit KB', '14\" FHD Touchscreen Display, Windows 10 Pro', '125000', ''),
(16, '', 'HP EliteBook x360 1030 G8 Notebook PC | Intel Core i7-1185G7 16GB 512GB SSD Fingerprint Reader Backlit KB Windows 11 Pro 13.3\" FHD Touchscreen | Used', '5', 2147483647, 'HP EliteBook x360 1030 G8 Notebook\r\n\r\n', '28-czone.com.pk-1540-17754-030225121953.jpg', 'HP', 'Core i7 11th', 'Intel® Core™ i7-1185G7 Processor', '16GB Memory - 512GB SSD', 'Fingerprint Reader, Backlit KB, Windows 11', '13.3\" FHD Touchscreen x360', '138000', '');

-- --------------------------------------------------------

--
-- Table structure for table `laptopused_store`
--

CREATE TABLE `laptopused_store` (
  `id` int(11) NOT NULL,
  `laptopused` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `laptopused_store`
--

INSERT INTO `laptopused_store` (`id`, `laptopused`, `created_at`) VALUES
(4, 'Dell', '2025-04-11 05:28:48'),
(5, 'HP', '2025-04-11 05:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `lcdmonitor`
--

CREATE TABLE `lcdmonitor` (
  `monitor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lcdmonitor`
--

INSERT INTO `lcdmonitor` (`monitor`) VALUES
('AOC'),
('Asus'),
('Hp'),
('Lenovo'),
('LG'),
('MSI Monitors'),
('Samsung'),
('ViewSonic');

-- --------------------------------------------------------

--
-- Table structure for table `memory`
--

CREATE TABLE `memory` (
  `module` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memory`
--

INSERT INTO `memory` (`module`, `created_at`) VALUES
('Desktop - DDR4 Memory', '2025-03-23 03:00:49'),
('Desktop - DDR5 Memory', '2025-03-23 03:00:54'),
('Laptop (SOD) - DDR4 Memory', '2025-03-23 03:00:45'),
('Laptop (SOD) - DDR5 Memory', '2025-03-23 03:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `memorycards`
--

CREATE TABLE `memorycards` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memorycards`
--

INSERT INTO `memorycards` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Kingston Canvas Select Plus microSD Card 128GB SDCS2/128GB', '3', 2147483647, 'Kingston Canvas Select Plus | Class 10 UHS-I speeds up to 100MB/s*.\r\n\r\n', 'ktc-product-flash-microsd-sdcs2-128gb-3-zm-lg-1540-9321-200220083927.jpg', 'Kingston', '128GB', 'Optimised for use with Android devices', 'With Android A1 Performance Class', 'With SD Adapter', 'Faster speeds', '2700', ''),
(4, '', 'Lexar 64GB High-Performance 633x microSDXC UHS-I Card BLUE Series LMS0633064G-BNNNG | Up to 100MB/s', '3', 2147483647, 'Designed for your smartphones, tablets, or action cameras, Lexar® High-Performance 633x microSDHC™/SDXC™ UHS-I cards let you quickly capture, playback, and transfer a large number of multimedia files, including 1080p Full-HD, 3D, and 4K UHD video*. T', '5-czone.com.pk-1540-15681-010224081435.jpg', 'Lexar', '64GB', 'Up to 100MB/s read, 70MB/s write speeds', 'Feature A1/A2 Class', 'Do more with your multimedia', 'Get more from your device', '1450', ''),
(5, '', 'SanDisk Ultra microSDXC UHS-I 256GB Memory Card - SDSQUNR-256G-GN3MN', '4', 2147483647, 'The SanDisk Ultra® microSD™ UHS-I card gives you the freedom to shoot, save and share more than ever before.\r\n\r\n', '51-czone.com.pk-1540-13938-261022103105.jpg', 'SanDisk', '256GB', 'Ultra-fast transfer rates', 'Enough space for many photos and videos', 'Lightweight and practical', 'High-tech, Speed up to 100MB/s**', '4800', ''),
(6, '', 'SanDisk Ultra microSD - 1TB | Up to 150MB/s Read Speed', '5', 2147483647, 'A memory card for better pictures, app performance and Full HD video\r\n\r\n', '3-czone.com.pk-1540-17729-250125094047.jpg', 'SanDisk', '1TB', 'Up to 150MB/s sequential read performance', 'microSDXC I interface', 'Ideal for Storage Expansion.', 'Space for Massive Media Collections', '22990', ''),
(7, '', 'SanDisk Extreme microSDXC UHS-I CARD - 512GB - SDSQXAV-512G-GN6MN - up to 190MB/s', '4', 2147483647, 'Gear that doesn’t limit your creativity\r\n\r\n', '21-czone.com.pk-1540-17538-191224082246.jpg', 'SanDisk', '512GB', 'Read speeds up to 190MB/s*', 'Write speeds of up to 130MB/s', 'Great for capturing 4K UHD Video*', 'Load apps faster with A2', '12000', ''),
(8, '', 'SanDisk Ultra microSD - 512GB | Up to 150MB/s Read Speed', '4', 2147483647, 'SDSQUAC-1T50-GN6MN\r\n\r\n', '54-czone.com.pk-1540-17361-201124011928.jpg', 'SanDisk', '512GB', 'Up to 150MB/s sequential read performance', 'microSDXC I interface', 'Ideal for Storage Expansion.', 'Space for Massive Media Collections', '10800', '');

-- --------------------------------------------------------

--
-- Table structure for table `memorycards_brand`
--

CREATE TABLE `memorycards_brand` (
  `id` int(11) NOT NULL,
  `memorycardsbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memorycards_brand`
--

INSERT INTO `memorycards_brand` (`id`, `memorycardsbrand`, `created_at`) VALUES
(5, '128GB', '2025-05-28 04:50:53'),
(6, '1TB', '2025-05-28 04:50:58'),
(7, '512GB', '2025-05-28 04:51:03'),
(8, '256GB', '2025-05-28 04:51:08'),
(10, '64GB', '2025-05-28 04:51:18');

-- --------------------------------------------------------

--
-- Table structure for table `memorycards_store`
--

CREATE TABLE `memorycards_store` (
  `id` int(11) NOT NULL,
  `memorycardsstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memorycards_store`
--

INSERT INTO `memorycards_store` (`id`, `memorycardsstore`, `created_at`) VALUES
(3, 'Kingston', '2025-05-28 04:50:15'),
(4, 'Lexar', '2025-05-28 04:50:20'),
(5, 'SanDisk', '2025-05-28 04:50:24');

-- --------------------------------------------------------

--
-- Table structure for table `monitor`
--

CREATE TABLE `monitor` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `inches` varchar(255) DEFAULT NULL,
  `lcdmonitor` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monitor`
--

INSERT INTO `monitor` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `inches`, `lcdmonitor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(10, '', 'ViewSonic VX2479-HD-PRO 24” 180Hz Gaming Monitor HDR10 IPS 1ms FreeSync Flicker-Free', '3', 2147483647, 'The ViewSonic VX2479-HD-PRO is a versatile 24-inch Full HD monitor designed to elevate your visual experience,whether you\'re working or gaming. With a high 180Hz refresh rate and lightning-fast 1ms MPRT response time', '6-czone.com.pk-1540-15925-230924073156.jpg', '23\" - 24\"', 'ViewSonic', 'Viewable Area (in.): 23.8 HDR10', 'Panel Type: IPS Technology', 'Resolution: 1920 x 1080', 'Response Time (MPRT): 1ms, FreeSync, Flicker-Free', 42990.00, 0.00),
(11, '', 'ViewSonic VX2779-HD-PRO 27” 180Hz 1ms FHD HDR10 Gaming Monitor', '3', 2147483647, 'The ViewSonic VX2779-HD-PRO is a versatile 27-inch Full HD monitor designed to elevate your visual experience,whether you\'re working or gaming. With a high 180Hz refresh rate and lightning-fast 1ms MPRT response time', '21-czone.com.pk-1540-15929-070524072032.jpg', '27\" - 28\"', 'ViewSonic', 'SuperClear® IPS panel', '180Hz Refresh rate delivers fluid visuals', 'Rapid 1ms MPRT for crisp image', 'AMD FreeSync™ eliminates screen tearing and reduce stuttering', 47990.00, 0.00),
(12, '10', 'ViewSonic VX2728 27” 180Hz Fast IPS Gaming Monitor FHD 0.5ms HDR10, AMD FreeSync™ Premium', '4', 2147483647, 'AMD FreeSync™ Premium for smooth gameplay\r\nVESA AdaptiveSync for tear-free gaming experience\r\nVESA ClearMR for clarity of action', '22-czone.com.pk-1540-16875-061224124051.jpg', '27\" - 28\"', 'ViewSonic', 'Fast IPS Display with HDR10', 'Rapid 0.5ms MPRT for crisp image', '180Hz refresh rate for smooth gameplay', 'Viewable Area (in.): 27 Resolution: 1920 x 1080', 54500.00, 60500.00),
(13, '', 'ViewSonic VA3209-MH 32” FHD Eye-Care Monitor with Built-In Speakers', '3', 2147483647, 'The ViewSonic VA3209-MH is a 32” Full HD monitor featuring HDMI and VGA inputs for business and home use. The optimal screen performance and comfortable viewing without tearing or stuttering is delivered through adaptive sync, eye-care technology, and var', 'va3209-2k-mhd-f01-pc-1540-15930-070524072807.jpg', '31\" - 32\"', 'ViewSonic', 'SuperClear® IPS panel', 'Full HD 1080p resolution', '3 side borderless bezel', 'Eye-care technology for comfortable viewing', 54990.00, 0.00),
(14, '', 'HP Series 5 527SF 27\" FHD Monitor - IPS 3-Sided Micro-Edge, 100Hz', '4', 2147483647, 'The HP Series 5 27-inch FHD Monitor gives you the flexibility to enjoy entertainment with its sleek, thin-and-light design, vibrant color, deep contrast ratio, and higher refresh rate* for a no-screen-tearing experience.\r\n\r\n', '1-czone.com.pk-1540-17023-021024070151.jpg', '27\" - 28\"', 'Hp', 'IPS, HP Eye Ease', '3-sided micro-edge', 'Detachable stand, 100Hz, 5ms GtG (with overdrive)*', 'FHD (1920 x 1080), HDMI, VGA', 53500.00, 0.00),
(15, '', 'HP M27f Monitor 27\" IPS FreeSync FHD IPS Eye Ease', '5', 0, 'The New Definition of High Definition: This FHD monitor feels as good as it looks, packing IPS technology for 178 degrees ultra-wide viewing angles, 99% sRGB color gamut for color accuracy, and AMD FreeSync™ to keep your eyes up to speed with your imagina', '10-czone.com.pk-1540-11775-250621111409.jpg', '27\" - 28\"', 'Hp', 'IPS, Low blue light mode, Anti-glare', 'FHD (1920 x 1080)', '1 VGA; 2 HDMI 1.4 (with HDCP support)', '5ms GtG (with overdrive)', 61500.00, 0.00),
(16, '', 'Samsung 24\" Essential Curved Monitor S3 S36C | LS24C360EAMXUE | 1800R Curved VA FHD 75Hz | Eye Saver Mode | FreeSync', '2', 2147483647, 'A more immersive viewing experience. The curved monitor wraps more closely around your field of vision to create a wider view which enhances depth perception and minimizes peripheral distractions, helping to better stay focused on what\'s on screen.\r\n\r\n', '7-czone.com.pk-1540-16312-270624084055.jpg', '23\" - 24\"', 'Samsung', 'Seamless gaming experience with AMD FreeSync', '75Hz Refresh rate', 'Game Mode, Eye Saver mode & Flicker Free, Eco Saving Plus', 'HDMI & D-sub', 30990.00, 0.00),
(17, '', 'Samsung 27\" Essential Monitor S3 S31C LS27C310EAMXZN | FHD IPS 5ms Borderless Design AMD FreeSync Game Mode, Comfortable Eye Care, HDMI & D-SUB', '3', 2147483647, 'See what\'s on-screen without distraction. The 3-sided borderless display brings a clean and modern aesthetic to any home office or working space.\r\n\r\n', '44-czone.com.pk-1540-16098-250524101239.jpg', '27\" - 28\"', 'Samsung', 'See from all angles with enhanced accuracy with IPS Panel.', '27\" IPS 5 (GTG)', 'Resolution 1,920 x 1,080', 'Refresh Rate Max 75Hz', 40990.00, 0.00),
(18, '', 'Samsung 25\" FHD Gaming Monitor IPS, 240Hz 1ms GTG LS25BG402, Nvidia G-Sync Compatible HDR10', '3', 0, 'Escape into reality-defying realism. You can see games like never before. IPS panel delivers clear colors and a wide 178º viewing angle for clarity from any viewpoint. With more pixels and greater depth, games are closer to reality than ever before.\r\n\r\n', 'czone.com.pk-1540-18000-110325081833.jpg', '24.5\" - 25.0\"', 'Samsung', 'Nvidia G-Sync compatible', 'HDR10', 'Eco Saving Plus', 'FreeSync Premium', 65990.00, 0.00),
(19, '', 'Samsung Odyssey G3 Gaming Monitor - 32\" VA 165Hz 1ms FHD, FreeSync Premium LS32AG320NMXZN', '4', 2147483647, 'Conquer every enemy, even at soaring speeds. 165Hz refresh rate eliminates lag and motion blur for exhilarating gameplay with ultra-smooth action.\r\n\r\n', '20-czone.com.pk-1540-14113-121222074708.jpg', '31\" - 32\"', 'Samsung', '165Hz Refresh rate, AMD FreeSync Premium, Height Adjustable Stand', '1ms response time (MPRT), AMD FreeSync Premium', 'Ergonomic design, 3-sided Borderless design', 'Eye Saver Mode & Flicker Free', 67990.00, 0.00),
(20, '', 'Samsung 27\" Odyssey Curved Gaming Monitor G55C | LS27CG552EUXEN | QHD 165Hz FreeSync VA Curved HDR10', '5', 2147483647, 'Experience incredibly realistic game worlds: The QHD resolution has a pixel density 1.7 times higher than Full HD.\r\n\r\n', '1-czone.com.pk-1540-16588-290724084249.jpg', '27\" - 28\"', 'Samsung', '1x HDMI, 1x DP port connection', 'QHD 165Hz AMD FreeSync 27\" VA 1ms', 'Curved 1000R', '2560 x 1440 1 (MPRT) HDR10', 72990.00, 0.00),
(21, '', 'Asus TUF Gaming VG249Q3A Gaming Monitor | 23.8\" FHD 180Hz IPS 1ms FreeSync Premium™', '3', 2147483647, 'TUF Gaming VG249Q3A Gaming Monitor – 24-inch(23.8 inch viewable), Full HD(1920x1080), 180Hz, Fast IPS, ELMB, 1ms (GTG), FreeSync Premium™, Variable Overdrive, 99% sRGB\r\n\r\n', '53-czone.com.pk-1540-16077-250524102716.jpg', '23\" - 24\"', 'Asus', 'Panel Size (inch) : 23.8', 'Panel Type : IPS, Refresh Rate (Max) : 180Hz', 'Color Space (sRGB) : 99%', 'Resolution : 1920x1080, Response Time : 1ms(GTG)', 47500.00, 0.00),
(22, '', 'ASUS ZenScreen MB16ACV Portable USB Monitor 16\" FHD IPS - USB Type-C', '5', 2147483647, '15.6-inch Full HD portable anti-glare IPS display with an ultraslim and thin design helps you get things done more efficiently when you’re on the go\r\n\r\n', '1-czone.com.pk-2-1540-16786-200824081058.jpg', '15\" - 15.6\"', 'Asus', 'Panel Size (inch) : 15.6', 'Backlight Type : LED', 'Panel Type : IPS', 'USB-C x 1 (DP Alt Mode & USB 3.2)', 90000.00, 0.00),
(23, '', 'Asus ROG Strix XG49WCR Ultra-wide Gaming Monitor 49\" Double QHD (5120 x 1440) Curved, 165Hz OC ELMB Sync, DisplayHDR 400, USB Type-C, Smart KVM', '5', 0, 'ROG Strix XG49WCR Super Ultra-wide Gaming Monitor — 49”, Double QHD 32:9 (5120 x 1440), Curved, 165Hz OC (above 144Hz), ELMB Sync, DisplayHDR 400, 90% DCI-P3, DisplayPort 1.4, USB Type-C, Smart KVM, DisplayWidget, RJ-45.\r\n\r\n', '8-czone.com.pk-1540-16078-230524113601.jpg', '49\"', 'Asus', 'Panel Size (inch) : 49', 'Panel Type : VA', 'Curvature : 1800R, Color Space (sRGB) : 120%', 'Resolution : 5120x1440', 325000.00, 0.00),
(24, '', 'Asus ROG Swift OLED PG49WCD Curved Gaming Monitor | 49\" (5120x1440) Curved QD-OLED Panel, 144 Hz, 0.03 ms, G-SYNC® Compatible, ROG Smart KVM, 90 W Type-C, VESA DisplayHDR 400 True Black', '5', 2147483647, '49-inch curved super-ultrawide (5120 x 1440) QD-OLED gaming monitor with 144 Hz refresh rate and 0.03 ms response time for immersive gaming\r\n\r\n', '44-czone.com.pk-1540-17244-041124100245.jpg', '49\"', 'Asus', '49-inch 1800R 144Hz QD-OLED', '1000 nits peak brightness (3% with HDR on)', '0.03 ms response time', '99% DCI-P3, Delta E < 2', 418000.00, 0.00),
(25, '', 'ASUS ROG Swift PG43UQ 43\" Gaming Monitor - DSC G-SYNC Compatible - 4K UHD, 144Hz', '5', 0, 'ROG Swift PG43UQ DSC G-SYNC Compatible Gaming Monitor — 43-inch 4K UHD (3840 x 2160), 144Hz, G-Sync compatible ready, DSC, DisplayHDR™ 1000, DCI-P3 90%, Adaptive Sync, Shadow Boost.\r\n\r\n', '5-czone.com.pk-1540-13595-260822024733.jpg', '43\"', 'Asus', '43-inch 4K UHD (3840 x 2160) gaming monitor', 'Supports Display Stream Compression Technology', 'ASUS Extreme Low Motion Blur technology', 'High dynamic range (HDR) technology with DisplayHDR™ 1000 certification', 295000.00, 0.00),
(26, '22', 'MSI G255F 25\" FHD Rapid IPS Gaming Monitor, 180Hz 1ms Adaptive Sync', '3', 2147483647, 'Visualize your victory with the MSI G255F gaming monitor. Equipped with a 1920x1080, 180Hz Refresh rate, 1ms(GtG) response time Rapid IPS panel, the G255F will give you the competitive edge you need to take down your opponents.\r\n\r\n', '1-czone.com.pk-1540-16479-230724110141.jpg', '24.5\" - 25.0\"', 'MSI Monitors', '24.5” (62.2cm)', 'Rapid IPS', '1920 x 1080 (FHD)', '180Hz, AMD FreeSync™', 37990.00, 49000.00),
(27, '', 'MSI MAG 342CQR E2 Gaming Monitor 34\" Curve 1500R, 3440 x 1440 (UWQHD), 180Hz, 1ms (MPRT), Adaptive-Sync, HDR Ready, VA Panel', '4', 2147483647, 'The MSI ARSENAL GAMING (MAG) series is engineered to give gamers the edge they need to dominate on the virtual battlefield. Inspired by the rugged durability and unwavering reliability of military-grade equipment, the MAG series is built to provide an unw', '13-czone.com.pk-1540-16965-190924112020.jpg', '34\"', 'MSI Monitors', '34\" (86.36 cm) VA', '3440 x 1440 (UWQHD)', '180Hz', '1ms (MPRT), Adaptive-Sync', 115000.00, 0.00),
(28, '', 'MSI MPG 341CQPX QD-OLED 34-inch Curved OLED Gaming Monitor', '5', 2147483647, '3440 x 1440 (UWQHD), 0.03ms Response time, 240Hz, True Black HDR 400, HDMI, DP Port, USB Type C, Tilt, Height Adjustable\r\n\r\n', '14-czone.com.pk-1540-17871-230225030408.jpg', '34\"', 'MSI Monitors', '34.18“ (86.82cm) 1800R QD-OLED', '240Hz', '0.03ms (GTG)', 'G-Sync Compatible, DisplayHDR True Black 400', 409990.00, 0.00),
(29, '', 'Lenovo L24i-4B Monitor | 23.8\" FHD IPS 100Hz, 99% sRGB', '2', 2147483647, 'EPEAT™ Gold, Energy star, TÜV Rheinland® Eye Comfort\r\n\r\n', '127-czone.com.pk-1540-17850-190225010739.jpg', '23\" - 24\"', 'Lenovo', '23.8\" FHD (1920x1080) IPS display, Anti-glare 16:9', '1300:1, 99% sRGB, 8-bit', 'Up to 100Hz refresh rate', '2 x 3W speakers', 39990.00, 0.00),
(31, '', 'Lenovo L24i-4B Monitor | 43\" FHD IPS 100Hz, 99% sRGB', '3', 2147483647, 'EPEAT™ Gold, Energy star, TÜV Rheinland® Eye Comfort\r\n\r\n', '10-czone.com.pk-1540-12130-160921045827.jpg', '43\"', 'Lenovo', '43\" FHD (1920x1080) IPS display, Anti-glare 16:9', '1300:1, 99% sRGB, 8-bit', 'Up to 100Hz refresh rate', '2 x 3W speakers', 39990.00, 0.00),
(32, '', 'ViewSonic TD1655 15.6” USB-C Multi-Touch Portable Monitor FHD IPS', '3', 2147483647, '10-point multitouch technology for a more intuitive screen control\r\n\r\n', '48-czone.com.pk-1540-17223-011124111109.jpg', '15\" - 15.6\"', 'ViewSonic', 'Viewable Area (in.): 15.6', 'Panel Type: IPS Technology', 'Resolution: 1920 x 1080', 'Response Time (Typical GTG): 6.5ms', 79900.00, 0.00),
(33, '10', 'AOC 27G4E 27\" Fast IPS Gaming Monitor | FHD 180Hz 0.5ms HDR10 Adaptive Sync', '3', 2147483647, 'Only for the true valiant! This AOC 27G4E gaming monitor is made with a fast IPS panel, equipped with Adaptive-Sync technology, guaranteeing you unbeatable gaming experience with 0.5ms response time and 180 Hz refresh rate.\r\n\r\n', '13-czone.com.pk-1540-16602-300724094815.jpg', '27\" - 28\"', 'AOC', 'Fast IPS 1920 × 1080 (FHD)', '180Hz 0.5ms', 'Adaptive Sync HDR10', 'Enjoy top-tier Gaming Performance', 54990.00, 61000.00),
(34, '', 'AOC 27G42E 27\" Fast IPS Gaming Monitor 180Hz FHD 0.5ms', '4', 2147483647, 'Only for the true valiant! 27G42E is a 27 inch gaming monitor with Fast IPS, Adaptive Sync, 180HZ, 0.5ms Responsive time, Super color, HDR10, MBR Sync, HDMI2.0, DisplayPort1.4 and Flicker Free.\r\n\r\n', 'czone.com.pk-5-1540-18027-200325052057.jpg', '27\" - 28\"', 'AOC', 'Fast IPS, Adaptive Sync', '180Hz', '1920 × 1080 (FHD)', '0.5ms - Super color', 56500.00, 0.00),
(35, '', 'AOC Q32V5CE 31.5\" WQHD Monitor | VA Freesync', '4', 2147483647, 'The AOC Q32V5CE is a 32” VA panel with QHD resolution for comfortable and outstanding viewing experience in a three-side frameless chassis. Ready to boost your productivity with USB-C with Power Delivery up to 65W, 4 USB ports & HDMI, while also offering ', '1-czone.com.pk-1540-16036-170524101050.jpg', '31\" - 32\"', 'AOC', '31.5 2560x1440 VA', 'Freesync - USB-C 3.2 x 1 - Low Blue Light - Flicker Free', '3-Sided Frameless', 'USB HUB', 73990.00, 0.00),
(36, '', 'AOC C32G2ZE Gaming Monitor | 31.5\" Curved 1500R FHD VA 240Hz 0.5ms MPRT, Freesync Premium, Flicker Free, 3-Sided Frameless', '4', 2147483647, 'Unleash Your Potential\r\n\r\n', '1-czone.com.pk-1-1540-17407-271124083404.jpg', '31\" - 32\"', 'AOC', '31.5 Curved 1500R', '1920x1080 FHD', 'VA 240 Hz WLED 0.5 ms', 'Freesync Premium', 74990.00, 0.00),
(37, '', 'AOC 27G2Z 27\" 240Hz HDR Gaming Monitor IPS FHD, FreeSync Premium, DisplayHDR 400', '4', 2147483647, 'Get smooth and detailed gameplay with the 27G2Z 27\" 240 Hz HDR Gaming Monitor in black, silver, and red from AOC.\r\n\r\n', '17-czone.com.pk-1540-14862-280823092429.jpg', '27\" - 28\"', 'AOC', '27\" 16:9 IPS Panel Full HD 1920 x 1080 at 240 Hz', 'Become a Gaming-Optimized Weapon for your Team with 240Hz and 0.5ms', 'VESA Certified DisplayHDR 400', 'FreeSync Premium delivers ultra-smooth tear-free gaming', 85900.00, 0.00),
(38, '', 'LG 34GS95QE-B 34\" Curved UltraGear OLED WQHD 240Hz Gaming Monitor', '5', 2147483647, 'The 34\" UltraGear OLED’s steep and dramatic 800R curve surrounds you in the action\r\nOutrageous OLED gaming speed at up to 240Hz\r\n', 'file-1540-16375-110724102708.jpg', '34\"', 'LG', 'Resolution 3440 x 1440', 'Refresh Rate 240Hz', 'HDMI 2.1', 'DisplayPort 1.4. Both', 385000.00, 0.00),
(39, '', 'LG 34GS95QE-B 34\" Curved UltraGear OLED WQHD 240Hz Gaming Monitor', '5', 2147483647, 'Display HDR True Black400 NVIDIA G-SYNC compatibility\r\nAMD FreeSync Premium Pro displays a fluid virtually tear-free gaming experience\r\n\r\n', '7-czone.com.pk-1540-17646-150125064958.jpg', '24.5\" - 25.0\"', 'LG', 'Resolution 3440 x 1440', 'Refresh Rate 240Hz', 'HDMI 2.1', 'DisplayPort 1.4. Both', 390000.00, 0.00),
(40, '', 'ViewSonic VX2480-2K-SHD 24\" 2K QHD IPS Entertainment Monitor', '3', 2147483647, 'The ViewSonic VX2480-2K-SHD features a pixel dense, 24” QHD IPS display with incredible colors and contrast.', '22-czone.com.pk-1540-14572-100423074849.jpg', '23\" - 24\"', 'ViewSonic', 'QHD resolution for incredible detail', 'SuperClear® IPS Technology', '75Hz Refresh Rate', 'In-built Cable Management - HDMI and DisplayPort connectivity', 63990.00, 0.00),
(41, '', 'AOC 24G42E 23.8\" Fast IPS Gaming Monitor 0.5ms MPRT FHD', '2', 2147483647, 'Rule the Competition with Fast IPS\r\n\r\n', '10-czone.com.pk-1-1540-17721-240125083857.jpg', '23\" - 24\"', 'AOC', '23.8\" (IPS)', '0.5ms MPRT / 1ms GtG', '1920 × 1080 @ 180Hz ? DisplayPort, HDMI', 'Adaptive Sync HDR 10', 39990.00, 0.00),
(42, '', 'MSI MAG 256F 24.5\" Rapid IPS FHD Gaming Monitor, 180Hz, 1ms (GtG), Adaptive-Sync', '3', 2147483647, 'Visualize your victory with MSI MAG 256F gaming monitor. Equipped with a 180Hz Refresh rate, 1ms GtG response time panel, MAG 256F will give you the competitive edge you need to take down your opponents.', 'czone.com.pk-2-1540-18028-210325105323.jpg', '24.5\" - 25.0\"', 'MSI Monitors', '24.5\" (62.2cm), Adaptive-Sync', 'Rapid IPS', '1920 x 1080 (FHD)', '180Hz 1ms (GtG)', 42990.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `motherboard`
--

CREATE TABLE `motherboard` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motherboard`
--

INSERT INTO `motherboard` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Gigabyte H510M H V2 DDR4 Intel® Ultra Durable Motherboard, GbE LAN, LGA1200', '3', 2147483647, 'Supports 11th/10th Gen Intel® Core™ Processors\r\n\r\n', '2-czone.com.pk-1540-17298-131124082243.jpg', 'Intel LGA-1700', 'Gigabyte', 'Dual Channel Non-ECC Unbuffered DDR4, 2 DIMMs', '8-Channel HD Audio with High Quality Audio Capacitors', 'NVMe PCIe Gen3 x4 2280 M.2 Connector', 'GbE LAN with Bandwidth Management', '24990', ''),
(4, '', 'MSI PRO H610M-E Intel Motherboard | DDR5 LGA1700', '3', 2147483647, 'PRO series helps users work smarter by delivering an efficient and productive experience. Featuring stable functionality and high-quality assembly, PRO series motherboards provide not only optimized professional workflows but also less troubleshootin', '10-czone.com.pk-1540-15899-030524083153.jpg', 'Intel LGA-1700', 'MSI', 'Lightning Gen 4 PCI-E', 'Support Intel® Core™ 14th/ 13th/ 12th Gen Processors', 'LGA 1700 Socket', 'Memory Boost: Advanced technology', '27000', '0'),
(5, '', 'MSI PRO B760M-E Intel LGA 1700 DDR5 Motherboard', '5', 2147483647, 'The PRO Series is tailored to professionals from all walks of life. The lineup features impressive performance and high quality, while aiming to provide users incredible experience. Users who care about productivity and efficiency can definitely coun', '10-czone.com.pk-1540-15832-250324074833.jpg', 'Intel LGA-1700', 'MSI', 'Lightning Gen 4 PCI-E With Steel Armor', 'Support Intel® Core™ 14th/ 13th/ 12th Gen Processors', 'Supports DDR5 Memory, Dual Channel DDR5 6400+MHz (OC)', 'PCIe 4.0, Lightning Gen4 x4 M.2', '40990', ''),
(6, '', 'ASUS Prime B860M-K-CSM Intel Core Ultra Motherboard, LGA 1851, Advanced AI PC-Ready, Aura Sync, DDR5', '5', 2147483647, 'ASUS PRIME series motherboards are expertly engineered to unleash the full potential of the latest Intel® Core™ Ultra Processors (Series 2).\r\n\r\n', 'czone.com.pk-4-1540-18319-200525075124.jpg', 'Intel LGA 1851 Socket', 'Asus', 'AEMP III for enhanced DDR5 performance', 'USB 10Gbps Type-A', 'AI Solutions - 2.5Gb Ethernet - Aura Sync', 'USB 5Gbps Type-C® - PCIe 5.0 M.2', '53000', ''),
(7, '', 'ASUS TUF Gaming Z890-PRO WiFi LGA 1851 ATX Motherboard', '5', 2147483647, 'ASUS TUF GAMING Z890-PRO WIFI takes all the essential elements of the latest Intel® Core™ Ultra Processors (Series 2) processors and combines them with game-ready features and proven durability.\r\n\r\n', 'czone.com.pk-1540-18082-050425100308.jpg', 'Intel LGA 1851 Socket', 'Asus', 'Complete AI Solution', 'Intelligent Overclocking', 'NPU Boost', 'Intel® Core™ Ultra Series 2 Ready', '107500', ''),
(8, '', 'MSI MAG Z890 Tomahawk WiFi Gaming Motherboard Intel LGA1851 DDR5', '5', 2147483647, 'Supports Core Ultra Series 2 Intel Processors\r\n\r\n', '6-czone.com.pk-1-1540-17881-270225104652.jpg', 'Intel LGA 1851 Socket', 'MSI', 'PCIe 5.0, M.2', 'SATA, 5Gbps LAN', 'USB Type-C, Wi-Fi 7', 'Bluetooth 5.4, Thunderbolt 4, ATX', '118000', ''),
(9, '9', 'Asus TUF GAMING A620M-PLUS WIFI AMD AM5 Motherboard DDR5 WiFi 6', '4', 2147483647, 'ASUS TUF GAMING A620M-PLUS WIFI takes all the essential elements of AMD Ryzen 7000-series processors and combines them with game-ready features and proven durability.\r\n\r\n', 'czone.com.pk-11-1540-18081-050425095624.jpg', 'AMD AM5 Socket', 'Asus', 'PCIe 4.0 for M.2 storage', 'DDR5 memory module support', 'Front-panel USB 3.2 Gen 1 Type-C®', '2.5 Gb Ethernet, WiFi 6', '40990', '45000'),
(10, '', 'MSI MPG X870E Carbon WiFi Gaming Motherboard | AM5, DDR5', '5', 2147483647, 'MSI MPG X870E Carbon WiFi Gaming Motherboard (AMD Ryzen 9000/8000/7000 Series Processors, AM5, DDR5, PCIe 5.0, M.2 Gen5, SATA 6Gb/s, USB 40Gbps, HDMI, Wi-Fi 7, Bluetooth 5.4, 5Gbps LAN, ATX)\r\n\r\n', '9-czone.com.pk-1540-17581-070125080438.jpg', 'AMD AM5 Socket', 'MSI', 'Supports AMD Ryzen 9000/8000/7000 Series Desktop Processors', 'EZ PCIe Release', 'Frozr Guard', 'Supports DDR5 Memory, Dual Channel DDR5 8400+ MT/s (OC)', '168990', ''),
(11, '', 'MSI A520M-A PRO Gaming Motherboard AMD AM4', '4', 2147483647, 'Supports AMD Ryzen™ 5000 Series, 5000 G-Series, 4000 G-Series, 3000 Series and 3000 G-Series processors\r\n\r\n', '32-czone.com.pk-1540-16318-270624105031.jpg', 'AMD AM4 Socket', 'MSI', 'AMD Socket AM4', 'AMD® A520 Chipset', 'Supports DDR4 Memory, up to 4600(OC) MHz', 'Audio Boost: Reward your ears with studio grade sound quality', '22000', ''),
(12, '', 'Asus TUF GAMING B650M-PLUS WIFI AMD Motherboard WiFi 6', '5', 2147483647, 'ASUS TUF GAMING B650M-PLUS WIFI takes all the essential elements of the latest AMD Ryzen 7000-series processors and combines them with game-ready features and proven durability.\r\n\r\n', '23-czone.com.pk-1540-10467-041023103558.jpg', 'AMD AM4 Socket', 'Asus', '12+2 power stages (rated 60A) with enlarged VRM heatsinks', 'PCIe® 5.0 for M.2 storage', 'DDR5 memory module support', '2.5 Gb Ethernet - WiFi 6', '55990', '');

-- --------------------------------------------------------

--
-- Table structure for table `motherboard_brand`
--

CREATE TABLE `motherboard_brand` (
  `id` int(11) NOT NULL,
  `motherboardbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motherboard_brand`
--

INSERT INTO `motherboard_brand` (`id`, `motherboardbrand`, `created_at`) VALUES
(3, 'MSI', '2025-05-28 05:11:59'),
(4, 'Gigabyte', '2025-05-28 05:12:04'),
(5, 'Asus', '2025-05-28 05:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `motherboard_store`
--

CREATE TABLE `motherboard_store` (
  `id` int(11) NOT NULL,
  `motherboardstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motherboard_store`
--

INSERT INTO `motherboard_store` (`id`, `motherboardstore`, `created_at`) VALUES
(3, 'Intel LGA-1700', '2025-05-28 05:11:36'),
(4, 'AMD AM5 Socket', '2025-05-28 05:11:39'),
(5, 'Intel LGA 1851 Socket', '2025-05-28 05:11:43'),
(6, 'AMD AM4 Socket', '2025-05-28 05:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `mouse`
--

CREATE TABLE `mouse` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mouse`
--

INSERT INTO `mouse` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Logitech B100 Optical USB Mouse', '2', 2147483647, 'It works right out of the box. This plug-and-play mouse is simple to set up—you just plug it into your USB and get back to business.\r\n\r\n', '1-czone.com.pk-1540-1117-180222055507.jpg', 'Logitech', 'Logitech', 'Ready in No Time', 'Comfort for Either Hand', 'Durable and Reliable', 'Broad Compatibility', '990', ''),
(4, '', 'Logitech MX Master 3S Mouse Graphite | Master Series', '5', 2147483647, 'Meet MX Master 3S – an iconic mouse remastered. Feel every moment of your workflow with even more precision, tactility, and performance, thanks to Quiet Clicks and an 8,000 DPI track-on-glass sensor.\r\n\r\n', 'copy-32-czone.com.pk-1540-14140-191222102035.jpg', 'Logitech', 'Logitech', 'Feel It – Barely Hear It', '8K DPI Any-Surface Tracking', 'Scroll 1,000 Lines Per Second', 'Do More with Logi Options+', '25500', ''),
(5, '', 'Logitech G502 X Gaming Mouse, Hero 25K Sensor, Wired, White - 910-006148', '5', 2147483647, 'G502 X is the latest addition to the legendary G502 lineage. Redesigned to achieve an impressive weight reduction down to 89 grams. Featuring our first-ever LIGHTFORCE hybrid optical-mechanical switches and HERO 25K sub-micron sensor.\r\n\r\n', '6-czone.com.pk-1540-14629-020523084117.jpg', 'Logitech', 'Logitech', 'Lightforce Switches: Hybrid Optical X Mechanical', 'Lightweight 89 Grams', 'Dual-Mode Scroll Wheel', 'Hero 25K Sensor', '16700', ''),
(6, '', 'Bloody W95 Max Naraka Extra Fire Gaming Mouse - Ultra Core Activated', '5', 2147483647, 'The A4Tech W95 Max Bloody mouse is the optimal solution for those looking for a high-quality and productive mouse. It has all the necessary functions for effective performance of tasks and enjoyment of the game.\r\n\r\n', '47-czone.com.pk-1540-14945-020823100304.jpg', 'A4 Tech Mouse', 'A4Tech', 'BC3332-A Sensor - 2000 Hz Report Rate', 'RGB Animation Backlit - Precision Control Key', '4 Types LOD Setting Switch - Extra Fire Button', '4M Onboard Memory - Extra Fire Wheel', '5850', ''),
(7, '', 'Bloody Cypher Ghost R73 Duo Ultra Wireless Gaming Mouse', '5', 2147483647, 'The Bloody R73 Ultra Duo Dual Mode Wireless Gaming Mouse - Cypher Ghost is a high-performance gaming mouse designed for precision and speed. It features dual-mode connectivity (2.4GHz wireless + USB Type-C wired), an Alpha 20K Engine sensor with 20,0', 'czone.com.pk-26-1540-18304-170525073924.jpg', 'A4 Tech Mouse', 'A4Tech', 'Alpha 20K Engineered Engine', '1000 Hz Report Rate', 'L++ Multi-Function Receiver Dock', 'USB to Type-C Adaptor', '9500', ''),
(8, '', 'HP 240 Bluetooth Mouse | Black', '4', 2147483647, 'With 1,600 DPI for super accurate tracking\r\n\r\n', '38-czone.com.pk-1540-16613-310724083102.jpg', 'HP Mouse', 'HP', 'With Bluetooth 5.1 wireless connectivity', 'Sleek and ambidextrous design', 'Up to 15 months battery life', 'Red optical tracking Sensor Technology', '3650', ''),
(9, '', 'MSI CLUTCH GM11 Gaming Mouse', '5', 2147483647, 'MSI Clutch GM11 Gaming Mouse, 5000 DPI, 10M Omron Switches, Optical Sensor, Symmetrical Ergonomic Design, RGB Mystic Light Compatible, PC/Mac,graphite\r\n\r\n', '3-czone.com.pk-1540-17584-080125080714.jpg', 'MSI', 'MSI', 'Stunning RGB lighting with over 7 lighting effects', '5-level DPI sensor matches with 5 different colors', 'Symmetrical mouse design', 'Fine-tune detail settings with Dragon Center', '5900', ''),
(10, '', 'Apple Magic Mouse USB-C Black Multi-Touch Surface - 2024 - MXK63', '5', 2147483647, 'Magic Mouse is wireless and rechargeable, with an optimized foot design that lets it glide smoothly across your desk.\r\n\r\n', '4-czone.com.pk-1540-17610-110125072423.jpg', 'Apple', 'Apple', 'USB-C Port', 'Wireless and Rechargeable', 'Multi-Touch Surface for Gestures', 'Pairs Automatically with Mac', '35000', '');

-- --------------------------------------------------------

--
-- Table structure for table `mouse_brand`
--

CREATE TABLE `mouse_brand` (
  `id` int(11) NOT NULL,
  `mousebrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mouse_brand`
--

INSERT INTO `mouse_brand` (`id`, `mousebrand`, `created_at`) VALUES
(3, 'MSI', '2025-05-28 05:27:29'),
(4, 'Logitech', '2025-05-28 05:27:38'),
(5, 'HP', '2025-05-28 05:27:45'),
(6, 'Apple', '2025-05-28 05:27:48'),
(7, 'A4Tech', '2025-05-28 05:27:51');

-- --------------------------------------------------------

--
-- Table structure for table `mouse_store`
--

CREATE TABLE `mouse_store` (
  `id` int(11) NOT NULL,
  `mousestore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mouse_store`
--

INSERT INTO `mouse_store` (`id`, `mousestore`, `created_at`) VALUES
(3, 'Logitech', '2025-05-28 05:26:00'),
(4, 'A4 Tech Mouse', '2025-05-28 05:26:06'),
(5, 'HP Mouse', '2025-05-28 05:26:11'),
(6, 'Apple', '2025-05-28 05:26:15'),
(7, 'MSI', '2025-05-28 05:27:10');

-- --------------------------------------------------------

--
-- Table structure for table `network`
--

CREATE TABLE `network` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `np` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `network`
--

INSERT INTO `network` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `np`, `type`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(4, '', 'D-Link CAT-4, 2.5-Meter Networking Cable UTP, 9.8ft NCB-C6UBLUR1-3 Patch Cord', '2', 2147483647, 'Cat4 UTP Patch Cord\r\n\r\n', 'copy-czone81ei4drchpl.-sl1500-.jpg-1540-7643-250219093406.jpg', 'D-Link', 'Patch Cords', '4 Pairs Unshielded Twisted Pair (UTP) Cable', 'Conductor Metal: Solid Bare Copper', 'Jacket Material: PVC UL94V-0/LSZH', 'Cable Diameter: 6mm Nominal', 750.00, 0.00),
(5, '', 'Google Nest WiFi Router 3 Pack (2nd Generation) - AC2200 - Mesh', '4', 0, 'Google Nest WiFi Router 3 Pack (2nd Generation) – 4x4 AC2200 Mesh Wi-Fi Routers with 6600 Sq Ft Coverage. Nest Wifi is a scalable and flexible Wi-Fi system These Nest Wifi devices work together to blanket your whole home in fast, reliable Wi-Fi and elimin', '7-czone.com.pk-1540-10137-071022103140.jpg', 'Google', 'Range Extender', 'Whole-home coverage* Up to 6600 square feet', 'Perfect for Large homes', 'Included 3 routers (No points required)', 'Ethernet ports 6 total Ethernet ports; All Nest/Google Wifi Devices', 76990.00, 0.00),
(6, '', 'Google Nest WiFi Pro Wi-Fi 6E Reliable Home Wi-Fi System with Fast Speed and Whole Home Coverage Mesh Router. 2 Pack, Snow', '4', 2147483647, 'Nest Wifi Pro is up to 2x faster than Wi-Fi 6, so you get super fast speeds and a reliable connection for your entire home*\r\n\r\n', '30-czone.com.pk-1540-17658-160125075634.jpg', 'Google', 'Range Extender', 'Two Wi-Fi routers provide up to 4400 square feet of fast, reliable WiFi*', 'Nest Wifi Pro uses the latest, most advanced Wi-Fi 6E technology*', 'Nest Wifi Pro automatically adjusts your Wi-Fi network’s performance', 'It has built-in technology to make sure your connection is strong', 105000.00, 0.00),
(8, '', 'Vention CAT6 UTP Ethernet Patch Cable 1m IBRBF', '3', 2147483647, '1000 MBPS\r\n\r\n', 'copy-copy-copy-copy-23-czone.com.pk-1540-17628-140125092740.jpg', 'Vention', 'Patch Cords', 'High-Speed Transmission', 'UTP Design', 'Durable Build', 'Convenient Length', 600.00, 0.00),
(9, '', 'TP-Link LS1005 5-Port 10/100Mbps Desktop Switch - Ver 1.0', '3', 2147483647, 'TP-Link LS1005 | 5× 10/100Mbos Auto-Negotiation RJ45 port, supporting Auto-MDI/MDIX\r\n\r\n', 'ls1005-01-large-1563262851927i-1540-9014-281220092842.jpg', 'TP-Link', 'Switches', 'Green Ethernet technology saves power', 'IEEE 802.3X flow control provides reliable data transfer', 'Plastic casing and desktop design', 'Plug and play, no configuration needed', 2150.00, 0.00),
(10, '', 'TP-Link LS1008 8-Port 10/100Mbps Desktop Network Switch | Ver 1.0', '3', 2147483647, 'The TP-Link LiteWave Series Unmanaged Switches provide an easy and affordable way to expand your wired network. They are easy to use and reliable. With these plug-and-play switches, you can expand your network connections to multiple devices instantly. Wi', '18-czone.com.pk-1540-11290-190321072654.jpg', 'TP-Link', 'Switches', 'Green Ethernet technology saves power', 'IEEE 802.3X flow control provides reliable data transfer', 'Plastic casing and desktop design', 'Plug and play, no configuration needed', 2390.00, 0.00),
(11, '', 'Tplink TL-WN823N 300Mbps Mini Wireless N USB Adapter', '3', 2147483647, 'TP-LINK\'s 300Mbps Mini Wireless N USB Adapter TL-WN823N is designed to connect your laptop or desktop to a wireless network and enjoy high speed wireless performance.\r\n\r\n', '1-czone.com.pk-1540-1236-171022100045.jpg', 'TP-Link', 'Wireless Adapter', '300Mbps Wireless N Speed – Extend Wireless Coverage', 'Easy to Install', 'Soft AP', 'WPS', 2500.00, 0.00),
(12, '', 'TP-Link TG-3468 Gigabit PCI Express Network Adapter', '4', 0, 'TG-3468 10/100/1000Mbps Gigabit PCIe Network Adapter is a highly integrated and cost-effective 32-bit Gigabit PCIe Ethernet Adapter which is fully compliant with IEEE 802.3, IEEE 802.3u and IEEE 802.3ab specifications.\r\n\r\n', 'tg-3468un2.0-01-1540-6069-071217101839.jpg', 'TP-Link', 'Ethernet Adapter', '10/100/1000Mbps PCIe Adapter', '32-bit PCIe interface, saving the finite chassis space', 'Wake-on-LAN, convenient to manage over LAN', '', 2990.00, 0.00),
(15, '', 'Vention CAT6 UTP Ethernet Patch Cable 2m IBRBH', '3', 2147483647, '1000 MBPS\r\n\r\n', 'copy-copy-copy-copy-23-czone.com.pk-1540-17628-140125092740.jpg', 'Vention', 'Patch Cords', '', '', NULL, NULL, 770.00, 0.00),
(16, '', 'D-Link CAT-6, 3-Meter Networking Cable UTP, 9.8ft NCB-C6UBLUR1-3 Patch Cord', '3', 2147483647, 'Cat6 UTP Patch Cord\r\n\r\n', 'copy-czone81ei4drchpl.-sl1500-.jpg-1540-7643-250219093406.jpg', 'D-Link', 'Patch Cords', '4 Pairs Unshielded Twisted Pair (UTP) Cable', 'Conductor Metal: Solid Bare Copper', 'Jacket Material: PVC UL94V-0/LSZH', 'Cable Diameter: 6mm Nominal', 950.00, 0.00),
(17, '', 'Vention CAT6 UTP Ethernet Patch Cable 3m IBRBI', '3', 2147483647, '1000 MBPS\r\n\r\n', 'copy-copy-copy-copy-23-czone.com.pk-1540-17628-140125092740.jpg', 'TP-Link', 'Patch Cords', '', '', NULL, NULL, 860.00, 0.00),
(18, '', 'Vention CAT6 UTP Ethernet Patch Cable 5m IBRBJ', '3', 2147483647, '1000 MBPS\r\n\r\n', 'copy-copy-copy-copy-23-czone.com.pk-1540-17628-140125092740.jpg', 'TP-Link', 'Patch Cords', '', '', NULL, NULL, 1340.00, 0.00),
(19, '', 'Vention Cat6 UTP Patch Cable 15M Black IBRBN', '4', 2147483647, 'Manufacturer code: IBRBN\r\n\r\n', 'copy-copy-copy-copy-23-czone.com.pk-1540-17628-140125092740.jpg', 'TP-Link', 'Patch Cords', '', '', NULL, NULL, 1920.00, 0.00),
(20, '', 'TP-Link TL-WR844N 300 Mbps Multi-Mode Wi-Fi Router | Ver 1.0', '3', 2147483647, 'High-Speed Wi-Fi- 300 Mbps wireless transmission rate is ideal for both bandwidth sensitive tasks and basic work.\r\n\r\n', 'tl-wr844neu2.webp', 'TP-Link', 'Wireless Adapter', 'Wi-Fi 4 IEEE 802.11n/b/g 2.4 GHz', 'Boosted Coverage', 'Multi-Mode 4 in 1', 'Parental Controls', 3090.00, 0.00),
(21, '', 'TP-Link EAP110 N300 Wireless N Ceiling Mount Access Point', '4', 0, 'The EAP’s elegant appearance and easy mounting design with chassis make it easy to be integrated seamlessly into any wall or ceiling surface to blend in with most interior decorations. EAP110 supports Passive PoE to make deployment effortless and flexible', '14-czone.com.pk-1540-13730-170922052916.jpg', 'TP-Link', 'Access Points | Indoor', 'Business Class Ceiling Mount Access Point', 'Flexible Placement', 'Cloud Centralized Management - Anytime, Anywhere', 'Efficient Guest Authentication with Facebook and SMS Support', 8300.00, 0.00),
(22, '', 'TP-Link EAP115-Wall 300Mbps Wireless N Wall-Plate Access Point Ver 1.20 EU', '3', 2147483647, 'The EAP115-Wall would blend seamlessly into any business setting with a refined, minimalist appearance. A slimline design includes a casing that’s just 11 mm in thickness.\r\n\r\n', '9-czone.com.pk-1540-13897-250123094842.jpg', 'TP-Link', 'Access Points | Indoor', 'Subtle Wall Design, Excellent Wi-Fi Access', 'Installation Made Easy', 'Effortless Deployment', 'Complete Wireless Coverage', 8950.00, 0.00),
(23, '', 'TP-Link EAP610 AX1800 Wireless Dual Band Ceiling Mount Access Point | Omada Mesh | PoE+ Powered', '5', 2147483647, 'Easily Upgrade to Business WiFi 6 Network. The Omada Software Defined Networking (SDN) platform integrates network devices, including access points, switches, and routers. It provides 100% centralized cloud management and creates a highly scalable network', '34-czone.com.pk-1540-14755-270523110606.jpg', 'TP-Link', 'Access Points | Indoor', 'Ultra-Fast WiFi 6 Speeds', 'High-Efficiency WiFi 6', 'Centralized Cloud Management', 'Seamless Roaming | Secure Guest Network', 26500.00, 0.00),
(24, '', 'TP-Link EAP653 AX3000 Ceiling Mount WiFi 6 Access Point', '5', 2147483647, 'AX3000 Ceiling Mount WiFi 6 Access Point.\r\n\r\n', '22-czone.com.pk-1540-16678-060824095749.jpg', 'TP-Link', 'Access Points | Indoor', 'High-Efficiency WiFi 6, AX3000 WiFi 6 Speed', 'Ultra-Slim Design', 'PoE+ Powered', 'Omada Mesh Technology*', 32500.00, 0.00),
(25, '', 'TP-Link OC200 Omada Hardware Controller', '4', 2147483647, 'OC200, the professional on-premises hardware controller for the Omada Software Defined Networking (SDN) platform, provides 100% centralized management of Omada access points, JetStream switches, and Omada routers—all controlled from a single interface.\r\n', '5-czone.com.pk-1540-16676-060824094739.jpg', 'TP-Link', 'Controllers', 'Centralized Management for Access Points, Switches, and Routers', 'Hybrid Cloud for Maximum Convenience', 'Industry-Leading Hardware Design', 'Easy and Intelligent Network Monitoring', 21900.00, 0.00),
(26, '', 'TP-Link OC300 Omada Hardware Controller', '5', 2147483647, 'OC300, the hardware controller for the Omada Software Defined Networking (SDN) platform, provides 100% centralized management of access points, switches, and gateways—all controlled from a single interface.\r\n\r\n', '11-czone.com.pk-1540-16677-060824095023.jpg', 'TP-Link', 'Controllers', 'Centralized Management for Access Points, Switches, and Gateways', 'Hybrid Cloud for Maximum Convenience', 'Industry-Leading Hardware Design', 'Easy and Intelligent Network Monitoring', 48990.00, 0.00),
(27, '', 'TP-Link UE300 USB 3.0 to Gigabit Ethernet Network Adapter | Ver 4.0', '3', 2147483647, 'Equipped with a USB 3.0 port and Gigabit Ethernet port, UE300 provides a high-speed data transfer rate of up to 1000 Mbps.\r\n\r\n', '96-czone.com.pk-1540-13486-060822124142.jpg', 'TP-Link', 'Ethernet Adapter', 'Plug & Play without installing driver', 'Fast and Stable Data Transfer', 'Foldable and Portable design ideally suits your Ultrabook', 'Fastest USB 3.0 and Gigabit solution ensure high speed transfer rate', 4100.00, 0.00),
(28, '', 'TP-Link TL-R470T+ Desktop Load Balance Broadband Router | 6.0', '3', 2147483647, 'The TL-R470T+ load balance broadband router is a wise choice for small businesses. It brings you a high return on investment with low overhead.\r\n\r\n', '27-czone.com.pk-1540-12052-030921022150.jpg', 'TP-Link', 'Load Balance Broadband Router', 'Three Changeable WAN/LAN Ports', 'Abundant Security Features', 'Efficient Access Management', 'Safety Minded Enterprise Investments', 12900.00, 0.00),
(29, '', 'TP-Link TL-R480T+ V9 Desktop/Rackmount Load Balance Broadband Router', '5', 2147483647, 'The TL-R480T+ load balance broadband router is a wise choice for small business. It brings you high return on investment with low overhead. Featured with three changeable WAN/LAN ports, TL-R480T+ supports up to 4 WAN ports', '4-czone.com.pk-1540-12181-220921042434.jpg', 'TP-Link', 'Load Balance Broadband Router', 'Up to 4 WAN 10/100 ports for multiple Internet connections', 'Abundant Security Features', 'Marshals bandwidth resource to specific clients', 'Three Changeable WAN/LAN Ports', 16700.00, 0.00),
(30, '', 'TP-Link TL-SM311LM MiniGBIC Module', '3', 0, 'The TL-SM311 series Fiber Module Cards are introduced for extending transfer distance. Attached to our managed/smart switches', '4-czone.com.pk-1540-11793-270621063548.jpg', 'TP-Link', 'Media Converters | PoE', 'Multi-mode MiniGBIC module', 'Work with MC200CM with a multi-mode fiber connection', 'Up to 550m range with 50/125 µm multi-mode fiber', 'Up to 275m range with 62.5/125 µm multi-mode fiber', 5200.00, 0.00),
(31, '', 'TP-Link MC111CS 10/100Mbps WDM Media Converter', '3', 2147483647, 'The MC111CS is a media converter designed to convert 100BASE-FX fiber to 10/100Base-TX copper media or vice versa. Adopting WDM technology, MC111CS takes only one fiber cable to transmit and receive data, which will save half cabling cost for you.\r\n\r\n', '15-czone.com.pk-1540-14605-200423044647.jpg', 'TP-Link', 'Media Converters | PoE', 'Complies with 802.3u 10/100Base-TX, 100Base-FX standards', 'Auto-negotiation of Half-Duplex / Full-Duplex transfer mode', 'Adopts WDM technology, transmitting and receiving data on one single fiber', 'Extends fiber distance up to 20km', 6800.00, 0.00),
(32, '', 'TP-Link EAP110-Outdoor N300 Wireless N Outdoor Access Point Ver 3.0', '4', 2147483647, 'With special design of its antenna, appearance, power options and installation methods, EAP110-Outdoor can perfectly fit for different scenarios both indoors and outdoors.\r\n\r\n', 'eap110-outdoor-eu-3.0-01-large-1511488690843s-1540-9809-010720042933.jpg', 'TP-Link', 'Outdoor Radio | Antenna | 4G', 'Enjoy Wi-Fi Outside, Finally', 'Excellent Hardware Designs', 'Wi-Fi That Goes the Distance', 'Specially Designed Weatherproof Enclosure for Outdoor Environment', 12900.00, 0.00),
(33, '', 'TP-Link CPE510 5GHz 300Mbps 13dBi Outdoor CPE, Point to Point Wireless Bridge,13dBi, 15km+', '4', 2147483647, 'TP-LINK’s 5GHz 300Mbps 13dBi Outdoor CPE, the CPE510 is dedicated to cost-effective solutions for outdoor wireless networking applications. With its centralized management application', '1-czone.com.pk-1540-9814-131123092548.jpg', 'TP-Link', 'Outdoor Radio | Antenna | 4G', 'Built-in 13dBi 2x2 dual-polarized directional MIMO antenna', 'Adjustable transmission power from 0 to 26dBm/200mw', '15km+ Wireless Data Transmission', 'Centralized Management System – Pharos Control', 14000.00, 0.00),
(34, '', 'TP-Link EAP610-Outdoor AX1800 Indoor/Outdoor WiFi 6 Access Point', '5', 2147483647, 'Powered by the latest WiFi 6 technology, the AP delivers speeds of up to 1.8 Gbps, providing higher data rates on both 5 GHz and 2.4 GHz bands for demanding multi-user scenarios, such as outdoor swimming pools, cafés, and amusement parks.†\r\n\r\n', '2-czone.com.pk-1540-16657-040824100702.jpg', 'TP-Link', 'Outdoor Radio | Antenna | 4G', 'Superior WiFi 6 Speeds', 'Higher Network Efficiency', 'Long-Range Coverage', 'Stay Smooth with Fast Roaming', 42300.00, 0.00),
(35, '', 'TP-Link TL-WR841N 300Mbps Wireless N Router - Ver 14.0', '3', 2147483647, '300Mbps wireless speed ideal for interruption sensitive applications like HD video streaming\r\n\r\n', 'tl-wr841n-eu-14.0-01-normal-1524475416205s-1540-7013-250918105615.jpg', 'TP-Link', 'Routers | Wireless', 'Two antennas greatly increase the wireless robustness and stability', 'Easy wireless security encryption at a push of WPS button', 'IP based bandwidth control', 'Compatible with IPv6 -the more recent Internet Protocol version', 3750.00, 0.00),
(36, '21', 'TP-Link Archer AX53 AX3000 Dual Band Gigabit Wi-Fi 6 Router | OneMesh WPA3 HomeShield', '4', 2147483647, 'Next-Gen Gigabit Wi-Fi 6 Speed—2402 Mbps on 5 GHz and 574 Mbps on 2.4 GHz band ensure smoother streaming and faster downloads.\r\n\r\n', '16-czone.com.pk-1540-16691-070824092714.jpg', 'TP-Link', 'Routers | Wireless', '2-3 Bedroom Houses | 4× Fixed High-Performance Antennas', 'Beamforming - High-Power FEM - Dual-Core CPU', 'Dual-Band OFDMA Airtime Fairness', 'Access Point Mode | Router Mode | 1× Gigabit WAN Port | 4× Gigabit LAN Port', 21990.00, 28000.00),
(37, '', 'TP-Link Archer AXE75 AXE5400 Tri-Band Gigabit Wi-Fi 6E Router', '5', 2147483647, 'WiFi 6E introduces the brand new 6 GHz band without any overlap or interference from other bands and older devices. This means a congestion-free frequency that offers more bandwidth, faster speed, and lower latency.\r\n\r\n', '25-czone.com.pk-1540-17699-200125012836.jpg', 'TP-Link', 'Routers | Wireless', 'AXE5400 Tri-Band', 'Cutting-Edge Processing – Armed with a 1.7 GHz Quad-Core CPU.', 'SuperSpeed USB 3.0', 'Wi-Fi 6E Unleashed', 40990.00, 0.00),
(38, '11', 'TP-Link Archer AX73 AX5400 Dual-Band Gigabit Wi-Fi 6 Router', '5', 2147483647, 'Drastically improved speeds enable streaming, fast downloading, and gaming, all at the same time. Need to go faster? Hop on 5 GHz with full speed-boosting features to stream multiple 8K videos without lagging.\r\n\r\n', '25-czone.com.pk-1540-17699-200125012836.jpg', 'TP-Link', 'Routers | Wireless', 'Gigabit WiFi for 8K Streaming', 'Fully Featured Wi-Fi 6', 'Connect 200+ Devices*', 'Extensive Coverage', 33990.00, 38000.00),
(39, '26', 'TP-Link Archer AX55 AX3000 Dual Band Gigabit Wi-Fi 6 Router OneMesh WPA3', '5', 2147483647, 'Next-Gen Gigabit Wi-Fi 6 Speed—2402 Mbps on 5 GHz and 574 Mbps on 2.4 GHz band ensure smoother streaming and faster downloads.\r\n\r\n', '25-czone.com.pk-1540-17699-200125012836.jpg', 'TP-Link', 'Routers | Wireless', 'Powerful CPU and High Memory', 'Improved Cooling Design Consistent Full Output', 'WiFi Coverage Throughout Your Home', '1× USB 3.0 Port | L2TP VPN Server | For 3 Bedroom Houses', 24500.00, 33000.00);

-- --------------------------------------------------------

--
-- Table structure for table `new_home`
--

CREATE TABLE `new_home` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `new_home`
--

INSERT INTO `new_home` (`id`, `offer`, `name`, `description`, `image`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(7, '', 'Lian Li EDGE 850W Full Modular Platinum PSU - 80 PLUS Platinum Efficiency - German EPCOS Bulk Capacitors - ATX 3.0, 3.1 Compliant - EG850 Black', 'The EDGE PSU series introduces a revolutionary power supply featuring a unique L-shape design, an integrated USB hub, and enhanced efficiency. Experience the blend of aesthetics and convenience in your PC build.\r\n', '12-czone.com.pk-1540-17297-121124101302.jpg', '80 PLUS Platinum Efficiency', 'Built-in USB expantion hub with 4 internal USB 2.0 headers', 'Integrating German EPCOS bulk capacitors', 'In-house R&D 12V-2×6 alloy copper soldered terminals', '50000', ''),
(8, '', 'Lian Li EDGE 850W Full Modular Platinum PSU - 80 PLUS Platinum Efficiency - German EPCOS Bulk Capacitors - ATX 3.0, 3.1 Compliant - EG850 White', 'The EDGE PSU series introduces a revolutionary power supply featuring a unique L-shape design, an integrated USB hub, and enhanced efficiency. Experience the blend of aesthetics and convenience in your PC build.\r\n', '7-czone.com.pk-1540-17296-121124100931.jpg', '80 PLUS Platinum Efficiency', 'Built-in USB expantion hub with 4 internal USB 2.0 headers', 'Integrating German EPCOS bulk capacitors', 'In-house R&D 12V-2×6 alloy copper soldered terminals', '50000', ''),
(9, '', 'FinalMouse Starlight Pro Tenz Wireless Gaming Mouse - Small', 'The Tournament Wireless technology is built on the industry-leading Nordic RF platform (NRF52840) with state-of-the-art firmware developed in-house. With years of testing and development in RF chambers, you can expect reliability and performance that', '39-czone.com.pk-1540-14141-191222105420.jpg', 'Starlight Pro Magnesium Chassis with Ultem Base', 'Final Assembled Weight: ~42 grams*', 'Finalsensor', 'Resolution (CPI) of up to 20,000', '37990', ''),
(10, '', 'XPG SPECTRIX D35G DDR4 16GB (8GB x 2) 3600MHz RGB Desktop Memory AX4U36008G18I-DTBKD35G', 'SPECTRIX D35G\'s composed and understated triangular outline is specifically designed for gamers with unique personalities. The D35G\'s small heatsink allows for easy installation in small chassis.\r\n', '1-czone.com.pk-1540-15675-310124072422.jpg', 'Top Quality RAM for High Durability', 'RGB Your Way', 'Create Personalized Lightshow with XPG Prime', 'Works with the Latest AMD Platforms | Supports Intel® XMP 2.0', '14000', ''),
(11, '', 'XPG SPECTRIX D35G DDR4 16GB (8GB x 2) 3600MHz RGB Desktop Memory | White', 'SPECTRIX D35G\'s composed and understated triangular outline is specifically designed for gamers with unique personalities. The D35G\'s small heatsink allows for easy installation in small chassis.\r\n', '8-czone.com.pk-1540-16107-280524075150.jpg', 'Top Quality RAM for High Durability', 'RGB Your Way', 'Create Personalized Lightshow with XPG Prime', 'Works with the Latest AMD Platforms | Supports Intel® XMP 2.0', '14000', ''),
(13, '', 'Amazon Fire TV Stick Lite | Alexa Voice Remote Lite, Smart Home Controls, HD Streaming', 'Our most affordable Fire TV streaming stick - Enjoy fast streaming in Full HD. Comes with Alexa Voice Remote Lite.\r\n', '15-czone.com.pk-1540-17350-201124092656.jpg', 'Everything you need right out of the box', 'Alexa Voice Remote Lite', 'Find content fast', 'Watch live TV and free TV', '9990', ''),
(14, '', 'POSPRO PBS-QR1000 2D Wired Barcode Scanner With Stand', 'With dustproof protection Support USB, RS-232, and virtual Serial Port.\r\n', '4-czone.com.pk-1540-17713-230125101122.jpg', 'Ergonomic design, comfortable operating sense.', 'Plug & Play.', 'Read 1D & 2D Screen Barcodes on mobile & computer.', 'Blue LED indicator & loud buzzer sound.', '4950', ''),
(15, '', 'Thermal Grizzly HYDRONAUT Thermal Paste TG-H-001-RS 1G', 'Applicable to aluminium coolers\r\n', '3-czone.com.pk-1540-11761-101224082908.jpg', 'Suitable for overclocking', 'Excellent thermal conductivity', 'Silicone free', 'Not electrically conductive', '2650', ''),
(16, '', 'Thermal Grizzly Aeronaut Thermal Paste TG-A-001-RS 1 Gram', 'The Aeronaut thermal paste is an ideal entry-level product with very good effectiveness: The high surface protection and good thermal conductivity of Aeronaut is ideal for all users who want to optimize their cooling system effectively or, for exampl', '2021-05-22-23-37-39-thermal-grizzly-aeronaut-high-performanc-1540-11560-220521063758.jpg', 'Very good thermal conductivity', 'High long-term stability', 'No curing', 'Not electrically conductive', '2500', ''),
(17, '16', 'Gigabyte P450B 80 PLUS Bronze Certified 450W Power Supply GP-P450B', '80 Plus Bronze certified ensures to deliver 85% efficiency at 50% load. The better power efficiency leads to less power waste, less heat and less fan noise.\r\n', '202005251612261281936a195f1cadc979bddc92ef91e6ba-src-1540-10371-171020090309.jpg', '120mm Silent Hydraulic Bearing (HYB) Fan', 'Reliable flat cable', 'Single +12V rail', 'OVP/OPP/SCP/UVP/OCP/OTP protection', '12990', '15500'),
(18, '', 'ASUS Zenbook 14 OLED UM3406 UM3406HA Laptop | AMD Ryzen 7 8840HS |16GB DDR5 | 512GB SSD | Backlit KB | 14\" WUXGA OLED Touchscreen Display', 'Elevate your experience with the sleek and sophisticated Zenbook 14 OLED ultraportable.\r\n', '15-czone.com.pk-1540-16809-210824094521.jpg', 'AMD Ryzen™ 7 8840HS Processor 8C', '16GB LPDDR5X On Board - 512GB M.2 NVMe™ PCIe® 4.0 SSD', 'AMD Radeon™ Graphics - Backlit KB - Windows 11', '14\" WUXGA (1920 x 1200) OLED Touchscreen Display', '238000', ''),
(19, '', 'Dell XPS 9640 Laptop | Intel Core Ultra 7 Processor 155H | 16GB DDR5 | 512GB SSD | Nvidia GeForce RTX 4050 6GB GDDR6 | Backlit KB | Fingerprint Reader | 16.3\" FHD+ Display | Windows 11 Pro', 'Shop the Dell XPS 16 powerful laptop with Intel Core Ultra processor\r\n', '89-czone.com.pk-1540-17818-130225101303.jpg', 'Intel Core Ultra 7 Processor 155H', '16GB LPDDR5x 6400MHz Memory | 512GB M.2 PCIe SSD', 'Nvidia GeForce RTX 4050 6GB GDDR6 | Backlit KB | Fingerprint Reader', '16.3\" 1920x1200 FHD+ Display | Windows 11 Pro 64bit', '445000', ''),
(20, '', 'Thermalright Frozen Vision 360 Black Liquid CPU Water Cooler', 'With 120 mm PWM Fan\r\n', '36-czone.com.pk-1540-17807-130225091421.jpg', '2.88 Inch Square IPS LCD Screen', 'Computer Water Cooler', 'Intel | LGA115X/1200/1700/1851/2011/2066', 'AMD | AM4/AM5', '47990', ''),
(21, '15', 'Amazon Fire TV Stick 4K Max Streaming Device, Wi-Fi 6, Alexa Voice Remote', 'Our most powerful streaming stick - 40% more powerful than Fire TV Stick 4K, with faster app starts and more fluid navigation.\r\n', '11-czone.com.pk-1-1540-17349-201124092254.jpg', 'Get ready for next-gen Wi-Fi 6', 'Over 1.5 million movies and TV episodes', 'Alexa Voice Remote with TV controls', 'Smart—and always getting smarter', '17500', '20500'),
(22, '', 'Thermalright Frozen Vision 360 White Liquid CPU Water Cooler', 'With 120 mm PWM Fan\r\n', '39-czone.com.pk-1540-17808-130225091557.jpg', '2.88 Inch Square IPS LCD Screen', 'Computer Water Cooler', 'Intel | LGA115X/1200/1700/1851/2011/2066', 'AMD | AM4/AM5', '48990', ''),
(23, '', 'Thermalright Frozen Vision 240 White AIO Water Cooler | LCD Screen', 'Liquid CPU Cooler\r\n', '30-czone.com.pk-1540-17806-130225091204.jpg', 'Double PWM Fans CPU Water Cooler', '2.88 inch IPS LCD Screen', '2150RPM High Speed', 'Intel: LGA115X/1200/1700/1851/2011/2066 | AMD: AM4/AM5', '38990', '');

-- --------------------------------------------------------

--
-- Table structure for table `np`
--

CREATE TABLE `np` (
  `network` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `np`
--

INSERT INTO `np` (`network`) VALUES
('D-Link'),
('Google'),
('TP-Link'),
('Vention');

-- --------------------------------------------------------

--
-- Table structure for table `peripheralsmics`
--

CREATE TABLE `peripheralsmics` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peripheralsmics`
--

INSERT INTO `peripheralsmics` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Bloody BP-30M Gaming Mouse Pad', '3', 2147483647, 'Bloody mouse mat made with exceptional fine knitting craft to the pad edges so as to protect the braided edges not to be tilted easily or too sharp to cut the hand. It also ensures the pad is durable for prolonged life with comfort.\r\n\r\n', '30-czone.com.pk-1540-13431-260722104919.jpg', 'Mouse Pads | Wrist Rests', 'A4Tech', 'Smooth Surface', 'Exceptional Fine Knitting Craft Edges', 'Easy to Move and Stop', 'BP-30M: 350 x 280 mm', '1390', ''),
(4, '', 'Bloody B-088S X-Thin Gaming Mousepad', '5', 2147483647, 'Bloody control-mats has marvelous smooth and flat texture, it is suitable for gamers who needs slipping quickly across with hindrance to hit the targets faster and efficiently.\r\n\r\n', 'czone70944767.jpg-1540-7425-110119121259.jpg', 'Mouse Pads | Wrist Rests', 'A4Tech', 'Smooth. frictionless. Absolute precision.', 'Easy to Move and Stop', 'Exceptional Fine Knitting Craft Edges', 'Optimized for both speed and control', '1650', ''),
(6, '10', 'Anker Nano Power Bank 22.5W 5,000mAh with Built-in Foldable USB-C Connector, Pocket Sized, White, A1653H21', '4', 2147483647, 'For iPhone, Samsung Series, Huawei, iPad, AirPods, & More, White\r\n\r\n', 'czone.com.pk-39-1540-18291-160525112015.jpg', 'Power Pack', 'Anker', 'USB-C PD Fast Charging', 'PowerIQ 3.0 technology', 'Fast 22.5W output', 'Blend of style, reliability, and convenience', '8990', '10000'),
(7, '25', 'ANKER 322 MagGo Power Bank 5000mAh 7.5W Stand Black A1618H11-1 iPhone Android Magnetic Wireless', '5', 2147483647, 'Anker 322 Magnetic Wireless Power Bank (MagGo), 5,000 mAh, with 12W USB C Output, with Mobile Stand, Compatible with iPhone15/15+/15 pro/15 pro max/ 14/13/12 & Android\r\n\r\n', '2-czone.com.pk-1540-15782-050324064423.jpg', 'Power Pack', 'Anker', 'Charge Wirelessly and Attach Magnetically', 'Super Compact Design', 'Multi-scenario use case', 'Excellent Magnetic Attachment', '8990', '12000'),
(8, '', 'Anker PowerLine 3ft USB-C to USB 3.0 - A8163H21', '5', 2147483647, 'PowerLine USB C to USB 3.0 Cable (3ft) with 56k Ohm Pull-up Resistor for Samsung Galaxy Note 8, Galaxy S8, S8+, S9, MacBook, Sony XZ, LG V20 G5 G6, HTC 10 and More\r\n\r\n', '14-czone.com.pk-1540-8721-080622082332.jpg', 'Cables', 'Anker', 'PowerLine USB-C to USB 3.0', 'From ANKER, America\'s Cutting-Edge USB Charging Brand', 'Backup Charging', 'Ultra-High-Speed Syncing', '1500', ''),
(9, '', 'Apple AirTag | 1 Pack - MX532', '5', 245260124, 'AirTag is an easy way to keep track of your stuff. Attach one to your keys. Put another in your backpack. And just like that, they’re on your radar in the Find My app. AirTag has your back.\r\n\r\n', '63-czone.com.pk-1540-13500-070923094511.jpg', 'Bluetooth Receivers / Trackers', 'Apple', 'Track & Locate with Find My Network', 'Precision Finding via Ultra Wideband', 'Use with Keys, Wallet, Bags & More', 'See Direction, Distance & Map Location', '8990', ''),
(10, '', 'Apple AirTag (4 Pack)', '5', 0, 'Never worry about losing devices and other belongings again with the Apple AirTag.\r\n\r\n', '6-czone.com.pk-1-1540-14083-061222042328.jpg', 'Bluetooth Receivers / Trackers', 'Apple', 'Track & Locate with Find My Network', 'Precision Finding via Ultra Wideband', 'Use with Keys, Wallet, Bags & More', 'See Direction, Distance & Map Location', '27800', ''),
(11, '', 'HP DHC-CT202 USB-C 3.1 to HDMI Adapter', '3', 2147483647, 'The HP adapter is designed to allow you to connect an HDMI port to a USB C video output. It supports HDMI resolutions up to 4K (3840x2160p) at 30Hz. Characteristics . Supports HDMI resolutions up to 4K (3840x2160p @ 30Hz) Specifications Input: USB C ', '7-czone.com.pk-1540-15736-150224083259.jpg', 'Adapters | Converters | USB HUB | Chargers', 'HP', 'HDMI: Resolution 4K x 2K@30HZ Max', 'Up to 1920*1080 / 60Hz Video output', 'Static current <100mA', 'USB C 3.1: Input', '5200', ''),
(13, '', 'Vention USB-C Male to 3.5mm Female Audio Adapter Aluminum Alloy Type | BGWH0', '5', 2147483647, 'Durable Aluminum Alloy Shell\r\n\r\n', 'czone.com.pk-3-1540-18205-220425075236.jpg', 'Adapters | Converters | USB HUB | Chargers', 'Vention', 'High-Fidelity Sound with Clear Audio Transmission', 'Supports in-Line Control, Calls, and Remote Functions', 'Compatible with Chinese Standard Headphones and Various Others', 'Plug-and-Play Design with Quick Responsiveness', '1300', '');

-- --------------------------------------------------------

--
-- Table structure for table `peripheralsmics_brand`
--

CREATE TABLE `peripheralsmics_brand` (
  `id` int(11) NOT NULL,
  `peripheralsmicsbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peripheralsmics_brand`
--

INSERT INTO `peripheralsmics_brand` (`id`, `peripheralsmicsbrand`, `created_at`) VALUES
(3, 'A4Tech', '2025-05-28 06:53:15'),
(4, 'Anker', '2025-05-28 06:53:25'),
(5, 'Vention', '2025-05-28 06:53:42'),
(6, 'Apple', '2025-05-28 06:53:54'),
(7, 'HP', '2025-05-28 06:54:18');

-- --------------------------------------------------------

--
-- Table structure for table `peripheralsmics_store`
--

CREATE TABLE `peripheralsmics_store` (
  `id` int(11) NOT NULL,
  `peripheralsmicsstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peripheralsmics_store`
--

INSERT INTO `peripheralsmics_store` (`id`, `peripheralsmicsstore`, `created_at`) VALUES
(3, 'Mouse Pads | Wrist Rests', '2025-05-28 06:52:38'),
(4, 'Power Pack', '2025-05-28 06:52:42'),
(5, 'Cables', '2025-05-28 06:52:46'),
(6, 'Bluetooth Receivers / Trackers', '2025-05-28 06:52:50'),
(7, 'Adapters | Converters | USB HUB | Chargers', '2025-05-28 06:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'POSPRO MP 50 58mm Bluetooth Mobile Receipt Printer', '4', 2147483647, 'Compatible with Windows/Android/ iOS systems\r\n\r\n', 'whatsapp-image-2023-09-15-at-6.34.25-pm-1540-17717-230125103648.jpg', 'Receipt Printer', 'PosPro', 'Multiple 1D barcode printing', 'QRCODE 2D barcode printing', 'NV LOGO download picture printing', 'Paper out alarm, Multiple languages available.', '8990', ''),
(3, '', 'POSPRO PBS 6500QR 2D Barcode Desktop Scanner', '3', 2147483647, 'It can read screen bar codes for mobile phones and computers.\r\n\r\n', '11-czone.com.pk-1540-17716-230125102902.jpg', 'Barcode Scanner', 'PosPro', 'USB plug and play.', 'Unique shape design, rotatable base to meet many scanning applications.', 'Using the most advanced decoding algorithm, it can decode most 1D and 2D', 'LED indicator, and double buzzer to adapt to various noisy environments.', '12500', ''),
(4, '', 'POSPRO PBS-WX9 Xtreme Series 2D COMS Wireless RF433 Handheld Barcode Scanner', '3', 2147483647, 'Reads Bar Codes on Various Media Including 1D, 2D & QR Codes\r\n\r\n', '9-czone.com.pk-1540-17715-230125102456.jpg', 'Barcode Scanner', 'PosPro', 'Using RF433 wireless transmission technology', 'Superior decoding performance', 'Perfect process design and ultimate experience', 'Long life span', '12990', ''),
(5, '', 'POSPRO PBS-WX7 Wireless Barcode Scanner', '5', 2147483647, 'Support for offline storage mode can memorize 380,000 characters (EAN-13 code). 2D Wired Scanner.\r\n\r\n', '1-czone.com.pk-1540-17712-230125100824.jpg', 'Barcode Scanner', 'PosPro', '3-in-1 transmission: 2.4G USB dongle +BT+Type-B Cable', 'Reading range (open air): 2.4G:100 meters BT: 40 meters.', 'Large 2000mAh battery, 60-day standby.', 'Support double firmware upgrade online: wireless & decoder.', '14500', '');

-- --------------------------------------------------------

--
-- Table structure for table `pos_brand`
--

CREATE TABLE `pos_brand` (
  `id` int(11) NOT NULL,
  `posbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos_brand`
--

INSERT INTO `pos_brand` (`id`, `posbrand`, `created_at`) VALUES
(3, 'PosPro', '2025-05-28 09:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `pos_store`
--

CREATE TABLE `pos_store` (
  `id` int(11) NOT NULL,
  `posstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos_store`
--

INSERT INTO `pos_store` (`id`, `posstore`, `created_at`) VALUES
(3, 'Barcode Scanner', '2025-05-28 09:20:38'),
(4, 'Receipt Printer', '2025-05-28 09:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `power`
--

CREATE TABLE `power` (
  `supply` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `power`
--

INSERT INTO `power` (`supply`) VALUES
(' Gigabyte'),
('Antec Power Supplies'),
('Asus'),
('Boost PSU'),
('Cooler Master Power Supplies'),
('Corsair Power Supplies'),
('Cougar'),
('Lian Li PSU'),
('MSI'),
('XPG PSU');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `model` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`model`) VALUES
('Ink Tank Printers'),
('LaserJet Black & White Printers'),
('LaserJet Colour Printers');

-- --------------------------------------------------------

--
-- Table structure for table `printer_data`
--

CREATE TABLE `printer_data` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `printers` varchar(255) DEFAULT NULL,
  `series` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `printer_data`
--

INSERT INTO `printer_data` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `printers`, `series`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(8, '', 'HP LaserJet M111A Monochrome Printer', '5', 555555, 'The world\'s smallest laser printer of its kind, designed for efficient performance.\r\n\r\n', '1-czone.com.pk-1540-13247-010622082859.jpg', 'LaserJet Black & White Printers', 'LaserJet', 'Memory 16 MB', 'Input capacity Up to 150 sheets', 'Output capacity Up to 100 sheets', 'Media sizes supported (metric) A4; A5; A6; envelopes (C5, DL); custom', 30500.00, 0.00),
(9, '', 'HP LaserJet Pro 4003dw Wireless Auto-Duplex Printer 2Z610A, Black & White (Official Warranty)', '5', 214748364, 'Get blazing-fast printing speeds and easy management tools with LaserJet Pro.\r\n\r\n', '1-czone.com.pk-1540-15056-180823022213.jpg', 'LaserJet Black & White Printers', 'LaserJet Pro.', 'Functions: Print', 'Print speed: Up to 40 ppm (A4)*', 'Print quality black (best): Fine Lines (1200 x 1200 dpi)', 'Dynamic security enabled printer.', 75990.00, 0.00),
(10, '', 'HP LaserJet M111w Printer - A4 Black and White - USB Wireless', '3', 2147483647, 'Efficient performance from the world\'s smallest laser in its class*. Finish jobs fast with rapid print speeds.\r\n\r\n', '11-czone.com.pk-1540-13554-190822074843.jpg', 'LaserJet Black & White Printers', 'LaserJet', 'A4 Black and White Laser Multifunction Printers, Perfect for Home', 'Print speed up to 20 ppm (black)', 'First page out black (A4, ready) As fast as 8.5 sec', 'Duty cycle (monthly, letter) Up to 8000 pages', 33900.00, 0.00),
(11, '9', 'HP LaserJet 108w Printer (Official Warranty)', '3', 2147483647, 'A4 Black and White Laserjet Printer, Perfect for Home\r\n\r\n', '5-czone.com.pk-1540-17690-180125074848.jpg', 'LaserJet Black & White Printers', 'LaserJet', 'Print only, Duty Cycle (Monthly, Letter) Up to 10,000 pages', 'Print speed up to 21 ppm (black)', 'USB, Wireless (WiFi)', 'LED Display, Up to 1,200 x 1,200 dpi', 40990.00, 45000.00),
(12, '', 'HP LaserJet M211dw Printer - Black and White, Duplex, Wireless (Official Warranty)', '4', 2147483647, 'Increase productivity with the fastest two-sided printing in its class* and dual-band Wi-Fi™ with self-reset* – all from a compact laser printer.', 'h.jpg', 'LaserJet Black & White Printers', 'LaserJet', 'A4 Black and White Laser Printer, Perfect for Home', 'Print, Duplex', 'Print speed up to 30 ppm (black)', 'USB, Ethernet, Wi-Fi', 54500.00, 0.00),
(13, '', 'HP LaserJet Pro 4003dn Printer (2Z609A)', '4', 2147483647, 'Duplex, Ethernet port, Print: up to 42 ppm black, Hi-Speed USB 2.0, White\r\n\r\n', '20-czone.com.pk-1540-16299-250624122244.jpg', 'LaserJet Black & White Printers', 'LaserJet', 'Functions Print | Monochrome', 'Duty cycle (monthly, A4): Up to 80,000 pages', 'HP Smart App; Apple AirPrint™; Mopria™ Certified', 'Print quality black (best): Fine Lines (1200 x 1200 dpi)', 69900.00, 0.00),
(14, '21', 'HP LaserJet MFP M141a Monochrome Printer | A4 Black and White - Print speed up to 21 ppm', '4', 2147483647, 'A4 Black and white Laser Multifunction Printers, Perfect for Business.Replacement Cartridges HP 150A Black LaserJet Toner Cartridge (~975), W1500A\r\n\r\n', '30-czone.com.pk-1540-15378-231023084507.jpg', 'LaserJet Black & White Printers', 'LaserJet MFP', 'Print, Copy, Scan, Duty Cycle (Monthly, Letter) Up to 8,000 pages', 'Print speed up to 21 ppm (Black)', 'Multifunction / All-in-One, Print Quality Black (Best) Up to 600 x 600 dpi', 'Amazing Scanning - Up to 8,000 pages Duty Cycle (Monthly, Letter)', 40900.00, 52000.00),
(15, '', 'HP LaserJet MFP M141w Printer (7MD74A) Black and White', '4', 2147483647, 'An efficient, high-quality multifunction printer that fits your space and your budget. Get fast printing from HP\'s smallest laser, plus the time-saving HP Smart app.* Count on professional-quality laser printing and seamless setup.\r\n\r\n', '30-czone.com.pk-1540-15378-231023084507.jpg', 'LaserJet Black & White Printers', 'LaserJet MFP', 'Functions: Print, Copy, Scan', 'Print speed: Up to 20 ppm*', 'Print quality black (best): Up to 600 x 600 dpi', 'Hp\'s Smallest Multifunction Laser Jet', 45500.00, 0.00),
(16, '', 'HP LaserJet MFP 136w Printer - A4 Black and White (Official Warranty)', '3', 2147483647, 'Get the quality you trust and sharp black text with this affordable printer.\r\n\r\n', '5-czone.com.pk-1540-17612-130125071722.jpg', 'LaserJet Black & White Printers', 'LaserJet MFP', 'A4 Black and White Laserjet Multifunction Printer, Perfect for Enterprise', 'Print, Copy and Scan', 'Print speed up to 20 ppm (black) - Up to 1,200 x 1,200 dpi', 'USB, Apple AirPrint™, Mopria™, Wi-Fi®', 57500.00, 0.00),
(17, '', 'HP LaserJet MFP M236SDW Printer - Black And White - Auto-Duplex ADF (Official Warranty)', '3', 2147483647, 'Print Speed: Print speed up to 30 ppm (black)\r\nPrint Quality Black (Best): Up to 600 x 600 dpi', 'copy-21-czone.com.pk-1540-12936-240222083609.jpg', 'LaserJet Black & White Printers', 'LaserJet MFP', 'Print, copy, scan, Auto-duplex', '1 built-in Wi-Fi 802.11b/g/n', 'Print speed up to 29 ppm (black)', 'Duty Cycle (Monthly, Letter) Up to 20,000 pages', 74990.00, 0.00),
(18, '', 'HP LaserJet Pro MFP 4103fdw Printer', '3', 2147483647, 'A4 Black and white Laser Multifunction Printer, Perfect for Business.\r\n\r\n', '9-czone.com.pk-1540-16428-130724071933.jpg', 'LaserJet Black & White Printers', 'LaserJet MFP', 'Print, Scan, Copy and Fax, ADF, Duplex', 'Prints up to 40 ppm (black)', 'USB, Ethernet, 802.3az(EEE), Wi-Fi', 'Laser printers', 135990.00, 0.00),
(19, '', 'HP LaserJet MFP M442dn Printer - A3 A4 - Duplex Printing', '4', 2147483647, 'Hi-Speed USB 2.0 Device, Ethernet 10/100 Base TX\r\n\r\n', '5-czone.com.pk-1540-11923-100222075811.jpg', 'LaserJet Black & White Printers', 'LaserJet MFP', 'Print, Copy, Scan - 4-line LCD', 'Print quality black (best): Up to 1200 x 1200 dpi', 'Duty cycle (monthly, A4) Up to 50,000 pages per month*', 'Print speed: Print speed up to 24 ppm (black)', 165000.00, 0.00),
(20, '', 'HP LaserJet MFP M440NDA Printer | A3 ADF (Official Warranty)', '5', 245260124, 'Surpass your office printer expectations with the speed, quality, and efficiency of HP LaserJet office printers.\r\n\r\n', '7-czone.com.pk-1540-17600-100125092906.jpg', 'LaserJet Black & White Printers', 'LaserJet MFP', 'Print, Copy, Scan - 4-line LCD', 'Up to 24 ppm - A3 Paper support - Duplex ADF Scanning', 'Up to 50,000 pages per month', 'Up to 1200 x 1200 dpi', 222000.00, 0.00),
(21, '9', 'HP Smart Tank 580 All-in-One Wireless Printer, A4 Colour Smart Tank (Official Warranty)', '4', 2147483647, 'Apple AirPrint™; Google Cloud Print™; HP ePrint; Mopria™; USB; Wireless (Wi-Fi®); Print Anywhere.\r\n\r\n', '5-czone.com.pk-1540-15677-310124074535.jpg', 'Ink Tank Printers', 'Tank', 'Print, Copy, Scan', 'Print speed up to 12 ppm (black) and 5 ppm (color)', 'HP GT52 Cyan + GT52 Magenta + GT52 Yellow ~ 6000* Pages Color', 'HP GT53XL Black ~ 6000* Pages Black', 44500.00, 49000.00),
(22, '16', 'Epson EcoTank L3250 A4 Wi-Fi All-in-One Ink Tank Color Printer | 4500~Pages Black | 7500~Pages Color (Official Warranty)', '4', 2147483647, 'An Eco-Nomical and Eco-Friendly, All-In-One Printer for Home Use with Wireless Printing Capability.\r\n\r\n', '18-czone.com.pk-1540-16193-070624092907.jpg', 'Ink Tank Printers', 'Tank', 'Cost per print 7 Paise (black)* and 18 Paise (colour)*', 'Print, scan, copy | Seamless setup via Epson Smart Panel, Wirelessly', 'Compact integrated tank design', 'High yield ink bottles | Wi-Fi & Wi-Fi Direct', 50500.00, 60000.00),
(23, '', 'EcoTank L8050 A4 Wi-Fi Ink Tank Photo Printer', '4', 2147483647, 'Prints up to 2,100 photos from one set of ink bottles*\r\n', 'copy-1-czone.com.pk-1540-16264-210624075619.jpg', 'Ink Tank Printers', 'Tank', 'Say goodbye to cartridges', 'Keep on saving', 'Easy-to-use and reliable', 'Print from almost anywhere', 82990.00, 0.00),
(24, '', 'EcoTank L8050 A4 Wi-Fi Ink Tank Photo Printer (Official Warranty)', '5', 2147483647, 'Prints up to 2,100 photos from one set of ink bottles*\r\n\r\n', 'copy-1-czone.com.pk-1540-16264-210624075619.jpg', 'Ink Tank Printers', 'Tank', 'Say goodbye to cartridges', 'Keep on saving', 'Easy-to-use and reliable', 'Print from almost anywhere', 97500.00, 0.00),
(25, '', 'HP LaserJet Enterprise M406dn Monochrome Laser Printer', '4', 400681591, 'Work faster and smarter and grow your business with the LaserJet Enterprise M406dn Monochrome Laser Printer from HP.\r\n', '6-czone.com.pk-1540-11940-270122075643.jpg', 'LaserJet Black & White Printers', 'LaserJet Enterprise', 'Black Print Speed: Up to 42 ppm', 'Print Resolution: 1200 x 1200 dpi', 'Automatic Duplex Printing | Monthly duty cycle Up to 100,000 pages', 'Resolution (black) Up to 1,200 x 1,200 dpi', 94990.00, 0.00),
(26, '', 'HP LaserJet Enterprise M507dn Monochrome Printer', '4', 2147483647, 'Work securely and efficiently and get high-quality results with the LaserJet Enterprise M507dn Monochrome Printer from HP. Featuring two input trays, which hold a total of 650 sheets of paper, and a 250-sheet output tray to hold printed documents, the pri', '1567614731-img-1246956-1540-10152-070920075904.jpg', 'LaserJet Black & White Printers', 'LaserJet Enterprise', 'Monochrome Printing', 'Black Print Speed: 45 ppm', 'Print Resolution: 1200 x 1200 dpi', 'First Page Out: 5.9 Seconds', 160000.00, 0.00),
(27, '', 'HP LaserJet Enterprise M611dn Monochrome Duplex Printer (7PS84A)', '4', 2147483647, 'World’s most secure printing: Print consistently high-quality, 2-sided documents with the HP LaserJet Enterprise M611dn, a monochrome duplex laser printer with JetIntelligence designed to combine performance, energy efficiency, and security.\r\n\r\n', '10-czone.com.pk-1540-11904-200721080044.jpg', 'LaserJet Black & White Printers', 'LaserJet Enterprise', 'Self-repair from hacks', 'Centralize printing control', 'High-speed performance', 'Energy-efficient', 235000.00, 0.00),
(28, '', 'HP LaserJet Enterprise M612dn Printer - Monochrome - Auto Duplex', '4', 2147483647, 'Work teams excel with HP’s black-and-white office LaserJet printers, which pack extra punch with high-quality results, extra power, and more features.\r\n\r\n', '10-czone.com.pk-1540-11904-200721080044.jpg', 'LaserJet Black & White Printers', 'LaserJet Enterprise', 'HP Sure Start', 'Run-time Intrusion detection, Whitelisting', 'HP Web Jetadmin, 4.3-inch (10.9 cm) color touchscreen', 'Eliminate the wait from your workday', 269000.00, 0.00),
(29, '', 'HP LaserJet Enterprise 700 M712dn Monochrome Laser Printer', '4', 2147483647, 'Improve the productivity of your workgroup with the speedy and durable LaserJet Enterprise 700 M712dn Monochrome Laser Printer from HP, which also boasts the ability to handle custom-sized media up to 12.3 x 18.5\" and standard media up to 11.7 x 17\".\r\n\r\n', 'sx.jpg', 'LaserJet Black & White Printers', 'LaserJet Enterprise', 'Print Resolution: 1200 x 1200 dpi', 'Maximum Document Size: 12.3 x 18.5\"', 'Print Speed: 40 ppm (Simplex)', 'First Print Out Time: 10.5 Seconds', 545000.00, 0.00),
(30, '', 'HP LaserJet Enterprise M806dn Printer (Official Warranty) A3', '5', 2147483647, 'This HP LaserJet handles big print jobs fast, with extra-large input capacity and versatile paper-handling options. Mobile printing is simple with wireless direct printing and touch-to-print technology. Easy upgrades protect your investment.\r\n\r\n', '1485370954-img-742804-1540-8593-230919112324.jpg', 'LaserJet Black & White Printers', 'LaserJet Enterprise', 'Print only', 'Print speed letter: Up to 55 ppm (black)', 'Prints up to 11x17\"; Auto duplex printing; 3 paper trays (standard)', 'First Print Out Time: 8.5 Seconds', 959000.00, 0.00),
(31, '', 'HP Color Laser 150a Printer 4ZB94A (Official Warranty)', '3', 2147483647, 'Get productive print performance at an affordable price, and easily produce high-quality color results.\r\n\r\n', 'copy-51qscdbwzyl.-ac-sl1500--1540-10264-300920092409.jpg', 'LaserJet Colour Printers', 'Color Laser.', 'Processor speed 400 MHz', 'Print quality color (best) 600 x 600 dpi 4 bits', 'Print speed black: Normal: Up to 18 ppm', 'Legendary quality, surprisingly affordable price', 73500.00, 0.00),
(32, '', 'HP Color Laser 150nw Wireless Printer', '3', 2147483647, '4ZB95A. Get the quality you trust – sharp, black text and crisp color graphics – with this affordable printer.\r\n\r\n', '61kkdg23xil.-ac-sl1500--1540-10187-120920111338.jpg', 'LaserJet Colour Printers', 'Color Laser.', 'Print Only', '600 x 600 dpi 4 bits', 'Print speed up to 19 ppm (black) and 4 ppm (color)', 'USB, Ethernet, Wi-Fi', 74500.00, 0.00),
(33, '23', 'HP Color Laser MFP 178NW Wireless Printer (4ZB96A)', '4', 2147483647, 'Legendary quality – Print, scan, and copy consistently exceptional documents with the HP Color Laser MFP 178nw, a compact laser printer that produces high-quality, sharp black text and crisp color graphics.\r\n\r\n', 'copy-copy-71f0xsv1p4l.-ac-sl1500--czone.com.pk-1540-10910-190121012233.jpg', 'LaserJet Colour Printers', 'Color Laser MFP', 'Print, Copy, Scan', 'Mobile Printing & Built-in Ethernet, Works with Alexa', 'Print quality black (normal) Up to 600 x 600 dpi', 'Duty cycle (monthly, letter) Up to 20,000 pages', 92500.00, 120000.00),
(34, '', 'HP Color Laser MFP 179FNW Printer', '3', 2147483647, 'Legendary quality – Print, scan, copy, and fax consistently exceptional documents with the HP Color Laser MFP 179fnw, a compact laser printer that produces high-quality, sharp black text and crisp color graphics\r\n\r\n', 'copy-61wlqv8qarl.-ac-sl1500--czone.com.pk-1540-10909-190121011230.jpg', 'LaserJet Colour Printers', 'Color Laser MFP', 'Print, Copy, Scan, Fax', 'Resolution (color) Up to 600 x 600 dpi', 'Monthly duty cycle Up to 20,000 pages', 'Mobile Printing & Built-in Ethernet, Works with Alexa', 102990.00, 0.00),
(35, '', 'HP Color Laser MFP 179FNW Printer (Official Warranty)', '4', 2147483647, 'Legendary quality – Print, scan, copy, and fax consistently exceptional documents with the HP Color Laser MFP 179fnw, a compact laser printer that produces high-quality, sharp black text and crisp color graphics\r\n\r\n', 'copy-61wlqv8qarl.-ac-sl1500--czone.com.pk-1540-10909-190121011230.jpg', 'LaserJet Colour Printers', 'Color Laser MFP', 'Print, Copy, Scan, Fax', 'Print speed letter: Up to 19 ppm black; Up to 4 ppm color', 'Dual band Wi-Fi; 150 sheet paper tray (standard); HP Smart App', 'Mobile Printing & Built-in Ethernet, Works with Alexa', 114900.00, 0.00),
(36, '', 'HP Color LaserJet Pro 3203DW Printer', '4', 2147483647, 'Designed for business work teams that need professional performance with fast, high-quality two-sided colour printing, laser productivity, and award-winning reliability in a space-saving design.*\r\n\r\n', '6-czone.com.pk-1540-17703-220125075440.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro', 'Functions: Print', 'Print speed up to 25 ppm (black) and 25 ppm (colour)*', 'Up to 600 x 600 dpi', 'Duplex printing - Up to 40,000 pages', 95000.00, 0.00),
(37, '', 'HP Color LaserJet Pro 4203dn Printer (4RA89A) | Up to 35 ppm Black and Color - Duplex Printing', '4', 2147483647, 'Get a blazing-fast color printer and easy set-up with LaserJet Pro.\r\n\r\n', '1-czone.com.pk-1540-17312-161124080737.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro', 'Functions: Print', 'Print speed: Print speed up to 33 ppm black & color (A4)', 'Up to 600 x 600 dpi; Up to 38,400 x 600 enhanced dpi', 'Up to 50,000 pagesUp to 50,000 pages Duty cycle (monthly, letter)', 129990.00, 0.00),
(38, '', 'HP Color LaserJet Pro 4203dw Printer', '5', 2147483647, 'A4 Color Laser Multifunction Printer, Perfect for Business\r\n\r\n', '2-czone.com.pk-1540-17791-080225083420.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro', 'Print only, Duplex, Up to 600 x 600 dpi', 'Print speed up to 35/33 ppm black & color', 'USB, Ethernet, Bluetooth', 'Up to 50,000 pages Duty Cycle (Monthly, Letter)', 131990.00, 0.00),
(39, '', 'HP Color LaserJet Pro M454dw Printer', '4', 2147483647, 'Product #W1Y45A#BGJ. Work faster and smarter and grow your business with the Color LaserJet Pro M454dw from HP. Featuring automatic duplex printing and a fast color print speed of 28 ppm for letter-size documents, this printer has a 600 x 600 dpi print re', '1566315952-img-1238620-1540-9182-131020112044.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro', 'Color Printing', 'Print Resolution: 600 x 600 dpi', 'Color Print Speed: 28 ppm', 'Automatic Duplex Printing', 158000.00, 0.00),
(40, '', 'HP Color LaserJet Pro CP5225n Printer (CE711A) - A3 Size', '4', 2147483647, 'Gain control of your printed documents and make an impact when communicating with HP\'s most affordable, versatile A3 color printer that covers all your printing needs from general office to oversize documents.\r\n\r\n', 'hp-ce711a-cp5225n-professional-laserjet-color-1109635-1540-7040-011018114457.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro', 'Print speed color: Normal:Up to 20 ppm', 'Print Resolution Technologies HP ImageREt 3600', 'Duty cycle (monthly, A4) Up to 75000 pages', 'Processor speed 540 MHz', 349990.00, 0.00),
(41, '', 'HP CP5225DN Color LaserJet Professional Printer | A3 Printing', '5', 2147483647, 'Gain control of your printed documents and make an impact when communicating. One versatile printer covers all your printing needs from general office to oversize documents.\r\n\r\n', '18-czone.com.pk-1540-11658-200422090040.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro', 'Affordable A3 printing', 'High-quality output on a range of documents', 'Easy to use, share and maintain', 'Resolution technology HP ImageREt 3600', 374990.00, 0.00),
(42, '', 'HP MFP M182n Color LaserJet Pro Printer (7KW54A) (Official Warranty)', '4', 2147483647, 'An efficient MFP for high-quality colour and productivity.* Save time with Smart Tasks in HP Smart app, and print and scan from your phone.2 Get security essentials to help maintain privacy and control.\r\n\r\n', 'hp-color-pro-mfp-m182n-1540-11067-160221092228.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro MFP', 'Print, copy, scan', 'Print speed color: Normal:Up to 16 ppm', 'Up to 600 x 600 dpi', 'Duty cycle (monthly, A4) Up to 30,000 pages', 94500.00, 0.00),
(43, '', 'HP Color LaserJet Pro MFP 3303SDW Wireless Duplex Printer', '3', 2147483647, 'For Small medium businesses, Print from a phone or tablet, Two-sided printing, Scan to PDF, Touchscreen\r\n\r\n', '3-czone.com.pk-1540-17782-070225063242.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro MFP', 'Functions: Print, copy, scan', 'Print quality black (best): Up to 600 x 600 dpi', 'Print speed black (ISO, letter) Up to 26 ppm *', 'Duplex printing', 109900.00, 0.00),
(44, '', 'HP Color LaserJet Pro MFP 3303FDW Printer', '3', 2147483647, 'Wireless, Print, Scan, Copy, Fax, ADF, Automatic 2-sided printing\r\n\r\n', '9-czone.com.pk-1540-17785-070225070557.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro MFP', 'Functions: Print, copy, scan, fax', 'Print speed: Print speed up to 25 ppm (black) and 25 ppm (color)*', 'Print quality black (best): Up to 600 x 600 dpi', 'Automatic document feeder capacity: Standard, 50 sheets', 133990.00, 0.00),
(45, '', 'HP Color LaserJet Pro MFP 4303FDW Printer (5HH67A)', '3', 2147483647, 'Get blazing-fast color printing, reliable hardware, and easy, secure remote management.\r\n\r\n', '16-czone.com.pk-1540-16342-010724085237.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro MFP', 'Functions: Print, copy, scan, fax', 'Print speed: Print speed up to 33 ppm black & color (A4)', 'Print quality black (best): Up to 600 x 600 dpi', 'Automatic document feeder capacity: Standard, 50 sheets uncurled', 154990.00, 0.00),
(46, '', 'HP Color LaserJet Pro MFP 4303FDN Printer', '4', 2147483647, 'Get blazing-fast color printing, reliable hardware, and easy, secure remote management.\r\n\r\n', '6-czone.com.pk-1540-17792-080225083702.jpg', 'LaserJet Colour Printers', 'Color LaserJet Pro MFP', 'Functions: Print, copy, scan, fax', 'Print speed: Print speed up to 33 ppm black & color (A4)', 'Up to 600 x 600 dpi; Up to 38,400 x 600 enhanced dpi', 'Automatic document feeder capacity: Standard, 50 sheets uncurled', 175000.00, 0.00),
(47, '', 'HP LaserJet Enterprise MFP M528DN Printer (Official Warranty)', '5', 2147483647, 'Keep up with the demands of your business with a multi-function unit you can rely on with the MFP M528dn Monochrome Laser Printer from HP.\r\n\r\n', '1574257515-img-1279347-1540-10153-070920090338.jpg', 'LaserJet Black & White Printers', 'LaserJet Enterprise MFP', 'Print, Scan, Copy', 'Print Speed: 45 ppm', 'Print Resolution: 1200 x 1200 dpi', '8\" Color Touchscreen', 489000.00, 0.00),
(48, '', 'HP LaserJet Enterprise MFP M725DN All-in-One Monochrome Laser Printer (Official Warranty)', '5', 2147483647, 'Print on a wide range of paper sizes—up to A3—with a standard 600-sheet input capacity. Preview and edit scanning jobs. Centrally manage printing policies. Safeguard sensitive business information.\r\n\r\n', '1493051440-img-787007-1540-8594-230919112832.jpg', 'LaserJet Black & White Printers', 'LaserJet Enterprise MFP', 'Print, copy, scan', 'Print speed letter: Up to 40 ppm (black)', 'Print Resolution: 1200 x 1200 dpi', 'Maximum Print Size: 12.3 x 18.5\"', 845000.00, 0.00),
(49, '', 'HP Color LaserJet Enterprise M554dn Printer - Auto Duplex', '3', 2147483647, 'The office printers professionals prefer: Print consistently high-quality, 2-sided color documents with the HP Color LaserJet Enterprise M554dn, a color duplex laser printer that combines strong security, high-speed performance, and smart sustainability.\r', '6-czone.com.pk-1540-13264-070622085655.jpg', 'LaserJet Colour Printers', 'Color LaserJet Enterprise', 'Print only', 'Print speed letter: Up to 35 ppm (black and color)', 'Auto duplex printing; 2 paper trays (standard); 2.7-in color display', 'The world’s most secure printing', 175000.00, 0.00),
(50, '', 'HP Color LaserJet Enterprise M455DN Printer - Automatic Duplex Printer (Official Warranty)', '3', 353080724, 'Work faster and smarter and grow your business with the LaserJet Enterprise M455dn Color Laser Printer from HP.\r\n\r\n', '20-czone.com.pk-1540-12411-081121102009.jpg', 'LaserJet Colour Printers', 'Color LaserJet Enterprise', 'Simplex Color Print Speed: Up to 29 ppm', 'Duplex Color Print Speed: Up to 25 ppm', 'Max Print Resolution: 1200 x 1200 dpi', 'Automatic Duplex Printing', 195000.00, 0.00),
(51, '', 'HP Color LaserJet Enterprise M555dn Duplex Printer', '3', 2147483647, 'Workteams will create high-impact documents that get noticed with the brilliant color delivered by HP office Color Laser printers.\r\n\r\n', '6-czone.com.pk-1540-13264-070622085655.jpg', 'LaserJet Colour Printers', 'Color LaserJet Enterprise', 'Print speed letter: Up to 40 ppm (black and color)', 'Dynamic security enabled printer', 'Auto duplex printing; 2 paper trays (standard)', 'FCC Class A emissions', 205000.00, 0.00),
(52, '', 'HP Color LaserJet Enterprise 5700dn Printer (Official Warranty) Auto Duplex', '4', 2147483647, 'Transform your workflows with advanced capabilities in a compact footprint.\r\n\r\n', '10-czone.com.pk-1540-17601-100125094406.jpg', 'LaserJet Colour Printers', 'Color LaserJet Enterprise', 'Print only', 'Print speed letter: Up to 45 ppm (black and color)', 'Auto duplex printing', '2 paper trays', 299000.00, 0.00),
(53, '', 'HP Color LaserJet Enterprise M751dn Laser Printer A3 (Official Warranty)', '5', 2147483647, 'Print premium, professional-quality documents with vivid color images and graphics with the Color LaserJet Enterprise M751dn Laser Printer from HP.\r\n\r\n', '3-czone.com.pk-1540-13326-200622062053.jpg', 'LaserJet Colour Printers', 'Color LaserJet Enterprise', 'Automatic Two-Sided Printing', 'Print Resolution: 1200 x 1200 dpi', 'Color Print Speed: 40 ppm', '100-Sheet MP Tray & One 550-Sheet Tray', 760000.00, 0.00),
(54, '', 'HP Color LaserJet Enterprise MFP M776dn Printer (Official Warranty)', '5', 2147483647, 'Work stands out with exceptional color performance.\r\n\r\n', '32-czone.com.pk-1540-16302-250624011710.jpg', 'LaserJet Colour Printers', 'Color LaserJet Enterprise', 'Print, copy, scan, digital send', 'Resolution (color): Up to 1200 x 1200 dpi', 'Automatic paper sensor', 'A3 Media Supported', 950000.00, 0.00),
(55, '', 'HP Color LaserJet Pro M751dn Laser Printer A3 (Official Warranty)', '5', 2147483647, 'Print premium, professional-quality documents with vivid color images and graphics with the Color LaserJet Enterprise M751dn Laser Printer from HP.\r\n\r\n', '3-czone.com.pk-1540-13326-200622062053.jpg', 'LaserJet Colour Printers', 'LaserJet Pro.', 'Automatic Two-Sided Printing', 'Print Resolution: 1200 x 1200 dpi', 'Color Print Speed: 40 ppm', '100-Sheet MP Tray & One 550-Sheet Tray', 760000.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `processors`
--

CREATE TABLE `processors` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processors`
--

INSERT INTO `processors` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'Intel Core i3-12100 Processor LGA1700 12th Gen 4 Cores 8 Threads | Tray Pack', '4', 1207240323, 'Power up your productivity, gaming, and content-creation experiences by installing the Intel Core i3-12100 3.3 GHz Quad-Core LGA 1700 Processor into your desktop computer system.\r\n\r\n', '3-czone.com.pk-1540-14524-240323071039.jpg', 'Intel Core i3 Processors', 'Intel', '12M Cache, up to 4.30 GHz', '4 Cores - 8 Threads', '12 MB Intel® Smart Cache', 'Memory Types: Up to DDR5 4800 MT/s Up to DDR4 3200 MT/s', '22500', ''),
(3, '', 'Intel® Core™ i3 processor 14100F Desktop Processor - Chip Only - Tray Pack', '5', 2147483647, 'Built with the Intel 7 process, this entry-level 14th-generation desktop processor delivers optimized power efficiency with four 3.5 GHz Performance cores while fitting the LGA 1700 socket.\r\n\r\n', '3-czone.com.pk-1540-16376-090724101007-1540-16413-1207240728-1540-17282-091124105325.jpg', 'Intel Core i3 Processors', 'Intel', '4 Cores, 8 Threads', '3.5 GHz Base Clock Speed', '4.7 GHz Max Turbo Frequency', 'LGA 1700 Socket', '34000', ''),
(4, '', 'AMD Ryzen 7 5800X AM4 Desktop Processor | Unlocked for Overclocking', '4', 2147483647, 'AMD Ryzen™ 7 5800X comes with 8 cores optimised for high-FPS gaming rigs.\r\n\r\n', '9-czone.com.pk-1540-10984-290121012148.jpg', 'AMD Ryzen 7', 'AMD', '8 Cores & 16 Threads', '3.8 GHz Base Clock', '4.7 GHz Max Boost Clock', 'Desktops , Boxed Processor, Vermeer', '51500', ''),
(5, '', 'AMD Ryzen 7 7800X3D Gaming Processor Socket AM5 Tray', '5', 2147483647, 'Whatever the setting, whatever the resolution, lead your team to victory with this incredible gaming processor. Plus, enjoy the benefits of next-gen AMD 3D V-Cache™ technology for low latency and even more game performance.*\r\n\r\n', 'czone.com.pk-1540-17989-100325074348.jpg', 'AMD Ryzen 7', 'AMD', '# of CPU Cores 8', '# of Threads 16', 'The Ultimate Gaming Processor', 'CPU Socket AM5', '105000', ''),
(6, '', 'AMD Ryzen 9 5950X AM4 Desktop Processor 16 Cores 32 Threads', '4', 0, 'Power up your computing experience with the AMD Ryzen 9 5950X 3.4 GHz 16-Core AM4 Processor, which features 16 cores and 32 threads to help quickly load and multitask demanding applications.\r\n\r\n', '2-czone.com.pk-1540-12487-231121033530.jpg', 'AMD Ryzen 9', 'AMD', '16 Cores & 32 Threads', '4.9 GHz Max Boost Clock', 'Precision Boost 2 | Precision Boost Overdrive | AMD StoreMI Technology', 'AMD Ryzen VR Ready Premium | AMD Ryzen Master Utility', '82990', ''),
(7, '', 'AMD Ryzen 9 9950X Processor Zen 5 AM5, Unlocked Desktop Processor', '5', 2147483647, 'When You Want the Best for Gaming and Creating\r\n\r\n', '16-czone.com.pk-1540-16998-250924102744.jpg', 'AMD Ryzen 9', 'AMD', 'Desktops , Boxed Processor', 'Zen 5, Up to 5.7 GHz', '# of CPU Cores 16', '# of Threads 32', '153000', ''),
(8, '', 'Intel Core i5-12400F Processor - LGA 1700 - 6 Cores | 12 Threads (Tray Pack)', '3', 270223407, 'Intel Core i5-12400F - Core i5 12th Gen Alder Lake 6-Core 2.5 GHz LGA 1700 65W Desktop Processor.\r\n\r\n', '13-czone.com.pk-1540-14134-191222074918.jpg', 'Intel Core i5 Processors', 'Intel', '6 Cores & 12 Threads', '4.4 GHz Maximum Turbo Frequency', 'LGA 1700 Socket', '18 MB Intel® Smart Cache', '32800', ''),
(9, '', 'Intel Core i5-13600K Desktop Processor - 24M Cache - 14 Cores - 20 Threads - BX8071513600K - Unlocked - LGA1700 13th Gen', '5', 2147483647, 'With the fastest chip ever built by Intel, take your PC setup to all new heights.\r\n\r\n', '11-czone.com.pk-1540-14126-161222094002.jpg', 'Intel Core i5 Processors', 'Intel', 'Products formerly Raptor Lake', 'Total Cores 14', 'Max Turbo Frequency 5.10 GHz', 'Intel® UHD Graphics 770', '68000', '');

-- --------------------------------------------------------

--
-- Table structure for table `processors_brand`
--

CREATE TABLE `processors_brand` (
  `id` int(11) NOT NULL,
  `processorsbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processors_brand`
--

INSERT INTO `processors_brand` (`id`, `processorsbrand`, `created_at`) VALUES
(3, 'Intel', '2025-05-28 11:48:06'),
(4, 'AMD', '2025-05-28 11:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `processors_store`
--

CREATE TABLE `processors_store` (
  `id` int(11) NOT NULL,
  `processorsstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processors_store`
--

INSERT INTO `processors_store` (`id`, `processorsstore`, `created_at`) VALUES
(3, 'Intel Core i3 Processors', '2025-05-28 11:47:42'),
(4, 'Intel Core i5 Processors', '2025-05-28 11:47:46'),
(8, 'AMD Ryzen 7', '2025-05-28 11:55:40'),
(9, 'AMD Ryzen 9', '2025-05-28 11:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `processor_store`
--

CREATE TABLE `processor_store` (
  `id` int(11) NOT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `processor_store`
--

INSERT INTO `processor_store` (`id`, `processor`, `created_at`) VALUES
(9, 'Core i7 11th', '2025-04-11 05:30:34'),
(10, 'Core i7 10th', '2025-04-11 05:30:39'),
(11, 'Core i5 11th', '2025-04-11 05:30:43'),
(12, 'Core i5 10th', '2025-04-11 05:30:47'),
(13, 'Core i5 8th', '2025-04-11 05:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `codee` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `old_price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `offer`, `name`, `review`, `codee`, `description`, `image`, `brand`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(36, '11', 'Lenovo IdeaPad Slim 3 15AMN8 Laptop - AMD Ryzen 3 7320U, 8GB DDR5, 256GB SSD, 15.6\" FHD IPS Display, WiFi 6 - 82XQ00B5PS - Arctic Grey (Official Warranty)', '4', '197528236179', 'Make a statement wherever you go with the IdeaPad Slim 3 Gen 8 laptop, built for lightness and thinness, measuring up to 10% slimmer than the previous generation.\r\n\r\n', '1-czone.com.pk-1540-15436-101123091100.jpg', '3', 'AMD Ryzen™ 3 7320U Processor, 4 Core', '8GB Soldered LPDDR5-5500, 256GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'Integrated AMD Radeon™ 610M Graphics, FHD 1080p with Privacy Shutter Camera', '15.6\" FHD (1920x1080) IPS 300nits Anti-glare, WiFi 6', '101900', '115000'),
(38, '', 'HP 15-FD0131WM Laptop | Intel® Core™ i3-N305 8GB 256GB Windows 11 15.6\" FHD IPS | Natural Silver 9C9A2UA', '3', '197961329582', 'Say hello to the reliable PCs that easily pass the vibe check.\r\n\r\n', '1-czone.com.pk-1540-15436-101123091100.jpg', '2', 'Intel® Core™ i3-N305 8 Core - Windows 11 Home - Natural Silver', '8 GB DDR4-3200 MT/s - 256 GB PCIe® NVMe™ M.2 SSD', 'Intel® UHD Graphics - Realtek Wi-Fi 6', '15.6\" FHD IPS Display', '102990', ''),
(40, '', 'Lenovo IdeaPad Slim 3 15IRU8 Laptop | Intel® Core™ i3-1315U 8GB 256GB 15.6\" FHD | Arctic Grey - 82X700BVPS', '3', '198153782444', 'Up to 13th Gen Intel® Core™ Processors.\r\n\r\n', '1-czone.com.pk-1540-15436-101123091100.jpg', '3', 'Intel® Core™ i3-1315U, 6C, Arctic Grey', '8GB Soldered LPDDR5-4800, 256GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'Wi-Fi® 6, Integrated Intel® UHD Graphics', '15.6\" FHD (1920x1080) Display', '102900', ''),
(42, '', 'ASUS Vivobook 15 X1504VA-NJ816 Laptop | Intel® Core™ i3-1315U 4GB 512GB 15.6\" FHD Display - Quiet Blue (Official Warranty)', '4', '197105432130', 'Turn everyday tasks into something special with Vivobook 15, your essential tool for getting things done easier, anywhere.\r\n\r\n', '4-czone.com.pk-1540-16934-110924091647.jpg', '4', 'Intel® Core™ i3-1315U Processor 6C, Intel® UHD Graphics', '4GB DDR4 Memory - 512GB M.2 NVMe™ PCIe® 3.0 SSD', '720p HD camera, With privacy shutter', '15.6-inch, FHD (1920 x 1080) TÜV Rheinland-certified Display', '112000', ''),
(43, '8', 'HP 250 G10 Laptop - Intel Core i3-1315U, 8GB, 512GB SSD, WiFi 6, Backlit KB, 15.6\" FHD Display', '4', '197961527100', 'The budget-friendly, business-ready HP 250 G10 Laptop provides essential power and productivity features in a thin and light design with a large 15.6-inch diagonal display.\r\n\r\n', '13-czone.com.pk-1540-15630-080124093758.jpg', '2', '13th Gen Intel® Core™ i3-1315U, 6 Cores', '8GB DDR4 3200 Memory / 512 GB PCIe® NVMe™ SSD', 'WiFi 6 - Intel® UHD Graphics, Backlit KB, 1080p FHD Camera', 'FreeDOS, 15.6\" diagonal FHD Display', '114990', '109999'),
(44, '', 'IdeaPad Slim 3 15IRU9 Touchscreen Laptop | Intel Core 3 100U 8GB DDR5 512GB SSD Backlit KB Windows 11 Fingerprint Reader 15.6\" FHD IPS Touchscreen | 83E60001US Abyss Blue', '5', '197531284457', 'Make a statement wherever you go with the IdeaPad Slim 3 Gen 8 laptop, built for lightness and thinness, measuring up to 10% slimmer than the previous generation.\r\n\r\n', '8-czone.com.pk-1540-17525-171224091315 (1).jpg', '3', 'Intel® Core™ 3 100U, 6C - Integrated Intel® Graphics - Abyss Blue', '8GB Soldered DDR5-5200, 512GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'Backlit KB, Windows 11, Wi-Fi 6, Fingerprint Reader', '15.6\" FHD (1920x1080) IPS 300nits Touchscreen', '116990', ''),
(46, '', 'ASUS VivoBook F1504 Laptop | Intel Core i5-1235U | 8GB DDR4 | 256GB SSD | Intel Iris Xe Graphics | 15.6\" FHD Display | Windows 11| Quiet Blue', '3', '0245260124', 'Make every day your day\r\n\r\n', '8-czone.com.pk-1540-17525-171224091315.jpg', '4', 'Intel® Core™ i5-1235U Processor', '8GB DDR4 Memory | 256GB M.2 NVMe™ PCIe® 3.0 SSD', 'Intel Iris Xe Graphics', '15.6\" FHD Display | Windows 11 Home', '121900', ''),
(47, '', 'Dell Inspiron 15 3520 Laptop - Intel Core i5-1235U, 8GB, 512GB SSD, 15.6\" FHD 120Hz Windows 11 Home | Carbon Black', '5', '884116461807', 'Experience responsive yet quiet performance, featuring up to 12th generation Intel® Core™ processors combined with PCIe SSD options.\r\n\r\n', 'copy-copy-19-czone.com.pk-1540-14648-050523085907.jpg', '1', 'Intel Core i5-1235U Processor - Carbon Black Cover', '8GB DDR4 2666MHz - 512GB M.2 PCIe NVMe SSD', 'Intel UHD Graphics - Wi-Fi 6 AX 2x2', '15.6\" FHD 120Hz Narrow Border Display - Windows 11', '126990', ''),
(48, '11', 'Dell Vostro 3520 Laptop Intel Core i5-1235U 8GB DDR4 512GB SSD 15.6\" FHD 120Hz Display | Carbon Black', '4', '0353080724', 'Everyday tasks are quickly handled with ease using up to 12th Gen Intel® Core™ Processors.\r\n\r\n', 'copy-copy-copy-copy-42-czone.com.pk-1540-14813-160623102605.jpg', '1', 'Intel® Core™ i5-1235U Processor 10C', '8GB 2666MHz DDR4 - 512GB M.2 PCIe NVMe SSD', 'Intel UHD Graphics - WiFi 5', '15.6\" FHD 120Hz 250n Narrow Border Display', '128900', '145000'),
(49, '', 'Dell Latitude 3340 2-in-1 Touchscreen Laptop | Intel® Core™ i5-1335U, 8GB DDR5, 256GB SSD, Intel Iris Xe Graphics, 13.3\" FHD Touchscreen, Windows 11 Home | New Laptop - Without Box', '5', '241116590305', 'Dell Latitude 3340 13.3\" Notebook\r\n\r\n', '35-czone.com.pk-1540-17321-161124110414.jpg', '1', 'Intel® Core™ i5-1335U Processor 10C', '8 GB LPDDR5 - 256 GB SSD', 'Intel® Iris® Xe Graphics', '13.3\" FHD Touchscreen x360 - Windows 11 Home', '129990', ''),
(51, '', 'Lenovo Yoga 7 2-in-1 14AHP9 2-in-1 Laptop | AMD Ryzen™ 5 8640HS 8GB DDR5 512GB SSD 14\" WUXGA IPS Touchscreen Windows 11 | 83DK000DUS', '5', '197531579188', '14\" WUXGA (1920x1200) IPS 300nits Glossy / Anti-fingerprint, 45% NTSC, 60Hz, Dolby Vision®, TÜV Low Blue Light, Glass, Touch\r\n\r\n', '22-czone.com.pk-1540-16734-100824105905.jpg', '3', 'AMD Ryzen™ 5 8640HS 6C - AMD Ryzen™ AI', '8GB Soldered LPDDR5-6400 - 512GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'Integrated AMD Radeon™ 760M Graphics', '14\" WUXGA IPS Touchscreen - Windows® 11 Home', '174990', ''),
(52, '', 'HP ProBook 440 G10 Notebook PC | Intel® Core™ i5-1335U 8GB DDR4 512GB SSD Backlit KB Fingerprint Reader 14\" FHD IPS Display | 816N0EA', '5', '196786986871', 'Intel® Core™ i5-1335U (up to 4.6 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 10 cores, 12 threads)\r\n\r\n', 'copy-copy-copy-13-czone.com.pk-1540-16273-220624073608.jpg', '2', 'Intel® Core™ i5-1335U | FreeDOS | Intel® UHD Graphics', '8 GB DDR4-3200 MT/s | 512 GB PCIe® NVMe™ SSD', 'Backlit KB, 720p HD Camera, Fingerprint Sensor', '14\" FHD IPS Narrow Bezel Display | Pike Silver Aluminum', '177900', ''),
(53, '', 'Victus by HP 15-FA0033DX Gaming Laptop | Intel® Core™ i5-12450H 8GB 512GB, NVIDIA GeForce RTX 3050 4GB GDDR6, 15.6\" FHD 144Hz, Backlit KB, Windows 11 | Performance Blue', '5', '198122159987', 'It\'s time to start your gaming adventure. Keep up with the biggest games and the best players. The processor and graphics are all sleekly designed in a mighty little package. \r\n\r\n', '1-czone.com.pk-1540-16406-120225115411.jpg', '2', 'Intel® Core™ i5-12450H Processor | Windows 11', '8GB DDR4 3200MHz Memory - 512GB SSD', 'NVIDIA GeForce RTX 3050 4GB GDDR6', '15.6\" FHD 144Hz IPS, Backlit KB, Wi-Fi 6', '177990', ''),
(54, '15', 'MSI Thin 15 B13UC-1000US Gaming Laptop | Intel Core i5-13420H 16GB 512GB NVIDIA Geforce RTX 3050 4GB Windows 11 15.6\" FHD 144Hz', '5', '824142343463', 'More power from the jump. Get ready to game on your terms.\r\n\r\n', '3-czone.com.pk-1540-17705-120225120233.jpg', '6', 'Intel Core i5-13420H - Windows 11 Home', '16GB (8G*2) DDR4 3200MHz - 512GB NVMe SSD', 'NVIDIA Geforce RTX 3050 (4GB GDDR6) | Wi-Fi 6E (802.11ax)', '15.6\" FHD 1920 x 1080 144Hz Display', '181990', '215000'),
(55, '12', 'Lenovo Yoga 7i 2-in-1 16IML9 2K Touchscreen AI Laptop | Intel® Core™ Ultra 5 125U, 16GB DDR5, 512GB SSD, Backlit KB, Windows 11, Fingerprint Reader, 16\" WUXGA IPS Anti-Fingerprint Touchscreen Display | 83DL0000US Storm Grey', '5', '197531069191', 'It’s inspiration all around with the Lenovo Yoga 7i 2-in-1, delivering 360° of flexibility, and impressive performance.\r\n\r\n', '13-czone.com.pk-1540-17527-171224093426.jpg', '3', 'Intel® Core™ Ultra 5 125U, 12C, Integrated Intel® AI Boost, up to 11 TOPS', '16GB Soldered LPDDR5x-7467, 512GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'Backlit KB, Windows 11, WiFi 6E, Fingerprint Reader', '16\" WUXGA (1920x1200) IPS 300nits Glossy Anti-Fingerprint Touchscreen', '184990', '210000'),
(57, '6', 'Apple MacBook Air 13.3\" MGN63 Space Gray, M1 8-Core 8GB 256GB SSD', '5', '194252056110', 'The Apple 13\" MacBook Air features Apple\'s first chip designed specifically for Mac. The Apple M1 integrates the CPU, GPU, Neural Engine, I/O, and more into a single system on a chip (SoC). Tackle your projects with the fast 8-Core CPU and take on graphic', '4-czone.com.pk-1540-10682-140225042022.jpg', '5', 'Apple M1 8-Core CPU', '8GB Unified RAM | 256GB SSD', '13.3\" 2560 x 1600 Retina IPS Display', '7-Core GPU | 16-Core Neural Engine', '201990', '215000'),
(59, '', 'MSI THIN 15 Gaming Laptop | Intel® Core™ i5-13420H 16GB DDR4 512GB SSD NVIDIA GeForce RTX 4050 15.6\" FHD 144Hz Display | THIN15131451', '3', '824142352038', 'Thin 15 B13V Gaming Laptop\r\n\r\n', '5-czone.com.pk-1540-17463-071224113637.jpg', '6', 'Intel® Core™ i5-13420H Processor - Windows 11 Home', '16GB DDR4 3200MHz Memory - 512GB NVMe SSD', 'NVIDIA GeForce RTX 4050 DLSS 3 6GB', '15.6\" FHD 144Hz Display', '219990', ''),
(60, '19', 'Apple MacBook Air 13.6\" - M2 8-Core, 8GB, 256GB SSD, 8-Core GPU, Space Gray - MLXW3LL/A', '5', '194253080411', 'The Apple 13.6\" MacBook Air now features the Apple M2 chip, which has many improvements over its predecessor, the M1.\r\n\r\n', '16-czone.com.pk-1540-13519-100822053757.jpg', '5', 'Apple M2 8-Core Chip', '8GB Unified RAM | 256GB SSD', '8-Core GPU | 16-Core Neural Engine', '13.6\" 2560 x 1664 Liquid Retina Display', '248000', '305000'),
(61, '', 'Apple MacBook Air 13\" | Apple M3 8-Core Chip 16GB 256GB 8-Core GPU 13.6\" Display | MC8G4 Space Gray', '5', 'MC8G4', 'Apple 13\" MacBook Air\r\n\r\n', '1-czone.com.pk-1540-17418-291124072921.jpg', '5', 'Apple M3 8-Core Chip', '16GB Unified RAM | 256GB SSD', '8-Core GPU | 16-Core Neural Engine', '13.6\" 2560 x 1664 Liquid Retina Display', '303990', ''),
(62, '', 'Apple MacBook Air 15.3\" Laptop | Apple M3 8-Core Chip | Space Gray MRYM3', '5', 'MRYM3', 'The Space Gray Apple 15\" MacBook Air now features the Apple M3 chip, which has many improvements over its predecessor, the M2. Now built on 3nm process technology, the M3 8-Core Chip is combined with a 10-Core GPU.\r\n\r\n', '1-czone.com.pk-1540-17418-291124072921.jpg', '5', 'Apple M3 8-Core Chip', '8GB Unified RAM | 256GB SSD', '10-Core GPU | 16-Core Neural Engine', '15.3\" 2880 x 1864 Liquid Retina Display', '340000', ''),
(63, '8', 'MSI Katana 15 Gaming Laptop | Intel Core i7 13620H NVIDIA GeForce RTX 4050 16GB DDR5, 1TB NVMe SSD Win11 Home Black B13VEK-277US', '5', '824142342077', 'MSI Katana 15 B13VEK-277US 15.6\" Gaming Laptop B13VEK-277US\r\n', '1-czone.com.pk-1540-17549-020125040740.jpg', '6', 'Intel Core i7 13th Gen 13620H 1.8GHz Processor', '16GB DDR5-4800 RAM, 1TB SSD', 'NVIDIA GeForce RTX 4050 6GB GDDR6', '15.6\'\' Full HD IPS 144Hz', '285000', '310000'),
(64, '', 'Apple MacBook Air 13\" | Apple M2 8-Core Chip - 16GB Memory - 256GB SSD - 8-Core GPU - 13.6\" Retina Display - Midnight MC7X4', '5', '241116590305', 'The Apple 13\" MacBook Air now features the Apple M2 chip, which has many improvements over its predecessor, the M1.\r\n\r\n', '5-czone.com.pk-1540-17363-211124114315.jpg', '5', 'Apple M2 8-Core Chip', '16GB Unified RAM | 256GB SSD', '8-Core GPU | 16-Core Neural Engine', '13.6\" 2560 x 1664 Liquid Retina Display', '269990', ''),
(65, '', 'Apple MacBook Air 13\" | M3 8-Core Chip 16GB 256GB - Starlight MC8J4', '5', '0353080724', 'Now built on 3nm process technology, the M3 8-Core Chip is combined with a 8-Core GPU.\r\n\r\n', '17-czone.com.pk-1540-17706-220125094556.jpg', '5', 'Apple M3 8-Core Chip', '16GB Unified RAM | 256GB SSD', '8-Core GPU | 16-Core Neural Engine', '13.6\" 2560 x 1664 Liquid Retina Display', '303990', ''),
(66, '', 'Apple MacBook Pro 14\" - Apple M4 Pro 14-Core 24GB 1TB 20-Core GPU - Silver - MX2F3', '5', 'Product Code:  MX2F3 MX2J3', 'Supercharged with their M4 chip and Apple Intelligence\r\n\r\n', '17-czone.com.pk-1540-17615-130125094520.jpg', '5', 'Apple M4 Pro 14-Core Chip', '24GB Unified RAM | 1TB SSD', '20-Core GPU | 16-Core Neural Engine', '14\" 3024 x 1964 Liquid Retina XDR Screen', '698000', ''),
(67, '', 'Apple MacBook Pro 16.2\" - Apple M2 Max Chip 12-Core CPU, 32GB, 1TB SSD, 38-Core GPU | Space Gray - MNWA3', '4', 'MNWA3', 'Supercharged by M2 Pro or M2 Max, MacBook Pro takes its power and efficiency further than ever. It delivers exceptional performance whether it’s plugged in or not and now has an even longer battery life. Combined with a stunning Liquid Retina XDR display ', 'copy-copy-copy-1-czone.com.pk-1-1540-14432-280223070320.jpg', '5', 'Apple M2 Max Chip - 12-Core CPU', '32GB Unified Memory - 1TB SSD', '38-Core GPU - 16-Core Neural Engine', '16.2\" 3456x2234 Liquid Retina XDR display - Bluetooth 5.3 - macOS', '790000', ''),
(69, '', 'Dell XPS 13 9340 Laptop | Intel® Core™ Ultra 7 Processor 155H 16GB 512GB Backlit KB Fingerprint Reader Windows 11 Pro 13.4\" FHD+ Display | Platinum', '4', '0245260124', 'Create like never before with XPS 13.\r\n\r\n', '15-czone.com.pk-1540-16699-080824091710.jpg', '1', 'Intel® Core™ Ultra 7 Processor 155H (24MB Cache, 16 cores, up to 4.8 GHz)', '16GB LPDDR5X 7467MT/s | 512 GB M.2 PCIe NVMe SSD', 'Backlit KB, Fingerprint Reader, Intel® Arc™ Graphics', 'Windows 11 Pro, 13.4\" FHD+ 1920 x 1200 30-120Hz EyeSafe', '399900', ''),
(72, '', 'Asus ROG Strix G18 G814 Gaming Laptop | G814JVR-N6035 | Intel® Core™ i9 processor 14900HX - 16GB DDR5 - 1TB NVMe SSD - NVIDIA® RTX 4060 8GB - 18\" WQXGA (2560 x 1600) 240hz Display - Backlit KB | 2 - Year Warranty', '4', ' 0245260124', 'Power up your play.\r\n\r\n', '11-czone.com.pk-1540-16808-210824091826.jpg', '4', 'Intel® Core™ i9 processor 14900HX 24C', '16GB DDR5 Memory - 1TB SSD NVMe', 'NVIDIA® GeForce RTX 4060 8GB', '18\" WQXGA (2560 x 1600) 240hz Display - Backlit KB', '540000', ''),
(74, '', 'Lenovo ThinkPad X1 Carbon Gen 12 | Intel Core Ultra 7 155U 16GB 1TB Backlit KB Windows 11 Pro 14\" WUXGA IPS (Official Warranty)', '3', '21KC001QGP', 'Part Number: 21KC001QGP\r\n\r\n', '1-czone.com.pk-1540-17736-290125101113.jpg', '3', 'Intel® Core™ Ultra 7 155U, 12C | AI PC | Integrated Intel® AI Boost', '16GB Soldered LPDDR5x-6400 | 1TB SSD M.2 2280 PCIe® 4.0x4 Performance NVMe®', 'Backlit KB, Windows 11 Pro', '14\" WUXGA (1920x1200) IPS 400nits Anti-glare, 100% sRGB', '619900', ''),
(75, '18', 'ASUS TUF F15 FX507VI Gaming Laptop - Intel Core i7-13620H 16GB DDR5 1TB SSD NVIDIA GeForce RTX 4070 8GB GDDR6 Backlit KB 15.6\" FHD IPS 144Hz Display Windows 11 - Mecha Grey', '4', '197105432130', 'Asus TUF Gaming laptop is an unbeatable gaming laptop with a powerful 13th generation Intel Processor and Nvidia RTX Graphics which turns the laptop into an exceptional gaming machine with 16GB RAM and sufficient SSD Storage\r\n\r\n', '2-czone.com.pk-1540-16599-300724082743.jpg', '4', '16GB DDR5-4800 SO-DIMM, 1TB PCIe® 4.0 NVMe™ M.2 SSD', '13th Gen Intel® Core™ i7-13620H 10C, Windows 11', 'NVIDIA® GeForce RTX™ 4070 Laptop GPU, RGB Backlit Chiclet Keyboard', '15.6\" FHD IPS 144Hz', '346000', '420000'),
(76, '', 'Apple MacBook Air 15.3\" Laptop | Apple M3 8-Core Chip | MRYU3 Midnight', '5', 'MRYU3', 'The Space Gray Apple 15\" MacBook Air now features the Apple M3 chip, which has many improvements over its predecessor, the M2. Now built on 3nm process technology, the M3 8-Core Chip is combined with a 10-Core GPU.\r\n\r\n', '26-czone.com.pk-1540-16345-010724094208.jpg', '5', 'Apple M3 8-Core Chip', '8GB Unified RAM | 256GB SSD', '10-Core GPU | 16-Core Neural Engine', '15.3\" 2880 x 1864 Liquid Retina Display', '348900', ''),
(77, '8', 'Lenovo Legion 5 16IRX9 Gaming Laptop | AI-Powered, Intel Core i7-14650HX 16GB 512GB, NVIDIA GeForce RTX 4060 8GB, 16\" WQXGA (2560x1600) IPS | 83DG004NUS Luna Grey', '3', '241116590305', 'Elevate Your Game The brand-new Legion 5i is your ideal companion, perfectly suited for both thrilling gaming escapades and conquering demanding STEM projects.\r\n\r\n', '22-czone.com.pk-1540-17564-050125074307.jpg', '3', 'Intel® Core™ i7-14650HX, 16C, Windows 11 Home', '16GB SO-DIMM DDR5-5600 - 512GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'NVIDIA GeForce RTX 4060 8GB GDDR6 Boost Clock 2370MHz TGP 140W, 233 AI TOPS', '16\" WQXGA (2560x1600) IPS 350nits G-SYNC 100% sRGB 165hz', '355000', '385000'),
(78, '7', 'HP Victus 15 FA1657NR Gaming Laptop | Intel® Core™ i7-13620H, 16GB DDR4, 512GB SSD, GeForce RTX 4060 8GB, 15.6\" FHD 144Hz 9ms IPS Display | Performance Blue', '4', '198701387626', '(15.6\") diagonal, FHD (1920 x 1080), 144 Hz, 9 ms response time, IPS, micro-edge, anti-glare, 250 nits, 45% NTSC\r\n\r\n', '5-czone.com.pk-1540-17343-191124093449.jpg', '2', 'Intel® Core™ i7-13620H Processor', '16GB DDR4 3200 Memory - 512 GB PCIe® NVMe™ TLC M.2 SSD', 'NVIDIA GeForce RTX 4060 8GB GDDR6', '15.6\" FHD 144Hz 9ms IPS Display', '288990', '310000'),
(79, '', 'Lenovo LOQ 15IRX9 Gaming Laptop | Intel Core i7-13650HX | 24GB DDR5 | 512GB SSD | RTX 4050 6GB GDDR6 | 15.6\" FHD IPS Display (Official Warranty)', '5', '241116590305', 'Part Number : 83DV00ULPS\r\n\r\n', 'copy-copy-copy-3-czone.com.pk-1540-16415-120724084638-1540-16751-130824010819.jpg', '3', 'Intel® Core™ i7-13650HX, 14C. AI-Powered Gaming PC', '24GB (2x 12GB) SO-DIMM DDR5-4800 | 512GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'NVIDIA® GeForce RTX 4050 6GB GDDR6', '15.6\" FHD (1920x1080) IPS 300nits Anti-glare, 100% sRGB, 144Hz, G-SYNC®', '305500', ''),
(80, '', 'ASUS TUF GAMING F15 FX507 Laptop | Intel Core i7-13620H 16GB DDR5 1TB SSD - NVIDIA GeForce RTX 4060 8GB GDDR6 - 15.6\" FHD IPS 144Hz Backlit KB', '3', '241116590305', '2023 TUF Gaming F15 is equipped with an Intel Core 13th Gen H-Series CPU and a NVIDIA RTX 4000 Series Laptop GPU. Fluid gameplay awaits on a stunning display. Coupled with military-grade durability lets you take your game anywhere.', '26-czone.com.pk-1540-15885-020524090336.jpg', '4', 'Intel® Core™ i7-13620H Processor', '16GB DDR5 Memory - 1TB SSD', 'NVIDIA® GeForce RTX™ 4060 8GB GDDR6 Graphics', '15.6\" FHD IPS 144Hz - Windows 11 Home', '316000', ''),
(81, '', 'Dell Inspiron 14 7440 2-in-1 Touchscreen Laptop | Intel Core 7 Processor 150U 16GB DDR5 1TB SSD Fingerprint Reader Backlit KB Windows 11 14\" FHD+ Touchscreen | Ice Blue', '4', '884116470304', 'No matter what adventure you chase, the 360° hinge gives you the flexibility to get things done.\r\n\r\n', 'copy-copy-40-czone.com.pk-1540-16199-070624103922.jpg', '1', 'Intel® Core™ 7 processor 150U 10C - Intel® Graphics', '16GB (2x8GB) DDR5 5600MT/s | 1TB M.2 PCIe NVMe SSD', 'Fingerprint Reader, Ice Blue AI Backlit Keyboard, Wi-Fi 6E', 'Windows 11 Home, 14\" 1920 x 1200 (Full HD+) IPS Touchscreen', '221000', ''),
(82, '', 'ASUS Zenbook 14 OLED UM3406 UM3406HA Laptop | AMD Ryzen 7 8840HS |16GB DDR5 | 512GB SSD | Backlit KB | 14\" WUXGA OLED Touchscreen Display', '4', '241116590305', 'Elevate your experience with the sleek and sophisticated Zenbook 14 OLED ultraportable.\r\n\r\n', '15-czone.com.pk-1540-16809-210824094521.jpg', '4', 'AMD Ryzen™ 7 8840HS Processor 8C', '16GB LPDDR5X On Board - 512GB M.2 NVMe™ PCIe® 4.0 SSD', 'AMD Radeon™ Graphics - Backlit KB - Windows 11', '14\" WUXGA (1920 x 1200) OLED Touchscreen Display', '238000', ''),
(83, '', 'Dell Latitude 3540 Laptop - Intel Core i7-1355U, 8GB, 512GB SSD, 15.6\" FHD Display, Backlit KB, Fingerprint Reader, Dell Backpack (Official Warranty)', '4', '884116461807', 'Modern design to boost productivity. Experience uncompromised connectivity. Essential performance for any business.\r\n\r\n', 'copy-1-czone.com.pk-1540-15245-190923094346.jpg', '1', '13th Gen Intel® Core™ i7-1355U Processor', '8GB DDR4 Memory - 512GB M.2 2230 PCIe NVMe SSD', 'Integrated Intel Iris Xe', '15.6\" FHD Display, Backlit KB, Fingerprint Reader', '242900', ''),
(85, '12', 'Lenovo Yoga 7i 2-in-1 16IML9 2K Touchscreen AI Laptop | Intel® Core™ Ultra 5 125U, 16GB DDR5, 512GB SSD, Backlit KB, Windows 11, Fingerprint Reader, 16\" WUXGA IPS Anti-Fingerprint Touchscreen Display | 83DL0000US Storm Grey', '5', '197531069191', 'It’s inspiration all around with the Lenovo Yoga 7i 2-in-1, delivering 360° of flexibility, and impressive performance.\r\n\r\n', '13-czone.com.pk-1540-17527-171224093426.jpg', '3', 'Intel® Core™ Ultra 5 125U, 12C, Integrated Intel® AI Boost, up to 11 TOPS', '16GB Soldered LPDDR5x-7467, 512GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'Backlit KB, Windows 11, WiFi 6E, Fingerprint Reader', '16\" WUXGA (1920x1200) IPS 300nits Glossy Anti-Fingerprint Touchscreen', '184990', '210000'),
(86, '12', 'HP Victus Gaming Laptop 15-FB2063DX 9Z7L4UA | AMD Ryzen™ 5 7535HS, 8GB DDR5, 512GB SSD, AMD Radeon™ RX 6550M 4GB GDDR6, Backlit KB, 15.6\" FHD 144Hz IPS Display, DTS: X Audio | Mica Silver', '5', '198122516209', 'The HP Victus 15 FB2063DX is a high-performance gaming laptop built for immersive gameplay and smooth multitasking.\r\n\r\n', '6-czone.com.pk-1540-17301-131124112143.jpg', '2', 'AMD Ryzen™ 5 7535HS 6C, Windows 11 Home, Mica Silver', '8 GB DDR5-4800 MHz RAM, 512 GB PCIe® Gen4 NVMe™ M.2 SSD', 'AMD Radeon™ RX 6550M Graphics (4 GB GDDR6 Dedicated)', 'Backlit KB, 15.6-inch Diagonal FHD (1920 x 1080) 144Hz IPS Display', '166990', '190000'),
(87, '14', 'HP Pavilion 16T-AF0000 Laptop - Intel® Core™ 5 processor 120U 8GB Memory 512GB SSD Windows 11 16\" WUXGA Display - 954R4AV', '5', '197498976709', 'Meet HP Pavilion 16 Laptop, the one PC for all your needs\r\n\r\n', '14-czone.com.pk-1540-16989-230924084623.jpg', '2', 'Intel® Core™ 5 processor 120U 10C, Intel® Graphics', '8GB Memory, 512GB M.2 2280 PM9B1 PCIe Gen4x4 SSD', 'Windows 11 Home, Wi-Fi 6/6E', '16\" WUXGA (1920 x 1200) Slim IPS Display, Backlit KB', '172000', '199000'),
(88, '', 'Lenovo IdeaPad Slim 3 15IRU9 Touchscreen Laptop | Intel® Core™ 5 120U 8GB 512GB Backlit KB Fingerprint Reader 15.6\" FHD IPS Display | 83E6000AUS Arctic Grey', '4', '197531838629', 'Make a statement wherever you go with the IdeaPad Slim 3 Gen 8 laptop, built for lightness and thinness, measuring up to 10% slimmer than the previous generation.\r\n\r\n', '27-czone.com.pk-1540-17726-240125120240.jpg', '3', 'Intel® Core™ 5 120U 10C - Integrated Intel® Graphics - Windows 11', '8GB Soldered DDR5-5200 - 512GB SSD M.2 2242 PCIe® 4.0x4 NVMe®', 'Backlit KB, Wi-Fi 6, Fingerprint Reader', '15.6\" FHD (1920x1080) IPS 300nits Touchscreen', '143990', ''),
(89, '10', 'Dell Inspiron 15 3530 Laptop - Intel® Core™ i5-1334U - 8GB DDR4 - 512GB SSD - Dell EcoLoop Essential Backpack - 15.6\" FHD 120Hz Display - Platinum Silver (Official Warranty)', '3', '0522181024', 'The Inspiron 15 is as stylish on the outside as it is efficient on the inside. Built with up to 13th Gen Intel® processors, you can finish your to-do list in no time.\r\n\r\n', '6-czone.com.pk-1540-17121-301124100603.jpg', '1', 'Intel® Core™ i5-1334U Processor 10C', '8GB DDR4 2666MHz Memory - 512GB M.2 PCIe NVMe SSD', 'Intel UHD Graphics, Realtek Wi-Fi 6, Dell EcoLoop Essential Backpack', '15.6\" FHD 120Hz Display - Platinum Silver', '147900', '165000'),
(90, '', 'Dell Inspiron 14 7445 2-in-1 Business Laptop | AMD Ryzen 5-8640HS | 8GB DDR5 | 512GB SSD | Backlit KB | 14\" FHD+ IPS Touchscreen | Windows 11 | Midnight Blue', '3', '0245260124', 'Shop the Inspiron 14 2-in-1 7445 with AMD Hawk processors, DDR5 Memory.\r\n\r\n', '1-czone.com.pk-1540-17796-110225095957.jpg', '', 'AMD Ryzen 5-8640HS Processor', '8GB DDR5 Memory | 512GB NVMe M.2 SSD', 'AMD Radeon Graphics | Backlit KB', '14\" FHD+ IPS Touch Screen | Windows 11 Home', '159500', ''),
(93, '', 'Apple MacBook Air 13.6\" M2 8-Core, 10-Core GPU, 16GB, 1TB SSD, Midnight - Z160008FZ', '4', '5565465565', 'The Apple 13.6\" MacBook Air now features the Apple M2 chip, which has many improvements over its predecessor, the M1.\r\n\r\n', '5-czone.com.pk-1540-17363-211124114315.jpg', '5', 'Apple M2 8-Core Chip', '16GB Unified RAM | 1TB SSD', '10-Core GPU | 16-Core Neural Engine', '13.6\" 2560 x 1664 Liquid Retina Display', '432000', '');

-- --------------------------------------------------------

--
-- Table structure for table `projectors`
--

CREATE TABLE `projectors` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectors`
--

INSERT INTO `projectors` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'Acer X1123HP DLP Projector | 4,000 Lumens - Acer LumiSense™ - BlueLightShield™ - SVGA', '5', 2147483647, 'Keep your meetings focused and clear at up to 4,000 lumens and an impressive 20,000:1 contrast ratio.\r\n\r\n', '2-czone.com.pk-1540-17362-211124103605.jpg', 'All Projectors', 'Acer', '4,000 Lumens Brightness', 'SVGA Resolution', 'HDMI 3D Display*', 'Acer LumiSense™', '97500', ''),
(3, '', 'Acer X1226AH 4,000 Lumens DLP Projector - ColorBoost3D', '5', 2147483647, 'Acer Essential series projectors are best value projectors ideal for everyday use, at work or home. Make your presentations more compelling and entertainment more exciting with high brightness, high contrast and DLP® 3D Ready , while adhering to your', '10-czone.com.pk-1540-13537-120723101011.jpg', 'All Projectors', 'Acer', '4,000 Lumens Brightness', 'Acer ColorBoost3D™ - Acer LumiSense™ - Acer BlueLightShield™', 'Acer ColorSafe II', 'Maximum Resolution 1920 x 1200', '105000', ''),
(4, '', 'ViewSonic SP3 4,800 ANSI Lumens SVGA Business Projector, SuperColor™ Technology', '4', 0, 'The ViewSonic SP3 offers impressive visual performance in small business meeting rooms and classrooms.\r\n\r\n', '3-czone.com.pk-1540-17514-141224022448.jpg', 'ViewSonic Projectors', 'ViewSonic', 'Auto Power Off', '22,000:1 contrast ratio', 'SuperColor™ Technology', '5 colour modes', '99990', ''),
(5, '', 'ViewSonic LS921WU 6000 Lumens WUXGA Short Throw Laser Projector', '5', 2147483647, '6,000 ANSI Lumens WUXGA Short Throw Laser Installation Projector\r\n\r\n', '24-czone.com.pk-1540-17650-150125074029.jpg', 'ViewSonic Projectors', 'ViewSonic', '6,000 ANSI Lumens to deliver bright images up to 200\" in size', '2nd generation Laser Phosphor technology with a 20,000-hour lifespan', '0.81-0.89 short throw ratio for minimal space consumption', 'Dual HDMI 2.0b supporting 4K HDR/HLG content', '929990', '');

-- --------------------------------------------------------

--
-- Table structure for table `projectors_brand`
--

CREATE TABLE `projectors_brand` (
  `id` int(11) NOT NULL,
  `projectorsbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectors_brand`
--

INSERT INTO `projectors_brand` (`id`, `projectorsbrand`, `created_at`) VALUES
(3, 'ViewSonic', '2025-05-28 16:38:25'),
(4, 'Acer', '2025-05-28 16:38:29');

-- --------------------------------------------------------

--
-- Table structure for table `projectors_store`
--

CREATE TABLE `projectors_store` (
  `id` int(11) NOT NULL,
  `projectorsstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectors_store`
--

INSERT INTO `projectors_store` (`id`, `projectorsstore`, `created_at`) VALUES
(3, 'All Projectors', '2025-05-28 16:38:17'),
(4, 'ViewSonic Projectors', '2025-05-28 16:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `psu`
--

CREATE TABLE `psu` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `power` varchar(255) DEFAULT NULL,
  `wattage` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psu`
--

INSERT INTO `psu` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `power`, `wattage`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Boost Titan Power Supply 550W', '3', 2147483647, 'Includes a 650mm 24-pin cable for flexible and reliable motherboard connectivity.\r\n\r\n', 'copy-29-czone.com.pk-1540-17320-161124094310.jpg', 'Boost PSU', '550 Watts', 'Dual IDE Cable: 550mm', '24 Pin Cable: 650mm', 'Triple SATA Cable: 550mm', 'SGCC Steel Thickness: 0.5mm', 8490.00, 0.00),
(4, '', 'Boost Titan Power Supply 650W', '3', 2147483647, 'Includes a 650mm 24-pin cable for flexible and reliable motherboard connectivity.\r\n\r\n', 'copy-29-czone.com.pk-1540-17320-161124094310.jpg', 'Boost PSU', '650 Watts ', 'Dual IDE Cable: 550mm', '24 Pin Cable: 650mm', 'Triple SATA Cable: 550mm', 'SGCC Steel Thickness: 0.5mm', 9990.00, 0.00),
(5, '16', 'Gigabyte P450B 80 PLUS Bronze Certified 450W Power Supply GP-P450B', '3', 2147483647, '80 Plus Bronze certified ensures to deliver 85% efficiency at 50% load. The better power efficiency leads to less power waste, less heat and less fan noise.\r\n\r\n', '202005251612261281936a195f1cadc979bddc92ef91e6ba-src-1540-10371-171020090309.jpg', ' Gigabyte', '450 Watts', '120mm Silent Hydraulic Bearing (HYB) Fan', 'Reliable flat cable', 'Single +12V rail', 'OVP/OPP/SCP/UVP/OCP/OTP protection', 12990.00, 15500.00),
(6, '', 'Cougar ATLAS 550W 80 PLUS Bronze Certified PSU, Black', '3', 2147483647, 'Spectacular Performance & Excellent Silence\r\n\r\n', 'czone.com.pk-2-1540-17965-060325075523.jpg', 'Cougar', '550 Watts', 'Solid Efficiency Certification with 80 PLUS', 'DC-DC technology', 'Ultra Durability', 'Perfect Control Between Noise And Fan Spinning', 13500.00, 0.00),
(7, '', 'Cougar ATLAS 650W 80 PLUS Bronze Certified PSU, Black', '3', 2147483647, 'Spectacular Performance & Excellent Silence\r\n\r\n', 'czone.com.pk-2-1540-17965-060325075523.jpg', 'Cougar', '650 Watts ', 'Solid Efficiency Certification with 80 PLUS', 'DC-DC technology', 'Ultra Durability', 'Perfect Control Between Noise And Fan Spinning', 15500.00, 0.00),
(8, '', 'Corsair CX Series CX550 - 550 Watt 80 PLUS Bronze ATX Power Supply - CP-9020277-NA', '5', 2147483647, 'CORSAIR CX Series Power Supplies feature low-noise cooling and a compact design for an easy fit in nearly any modern case.\r\n\r\n', '17-czone.com.pk-1540-15646-190124074121.jpg', 'Corsair Power Supplies', '550 Watts', '80 PLUS Bronze efficiency up to 88%', 'Guaranteed continuous power', '120mm low-noise cooling fan', 'Compact 125mm length', 15990.00, 0.00),
(9, '', 'Cougar ATLAS 750W 80 PLUS Bronze Certified PSU, Black', '3', 2147483647, 'Spectacular Performance & Excellent Silence\r\n\r\n', 'czone.com.pk-2-1540-17965-060325075523.jpg', 'Cougar', '750 Watts', 'Solid Efficiency Certification with 80 PLUS', 'DC-DC technology', 'Ultra Durability', 'Perfect Control Between Noise And Fan Spinning', 17500.00, 0.00),
(10, '', 'Antec CUPRUM STRIKE CSK 550W 80 PLUS® BRONZE Power Supply PSU', '3', 2147483647, 'Antec’s new generation Cuprum Strike Bronze power supply is crafted for quality, efficiency, and performance.\r\n\r\n', '1-czone.com.pk-1540-15267-220923075314.jpg', 'Antec Power Supplies', '550 Watts', '80 PLUS® Bronze Certified', '120 mm Silent Fan', 'Model Name X5000A253HC-20', 'Input Voltage 100 ~ 240 VAC', 17900.00, 0.00),
(11, '', 'Corsair CX Series CX650 - 650 Watt 80 PLUS Bronze ATX Power Supply', '3', 2147483647, 'CORSAIR CX Series Power Supplies feature low-noise cooling and a compact design for an easy fit in nearly any modern case.\r\n\r\n', '17-czone.com.pk-1540-15646-190124074121.jpg', 'Corsair Power Supplies', '650 Watts ', '80 PLUS Bronze efficiency up to 88%', 'Guaranteed continuous power', '120mm low-noise cooling fan', 'Compact 125mm length', 18500.00, 0.00),
(12, '', 'Corsair CX Series CX750 – 750 Watt 80 PLUS Bronze ATX Power Supply (UK) - CP-9020279-UK', '4', 2147483647, 'CORSAIR CX Series Power Supplies feature low-noise cooling and a compact design for an easy fit in nearly any modern case.\r\n\r\n', '17-czone.com.pk-1540-15646-190124074121.jpg', 'Corsair Power Supplies', '750 Watts', '80 PLUS Bronze efficiency up to 88%', 'Guaranteed continuous power', '120mm low-noise cooling fan', 'Compact 125mm length', 20550.00, 0.00),
(13, '', 'Cougar GEX PRO 750W PSU Power Supply, ATX 3.1 Certified, PCIe Gen 5.1, 80 PLUS Gold', '4', 2147483647, 'Utilizing a native PCIe 12V-2X6 connector design, this power supply delivers power to next-gen graphics cards through a single 12+4-pin cable, bringing them into compliance with Intel’s ATX 3.1 standard.\r\n\r\n', 'czone.com.pk-16-1540-17962-060325071228.jpg', 'Cougar', '750 Watts', 'ATX 3.1 Certified', 'Designed for the New Era of PCIe Gen 5.1!', '80 PLUS Gold', 'Perfect Fan Speed to Noise Ratio', 29990.00, 0.00),
(14, '', 'Cougar GEX PRO 850W PSU Power Supply, ATX 3.1 Certified, PCIe Gen 5.1, 80 PLUS Gold', '3', 2147483647, 'Utilizing a native PCIe 12V-2X6 connector design, this power supply delivers power to next-gen graphics cards through a single 12+4-pin cable, bringing them into compliance with Intel’s ATX 3.1 standard.\r\n\r\n', 'czone.com.pk-16-1540-17962-060325071228.jpg', 'Cougar', '850 Watts', 'ATX 3.1 Certified', 'Designed for the New Era of PCIe Gen 5.1!', '80 PLUS Gold', 'Perfect Fan Speed to Noise Ratio', 31990.00, 0.00),
(15, '', 'CORSAIR RM850x Fully Modular Quiet ATX Power Supply - ATX 3.1 Compliance - PCIe 5.1 Support - Cybenetics Gold Efficiency - Native 12V - 2x6 Connector - Black', '5', 2147483647, 'Gold-certified efficiency with extremely tight voltage regulation to deliver superior performance. CP-9020270-UK\r\n\r\n', '89-czone.com.pk-1540-4427-280225101844.jpg', 'Corsair Power Supplies', '1200 Watts', 'Fully modular, Type-4 connectors', 'Cybenetics Gold-certified', 'ATX 3.1 compliant, supporting PCIe 5.1', 'Zero RPM Fan Mode for near-silent operation at lower loads', 38990.00, 0.00),
(16, '', 'Cougar GLE 1000W Power Supply, ATX 3.1 Certified, 80 PLUS Gold, PCI Express 5.1', '3', 2147483647, 'Supports PCI Express 5.1 Graphics Cards with 12+4 Pin Connector for true 200% power excursion dynamic outputs.\r\n\r\n', 'czone.com.pk-7-1540-17964-060325072707.jpg', 'Cougar', '1000 Watts', 'ATX 3.1 Certified', 'Designed for the Next Generation of GPUs', '80 PLUS Gold', 'Perfect Fan Speed to Noise Ratio, HDB Fan', 41990.00, 0.00),
(17, '', 'CORSAIR SF750 (2024) Fully Modular Low Noise 80 PLUS Platinum ATX Power Supply – ATX 3.1 Compliant – PCIe 5.1 Ready – SFX-to-ATX Bracket Included – Black', '4', 0, '80 PLUS Platinum Rated SFX Power: Massive Platinum-rated power in a compact SFX form-factor, perfect for the most power-dense small-form-factor PCs or saving space in larger cases\r\n\r\n', '97-czone.com.pk-1540-17910-280225103323.jpg', 'Corsair Power Supplies', '450 Watts', 'ATX 3.1 Compliant & PCIe 5.1 Ready', 'Fully Modular, Type-5 Micro-Fit PSU Connectors', '92mm PWM Cooling Fan', '105°C Rated Japanese Capacitors', 46990.00, 0.00),
(18, '', 'Corsair SF Series SF750 - 750 Watt 80 PLUS Platinum Certified High Performance SFX PSU - CP-9020186-NA', '4', 2147483647, 'The CORSAIR SF750 80 PLUS Platinum SFX Power Supply is an extraordinarily power-dense PSU, ready to power the most cutting-edge small form factor PCs with 750 continuous watts.\r\n\r\n', '1-czone.com.pk-1540-13878-101022105738.jpg', 'Corsair Power Supplies', '750 Watts', 'An Unprecedented 750 Watt SFX PSU', '80 PLUS Platinum Certified', 'Japanese 105°C Capacitors', 'Zero RPM Fan Mode', 47500.00, 0.00),
(19, '', 'Lian Li EDGE 850W Full Modular Platinum PSU - 80 PLUS Platinum Efficiency - German EPCOS Bulk Capacitors - ATX 3.0, 3.1 Compliant - EG850 White', '5', 2147483647, 'The EDGE PSU series introduces a revolutionary power supply featuring a unique L-shape design, an integrated USB hub, and enhanced efficiency. Experience the blend of aesthetics and convenience in your PC build.\r\n\r\n', '7-czone.com.pk-1540-17296-121124100931.jpg', 'Lian Li PSU', '850 Watts', '80 PLUS Platinum Efficiency', 'Built-in USB expantion hub with 4 internal USB 2.0 headers', 'Integrating German EPCOS bulk capacitors', 'In-house R&D 12V-2×6 alloy copper soldered terminals', 50000.00, 0.00),
(20, '', 'Lian Li EDGE 850W Full Modular Platinum PSU - 80 PLUS Platinum Efficiency - German EPCOS Bulk Capacitors - ATX 3.0, 3.1 Compliant - EG850 Black', '3', 2147483647, 'The EDGE PSU series introduces a revolutionary power supply featuring a unique L-shape design, an integrated USB hub, and enhanced efficiency. Experience the blend of aesthetics and convenience in your PC build.\r\n\r\n', '12-czone.com.pk-1540-17297-121124101302.jpg', 'Lian Li PSU', '850 Watts', '80 PLUS Platinum Efficiency', 'Built-in USB expantion hub with 4 internal USB 2.0 headers', 'Integrating German EPCOS bulk capacitors', 'In-house R&D 12V-2×6 alloy copper soldered terminals', 50000.00, 0.00),
(21, '', 'MSI MAG A1250GL PCIE5 PSU | ATX 3.1 Ready, PCIe CEM 5.1, 80 PLUS Gold Certified, Fully Modular', '4', 2147483647, '80 PLUS Gold certified for high efficiency.\r\n135 mm fluid dynamic bearing fan.\r\nLLC half bridge topology with DC-to-DC module design.', '36-czone.com.pk-1540-16671-050824120040.jpg', 'MSI', '1250 Watts', 'ATX 3.1 ready, native dual-color PCIe CEM 5.1 connector', 'Supports NVIDIA® GeForce RTX™ 40 series graphics cards', 'Fully modular design, flat cables', 'Active PFC design', 51990.00, 0.00),
(22, '', 'Cooler Master MWE GOLD 1250 V2 Full Modular Power Supply | 80 PLUS Gold | MPE-C501-AFCAG-3EU', '4', 2147483647, 'MWE Gold 1250 - V2 (Full Modular) is the next step in the evolution of Cooler Master\'s entry level 80 PLUS Gold power offerings.\r\n\r\n', '8-czone.com.pk-1540-16182-050624100604.jpg', 'Cooler Master Power Supplies', '1250 Watts', 'Fully Modular', 'Active PFC', 'ErP 2014 Lot 3', 'ATX 24 Pin Connectors x 1', 55000.00, 0.00),
(23, '', 'CORSAIR RM1000x Fully Modular ATX Power Supply Low Noise – ATX 3.1 Compliant – PCIe 5.1 Support – Cybenetics Gold Efficiency – Native 12V-2x6 Connection', '5', 0, 'Power your next build with a CORSAIR RMx Series fully modular PSU for quiet, Cybenetics Gold-certified efficient performance.\r\n\r\n', '89-czone.com.pk-1540-4427-280225101844.jpg', 'Corsair Power Supplies', '1500 Watts', 'Fully modular, Type-4 connectors', 'Cybenetics Gold-certified', 'ATX 3.1 compliant, supporting PCIe 5.1', 'Zero RPM Fan Mode for near-silent operation at lower loads', 55990.00, 0.00),
(24, '', 'Cooler Master V PLATINUM V2 1300W Fully Modular Active PFC 80 PLUS Platinum PSU | MPZ-D002-AFAP-BEU', '4', 2147483647, 'Introducing the V Platinum V2, featuring an ultra-quiet Mobius fan, 80 Plus Platinum efficiency, and ATX 3.1 support with a durable 12V-2x6 cable.\r\n\r\n', '5-czone.com.pk-1540-16181-050624100307.jpg', 'Cooler Master Power Supplies', '1300 Watts', 'Quietly Supreme', 'Mobius Fan Enhances Thermal Performance and A Longer Lifespan', 'Oil Flows Back to The Sealed Bearing, Ensuring Constant Lubrication.', 'Silent Fan Performance with A Zero Speed Mode', 65000.00, 0.00),
(25, '', 'XPG CYBERCORE II Modular 1300W 15A Power Supply PSU | 80 Plus Platinum', '3', 2147483647, 'In light of the new Intel ATX 3.0 design guide specifications, the XPG CYBERCORE 80 PLUS Platinum series is getting an upgrade. With stricter voltage and current regulation guidelines changes needed to be implemented in order to safely.', '48-czone.com.pk-1540-15944-070524101516.jpg', 'XPG PSU', '1300 Watts', 'Supports Next-Gen Graphics Cards', 'Cybenetics ETA PLATINUM and LAMBDA A- Certified', '80 PLUS PLATINUM Efficiency', 'XPG VENTO PRO 120 PWM FAN by Nidec', 67000.00, 0.00),
(26, '', 'Antec SIGNATURE 1000W 80 PLUS Platinum Full Modular Power Supply Unit PSU SP1000 GB', '4', 2147483647, 'Equipped with superior features that ensure peak performance for the enthusiast and gaming-oriented segment, the Signature power supply Series boasts unparalleled stability and 80 PLUS® Platinum-certified efficiencies.\r\n\r\n', '23-czone.com.pk-1540-15438-101123103235.jpg', 'Antec Power Supplies', '1000 Watts', 'FDB 135mm Silent Fan, Zero RPM Mode', '100% Top-Grade Japanese Capacitors', 'PhaseWave Design', 'OC Link Feature, Full Modular Cable Management', 69900.00, 0.00),
(27, '', 'Corsair HX1000i Fully Modular Ultra-Low Noise Platinum ATX 1000 Watt PC Power Supply (UK)', '4', 0, 'Compatible with NVIDIA 4000 series and AMD® Ryzen 7000 series GPUs\r\n\r\n', '101-czone.com.pk-1540-13873-280225103551.jpg', 'Corsair Power Supplies', '1000 Watts', 'Fluid Dynamic Bearing fan with Zero RPM mode', '105°C rated 100% Japanese electrolytic capacitors', 'ATX 3.1 & PCIe 5.1 certified', 'Platinum Power at Your Command', 70990.00, 0.00),
(28, '7', 'Corsair HX1200i Fully Modular Ultra-Low Noise Platinum ATX 1200 Watt PC Power Supply (UK) CP-9020070-UK', '5', 2147483647, 'HXi Series power supplies give you extremely tight voltage control, virtually silent operation, and a fully modular cable set. With all Japanese 105°C capacitors, they’re a great choice for high performance PCs where reliability is essential.\r\n\r\n', '101-czone.com.pk-1540-13873-280225103551.jpg', 'Corsair Power Supplies', '1200 Watts', 'Corsair Link Digital for advanced monitoring and control', 'Easy Installation', '4th generation Intel® Core™ processor Ready (Intel Haswell and Z87 motherbo', 'Fanless mode: Yes // Fan size (mm): 140mm', 84500.00, 91000.00),
(29, '', 'Asus ROG-THOR-1000P2-GAMING ROG Thor 1000W Platinum II PSU', '5', 0, 'Back with a vengeance, the second iteration of the ROG Thor 1000W Platinum wields cooling and component upgrades that make it the quietest PSU in its class*. And to compliment the latest high-end ROG motherboards and bring additional flair to beastly rigs', '20-czone.com.pk-1540-13627-010922043106.jpg', 'Asus', '1000 Watts', 'Lambda A++ Certification', 'ROG heatsinks, 80 Plus Platinum Certification.', 'Axial-tech fan with PWM control', 'OLED display, Aura Sync', 92000.00, 0.00),
(30, '', 'Corsair HXi Series HX1500i Fully Modular Ultra-Low Noise Platinum ATX 1500 Watt PC Power Supply', '4', 0, 'CORSAIR HXi Series Fully Modular Ultra-Low Noise Power Supplies with three EPS12V connectors use the highest quality components to deliver 80 PLUS Platinum efficient power.\r\n\r\n', '88-czone.com.pk-1540-17907-280225101502.jpg', 'Corsair Power Supplies', '1500 Watts', 'Powerful Connections', 'Quiet Operation', '80 PLUS Platinum certified', 'Premium 100% Japanese 105°C electrolytic capacitors', 122990.00, 0.00),
(31, '', 'Cooler Master V PLATINUM V2 1600W Fully Modular Active PFC 80 PLUS Platinum PSU Power Supply Unit | MPZ-G002-AFAP-BEU', '5', 2147483647, 'Introducing the V Platinum V2, featuring an ultra-quiet Mobius fan, 80 Plus Platinum efficiency, and ATX 3.1 support with a durable 12V-2x6 cable.\r\n\r\n', '21-czone.com.pk-1540-16179-040624124055.jpg', 'Cooler Master Power Supplies', '1600 Watts', 'Fully Modular', 'Active PFC', 'Input Frequency 50-60Hz', 'ErP 2014 Lot 3', 125000.00, 0.00),
(32, '6', 'Corsair AX1600i Digital ATX Power Supply 1600 Watt Fully-Modular PSU (UK) - CP-9020087-UK - 80 PLUS Titanium', '5', 2147483647, 'The CORSAIR AX1600i is the ultimate digital ATX power supply, built using only the best components and state-of-the-art gallium nitride transistors to deliver more than 94% efficiency.\r\n\r\n', 'czone-cp-9020087-uk-gallery-ax1600i-01.png-1540-7717-080319013351.jpg', 'Corsair Power Supplies', '1600 Watts', 'The world’s best psu gets better', '1600w of ultimate power', 'Top tier components', 'The only consumer psu with gallium nitride transistors', 164990.00, 175000.00),
(34, '16', 'Gigabyte P450B 80 PLUS Bronze Certified 450W Power Supply GP-P450B', '4', 2147483647, '80 Plus Bronze certified ensures to deliver 85% efficiency at 50% load. The better power efficiency leads to less power waste, less heat and less fan noise.\r\n\r\n', 'copy-29-czone.com.pk-1540-17320-161124094310.jpg', ' Gigabyte', '550 Watts', '120mm Silent Hydraulic Bearing (HYB) Fan', 'Reliable flat cable', 'Single +12V rail', 'OVP/OPP/SCP/UVP/OCP/OTP protection', 13000.00, 15510.00),
(35, '', 'Asus ROG-THOR-1200P2-GAMING ROG Thor 1200W Platinum II PSU', '3', 0, 'Back with a vengeance, the second iteration of the ROG Thor 1000W Platinum wields cooling and component upgrades that make it the quietest PSU in its class*. And to compliment the latest high-end ROG motherboards and bring additional flair to beastly rigs', '20-czone.com.pk-1540-13627-010922043106.jpg', 'Asus', '1200 Watts', 'Lambda A++ Certification', 'ROG heatsinks, 80 Plus Platinum Certification.', 'Axial-tech fan with PWM control', 'OLED display, Aura Sync', 100000.00, 0.00),
(36, '', 'MSI MAG A1250GL PCIE5 PSU | ATX 3.1 Ready, PCIe CEM 5.1, 80 PLUS Gold Certified, Fully Modular', '4', 2147483647, '135 mm fluid dynamic bearing fan.\r\n', '88-czone.com.pk-1540-17907-280225101502.jpg', 'MSI', '1600 Watts', 'ATX 3.1 ready, native dual-color PCIe CEM 5.1 connector', 'Supports NVIDIA® GeForce RTX™ 40 series graphics cards', 'Fully modular design, flat cables', 'Active PFC design', 51990.00, 0.00),
(37, '', 'XPG CYBERCORE II Modular 1400W 15A Power Supply PSU | 80 Plus Platinum', '3', 2147483647, 'In light of the new Intel ATX 3.0 design guide specifications, the XPG CYBERCORE 80 PLUS Platinum series is getting an upgrade. With stricter voltage and current regulation guidelines changes needed to be implemented in order to safely and efficiently acc', '97-czone.com.pk-1540-17910-280225103323.jpg', 'XPG PSU', '1500 Watts', 'Supports Next-Gen Graphics Cards', 'Cybenetics ETA PLATINUM and LAMBDA A- Certified', '80 PLUS PLATINUM Efficiency', 'XPG VENTO PRO 120 PWM FAN by Nidec', 67000.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `ram`
--

CREATE TABLE `ram` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `memory` varchar(255) DEFAULT NULL,
  `store` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ram`
--

INSERT INTO `ram` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `memory`, `store`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Lexar 8GB DDR4-3200 SODIMM Laptop Memory | LD4AS008G-B3200GSST', '2', 2147483647, 'The Lexar DDR4-3200/2666 SODIMM Laptop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation, you’ll be up and running in no tim', 'copy-copy-4-czone.com.pk-1540-12078-090921065249.jpg', 'Laptop (SOD) - DDR4 Memory', '8GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', 'Easy Upgrade', 3990.00, 0.00),
(4, '', 'Lexar DDR4-3200 8GB UDIMM Desktop Memory | LD4AU008G-B3200GSST', '3', 2147483647, 'The Lexar DDR4-3200/2666 UDIMM Desktop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation, you’ll be up and running in no tim', 'copy-copy-1-czone.com.pk-1540-12076-090921064921.jpg', 'Desktop - DDR4 Memory', '8GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', 'Easy Upgrade', 4050.00, 0.00),
(5, '', 'Transcend 8GB DDR5 4800 JetRam Desktop Memory | JM4800ALG-8G', '3', 2147483647, 'Compliant with JEDEC international standards, Transcend\'s new-gen DDR5 JetRam memory modules are manufactured with true ETT grade, brand-name DRAM chips that have passed Transcend\'s strict screening process and testing.\r\n\r\n', '7-czone.com.pk-1-1540-16919-060924114710.jpg', 'Desktop - DDR5 Memory', '8GB', 'Unbuffered Long-DIMM', 'Speed 4800', '8GB DRAM Module', '288 pin', 7600.00, 0.00),
(6, '', 'Lexar DDR4-3200 SODIMM Laptop Memory 16GB | LD4AS016G-B3200GSST', '3', 2147483647, 'The Lexar DDR4-3200/2666 SODIMM Laptop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation, you’ll be up and running in no tim', 'copy-copy-4-czone.com.pk-1540-12078-090921065249.jpg', 'Desktop - DDR4 Memory', '16GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', 'Easy Upgrade', 7700.00, 0.00),
(7, '', 'Lexar DDR4-3200 UDIMM Desktop Memory 16GB | LD4AU016G-B3200GSST', '3', 2147483647, 'The Lexar DDR4-3200/2666 UDIMM Desktop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation you’ll be up and running in no time', 'copy-copy-1-czone.com.pk-1540-12076-090921064921.jpg', 'Laptop (SOD) - DDR4 Memory', '16GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', 'Easy Upgrade', 7800.00, 0.00),
(8, '', 'Lexar SODIMM 16GB DDR5 RAM 5600 MHz Laptop RAM Memory LD5S16G56C46ST-BGS', '4', 2147483647, 'Built to perform. Bringing next-gen DDR5 memory to your laptop and other small computers, Lexar DDR5 SODIMM Laptop Memory delivers up to 5600MT/s to your upgrade.\r\n\r\n', '1-1540-17196-311024084533.jpg', 'Desktop - DDR5 Memory', '16GB', 'LD5S16G56C46ST-BGS', 'SO-DIMM', '16 GB DDR5', '1.1 Volts', 10850.00, 0.00),
(9, '', 'Kingston 16GB DDR5 5600 Desktop Memory KVR56U46BS8-16', '4', 2147483647, 'DDR5 5600MT/s Non-ECC Unbuffered DIMM CL46 1RX8 1.1V 288-pin 16Gbit\r\n\r\n', '3-czone.com.pk-1540-17400-261124104426.jpg', 'Desktop - DDR5 Memory', '16GB', 'DDR5 5600 (PC5 44800)', 'Timing 46-45-45', 'CAS Latency 46', 'Voltage 1.10V', 11690.00, 0.00),
(10, '', 'TEAMGROUP Elite DDR5 16GB 5600Mhz Desktop Memory TED516G5600C4601', '3', 2147483647, 'Increased Fundamental Frequency, Faster Speeds\r\n\r\n', '2-1540-17188-301024113359.jpg', 'Desktop - DDR5 Memory', '16GB', 'JEDEC DDR5 On-die ECC, Stable Performance', 'Unleashed Capacity, Stronger Multitasking', 'Improved Structural Composition, Greater Efficiency', 'Reduced Working Voltage, Better Energy Efficiency', 11990.00, 0.00),
(11, '', 'XPG SPECTRIX D35G DDR4 16GB (8GB x 2) 3600MHz RGB Desktop Memory | White', '3', 2147483647, 'SPECTRIX D35G\'s composed and understated triangular outline is specifically designed for gamers with unique personalities. The D35G\'s small heatsink allows for easy installation in small chassis.\r\n\r\n', '8-czone.com.pk-1540-16107-280524075150.jpg', 'Desktop - DDR4 Memory', '16GB', 'Top Quality RAM for High Durability', 'RGB Your Way', 'Create Personalized Lightshow with XPG Prime', 'Works with the Latest AMD Platforms | Supports Intel® XMP 2.0', 14500.00, 0.00),
(12, '', 'Lexar DDR4-3200 SODIMM Laptop Memory 32GB | LD4AS032G-B3200GSST', '4', 2147483647, 'The Lexar DDR4-3200/2666 SODIMM Laptop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation, you’ll be up and running in no tim', 'copy-copy-4-czone.com.pk-1540-12078-090921065249.jpg', 'Desktop - DDR4 Memory', '32GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', '1.2V', 14500.00, 0.00),
(13, '', 'Lexar DDR4-3200 UDIMM Desktop Memory 32GB | LD4AU032G-B3200GSST', '3', 2147483647, 'The Lexar DDR4-3200/2666 UDIMM Desktop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation you’ll be up and running in no time', 'copy-copy-1-czone.com.pk-1540-12076-090921064921.jpg', 'Desktop - DDR4 Memory', '32GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', 'Easy Upgrade', 14600.00, 0.00),
(14, '', 'CORSAIR Vengeance 16GB RAM (1x16GB) DDR5 DRAM 5200MHz Memory Black', '4', 2147483647, 'CMK16GX5M1B5200C40\r\n\r\n', '12-czone.com.pk-1-1540-17919-010325095233.jpg', 'Desktop - DDR5 Memory', '16GB', 'Welcome to the Cutting-Edge of Performance', 'Do it All, and Do it Faster', 'Onboard Voltage Regulation', 'Custom Intel XMP 3.0 Profiles', 15500.00, 0.00),
(15, '', 'CORSAIR Vengeance RGB DDR5 RAM 16GB (1x16GB) 5600MHz Memory Black', '4', 2147483647, 'CMH16GX5M1B5600C40\r\n\r\n', '61d6y9-vu1l.-ac-sl1500--1-1540-17917-010325094600.jpg', 'Desktop - DDR5 Memory', '16GB', 'CL40 Intel XMP iCUE Compatible', 'Welcome to the Cutting-Edge of Performance', 'Dynamic Ten-Zone RGB Lighting', 'Onboard Voltage Regulation', 17500.00, 0.00),
(16, '', 'XPG LANCER BLADE RGB 16GB DDR5 5600MT/s Desktop Memory (8GB x 2) Black', '3', 2147483647, 'RGB Your Way\r\n\r\n', 'copy-copy-28-czone.com.pk-1540-16003-140524101447.jpg', 'Desktop - DDR5 Memory', '16GB', 'Compact Low-Profile Heatsink Design', 'Enhanced Power Management', 'Stability and Reliability', 'Made with High-Quality Materials', 18500.00, 0.00),
(17, '', 'XPG LANCER BLADE RGB 16GB DDR5 5600MT/s Desktop Memory (8GB x 2) White', '2', 2147483647, 'AX5U5600C468G-DTLABRWH\r\n\r\n', '8-czone.com.pk-1540-16107-280524075150.jpg', 'Desktop - DDR5 Memory', '16GB', 'Compact Low-Profile Heatsink Design', 'Enhanced Power Management', 'Stability and Reliability', 'Made with High-Quality Materials', 18500.00, 0.00),
(18, '', 'Corsair VENGEANCE RGB PRO 16GB (2 x 8GB) DDR4 DRAM 3600MHz C18 Memory Kit Black CMW16GX4M2D3600C18', '4', 2147483647, 'CORSAIR VENGEANCE RGB PRO Series DDR4 overclocked memory lights up your PC with mesmerizing dynamic multi-zone RGB lighting while delivering the best in DDR4 performance.\r\n\r\n', '20-czone.com.pk-1540-11500-050521092304.jpg', 'Desktop - DDR4 Memory', '16GB', 'Visualize, Synchronize, Memorize.', 'Powerful CORSAIR iCUE software', 'Optimized for peak performance on the latest Intel and AMD DDR4 motherboard', 'Requires no extra wires or cables for a clean and seamless install.', 18500.00, 0.00),
(19, '', 'Lexar SODIMM 32GB DDR5 RAM 5600MHz Laptop Memory LD5S32G56C46ST-BGS', '3', 2147483647, 'Designed for performance. The Lexar DDR5 SODIMM laptop memory brings next-generation DDR5 memory to your laptop and other small computers, delivering up to 5600 MT/s for your upgrade.\r\n\r\n', '1-1540-17196-311024084533.jpg', 'Laptop (SOD) - DDR5 Memory', '32GB', 'On-Die ECC provides improved stability', '1.1V', 'CL46-45-45-90', 'Gaming DRAM SO-DIMM for Laptop', 21990.00, 0.00),
(20, '', 'ADATA DDR5 32GB 5600 U-DIMM Desktop Memory Module AD5U560032G-S', '4', 2147483647, 'The DDR5-5600 U-DIMM delivers blazing frequencies of up to 5600 MHz, a major leap from the max. frequency of DDR4 modules (3200 MHz). \r\n\r\n', '1-czone.com.pk-1540-16993-250924073812.jpg', 'Desktop - DDR5 Memory', '32GB', 'Higher Frequencies', 'Built-in Power Management IC', 'On-Die Error Correcting Code', 'Works with the latest AMD and Intel platforms', 23000.00, 0.00),
(21, '', 'Corsair VENGEANCE LPX 32GB (1 x 32GB) DDR4 DRAM 3000MHz C16 Memory Kit - Black', '4', 2147483647, 'CMK32GX4M1D3000C16', 'czone.com.pk-29-1540-17957-040325082302.jpg', 'Desktop - DDR4 Memory', '32GB', 'C16 Desktop Memory', 'Designed for High-Performance Overclocking', 'XMP 2.0 Support', 'Aluminum Heat Spreader', 28990.00, 0.00),
(22, '', 'CORSAIR Vengeance RGB DDR5 RAM 32GB (1x32GB) 5600MHz Desktop Computer Memory - Gray', '5', 2147483647, 'Onboard Voltage Regulation, CMH32GX5M1B5600Z40\r\n\r\n', '61d6y9-vu1l.-ac-sl1500--1-1540-17917-010325094600.jpg', 'Desktop - DDR5 Memory', '32GB', 'CL40-40-40-77 1.25V', 'AMD Expo', 'Intel XMP 3.0', 'Dynamic Ten-Zone RGB Lighting', 30990.00, 0.00),
(23, '', 'CORSAIR VENGEANCE DDR5 RAM 32GB (2x16GB) 6000MHz Memory - Black', '3', 2147483647, 'CMK32GX5M2E6000C36', '61m8xvvxvvl.-ac-sl1500--1-1540-17918-010325094856.jpg', 'Desktop - DDR5 Memory', '32GB', 'CL36 Intel XMP iCUE Compatible', 'Do it All, and Do it Faster', 'Onboard Voltage Regulation', 'Custom Intel XMP 3.0 Profiles', 33500.00, 0.00),
(24, '', 'Corsair VENGEANCE® RGB 32GB (2x16GB) DDR5 DRAM 5200MT/s CL40 AMD EXPO & Intel XMP Memory Kit - iCUE Enabled Product | CMH32GX5M2B5200Z40K', '3', 2147483647, 'Attain top DDR5 RAM performance optimized for AMD® motherboards, with ten-zone RGB for DDR5 memory that lights up your cutting-edge PC.\r\n\r\n', '9-czone.com.pk-1540-17412-281124103218.jpg', 'Desktop - DDR5 Memory', '32GB', 'Welcome to Cutting Edge Performance', 'Dynamic Ten-Zone RGB Lighting', 'Onboard Voltage Regulation', 'AMD Expo™ And Intel® XMP Compatible', 33990.00, 0.00),
(25, '', 'Corsair VENGEANCE RGB 32GB (2x16GB) DDR5 DRAM 5600MHz C40 Memory Kit — Black - CMH32GX5M2B5600C40K', '3', 2147483647, 'CORSAIR VENGEANCE RGB DDR5 memory delivers DDR5 performance, higher frequencies, and greater capacities optimized for Intel® motherboards while lighting up your PC with dynamic, individually addressable ten-zone RGB lighting.\r\n\r\n', '1-czone.com.pk-1540-14350-090223095113.jpg', 'Desktop - DDR5 Memory', '32GB', 'Welcome to the Cutting-Edge of Performance', 'Dynamic Ten-Zone RGB Lighting', 'Onboard Voltage Regulation', 'Custom Intel XMP 3.0 Profiles', 36500.00, 0.00),
(26, '', 'Corsair VENGEANCE® RGB 32GB (2x16GB) DDR5 DRAM 6000MT/s CL36 AMD EXPO & Intel XMP Memory Kit Cool Grey CMH32GX5M2E6000Z36', '3', 2147483647, 'Attain top DDR5 RAM performance optimized for AMD® motherboards, with ten-zone RGB for DDR5 memory that lights up your cutting-edge PC.\r\n\r\n', '1-czone.com.pk-1540-14350-090223095113.jpg', 'Desktop - DDR5 Memory', '32GB', '32GB Kit (2 x 16GB)', 'CL36 Rev E', '6000MT/s', 'Onboard Voltage Regulation', 37500.00, 0.00),
(27, '6', 'G.SKILL Trident Z5 RGB 32GB DDR5 6000MHz Desktop Memory RAM | Silver', '4', 2147483647, 'Trident Z5 RGB series DDR5 memory is designed for ultra-high performance on DDR5 platforms. Featuring a sleek and streamlined aluminum heatspreader design, available in metallic silver, matte black, or matte white, the Trident Z5 RGB series DDR5 DRAM memo', '5-czone.com.pk-1-1540-17790-070225115641.jpg', 'Desktop - DDR5 Memory', '32GB', 'CL30-40-40-96', '1.35V', '32GB (2x16GB)', 'Intel XMP', 37500.00, 40000.00),
(28, '', 'Corsair VENGEANCE RGB 32GB (2x16GB) DDR5 DRAM 6200MT/s CL36 Memory Kit — Black - CMH32GX5M2E6200C36', '5', 2147483647, 'CORSAIR VENGEANCE RGB DDR5 memory delivers DDR5 performance, higher frequencies, and greater capacities optimized for Intel® motherboards while lighting up your PC with dynamic, individually addressable ten-zone RGB lighting.\r\n\r\n', '1-czone.com.pk-1540-14350-090223095113.jpg', 'Desktop - DDR5 Memory', '32GB', 'Welcome to the Cutting-Edge of Performance', 'Dynamic Ten-Zone RGB Lighting', 'Onboard Voltage Regulation', 'Custom Intel XMP 3.0 Profiles', 37990.00, 0.00),
(29, '', 'Lexar SODIMM 16GB DDR5 RAM 5600 MHz Laptop RAM Memory LD5S16G56C46ST-BGS', '3', 2147483647, 'Built to perform. Bringing next-gen DDR5 memory to your laptop and other small computers, Lexar DDR5 SODIMM Laptop Memory delivers up to 5600MT/s to your upgrade.\r\n\r\n', '1-1540-17196-311024084533.jpg', 'Laptop (SOD) - DDR5 Memory', '16GB', 'LD5S16G56C46ST-BGS', 'SO-DIMM', '16 GB DDR5', '1.1 Volts', 10850.00, 0.00),
(30, '', 'Lexar 8GB DDR4-3200 SODIMM Laptop Memory | LD4AS008G-B3200GSST', '4', 2147483647, 'The Lexar DDR4-3200/2666 SODIMM Laptop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation, you’ll be up and running in no tim', 'copy-copy-4-czone.com.pk-1540-12078-090921065249.jpg', 'Laptop (SOD) - DDR4 Memory', '8GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', 'Easy Upgrade', 3990.00, 0.00),
(31, '', 'Lexar DDR4-3200 SODIMM Laptop Memory 16GB | LD4AS016G-B3200GSST', '5', 2147483647, 'The Lexar DDR4-3200/2666 SODIMM Laptop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation, you’ll be up and running in no tim', 'copy-copy-4-czone.com.pk-1540-12078-090921065249.jpg', 'Desktop - DDR4 Memory', '16GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', 'Easy Upgrade', 7700.00, 0.00),
(32, '', 'Lexar DDR4-3200 SODIMM Laptop Memory 32GB | LD4AS032G-B3200GSST', '4', 2147483647, 'The Lexar DDR4-3200/2666 SODIMM Laptop Memory lets you wake up your PC with a performance upgrade that gives you faster startups, increased responsiveness and quicker application load times. With its simple installation, you’ll be up and running in no tim', 'copy-copy-4-czone.com.pk-1540-12078-090921065249.jpg', 'Desktop - DDR4 Memory', '32GB', 'High-speed performance', 'Multitask with ease', 'Simple Install', '1.2V', 14500.00, 0.00),
(33, '', 'XPG LANCER BLADE RGB 64GB DDR5 6000MT/s Desktop Memory (32GB x 2)', '3', 2147483647, 'The LANCER BLADE boasts a low-profile heatsink that fits perfectly in smaller PC cases and avoids interference with tower CPU coolers. Its sleek geometric lines add versatility and visual appeal to any case design.\r\n\r\n', '26-czone.com.pk-1540-15999-140524091423.jpg', 'Desktop - DDR5 Memory', '64GB', 'Compact Low-Profile Heatsink Design', 'Enhanced Power Management', 'Stability and Reliability', 'Made with High-Quality Materials', 67000.00, 0.00),
(34, '', 'XPG LANCER BLADE RGB 64GB DDR5 6000MT/s Desktop Memory (32GB x 2) Black', '4', 2147483647, 'The LANCER BLADE boasts a low-profile heatsink that fits perfectly in smaller PC cases and avoids interference with tower CPU coolers. Its sleek geometric lines add versatility and visual appeal to any case design.\r\n\r\n', '28-czone.com.pk-1540-16003-140524101447.jpg', 'Desktop - DDR5 Memory', '64GB', 'Compact Low-Profile Heatsink Design', 'Enhanced Power Management', 'Stability and Reliability', 'Made with High-Quality Materials', 67000.00, 0.00),
(35, '', 'XPG LANCER BLADE RGB 64GB DDR5 6000MT/s Desktop Memory (32GB x 2) Black', '4', 2147483647, 'The LANCER BLADE boasts a low-profile heatsink that fits perfectly in smaller PC cases and avoids interference with tower CPU coolers. Its sleek geometric lines add versatility and visual appeal to any case design.\r\n\r\n', '28-czone.com.pk-1540-16003-140524101447.jpg', 'Desktop - DDR5 Memory', '64GB', 'Compact Low-Profile Heatsink Design', 'Enhanced Power Management', 'Stability and Reliability', 'Made with High-Quality Materials', 67000.00, 0.00),
(36, '', 'Corsair VENGEANCE DDR5 RAM 64GB (2x32GB) 6600MHz CL32 Intel XMP iCUE Compatible Computer Memory - Black - CMK64GX5M2B6600C32', '4', 2147483647, 'CORSAIR VENGEANCE DDR5, optimized for Intel® motherboards, delivers higher frequencies and greater capacities of DDR5 technology in a high-quality, compact module that suits your system.\r\n\r\n', '24-czone.com.pk-1540-17891-280225092120.jpg', 'Desktop - DDR5 Memory', '64GB', 'Onboard Voltage Regulation', 'Custom Intel® XMP 3.0 Profiles', 'Continuing a Legacy of Performance', 'Wide Compatibility', 75500.00, 0.00),
(37, '', 'CORSAIR VENGEANCE RGB DDR5 64GB (2x32GB) DDR5 6000MHz CL30 AMD EXPO Intel XMP iCUE Compatible Computer Memory – Gray CMH64GX5M2B6000Z30', '4', 2147483647, 'Attain top DDR5 RAM performance optimized for AMD® motherboards, with ten-zone RGB for DDR5 memory that lights up your cutting-edge PC.\r\n\r\n', '71o-5bnebvl.-ac-sl1500--1540-17892-280225092643.jpg', 'Desktop - DDR5 Memory', '64GB', 'iCUE Enabled Product', 'Onboard Voltage Regulation', 'AMD EXPO Compatibility', 'Create and Customize', 79990.00, 0.00),
(38, '', 'CORSAIR DOMINATOR PLATINUM RGB DDR5 64GB (2x32GB) DDR5 6000MHz CL30 AMD EXPO Intel XMP iCUE Compatible Computer Memory – Gray (CMT64GX5M2B6000Z30)', '5', 2147483647, 'Push the limits of performance with CORSAIR DOMINATOR PLATINUM RGB DDR5 Memory optimized for AMD®, taking advantage of the higher frequencies and greater capacities of DDR5, precisely controlled via CORSAIR iCUE software.\r\n\r\n', '31-czone.com.pk-1540-17893-280225093013.jpg', 'Desktop - DDR5 Memory', '64GB', '12 Ultra-Bright CAPELLIX RGB LEDs', 'Patented CORSAIR DHX Cooling', 'Onboard Voltage Regulation', 'Custom AMD EXPO Profiles', 89990.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hash_password` varchar(255) DEFAULT NULL,
  `confirm_password` varchar(255) DEFAULT NULL,
  `contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `name`, `email`, `hash_password`, `confirm_password`, `contact`) VALUES
(1, 'Umairhfhf', 'urehan29220@gmail.com', '$2y$10$MMtLTp1aTah3un.gpxiTiOxs.05bpzM0W3Eh9rsfaejn55PMPMyrW', NULL, 2147483647),
(2, 'Umairhfhf', 'urehan29220@gmail.com', '$2y$10$XpA549ibBNqIV0seUrMFzOFLSyXpwcO2klM3H148/WOngp9Ronv22', NULL, 2147483647),
(3, 'qasim', 'qasim@gmail.com', '$2y$10$n/yyHbFtbCksc2dArM7P7.lMbf0BNq1QrxhmJ1cUKoN57aEKSxNH2', NULL, 2147483647),
(4, 'UMAIR', 'urehan290@gmail.com', '$2y$10$xmXc3TwLBLZtmCw5JcRjd.NpLBkVk0ohtXCY4gOxJIYvWhctmI54a', NULL, 2147483647),
(5, 'Muhammad Zohair ', 'mohammadzohair41@gmail.com', '$2y$10$Rnw5uTnIcrOHNc/5EoqlW.x9Ak2QWKmsdpbV1DAsYOHYzagjVZZpm', NULL, 2147483647),
(6, 'Muhammad Zohair', 'mohammadzohair41@gmail.com', '$2y$10$zYoYyu13Ky6SddWzFPQXa.Vcz6WTmKaLqGLVUMIqSna9mwjT40vC6', NULL, 2147483647),
(7, 'Muhammad Zohair ', 'mohammadzohair41@gmail.com', '$2y$10$w.sniwo4wR5dAWYXrOAuw.sp4269pIfEDR0u.LoWmSA/jWubKElKe', NULL, 2147483647),
(8, 'Muhammad Zohair ', 'mohammadzohair41@gmail.com', '$2y$10$QjqT6FusPO7YBsMcPXMte.fqCGA7NZevt0IHFyhVkyGqMRBcvKhmG', NULL, 2147483647),
(9, 'Muhammad Zohair ', 'mohammadzohair41@gmail.com', '$2y$10$lNTFjMGia9IAdM.Ro1K8UuSZ/MdJ/DTD5jrS7sPuQdRT54cO1h/Bm', NULL, 2147483647),
(10, 'Muhammad Zohair ', 'mohammadzohair41@gmail.com', '$2y$10$TbA/AmWcYVh.njAxS4XVNeQJRDUAVAXuV9P10p7n/CERpmE7pGgna', NULL, 2147483647),
(11, 'Muhammad Zohair ', 'mohammadzohair41@gmail.com', '$2y$10$czthRPp3pe3OaEI1OANOZObXvXLyCFjOr5vOjugHqyG9iHaAK2iRK', NULL, 2147483647),
(12, ',nkjljjk;lhlbkjjjlho;', 'mohammadzohair41@gmail.com', '$2y$10$GWh9moX4ME23qzvEX6dA5ucv1W/G5KedejmVqp2xbk3CJU8NO6XCq', NULL, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `r_capacity`
--

CREATE TABLE `r_capacity` (
  `capacity` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `r_capacity`
--

INSERT INTO `r_capacity` (`capacity`, `created_at`) VALUES
('16GB', '2025-03-23 03:01:21'),
('32GB', '2025-03-23 03:01:17'),
('64GB', '2025-03-23 03:01:10'),
('8GB', '2025-03-23 03:01:25');

-- --------------------------------------------------------

--
-- Table structure for table `scanners`
--

CREATE TABLE `scanners` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scanners`
--

INSERT INTO `scanners` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(4, '', 'HP ScanJet Pro 2500 f1 Flatbed Scanner', '4', 2147483647, 'Enhance productivity for routine scanning with a compact HP ScanJet Pro. Automate workflow with fast, two-sided scanning, a 50-page ADF, 1,500-page daily duty cycle, and one-button shortcuts. You can even quickly capture and edit text from documents.', 'hkeu2-1540-8850-121119083112.jpg', 'HP', 'Rs.75,000 - Rs.77,499', 'Flatbed, ADF', 'Recommended daily duty cycle: 1500 pages (ADF)', 'Up to 600 dpi (color and mono, ADF)', 'Up to 1200 dpi (color and mono, flatbed)', '77000', ''),
(5, '', 'HP ScanJet Pro 2600 F1 Fast 2-Sided Scanning and Auto Document Feeder Scanner', '4', 2147483647, 'Scans up to 25 ppm / 50 IPM up to 1,500 pages daily\r\nScan to text, image, PDF Word (DOC, DOCX), Excel (XLS, XLSX), CSV', '9-czone.com.pk-1540-16748-130824102111.jpg', 'HP', 'Rs.77,500 - Rs.79,999', '60-page, two-sided, single-pass auto document feeder', 'Up to 1200 x 1200 dpi (color and mono, flatbed)', 'Bit depth: 24-bit (external), 48-bit (internal)', 'Maximum document scan size 8.5 x 122 in', '78000', ''),
(6, '', 'HP ScanJet Pro 3000 S4 Sheet-Feed Scanner, Official Warranty', '5', 353080724, 'Get fast, two-sided scans in a single pass—recommended for 4000 pages per day. Produce scans at up to 40 ppm/80 ipm with two-sided scanning that captures both sides at once. Free up space for work; this HP ScanJet Pro is small and slim—a modern desig', 'copy-13-czone.com.pk-1540-11150-260221075327.jpg', 'HP', 'Rs.100,000 & Above', '', '', '', '', '117000', ''),
(7, '', 'HP ScanJet Enterprise Flow N6600 FNW1 - Fast 2-Sided Scanning, Auto Document Feeder, Wireless (Official Warranty)', '5', 2147483647, 'Up to 600 x 600 dpi (color and mono, ADF); Up to 1200 x 1200 dpi (color and mono, flatbed)\r\n\r\n', '15-czone.com.pk-1540-17602-100125095428.jpg', 'HP', 'Rs.100,000 & Above', 'Get scan jobs done blazing fast', 'Capture every page, every time', 'Versatile scanning ', '2.8-in (7.11-cm) Touchscreen, Buttons (Power, Back, Home, Help)', '360000', '');

-- --------------------------------------------------------

--
-- Table structure for table `scanners_brand`
--

CREATE TABLE `scanners_brand` (
  `id` int(11) NOT NULL,
  `scannersbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scanners_brand`
--

INSERT INTO `scanners_brand` (`id`, `scannersbrand`, `created_at`) VALUES
(1, 'Rs.100,000 & Above', '2025-05-28 19:38:20'),
(2, 'Rs.77,500 - Rs.79,999', '2025-05-28 19:38:35'),
(3, 'Rs.75,000 - Rs.77,499', '2025-05-28 19:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `scanners_store`
--

CREATE TABLE `scanners_store` (
  `id` int(11) NOT NULL,
  `scannersstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scanners_store`
--

INSERT INTO `scanners_store` (`id`, `scannersstore`, `created_at`) VALUES
(1, 'HP', '2025-05-28 19:38:20');

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `m_series` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`m_series`) VALUES
('Color Laser MFP'),
('Color Laser.'),
('Color LaserJet Enterprise'),
('Color LaserJet Pro'),
('Color LaserJet Pro MFP'),
('LaserJet'),
('LaserJet Enterprise'),
('LaserJet Enterprise MFP'),
('LaserJet MFP'),
('LaserJet Pro.'),
('Tank');

-- --------------------------------------------------------

--
-- Table structure for table `software`
--

CREATE TABLE `software` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `software`
--

INSERT INTO `software` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'ESET Internet Security® - 1 User - 1 Year - Without Media', '3', 0, 'Comprehensive protection for everyday web users, thanks to ESET’s trademark best balance of detection, speed and usability.\r\n\r\n', 'eset-internet-security-1540-5570-220617111142.jpg', 'Eset', 'Rs.2500 - Rs.2,999', 'Safer online banking and shopping', 'Regain control of your webcam and router', 'The best balance for your security and privacy', 'Stay safe from ransomware', '2900', ''),
(3, '23', 'Kaspersky Anti-Virus 2 Devices, 1 Year License', '4', 2147483647, 'Performance Optimization. Do Not Disturb Mode.\r\n\r\n', 'copy-kav-2019-1540-17043-071024082134.jpg', 'Kaspersky', 'Rs.3500 - Rs.3,999', 'Real-Time Antivirus', 'Safe Web Browsing', 'Existing Virus Removal', 'Anti-Phishing', '3850', '5000'),
(4, '', 'Norton LifeLock Antivirus Basic Annual Subscription 1 Device', '3', 114141024, 'Together, we take pride in helping people and families navigate the evolving world of Cyber Safety.\r\n\r\n', 'untitled-1-1540-17083-151024105525.jpg', 'Norton', 'Rs.3500 - Rs.3,999', '', '', '', '', '3900', ''),
(5, '27', 'Kaspersky Internet Security 2 Devices, 1 Year License', '4', 2147483647, 'Fast, flexible security that safeguards your data & privacy without getting in your way.\r\n\r\n', '11-czone.com.pk-1540-16690-070824090056.jpg', 'Kaspersky', 'Rs.4000 - Rs.4,499', 'Blocks viruses, cryptolockers, attacks & more', 'Prevents online trackers collecting your data*', 'Detects spyware hiding on your Android device', 'Protects payments, with bank-grade encryption*', '4400', '6000'),
(6, '', 'Kaspersky Total Security 4 Device 1 Year', '4', 2147483647, 'Stay safe at home and on the go with a single license. For your PCs, Macs, and Android and iOS devices.\r\n\r\n', '15-czone.com.pk-1-1540-16226-110624090331.jpg', 'Kaspersky', 'Rs.7000 - Rs.7,999', 'Privacy Protection', 'Secured Connection', 'Safe Money', 'Safe Kids', '7500', ''),
(7, '36', 'Kaspersky Plus Internet Security | 3 Devices | 1 Year', '3', 2147483647, 'Security. Performance. Privacy. Enhance your internet security.\r\n\r\n', '14-czone.com.pk-1540-17470-101224094802.jpg', 'Kaspersky', 'Rs.7000 - Rs.7,999', 'Real-time Antivirus', 'Online Payment Protection', 'Performance Optimisation', 'Kaspersky wins “Product of the Year”', '7700', '12000'),
(8, '', 'Kaspersky Small Office Security - 5 Users, 1-Year', '5', 2147483647, 'Secure your business with award-winning security against hackers and cyber threats. Light on resources, strong on protection - with a host of special capabilities included in a single premium package.\r\n\r\n', 'copy-9-czone.com.pk-1540-14434-280223072804.jpg', 'Kaspersky', 'Rs.25,000 - Rs.25,999', 'Premium VPN, Password Manager and Safe Money services included', 'Award-winning ‘set and forget’ security', 'Delivering what your business needs', 'Safe Internet and total privacy', '25500', ''),
(9, '', 'Kaspersky Small Office Security - 10 Users, 1-Year', '5', 2147483647, 'Secure your business with award-winning security against hackers and cyber threats. Light on resources, strong on protection - with a host of special capabilities included in a single premium package.\r\n\r\n', 'copy-9-czone.com.pk-1540-14434-280223072804.jpg', 'Kaspersky', 'Rs.37,500 - Rs.39,999', 'Premium VPN, Password Manager and Safe Money services included', 'Award-winning ‘set and forget’ security', 'Delivering what your business needs', 'Safe Internet and total privacy', '37500', '');

-- --------------------------------------------------------

--
-- Table structure for table `software_brand`
--

CREATE TABLE `software_brand` (
  `id` int(11) NOT NULL,
  `softwarebrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `software_brand`
--

INSERT INTO `software_brand` (`id`, `softwarebrand`, `created_at`) VALUES
(3, 'Rs.37,500 - Rs.39,999', '2025-05-29 08:07:47'),
(4, 'Rs.25,000 - Rs.25,999', '2025-05-29 08:07:51'),
(5, 'Rs.7000 - Rs.7,999', '2025-05-29 08:07:55'),
(6, 'Rs.4000 - Rs.4,499', '2025-05-29 08:07:58'),
(7, 'Rs.3500 - Rs.3,999', '2025-05-29 08:08:03'),
(8, 'Rs.2500 - Rs.2,999', '2025-05-29 08:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `software_store`
--

CREATE TABLE `software_store` (
  `id` int(11) NOT NULL,
  `softwarestore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `software_store`
--

INSERT INTO `software_store` (`id`, `softwarestore`, `created_at`) VALUES
(3, 'Eset', '2025-05-29 08:07:35'),
(4, 'Kaspersky', '2025-05-29 08:07:40'),
(5, 'Norton', '2025-05-29 08:07:44');

-- --------------------------------------------------------

--
-- Table structure for table `speaker`
--

CREATE TABLE `speaker` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `speaker`
--

INSERT INTO `speaker` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'Amazon Echo Pop Full Sound Compact Smart Speaker with Alexa | Charcoal', '3', 2147483647, 'Music and Alexa. The perfect fit.', '27-czone.com.pk-1540-17657-160125074922.jpg', 'Amazon', 'Amazon', 'Hits all the right notes', 'Alexa is fit to help', 'Make any space a smart space', 'Alexa has skills', '13900', ''),
(3, '', 'Amazon Echo Dot 5th Gen Smart Speaker | Charcoal', '4', 353080724, 'Our best sounding Echo Dot yet – Enjoy an improved audio experience compared to any previous Echo Dot with Alexa for clearer vocals, deeper bass and vibrant sound in any room.\r\n\r\n', '22-czone.com.pk-1540-17656-160125074443.jpg', 'Amazon', 'Amazon', 'Small size, big possibilities', 'Our best-sounding Echo Dot yet', 'Alexa is happy to help', 'Help keep your home comfortable', '17990', ''),
(4, '12', 'Harman Kardon Go + Play 3 Portable Bluetooth Speaker Black HKGOPLAY3BLKUK - 160W RMS', '5', 2147483647, 'Superior sound performance with three-way speakers\r\n\r\n', '5-czone.com.pk-1540-17515-161224065832.jpg', 'Harman Speakers', 'Harman', 'Bluetooth music streaming', 'USB Charging port', '160 W RMS', '3.5 mm audio cable Input', '87900', '100000'),
(5, '', 'JBL Partybox Ultimate - Multi Purpose Party Speaker | Wi-fi Bluetooth | Lightshow | IPx4 Slashproof | Dual Mic and Guitar Inputs | Handle and Sturdy Wheels | Black', '5', 2147483647, 'All the Superior Original JBL Pro Sound You Can Handle\r\n\r\n', 'czone.com.pk-12-1540-18198-210425094002.jpg', 'JBL Speakers', 'JBL', 'A Multi-Dimensional, Dynamic Lightshow', 'Wi-Fi and Bluetooth Connectivity', 'Handle and sturdy wheels', 'IPx4 Splashproof', '399990', ''),
(6, '', 'JBL Partybox Ultimate - Multi Purpose Party Speaker | Wi-fi Bluetooth | Lightshow | IPx4 Slashproof | Dual Mic and Guitar Inputs | Handle and Sturdy Wheels | Black', '5', 2147483647, 'All the Superior Original JBL Pro Sound You Can Handle\r\n\r\n', 'czone.com.pk-12-1540-18198-210425094002.jpg', 'JBL Speakers', 'JBL', 'A Multi-Dimensional, Dynamic Lightshow', 'Wi-Fi and Bluetooth Connectivity', 'Handle and sturdy wheels', 'IPx4 Splashproof', '399990', '');

-- --------------------------------------------------------

--
-- Table structure for table `speaker_brand`
--

CREATE TABLE `speaker_brand` (
  `id` int(11) NOT NULL,
  `speakerbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `speaker_brand`
--

INSERT INTO `speaker_brand` (`id`, `speakerbrand`, `created_at`) VALUES
(3, 'Amazon', '2025-05-29 22:09:58'),
(4, 'JBL', '2025-05-29 22:10:13'),
(5, 'Harman', '2025-05-29 22:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `speaker_store`
--

CREATE TABLE `speaker_store` (
  `id` int(11) NOT NULL,
  `speakerstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `speaker_store`
--

INSERT INTO `speaker_store` (`id`, `speakerstore`, `created_at`) VALUES
(3, 'Amazon', '2025-05-29 22:09:58'),
(4, 'JBL Speakers', '2025-05-29 22:10:13'),
(5, 'Harman Speakers', '2025-05-29 22:10:24');

-- --------------------------------------------------------

--
-- Table structure for table `ssd`
--

CREATE TABLE `ssd` (
  `solid_disk` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ssd`
--

INSERT INTO `ssd` (`solid_disk`, `created_at`) VALUES
('Adata', '2025-03-27 10:45:29'),
('HIKVision', '2025-03-27 10:45:25'),
('Kingston SSD\'s', '2025-03-27 10:44:57'),
('Lexar', '2025-03-27 10:45:18'),
('Portable SSD\'s', '2025-03-27 10:45:44'),
('Samsung', '2025-03-27 10:45:33'),
('TeamGroup', '2025-03-27 10:45:40'),
('Western Digital (WD)', '2025-03-27 10:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `ssd_data`
--

CREATE TABLE `ssd_data` (
  `id` int(11) NOT NULL,
  `offer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sd` varchar(255) DEFAULT NULL,
  `store` varchar(255) DEFAULT NULL,
  `spec1` varchar(255) DEFAULT NULL,
  `spec2` varchar(255) DEFAULT NULL,
  `spec3` varchar(255) DEFAULT NULL,
  `spec4` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `old_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ssd_data`
--

INSERT INTO `ssd_data` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `sd`, `store`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(7, '', 'Lexar NS100 128GB SSD 2.5” SATA III, Internal Solid State Drive, LNS100-128RB', '3', 2147483647, 'Improve your existing system’s performance with the Lexar® NS100 2.5” SATA III (6Gb/s) solid-state drive (SSD).\r\n\r\n', 'copy-copy-copy-15-czone.com.pk-1540-12710-070122064023.jpg', 'Lexar', '120GB - 128GB ', 'Up To 550MB/s Read Speed', 'Improve your computer’s performance', 'Give your laptop or PC computer a boost', 'Built to last', 3550.00, 0.00),
(9, '', 'HikVision E100 128GB SSD 2.5\" SATA 6GB/s Solid State Drive HS-SSD-E100', '3', 2147483647, 'HikVision E100 3D NAND offers the potential for higher capacity, performance, and stability.\r\n\r\n', 'copy-hikvision-e100-1tb-ssd-1000px-v1-0002-1540-8502-050919023430.jpg', 'HIKVision', '120GB - 128GB ', 'Total Capacity: 128 GB', 'Max. read speed (MB/s): 550', 'Max. write speed (MB/s): 430', 'SATA III 6 Gb/s Interface', 3800.00, 0.00),
(10, '', 'HikVision E100 256GB SSD 2.5\" SATA 6GB/s Solid State Drive HS-SSD-E100', '4', 2147483647, 'HikVision E100 3D NAND offers the potential for higher capacity, performance, and stability.\r\n\r\n', 'untitled-1-1540-8948-011223094808.jpg', 'HIKVision', '240GB - 256GB', 'Total Capacity: 256 GB', 'Max. read speed (MB/s): 550', 'Max. write speed (MB/s): 450', 'SATA III 6 Gb/s Interface', 4300.00, 0.00),
(11, '', 'Lexar NS100 256GB SSD 2.5” SATA III Internal Solid State Drive', '3', 2147483647, 'Improve your existing system’s performance with the Lexar® NS100 2.5” SATA III (6Gb/s) solid-state drive (SSD).\r\n\r\n', 'copy-copy-copy-15-czone.com.pk-1540-12710-070122064023.jpg', 'Lexar', '240GB - 256GB', '2.5” SATA III (6Gb/s)', 'Sequential Read up to 550MB/s', 'Give your laptop or PC computer a boost', 'Built to last', 5200.00, 0.00),
(12, '', 'Lexar NM620 M.2 2280 NVMe SSD 256GB PCle Gen 3x4 LNM620X256G-RNNNG', '3', 2147483647, 'Unlike traditional hard disk drives, the NM620 SSD has no moving parts, so it’s built to last. On top of that, it’s also shock and vibration resistant*, making it one robust and reliable SSD.\r\n\r\n', '7-czone.com.pk-1540-13303-170622085841.jpg', 'Lexar', '240GB - 256GB', '256GB —sequential read up to 3300MB/s, write up to 1300MB/s', 'NVMe 1.4 Standard', 'PCle Gen 3x4 Interface', 'Energy Efficient', 5500.00, 0.00),
(13, '', 'HikVision E100 512GB SSD 2.5\" SATA 6GB/s Solid State Drive HS-SSD-E100', '4', 2147483647, 'HikVision E100 3D NAND offers the potential for higher capacity, performance, and stability.\r\n\r\n', '15-czone.com.pk-1540-14466-060323095516.jpg', 'HIKVision', '480GB - 512GB', 'Capacity: 512GB', 'Max. read speed (MB/s): 550', 'Max. write speed (MB/s): 480', 'SATA III 6 Gb/s Interface', 7500.00, 0.00),
(14, '', 'ADATA Ultimate SU650 512GB SSD 3D-NAND 2.5\" SATA III Solid State Drive - ASU650SS-512GT-R', '4', 2147483647, 'The Ultimate SU650 solid state drive implements 3D NAND Flash and a high-speed controller, offering capacities up to 960GB.\r\n\r\n', '14-czone.com.pk-1540-13847-010724082037.jpg', 'Adata', '480GB - 512GB', '3D NAND Technology', 'Sequential Read (Max*) Up to 520MB/s', 'Sequential Write (Max*) Up to 450MB/s', 'Compatible with most PC with SATA 6Gb/s Interface', 7990.00, 0.00),
(15, '', 'Lexar NS100 512GB SSD 2.5” SATA III, Internal Solid State Drive', '3', 2147483647, 'Improve your existing system’s performance with the Lexar® NS100 2.5” SATA III (6Gb/s) solid-state drive (SSD).\r\n\r\n', 'copy-copy-copy-15-czone.com.pk-1540-12710-070122064023.jpg', 'Lexar', '480GB - 512GB', 'Up To 550MB/s Read Speed', 'Improve your computer’s performance', 'Give your laptop or PC computer a boost', 'Built to last', 8200.00, 0.00),
(16, '', 'Lexar NM620 M.2 2280 NVMe SSD 512GB PCle Gen 3x4 LNM620X512G', '3', 2147483647, 'Unlike traditional hard disk drives, the NM620 SSD has no moving parts, so it’s built to last. On top of that, it’s also shock and vibration resistant*, making it one robust and reliable SSD.\r\n\r\n', '7-czone.com.pk-1540-13303-170622085841.jpg', 'Lexar', '480GB - 512GB', 'Up to 3300MB/s read, 2400MB/s write', 'NVMe 1.4 Standard', 'PCle Gen 3x4 Interface', 'Energy Efficient', 8500.00, 0.00),
(17, '', 'TeamGroup CX2 512GB SSD SATA', '4', 2147483647, 'Different from traditional mechanical hard drives, the CX2 uses features like FLASH technology, low power consumption and high-speed transfer. It is the best choice for replacing traditional hard drives.\r\n\r\n', '6-czone.com.pk-1540-13684-120922071756.jpg', 'TeamGroup', '480GB - 512GB', '512GB Read: Up to 530MB/s Max ; Write: 470MB/s*', 'SATA III 6Gb/s', 'Advanced SLC Caching technology', 'Shock and drop resistant for safe use', 9100.00, 0.00),
(18, '', 'WD Blue SN580 NVMe™ SSD 500GB WDS500G3B0E PCIe Gen4 x4 M.2 2280', '4', 2147483647, 'Spark Your Imagination with the WD Blue SN580 NVMe SSD with PCIe® Gen 4.0 for creators and professionals.\r\n\r\n', 'copy-33-czone.com.pk-1540-17041-051024115853.jpg', 'Western Digital (WD)', '480GB - 512GB', 'PCIe Gen4 x4 M.2 2280', '4000MB/s sequential read performance', 'Make light work of heavy files', 'Designed for content creators and professionals', 9400.00, 0.00),
(19, '6', 'WD Blue SN5000 NVMe SSD 1TB WDS100T4B0E | 5,150MB/s', '4', 2147483647, 'The WD Blue SN5000 NVMe™ SSD is next-generation storage designed for creators and professionals.\r\n\r\n', '61zvlgv716l.webp', 'Western Digital (WD)', '960GB - 1TB ', 'PCIe Gen4 x4', 'M.2 2280', 'Sequential Read Performance 5,150MB/s', 'Sequential Write Performance 4,900MB/s', 15800.00, 16800.00),
(21, '9', 'Western Digital 2TB WD Blue SN580 NVMe SSD Gen4 x4 PCIe M.2 2280 Up to 4,150 MB/s WDS200T3B0E', '3', 2147483647, 'WD Blue SN580 NVMe™ SSD - 2TB\r\n\r\n', '41sxoxtpk9l.-ac-sl1280--1540-17511-141224013625.jpg', 'Western Digital (WD)', '2TB', 'PCIe Gen4 x4 2TB M.2 2280', 'Sequential Read Performance 4150MB/s', 'Sequential Write Performance 4150MB/s', 'High performance, low lag time', 32900.00, 36000.00),
(22, '', 'WD Blue SN5000 NVMe SSD 2TB WDS200T4B0E | 5,150MB/s', '5', 2147483647, 'The WD Blue SN5000 NVMe™ SSD is next-generation storage designed for creators and professionals.\r\n\r\n', 'czone.com.pk-10-1540-18045-260325091208.jpg', 'Western Digital (WD)', '2TB', 'PCIe Gen4 x4', 'M.2 2280', 'Sequential Read Performance 5,150MB/s', 'Sequential Write Performance 4,850MB/s', 35200.00, 0.00),
(26, '', 'WD Blue SN5000 NVMe SSD 2TB WDS200T4B0E | 5,150MB/s', '5', 2147483647, 'The WD Blue SN5000 NVMe™ SSD is next-generation storage designed for creators and professionals.\r\n\r\n', 'czone.com.pk-10-1540-18045-260325091208.jpg', 'Western Digital (WD)', '2TB', 'PCIe Gen4 x4', 'M.2 2280', 'Sequential Read Performance 5,150MB/s', 'Sequential Write Performance 4,850MB/s', 35200.00, 0.00),
(27, '1', 'Samsung 870 EVO 500GB SSD SATA 2.5\" - MZ-77E500', '3', 2147483647, 'Maximize SATA interface limit up to 560/530 MB/s for reading and write sequential speeds. The perfect choice for creators, IT professionals or everyday users, the latest 870 EVO has indisputable performance, reliability and compatibility built upon Samsun', 'copy-ssd-870-evo-packaging-1540-11096-200221065614.jpg', 'Samsung', '480GB - 512GB', 'Read/write speeds of up to 560/530 MB/s', 'SATA 6 Gb/s Interface', 'S.M.A.R.T Supported', 'V-NAND', 14690.00, 14900.00),
(28, '12', 'Samsung 990 EVO Gen4 NVMe SSD 1TB, up to 5,000MB/s MZ-V9E1T0BTA 2.5\" - MZ-77E1T0', '5', 2147483647, 'Load game and save files in a flash with read and write speeds of up to 5,000/4,200 MB/s.*\r\n\r\n', '22-czone.com.pk-1540-17724-240125113158.jpg', 'Samsung', '960GB - 1TB ', 'PCIe® 4.0 x4 / 5.0 x2, NVMe2.0', 'Unlock the power of Samsung SSDs in a few easy steps', 'M.2 (2280)', 'Samsung V-NAND TLC', 23700.00, 27000.00),
(29, '', 'Samsung 870 EVO 1TB SSD SATA 2.5\" - MZ-77E1T0', '3', 2147483647, 'Maximize SATA interface limit up to 560/530 MB/s for reading and write sequential speeds. The perfect choice for creators, IT professionals or everyday users, the latest 870 EVO has indisputable performance, reliability and compatibility built upon Samsun', 'copy-ssd-870-evo-packaging-1540-11096-200221065614.jpg', 'Samsung', '960GB - 1TB ', 'Read/write speeds of up to 560/530 MB/s', 'SATA 6 Gb/s Interface', 'S.M.A.R.T Supported', 'V-NAND', 23790.00, 0.00),
(30, '', 'Samsung 990 EVO Plus Gen4 NVMe SSD 1TB | MZ-V9S1T0 | 7,250 MB/s', '4', 2147483647, 'Harness the full power of your drive with the enhanced large-file performance of Intelligent TurboWrite 2.0\r\n\r\n', '134-czone.com.pk-1540-17852-190225012943.jpg', 'Samsung', '960GB - 1TB ', 'Sequential Read Speed up to 7,250 MB/s', 'Sequential Write Speed up to 6,300 MB/s', 'Performance Optimization', 'PCIe® 4.0 x4 / 5.0 x2 NVMe ™ 2.0 M.2 (2280)', 26990.00, 0.00),
(31, '', 'Samsung 990 PRO PCIe 4.0 NVMe SSD 1TB MZ-V9P1T0 M.2 2280 | 7450 MB/s', '4', 2147483647, 'Reach max performance with PCIe® 4.0. Experience longer-lasting, opponent-blasting speed. The in-house controller\'s smart heat control delivers supreme power efficiency while maintaining ferocious performance that always keeps you at the top of your game.', '1-czone.com.pk-1540-14071-011222074353.jpg', 'Samsung', '960GB - 1TB ', 'PCIe Gen 4.0 x4, NVMe 2.0', 'M.2 (2280)', 'Sequential Read Up to 7,450 MB/s *', 'Sequential write Up to 6,900 MB/s *', 30900.00, 0.00),
(32, '', 'Samsung 990 PRO w/ Heatsink PCIe® 4.0 NVMe™ M.2 (2280) SSD 1TB MZ-V9P1T0 | Compatible with Playstation 5', '3', 2147483647, 'Reach max performance with PCIe®4.0.Experience longer-lasting, opponent-blasting speed.The in-house controller\'s smart heat control delivers supreme power efficiency while maintaining ferocious performance that always keeps you at the top of your game.\r\n\r', '17-czone.com.pk-1540-16239-140624084254.jpg', 'Samsung', '960GB - 1TB ', 'Compatible with Playstation®5.', 'Sequential read/write speeds up to 7,450/6,900 MB/s.', 'PCIe Gen 4.0 x4, NVMe 2.0', 'Samsung V-NAND 3-bit MLC', 38000.00, 0.00),
(33, '', 'Samsung 990 EVO Plus Gen4 NVMe SSD 2TB | MZ-V9S2T0 | 7,250 MB/s', '3', 2147483647, 'Harness the full power of your drive with the enhanced large-file performance of Intelligent TurboWrite 2.0\r\n\r\n', '134-czone.com.pk-1540-17852-190225012943.jpg', 'Samsung', '2TB', 'Sequential Read Speed up to 7,250 MB/s', 'Sequential Write Speed up to 6,300 MB/s', 'Performance Optimization', 'PCIe® 4.0 x4 / 5.0 x2 NVMe ™ 2.0 M.2 (2280)', 42990.00, 0.00),
(34, '', 'Samsung 870 QVO 8TB 2.5\" SATA III Internal SSD MZ-77Q8T0B', '5', 2147483647, 'The 870 QVO is Samsung’s latest 2nd gen. QLC SSD and the largest of its kind that provides up to 8TB of storage*. Offering an incredible upgrade for everyday PC users who want to ramp-up their desktop PC or laptop to the largest available storage in the m', '2-czone.com.pk-1540-14295-190123034015.jpg', 'Samsung', '8TB', '870 QVO SATA III 2.5\" SSD 8TB', 'Read/write speeds of up to 560/530 MB/s', 'SATA 6 Gb/s Interface', 'World\'s No.1 Flash Memory Brand', 157900.00, 0.00),
(35, '', 'Samsung 990 PRO w/ Heatsink PCIe® 4.0 NVMe™ M.2 (2280) SSD 4TB | Compatible with Playstation 5', '3', 2147483647, 'Reach max performance with PCIe®4.0.Experience longer-lasting, opponent-blasting speed.The in-house controller\'s smart heat control delivers supreme power efficiency while maintaining ferocious performance that always keeps you at the top of your game.\r\n\r', '17-czone.com.pk-1540-16239-140624084254.jpg', 'Samsung', '4TB ', 'Compatible with Playstation®5.', 'Sequential read/write speeds up to 7,450/6,900 MB/s.', 'PCIe Gen 4.0 x4, NVMe 2.0', 'Samsung V-NAND 3-bit MLC', 99500.00, 0.00),
(36, '', 'Samsung 980 PRO with Heatsink 2TB PCIe 4.0 NVMe SSD M.2 2280 | PS5 Compatible MZ-V8P2T0', '5', 2147483647, 'Unleash the power of the Samsung 980 PRO with Heatsink for next-level computing and gaming. With a PCIe® 4.0 NVMe™ interface, get up to 2x the data transfer rate of PCIe® 3.0* while remaining compatible with PCIe® 3.0.\r\n\r\n', 'copy-21-czone.com.pk-1540-13569-220822093832.jpg', 'Samsung', '2TB', 'Compatibility: PC + PS5', 'Read/Write Speeds 7,000/5,100 MB/s', 'PCIe Gen 4.0 x4, NVMe 1.3c', 'World\'s No.1 Flash Memory Brand', 48990.00, 0.00),
(37, '', 'ADATA SU650 Solid State Drive 1TB SSD 2.5\" SATA ASU650SS-1TT-R', '4', 2147483647, 'The intelligent SLC caching algorithm allows NAND Flash memory to operate in single-level cell mode and boosts performance, helping sustain peak SU650 read/write speeds up to 520/450MB per second for smoother and faster boot, file transfers, and downloads', '5-czone.com.pk-1540-15719-140224094722.jpg', 'Adata', '960GB - 1TB ', 'Sequential Read / Write Performance up to 520 / 450MB/s', 'Lower power consumption and noise level', 'Free downloadable ADATA SSD File Management and Data migration software', 'Tougher , quieter , and more reliable', 14990.00, 0.00),
(38, '', 'HikVision E100 1TB SSD 2.5\" SATA 6GB/s Solid State Drive HS-SSD-E100', '4', 2147483647, 'HikVision E100 3D NAND offers the potential for higher capacity, performance, and stability.\r\n\r\n', 'copy-15-czone.com.pk-1540-14466-060323095516-1540-14495-170323084729.jpg', 'HIKVision', '960GB - 1TB ', 'Capacity: 1024GB - 1TB', 'Max. read speed (MB/s): 550', 'Max. write speed (MB/s): 480', 'SATA III 6 Gb/s Interface', 12900.00, 0.00),
(39, '', 'Lexar NS100 1TB SSD 2.5” SATA III LNS100-1TRB, Internal Solid State Drive', '3', 2147483647, 'Improve your existing system’s performance with the Lexar® NS100 2.5” SATA III (6Gb/s) solid-state drive (SSD).\r\n\r\n', 'copy-copy-15-czone.com.pk-1540-12710-070122064023.jpg', 'Lexar', '960GB - 1TB ', 'Up To 550MB/s Read Speed', 'Improve your computer’s performance', 'Give your laptop or PC computer a boost', 'Built to last', 13990.00, 0.00),
(40, '', 'Lexar NM620 M.2 2280 NVMe SSD 1TB PCle Gen 3x4 LNM620X001T-RNNNG', '5', 2147483647, 'Unlike traditional hard disk drives, the NM620 SSD has no moving parts, so it’s built to last. On top of that, it’s also shock and vibration resistant*, making it one robust and reliable SSD.\r\n\r\n', 'copy-7-czone.com.pk-1540-13303-170622085841.jpg', 'Lexar', '960GB - 1TB ', 'Up to 3300MB/s read, 3000MB/s write', 'NVMe 1.4 Standard', 'PCle Gen 3x4 Interface', 'Energy Efficient', 15400.00, 0.00),
(41, '', 'Lexar NM790 1TB M.2 2280 PCIe Gen 4×4 NVMe SSD | Compatible with PlayStation 5 | 7400MB/s', '3', 2147483647, 'With a blazing 7400MB/s sequential read, 6500MB/s sequential write* and random read speeds of up to 1,000,000 IOPs, the Lexar® NM790 SSD has the performance to put you across the finish line first or easily meet your most demanding deadlines.\r\n\r\n', 'copy-9-czone.com.pk-1540-15627-080124085249.jpg', 'Lexar', '960GB - 1TB ', 'Sequential read up to 7400MB/s, sequential write up to 6500MB/s*', 'M.2 2280 PCIe Gen4x4', 'Shock-resistant*, Vibration-resistant*', 'MTBF: 1,500,000 Hours', 23390.00, 0.00),
(42, '', 'Lexar NM620 M.2 2280 NVMe SSD 2TB PCle Gen 3x4 LNM620X002T-RNNNG', '3', 2147483647, 'Unlike traditional hard disk drives, the NM620 SSD has no moving parts, so it’s built to last. On top of that, it’s also shock and vibration resistant*, making it one robust and reliable SSD.\r\n\r\n', '79-czone.com.pk-1540-14265-160123100337.jpg', 'Lexar', '960GB - 1TB ', 'Up to 3300MB/s read, 3000MB/s write', 'NVMe 1.4 Standard', 'PCle Gen 3x4 Interface', 'Energy Efficient', 28900.00, 0.00),
(43, '', 'Lexar NM790 4TB M.2 2280 PCIe Gen 4×4 NVMe SSD | Compatible with PlayStation 5 | 7400MB/s', '5', 2147483647, 'With a blazing 7400MB/s sequential read, 6500MB/s sequential write* and random read speeds of up to 1,000,000 IOPs, the Lexar® NM790 SSD has the performance to put you across the finish line first or easily meet your most demanding deadlines.\r\n\r\n', 'copy-copy-9-czone.com.pk-1540-15627-080124085249.jpg', 'Lexar', '4TB ', 'Sequential read up to 7400MB/s, sequential write up to 6500MB/s*', 'M.2 2280 PCIe Gen4x4', 'Shock-resistant*, Vibration-resistant*', 'MTBF: 1,500,000 Hours', 76990.00, 0.00),
(44, '', 'TeamGroup CX2 8TB SSD SATA', '3', 2147483647, 'Different from traditional mechanical hard drives, the CX2 uses features like FLASH technology, low power consumption and high-speed transfer. It is the best choice for replacing traditional hard drives.\r\n\r\n', '6-czone.com.pk-1540-13684-120922071756.jpg', 'TeamGroup', '8TB', '8TB Read: Up to 530MB/s Max ; Write: 470MB/s*', 'SATA III 6Gb/s', 'Advanced SLC Caching technology', 'Shock and drop resistant for safe use', 9100.00, 0.00),
(47, '14', 'Kingston NV3 1TB M.2 2280 PCIe 4.0 NVMe SSD SNV3S/1000G, 6000MB/s', '4', 2147483647, 'Gen 4x4 NVMe PCIe performance with speeds up to 6000MB/s.\\r\\n\\r\\n', '71znk38jzzl.-ac-sl1500--1540-17447-021224124919.jpg', 'Kingston SSD\'s', '960GB - 1TB ', 'M.2 2280', 'PCIe 4.0 x4 NVMe', '1TB – 6,000/4,000MB/s', '3D NAND', 15900.00, 18500.00),
(48, '', 'Kingston XS1000 1TB External Solid State Drive SSD | USB-A 3.2 Gen 2 | Up to 1050 MB/s', '5', 2147483647, 'Kingston’s XS1000 external SSD is an incredibly convenient file backup solution. Its sleek, compact form factor is designed to fit seamlessly into your lifestyle, allowing you to carry it anywhere with ease.\\r\\n\\r\\n', 'copy-1-czone.com.pk-1-1540-16486-240724072140.jpg', 'Kingston SSD\'s', '960GB - 1TB ', '1TB Capacity', 'USB-A 3.2 Gen 2 Interface', 'Up to 1050 MB/s Read Speed*', 'Up to 1000 MB/s Write Speed*', 20800.00, 0.00),
(49, '', 'Kingston NV2 2TB PCIe 4.0 Gen 4 NVMe M.2 2280 SSD - SNVS/2000G', '4', 2147483647, 'Kingston’s NV2 PCIe 4.0 NVMe SSD is a substantial next-gen storage solution powered by a Gen 4x4 NVMe controller.\\r\\n\\r\\n', '3-czone.com.pk-1540-14028-161122065150.jpg', 'Kingston SSD\'s', '2TB', 'Sequential Read/Write* - 2TB – 3,500 / 2,800MB/s', 'M.2 2280 PCIe 4.0 x4 NVMe', 'Ideal for Systems with Limited Space', 'Gen 4x4 NVMe PCIe Performance', 27990.00, 0.00),
(50, '', 'Kingston NV3 2TB M.2 2280 PCIe 4.0 NVMe SSD SNV3S/2000G, 6000MB/s', '4', 2147483647, 'Gen 4x4 NVMe PCIe performance with speeds up to 6000MB/s.\\r\\n\\r\\n', '39-czone.com.pk-1540-17757-030225123659.jpg', 'Kingston SSD\'s', '2TB', 'M.2 2280', 'PCIe 4.0 x4 NVMe', '1TB – 6,000/5,000MB/s', '3D NAND', 32500.00, 0.00),
(51, '', 'Kingston NV3 4TB M.2 2280 PCIe 4.0 NVMe SSD, 6000MB/s SNV3S/4000G', '5', 2147483647, 'Gen 4x4 NVMe PCIe performance with speeds up to 6000MB/s.\\r\\n\\r\\n', '5-czone.com.pk-2-1540-17745-010225084413.jpg', 'Kingston SSD\'s', '4TB ', 'M.2 2280', 'Gen 4x4 NVMe PCIe Performance', '4TB – 6,000/5,000MB/s', '3D NAND', 67500.00, 0.00),
(52, '9', 'Lexar® SL200 512GB Portable SSD - Up To 550MB/s - USB 3.1', '3', 2147483647, '256-bit AES Encryption | USB 3.1 Type-C\\r\\n\\r\\n', 'copy-9-czone.com.pk-1540-17314-161124081936.jpg', 'Portable SSD\'s', '480GB - 512GB', 'up to 550 MB/s read, up to 400 MB/s write', 'System Supported: Mac® OSX 10.6+', 'Securely protect your files', 'Exceptional resilience to the elements', 14500.00, 16000.00),
(53, '', 'Samsung Portable SSD T5 EVO USB 3.2 4TB | Black', '5', 2147483647, 'We went big and made it portable. It’s the T5 EVO—an ideal choice for gamers and content creators. This SSD is engineered to handle large file transfers while still small and nimble enough to take on the go.\\r\\n\\r\\n', '2-czone.com.pk-1540-16449-200724075120.jpg', 'Portable SSD\'s', '4TB ', 'Massive storage. Compact convenience.', 'Capacities that keep up', 'Pick up the pace', 'Shock Resistant Rubber Design', 69990.00, 0.00),
(54, '', 'SanDisk Extreme Portable SSD 4TB (with Updated Firmware) 1050MB/s', '5', 2147483647, 'Your life’s an adventure. The SanDisk Extreme Portable SSD fits your mobile lifestyle and accelerates every move. Tested and compatible with iPhone 15 Plus/Pro/Max so you can free up space on your smartphone.\\r\\n\\r\\n', 'copy-copy-5-czone.com.pk-1540-14871-070723100521.jpg', 'Portable SSD\'s', '4TB ', 'Sequential Read Performance 1050MB/s', 'Sequential Write Performance 1000MB/s', 'USB 3.2 Gen 2', 'Fast NVMe solid state performance in a portable, high-capacity drive', 77900.00, 0.00),
(55, '', 'Samsung Portable SSD T7 Shield USB 3.2 4TB (Black)', '5', 2147483647, 'Tough, fast, and compact. The all-new rugged PSSD T7 Shield is built to endure with the space to create thanks to an IP65 rating for Dust* and Water** resistance.\\r\\n\\r\\n', 'copy-24-czone.com.pk-1540-14153-211222011847.jpg', 'Portable SSD\'s', '4TB ', 'High performance on-the-go, with rugged durability', 'Keep cool at high speed. Shock Resistant. IP 65 IP65 Rated.', 'USB 3.2', '', 88990.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `stabilizer`
--

CREATE TABLE `stabilizer` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stabilizer`
--

INSERT INTO `stabilizer` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'Stabimatic SD-500C 500VA Servo Motor Voltage Stabilizer', '4', 2147483647, 'Servo Motor Voltage Stabilizer for Computers.\r\n\r\n', '4-czone.com.pk-1540-5302-100822064247.jpg', 'Stabimatic', 'Rs.10,000 - Rs.14,999', 'Capacity: 500VA', 'Input Voltage: 130-260V AC', 'Output Voltage: 220/110V AC', 'Output Stability: (+)(-)1 TO 2 %', '10500', ''),
(3, '', 'Stabimatic SXD-2000C 2000VA AVR Stabilizer', '4', 2147483647, 'It is considered best for all kinds of appliances due to its low harmonic distortion and an AVR function range of 140 V ac ~ 275 ac. It has a charger function range between 10 A - 20 A and features Toro dial Transformer (C.R.G.O Transformer) Technolo', '6-czone.com.pk-1540-5303-231021011833.jpg', 'Stabimatic', 'Rs.20,000 - Rs.24,999', 'Automatic voltage stabilizer', 'Sine Wave', 'Servo motor control', '2000 VA', '24500', ''),
(4, '', 'Stabimatic GLD Gold Series GLD-3000C 3KVA Single Phase Servo Type Stabilizer Analog AVR', '5', 2147483647, 'Applications: Medical equipment, Communication systems, Computers.\r\n\r\n', 'copy-8-czone.com.pk-1540-13381-140722015725.jpg', 'Stabimatic', 'Rs.30,000 - Rs.39,999', 'Input 130~260V', 'Output 110/220V ± 2%', 'High Efficiency', 'Pure Sine Wave', '31500', ''),
(5, '', 'Stabimatic GLD Gold Series GLD-3000C 3KVA Single Phase Servo Type Stabilizer Analog AVR', '5', 2147483647, 'Applications: Medical equipment, Communication systems, Computers.\r\n\r\n', 'copy-8-czone.com.pk-1540-13381-140722015725.jpg', 'Stabimatic', 'Rs.30,000 - Rs.39,999', 'Input 130~260V', 'Output 110/220V ± 2%', 'High Efficiency', 'Pure Sine Wave', '31500', '');

-- --------------------------------------------------------

--
-- Table structure for table `stabilizer_brand`
--

CREATE TABLE `stabilizer_brand` (
  `id` int(11) NOT NULL,
  `stabilizerbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stabilizer_brand`
--

INSERT INTO `stabilizer_brand` (`id`, `stabilizerbrand`, `created_at`) VALUES
(3, 'Rs.10,000 - Rs.14,999', '2025-05-29 22:32:02'),
(7, 'Rs.20,000 - Rs.24,999', '2025-05-29 22:32:51'),
(8, 'Rs.30,000 - Rs.39,999', '2025-05-29 22:33:07');

-- --------------------------------------------------------

--
-- Table structure for table `stabilizer_store`
--

CREATE TABLE `stabilizer_store` (
  `id` int(11) NOT NULL,
  `stabilizerstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stabilizer_store`
--

INSERT INTO `stabilizer_store` (`id`, `stabilizerstore`, `created_at`) VALUES
(3, 'Stabimatic', '2025-05-29 22:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `s_capacity`
--

CREATE TABLE `s_capacity` (
  `c_storage` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `s_capacity`
--

INSERT INTO `s_capacity` (`c_storage`, `created_at`) VALUES
('120GB - 128GB ', '2025-03-27 10:59:13'),
('240GB - 256GB', '2025-03-27 10:59:08'),
('2TB', '2025-03-27 10:58:29'),
('480GB - 512GB', '2025-03-27 10:59:02'),
('4TB ', '2025-03-27 10:58:25'),
('8TB', '2025-03-27 10:58:20'),
('960GB - 1TB ', '2025-03-27 10:58:35');

-- --------------------------------------------------------

--
-- Table structure for table `tabletacc`
--

CREATE TABLE `tabletacc` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabletacc`
--

INSERT INTO `tabletacc` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(1, '', 'Logitech CRAYON (USB-C) Pixel-Precise Digital Pencil for all iPad Models 2018 and Later | 914-000074', '4', 2147483647, 'Made with Apple Pencil technology\r\n\r\n', '19-czone.com.pk-1540-17493-131224124100.jpg', 'Tablet Stylus Pens', 'Logitech', 'Annotate', 'Taking Notes', 'Making Lists  ', 'Sketching', '20500', ''),
(2, '', 'Microsoft Surface Pro Signature Keyboard - Poppy Red - Surface Pro 8, Surface Pro 9, Surface Pro X', '5', 245260124, 'Type in comfort with Surface Pro Signature Keyboard. Sleek and compact, it performs like a traditional laptop keyboard, complete with a full mechanical keyset, backlit keys, and a large touchpad for precise control and navigation.\r\n\r\n', '14-czone.com.pk-1540-14829-200623095406.jpg', 'Keyboards', 'Microsoft', 'Pair with Surface Pro devices', 'For Surface Pro 9, Surface Pro 8, Surface Pro X', 'Dimensions: 11.38\" x 8.90\" x .19” (289.1 x 226.1 x 4.89 mm)', 'Pen integration: Surface Slim Pen 2* Storage And Charging', '52500', ''),
(3, '', 'Microsoft Surface Pro Signature Keyboard - Black - Surface Pro 8, Surface Pro 9, Surface Pro X', '5', 2147483647, 'Type in comfort with Surface Pro Signature Keyboard. Sleek and compact, it performs like a traditional laptop keyboard, complete with a full mechanical keyset, backlit keys, and a large touchpad for precise control and navigation.\r\n\r\n', '7-czone.com.pk-1540-14825-200623095030.jpg', 'Keyboards', 'Microsoft', 'Pair with Surface Pro devices', 'For Surface Pro 9, Surface Pro 8, Surface Pro X', 'Dimensions: 11.38\" x 8.90\" x .19” (289.1 x 226.1 x 4.89 mm)', 'Pen integration: Surface Slim Pen 2* Storage And Charging', '54900', ''),
(4, '', 'Apple Magic Keyboard for iPad Pro 12.9\" US English Black MJQK3', '5', 2147483647, 'Provide protection and laptop-like functionality to your tablet with the Apple Magic Keyboard for iPad Pro 12.9\" (3rd/4th/5th Gen).\r\n\r\n', '1-czone.com.pk-1540-12814-230122071119.jpg', 'Keyboards', 'Apple', 'For Apple iPad Pro 12.9\" (Gen 3-5)', 'US English Language', 'Keyboard with Multi-Gesture Touchpad', 'Floating Cantilever iPad Mount', '102000', '');

-- --------------------------------------------------------

--
-- Table structure for table `tabletacc_brand`
--

CREATE TABLE `tabletacc_brand` (
  `id` int(11) NOT NULL,
  `tabletaccbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabletacc_brand`
--

INSERT INTO `tabletacc_brand` (`id`, `tabletaccbrand`, `created_at`) VALUES
(1, 'Apple', '2025-05-30 02:14:21'),
(2, 'Logitech', '2025-05-30 02:14:24'),
(3, 'Microsoft', '2025-05-30 02:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `tabletacc_store`
--

CREATE TABLE `tabletacc_store` (
  `id` int(11) NOT NULL,
  `tabletaccstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabletacc_store`
--

INSERT INTO `tabletacc_store` (`id`, `tabletaccstore`, `created_at`) VALUES
(1, 'Tablet Stylus Pens', '2025-05-30 02:14:15'),
(2, 'Keyboards', '2025-05-30 02:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `tabletpc`
--

CREATE TABLE `tabletpc` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabletpc`
--

INSERT INTO `tabletpc` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'Amazon Kindle Scribe 64GB with Pen + Cover', '4', 2147483647, 'Read and write as naturally as you do on paper – Features the world’s first 10.2” 300 ppi glare-free Paperwhite display and includes Premium Pen.\r\n\r\n', 'czone.com.pk-5-1540-18189-180425010245.jpg', 'Amazon Kindle', 'Amazon', 'Built-in digital notebook', 'Add sticky notes to books', 'Import and mark up docs', '10.2” glare-free, front-lit display', '148990', ''),
(3, '', 'Apple iPad 11\" A16 Chip 128GB Wi-Fi Only | Blue, Pink, Silver, Yellow', '3', 245260124, 'Now with the A16 chip, the Apple 11\" iPad makes it easier to work, take notes, collaborate, multitask, and edit 4K video, all on one device.\r\n\r\n', 'czone.com.pk-10-1540-18254-070525074234.jpg', 'Apple Ipad', 'Apple', 'Apple A16 5-Core Chip', '2360 x 1640 Screen Resolution (264 ppi)', '4-Core GPU | 16-Core Neural Engine', '11\" Liquid Retina Touchscreen', '120000', ''),
(4, '', 'Apple iPad Air 13\" | Apple M3 8-Core Chip | 128GB | Wi-Fi Only | Gray Blue Purple Starlight', '4', 2147483647, 'Now with the M3 chip, the Apple 13\" iPad Air delivers optimal performance and is built for Apple Intelligence.\r\n\r\n', 'czone.com.pk-1540-18111-080425125027.jpg', 'Apple Ipad', 'Apple', 'Apple M3 8-Core Chip', '9-Core GPU | 16-Core Neural Engine', '13\" Liquid Retina Touchscreen', '2732 x 2048 Screen Resolution (264 ppi)', '245000', '');

-- --------------------------------------------------------

--
-- Table structure for table `tabletpc_brand`
--

CREATE TABLE `tabletpc_brand` (
  `id` int(11) NOT NULL,
  `tabletpcbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabletpc_brand`
--

INSERT INTO `tabletpc_brand` (`id`, `tabletpcbrand`, `created_at`) VALUES
(1, 'Amazon', '2025-05-29 23:27:25'),
(2, 'Apple', '2025-05-29 23:27:29');

-- --------------------------------------------------------

--
-- Table structure for table `tabletpc_store`
--

CREATE TABLE `tabletpc_store` (
  `id` int(11) NOT NULL,
  `tabletpcstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabletpc_store`
--

INSERT INTO `tabletpc_store` (`id`, `tabletpcstore`, `created_at`) VALUES
(1, 'Apple Ipad', '2025-05-29 23:27:16'),
(2, 'Amazon Kindle', '2025-05-29 23:27:20');

-- --------------------------------------------------------

--
-- Table structure for table `tvstream`
--

CREATE TABLE `tvstream` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tvstream`
--

INSERT INTO `tvstream` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(2, '', 'Amazon Fire TV Stick HD TV Stick with Alexa Voice Remote 8GB WiFi 5', '3', 2147483647, '50% more powerful than the previous generation for fast streaming in Full HD. Includes Alexa Voice Remote with power and volume buttons.\r\n\r\n', 'czone.com.pk-23-1540-18268-140525110049.jpg', 'Amazon', 'Rs.12,000 - Rs.12,999', 'Enhanced audio clarity of Dolby Atmos', 'Alexa Voice Remote with TV controls', 'Find content fast', 'Plug and play, out of the way', '12500', ''),
(3, '15', 'Amazon Fire TV Stick 4K Max Streaming Device, Wi-Fi 6, Alexa Voice Remote', '3', 2147483647, 'Our most powerful streaming stick - 40% more powerful than Fire TV Stick 4K, with faster app starts and more fluid navigation.\r\n\r\n', '11-czone.com.pk-1-1540-17349-201124092254.jpg', 'Amazon', 'Rs.17,000 - Rs.17,999', 'Get ready for next-gen Wi-Fi 6', 'Over 1.5 million movies and TV episodes', 'Alexa Voice Remote with TV controls', 'Smart—and always getting smarter', '17500', '20500'),
(4, '7', 'Xiaomi TV Box S (3rd Gen) 4K UHD Dolby Vision, Dolby Atmos DTS:X, Wi-Fi 6, Google TV', '4', 2147483647, '4K UHD resolution renders every detail with exceptional clarity so you won’t miss a thing\r\n\r\n', 'czone.com.pk-6-1540-18327-220525082439.jpg', 'Xiaomi Mi', 'Rs.18,000 - Rs.18,999', 'Dolby Vision', 'Cinema-grade visuals', 'Premium cinematic audio', '6nm high-performance platform', '18500', '20000'),
(5, '', 'Elgato HD60 X Stream and Record in 1080p60 HDR10 or 4K30 with Ultra-Low Latency on PS5, PS4/Pro, Xbox Series X/S, Xbox One X/S, in OBS, Works with PC and Mac', '5', 2147483647, 'HD60 X lets you capture PS5 or Xbox gameplay like a pro. Stream or record high-resolution content for audiences on any platform. No subscriptions. Zero limitations.\r\n\r\n', '17-czone.com.pk-1540-17027-021024092312.jpg', 'Elgato', 'Rs.57,500 - Rs.59,999', 'Plug and Play: Driver-free setup on Windows and Mac.', 'Ultra-low latency: Sub 100ms for perfect audio/video synchronization.', 'No Limitations: No watermarks, time limits or subscriptions', 'Capture Like a Pro', '58900', '');

-- --------------------------------------------------------

--
-- Table structure for table `tvstream_brand`
--

CREATE TABLE `tvstream_brand` (
  `id` int(11) NOT NULL,
  `tvstreambrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tvstream_brand`
--

INSERT INTO `tvstream_brand` (`id`, `tvstreambrand`, `created_at`) VALUES
(6, 'Rs.57,500 - Rs.59,999', '2025-05-30 02:46:41'),
(7, 'Rs.18,000 - Rs.18,999', '2025-05-30 02:46:45'),
(8, 'Rs.17,000 - Rs.17,999', '2025-05-30 02:46:48'),
(9, 'Rs.12,000 - Rs.12,999', '2025-05-30 02:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `tvstream_store`
--

CREATE TABLE `tvstream_store` (
  `id` int(11) NOT NULL,
  `tvstreamstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tvstream_store`
--

INSERT INTO `tvstream_store` (`id`, `tvstreamstore`, `created_at`) VALUES
(2, 'Amazon', '2025-05-30 02:41:18'),
(3, 'Elgato', '2025-05-30 02:41:22'),
(4, 'Xiaomi Mi', '2025-05-30 02:41:27');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `n_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`n_type`) VALUES
('Access Points | Indoor'),
('Controllers'),
('Ethernet Adapter'),
('Load Balance Broadband Router'),
('Media Converters | PoE'),
('Outdoor Radio | Antenna | 4G'),
('Patch Cords'),
('Range Extender'),
('Routers | Wireless'),
('Switches'),
('Wireless Adapter');

-- --------------------------------------------------------

--
-- Table structure for table `ups`
--

CREATE TABLE `ups` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ups`
--

INSERT INTO `ups` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(1, '', 'APC SRV10KI Easy UPS SRV 10000VA 230V', '4', 2147483647, 'High quality, Double-conversion On-line UPS designed for essential power protection needs even in the most unstable power conditions\r\n\r\n', 'spd-jvan-auqmd4-fl-v-1500x1500-1540-8858-121119094237.jpg', 'APC UPS', 'APC', 'Automatic internal bypass', 'Automatic restart of loads after UPS shutdown', 'ECO Mode', 'Emergency Power Off (EPO)', '785000', '0'),
(2, '', 'Stabimatic On-Line ONL-6000B UPS With Batteries - ONL-6KVA', '3', 2147483647, 'The ONL Series UPS is an advanced true online uninterruptible power system that is Intelligent Microprocessor Controlled. Generator Compatibility is one important advantage for certain Power Supply Condition and RS232 communication advanced design ma', 'copy-1-czone.com.pk-1540-11528-170521061601.jpg', 'Stabimatic UPS', 'Stabimatic', 'Intelligent Microprocessor Controlled True On-Line', 'Providing no break protection for critical applications.', 'Double Conversion and Pure Sine Wave Form Output.', 'The Cleanest, Most Compatible AC Output for Computer Systems.', '208000', '');

-- --------------------------------------------------------

--
-- Table structure for table `ups_brand`
--

CREATE TABLE `ups_brand` (
  `id` int(11) NOT NULL,
  `upsbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ups_brand`
--

INSERT INTO `ups_brand` (`id`, `upsbrand`, `created_at`) VALUES
(1, 'APC', '2025-05-30 03:24:44'),
(2, 'Stabimatic', '2025-05-30 03:24:47');

-- --------------------------------------------------------

--
-- Table structure for table `ups_store`
--

CREATE TABLE `ups_store` (
  `id` int(11) NOT NULL,
  `upsstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ups_store`
--

INSERT INTO `ups_store` (`id`, `upsstore`, `created_at`) VALUES
(1, 'APC UPS', '2025-05-30 03:24:35'),
(2, 'Stabimatic UPS', '2025-05-30 03:24:40');

-- --------------------------------------------------------

--
-- Table structure for table `usb`
--

CREATE TABLE `usb` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usb`
--

INSERT INTO `usb` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(3, '', 'Kingston 64GB DataTraveler Exodia Flash Drive DTX/64GB', '3', 2147483647, 'Store data and take it on the go with the64GB DataTraveler Exodia Flash DrivefromKingston. Designed for easy transport, this flash drive features a keyring loop and protective cap. Utilizing a USB 3.2 Gen 1 Type-A connection, it\'s compatible with Win', '1601400060-1595702-1540-10331-101020105545.jpg', 'Kingston', 'Kingston', '64GB Storage Capacity', 'USB 3.2 Gen 1 Type-A Connection', 'Keyring Loop', 'Protective Cap', '1350', ''),
(4, '', 'DataTraveler Exodia 256GB USB 3.2 Flash Drive DTX/256GB', '5', 2147483647, 'USB 3.2 Gen 1 performance for easy access to laptops, desktop PCs, monitors and other digital devices.\r\n\r\n', '1-czone.com.pk-1540-15272-250923094622.jpg', 'Kingston', 'Kingston', 'Quick transfers and convenient storage of documents, music, videos and more', 'Large loop easily attaches to key rings', 'Practical cap protects the USB plug', 'Available in capacities up to 256GB', '4600', ''),
(5, '', 'Sandisk Ultra Flair 64GB USB 3.0 Flash Drive SDCZ73-064G-G46', '4', 2147483647, 'The SanDisk Ultra Flair™ USB 3.0 flash drive moves your files fast. Spend less time waiting to transfer files and enjoy high-speed USB 3.0 performance.\r\n\r\n', 'copy-copy-copy-ultraflair-right-retina-1540-8581-230919073208.webp', 'SanDisk', 'SanDisk', 'Our USB 3.0 flash drive flies through file transfers', 'Stylish and tough', 'Password-protect your files', 'Speed Meets Style', '1700', ''),
(7, '', 'SanDisk Ultra Dual Drive Luxe USB Type-C™ Flash Drive - 1TB (Silver)', '5', 2147483647, 'USB Type-C Flash Drive Designed to Store More of Your Data\r\n\r\n', 'copy-13-czone.com.pk-1540-17315-161124090627.jpg', 'SanDisk', 'SanDisk', 'The all-metal, 2-in-1 flash drive for your USB Type-C™ and Type-A devices', 'USB Type-C Flash Drive Can Free Up Space for More Photos', 'Automatic backup is just a plug-in away', 'Quickly Move Files With This USB Type-C Flash Drive', '22900', ''),
(8, '', 'HP x796w USB 3.2 Flash Drive 32GB', '3', 2147483647, 'Offers a mobile storage solution to store and share your music, photos, files and more. Durable and elegant metal casing. It\'s ideal as external storage.\r\n\r\n', 'copy-12-czone.com.pk-1-1540-16464-200724103605.jpg', 'HP', 'HP', 'Simple and energetic.', 'Ideally push-pull design for storing larger files', 'Backward compatible with USB 2.0', 'Ideal as external storage', '1390', ''),
(9, '', 'HP 818w 64GB USB 3.2 Flash Drive Silver Metal', '4', 2147483647, 'Matte Silver Texturized body is scratchproof and dirt-repellent Integrated key ring loop for easy attachment to key chains, backpacks, totes, and more!\r\n\r\n', 'copy-17-czone.com.pk-1540-16453-200724095053.jpg', 'HP', 'HP', 'Durable metal casing with USB 3.2 speeds', 'Thoughtful cap  -less free design for easy carry', 'Connectivity: Wired - USB-A®', 'Silver', '1830', ''),
(10, '', 'ADATA UV150 Unidad Flash Drive 128GB USB 3.2 Black', '3', 2147483647, 'The UV150 combines a classic look with economical pricing, a SuperSpeed USB 3.2 Gen 1 interface, and an attractive pearlescent exterior.\r\n\r\n', '19-czone.com.pk-1540-16714-090824081926.jpg', 'ADATA', 'ADATA', 'Smarter Design', 'Glossy and Mobile', 'Backup ToGo Smart Backup Software', 'USB 3.2 Gen1 (USB 5Gbps) (backward compatible with USB 2.0)', '2300', '');

-- --------------------------------------------------------

--
-- Table structure for table `usb_brand`
--

CREATE TABLE `usb_brand` (
  `id` int(11) NOT NULL,
  `usbbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usb_brand`
--

INSERT INTO `usb_brand` (`id`, `usbbrand`, `created_at`) VALUES
(4, 'Kingston', '2025-05-30 03:56:00'),
(5, 'HP', '2025-05-30 03:56:05'),
(6, 'ADATA', '2025-05-30 03:56:10'),
(8, 'SanDisk', '2025-05-30 03:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `usb_store`
--

CREATE TABLE `usb_store` (
  `id` int(11) NOT NULL,
  `usbstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usb_store`
--

INSERT INTO `usb_store` (`id`, `usbstore`, `created_at`) VALUES
(2, 'Kingston', '2025-05-30 03:55:38'),
(3, 'SanDisk', '2025-05-30 03:55:42'),
(4, 'HP', '2025-05-30 03:55:44'),
(5, 'ADATA', '2025-05-30 03:55:46');

-- --------------------------------------------------------

--
-- Table structure for table `usedproduct`
--

CREATE TABLE `usedproduct` (
  `id` int(11) NOT NULL,
  `offer` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `review` varchar(250) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `brand` varchar(250) DEFAULT NULL,
  `processor` varchar(250) DEFAULT NULL,
  `spec1` varchar(250) DEFAULT NULL,
  `spec2` varchar(250) DEFAULT NULL,
  `spec3` varchar(250) DEFAULT NULL,
  `spec4` varchar(250) DEFAULT NULL,
  `price` varchar(250) DEFAULT NULL,
  `old_price` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usedproduct`
--

INSERT INTO `usedproduct` (`id`, `offer`, `name`, `review`, `code`, `description`, `image`, `brand`, `processor`, `spec1`, `spec2`, `spec3`, `spec4`, `price`, `old_price`) VALUES
(1, '', '8GB DDR4 SOD Memory For Notebook (Pulled Out) New', '4', 454210924, 'DDR4 Memory for Notebook.\r\n\r\n', '31-czone.com.pk-1540-10361-191024103715.jpg', 'Used Rams / Memory', 'Miscellaneous', '', '', '', '', '2500', ''),
(2, '', '256GB M.2 PCIe NVMe SSD | Mix Brands (New - Pulled Out)', '3', 444210924, 'Fast read and write. Low power, no noise.\r\n\r\n', '25-czone.com.pk-1540-12833-250122090552.jpg', 'Used SSD (Solid State Drive)', 'Miscellaneous', '', '', '', '', '3500', ''),
(3, '', '512GB M.2 PCIe NVMe SSD - Mix Brands (Pulled Out)', '5', 446210924, 'Fast read and write. Low power, no noise.\r\n\r\n', '28-czone.com.pk-1540-12862-010222082332.jpg', 'Used SSD (Solid State Drive)', 'Miscellaneous', '', '', '', '', '7500', '');

-- --------------------------------------------------------

--
-- Table structure for table `usedproduct_brand`
--

CREATE TABLE `usedproduct_brand` (
  `id` int(11) NOT NULL,
  `usedproductbrand` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usedproduct_brand`
--

INSERT INTO `usedproduct_brand` (`id`, `usedproductbrand`, `created_at`) VALUES
(1, 'Miscellaneous', '2025-05-31 10:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `usedproduct_store`
--

CREATE TABLE `usedproduct_store` (
  `id` int(11) NOT NULL,
  `usedproductstore` varchar(250) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usedproduct_store`
--

INSERT INTO `usedproduct_store` (`id`, `usedproductstore`, `created_at`) VALUES
(1, 'Used Rams / Memory', '2025-05-31 10:04:48'),
(2, 'Used SSD (Solid State Drive)', '2025-05-31 10:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `wattage`
--

CREATE TABLE `wattage` (
  `watt` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wattage`
--

INSERT INTO `wattage` (`watt`, `created_at`) VALUES
('1000 Watts', '2025-04-04 18:39:12'),
('1200 Watts', '2025-04-04 18:39:12'),
('1250 Watts', '2025-04-04 18:39:12'),
('1300 Watts', '2025-04-04 18:39:12'),
('1500 Watts', '2025-04-04 18:39:12'),
('1600 Watts', '2025-04-04 18:39:12'),
('450 Watts', '2025-04-04 18:39:12'),
('550 Watts', '2025-04-04 18:39:12'),
('650 Watts ', '2025-04-04 18:39:12'),
('750 Watts', '2025-04-04 18:39:12'),
('850 Watts', '2025-04-04 18:39:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand_store`
--
ALTER TABLE `brand_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brand` (`brand`);

--
-- Indexes for table `cambrand_store`
--
ALTER TABLE `cambrand_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cambrand` (`cambrand`);

--
-- Indexes for table `camdrone_store`
--
ALTER TABLE `camdrone_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `camdrone` (`camdrone`);

--
-- Indexes for table `cameradrone`
--
ALTER TABLE `cameradrone`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `capacity`
--
ALTER TABLE `capacity`
  ADD PRIMARY KEY (`c_storage`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `carttrones`
--
ALTER TABLE `carttrones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `carttrones_brand`
--
ALTER TABLE `carttrones_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carttronesbrand` (`carttronesbrand`);

--
-- Indexes for table `carttrones_store`
--
ALTER TABLE `carttrones_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cattronesstore` (`cattronesstore`);

--
-- Indexes for table `casing`
--
ALTER TABLE `casing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `casing_brand`
--
ALTER TABLE `casing_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `casingbrand` (`casingbrand`);

--
-- Indexes for table `casing_store`
--
ALTER TABLE `casing_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `casingstore` (`casingstore`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `categories_brand`
--
ALTER TABLE `categories_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catbrand` (`catbrand`);

--
-- Indexes for table `categories_store`
--
ALTER TABLE `categories_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cattrones` (`cattrones`);

--
-- Indexes for table `chipset`
--
ALTER TABLE `chipset`
  ADD PRIMARY KEY (`chip_set`),
  ADD UNIQUE KEY `chip_id` (`chip_id`);

--
-- Indexes for table `cooling`
--
ALTER TABLE `cooling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `cooling_brand`
--
ALTER TABLE `cooling_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coolingbrand` (`coolingbrand`);

--
-- Indexes for table `cooling_store`
--
ALTER TABLE `cooling_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coolingstore` (`coolingstore`);

--
-- Indexes for table `deskcomp`
--
ALTER TABLE `deskcomp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `deskcomp_brand`
--
ALTER TABLE `deskcomp_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deskcompbrand` (`deskcompbrand`);

--
-- Indexes for table `deskcomp_store`
--
ALTER TABLE `deskcomp_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `deskcompstore` (`deskcompstore`);

--
-- Indexes for table `gamingconsoles`
--
ALTER TABLE `gamingconsoles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `gamingconsoles_brand`
--
ALTER TABLE `gamingconsoles_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gamingconsolesbrand` (`gamingconsolesbrand`);

--
-- Indexes for table `gamingconsoles_store`
--
ALTER TABLE `gamingconsoles_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gamingconsolesstore` (`gamingconsolesstore`);

--
-- Indexes for table `gamingproducts`
--
ALTER TABLE `gamingproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `gamingproducts_brand`
--
ALTER TABLE `gamingproducts_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gamingproductsbrand` (`gamingproductsbrand`);

--
-- Indexes for table `gamingproducts_store`
--
ALTER TABLE `gamingproducts_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gamingproductsstore` (`gamingproductsstore`);

--
-- Indexes for table `gpu`
--
ALTER TABLE `gpu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gpu_name` (`gpu_name`),
  ADD KEY `chip_set` (`chip_set`);

--
-- Indexes for table `graphictablets`
--
ALTER TABLE `graphictablets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `graphictablets_brand`
--
ALTER TABLE `graphictablets_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `graphictabletsbrand` (`graphictabletsbrand`);

--
-- Indexes for table `graphictablets_store`
--
ALTER TABLE `graphictablets_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `graphictabletsstore` (`graphictabletsstore`);

--
-- Indexes for table `graphic_card`
--
ALTER TABLE `graphic_card`
  ADD PRIMARY KEY (`gpu_name`),
  ADD UNIQUE KEY `gpu_id` (`gpu_id`);

--
-- Indexes for table `hdd`
--
ALTER TABLE `hdd`
  ADD PRIMARY KEY (`hard_disk`);

--
-- Indexes for table `hdd_data`
--
ALTER TABLE `hdd_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hd` (`hd`),
  ADD KEY `store` (`store`);

--
-- Indexes for table `headsetheadphonemic`
--
ALTER TABLE `headsetheadphonemic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `headsetheadphonemic_brand`
--
ALTER TABLE `headsetheadphonemic_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `headsetheadphonemicbrand` (`headsetheadphonemicbrand`);

--
-- Indexes for table `headsetheadphonemic_store`
--
ALTER TABLE `headsetheadphonemic_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `headsetheadphonemicstore` (`headsetheadphonemicstore`);

--
-- Indexes for table `home`
--
ALTER TABLE `home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inches`
--
ALTER TABLE `inches`
  ADD PRIMARY KEY (`size`);

--
-- Indexes for table `keyboard`
--
ALTER TABLE `keyboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `keyboard_brand`
--
ALTER TABLE `keyboard_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyboardbrand` (`keyboardbrand`);

--
-- Indexes for table `keyboard_store`
--
ALTER TABLE `keyboard_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `keyboardstore` (`keyboardstore`);

--
-- Indexes for table `laptopacc`
--
ALTER TABLE `laptopacc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `laptopacc_store`
--
ALTER TABLE `laptopacc_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laptopacc` (`laptopacc`);

--
-- Indexes for table `laptopused`
--
ALTER TABLE `laptopused`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `laptopused_store`
--
ALTER TABLE `laptopused_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `laptopused` (`laptopused`);

--
-- Indexes for table `lcdmonitor`
--
ALTER TABLE `lcdmonitor`
  ADD PRIMARY KEY (`monitor`);

--
-- Indexes for table `memory`
--
ALTER TABLE `memory`
  ADD PRIMARY KEY (`module`);

--
-- Indexes for table `memorycards`
--
ALTER TABLE `memorycards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `memorycards_brand`
--
ALTER TABLE `memorycards_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `memorycardsbrand` (`memorycardsbrand`);

--
-- Indexes for table `memorycards_store`
--
ALTER TABLE `memorycards_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `memorycardsstore` (`memorycardsstore`);

--
-- Indexes for table `monitor`
--
ALTER TABLE `monitor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lcdmonitor` (`lcdmonitor`),
  ADD KEY `inches` (`inches`);

--
-- Indexes for table `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `motherboard_brand`
--
ALTER TABLE `motherboard_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `motherboardbrand` (`motherboardbrand`);

--
-- Indexes for table `motherboard_store`
--
ALTER TABLE `motherboard_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `motherboardstore` (`motherboardstore`);

--
-- Indexes for table `mouse`
--
ALTER TABLE `mouse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `mouse_brand`
--
ALTER TABLE `mouse_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mousebrand` (`mousebrand`);

--
-- Indexes for table `mouse_store`
--
ALTER TABLE `mouse_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mousestore` (`mousestore`);

--
-- Indexes for table `network`
--
ALTER TABLE `network`
  ADD PRIMARY KEY (`id`),
  ADD KEY `np` (`np`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `new_home`
--
ALTER TABLE `new_home`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `np`
--
ALTER TABLE `np`
  ADD PRIMARY KEY (`network`);

--
-- Indexes for table `peripheralsmics`
--
ALTER TABLE `peripheralsmics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `peripheralsmics_brand`
--
ALTER TABLE `peripheralsmics_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `peripheralsmicsbrand` (`peripheralsmicsbrand`);

--
-- Indexes for table `peripheralsmics_store`
--
ALTER TABLE `peripheralsmics_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `peripheralsmicsstore` (`peripheralsmicsstore`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `pos_brand`
--
ALTER TABLE `pos_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posbrand` (`posbrand`);

--
-- Indexes for table `pos_store`
--
ALTER TABLE `pos_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posstore` (`posstore`);

--
-- Indexes for table `power`
--
ALTER TABLE `power`
  ADD PRIMARY KEY (`supply`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`model`);

--
-- Indexes for table `printer_data`
--
ALTER TABLE `printer_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers` (`printers`),
  ADD KEY `series` (`series`);

--
-- Indexes for table `processors`
--
ALTER TABLE `processors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `processors_brand`
--
ALTER TABLE `processors_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `processorsbrand` (`processorsbrand`);

--
-- Indexes for table `processors_store`
--
ALTER TABLE `processors_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `processorsstore` (`processorsstore`);

--
-- Indexes for table `processor_store`
--
ALTER TABLE `processor_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `processor` (`processor`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projectors`
--
ALTER TABLE `projectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `projectors_brand`
--
ALTER TABLE `projectors_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projectorsbrand` (`projectorsbrand`);

--
-- Indexes for table `projectors_store`
--
ALTER TABLE `projectors_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `projectorsstore` (`projectorsstore`);

--
-- Indexes for table `psu`
--
ALTER TABLE `psu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `power` (`power`),
  ADD KEY `wattage` (`wattage`);

--
-- Indexes for table `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memory` (`memory`),
  ADD KEY `store` (`store`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_capacity`
--
ALTER TABLE `r_capacity`
  ADD PRIMARY KEY (`capacity`);

--
-- Indexes for table `scanners`
--
ALTER TABLE `scanners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `scanners_brand`
--
ALTER TABLE `scanners_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `scannersbrand` (`scannersbrand`);

--
-- Indexes for table `scanners_store`
--
ALTER TABLE `scanners_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `scannersstore` (`scannersstore`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`m_series`);

--
-- Indexes for table `software`
--
ALTER TABLE `software`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `software_brand`
--
ALTER TABLE `software_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `softwarebrand` (`softwarebrand`);

--
-- Indexes for table `software_store`
--
ALTER TABLE `software_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `softwarestore` (`softwarestore`);

--
-- Indexes for table `speaker`
--
ALTER TABLE `speaker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `speaker_brand`
--
ALTER TABLE `speaker_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `speakerbrand` (`speakerbrand`);

--
-- Indexes for table `speaker_store`
--
ALTER TABLE `speaker_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `speakerstore` (`speakerstore`);

--
-- Indexes for table `ssd`
--
ALTER TABLE `ssd`
  ADD PRIMARY KEY (`solid_disk`);

--
-- Indexes for table `ssd_data`
--
ALTER TABLE `ssd_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sd` (`sd`),
  ADD KEY `store` (`store`);

--
-- Indexes for table `stabilizer`
--
ALTER TABLE `stabilizer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `stabilizer_brand`
--
ALTER TABLE `stabilizer_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stabilizerbrand` (`stabilizerbrand`);

--
-- Indexes for table `stabilizer_store`
--
ALTER TABLE `stabilizer_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stabilizerstore` (`stabilizerstore`);

--
-- Indexes for table `s_capacity`
--
ALTER TABLE `s_capacity`
  ADD PRIMARY KEY (`c_storage`);

--
-- Indexes for table `tabletacc`
--
ALTER TABLE `tabletacc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `tabletacc_brand`
--
ALTER TABLE `tabletacc_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tabletaccbrand` (`tabletaccbrand`);

--
-- Indexes for table `tabletacc_store`
--
ALTER TABLE `tabletacc_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tabletaccstore` (`tabletaccstore`);

--
-- Indexes for table `tabletpc`
--
ALTER TABLE `tabletpc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `tabletpc_brand`
--
ALTER TABLE `tabletpc_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tabletpcbrand` (`tabletpcbrand`);

--
-- Indexes for table `tabletpc_store`
--
ALTER TABLE `tabletpc_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tabletpcstore` (`tabletpcstore`);

--
-- Indexes for table `tvstream`
--
ALTER TABLE `tvstream`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `tvstream_brand`
--
ALTER TABLE `tvstream_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tvstreambrand` (`tvstreambrand`);

--
-- Indexes for table `tvstream_store`
--
ALTER TABLE `tvstream_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tvstreamstore` (`tvstreamstore`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`n_type`);

--
-- Indexes for table `ups`
--
ALTER TABLE `ups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `ups_brand`
--
ALTER TABLE `ups_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upsbrand` (`upsbrand`);

--
-- Indexes for table `ups_store`
--
ALTER TABLE `ups_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `upsstore` (`upsstore`);

--
-- Indexes for table `usb`
--
ALTER TABLE `usb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `usb_brand`
--
ALTER TABLE `usb_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usbbrand` (`usbbrand`);

--
-- Indexes for table `usb_store`
--
ALTER TABLE `usb_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usbstore` (`usbstore`);

--
-- Indexes for table `usedproduct`
--
ALTER TABLE `usedproduct`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand` (`brand`),
  ADD KEY `processor` (`processor`);

--
-- Indexes for table `usedproduct_brand`
--
ALTER TABLE `usedproduct_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usedproductbrand` (`usedproductbrand`);

--
-- Indexes for table `usedproduct_store`
--
ALTER TABLE `usedproduct_store`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usedproductstore` (`usedproductstore`);

--
-- Indexes for table `wattage`
--
ALTER TABLE `wattage`
  ADD PRIMARY KEY (`watt`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `brand_store`
--
ALTER TABLE `brand_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cambrand_store`
--
ALTER TABLE `cambrand_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `camdrone_store`
--
ALTER TABLE `camdrone_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cameradrone`
--
ALTER TABLE `cameradrone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carttrones`
--
ALTER TABLE `carttrones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `carttrones_brand`
--
ALTER TABLE `carttrones_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carttrones_store`
--
ALTER TABLE `carttrones_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `casing`
--
ALTER TABLE `casing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `casing_brand`
--
ALTER TABLE `casing_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `casing_store`
--
ALTER TABLE `casing_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories_brand`
--
ALTER TABLE `categories_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories_store`
--
ALTER TABLE `categories_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chipset`
--
ALTER TABLE `chipset`
  MODIFY `chip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `cooling`
--
ALTER TABLE `cooling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `cooling_brand`
--
ALTER TABLE `cooling_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cooling_store`
--
ALTER TABLE `cooling_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `deskcomp`
--
ALTER TABLE `deskcomp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `deskcomp_brand`
--
ALTER TABLE `deskcomp_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `deskcomp_store`
--
ALTER TABLE `deskcomp_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `gamingconsoles`
--
ALTER TABLE `gamingconsoles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `gamingconsoles_brand`
--
ALTER TABLE `gamingconsoles_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gamingconsoles_store`
--
ALTER TABLE `gamingconsoles_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gamingproducts`
--
ALTER TABLE `gamingproducts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `gamingproducts_brand`
--
ALTER TABLE `gamingproducts_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gamingproducts_store`
--
ALTER TABLE `gamingproducts_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gpu`
--
ALTER TABLE `gpu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `graphictablets`
--
ALTER TABLE `graphictablets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `graphictablets_brand`
--
ALTER TABLE `graphictablets_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `graphictablets_store`
--
ALTER TABLE `graphictablets_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `graphic_card`
--
ALTER TABLE `graphic_card`
  MODIFY `gpu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hdd_data`
--
ALTER TABLE `hdd_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `headsetheadphonemic`
--
ALTER TABLE `headsetheadphonemic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `headsetheadphonemic_brand`
--
ALTER TABLE `headsetheadphonemic_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `headsetheadphonemic_store`
--
ALTER TABLE `headsetheadphonemic_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `home`
--
ALTER TABLE `home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `keyboard`
--
ALTER TABLE `keyboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `keyboard_brand`
--
ALTER TABLE `keyboard_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `keyboard_store`
--
ALTER TABLE `keyboard_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `laptopacc`
--
ALTER TABLE `laptopacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `laptopacc_store`
--
ALTER TABLE `laptopacc_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `laptopused`
--
ALTER TABLE `laptopused`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `laptopused_store`
--
ALTER TABLE `laptopused_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `memorycards`
--
ALTER TABLE `memorycards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `memorycards_brand`
--
ALTER TABLE `memorycards_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `memorycards_store`
--
ALTER TABLE `memorycards_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `monitor`
--
ALTER TABLE `monitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `motherboard_brand`
--
ALTER TABLE `motherboard_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `motherboard_store`
--
ALTER TABLE `motherboard_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mouse`
--
ALTER TABLE `mouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mouse_brand`
--
ALTER TABLE `mouse_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mouse_store`
--
ALTER TABLE `mouse_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `network`
--
ALTER TABLE `network`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `new_home`
--
ALTER TABLE `new_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `peripheralsmics`
--
ALTER TABLE `peripheralsmics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `peripheralsmics_brand`
--
ALTER TABLE `peripheralsmics_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `peripheralsmics_store`
--
ALTER TABLE `peripheralsmics_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pos_brand`
--
ALTER TABLE `pos_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pos_store`
--
ALTER TABLE `pos_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `printer_data`
--
ALTER TABLE `printer_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `processors`
--
ALTER TABLE `processors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `processors_brand`
--
ALTER TABLE `processors_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `processors_store`
--
ALTER TABLE `processors_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `processor_store`
--
ALTER TABLE `processor_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `projectors`
--
ALTER TABLE `projectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projectors_brand`
--
ALTER TABLE `projectors_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `projectors_store`
--
ALTER TABLE `projectors_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `psu`
--
ALTER TABLE `psu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `ram`
--
ALTER TABLE `ram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `scanners`
--
ALTER TABLE `scanners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `scanners_brand`
--
ALTER TABLE `scanners_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scanners_store`
--
ALTER TABLE `scanners_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `software`
--
ALTER TABLE `software`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `software_brand`
--
ALTER TABLE `software_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `software_store`
--
ALTER TABLE `software_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `speaker`
--
ALTER TABLE `speaker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `speaker_brand`
--
ALTER TABLE `speaker_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `speaker_store`
--
ALTER TABLE `speaker_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ssd_data`
--
ALTER TABLE `ssd_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `stabilizer`
--
ALTER TABLE `stabilizer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stabilizer_brand`
--
ALTER TABLE `stabilizer_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stabilizer_store`
--
ALTER TABLE `stabilizer_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tabletacc`
--
ALTER TABLE `tabletacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tabletacc_brand`
--
ALTER TABLE `tabletacc_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tabletacc_store`
--
ALTER TABLE `tabletacc_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tabletpc`
--
ALTER TABLE `tabletpc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tabletpc_brand`
--
ALTER TABLE `tabletpc_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tabletpc_store`
--
ALTER TABLE `tabletpc_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tvstream`
--
ALTER TABLE `tvstream`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tvstream_brand`
--
ALTER TABLE `tvstream_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tvstream_store`
--
ALTER TABLE `tvstream_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ups`
--
ALTER TABLE `ups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ups_brand`
--
ALTER TABLE `ups_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ups_store`
--
ALTER TABLE `ups_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usb`
--
ALTER TABLE `usb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `usb_brand`
--
ALTER TABLE `usb_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usb_store`
--
ALTER TABLE `usb_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usedproduct`
--
ALTER TABLE `usedproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usedproduct_brand`
--
ALTER TABLE `usedproduct_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usedproduct_store`
--
ALTER TABLE `usedproduct_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cameradrone`
--
ALTER TABLE `cameradrone`
  ADD CONSTRAINT `cameradrone_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `camdrone_store` (`camdrone`),
  ADD CONSTRAINT `cameradrone_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `cambrand_store` (`cambrand`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`id`);

--
-- Constraints for table `carttrones`
--
ALTER TABLE `carttrones`
  ADD CONSTRAINT `carttrones_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `carttrones_store` (`cattronesstore`),
  ADD CONSTRAINT `carttrones_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `carttrones_brand` (`carttronesbrand`);

--
-- Constraints for table `casing`
--
ALTER TABLE `casing`
  ADD CONSTRAINT `casing_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `casing_store` (`casingstore`),
  ADD CONSTRAINT `casing_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `casing_brand` (`casingbrand`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `categories_store` (`cattrones`),
  ADD CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `categories_brand` (`catbrand`);

--
-- Constraints for table `cooling`
--
ALTER TABLE `cooling`
  ADD CONSTRAINT `cooling_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `cooling_store` (`coolingstore`),
  ADD CONSTRAINT `cooling_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `cooling_brand` (`coolingbrand`);

--
-- Constraints for table `deskcomp`
--
ALTER TABLE `deskcomp`
  ADD CONSTRAINT `deskcomp_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `deskcomp_store` (`deskcompstore`),
  ADD CONSTRAINT `deskcomp_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `deskcomp_brand` (`deskcompbrand`);

--
-- Constraints for table `gamingconsoles`
--
ALTER TABLE `gamingconsoles`
  ADD CONSTRAINT `gamingconsoles_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `gamingconsoles_store` (`gamingconsolesstore`),
  ADD CONSTRAINT `gamingconsoles_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `gamingconsoles_brand` (`gamingconsolesbrand`);

--
-- Constraints for table `gamingproducts`
--
ALTER TABLE `gamingproducts`
  ADD CONSTRAINT `gamingproducts_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `gamingproducts_store` (`gamingproductsstore`),
  ADD CONSTRAINT `gamingproducts_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `gamingproducts_brand` (`gamingproductsbrand`);

--
-- Constraints for table `gpu`
--
ALTER TABLE `gpu`
  ADD CONSTRAINT `gpu_ibfk_1` FOREIGN KEY (`gpu_name`) REFERENCES `graphic_card` (`gpu_name`),
  ADD CONSTRAINT `gpu_ibfk_2` FOREIGN KEY (`chip_set`) REFERENCES `chipset` (`chip_set`);

--
-- Constraints for table `graphictablets`
--
ALTER TABLE `graphictablets`
  ADD CONSTRAINT `graphictablets_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `graphictablets_store` (`graphictabletsstore`),
  ADD CONSTRAINT `graphictablets_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `graphictablets_brand` (`graphictabletsbrand`);

--
-- Constraints for table `hdd_data`
--
ALTER TABLE `hdd_data`
  ADD CONSTRAINT `hdd_data_ibfk_1` FOREIGN KEY (`hd`) REFERENCES `hdd` (`hard_disk`),
  ADD CONSTRAINT `hdd_data_ibfk_2` FOREIGN KEY (`store`) REFERENCES `capacity` (`c_storage`);

--
-- Constraints for table `headsetheadphonemic`
--
ALTER TABLE `headsetheadphonemic`
  ADD CONSTRAINT `headsetheadphonemic_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `headsetheadphonemic_store` (`headsetheadphonemicstore`),
  ADD CONSTRAINT `headsetheadphonemic_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `headsetheadphonemic_brand` (`headsetheadphonemicbrand`);

--
-- Constraints for table `keyboard`
--
ALTER TABLE `keyboard`
  ADD CONSTRAINT `keyboard_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `keyboard_store` (`keyboardstore`),
  ADD CONSTRAINT `keyboard_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `keyboard_brand` (`keyboardbrand`);

--
-- Constraints for table `laptopacc`
--
ALTER TABLE `laptopacc`
  ADD CONSTRAINT `laptopacc_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `laptopacc_store` (`laptopacc`),
  ADD CONSTRAINT `laptopacc_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `brand_store` (`brand`);

--
-- Constraints for table `laptopused`
--
ALTER TABLE `laptopused`
  ADD CONSTRAINT `laptopused_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `laptopused_store` (`laptopused`),
  ADD CONSTRAINT `laptopused_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `processor_store` (`processor`);

--
-- Constraints for table `memorycards`
--
ALTER TABLE `memorycards`
  ADD CONSTRAINT `memorycards_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `memorycards_store` (`memorycardsstore`),
  ADD CONSTRAINT `memorycards_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `memorycards_brand` (`memorycardsbrand`);

--
-- Constraints for table `monitor`
--
ALTER TABLE `monitor`
  ADD CONSTRAINT `monitor_ibfk_1` FOREIGN KEY (`lcdmonitor`) REFERENCES `lcdmonitor` (`monitor`),
  ADD CONSTRAINT `monitor_ibfk_2` FOREIGN KEY (`inches`) REFERENCES `inches` (`size`);

--
-- Constraints for table `motherboard`
--
ALTER TABLE `motherboard`
  ADD CONSTRAINT `motherboard_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `motherboard_store` (`motherboardstore`),
  ADD CONSTRAINT `motherboard_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `motherboard_brand` (`motherboardbrand`);

--
-- Constraints for table `mouse`
--
ALTER TABLE `mouse`
  ADD CONSTRAINT `mouse_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `mouse_store` (`mousestore`),
  ADD CONSTRAINT `mouse_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `mouse_brand` (`mousebrand`);

--
-- Constraints for table `network`
--
ALTER TABLE `network`
  ADD CONSTRAINT `network_ibfk_1` FOREIGN KEY (`np`) REFERENCES `np` (`network`),
  ADD CONSTRAINT `network_ibfk_2` FOREIGN KEY (`type`) REFERENCES `type` (`n_type`);

--
-- Constraints for table `peripheralsmics`
--
ALTER TABLE `peripheralsmics`
  ADD CONSTRAINT `peripheralsmics_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `peripheralsmics_store` (`peripheralsmicsstore`),
  ADD CONSTRAINT `peripheralsmics_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `peripheralsmics_brand` (`peripheralsmicsbrand`);

--
-- Constraints for table `pos`
--
ALTER TABLE `pos`
  ADD CONSTRAINT `pos_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `pos_store` (`posstore`),
  ADD CONSTRAINT `pos_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `pos_brand` (`posbrand`);

--
-- Constraints for table `printer_data`
--
ALTER TABLE `printer_data`
  ADD CONSTRAINT `printer_data_ibfk_1` FOREIGN KEY (`printers`) REFERENCES `printers` (`model`),
  ADD CONSTRAINT `printer_data_ibfk_2` FOREIGN KEY (`series`) REFERENCES `series` (`m_series`);

--
-- Constraints for table `processors`
--
ALTER TABLE `processors`
  ADD CONSTRAINT `processors_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `processors_store` (`processorsstore`),
  ADD CONSTRAINT `processors_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `processors_brand` (`processorsbrand`);

--
-- Constraints for table `projectors`
--
ALTER TABLE `projectors`
  ADD CONSTRAINT `projectors_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `projectors_store` (`projectorsstore`),
  ADD CONSTRAINT `projectors_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `projectors_brand` (`projectorsbrand`);

--
-- Constraints for table `psu`
--
ALTER TABLE `psu`
  ADD CONSTRAINT `psu_ibfk_1` FOREIGN KEY (`power`) REFERENCES `power` (`supply`),
  ADD CONSTRAINT `psu_ibfk_2` FOREIGN KEY (`wattage`) REFERENCES `wattage` (`watt`);

--
-- Constraints for table `ram`
--
ALTER TABLE `ram`
  ADD CONSTRAINT `ram_ibfk_1` FOREIGN KEY (`memory`) REFERENCES `memory` (`module`),
  ADD CONSTRAINT `ram_ibfk_2` FOREIGN KEY (`store`) REFERENCES `r_capacity` (`capacity`);

--
-- Constraints for table `scanners`
--
ALTER TABLE `scanners`
  ADD CONSTRAINT `scanners_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `scanners_store` (`scannersstore`),
  ADD CONSTRAINT `scanners_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `scanners_brand` (`scannersbrand`);

--
-- Constraints for table `software`
--
ALTER TABLE `software`
  ADD CONSTRAINT `software_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `software_store` (`softwarestore`),
  ADD CONSTRAINT `software_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `software_brand` (`softwarebrand`);

--
-- Constraints for table `speaker`
--
ALTER TABLE `speaker`
  ADD CONSTRAINT `speaker_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `speaker_store` (`speakerstore`),
  ADD CONSTRAINT `speaker_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `speaker_brand` (`speakerbrand`);

--
-- Constraints for table `ssd_data`
--
ALTER TABLE `ssd_data`
  ADD CONSTRAINT `ssd_data_ibfk_1` FOREIGN KEY (`sd`) REFERENCES `ssd` (`solid_disk`),
  ADD CONSTRAINT `ssd_data_ibfk_2` FOREIGN KEY (`store`) REFERENCES `s_capacity` (`c_storage`);

--
-- Constraints for table `stabilizer`
--
ALTER TABLE `stabilizer`
  ADD CONSTRAINT `stabilizer_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `stabilizer_store` (`stabilizerstore`),
  ADD CONSTRAINT `stabilizer_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `stabilizer_brand` (`stabilizerbrand`);

--
-- Constraints for table `tabletacc`
--
ALTER TABLE `tabletacc`
  ADD CONSTRAINT `tabletacc_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `tabletacc_store` (`tabletaccstore`),
  ADD CONSTRAINT `tabletacc_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `tabletacc_brand` (`tabletaccbrand`);

--
-- Constraints for table `tabletpc`
--
ALTER TABLE `tabletpc`
  ADD CONSTRAINT `tabletpc_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `tabletpc_store` (`tabletpcstore`),
  ADD CONSTRAINT `tabletpc_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `tabletpc_brand` (`tabletpcbrand`);

--
-- Constraints for table `tvstream`
--
ALTER TABLE `tvstream`
  ADD CONSTRAINT `tvstream_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `tvstream_store` (`tvstreamstore`),
  ADD CONSTRAINT `tvstream_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `tvstream_brand` (`tvstreambrand`);

--
-- Constraints for table `ups`
--
ALTER TABLE `ups`
  ADD CONSTRAINT `ups_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `ups_store` (`upsstore`),
  ADD CONSTRAINT `ups_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `ups_brand` (`upsbrand`);

--
-- Constraints for table `usb`
--
ALTER TABLE `usb`
  ADD CONSTRAINT `usb_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `usb_store` (`usbstore`),
  ADD CONSTRAINT `usb_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `usb_brand` (`usbbrand`);

--
-- Constraints for table `usedproduct`
--
ALTER TABLE `usedproduct`
  ADD CONSTRAINT `usedproduct_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `usedproduct_store` (`usedproductstore`),
  ADD CONSTRAINT `usedproduct_ibfk_2` FOREIGN KEY (`processor`) REFERENCES `usedproduct_brand` (`usedproductbrand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
