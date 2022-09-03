-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2022 at 06:08 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugas`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2b$10$kY/yuNYrJANs4D8uuCgg2OFK35u0S4hxIIDSpNcNF9sxri8vT0D5m', '2022-09-03 14:53:02', '2022-09-03 14:53:02'),
(2, 'user', '$2b$10$Z3QG3qBFWqN65BkoA1yXKutkKMIwoBjqGOx0PScPfD5LgGxjbJMsi', '2022-09-03 15:42:16', '2022-09-03 15:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `d_artikel`
--

CREATE TABLE `d_artikel` (
  `id` int(11) NOT NULL,
  `title` varchar(75) NOT NULL,
  `description` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `d_artikel`
--

INSERT INTO `d_artikel` (`id`, `title`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'ini edit 1', 'semoga berhasil', 1, '2022-09-03 15:22:48', '2022-09-03 15:24:32'),
(2, 'ini edit 2 ', 'semoga berhasil', 1, '2022-09-03 15:25:16', '2022-09-03 15:39:32'),
(3, 'ini test 3', 'semoga berhasil', 1, '2022-09-03 15:37:28', '2022-09-03 15:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `d_comment_artikel`
--

CREATE TABLE `d_comment_artikel` (
  `id` int(11) NOT NULL,
  `artikel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `d_comment_artikel`
--

INSERT INTO `d_comment_artikel` (`id`, `artikel_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'ini komentar', '2022-09-03 15:50:40', '2022-09-03 15:50:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_artikel`
--
ALTER TABLE `d_artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_comment_artikel`
--
ALTER TABLE `d_comment_artikel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artikel_id` (`artikel_id`) USING BTREE,
  ADD KEY `artikel_id_2` (`artikel_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `d_artikel`
--
ALTER TABLE `d_artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `d_comment_artikel`
--
ALTER TABLE `d_comment_artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `d_comment_artikel`
--
ALTER TABLE `d_comment_artikel`
  ADD CONSTRAINT `d_comment_artikel_ibfk_1` FOREIGN KEY (`artikel_id`) REFERENCES `d_artikel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `d_comment_artikel_ibfk_2` FOREIGN KEY (`artikel_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
