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
(2, '?????'),
(3, 'v??ng'),
(4, 'tr???ng'),
(5, '??en'),
(6, 'h???ng'),
(7, 'x??m');

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
(4, 7, 14, 'S???n ph???m c???a b???n c?? ch???t l?????ng r???t t???t', 3, '2021-05-17 08:00:57'),
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
(1, 11, 100, '2021-01-01 07:07:39', 1, 'Giao h??ng s???m s???m ??n t???t!!'),
(2, 5, 200, '2021-02-03 07:07:39', 1, 'T??? h???n giao h??ng. Em ??ang h???t ti???n!!!\r\n'),
(3, 11, 115, '2021-03-23 07:09:23', 1, 'Giao s???m ????? em t???ng qu?? sinh nh???t b???n'),
(4, 5, 40, '2021-04-28 07:09:59', 1, 'Th??ch giao l??c n??o th?? giao!!!\r\n'),
(6, 11, 270, '2021-07-02 07:09:59', 1, 'Giao s???m cho em ??i ??n sinh nh???t!!!'),
(8, 8, 80, '2021-08-15 07:11:19', 1, 'Giao l??? l??? coi'),
(10, 7, 120, '2021-06-30 07:11:19', 1, 'Giao h??ng v??o l??c 5h-23h '),
(11, 11, 99, '2021-09-02 07:12:41', 1, 'Giao h??ng cho t??i c??n ??i ch??i l???'),
(13, 12, 200, '2021-10-03 07:12:41', 1, 'Giao h??ng l??? l??? m???y cha n???i'),
(15, 11, 123, '2021-12-24 07:14:02', 1, 'Giao l??? cho em ??i ch??i gi??ng sinh\r\n'),
(17, 5, 230, '2021-11-15 07:14:02', 1, 'Em ??ang h???t ti???n!!!'),
(22, 1, 100, '2022-01-01 08:36:58', 1, 'Giao h??ng l??? l??? ??i'),
(42, 7, 90, '2021-05-19 15:04:32', 0, ''),
(43, 7, 51, '2021-05-19 15:06:58', 0, ''),
(44, 7, 100, '2021-05-20 12:37:28', 0, ''),
(45, 13, 70, '2021-05-25 12:59:09', 1, 'Giao s???m d??m em c??i'),
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
(10, 'Gi??y adidas T', 10, 100, 'heooooooooo<3', 7, '1,3,7', '1,4,7', '1,2,3,4,'),
(11, 'Gi??y Santiago', 10, 100000, 'mo ta ne<3', 7, '1,2,3,4,5,6', '1,2,3,4', '1,2,3,4'),
(13, 'Gi??y Tadisa', 20, 100, 'no name', 5, '1,2,3,4,5', '1,2,3,4,5', '1,2,3,4'),
(14, 'Gi??y luffy ', 12, 200, '????y l?? ????i gi??y t???ng ???????c s??? h???u b???i luffy m?? r??m.', 6, '1,3,6', '1,2,3,4,5', '60,61,62,63'),
(15, 'Gi??y Ace', 35, 200, '????y l?? ????i gi??y ?????u ti??n c???a h???a quy???n ace khi ?????n ?????i h???i tr??nh chinh ph???c one piece', 5, '1,3,7', '5,6,7', '64,65,66,67,'),
(16, 'Gi??y Titikaka', 12, 100, '????y l?? ????i gi??y ???????c messi mang khi ???? tr???n ?????u ?????u ti??n cho barca', 6, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(17, 'Gi??y zoro', 17, 100, '????i gi??y ???? t???ng ???????c mang b??i ronooa zoro khi l???n ?????u c??ng luffy ra kh??i tr??n con ???????ng tr??? th??nh pirate king.', 6, '1,2,3', '1,2,3,4,5', '61,62,63,64'),
(18, 'Gi??y Brook', 11, 100, '????i gi??y ???????c Brook mang t??? nhi???u n??m v??? tr?????c t???i khi gia nh???p b??ng m?? r??m. M???c d?? Brook ???? th??nh b??? x????ng nh??ng ????i gi??y c???a ??ng ???y v???n c??n nguy??n ?????n b??y gi???.', 5, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(19, 'Gi??y Sanj', 3, 100, '????i gi??y ???????c trang b??? thi???t b??? t??ng t???c c???a vinsmoke sanj v???i gi?? kh???i ??i???m ng???t ng??i v?? trang b??? hi???n ?????i c???a qu??n ??o??n chi???n binh Germa.', 6, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(20, 'Gi??y Franky', 11, 100, '????i gi??y ???????c Franky ch??? t???o ho??n to??n b???ng m??y m??c khi l???n ?????u l??n t??u. ????i gi??y c???a anh ta ???? tr???i qua v?? s??? v??ng ?????t tr??n con ???????ng c??ng b??ng m?? r??m chinh ph???c one piece', 6, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(21, 'Gi??y Nami', 11, 100, '????i gi??y ???????c c?? n??ng mi??u t???c ??n tr???m t??? thi??n long nh??n v???i ch???t l?????ng ho??n h???o v?? v?? c??ng qu?? hi???m', 5, '1,2,3', '1,2,3,4,5', '61,62,63,64'),
(22, 'Gi??y Robin', 12, 100, '????i gi??y ???????c Zoro t???ng khi c?? m???i l??n t??u v?? ???? c??ng c?? tr??n su???t chuy???n h??nh tr??nh c???a b??ng m?? r??m.', 6, '1,2,3', '1,2,3,4,5', '61,62,63,64'),
(23, 'Gi??y Chopper', 7, 100, '????i gi??y c???a chopper ???????c l??m t??? m??ng c???a ch???n v???i ch???t li???u v?? c??ng c???ng v?? b???n b???.', 5, '1,2,3,4,5', '1,2,3,4,5', '61,62,63,64'),
(24, 'Gi??y Shank', 25, 100000, '????i gi??y ???????c shank mang khi l???n ?????u l??n t??? ho??ng', 5, '1,4,7', '1,5,8', '68,69,70,71'),
(25, 'Gi??y kaido', 1, 100, '????y l?? gi??y kaido khi ?????m luffy bay xu???ng bi???n', 6, '1,2,3,4,5,6,7', '1,2,3,4,5,6,7,8', '72,73,74,75,76,77');

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
(7, 'user', '$2a$10$xgMWL9KSNmZitcUeM/AYluc19AJnCnRu4CzTh8GHLeXKNkyB9KSey', '87/5 ???p B??nh Ph?????c B, B??nh Chu???n , Thu???n An, B??nh D????ng', '0898325907', 'Nguy???n Thanh Tu???n', 'Nam', 1, 3),
(8, 'mod', '$2a$10$judMhDtLUGukWWCH9Vi3E.h6iY7qu72BusMTwf41ViWQRM7oYyWZ2', NULL, NULL, 'Nguy???n Thanh Tu???n', NULL, 1, 2),
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
