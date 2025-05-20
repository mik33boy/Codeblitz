-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 10:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql12759808`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_no` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `order_name` varchar(255) NOT NULL,
  `order_name2` varchar(255) NOT NULL,
  `order_quantity` int(255) NOT NULL,
  `order_size` varchar(255) NOT NULL,
  `basePrice` int(255) NOT NULL,
  `order_price` int(255) NOT NULL,
  `order_addons` varchar(255) NOT NULL,
  `order_addons_price` int(255) NOT NULL,
  `order_image` varchar(255) NOT NULL,
  `order_addons2` varchar(255) NOT NULL,
  `order_addons_price2` int(255) NOT NULL,
  `order_addons3` varchar(255) NOT NULL,
  `order_addons_price3` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pos-menu`
--

CREATE TABLE `pos-menu` (
  `menu_no` int(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `title1` text NOT NULL,
  `title2` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `label2` varchar(255) NOT NULL,
  `price1` int(255) NOT NULL,
  `price2` int(255) NOT NULL,
  `price3` int(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `qty` int(255) NOT NULL,
  `stock_date` varchar(255) NOT NULL,
  `stock_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos-menu`
--

INSERT INTO `pos-menu` (`menu_no`, `code`, `title1`, `title2`, `label`, `label2`, `price1`, `price2`, `price3`, `image`, `qty`, `stock_date`, `stock_time`) VALUES
(1, 'A001', 'Chicken Finger Tamarind', '', 'Appetizer', 'Food', 305, 0, 0, 'default.png', 71, '2025-04-11', '09:59:03'),
(2, 'A002', 'Pork Chips with Pinakurat Sauce', '', 'Appetizer', 'Food', 200, 0, 0, 'default.png', 66, '2025-04-11', '09:59:03'),
(3, 'A003', 'Kangkong Chips w/ Pinakurat', '', 'Appetizer', 'Food', 180, 0, 0, 'default.png', 49, '2025-04-11', '09:59:03'),
(4, 'A004', 'Nachos', '', 'Appetizer', 'Food', 300, 0, 0, 'default.png', 69, '2025-04-11', '09:59:03'),
(5, 'A005', 'Salt and Pepper Fish Fillet', '', 'Appetizer', 'Food', 300, 0, 0, 'default.png', 63, '2025-04-11', '09:59:03'),
(6, 'A006', 'Korean Chicken Wings', '', 'Appetizer', 'Food', 345, 0, 0, 'default.png', 58, '2025-04-11', '09:59:03'),
(7, 'A007', 'Onion Rings', '', 'Appetizer', 'Food', 130, 0, 0, 'default.png', 82, '2025-04-11', '09:59:03'),
(8, 'A008', 'French Fries', '', 'Appetizer', 'Food', 150, 0, 0, 'default.png', 84, '2025-04-11', '09:59:03'),
(9, 'A009', 'Chichabu', '', 'Appetizer', 'Food', 320, 0, 0, 'default.png', 91, '2025-04-11', '09:59:03'),
(10, 'A010', 'Baked Potato Stuffed w/ Spicy Mayo', '', 'Appetizer', 'Food', 275, 0, 0, 'default.png', 98, '2025-04-11', '09:59:03'),
(11, 'A011', 'Calamares', '', 'Appetizer', 'Food', 220, 0, 0, 'default.png', 84, '2025-04-11', '09:59:03'),
(12, 'S001', 'Rustiko Salad in Sesame Dressing', '', 'Salad', 'Food', 250, 0, 0, 'default.png', 94, '2025-04-11', '09:59:03'),
(13, 'S002', 'Toast Green Salad', '', 'Salad', 'Food', 230, 0, 0, 'default.png', 92, '2025-04-11', '09:59:03'),
(14, 'S003', 'Chicken Caesar Salad', '', 'Salad', 'Food', 220, 0, 0, 'default.png', 65, '2025-04-11', '09:59:03'),
(15, 'S004', 'Kani Salad', '', 'Salad', 'Food', 230, 0, 0, 'default.png', 90, '2025-04-11', '09:59:03'),
(16, 'S005', 'Tuna Nicoise Salad', '', 'Salad', 'Food', 290, 0, 0, 'default.png', 100, '2025-04-11', '09:59:03'),
(17, 'R001', 'Chicken in Mushroom Sauce', '', 'Rice Meal', 'Food', 300, 0, 0, 'default.png', 87, '2025-04-11', '09:59:03'),
(18, 'R002', 'Baby Back Ribs', '', 'Rice Meal', 'Food', 300, 0, 0, 'default.png', 54, '2025-04-11', '09:59:03'),
(19, 'R003', 'Rice Pork Scaliboni', '', 'Rice Meal', 'Food', 250, 0, 0, 'default.png', 98, '2025-04-11', '09:59:03'),
(20, 'R004', 'Pork Katsudon', '', 'Rice Meal', 'Food', 260, 0, 0, 'default.png', 95, '2025-04-11', '09:59:03'),
(21, 'R005', 'Spicy Pork Belly', '', 'Rice Meal', 'Food', 350, 0, 0, 'default.png', 79, '2025-04-11', '09:59:03'),
(22, 'R006', 'Creamy Pesto Shrimp', '', 'Rice Meal', 'Food', 320, 0, 0, 'default.png', 98, '2025-04-11', '09:59:03'),
(23, 'R007', 'Honey Mustard Porkloin', '', 'Rice Meal', 'Food', 280, 0, 0, 'default.png', 99, '2025-04-11', '09:59:03'),
(24, 'R008', 'Indian Beef Curry', '', 'Rice Meal', 'Food', 300, 0, 0, 'default.png', 97, '2025-04-11', '09:59:03'),
(25, 'R009', 'Coconut Lime Fish Curry', '', 'Rice Meal', 'Food', 300, 0, 0, 'default.png', 99, '2025-04-11', '09:59:03'),
(26, 'S010', 'Ribeye', '', 'Steak And Salmon', 'Food', 750, 0, 0, 'default.png', 94, '2025-04-11', '09:59:03'),
(27, 'S011', 'Top Blade', '', 'Steak And Salmon', 'Food', 630, 0, 0, 'default.png', 100, '2025-04-11', '09:59:03'),
(28, 'S012', 'Striploin', '', 'Steak And Salmon', 'Food', 680, 0, 0, 'default.png', 97, '2025-04-11', '09:59:03'),
(29, 'S013', 'Salmon', '', 'Steak And Salmon', 'Food', 750, 0, 0, 'default.png', 99, '2025-04-11', '09:59:03'),
(30, 'P001', 'Marinara Seafood Pasta', '', 'Pasta', 'Food', 245, 0, 0, 'default.png', 84, '2025-04-11', '09:59:03'),
(31, 'P002', 'Shrimp Aglio Olio', '', 'Pasta', 'Food', 260, 0, 0, 'default.png', 63, '2025-04-11', '09:59:03'),
(32, 'P003', 'Chicken Pesto', '', 'Pasta', 'Food', 200, 0, 0, 'default.png', 76, '2025-04-11', '09:59:03'),
(33, 'P004', 'Beef Stroganoff w/ Fusilli', '', 'Pasta', 'Food', 270, 0, 0, 'default.png', 90, '2025-04-11', '09:59:03'),
(34, 'P005', 'Bolognese Pasta -rod', '', 'Pasta', 'Food', 270, 0, 0, 'default.png', 99, '2025-04-11', '09:59:03'),
(35, 'P006', 'Creamy Carbonara', '', 'Pasta', 'Food', 260, 0, 0, 'default.png', 77, '2025-04-11', '09:59:03'),
(36, 'S020', 'Club House', '', 'Sandwich', 'Food', 290, 0, 0, 'default.png', 90, '2025-04-11', '09:59:03'),
(37, 'S021', 'Pork Baguette', '', 'Sandwich', 'Food', 280, 0, 0, 'default.png', 100, '2025-04-11', '09:59:03'),
(38, 'S022', 'Slider Burger', '', 'Sandwich', 'Food', 150, 0, 0, 'default.png', 87, '2025-04-11', '09:59:03'),
(39, 'S023', 'Rustiko Burger (regular)', '', 'Sandwich', 'Food', 190, 0, 0, 'default.png', 95, '2025-04-11', '09:59:03'),
(40, 'S024', 'Executive Master Sgt. Burger', '', 'Sandwich', 'Food', 320, 0, 0, 'default.png', 90, '2025-04-11', '09:59:03'),
(41, 'P010', 'Margherita - rod', '', 'Pizza', 'Food', 250, 0, 0, 'default.png', 96, '2025-04-11', '09:59:03'),
(42, 'P011', 'All Meat', '', 'Pizza', 'Food', 320, 0, 0, 'default.png', 95, '2025-04-11', '09:59:03'),
(43, 'P012', 'Cheese', '', 'Pizza', 'Food', 220, 0, 0, 'default.png', 78, '2025-04-11', '09:59:03'),
(44, 'P013', 'Shrimp', '', 'Pizza', 'Food', 350, 0, 0, 'default.png', 94, '2025-04-11', '09:59:03'),
(45, 'S030', 'Cream of Mushroom', '', 'Soup', 'Food', 130, 0, 0, 'default.png', 95, '2025-04-11', '09:59:03'),
(46, 'B001', 'Breakfast ala Ruruko', '', 'Breakfast Menu', 'Food', 850, 0, 0, 'default.png', 99, '2025-04-11', '10:01:22'),
(47, 'B002', 'Porksilog', '', 'Breakfast Menu', 'Food', 270, 0, 0, 'default.png', 94, '2025-04-11', '10:01:22'),
(48, 'B003', 'Tapsilog', '', 'Breakfast Menu', 'Food', 280, 0, 0, 'default.png', 95, '2025-04-11', '10:01:22'),
(49, 'B004', 'Bangsilog', '', 'Breakfast Menu', 'Food', 250, 0, 0, 'default.png', 100, '2025-04-11', '10:01:22'),
(50, 'B005', 'Tocilog', '', 'Breakfast Menu', 'Food', 260, 0, 0, 'default.png', 100, '2025-04-11', '10:01:22'),
(51, 'B006', 'Longsilog', '', 'Breakfast Menu', 'Food', 250, 0, 0, 'default.png', 100, '2025-04-11', '10:01:22'),
(52, 'B007', 'Hotsilog -cocktails', '', 'Breakfast Menu', 'Food', 220, 0, 0, 'default.png', 100, '2025-04-11', '10:01:22'),
(53, 'B008', 'Hotsilog -Hungarian', '', 'Breakfast Menu', 'Food', 300, 0, 0, 'default.png', 100, '2025-04-11', '10:01:22'),
(54, 'B009', 'American Breakfast', '', 'Breakfast Menu', 'Food', 385, 0, 0, 'default.png', 85, '2025-04-11', '10:01:22'),
(55, 'SD001', 'Steam Rice', '', 'Side Dish Menu', 'Food', 35, 0, 0, 'default.png', -23, '2025-04-11', '10:01:22'),
(56, 'SD002', 'Garlic Rice', '', 'Side Dish Menu', 'Food', 45, 0, 0, 'default.png', 86, '2025-04-11', '10:01:22'),
(57, 'SD003', 'Mashed Potato', '', 'Side Dish Menu', 'Food', 70, 0, 0, 'default.png', 97, '2025-04-11', '10:01:22'),
(58, 'SD004', 'Fries', '', 'Side Dish Menu', 'Food', 80, 0, 0, 'default.png', 97, '2025-04-11', '10:01:22'),
(59, 'SD005', 'Coleslaw', '', 'Side Dish Menu', 'Food', 70, 0, 0, 'default.png', 97, '2025-04-11', '10:01:22'),
(60, 'SD006', 'Baked Potato', '', 'Side Dish Menu', 'Food', 90, 0, 0, 'default.png', 99, '2025-04-11', '10:01:22'),
(61, 'SD007', 'Potato Wedges', '', 'Side Dish Menu', 'Food', 80, 0, 0, 'default.png', 98, '2025-04-11', '10:01:22'),
(62, 'SD008', 'Steamed Vegetables', '', 'Side Dish Menu', 'Food', 60, 0, 0, 'default.png', 99, '2025-04-11', '10:01:22'),
(63, 'C001', 'Thai Roasted Curry Chicken', '', 'Chicken', 'Food', 380, 0, 0, 'default.png', 94, '2025-04-11', '10:03:56'),
(64, 'C002', 'Rosemary Chicken with Red Sauce', '', 'Chicken', 'Food', 250, 0, 0, 'default.png', 95, '2025-04-11', '10:03:56'),
(65, 'C003', 'Chicken Parmigiana', '', 'Chicken', 'Food', 390, 0, 0, 'default.png', 98, '2025-04-11', '10:03:56'),
(66, 'C004', 'Baked Chicken Pesto', '', 'Chicken', 'Food', 330, 0, 0, 'default.png', 99, '2025-04-11', '10:03:56'),
(67, 'C005', 'Pan Seared Chicken', '', 'Chicken', 'Food', 250, 0, 0, 'default.png', 99, '2025-04-11', '10:03:56'),
(68, 'C006', 'Rustiko Mary Land Chicken', '', 'Chicken', 'Food', 500, 0, 0, 'default.png', 100, '2025-04-11', '10:03:56'),
(69, 'P001', 'Grilled Pork w/ Mushroom Sauce', '', 'Pork', 'Food', 330, 0, 0, 'default.png', 84, '2025-04-11', '10:03:56'),
(70, 'P002', 'Baby Back Ribs platter', '', 'Pork', 'Food', 700, 0, 0, 'default.png', 63, '2025-04-11', '10:06:00'),
(71, 'P003', 'Braised Pork Belly', '', 'Pork', 'Food', 370, 0, 0, 'default.png', 76, '2025-04-11', '10:03:56'),
(72, 'P004', 'Pork Scallotini Platter', '', 'Pork', 'Food', 350, 0, 0, 'default.png', 90, '2025-04-11', '10:03:56'),
(73, 'P005', 'Surf and Turf', '', 'Pork', 'Food', 440, 0, 0, 'default.png', 99, '2025-04-11', '10:03:56'),
(74, 'P006', 'Crispy Pata - Small', '', 'Pork', 'Food', 600, 0, 0, 'default.png', 77, '2025-04-11', '10:06:00'),
(75, 'P007', 'Crispy Pata - Medium', '', 'Pork', 'Food', 750, 0, 0, 'default.png', 100, '2025-04-11', '10:06:00'),
(76, 'P008', 'Crispy Pata - Large', '', 'Pork', 'Food', 950, 0, 0, 'default.png', 100, '2025-04-11', '10:06:00'),
(77, 'P009', 'Aqua Pazza', '', 'Pork', 'Food', 250, 0, 0, 'default.png', 99, '2025-04-11', '10:03:56'),
(78, 'P010', 'Garlic Pork Spare ribs', '', 'Pork', 'Food', 250, 0, 0, 'default.png', 96, '2025-04-11', '10:03:56'),
(79, 'P011', 'Pork Mongolian', '', 'Pork', 'Food', 250, 0, 0, 'default.png', 95, '2025-04-11', '10:03:56'),
(80, 'P012', 'Pork Sisig', '', 'Pork', 'Food', 290, 0, 0, 'default.png', 78, '2025-04-11', '10:03:56'),
(81, 'P013', 'Dinakdakan', '', 'Pork', 'Food', 290, 0, 0, 'default.png', 94, '2025-04-11', '10:03:56'),
(82, 'P014', 'Pork Katsudon', '', 'Pork', 'Food', 260, 0, 0, 'default.png', 94, '2025-04-11', '10:03:56'),
(83, 'P015', 'Spicy Pork Belly', '', 'Pork', 'Food', 350, 0, 0, 'default.png', 97, '2025-04-11', '10:03:56'),
(84, 'P016', 'Honey Mustard Pork', '', 'Pork', 'Food', 280, 0, 0, 'default.png', 96, '2025-04-11', '10:03:56'),
(85, 'B001', 'Beef Ribs Chimichurri', '', 'Beef', 'Food', 500, 0, 0, 'default.png', 99, '2025-04-11', '10:03:56'),
(86, 'B002', 'Indian Beef Curry', '', 'Beef', 'Food', 280, 0, 0, 'default.png', 94, '2025-04-11', '10:03:56'),
(87, 'HS001', 'BULALO', '', 'Specialty', 'Food', 750, 0, 0, 'default.png', 87, '2025-04-11', '10:06:00'),
(88, 'HS002', 'Crispy Pata', '', 'Specialty', 'Food', 0, 0, 0, 'default.png', 100, '2025-04-11', '10:03:56'),
(89, 'V001', 'Lohan Chai', '', 'Vegetables', 'Food', 300, 0, 0, 'default.png', 98, '2025-04-11', '10:03:56'),
(90, 'V002', 'Eggplant Parmigiana', '', 'Vegetables', 'Food', 320, 0, 0, 'default.png', 99, '2025-04-11', '10:03:56'),
(91, 'V003', 'Aubergine Parmigiana', '', 'Vegetables', 'Food', 240, 0, 0, 'default.png', 99, '2025-04-11', '10:03:56'),
(92, 'V004', 'Shitake Bokchoy Garlic Mushroom', '', 'Vegetables', 'Food', 280, 0, 0, 'default.png', 91, '2025-04-11', '10:03:56'),
(93, 'V005', 'Pinakbet w/ bagnet', '', 'Vegetables', 'Food', 250, 0, 0, 'default.png', 96, '2025-04-11', '10:03:56'),
(94, 'F001', 'Fish Fillet in Caper Sauce', '', 'Fish', 'Food', 250, 0, 0, 'default.png', 99, '2025-04-11', '10:03:56'),
(95, 'F002', 'Salt and Pepper Fish Fillet', '', 'Fish', 'Food', 300, 0, 0, 'default.png', 98, '2025-04-11', '10:03:56'),
(96, 'F003', 'Panseared Cream Dory with pico de Gallo  ', '', 'Fish', 'Food', 230, 0, 0, 'default.png', 91, '2025-04-11', '10:03:56'),
(97, 'F004', 'Steamed Dory Fillet in Parmesan Cheese', '', 'Fish', 'Food', 220, 0, 0, 'default.png', 92, '2025-04-11', '10:03:56'),
(98, 'F005', 'Roasted Pampano', '', 'Fish', 'Food', 450, 0, 0, 'default.png', 93, '2025-04-11', '10:03:56'),
(99, 'F006', 'Grilled Pampano Teriyaki', '', 'Fish', 'Food', 470, 0, 0, 'default.png', 98, '2025-04-11', '10:03:56'),
(100, 'F007', 'Grilled Squid', '', 'Fish', 'Food', 325, 0, 0, 'default.png', 95, '2025-04-11', '10:03:56'),
(101, 'F008', 'Special Shrimp Ala Rustiko', '', 'Fish', 'Food', 350, 0, 0, 'default.png', 100, '2025-04-11', '10:03:56'),
(102, 'F009', 'Pininyahang Pampano', '', 'Fish', 'Food', 580, 0, 0, 'default.png', 98, '2025-04-11', '10:03:56'),
(103, 'F010', 'Tempura Shrimp and Vegetables', '', 'Fish', 'Food', 390, 0, 0, 'default.png', 95, '2025-04-11', '10:03:56'),
(104, 'F011', 'Bangus Binagoongan', '', 'Fish', 'Food', 400, 0, 0, 'default.png', 100, '2025-04-11', '10:03:56'),
(105, 'F012', 'Squid Gambas', '', 'Fish', 'Food', 325, 0, 0, 'default.png', 97, '2025-04-11', '10:03:56'),
(106, 'P017', 'SINIGANG NA BABOY', '', 'Pork', 'Food', 300, 0, 0, 'default.png', 96, '2025-04-11', '10:06:00'),
(201, 'FNC001', 'VANILLA -16oz', '', 'Frappe', 'Non-Coffee', 160, 190, 0, 'default.png', 100, '2025-04-11', '10:09:59'),
(202, 'FNC002', 'VANILLA STRAWBERRY -16oz', '', 'Frappe', 'Non-Coffee', 170, 200, 0, 'default.png', 93, '2025-04-11', '10:09:59'),
(203, 'FNC003', 'OREO VANILLA -16oz', '', 'Frappe', 'Non-Coffee', 165, 0, 0, 'default.png', 86, '2025-04-11', '10:09:59'),
(204, 'FNC004', 'MATCHA CREAM -16oz', '', 'Frappe', 'Non-Coffee', 180, 0, 0, 'default.png', 95, '2025-04-11', '10:09:59'),
(205, 'FNC005', 'BISCOFF -16oz', '', 'Frappe', 'Non-Coffee', 185, 215, 0, 'default.png', 94, '2025-04-11', '10:09:59'),
(206, 'FCB001', 'CARAMEL-16oz', '', 'Frappe ', 'Coffee Based', 180, 210, 0, 'default.png', 99, '2025-04-11', '10:09:59'),
(207, 'FCB002', 'DARK MOCHA -16oz', '', 'Frappe', 'Coffee Based', 170, 200, 0, 'default.png', 98, '2025-04-11', '10:09:59'),
(208, 'FCB003', 'WHITE CHOCOLATE Chocnut -16oz', '', 'Frappe', 'Coffee Based', 185, 215, 0, 'default.png', 95, '2025-04-11', '10:09:59'),
(209, 'FCB004', 'NUTELLA -16oz', '', 'Frappe', 'Coffee Based', 205, 240, 0, 'default.png', 93, '2025-04-11', '10:09:59'),
(210, 'SODA001', 'COKE', '', 'Soda', 'Food', 80, 0, 0, 'default.png', 85, '2025-04-11', '10:09:59'),
(211, 'SODA002', 'SPRITE', '', 'Soda', 'Food', 80, 0, 0, 'default.png', 97, '2025-04-11', '10:09:59'),
(212, 'SODA003', 'ROYAL', '', 'Soda', 'Food', 80, 0, 0, 'default.png', 100, '2025-04-11', '10:09:59'),
(213, 'FS001', 'MANGO', '', 'Fruit Shake', 'Seasonal', 190, 0, 0, 'default.png', 76, '2025-04-11', '10:09:59'),
(214, 'FS002', 'WATERMELON', '', 'Fruit Shake', 'Seasonal', 190, 0, 0, 'default.png', 90, '2025-04-11', '10:09:59'),
(215, 'FS003', 'BANANA', '', 'Fruit Shake', 'Seasonal', 190, 0, 0, 'default.png', 86, '2025-04-11', '10:09:59'),
(216, 'OB001', 'BOTTLED WATER', '', 'Beverage', 'Food', 50, 0, 0, 'default.png', 72, '2025-04-11', '10:09:59'),
(217, 'OB002', 'SAN MIG LIGHT', '', 'Beverage', 'Food', 120, 0, 0, 'default.png', 98, '2025-04-11', '10:09:59'),
(218, 'J001', 'HOUSE BLEND ICED TEA', '', 'Juice', 'Food', 100, 0, 0, 'default.png', 79, '2025-04-11', '10:09:59'),
(219, 'J002', 'LEMONADE', '', 'Juice', 'Food', 100, 0, 0, 'default.png', 85, '2025-04-11', '10:09:59'),
(220, 'J003', 'CUCUMBER LEMONADE', '', 'Juice', 'Food', 120, 0, 0, 'default.png', 84, '2025-04-11', '10:09:59'),
(221, 'J004', 'CALAMANSI', '', 'Juice', 'Food', 120, 0, 0, 'default.png', 97, '2025-04-11', '10:09:59'),
(222, 'IC001', '16oz-ICED AMERICANO', '', 'Iced Coffee', '', 115, 135, 0, 'default.png', 86, '2025-04-11', '10:12:01'),
(223, 'IC002', '16oz-CAPPUCCINO\r\n', '', 'Iced Coffee', '', 130, 150, 0, 'default.png', 88, '2025-04-11', '10:12:01'),
(224, 'IC003', '16oz-LATTE', '', 'Iced Coffee', '', 130, 150, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(225, 'IC004', '16oz-CARAMEL MACCHIATO', '', 'Iced Coffee', '', 170, 205, 0, 'default.png', 82, '2025-04-11', '10:12:01'),
(226, 'IC005', '16oz-DARK MOCHA', '', 'Iced Coffee', 'Food', 170, 205, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(227, 'IC006', '16oz-WHITE MOCHA', '', 'Iced Coffee', '', 170, 205, 0, 'default.png', 95, '2025-04-11', '10:12:01'),
(228, 'IC007', '16oz-VANILLA', '', 'Iced Coffee', '', 160, 190, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(229, 'IC008', '16oz-ALMOND', '', 'Iced Coffee', '', 160, 190, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(230, 'IC009', '16oz-HAZELNUT', '', 'Iced Coffee', '', 160, 190, 0, 'default.png', 94, '2025-04-11', '10:12:01'),
(231, 'IC010', '16oz-MACADAMIA NUT LATTE', '', 'Iced Coffee', '', 160, 190, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(232, 'IC011', '16oz-TOFFEE NUT', '', 'Iced Coffee', '', 160, 190, 0, 'default.png', 96, '2025-04-11', '10:12:01'),
(233, 'IC012', '16oz-BUTTERSCOTCH', '', 'Iced Coffee', '', 165, 195, 0, 'default.png', 89, '2025-04-11', '10:12:01'),
(234, 'IC013', '16oz-SPANISH LATTE', '', 'Iced Coffee', '', 155, 175, 0, 'default.png', 76, '2025-04-11', '10:12:01'),
(235, 'IC014', '16oz-SPANISH CARAMEL', '', 'Iced Coffee', '', 165, 195, 0, 'default.png', 97, '2025-04-11', '10:12:01'),
(236, 'IC015', '16oz-NUTELLA MACADAMIA', '', 'Iced Coffee', '', 190, 230, 0, 'default.png', 95, '2025-04-11', '10:12:01'),
(237, 'IC016', '16oz-BISCOFF', '', 'Iced Coffee', '', 200, 230, 0, 'default.png', 93, '', '10:12:01'),
(238, 'IC017', '16oz-IRISH CREAM', '', 'Iced Coffee', '', 160, 205, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(239, 'IC018', '16oz-CARAMEL WHITE MOCHA', '', 'Iced Coffee', '', 170, 205, 0, 'default.png', 94, '2025-04-11', '10:12:01'),
(240, 'IC019', '16oz-DIRTY MATCHA', '', 'Iced Coffee', '', 200, 230, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(242, 'IC021', '16oz-ICED CHOCOLATE', '', 'Iced Coffee', '', 150, 180, 0, 'default.png', 92, '2025-04-11', '10:12:01'),
(243, 'IC022', '16oz-ICED MATCHA', '', 'Iced Coffee', '', 175, 200, 0, 'default.png', 88, '2025-04-11', '10:12:01'),
(244, 'IC023', '16oz-STRAWBERRY MILK', '', 'Iced Coffee', '', 130, 160, 0, 'default.png', 97, '2025-04-11', '10:12:01'),
(245, 'IC024', '16oz-CHOCO BERRY', '', 'Iced Coffee', '', 170, 200, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(246, 'IC025', '16oz-STRAWBERRY MATCHA', '', 'Iced Coffee', '', 195, 225, 0, 'default.png', 95, '2025-04-11', '10:12:01'),
(247, 'HC001', '12oz- AMERICANO Hot', '', 'Hot Coffee', 'Food', 100, 0, 0, 'default.png', 86, '2025-04-11', '10:12:01'),
(248, 'HC002', '12oz- CAPPUCCINO Hot', '', 'Hot Coffee', '', 140, 0, 0, 'default.png', 85, '2025-04-11', '10:12:01'),
(249, 'HC003', '12oz- LATTE Hot', '', 'Hot Coffee', 'Food', 140, 0, 0, 'default.png', 95, '2025-04-11', '10:12:01'),
(250, 'HC004', '12oz- CARAMEL MACCHIATO Hot', '', 'Hot Coffee', 'Food', 160, 0, 0, 'default.png', 92, '2025-04-11', '10:12:01'),
(251, 'HC005', '12oz- DARK MOCHA Hot', '', 'Hot Coffee', 'Food', 160, 0, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(252, 'HC006', '12oz- WHITE MOCHA Hot', '', 'Hot Coffee', 'Food', 160, 0, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(253, 'HC007', '12oz- VANILLA Hot', '', 'Hot Coffee', '', 155, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(254, 'HC008', '12oz- TOFFEE NUT Hot', '', 'Hot Coffee', '', 155, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(255, 'HC009', 'CHOCO Hot', '', 'Hot Coffee', 'Food', 150, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(256, 'HC010', '12oz- MATCHA Hot', '', 'Hot Coffee', 'Food', 165, 0, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(257, 'HC011', '12oz- IRISH CREAM Hot', '', 'Hot Coffee', 'Food', 155, 0, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(258, 'HC012', '12oz- SPANISH LATTE Hot', '', 'Hot Coffee', 'Food', 150, 0, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(259, 'HC013', '12oz- HAZELNUT Hot', '', 'Hot Coffee', 'Food', 155, 0, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(260, 'HC014', '12oz- MACADAMIA NUT Hot', '', 'Hot Coffee', '', 155, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(261, 'Z001', 'Pancit Bihon', 'Food', 'Pasta', '', 250, 0, 0, 'default.png', 96, '2025-04-12', '02:07:10'),
(262, 'K001', 'Chocolate Cookies', 'Cookies', 'Specialty', '', 60, 60, 60, 'default.png', 80, '2025-04-12', '03:57:05'),
(263, 'IC0142', 'SPANISH CARAMEL - 22OZ', '', 'Iced Coffee', '', 195, 0, 0, 'default.png', 95, '2025-04-12', '04:11:10'),
(264, 'IC0143', 'HOT SPANISH - 22OZ', '', 'Hot Coffee', '', 180, 0, 0, 'default.png', 97, '2025-04-12', '04:11:45'),
(265, 'IC0144', 'CARAMEL MACHIATTO - 22OZ', '', 'Hot Coffee', '', 190, 0, 0, 'default.png', 96, '2025-04-12', '04:12:15'),
(266, 'Z2312', 'White Chocolate Chocnut - 22oz', '', 'Frappe', '', 215, 0, 0, 'default.png', 96, '2025-04-12', '05:16:43'),
(267, 'Z0923', 'Ice Chocolate - 22oz', '', 'Frappe', '', 180, 0, 0, 'default.png', 22, '2025-04-12', '05:17:59'),
(268, 'Z09233', 'Hazelnut - 22oz', '', 'Iced Coffee', '', 190, 0, 0, 'default.png', 21, '2025-04-12', '05:20:28'),
(269, 'X02393', 'Ice Latte -22oz', '', 'Iced Coffee', '', 150, 0, 0, 'default.png', 95, '2025-04-12', '05:35:46'),
(270, 'FN007', 'OREO MILK-22OZ', '', 'FRAPPE', '', 195, 0, 0, 'default.png', 100, '2025-04-12', '06:22:55'),
(271, 'IC123', 'Macademia Nut-22OZ', '', 'Iced Coffee', '', 190, 0, 0, 'default.png', 94, '2025-04-12', '06:24:43'),
(272, 'IC124', 'Iced Matcha-22OZ', '', 'Iced Coffee', '', 200, 0, 0, 'default.png', 89, '2025-04-12', '06:25:53'),
(273, 'IC026', 'Spanish Latte-22oz', '', 'Iced Coffee', '', 175, 0, 0, 'default.png', 79, '2025-04-12', '06:29:15'),
(274, 'K002', 'Carrot Cake', '1 Slice', 'Specialty', '', 200, 0, 0, 'default.png', 993, '2025-04-12', '07:22:16'),
(275, 'FNC008', 'Oreo Vanilla- 22oz', '', 'Frappe', '', 195, 0, 0, 'default.png', 98, '2025-04-12', '07:29:17'),
(276, 'IC025', 'WHITE MOCHA-22OZ', '', 'Iced Coffee', '', 205, 0, 0, 'default.png', 95, '2025-04-12', '08:05:36'),
(278, 'IC027', 'Caramel Frappe-22OZ', '', 'Frappe', '', 210, 0, 0, 'default.png', 97, '2025-04-12', '08:07:11'),
(279, 'FC011', 'ICE BISCOFF-22oz', '', 'Iced Coffee', '', 230, 0, 0, 'default.png', 4, '2025-04-12', '09:27:48'),
(280, 'FCB005', 'BISCOFF FRAPPE-22oz', '', 'Iced Coffee', '', 215, 0, 0, 'default.png', 0, '2025-04-12', '09:29:25'),
(281, 'FCB005', 'BISCOFF FRAPPE-22oz', '', 'Frappe', '', 215, 0, 0, 'default.png', 0, '2025-04-12', '09:29:56'),
(282, 'S031', 'Crab and Corn Soup', '', 'Soup', '', 130, 0, 0, 'default.png', 98, '2025-04-12', '09:43:10'),
(283, 'S032', 'Creamy Pumpkin Soup', '', 'Soup', '', 130, 0, 0, 'default.png', 97, '2025-04-12', '09:43:32'),
(284, 'S033', 'Bokchoy Chinese Soup', '', 'Soup', '', 300, 0, 0, 'default.png', 100, '2025-04-12', '09:43:59'),
(285, 'CS001', 'Calamares Sauce', '', 'Specialty', '', 35, 0, 0, 'default.png', 99, '2025-04-12', '09:45:40'),
(286, 'CS011', 'Ice Caramel Machiato', '', 'Iced Coffee', '', 205, 0, 0, 'default.png', 93, '2025-04-12', '09:50:42'),
(287, 'P018', 'Pork Ribs Chimichurri', '', 'Pork', '', 550, 0, 0, 'default.png', 100, '2025-04-12', '09:57:55'),
(288, 'P019', 'Grilled Porkchop w\\ Mushroom Sauce', '', '', '', 330, 0, 0, 'default.png', 199, '2025-04-12', '10:03:15'),
(289, 'P020', 'Salt and Pepper Ribs', '', 'Pork', '', 365, 0, 0, 'default.png', 198, '2025-04-12', '10:06:02'),
(290, 'FCB007', 'Nutella Macademia -22oz', '', 'Iced Coffee', '', 220, 0, 0, 'default.png', 94, '2025-04-12', '10:22:03'),
(291, 'FCB011', 'Vanilla -22oz', '', 'Frappe', '', 190, 0, 0, 'default.png', 97, '2025-04-12', '10:41:58'),
(292, 'FCB012', 'Vanilla Strawberry -22oz', '', 'Frappe', '', 200, 0, 0, 'default.png', 98, '2025-04-12', '10:44:23'),
(293, 'FCB013', 'Oreo Vanilla -22oz', '', 'Frappe', '', 195, 0, 0, 'default.png', 100, '2025-04-12', '10:45:46'),
(294, 'FCB014', 'Matcha Cream -22oz', '', 'Frappe', '', 210, 0, 0, 'default.png', 100, '2025-04-12', '10:46:09'),
(295, 'FCB015', 'Dark Mocha -22oz', '', 'Frappe', '', 200, 0, 0, 'default.png', 99, '2025-04-12', '10:47:34'),
(296, 'Z2314', 'Nutella', '', 'Frappe', '', 240, 0, 0, 'default.png', 95, '2025-04-12', '10:51:54'),
(297, 'CODE: HC015', 'Latte - 22oz', '', 'Hot Coffee', '', 170, 0, 0, 'default.png', 99, '2025-04-12', '12:50:54'),
(298, ' Z2315', 'Americano -22oz', '', 'Iced Coffee', '', 135, 0, 0, 'default.png', 96, '2025-04-12', '13:12:56'),
(299, '123123', 'Rustiko Pancit', '', 'Specialty', '', 300, 0, 0, 'default.png', 93, '2025-04-12', '15:27:11'),
(300, 'ht', 'Americano -22oz', '', 'Hot Coffee', '', 130, 0, 0, 'default.png', 99, '2025-04-12', '15:58:03'),
(301, 'mh123', 'Dark Mocha -22oz', '', 'Iced Coffee', '', 205, 0, 0, 'default.png', 94, '2025-04-12', '16:08:55'),
(302, 'mh124', 'Tofee nut -22oz', '', 'Iced Coffee', '', 190, 0, 0, 'default.png', 97, '2025-04-12', '16:09:23'),
(303, '7654', 'Matcha -220z', '', 'Iced Coffee', '', 200, 0, 0, 'default.png', 98, '2025-04-13', '03:59:23'),
(304, '12365', '22oz-Hot cappucino', '', 'Hot Coffee', '', 170, 0, 0, 'default.png', 98, '2025-04-13', '04:50:34'),
(305, 'sdag', 'Grilled pampano teriyaki', '', 'Fish', '', 470, 0, 0, 'default.png', 122, '2025-04-13', '04:59:21'),
(306, 'asffsd', 'Ice Chocolate', '', 'Iced Coffee', '', 180, 0, 0, 'default.png', 97, '2025-04-13', '05:02:15'),
(307, '1239s8das', 'Pancit Canton', '', 'Pasta', '', 250, 0, 0, 'default.png', 95, '2025-04-13', '05:21:12'),
(308, 'bnbv', 'Cheesecake', '', 'Specialty', '', 195, 0, 0, 'default.png', 99, '2025-04-13', '06:48:50'),
(309, 'ICC01', '22oz-AMERICANO Iced', '', 'Iced Coffee', '', 135, 0, 0, 'default.png', 90, '2025-04-11', '10:12:01'),
(310, 'ICC02', '22oz-CAPPUCCINO Iced', '', 'Iced Coffee', '', 150, 0, 0, 'default.png', 91, '2025-04-11', '10:12:01'),
(311, 'ICC03', '22oz-LATTE Iced', '', 'Iced Coffee', '', 150, 0, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(312, 'ICC04', '22oz-CARAMEL MACCHIATO Iced', '', 'Iced Coffee', '', 205, 0, 0, 'default.png', 87, '2025-04-11', '10:12:01'),
(313, 'ICC05', '22oz-DARK MOCHA Iced', '', 'Iced Coffee', '', 205, 0, 0, 'default.png', 96, '2025-04-11', '10:12:01'),
(314, 'ICC06', '22oz-WHITE MOCHA Iced', '', 'Iced Coffee', '', 205, 0, 0, 'default.png', 97, '2025-04-11', '10:12:01'),
(315, 'ICC07', '22oz-VANILLA Iced', '', 'Iced Coffee', '', 190, 0, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(316, 'ICC08', '22oz-ALMOND Iced', '', 'Iced Coffee', '', 190, 0, 0, 'default.png', 95, '2025-04-11', '10:12:01'),
(317, 'ICC09', '22oz-HAZELNUT Iced', '', 'Iced Coffee', '', 190, 0, 0, 'default.png', 96, '2025-04-11', '10:12:01'),
(318, 'ICC10', '22oz-MACADAMIA NUT LATTE Iced', '', 'Iced Coffee', '', 190, 0, 0, 'default.png', 96, '2025-04-11', '10:12:01'),
(319, 'ICC11', '22oz-TOFFEE NUT Iced', '', 'Iced Coffee', '', 190, 0, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(320, 'ICC12', '22oz-BUTTERSCOTCH Iced', '', 'Iced Coffee', '', 195, 0, 0, 'default.png', 94, '2025-04-11', '10:12:01'),
(321, 'ICC13', '22oz-SPANISH LATTE Iced', '', 'Iced Coffee', '', 175, 0, 0, 'default.png', 86, '2025-04-11', '10:12:01'),
(322, 'ICC14', '22oz-SPANISH CARAMEL Iced', '', 'Iced Coffee', '', 195, 0, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(323, 'ICC15', '22oz-NUTELLA MACADAMIA Iced', '', 'Iced Coffee', '', 220, 0, 0, 'default.png', 97, '2025-04-11', '10:12:01'),
(324, 'ICC16', '22oz-BISCOFF Iced', '', 'Iced Coffee', '', 230, 0, 0, 'default.png', 96, '2025-04-11', '10:12:01'),
(325, '', '22oz-IRISH CREAM', '', 'Iced Coffee', '', 180, 225, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(326, 'ICC18', '22oz-CARAMEL WHITE MOCHA', '', 'Iced Coffee', '', 190, 225, 0, 'default.png', 96, '2025-04-11', '10:12:01'),
(327, 'ICC19', '22oz-DIRTY MATCHA', '', 'Iced Coffee', '', 220, 250, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(328, 'ICC20', '22oz-ICED CHOCOLATE', '', 'Iced Coffee', '', 170, 200, 0, 'default.png', 94, '2025-04-11', '10:12:01'),
(329, 'ICC21', '22oz-ICED MATCHA', '', 'Iced Coffee', '', 195, 220, 0, 'default.png', 94, '2025-04-11', '10:12:01'),
(330, 'ICC22', '22oz-STRAWBERRY MILK', '', 'Iced Coffee', '', 150, 180, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(331, 'ICC23', '22oz-CHOCO BERRY iced', '', 'Iced Coffee', '', 190, 220, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(332, 'ICC24', '22oz-STRAWBERRY MATCHA Iced', '', 'Iced Coffee', '', 200, 230, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(333, 'HC001', '12oz-AMERICANO Hot', '', 'Hot Coffee', '16oz', 100, 130, 0, 'default.png', 86, '2025-04-11', '10:12:01'),
(334, 'HC002', '12oz-CAPPUCCINO Hot', '', 'Hot Coffee', '16oz', 140, 170, 0, 'default.png', 85, '2025-04-11', '10:12:01'),
(335, 'HC003', '12oz-LATTE Hot', '', 'Hot Coffee', '16oz', 140, 170, 0, 'default.png', 95, '2025-04-11', '10:12:01'),
(336, 'HC004', '12oz-CARAMEL MACCHIATO Hot', '', 'Hot Coffee', '16oz', 160, 190, 0, 'default.png', 92, '2025-04-11', '10:12:01'),
(337, 'HC005', '12oz-DARK MOCHA Hot', '', 'Hot Coffee', '16oz', 160, 190, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(338, 'HC006', '12oz-WHITE MOCHA Hot', '', 'Hot Coffee', '16oz', 160, 190, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(339, 'HC007', '12oz-VANILLA Hot', '', 'Hot Coffee', '16oz', 155, 185, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(340, 'HC008', '12oz-TOFFEE NUT Hot', '', 'Hot Coffee', '16oz', 155, 185, 0, 'default.png', 100, '2025-04-11', ''),
(341, 'HC009', '12oz-CHOCO Hot', 'Hot Coffee', '12oz', '16oz', 150, 180, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(342, 'HC010', '12oz-MATCHA Hot', 'Hot Coffee', '12oz', '16oz', 165, 195, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(343, 'HC011', '12oz-IRISH CREAM Hot', 'Hot Coffee', '12oz', '16oz', 155, 185, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(344, 'HC012', '12oz-SPANISH LATTE Hot', 'Hot Coffee', '12oz', '16oz', 150, 180, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(345, 'HC013', '12oz-HAZELNUT Hot', 'Hot Coffee', '12oz', '16oz', 155, 185, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(346, 'HC014', '12oz-MACADAMIA NUT Hot', 'Hot Coffee', '12oz', '16oz', 160, 190, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(347, 'HC201', '16oz-AMERICANO Hot', 'Hot Coffee', '16oz', '12oz', 130, 0, 0, 'default.png', 88, '2025-04-11', '10:12:01'),
(348, 'HC202', '16oz-CAPPUCCINO Hot', 'Hot Coffee', '16oz', '12oz', 170, 0, 0, 'default.png', 90, '2025-04-11', '10:12:01'),
(349, 'HC203', '16oz-LATTE Hot', 'Hot Coffee', '16oz', '12oz', 170, 0, 0, 'default.png', 97, '2025-04-11', '10:12:01'),
(350, 'HC204', '16oz-CARAMEL MACCHIATO Hot', 'Hot Coffee', '16oz', '12oz', 190, 0, 0, 'default.png', 96, '2025-04-11', '10:12:01'),
(351, 'HC205', '16oz-DARK MOCHA Hot', 'Hot Coffee', '16oz', '12oz', 190, 0, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(352, 'HC206', '16oz-WHITE MOCHA Hot', 'Hot Coffee', '16oz', '12oz', 190, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(353, 'HC207', '16oz-VANILLA Hot', 'Hot Coffee', '16oz', '12oz', 185, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(354, 'HC208', '16oz-TOFFEE NUT Hot', 'Hot Coffee', '16oz', '12oz', 185, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(355, 'HC209', '16oz-CHOCO Hot', 'Hot Coffee', '16oz', '12oz', 180, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(356, 'HC210', '16oz-MATCHA Hot', 'Hot Coffee', 'Hot Coffee', 'Hot Coffee', 195, 0, 0, 'default.png', 97, '2025-04-11', '10:12:01'),
(357, 'HC211', '16oz-IRISH CREAM Hot', 'Hot Coffee', '16oz', '12oz', 185, 0, 0, 'default.png', 99, '2025-04-11', '10:12:01'),
(358, 'HC212', '16oz-SPANISH LATTE Hot', 'Hot Coffee', '16oz', '12oz', 180, 0, 0, 'default.png', 93, '2025-04-11', '10:12:01'),
(359, 'HC213', '16oz-HAZELNUT Hot', 'Hot Coffee', '16oz', '12oz', 185, 0, 0, 'default.png', 98, '2025-04-11', '10:12:01'),
(360, 'HC214', '16oz-MACADAMIA NUT Hot', 'Hot Coffee', '16oz', '12oz', 190, 0, 0, 'default.png', 100, '2025-04-11', '10:12:01'),
(361, 'asdfasdf', '16oz Caramel Frappe', '', 'Frappe', '', 180, 0, 0, 'default.png', 997, '2025-04-13', '10:12:20'),
(362, 'IC022', 'BUTTERSCOTCH 22OZ', '', 'ICED COFFEE', '', 195, 0, 0, 'default.png', 88, '2025-04-13', '13:36:59'),
(363, 'DASDVBV', 'Tiramisu Cheesecake', '', 'Specialty', '', 200, 0, 0, 'default.png', 98, '2025-04-13', '14:24:27'),
(364, 'D4112', 'Velvelt Cookies', '', 'Specialty', '', 75, 0, 0, 'default.png', 98, '2025-04-13', '14:25:15');

-- --------------------------------------------------------

--
-- Table structure for table `que_orders`
--

CREATE TABLE `que_orders` (
  `que_order_no` int(255) NOT NULL,
  `receipt_number` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `items_ordered` text NOT NULL,
  `total_amount` int(255) NOT NULL,
  `amount_paid` int(255) NOT NULL,
  `amount_change` int(255) NOT NULL,
  `order_take` varchar(255) NOT NULL,
  `table_number` varchar(10) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `waiter_name` varchar(100) DEFAULT NULL,
  `waiter_code` varchar(20) DEFAULT NULL,
  `total_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `que_orders`
--

INSERT INTO `que_orders` (`que_order_no`, `receipt_number`, `date`, `time`, `items_ordered`, `total_amount`, `amount_paid`, `amount_change`, `order_take`, `table_number`, `order_status`, `waiter_name`, `waiter_code`, `total_order`) VALUES
(683, '977002', '5/20/2025', '12:06:17 PM', '[{\"order_name\":\"Salt and Pepper Fish Fillet\",\"order_name2\":\"\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\",\"basePrice\":300,\"delivered\":\"0\"}]', 300, 0, 0, 'Dine In', '7', 'pending', 'Michael', 'MD9915', 0);

-- --------------------------------------------------------

--
-- Table structure for table `remit_returns`
--

CREATE TABLE `remit_returns` (
  `return_id` int(255) NOT NULL,
  `cashier_name` varchar(255) NOT NULL,
  `total_sales` varchar(255) NOT NULL,
  `return_date` varchar(255) NOT NULL,
  `return_time` varchar(255) NOT NULL,
  `return_validation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `remit_sales`
--

CREATE TABLE `remit_sales` (
  `remit_id` int(255) NOT NULL,
  `cashier_name` varchar(255) NOT NULL,
  `total_sales` varchar(255) NOT NULL,
  `remit_date` varchar(255) NOT NULL,
  `remit_time` varchar(255) NOT NULL,
  `remit_shortage` int(255) NOT NULL,
  `remit_validation` varchar(255) NOT NULL,
  `food_summary` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `remit_sales`
--

INSERT INTO `remit_sales` (`remit_id`, `cashier_name`, `total_sales`, `remit_date`, `remit_time`, `remit_shortage`, `remit_validation`, `food_summary`) VALUES
(43, 'Michael', '350', '2025-05-20', '10:47:20 AM', 0, 'Validated', '[{\"items_ordered\":\"[{\\\"order_name\\\":\\\"Kangkong Chips w\\\\/ Pinakurat\\\",\\\"order_quantity\\\":\\\"x1\\\",\\\"basePrice\\\":180}]\",\"total_amount\":\"180\",\"date\":\"2025-05-20\",\"time\":\"09:35:11\"},{\"items_ordered\":\"[{\\\"order_name\\\":\\\"Pork Chips with Pinakurat Sauce\\\",\\\"order_quantity\\\":\\\"x1\\\",\\\"basePrice\\\":200}]\",\"total_amount\":\"170\",\"date\":\"2025-05-20\",\"time\":\"10:30:49\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `reserve_table`
--

CREATE TABLE `reserve_table` (
  `reserve_no` int(255) NOT NULL,
  `reserve_date` varchar(255) NOT NULL,
  `reserve_time` varchar(255) NOT NULL,
  `table_number` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return-orders`
--

CREATE TABLE `return-orders` (
  `return_id` int(255) NOT NULL,
  `receipt_number` int(255) NOT NULL,
  `return_date` varchar(255) NOT NULL,
  `return_time` varchar(255) NOT NULL,
  `cashier_name` varchar(255) NOT NULL,
  `items_ordered` varchar(255) NOT NULL,
  `total_amount` int(255) NOT NULL,
  `amount_paid` int(255) NOT NULL,
  `amount_change` int(255) NOT NULL,
  `order_take` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `return-orders`
--

INSERT INTO `return-orders` (`return_id`, `receipt_number`, `return_date`, `return_time`, `cashier_name`, `items_ordered`, `total_amount`, `amount_paid`, `amount_change`, `order_take`) VALUES
(4, 101, '11/17/2024', '4:59:10 PM', 'Mike', '[{\"order_name\":\"Miki\",\"order_name2\":\"Pasta\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\",\"order_price\":\"150\"}]', 150, 500, 350, 'Take Out'),
(5, 100, '11/17/2024', '4:58:51 PM', 'Mike', '[{\"order_name\":\"Cheese\",\"order_name2\":\"Burger\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\",\"order_price\":\"100\"}]', 100, 500, 400, 'Take Out'),
(6, 102, '11/17/2024', '4:59:31 PM', 'Mike', '[{\"order_name\":\"Carbonara\",\"order_name2\":\"Pasta\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons\":\"Extra Cheese\",\"order_addons_price\":\"15\",\"order_addons2\":\"Bacon\",\"order_addons_price2\":\"20\",\"order_addons3\":\"Olives\",\"order_addons_price3\":\"1\"}]', 165, 500, 335, 'Take Out'),
(7, 103, '11/17/2024', '5:13:41 PM', 'Mike', '[{\"order_name\":\"Cheese\",\"order_name2\":\"Burger\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons\":\"Extra Cheese\",\"order_addons_price\":\"15\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\",\"order_price\":\"115\"}]', 115, 500, 385, 'Take Out'),
(8, 105, '11/17/2024', '5:25:39 PM', 'Mike', '[{\"order_name\":\"Cheese\",\"order_name2\":\"Burger\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons\":\"Extra Cheese\",\"order_addons_price\":\"15\",\"order_addons2\":\"Bacon\",\"order_addons_price2\":\"20\",\"order_addons3\":\"Olives\",\"order_addons_price3\":\"10\"}]', 115, 500, 385, 'Take Out'),
(9, 105, '11/17/2024', '9:51:40 PM', 'Mike', '[{\"order_name\":\"Cheese\",\"order_name2\":\"Burger\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"}]', 100, 500, 400, 'Take Out'),
(10, 105, '11/17/2024', '9:52:46 PM', 'Mike', '[{\"order_name\":\"Cheese\",\"order_name2\":\"Burger\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"}]', 100, 500, 400, 'Take Out'),
(11, 105, '11/17/2024', '10:01:22 PM', 'Mike', '[{\"order_name\":\"Cheese\",\"order_name2\":\"Burger\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"}]', 100, 500, 400, 'Take Out'),
(12, 105, '11/18/2024', '3:37:27 PM', 'Mike', '[{\"order_name\":\"Carbonara\",\"order_name2\":\"Pasta\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"}]', 150, 500, 350, 'Take Out'),
(13, 119, '11/18/2024', '6:30:27 PM', 'Mike', '[{\"order_name\":\"Americano\",\"order_name2\":\"Coffee\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"},{\"order_name\":\"Peperoni\",\"order_name2\":\"Pizza\",\"order_quantity\":\"x1\",\"order_size\":', 380, 500, 120, 'Dine In'),
(14, 1, '11/18/2024', '6:29:12 PM', 'Mike', '[{\"order_name\":\"Carbonara\",\"order_name2\":\"Pasta\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons\":\"Extra Cheese\",\"order_addons_price\":\"15\",\"order_addons2\":\"Bacon\",\"order_addons_price2\":\"20\",\"order_addons3\":\"Olives\",\"order_addons_price3\":\"10\"}]', 195, 500, 305, 'Dine In'),
(15, 1, '11/18/2024', '6:53:18 PM', 'Mike', '[{\"order_name\":\"Americano\",\"order_name2\":\"Coffee\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"},{\"order_name\":\"Carbonara\",\"order_name2\":\"Pasta\",\"order_quantity\":\"x1\",\"order_size\"', 380, 500, 120, 'Take Out'),
(16, 122, '11/18/2024', '6:57:02 PM', '', '[{\"order_name\":\"Carbonara\",\"order_name2\":\"Pasta\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"}]', 150, 500, 350, 'Take Out'),
(17, 121, '11/18/2024', '6:54:25 PM', '', '[{\"order_name\":\"Carbonara\",\"order_name2\":\"Pasta\",\"order_quantity\":\"x1\",\"order_size\":\"Regular\",\"order_addons_price\":\"0\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"}]', 150, 200, 50, 'Take Out'),
(18, 127, '11/19/2024', '3:48:51 PM', 'sample', '[{\"order_name\":\"Spanish\",\"order_name2\":\"Latte\",\"order_quantity\":\"x1\",\"order_size\":\"Large\",\"order_addons\":\"Sugar\",\"order_addons_price\":\"5\",\"order_addons_price2\":\"0\",\"order_addons_price3\":\"0\"}]', 125, 200, 75, 'Take Out');

-- --------------------------------------------------------

--
-- Table structure for table `total_sales`
--

CREATE TABLE `total_sales` (
  `total_order` int(255) NOT NULL,
  `receipt_number` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `cashier_name` varchar(255) NOT NULL,
  `items_ordered` varchar(999) NOT NULL,
  `total_amount` int(255) NOT NULL,
  `amount_paid` int(255) NOT NULL,
  `amount_change` int(255) NOT NULL,
  `order_take` varchar(255) NOT NULL,
  `table_number` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL,
  `waiter_name` varchar(255) NOT NULL,
  `service_charge` int(255) NOT NULL,
  `cashier_shift` varchar(255) NOT NULL,
  `sales_code` varchar(255) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `total_sales`
--

INSERT INTO `total_sales` (`total_order`, `receipt_number`, `date`, `time`, `cashier_name`, `items_ordered`, `total_amount`, `amount_paid`, `amount_change`, `order_take`, `table_number`, `order_status`, `waiter_name`, `service_charge`, `cashier_shift`, `sales_code`, `discount_amount`) VALUES
(524, '675', '2025-05-20', '09:35:11', 'Michael', '[{\"order_name\":\"Kangkong Chips w\\/ Pinakurat\",\"order_quantity\":\"x1\",\"basePrice\":180}]', 180, 300, 120, 'Dine In', 5, 'pending', 'Michael', 9, 'Default Shift', 'DEFAULT001', 0.00),
(525, '676', '2025-05-20', '10:30:49', 'Michael', '[{\"order_name\":\"Pork Chips with Pinakurat Sauce\",\"order_quantity\":\"x1\",\"basePrice\":200}]', 170, 200, 30, 'Dine In', 3, 'pending', 'Michael', 10, 'Default Shift', 'DEFAULT001', 0.00),
(526, '677', '2025-05-20', '11:20:29', 'Michael', '[{\"order_name\":\"Pork Chips with Pinakurat Sauce\",\"order_quantity\":\"x1\",\"basePrice\":200},{\"order_name\":\"Kangkong Chips w\\/ Pinakurat\",\"order_quantity\":\"x1\",\"basePrice\":180}]', 399, 400, 1, 'Dine In', 3, 'pending', 'Michael', 19, 'Default Shift', 'DEFAULT001', 0.00),
(527, '679', '2025-05-20', '11:48:09', 'Michael', '[{\"order_name\":\"Nachos\",\"order_quantity\":\"x1\",\"basePrice\":300}]', 300, 300, 0, 'Dine In', 4, 'pending', 'Michael', 15, 'Default Shift', 'DEFAULT001', 0.00),
(528, '678', '2025-05-20', '11:48:20', 'Michael', '[{\"order_name\":\"Pork Chips with Pinakurat Sauce\",\"order_quantity\":\"x1\",\"basePrice\":200}]', 200, 200, 0, 'Dine In', 12, 'pending', 'Michael', 10, 'Default Shift', 'DEFAULT001', 0.00),
(529, '680', '2025-05-20', '11:50:49', 'Michael', '[{\"order_name\":\"Pork Chips with Pinakurat Sauce\",\"order_quantity\":\"x1\",\"basePrice\":200}]', 200, 200, 0, 'Dine In', 0, 'pending', 'Michael', 10, 'Default Shift', 'DEFAULT001', 0.00),
(530, '681', '2025-05-20', '11:56:36', 'Michael', '[{\"order_name\":\"Kangkong Chips w\\/ Pinakurat\",\"order_quantity\":\"x1\",\"basePrice\":180}]', 189, 200, 11, 'Dine In', 0, 'pending', 'Michael', 9, 'Default Shift', 'DEFAULT001', 0.00),
(531, '682', '2025-05-20', '12:01:51', 'Michael', '[{\"order_name\":\"Pork Chips with Pinakurat Sauce\",\"order_quantity\":\"x1\",\"basePrice\":200,\"order_take\":\"Dine In\"}]', 200, 200, 0, 'Take Out', 0, 'pending', 'Michael', 10, 'Default Shift', 'DEFAULT001', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `user-staff`
--

CREATE TABLE `user-staff` (
  `staff_no` int(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `contactNumber` int(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `staff_token` int(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `waiter_code` varchar(10) NOT NULL,
  `order_count` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user-staff`
--

INSERT INTO `user-staff` (`staff_no`, `lastName`, `middleName`, `firstName`, `password`, `contactNumber`, `email`, `staff_token`, `avatar`, `waiter_code`, `order_count`) VALUES
(50, 'Dayandante', 'Dalaguit', 'Michael', '$2y$10$Vlblq/EqAAFbpRNYLkf9N.LSh9eYK8aKzg05mUw1gDOk8SJn9TYwS', 2147483647, 'mike@gmail.com', 50, 'default.jpg', 'MD9915', 9);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `voucher_id` int(255) NOT NULL,
  `voucher_code` varchar(255) NOT NULL,
  `voucher_discount` int(255) NOT NULL,
  `voucher_deadline` varchar(255) NOT NULL,
  `voucher_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`voucher_id`, `voucher_code`, `voucher_discount`, `voucher_deadline`, `voucher_description`) VALUES
(8, 'DSCNT', 5, '2042-12-10', 'Student/PWD/Senior Discount'),
(9, 'OPENING', 10, '2025-04-12', 'Soft Opening');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_no`);

--
-- Indexes for table `pos-menu`
--
ALTER TABLE `pos-menu`
  ADD PRIMARY KEY (`menu_no`);

--
-- Indexes for table `que_orders`
--
ALTER TABLE `que_orders`
  ADD PRIMARY KEY (`que_order_no`);

--
-- Indexes for table `remit_returns`
--
ALTER TABLE `remit_returns`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `remit_sales`
--
ALTER TABLE `remit_sales`
  ADD PRIMARY KEY (`remit_id`);

--
-- Indexes for table `reserve_table`
--
ALTER TABLE `reserve_table`
  ADD PRIMARY KEY (`reserve_no`);

--
-- Indexes for table `return-orders`
--
ALTER TABLE `return-orders`
  ADD PRIMARY KEY (`return_id`);

--
-- Indexes for table `total_sales`
--
ALTER TABLE `total_sales`
  ADD PRIMARY KEY (`total_order`);

--
-- Indexes for table `user-staff`
--
ALTER TABLE `user-staff`
  ADD PRIMARY KEY (`staff_no`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2771;

--
-- AUTO_INCREMENT for table `pos-menu`
--
ALTER TABLE `pos-menu`
  MODIFY `menu_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=365;

--
-- AUTO_INCREMENT for table `que_orders`
--
ALTER TABLE `que_orders`
  MODIFY `que_order_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=684;

--
-- AUTO_INCREMENT for table `remit_returns`
--
ALTER TABLE `remit_returns`
  MODIFY `return_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `remit_sales`
--
ALTER TABLE `remit_sales`
  MODIFY `remit_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `reserve_table`
--
ALTER TABLE `reserve_table`
  MODIFY `reserve_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `return-orders`
--
ALTER TABLE `return-orders`
  MODIFY `return_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `total_sales`
--
ALTER TABLE `total_sales`
  MODIFY `total_order` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;

--
-- AUTO_INCREMENT for table `user-staff`
--
ALTER TABLE `user-staff`
  MODIFY `staff_no` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `voucher_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
