-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 27, 2023 at 08:55 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docuhub__1_`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `logo` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `prefix`, `logo`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BellMedEx', 'bme', NULL, 1, '2023-01-04 17:26:24', '2023-02-17 21:32:39', NULL),
(4, 'Best Medical Billing', 'bmb', NULL, 1, '2023-01-19 18:39:09', '2023-02-17 21:33:35', NULL),
(5, 'Test', 'test', NULL, 1, '2023-01-22 17:33:56', '2023-02-17 21:33:20', NULL),
(6, 'New Test Company', 'new', NULL, 1, '2023-02-16 21:08:10', '2023-02-17 21:33:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(150) NOT NULL,
  `description` tinytext,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `company_id`, `parent_id`, `name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'Billing', NULL, 1, '2023-01-25 17:10:51', '2023-02-17 21:32:05', NULL),
(2, 1, 1, 'Claim Submission', NULL, 1, '2023-01-25 17:10:51', '2023-02-17 21:31:47', NULL),
(3, 6, 0, 'ABC', NULL, 1, '2023-02-21 20:53:42', '2023-02-21 20:53:42', NULL),
(4, 6, 3, 'XYZ', NULL, 1, '2023-02-23 19:32:09', '2023-02-23 19:32:09', NULL),
(5, 6, 0, 'DEF', NULL, 1, '2023-02-23 19:34:15', '2023-02-23 19:34:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department_user`
--

DROP TABLE IF EXISTS `department_user`;
CREATE TABLE IF NOT EXISTS `department_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department_user`
--

INSERT INTO `department_user` (`id`, `user_id`, `department_id`, `created_at`, `updated_at`) VALUES
(3, 13, 2, '2023-02-06 15:23:25', '2023-02-06 15:23:25'),
(5, 15, 3, '2023-02-22 02:03:02', '2023-02-22 02:03:02'),
(6, 17, 4, '2023-02-24 02:21:09', '2023-02-24 02:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

DROP TABLE IF EXISTS `document_types`;
CREATE TABLE IF NOT EXISTS `document_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
CREATE TABLE IF NOT EXISTS `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `practice_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(32) DEFAULT NULL,
  `name` mediumtext NOT NULL,
  `org_name` tinytext NOT NULL,
  `path` mediumtext NOT NULL,
  `ext` varchar(50) NOT NULL,
  `size` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `practice_id`, `user_id`, `status`, `name`, `org_name`, `path`, `ext`, `size`, `created_at`, `updated_at`) VALUES
(1, 3, 10, NULL, 'qjbT8BZTaBs80aDtRk1FLxHKXOGmdXnQKVA6R2gD.png', 'secretm.me-verticle-share.png', 'uploads/files/02-2023/qjbT8BZTaBs80aDtRk1FLxHKXOGmdXnQKVA6R2gD.png', 'png', '385.82 KB', '2023-02-06 20:16:08', '2023-02-06 20:16:08'),
(2, 3, 10, NULL, 'McPTd5iZYNSVvNXHxXoiMS1H0gPrugq2lfXz1qQK.png', 'screencapture-secretm-me-inbox-php-2022-09-08-21_15_52.png', 'uploads/files/02-2023/McPTd5iZYNSVvNXHxXoiMS1H0gPrugq2lfXz1qQK.png', 'png', '2.56 MB', '2023-02-06 20:16:08', '2023-02-06 20:16:08'),
(3, 3, 10, NULL, 'K2S7gNAjlvGAWZhqFq2brsnY2hZ90hd0CoM884Oh.png', 'screencapture-publishers-adsterra-stats-2022-10-06-12_35_35.png', 'uploads/files/02-2023/K2S7gNAjlvGAWZhqFq2brsnY2hZ90hd0CoM884Oh.png', 'png', '191.23 KB', '2023-02-06 20:16:08', '2023-02-06 20:16:08'),
(4, 3, 10, NULL, 'UmPHvRQg1nFiSUy8QSQIKaPZ5qGyBLwvyBUVr3De.png', 'secretm.me-verticle-share.png', 'uploads/files/02-2023/UmPHvRQg1nFiSUy8QSQIKaPZ5qGyBLwvyBUVr3De.png', 'png', '385.82 KB', '2023-02-06 20:16:18', '2023-02-06 20:16:18'),
(5, 3, 10, NULL, '8DiR6bU392EtXfnlR2iuxS5ZRw7wOSTNK0P0zZsM.png', 'screencapture-secretm-me-inbox-php-2022-09-08-21_15_52.png', 'uploads/files/02-2023/8DiR6bU392EtXfnlR2iuxS5ZRw7wOSTNK0P0zZsM.png', 'png', '2.56 MB', '2023-02-06 20:16:18', '2023-02-06 20:16:18'),
(6, 3, 10, NULL, 'VSfKIATTISBcvvDvY326lC1PIf9oVKqt0upd9MYi.png', 'screencapture-publishers-adsterra-stats-2022-10-06-12_35_35.png', 'uploads/files/02-2023/VSfKIATTISBcvvDvY326lC1PIf9oVKqt0upd9MYi.png', 'png', '191.23 KB', '2023-02-06 20:16:18', '2023-02-06 20:16:18'),
(7, 1, 10, NULL, '7iO2YMMujOSB7GwIsBOCgruGBs0TVzF309q24SGu.png', 'Web Developer Php Laravel.png', 'uploads/files/02-2023/7iO2YMMujOSB7GwIsBOCgruGBs0TVzF309q24SGu.png', 'png', '52.81 KB', '2023-02-06 20:17:47', '2023-02-06 20:17:47'),
(8, 4, 15, 'To Be Posted', 'cqDk3feTSHL8ARw3xVExMCZMNVOFYHR0jZyaUAMk.jpg', 'image004.jpg', 'uploads/files/02-2023/cqDk3feTSHL8ARw3xVExMCZMNVOFYHR0jZyaUAMk.jpg', 'jpg', '97.22 KB', '2023-02-16 21:13:24', '2023-02-23 16:51:02'),
(9, 4, 15, NULL, 'e892BTm1RqGla3X7RsDNoajOAi9G6za5WteoYtT8.jpg', '1933136_188282907860672_4388842_o.jpg', 'uploads/files/02-2023/e892BTm1RqGla3X7RsDNoajOAi9G6za5WteoYtT8.jpg', 'jpg', '408.74 KB', '2023-02-16 22:41:32', '2023-02-16 22:41:32'),
(10, 4, 15, NULL, 'SbQPg6d3akY0Kv0bprp2H3rmMQXcnlu5nlYb6xwy.jpg', 'image004.jpg', 'uploads/files/02-2023/SbQPg6d3akY0Kv0bprp2H3rmMQXcnlu5nlYb6xwy.jpg', 'jpg', '97.22 KB', '2023-02-21 22:32:24', '2023-02-21 22:32:24'),
(11, 4, 15, 'Pending', 'WPBx6rp0eCQCltRmF5kAAhOFIwNZ1Dw91ncjbz61.pdf', 'Document.pdf', 'uploads/files/02-2023/WPBx6rp0eCQCltRmF5kAAhOFIwNZ1Dw91ncjbz61.pdf', 'pdf', '13.62 KB', '2023-02-22 17:10:45', '2023-02-22 20:00:45'),
(12, 4, 15, 'Posted', 'GDVa4jNRLK581Sr5yXfeeMqI32ltZ1MlcM50UGdA.xlsx', 'AttendanceList.xlsx', 'uploads/files/02-2023/GDVa4jNRLK581Sr5yXfeeMqI32ltZ1MlcM50UGdA.xlsx', 'xlsx', '22.46 KB', '2023-02-22 17:53:13', '2023-02-22 18:26:32');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(7, 'App\\Models\\User', 10),
(10, 'App\\Models\\User', 10),
(14, 'App\\Models\\User', 11),
(15, 'App\\Models\\User', 12),
(18, 'App\\Models\\User', 15),
(12, 'App\\Models\\User', 17);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `type`, `guard_name`, `created_at`, `updated_at`) VALUES
(13, 'add role', 'can create', 'role', 'web', '2023-01-19 11:17:29', '2023-01-19 11:17:29'),
(14, 'view role', 'can view', 'role', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(15, 'view user', 'can view', 'user', 'web', '2023-01-19 11:53:09', '2023-01-19 11:53:09'),
(16, 'add user', 'can create', 'user', 'web', '2023-01-19 11:54:04', '2023-01-19 11:54:04'),
(17, 'delete user', 'can delete', 'user', 'web', '2023-01-19 11:56:04', '2023-01-19 11:56:04'),
(19, 'create ticket', 'can create', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(20, 'view client', 'can view', 'client', 'web', '2023-01-25 11:06:26', '2023-01-25 11:06:26'),
(21, 'add client', 'can create', 'client', 'web', '2023-01-25 11:06:34', '2023-01-25 11:06:34'),
(22, 'delete client', 'can delete', 'client', 'web', '2023-01-25 11:06:49', '2023-01-25 11:06:49'),
(23, 'update client', 'can update', 'client', 'web', '2023-01-25 11:07:03', '2023-01-25 11:07:03'),
(24, 'add team', 'can create', 'team', 'web', '2023-01-25 11:28:20', '2023-01-25 11:28:20'),
(25, 'view team', 'can view', 'team', 'web', '2023-01-25 11:28:32', '2023-01-25 11:28:32'),
(26, 'update team', 'can update', 'team', 'web', '2023-01-25 11:28:40', '2023-01-25 11:28:40'),
(27, 'delete team', 'can delete', 'team', 'web', '2023-01-25 11:28:48', '2023-01-25 11:28:48'),
(28, 'view department', 'can view', 'department', 'web', '2023-01-25 11:33:52', '2023-01-25 11:33:52'),
(29, 'add department', 'can create', 'department', 'web', '2023-01-25 11:33:58', '2023-01-25 11:33:58'),
(30, 'update department', 'can update', 'department', 'web', '2023-01-25 11:34:06', '2023-01-25 11:34:06'),
(31, 'delete department', 'can delete', 'department', 'web', '2023-01-25 11:34:14', '2023-01-25 11:34:14'),
(32, 'assign practice user', 'can assign practice', 'user', 'web', '2023-02-05 10:23:45', '2023-02-05 10:23:45'),
(33, 'update user', 'can update', 'user', 'web', '2023-02-05 10:25:02', '2023-02-05 10:25:02'),
(34, 'view practice', 'can view', 'practice', 'web', '2023-02-05 11:38:14', '2023-02-05 11:38:14'),
(35, 'add practice', 'can create', 'practice', 'web', '2023-02-05 11:38:27', '2023-02-05 11:38:27'),
(36, 'update practice', 'can update', 'practice', 'web', '2023-02-05 11:38:40', '2023-02-05 11:38:40'),
(37, 'delete practice', 'can delete', 'practice', 'web', '2023-02-05 11:38:48', '2023-02-05 11:38:48'),
(38, 'assign department user', 'can assign department', 'user', 'web', '2023-02-06 10:02:32', '2023-02-06 10:02:32'),
(39, 'import file', 'can create', 'file', 'web', '2023-02-06 14:30:10', '2023-02-06 14:30:10'),
(40, 'view file', 'can view', 'file', 'web', '2023-02-06 14:30:28', '2023-02-06 14:30:28'),
(41, 'update file', 'can update', 'file', 'web', '2023-02-06 14:30:41', '2023-02-06 14:30:41'),
(42, 'delete file', 'can delete', 'file', 'web', '2023-02-06 14:30:49', '2023-02-06 14:30:49'),
(44, 'assign team user', 'can assign team', 'user', 'web', '2023-02-06 10:02:32', '2023-02-06 10:02:32'),
(45, 'delete role', 'can delete', 'role', 'web', '2023-01-19 11:17:29', '2023-01-19 11:17:29'),
(46, 'update role', 'can update', 'role', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(47, 'update ticket', 'can update', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(48, 'delete ticket', 'can delete', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(49, 'view ticket', 'can view', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(50, 'assign role', 'can assign', 'role', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(51, 'add status', 'can create', 'status', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(52, 'delete status', 'can delete', 'status', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(53, 'update status', 'can update', 'status', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(54, 'view status', 'can view', 'status', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(55, 'add document type', 'can create', 'document_type', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(56, 'delete document type', 'can delete', 'document_type', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(57, 'update document type', 'can update', 'document_type', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(58, 'view document type', 'can view', 'document_type', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(59, 'delete activity', 'can delete', 'activity', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(60, 'view activity', 'can view', 'activity', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(61, 'assign department client', 'can assign department', 'client', 'web', '2023-01-25 11:07:03', '2023-01-25 11:07:03'),
(62, 'assign practice client', 'can assign practice', 'client', 'web', '2023-01-25 11:07:03', '2023-01-25 11:07:03'),
(63, 'assign team client', 'can assign team', 'client', 'web', '2023-01-25 11:07:03', '2023-01-25 11:07:03'),
(64, 'email file', 'can email', 'file', 'web', '2023-02-06 14:30:49', '2023-02-06 14:30:49'),
(65, 'download file', 'can download', 'file', 'web', '2023-02-06 14:30:49', '2023-02-06 14:30:49'),
(66, 'view document report', 'can view document report', 'reports', 'web', '2023-02-06 14:30:49', '2023-02-06 14:30:49'),
(67, 'view tickets report', 'can view tickets report', 'reports', 'web', '2023-02-06 14:30:49', '2023-02-06 14:30:49'),
(68, 'view users report', 'can view users report', 'reports', 'web', '2023-02-06 14:30:49', '2023-02-06 14:30:49'),
(69, 'refer ticket', 'can refer ticket', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(70, 'change status', 'can change status', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(71, 'approve ticket', 'can approve ticket', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(72, 'required approval', 'can required approval', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(73, 'allow dmail', 'allow dmail', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(74, 'browser notification', 'Browser Notification', 'notification', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(75, 'push notification', 'Push Notification', 'notification', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(76, 'sms alerts', 'SMS Alerts', 'notification', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `practices`
--

DROP TABLE IF EXISTS `practices`;
CREATE TABLE IF NOT EXISTS `practices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practices`
--

INSERT INTO `practices` (`id`, `company_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'test practice', 1, '2023-02-05 16:57:06', '2023-02-05 16:57:06', NULL),
(2, 1, 'bme pract', 1, '2023-02-05 17:37:33', '2023-02-05 17:37:33', NULL),
(3, 1, 'bme test p', 1, '2023-02-05 17:38:27', '2023-02-05 17:38:27', NULL),
(4, 6, 'New Practice 123', 1, '2023-02-16 21:12:26', '2023-02-17 18:54:50', NULL),
(5, 6, 'Practice ABC', 1, '2023-02-24 17:34:02', '2023-02-24 21:48:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `practice_user`
--

DROP TABLE IF EXISTS `practice_user`;
CREATE TABLE IF NOT EXISTS `practice_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `practice_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1:files, 2:dmail',
  `user_type` int(11) NOT NULL COMMENT '1:user, 2:client',
  `is_parent` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practice_user`
--

INSERT INTO `practice_user` (`id`, `user_id`, `practice_id`, `type`, `user_type`, `is_parent`, `created_at`, `updated_at`) VALUES
(2, 17, 5, 2, 1, NULL, '2023-02-24 03:08:43', '2023-02-27 20:00:55'),
(3, 16, 5, 1, 1, NULL, '2023-02-25 02:48:09', '2023-02-25 02:48:09'),
(4, 15, 4, 1, 1, NULL, '2023-02-27 23:16:30', '2023-02-27 23:16:30'),
(5, 15, 5, 1, 1, NULL, '2023-02-27 23:16:30', '2023-02-27 23:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `display_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `company_id`, `display_name`, `created_at`, `updated_at`) VALUES
(7, 'dev', 'web', 0, 'dev', '2023-01-04 11:52:20', '2023-01-04 11:52:20'),
(10, 'bme-admin', 'web', 1, 'admin', '2023-01-04 12:55:43', '2023-01-04 12:55:43'),
(12, 'bme-user', 'web', 1, 'user', '2023-01-19 11:51:12', '2023-01-19 11:51:12'),
(14, 'bmb-superadmin', 'web', 4, 'superadmin', '2023-01-19 13:39:09', '2023-01-19 13:39:09'),
(15, 'test-superadmin', 'web', 5, 'superadmin', '2023-01-22 12:33:56', '2023-01-22 12:33:56'),
(16, 'test-admin', 'web', 5, 'admin', '2023-01-22 12:37:45', '2023-01-22 12:37:45'),
(17, 'bmb-admin', 'web', 4, 'admin', '2023-02-05 12:48:59', '2023-02-05 12:48:59'),
(18, 'new-superadmin', 'web', 6, 'superadmin', '2023-02-16 16:08:10', '2023-02-16 16:08:10'),
(19, 'bme-Team Lead', 'web', 1, 'Team Lead', '2023-02-17 17:35:14', '2023-02-17 17:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(13, 7),
(14, 7),
(15, 7),
(16, 7),
(17, 7),
(19, 7),
(20, 7),
(21, 7),
(22, 7),
(23, 7),
(24, 7),
(25, 7),
(26, 7),
(27, 7),
(28, 7),
(29, 7),
(30, 7),
(31, 7),
(32, 7),
(33, 7),
(34, 7),
(35, 7),
(36, 7),
(37, 7),
(38, 7),
(39, 7),
(40, 7),
(41, 7),
(42, 7),
(13, 14),
(14, 14),
(15, 14),
(16, 14),
(17, 14),
(13, 15),
(14, 15),
(15, 15),
(16, 15),
(17, 15),
(13, 18),
(14, 18),
(15, 18),
(16, 18),
(17, 18),
(19, 18),
(20, 18),
(21, 18),
(22, 18),
(23, 18),
(24, 18),
(25, 18),
(26, 18),
(27, 18),
(28, 18),
(29, 18),
(30, 18),
(31, 18),
(32, 18),
(33, 18),
(34, 18),
(35, 18),
(36, 18),
(37, 18),
(38, 18),
(39, 18),
(40, 18),
(41, 18),
(42, 18),
(44, 18),
(45, 18),
(46, 18),
(47, 18),
(48, 18),
(49, 18),
(50, 18),
(51, 18),
(52, 18),
(53, 18),
(54, 18),
(55, 18),
(56, 18),
(57, 18),
(58, 18),
(59, 18),
(60, 18),
(61, 18),
(62, 18),
(63, 18),
(64, 18),
(65, 18),
(66, 18),
(67, 18),
(68, 18),
(69, 18),
(70, 18),
(71, 18),
(72, 18),
(73, 18),
(74, 18),
(75, 18),
(76, 18),
(15, 19),
(16, 19),
(19, 19),
(20, 19),
(21, 19),
(23, 19),
(24, 19),
(25, 19),
(28, 19),
(29, 19),
(30, 19),
(32, 19),
(33, 19),
(34, 19),
(35, 19),
(36, 19),
(38, 19);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(32) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` varchar(32) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `role_user_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
CREATE TABLE IF NOT EXISTS `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `company_id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 6, 'To Be Posted', 'document', '2023-02-22 18:07:25', '2023-02-23 17:12:17'),
(2, 6, 'Active', 'user', '2023-02-23 11:40:41', '2023-02-23 11:40:41');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` tinytext,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `company_id`, `name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Team A', NULL, 1, '2023-01-25 16:44:17', '2023-01-25 16:44:17', NULL),
(2, 1, 'Team B', NULL, 1, '2023-02-17 20:12:34', '2023-02-17 20:13:16', NULL),
(3, 6, 'Team A', NULL, 1, '2023-02-21 17:54:56', '2023-02-21 17:54:56', NULL),
(4, 6, 'Team B', NULL, 1, '2023-02-22 18:30:53', '2023-02-22 18:30:53', NULL),
(5, 6, 'Team C', NULL, 1, '2023-02-22 18:31:00', '2023-02-22 18:31:00', NULL),
(6, 6, 'Team D', NULL, 1, '2023-02-22 18:33:32', '2023-02-22 18:33:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_departments`
--

DROP TABLE IF EXISTS `team_departments`;
CREATE TABLE IF NOT EXISTS `team_departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team_practices`
--

DROP TABLE IF EXISTS `team_practices`;
CREATE TABLE IF NOT EXISTS `team_practices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `practice_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

DROP TABLE IF EXISTS `team_user`;
CREATE TABLE IF NOT EXISTS `team_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_user`
--

INSERT INTO `team_user` (`id`, `user_id`, `team_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 1, '2023-02-21 16:21:50', '2023-02-21 16:21:50', NULL),
(3, 15, 3, '2023-02-21 18:38:08', '2023-02-21 18:38:08', NULL),
(5, 17, 3, '2023-02-22 01:21:58', '2023-02-22 01:21:58', NULL),
(12, 18, 3, '2023-02-27 22:43:41', '2023-02-27 22:43:41', NULL),
(13, 18, 4, '2023-02-27 22:43:41', '2023-02-27 22:43:41', NULL),
(14, 16, 5, '2023-02-27 23:06:19', '2023-02-27 23:06:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creator_name` varchar(128) NOT NULL,
  `from` int(11) NOT NULL,
  `department_name` varchar(128) NOT NULL,
  `practice_id` int(11) NOT NULL,
  `practice_name` varchar(256) NOT NULL,
  `team_id` int(11) NOT NULL,
  `team_name` varchar(128) NOT NULL,
  `type` varchar(32) NOT NULL,
  `priority` varchar(32) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `creator` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `response_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `remarks` varchar(256) DEFAULT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `company_id`, `user_id`, `creator_name`, `from`, `department_name`, `practice_id`, `practice_name`, `team_id`, `team_name`, `type`, `priority`, `subject`, `message`, `creator`, `created_at`, `response_at`, `status`, `remarks`, `updated_at`) VALUES
(1, 6, 15, 'Asad Nazir', 3, 'ABC', 4, 'New Practice 123', 0, '', 'Info/Other', 'Concerning', 'Test subject', 'test message', 'New Test Company', '2023-02-24 16:17:37', NULL, 0, NULL, '2023-02-24 16:17:37'),
(2, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'practice ABC', 0, '', 'Info/Other', 'Concerning', 'Test subject', 'test message', 'New Test Company', '2023-02-24 16:17:37', NULL, 0, NULL, '2023-02-24 16:17:37'),
(3, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'test practice', 0, 'Team B', 'Info/Other', 'Concerning', 'Test', 'message', 'New Test Company', '2023-02-27 11:23:47', NULL, 0, NULL, '2023-02-27 11:23:47'),
(4, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'test practice', 4, 'Team B', 'Info/Other', 'Concerning', 'Test', 'dsadsad', 'New Test Company', '2023-02-27 11:51:23', NULL, 0, NULL, '2023-02-27 11:51:23'),
(5, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'Practice ABC', 4, 'Team B', 'Info/Other', 'Concerning', 'dsf', 'dsfdsfsd', 'New Test Company', '2023-02-27 11:56:17', NULL, 0, NULL, '2023-02-27 11:56:17'),
(6, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'Practice ABC', 4, 'Team B', 'Info/Other', 'Concerning', 'Testdsadsa', 'asdsadsadsad', 'New Test Company', '2023-02-27 11:57:24', NULL, 0, NULL, '2023-02-27 11:57:24'),
(7, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Test', 'sadsadsad', 'New Test Company', '2023-02-27 14:34:36', NULL, 0, NULL, '2023-02-27 14:34:36'),
(8, 6, 15, 'Asad Nazir', 3, 'ABC', 4, 'New Practice 123', 0, '', 'Info/Other', 'Concerning', 'Testsadsa', 'asdsadsadsad', 'New Test Company', '2023-02-27 14:41:23', NULL, 0, NULL, '2023-02-27 14:41:23'),
(9, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Test', 'sadsad', 'New Test Company', '2023-02-27 15:27:16', NULL, 0, NULL, '2023-02-27 15:27:16'),
(10, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Test', 'sadsad', 'New Test Company', '2023-02-27 15:29:38', NULL, 0, NULL, '2023-02-27 15:29:38'),
(11, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Testfg', 'fdgfdgfdg', 'New Test Company', '2023-02-27 15:30:53', NULL, 0, NULL, '2023-02-27 15:30:53'),
(12, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Test', 'sadsadsad', 'New Test Company', '2023-02-27 15:34:19', NULL, 0, NULL, '2023-02-27 15:34:19'),
(13, 6, 15, 'Asad Nazir', 3, 'ABC', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'sdsad', 'adsad', 'New Test Company', '2023-02-27 15:37:34', NULL, 0, NULL, '2023-02-27 15:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

DROP TABLE IF EXISTS `ticket_attachments`;
CREATE TABLE IF NOT EXISTS `ticket_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `org_name` tinytext NOT NULL,
  `path` mediumtext NOT NULL,
  `ext` varchar(50) NOT NULL,
  `size` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket_attachments`
--

INSERT INTO `ticket_attachments` (`id`, `ticket_id`, `name`, `org_name`, `path`, `ext`, `size`, `created_at`, `updated_at`) VALUES
(1, 11, 'UmU9JYLoqORaVoXIids3rHGHl7X51VI5ZGNl0t7I.xlsx', 'AttendanceList.xlsx', 'uploads/ticket_attachments/UmU9JYLoqORaVoXIids3rHGHl7X51VI5ZGNl0t7I.xlsx', 'xlsx', '22.46 KB', '2023-02-27 20:30:54', '2023-02-27 20:30:54'),
(2, 12, 'UIRQAfyGBerJlnjksiN7awLYXb6qaicdy7i4OAAb.xlsx', 'AttendanceList.xlsx', 'uploads/ticket_attachments/UIRQAfyGBerJlnjksiN7awLYXb6qaicdy7i4OAAb.xlsx', 'xlsx', '22.46 KB', '2023-02-27 20:34:19', '2023-02-27 20:34:19'),
(3, 13, 'fcyAw274dujqS6KP8l8xN2cg0ObhhigBoK2jS83d.xlsx', 'AttendanceList (1).xlsx', 'uploads/ticket_attachments/fcyAw274dujqS6KP8l8xN2cg0ObhhigBoK2jS83d.xlsx', 'xlsx', '22.49 KB', '2023-02-27 20:37:35', '2023-02-27 20:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_ccs`
--

DROP TABLE IF EXISTS `ticket_ccs`;
CREATE TABLE IF NOT EXISTS `ticket_ccs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `department_id` (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_ccs`
--

INSERT INTO `ticket_ccs` (`id`, `ticket_id`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(2, 1, 5, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(3, 1, 4, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(4, 2, 3, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(5, 2, 5, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(6, 2, 4, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(7, 3, 3, '2023-02-27 11:23:47', '2023-02-27 11:23:47'),
(8, 4, 5, '2023-02-27 11:51:23', '2023-02-27 11:51:23'),
(9, 5, 5, '2023-02-27 11:56:17', '2023-02-27 11:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '2' COMMENT '0:dev,1:superadmin, 2:user, 3:doctor',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '0:inactive, 1:active',
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `type`, `status`, `firstname`, `lastname`, `email`, `email_verified_at`, `password`, `remember_token`, `last_activity`, `created_at`, `updated_at`) VALUES
(10, 0, 0, 1, 'Junaid', 'Khan', 'junaid@mail.com', NULL, '$2a$12$TWJEfJ3kvFfnS49Yn5lvMe4qqxJUy/Oy1Gy5fvHgkzpshsC3WlApi', 'hLYUJCQFWXl5upRMlNLjxykhHAYVFaOPg9mHsJaZ6l5OoozCbba8jR43IptG', NULL, '2023-01-04 04:24:33', '2023-02-24 09:42:42'),
(11, 4, 2, 1, 'Super', 'Admin', 'superadmin4@bmb.com', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, '2023-01-19 13:39:09', '2023-01-19 13:39:09'),
(12, 5, 2, 1, 'Super', 'Admin', 'superadmin5@test.com', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, '2023-01-22 12:33:56', '2023-01-22 12:33:56'),
(13, 1, 2, 1, 'John D.', 'John D.', 'JohnDMurray@teleworm.us', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, '2023-01-25 10:36:08', '2023-01-25 10:36:08'),
(14, 1, 3, 1, 'test', 'client', 'client@gmail.com', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, '2023-02-05 10:19:42', '2023-02-05 10:19:42'),
(15, 6, 2, 1, 'Asad', 'Nazir', 'superadmin6@new.com', NULL, '$2y$10$T9jRrchuuBhVQfaaYMdlLubDgSlSz/x9UR0V8J0XZkE4zLYKM6U4W', NULL, NULL, '2023-02-16 16:08:10', '2023-02-24 11:30:56'),
(16, 6, 3, 1, 'New Client 1', 'New Client 1', 'newclient@gmail.com', NULL, '$2y$10$PYEfP6Pb1kM97kkS.M9yvOR5Eov6NcjjXqrHOCnu6NIVRkxYo7vg2', NULL, NULL, '2023-02-16 16:10:37', '2023-02-16 16:10:37'),
(17, 6, 2, 1, 'Test', 'Test', 'test@gmail.com', NULL, '$2y$10$KA8vHn1FJekCLjBDir/Lhupag4peomZl1wjv46CfjoePjiO3s1UfS', NULL, NULL, '2023-02-21 12:54:37', '2023-02-21 12:54:37'),
(18, 6, 2, 1, 'Test', 'User', 'testuser@gmail.com', NULL, '$2y$10$ZQuRQ6iuGSvo7nmORZGVy.lMWvW02ow3pYCkJltN5U/f4JLmKO.wi', NULL, NULL, '2023-02-27 12:43:41', '2023-02-27 12:43:41');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
