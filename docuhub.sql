-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 22, 2023 at 08:08 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `company_id`, `parent_id`, `name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'Billing', NULL, 1, '2023-01-25 17:10:51', '2023-02-17 21:32:05', NULL),
(2, 1, 1, 'Claim Submission', NULL, 1, '2023-01-25 17:10:51', '2023-02-17 21:31:47', NULL),
(3, 6, 0, 'ABC', NULL, 1, '2023-02-21 20:53:42', '2023-02-21 20:53:42', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department_user`
--

INSERT INTO `department_user` (`id`, `user_id`, `department_id`, `created_at`, `updated_at`) VALUES
(3, 13, 2, '2023-02-06 15:23:25', '2023-02-06 15:23:25'),
(4, 17, 3, '2023-02-22 02:02:47', '2023-02-22 02:02:47'),
(5, 15, 3, '2023-02-22 02:03:02', '2023-02-22 02:03:02');

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
(8, 4, 15, NULL, 'cqDk3feTSHL8ARw3xVExMCZMNVOFYHR0jZyaUAMk.jpg', 'image004.jpg', 'uploads/files/02-2023/cqDk3feTSHL8ARw3xVExMCZMNVOFYHR0jZyaUAMk.jpg', 'jpg', '97.22 KB', '2023-02-16 21:13:24', '2023-02-16 21:13:24'),
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
  `type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `type`, `guard_name`, `created_at`, `updated_at`) VALUES
(13, 'add role', 'role', 'web', '2023-01-19 11:17:29', '2023-01-19 11:17:29'),
(14, 'view role', 'role', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(15, 'view user', 'user', 'web', '2023-01-19 11:53:09', '2023-01-19 11:53:09'),
(16, 'add user', 'user', 'web', '2023-01-19 11:54:04', '2023-01-19 11:54:04'),
(17, 'delete user', 'user', 'web', '2023-01-19 11:56:04', '2023-01-19 11:56:04'),
(19, 'create ticket', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(20, 'view client', 'client', 'web', '2023-01-25 11:06:26', '2023-01-25 11:06:26'),
(21, 'add client', 'client', 'web', '2023-01-25 11:06:34', '2023-01-25 11:06:34'),
(22, 'delete client', 'client', 'web', '2023-01-25 11:06:49', '2023-01-25 11:06:49'),
(23, 'update client', 'client', 'web', '2023-01-25 11:07:03', '2023-01-25 11:07:03'),
(24, 'add team', 'team', 'web', '2023-01-25 11:28:20', '2023-01-25 11:28:20'),
(25, 'view team', 'team', 'web', '2023-01-25 11:28:32', '2023-01-25 11:28:32'),
(26, 'update team', 'team', 'web', '2023-01-25 11:28:40', '2023-01-25 11:28:40'),
(27, 'delete team', 'team', 'web', '2023-01-25 11:28:48', '2023-01-25 11:28:48'),
(28, 'view department', 'department', 'web', '2023-01-25 11:33:52', '2023-01-25 11:33:52'),
(29, 'add department', 'department', 'web', '2023-01-25 11:33:58', '2023-01-25 11:33:58'),
(30, 'update department', 'department', 'web', '2023-01-25 11:34:06', '2023-01-25 11:34:06'),
(31, 'delete department', 'department', 'web', '2023-01-25 11:34:14', '2023-01-25 11:34:14'),
(32, 'assign practice user', 'user', 'web', '2023-02-05 10:23:45', '2023-02-05 10:23:45'),
(33, 'update user', 'user', 'web', '2023-02-05 10:25:02', '2023-02-05 10:25:02'),
(34, 'view practice', 'practice', 'web', '2023-02-05 11:38:14', '2023-02-05 11:38:14'),
(35, 'add practice', 'practice', 'web', '2023-02-05 11:38:27', '2023-02-05 11:38:27'),
(36, 'update practice', 'practice', 'web', '2023-02-05 11:38:40', '2023-02-05 11:38:40'),
(37, 'delete practice', 'practice', 'web', '2023-02-05 11:38:48', '2023-02-05 11:38:48'),
(38, 'assign department user', 'user', 'web', '2023-02-06 10:02:32', '2023-02-06 10:02:32'),
(39, 'import file', 'file', 'web', '2023-02-06 14:30:10', '2023-02-06 14:30:10'),
(40, 'view file', 'file', 'web', '2023-02-06 14:30:28', '2023-02-06 14:30:28'),
(41, 'update file', 'file', 'web', '2023-02-06 14:30:41', '2023-02-06 14:30:41'),
(42, 'delete file', 'file', 'web', '2023-02-06 14:30:49', '2023-02-06 14:30:49'),
(44, 'assign team user', 'user', 'web', '2023-02-06 10:02:32', '2023-02-06 10:02:32'),
(45, 'delete role', 'role', 'web', '2023-01-19 11:17:29', '2023-01-19 11:17:29'),
(46, 'update role', 'role', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(47, 'update ticket', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(48, 'delete ticket', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(49, 'view ticket', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(50, 'assign role', 'role', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practices`
--

INSERT INTO `practices` (`id`, `company_id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'test practice', 1, '2023-02-05 16:57:06', '2023-02-05 16:57:06', NULL),
(2, 1, 'bme pract', 1, '2023-02-05 17:37:33', '2023-02-05 17:37:33', NULL),
(3, 1, 'bme test p', 1, '2023-02-05 17:38:27', '2023-02-05 17:38:27', NULL),
(4, 6, 'New Practice 123', 1, '2023-02-16 21:12:26', '2023-02-17 18:54:50', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practice_user`
--

INSERT INTO `practice_user` (`id`, `user_id`, `practice_id`, `type`, `user_type`, `is_parent`, `created_at`, `updated_at`) VALUES
(23, 13, 3, 1, 1, NULL, '2023-02-06 15:22:38', '2023-02-06 15:22:38'),
(24, 15, 4, 1, 1, NULL, '2023-02-16 21:13:10', '2023-02-16 21:13:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_user`
--

INSERT INTO `team_user` (`id`, `user_id`, `team_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 1, '2023-02-21 16:21:50', '2023-02-21 16:21:50', NULL),
(3, 15, 3, '2023-02-21 18:38:08', '2023-02-21 18:38:08', NULL),
(5, 17, 3, '2023-02-22 01:21:58', '2023-02-22 01:21:58', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `type`, `status`, `firstname`, `lastname`, `email`, `email_verified_at`, `password`, `remember_token`, `last_activity`, `created_at`, `updated_at`) VALUES
(10, 0, 0, 1, 'junaid', 'khan', 'junaid@mail.com', NULL, '$2a$12$TWJEfJ3kvFfnS49Yn5lvMe4qqxJUy/Oy1Gy5fvHgkzpshsC3WlApi', 'MLHiEM5MRMQATxf9pgP2hmLaIpT0Zze3fhq3J0iHsmmex3lwqm0WlCDBzsYU', NULL, '2023-01-04 04:24:33', '2023-01-04 04:24:33'),
(11, 4, 2, 1, 'Super', 'Admin', 'superadmin4@bmb.com', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, '2023-01-19 13:39:09', '2023-01-19 13:39:09'),
(12, 5, 2, 1, 'Super', 'Admin', 'superadmin5@test.com', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, '2023-01-22 12:33:56', '2023-01-22 12:33:56'),
(13, 1, 2, 1, 'John D.', 'John D.', 'JohnDMurray@teleworm.us', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, '2023-01-25 10:36:08', '2023-01-25 10:36:08'),
(14, 1, 3, 1, 'test', 'client', 'client@gmail.com', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, '2023-02-05 10:19:42', '2023-02-05 10:19:42'),
(15, 6, 2, 1, 'Super', 'Admin', 'superadmin6@new.com', NULL, '$2y$10$T9jRrchuuBhVQfaaYMdlLubDgSlSz/x9UR0V8J0XZkE4zLYKM6U4W', NULL, NULL, '2023-02-16 16:08:10', '2023-02-17 12:33:27'),
(16, 6, 3, 1, 'New Client 1', 'New Client 1', 'newclient@gmail.com', NULL, '$2y$10$PYEfP6Pb1kM97kkS.M9yvOR5Eov6NcjjXqrHOCnu6NIVRkxYo7vg2', NULL, NULL, '2023-02-16 16:10:37', '2023-02-16 16:10:37'),
(17, 6, 2, 1, 'Test', 'Test', 'test@gmail.com', NULL, '$2y$10$KA8vHn1FJekCLjBDir/Lhupag4peomZl1wjv46CfjoePjiO3s1UfS', NULL, NULL, '2023-02-21 12:54:37', '2023-02-21 12:54:37');

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
