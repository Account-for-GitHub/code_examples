-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 25, 2018 at 10:31 PM
-- Server version: 5.5.49
-- PHP Version: 7.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2_test`
--
CREATE DATABASE IF NOT EXISTS `yii2_test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `yii2_test`;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `img` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `date_from` varchar(11) NOT NULL,
  `date_to` varchar(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `img`, `text`, `date_from`, `date_to`, `status`) VALUES
(1, 'Заявка 1', '../img/img1.jpg', '<p><strong>Cubilia turpis sem non aliquet?</strong> <em>Adipiscing, mollis velit semper. Blandit sodales erat integer neque curabitur iaculis mus vel proin enim. <strong>Mattis neque nullam maecenas quisque natoque elementum ut</strong></em></p>\r\n', '25-07-2018', '27-07-2018', 1),
(2, 'Заявка 2', '../img/img2.jpg', '<p><strong>Cubilia turpis sem non aliquet?</strong> <em>Adipiscing, mollis velit semper. Blandit sodales erat integer neque curabitur iaculis mus vel proin enim. <strong>Mattis neque nullam maecenas quisque natoque elementum ut</strong></em></p>\r\n', '25-07-2018', '31-07-2018', 2),
(3, 'Заявка 3', '../img/img3.jpg', '<p><strong>Cubilia turpis sem non aliquet?</strong> <em>Adipiscing, mollis velit semper. Blandit sodales erat integer neque curabitur iaculis mus vel proin enim. <strong>Mattis neque nullam maecenas quisque natoque elementum ut</strong></em></p>\r\n', '25-07-2018', '30-07-2018', 3),
(4, 'Заявка 4', '../img/img1.jpg', '<p><strong>Cubilia turpis sem non aliquet?</strong> <em>Adipiscing, mollis velit semper. Blandit sodales erat integer neque curabitur iaculis mus vel proin enim. <strong>Mattis neque nullam maecenas quisque natoque elementum ut</strong></em></p>\r\n', '25-07-2018', '29-07-2018', 4),
(5, 'Заявка 5', '../img/img3.jpg', '<p><strong>Cubilia turpis sem non aliquet?</strong> <em>Adipiscing, mollis velit semper. Blandit sodales erat integer neque curabitur iaculis mus vel proin enim. <strong>Mattis neque nullam maecenas quisque natoque elementum ut</strong></em></p>\r\n', '25-07-2018', '28-07-2018', 5),
(6, 'Заявка 6', '../img/img2.jpg', '<p><strong>Cubilia turpis sem non aliquet?</strong> <em>Adipiscing, mollis velit semper. Blandit sodales erat integer neque curabitur iaculis mus vel proin enim. <strong>Mattis neque nullam maecenas quisque natoque elementum ut</strong></em></p>\r\n', '25-07-2018', '27-07-2018', 6),
(7, 'Заявка 7', '../img/img1.jpg', '<p><strong>Cubilia turpis sem non aliquet?</strong> <em>Adipiscing, mollis velit semper. Blandit sodales erat integer neque curabitur iaculis mus vel proin enim. <strong>Mattis neque nullam maecenas quisque natoque elementum ut</strong></em></p>\r\n', '25-07-2018', '26-07-2018', 7),
(8, 'Заявка 8', '../img/img3.jpg', '<p><strong>Cubilia turpis sem non aliquet?</strong> <em>Adipiscing, mollis velit semper. Blandit sodales erat integer neque curabitur iaculis mus vel proin enim. <strong>Mattis neque nullam maecenas quisque natoque elementum ut</strong></em></p>\r\n', '25-07-2018', '25-07-2018', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
