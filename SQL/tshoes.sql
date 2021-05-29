-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2021 at 06:30 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tshoes`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `order_id`, `color_id`, `size_id`, `product_id`, `number`) VALUES
(98, 42, 1, 5, 15, 2),
(99, 42, 1, 1, 13, 1),
(100, 43, 1, 1, 13, 2),
(101, 43, 1, 1, 18, 1),
(102, 44, 2, 1, 11, 3),
(103, 44, 1, 5, 15, 1),
(104, 44, 1, 6, 15, 1),
(105, 45, 1, 5, 15, 2),
(106, 46, 1, 1, 11, 2),
(107, 47, 1, 5, 15, 2),
(108, 48, 2, 3, 11, 3);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`) VALUES
(1, 0, 'Men'),
(2, 0, 'Women'),
(3, 1, 'Sport'),
(4, 1, 'Office'),
(5, 2, 'Adidas'),
(6, 2, 'Nike'),
(7, 2, 'heoo'),
(8, 2, 'New'),
(9, 2, 'Sale'),
(10, 2, 'hand made'),
(11, 2, 'Second hand');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`) VALUES
(1, 'xanh'),
(2, 'đỏ'),
(3, 'vàng'),
(4, 'trắng'),
(5, 'đen'),
(6, 'hồng'),
(7, 'xám');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `rate` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `product_id`, `content`, `rate`, `date`) VALUES
(1, 7, 10, 'this is comment ', 5, '2021-05-17 07:19:38'),
(2, 5, 14, 'this is comment too', 4, '2021-05-17 07:19:59'),
(3, 7, 14, 'heooo', 5, '2021-05-17 07:49:11'),
(4, 7, 14, 'Sản phẩm của bạn có chất lượng rất tốt', 3, '2021-05-17 08:00:57'),
(5, 7, 11, 'heoo', 5, '2021-05-17 10:16:26'),
(6, 7, 11, 'very good!', 5, '2021-05-17 16:09:46'),
(7, 7, 11, 'nice', 4, '2021-05-18 04:28:28'),
(8, 7, 11, 'this so bad!!!', 1, '2021-05-19 14:46:39'),
(9, 7, 15, 'This product is so great!!!', 4, '2021-05-19 16:12:37'),
(10, 7, 15, 'very nice!!!', 5, '2021-05-20 12:39:40'),
(11, 13, 18, 'very nice!!!', 5, '2021-05-25 12:58:42'),
(12, 16, 21, 'very nice!!!', 5, '2021-05-28 09:13:28');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `name`) VALUES
(1, 'product1.jpg'),
(2, 'product2.jpg'),
(3, 'product3.jpg'),
(4, 'product4.jpg'),
(17, 'img-pro-01.jpg'),
(18, 'img-pro-02.jpg'),
(19, 'img-pro-03.jpg'),
(20, 'img-pro-04.jpg'),
(21, 'img-pro-01.jpg'),
(22, 'img-pro-02.jpg'),
(23, 'img-pro-03.jpg'),
(24, 'img-pro-04.jpg'),
(60, 'product3-13560954660033.jpg'),
(61, 'product4-13561026077277.jpg'),
(62, 'product5-13561246926865.jpg'),
(63, 'product6-13561302287085.jpg'),
(64, 'product3-113050621569107.jpg'),
(65, 'product4-113050929813671.jpg'),
(66, 'product5-113050979032530.jpg'),
(67, 'product6-113051203938097.jpg'),
(68, 'product1-245279227098765.jpg'),
(69, 'product2-245279337178367.jpg'),
(70, 'product5-245279375309899.jpg'),
(71, 'product6-245279415757892.jpg'),
(72, 'product1-128663516838383.jpg'),
(73, 'product2-128663593379581.jpg'),
(74, 'product3-128663731596262.jpg'),
(75, 'product4-128663791555642.jpg'),
(76, 'product5-128663852655692.jpg'),
(77, 'product6-128663902384910.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `date`, `status`, `note`) VALUES
(1, 11, 100, '2021-01-01 07:07:39', 1, 'Giao hàng sớm sớm ăn tết!!'),
(2, 5, 200, '2021-02-03 07:07:39', 1, 'Từ hẳn giao hàng. Em đang hết tiền!!!\r\n'),
(3, 11, 115, '2021-03-23 07:09:23', 1, 'Giao sớm để em tặng quà sinh nhật bạn'),
(4, 5, 40, '2021-04-28 07:09:59', 1, 'Thích giao lúc nào thì giao!!!\r\n'),
(6, 11, 270, '2021-07-02 07:09:59', 1, 'Giao sớm cho em đi ăn sinh nhật!!!'),
(8, 8, 80, '2021-08-15 07:11:19', 1, 'Giao lẹ lẹ coi'),
(10, 7, 120, '2021-06-30 07:11:19', 1, 'Giao hàng vào lúc 5h-23h '),
(11, 11, 99, '2021-09-02 07:12:41', 1, 'Giao hàng cho tôi còn đi chơi lễ'),
(13, 12, 200, '2021-10-03 07:12:41', 1, 'Giao hàng lẹ lẹ mấy cha nội'),
(15, 11, 123, '2021-12-24 07:14:02', 1, 'Giao lẹ cho em đi chơi giáng sinh\r\n'),
(17, 5, 230, '2021-11-15 07:14:02', 1, 'Em đang hết tiền!!!'),
(22, 1, 100, '2022-01-01 08:36:58', 1, 'Giao hàng lẹ lẹ đi'),
(42, 7, 90, '2021-05-19 15:04:32', 0, ''),
(43, 7, 51, '2021-05-19 15:06:58', 0, ''),
(44, 7, 100, '2021-05-20 12:37:28', 0, ''),
(45, 13, 70, '2021-05-25 12:59:09', 1, 'Giao sớm dùm em cái'),
(46, 14, 20, '2021-05-27 09:35:21', 0, ''),
(47, 15, 70, '2021-05-27 09:41:27', 1, ''),
(48, 16, 30, '2021-05-28 09:12:06', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `number` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `color` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `number`, `description`, `cat_id`, `color`, `size`, `image`) VALUES
(10, 'Giày adidas T', 10, 100, 'heooooooooo<3', 7, '1,3,7', '1,4,7', '1,2,3,4,'),
(11, 'Giày Santiago', 10, 100000, 'mo ta ne<3', 7, '1,2,3,4,5,6', '1,2,3,4', '1,2,3,4'),
(13, 'Giày Tadisa', 20, 100, 'no name', 5, '1,2,3,4,5', '1,2,3,4,5', '1,2,3,4'),
(14, 'Giày luffy ', 12, 200, 'Đây là đôi giày từng được sở hữu bởi luffy mũ rơm.', 6, '1,3,6', '1,2,3,4,5', '60,61,62,63'),
(15, 'Giày Ace', 35, 200, 'Đây là đôi giày đầu tiên của hỏa quyền ace khi đến đại hải trình chinh phục one piece', 5, '1,3,7', '5,6,7', '64,65,66,67,'),
(16, 'Giày Titikaka', 12, 100, 'Đây là đôi giày được messi mang khi đá trận đấu đầu tiên cho barca', 6, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(17, 'Giày zoro', 17, 100, 'Đôi giày đã từng được mang bơi ronooa zoro khi lần đầu cùng luffy ra khơi trên con đường trở thành pirate king.', 6, '1,2,3', '1,2,3,4,5', '61,62,63,64'),
(18, 'Giày Brook', 11, 100, 'Đôi giày được Brook mang từ nhiều năm về trước tới khi gia nhập băng mũ rơm. Mặc dù Brook đã thành bộ xương nhưng đôi giày của ông ấy vẫn còn nguyên đến bây giờ.', 5, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(19, 'Giày Sanj', 3, 100, 'Đôi giày được trang bị thiết bị tăng tốc của vinsmoke sanj với giá khởi điểm ngất ngơi và trang bị hiện đại của quân đoàn chiến binh Germa.', 6, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(20, 'Giày Franky', 11, 100, 'Đôi giày được Franky chế tạo hoàn toàn bằng máy móc khi lần đầu lên tàu. Đôi giày của anh ta đã trải qua vô số vùng đất trên con đường cùng băng mũ rơm chinh phục one piece', 6, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(21, 'Giày Nami', 11, 100, 'Đôi giày được cô nàng miêu tặc ăn trộm từ thiên long nhân với chất lượng hoàn hảo và vô cùng quý hiếm', 5, '1,2,3', '1,2,3,4,5', '61,62,63,64'),
(22, 'Giày Robin', 12, 100, 'Đôi giày được Zoro tặng khi cô mới lên tàu và đã cùng cô trên suốt chuyến hành trình của băng mũ rơm.', 6, '1,2,3', '1,2,3,4,5', '61,62,63,64'),
(23, 'Giày Chopper', 7, 100, 'Đôi giày của chopper được làm từ móng của chồn với chất liệu vô cùng cứng và bền bỉ.', 5, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(24, 'Giày Shank', 25, 100000, 'Đôi giày được shank mang khi lần đầu lên tứ hoàng', 5, '1,4,7', '1,5,8', '68,69,70,71'),
(25, 'Giày kaido', 1, 100, 'Đây là giày kaido khi đấm luffy bay xuống biển', 6, '1,2,3,4,5,6,7', '1,2,3,4,5,6,7,8', '72,73,74,75,76,77');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_MODIFIER'),
(3, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `id` int(11) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `size`) VALUES
(1, 27),
(2, 28),
(3, 29),
(4, 30),
(5, 33),
(6, 31),
(7, 32),
(8, 34);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` int(11) NOT NULL DEFAULT 1,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `address`, `phone`, `fullname`, `gender`, `enabled`, `role_id`) VALUES
(1, 'admin', '$2a$10$judMhDtLUGukWWCH9Vi3E.h6iY7qu72BusMTwf41ViWQRM7oYyWZ2', NULL, NULL, 'admin', NULL, 1, 1),
(5, 'volekhanh', '$2a$10$fpGv7mvZKlvYxNE9.d1yGuDZNjX6INyQuKz7PT9PvjUYTXXaewOMG', NULL, NULL, 'vo le khanh', NULL, 1, 2),
(7, 'user', '$2a$10$xgMWL9KSNmZitcUeM/AYluc19AJnCnRu4CzTh8GHLeXKNkyB9KSey', '87/5 Ấp Bình Phước B, Bình Chuẩn , Thuận An, Bình Dương', '0898325907', 'Nguyễn Thanh Tuấn', 'Nam', 1, 3),
(8, 'mod', '$2a$10$judMhDtLUGukWWCH9Vi3E.h6iY7qu72BusMTwf41ViWQRM7oYyWZ2', NULL, NULL, 'Nguyễn Thanh Tuấn', NULL, 1, 2),
(9, 'a', '$2a$10$sUviNYZX0tJWgugO3OhbieWNl7kQyoUltaYLph3jRbkB7B0CS3hLW', NULL, NULL, 'a', NULL, 1, 1),
(11, 'heo', '$2a$10$Fr1PQgxpIdMcCByb7/2PnuWQGsLLh8ixa6Y7M3xjD8hvThp9Hmbye', '320 Dien Bien Phu street, Thanh Khe district', '0898325907', 'Trey Nguyen', NULL, 1, 3),
(12, 'customer', '$2a$10$3HIhANZ.M.Olc0uZM1J5.uFwd38/GOaLIQANYFZtZ.obAcBKKpfRC', '320 Dien Bien Phu street, Thanh Khe district', '0898325907', 'Trey Nguyen', NULL, 1, 3),
(13, 'tuan', '$2a$10$ZX9FqvCZ44kpTjIO/R5gz.u2BPRoCznTOLKfLye.lthCXJnJYImWK', '320 Dien Bien Phu street, Thanh Khe district', '0898325907', 'Jenna Nguyen', NULL, 1, 3),
(14, 'newbie', '$2a$10$3Cu950cKOeQ2iU4oKbVNwuURMVbOcqNjRr3fVEtRQuoKEmp7i3Bo6', NULL, NULL, 'Nguyen Thanh Tuan', NULL, 1, 3),
(15, 'heo27', '$2a$10$D4UUWAwSxfcFPBc5siBVturQz5tW6pj0LtmxmS23RtD5igvE8SGRa', '320 Dien Bien Phu street, Thanh Khe district', '0898325907', 'Vo Le Khanh', NULL, 1, 3),
(16, 'test', '$2a$10$AwQpll/aEAZOrY6/GmfdfeUU29Mn4GFxzpXjsAfB69Sll2BXmWZ0K', '320 Dien Bien Phu street, Thanh Khe district', '0898325907', 'Nguyen Thanh Tuan', NULL, 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`,`color_id`,`size_id`,`product_id`),
  ADD KEY `size_id` (`size_id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
