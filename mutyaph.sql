-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2023 at 07:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mutyaph`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'DEVELOPMENT', 'no-avatar.jpg', 'admin', 'admin', NULL, NULL, NULL, '2023-02-19 07:36:32', '2023-12-03 13:45:38');

-- --------------------------------------------------------

--
-- Table structure for table `arrangements`
--

CREATE TABLE `arrangements` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `competition_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `competition_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'pre-judging', 'Pre-Judging', '2023-12-03 02:34:07', '2023-12-03 04:20:31'),
(2, 1, 'grand-coronation', 'Grand Coronation', '2023-12-03 02:34:44', '2023-12-03 04:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE `competitions` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 'mutyaph-2023', 'Mutya ng Pilipinas - Bicol 2023', '2023-07-25 02:43:15', '2023-12-03 02:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `criteria`
--

CREATE TABLE `criteria` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `percentage` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criteria`
--

INSERT INTO `criteria` (`id`, `event_id`, `title`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 3, 'Beauty', 50, '2023-12-03 02:43:28', '2023-12-03 04:21:04'),
(2, 3, 'Elegance', 50, '2023-12-03 02:43:39', '2023-12-03 04:21:11'),
(3, 4, 'Beauty', 50, '2023-12-03 02:43:49', '2023-12-03 04:21:15'),
(4, 4, 'Elegance', 50, '2023-12-03 02:45:37', '2023-12-03 04:21:21'),
(5, 5, 'Intelligence', 100, '2023-12-03 02:46:11', '2023-12-03 04:21:28'),
(6, 1, 'Total', 100, '2023-12-03 04:18:20', '2023-12-03 04:21:32'),
(7, 2, 'Total', 100, '2023-12-03 04:18:32', '2023-12-03 04:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eliminations`
--

CREATE TABLE `eliminations` (
  `id` mediumint(9) NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `category_id` tinyint(3) UNSIGNED NOT NULL,
  `slug` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `slug`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 'online-voting', 'Online Voting', '2023-12-03 02:35:16', '2023-12-03 04:21:48'),
(2, 1, 'pre-qa', 'Pre Q&A', '2023-12-03 02:35:34', '2023-12-03 07:25:15'),
(3, 2, 'swimsuit', 'Swimsuit', '2023-12-03 02:35:48', '2023-12-03 04:21:58'),
(4, 2, 'evening-gown', 'Evening Gown', '2023-12-03 02:36:05', '2023-12-03 04:22:01'),
(5, 2, 'final-qa', 'Final Q&A', '2023-12-03 02:37:39', '2023-12-03 07:28:16');

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judges`
--

INSERT INTO `judges` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 101, 'Pre Q&A', 'no-avatar.jpg', 'pre02', 'pre02', NULL, NULL, NULL, '2023-04-06 13:58:11', '2023-12-03 13:49:21'),
(2, 102, 'Online Voting', 'no-avatar.jpg', 'pre01', 'pre01', NULL, NULL, NULL, '2023-04-06 13:58:28', '2023-12-03 13:49:24'),
(3, 1, 'Judge 01', 'no-avatar.jpg', 'pageant01', 'pageant01', NULL, NULL, NULL, '2023-04-06 13:58:42', '2023-12-03 13:49:27'),
(4, 2, 'Judge 02', 'no-avatar.jpg', 'pageant02', 'pageant02', NULL, NULL, NULL, '2023-12-03 07:26:34', '2023-12-03 08:31:50'),
(5, 3, 'Judge 03', 'no-avatar.jpg', 'pageant03', 'pageant03', NULL, NULL, NULL, '2023-12-03 07:27:07', '2023-12-03 13:49:40'),
(6, 4, 'Judge 04', 'no-avatar.jpg', 'pageant04', 'pageant04', NULL, NULL, NULL, '2023-12-06 13:48:50', '2023-12-06 13:48:50'),
(7, 5, 'Judge 05', 'no-avatar.jpg', 'pageant05', 'pageant05', NULL, NULL, NULL, '2023-12-06 13:49:35', '2023-12-06 13:49:46'),
(8, 6, 'Judge 06', 'no-avatar.jpg', 'pageant06', 'pageant06', NULL, NULL, NULL, '2023-12-06 13:50:11', '2023-12-06 13:50:11'),
(9, 7, 'Judge 07', 'no-avatar.jpg', 'pageant07', 'pageant07', NULL, NULL, NULL, '2023-12-06 13:50:48', '2023-12-06 13:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `judge_event`
--

CREATE TABLE `judge_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `is_chairman` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judge_event`
--

INSERT INTO `judge_event` (`id`, `judge_id`, `event_id`, `is_chairman`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 0, '2023-12-03 06:50:43', '2023-12-03 13:46:53'),
(2, 3, 4, 0, '2023-12-03 06:50:46', '2023-12-03 13:47:06'),
(3, 3, 5, 0, '2023-12-03 06:50:50', '2023-12-03 13:47:12'),
(4, 4, 3, 0, '2023-12-03 07:27:43', '2023-12-03 13:47:14'),
(5, 4, 4, 0, '2023-12-03 07:27:48', '2023-12-03 13:47:18'),
(6, 4, 5, 0, '2023-12-03 07:27:53', '2023-12-03 13:47:20'),
(7, 5, 3, 0, '2023-12-03 07:28:44', '2023-12-03 13:47:22'),
(8, 5, 4, 0, '2023-12-03 07:28:49', '2023-12-03 13:47:24'),
(9, 5, 5, 0, '2023-12-03 07:28:53', '2023-12-03 13:47:26'),
(10, 1, 2, 0, '2023-12-03 07:32:31', '2023-12-03 13:47:29'),
(11, 2, 1, 0, '2023-12-03 07:32:40', '2023-12-03 13:47:31'),
(12, 6, 3, 0, '2023-12-06 14:06:57', '2023-12-06 14:06:57'),
(13, 6, 4, 0, '2023-12-06 14:07:04', '2023-12-06 14:07:04'),
(14, 6, 5, 0, '2023-12-06 14:07:09', '2023-12-06 14:07:09'),
(15, 7, 3, 0, '2023-12-06 14:07:23', '2023-12-06 14:07:23'),
(16, 7, 4, 0, '2023-12-06 14:07:27', '2023-12-06 14:07:27'),
(17, 7, 5, 0, '2023-12-06 14:07:31', '2023-12-06 14:07:31'),
(18, 8, 3, 0, '2023-12-06 14:07:40', '2023-12-06 14:07:40'),
(19, 8, 4, 0, '2023-12-06 14:07:43', '2023-12-06 14:07:43'),
(20, 8, 5, 0, '2023-12-06 14:07:47', '2023-12-06 14:07:47'),
(21, 9, 3, 0, '2023-12-06 14:09:11', '2023-12-06 14:09:11'),
(22, 9, 4, 0, '2023-12-06 14:09:17', '2023-12-06 14:09:17'),
(23, 9, 5, 0, '2023-12-06 14:09:29', '2023-12-06 14:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `noshows`
--

CREATE TABLE `noshows` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `number` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `judge_id` tinyint(3) UNSIGNED NOT NULL,
  `criteria_id` smallint(5) UNSIGNED NOT NULL,
  `team_id` tinyint(3) UNSIGNED NOT NULL,
  `value` float UNSIGNED NOT NULL DEFAULT 0,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `location` varchar(32) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `number`, `name`, `location`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ericka Bermas', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:43:44', '2023-12-03 13:52:56'),
(2, 2, 'Andrea Ropeta', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:44:03', '2023-12-03 13:53:06'),
(3, 3, 'Kristel Olive Rejesus', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:44:21', '2023-12-03 13:53:14'),
(4, 4, 'Abegail Pahingalo', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:44:38', '2023-12-03 13:53:18'),
(5, 5, 'Jill Lorraine Laniog', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:44:52', '2023-12-03 13:53:24'),
(6, 6, 'Ashley Hamer', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:45:06', '2023-12-03 13:53:28'),
(7, 7, 'Sheena Magistrado', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:45:18', '2023-12-03 13:53:33'),
(8, 8, 'Judy Estefani', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:45:33', '2023-12-03 13:53:37'),
(9, 9, 'Zandra Nicole Liwanag', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:45:53', '2023-12-03 14:05:31'),
(10, 10, 'Paula Ericka De Jesus', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:46:13', '2023-12-03 14:05:35'),
(11, 11, 'Shaina Rabacal', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:46:28', '2023-12-03 14:05:38'),
(12, 12, 'Marivel Melor', 'Bicol', 'no-avatar.jpg', '2023-12-03 06:46:58', '2023-12-03 14:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `technicals`
--

CREATE TABLE `technicals` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `number` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active_portion` varchar(255) DEFAULT NULL,
  `called_at` timestamp NULL DEFAULT NULL,
  `pinged_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technicals`
--

INSERT INTO `technicals` (`id`, `number`, `name`, `avatar`, `username`, `password`, `active_portion`, `called_at`, `pinged_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Technical 01', 'no-avatar.jpg', 'technical01', 'technical01', NULL, NULL, NULL, '2023-02-19 08:58:58', '2023-04-06 14:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `technical_event`
--

CREATE TABLE `technical_event` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `technical_id` tinyint(3) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `event_id` smallint(5) UNSIGNED NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `event_id`, `rank`, `title`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(2, 1, 2, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(3, 1, 3, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(4, 1, 4, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(5, 1, 5, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(6, 1, 6, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(7, 1, 7, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(8, 1, 8, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(9, 1, 9, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(10, 1, 10, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(11, 1, 11, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(12, 1, 12, '', '2023-12-03 06:48:04', '2023-12-03 06:48:04'),
(13, 2, 1, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(14, 2, 2, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(15, 2, 3, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(16, 2, 4, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(17, 2, 5, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(18, 2, 6, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(19, 2, 7, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(20, 2, 8, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(21, 2, 9, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(22, 2, 10, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(23, 2, 11, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(24, 2, 12, '', '2023-12-03 06:48:06', '2023-12-03 06:48:06'),
(25, 3, 1, 'Best in Swimsuit', '2023-12-03 06:48:07', '2023-12-03 13:43:58'),
(26, 3, 2, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(27, 3, 3, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(28, 3, 4, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(29, 3, 5, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(30, 3, 6, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(31, 3, 7, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(32, 3, 8, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(33, 3, 9, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(34, 3, 10, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(35, 3, 11, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(36, 3, 12, '', '2023-12-03 06:48:07', '2023-12-03 06:48:07'),
(37, 4, 1, 'Best in Evening Gown', '2023-12-03 06:48:09', '2023-12-03 13:44:20'),
(38, 4, 2, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(39, 4, 3, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(40, 4, 4, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(41, 4, 5, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(42, 4, 6, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(43, 4, 7, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(44, 4, 8, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(45, 4, 9, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(46, 4, 10, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(47, 4, 11, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(48, 4, 12, '', '2023-12-03 06:48:09', '2023-12-03 06:48:09'),
(49, 5, 1, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(50, 5, 2, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(51, 5, 3, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(52, 5, 4, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(53, 5, 5, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(54, 5, 6, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(55, 5, 7, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(56, 5, 8, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(57, 5, 9, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(58, 5, 10, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(59, 5, 11, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10'),
(60, 5, 12, '', '2023-12-03 06:48:10', '2023-12-03 06:48:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_id` (`category_id`);

--
-- Indexes for table `judges`
--
ALTER TABLE `judges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `noshows`
--
ALTER TABLE `noshows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`judge_id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `criteria_id` (`criteria_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technicals`
--
ALTER TABLE `technicals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `judge_id` (`technical_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `arrangements`
--
ALTER TABLE `arrangements`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eliminations`
--
ALTER TABLE `eliminations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `judges`
--
ALTER TABLE `judges`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `judge_event`
--
ALTER TABLE `judge_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `noshows`
--
ALTER TABLE `noshows`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `technicals`
--
ALTER TABLE `technicals`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technical_event`
--
ALTER TABLE `technical_event`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `arrangements`
--
ALTER TABLE `arrangements`
  ADD CONSTRAINT `arrangements_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `arrangements_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `criteria`
--
ALTER TABLE `criteria`
  ADD CONSTRAINT `criteria_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `deductions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `deductions_ibfk_3` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `eliminations`
--
ALTER TABLE `eliminations`
  ADD CONSTRAINT `eliminations_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eliminations_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `judge_event`
--
ALTER TABLE `judge_event`
  ADD CONSTRAINT `judge_event_ibfk_1` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `judge_event_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `noshows`
--
ALTER TABLE `noshows`
  ADD CONSTRAINT `noshows_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `noshows_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participants_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`judge_id`) REFERENCES `judges` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `technical_event`
--
ALTER TABLE `technical_event`
  ADD CONSTRAINT `technical_event_ibfk_2` FOREIGN KEY (`technical_id`) REFERENCES `technicals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technical_event_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `titles_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
