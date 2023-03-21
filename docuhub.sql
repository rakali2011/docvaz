-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 21, 2023 at 09:59 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `company_id`, `parent_id`, `name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'Billing', NULL, 1, '2023-01-25 17:10:51', '2023-02-17 21:32:05', NULL),
(2, 1, 1, 'Claim Submission', NULL, 1, '2023-01-25 17:10:51', '2023-02-17 21:31:47', NULL),
(3, 6, 0, 'Sales', NULL, 1, '2023-02-21 20:53:42', '2023-02-27 21:19:07', NULL),
(4, 6, 0, 'Audit', NULL, 1, '2023-02-23 19:32:09', '2023-02-27 21:18:50', NULL),
(5, 6, 0, 'Software', NULL, 1, '2023-02-23 19:34:15', '2023-02-27 21:18:36', NULL),
(6, 6, 0, 'CRM', NULL, 1, '2023-02-27 21:19:14', '2023-02-27 21:19:14', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department_user`
--

INSERT INTO `department_user` (`id`, `user_id`, `department_id`, `created_at`, `updated_at`) VALUES
(3, 13, 2, '2023-02-06 15:23:25', '2023-02-06 15:23:25'),
(5, 15, 3, '2023-02-22 02:03:02', '2023-02-22 02:03:02'),
(6, 17, 4, '2023-02-24 02:21:09', '2023-02-24 02:21:09'),
(7, 16, 6, '2023-03-03 02:07:20', '2023-03-03 02:07:20'),
(8, 16, 3, '2023-03-03 02:07:20', '2023-03-03 02:07:20'),
(9, 19, 6, '2023-03-03 02:07:39', '2023-03-03 02:07:39'),
(10, 19, 3, '2023-03-03 02:07:39', '2023-03-03 02:07:39'),
(11, 20, 4, '2023-03-03 02:12:39', '2023-03-03 02:12:39'),
(12, 20, 6, '2023-03-03 02:12:39', '2023-03-03 02:12:39'),
(13, 20, 3, '2023-03-03 02:12:39', '2023-03-03 02:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
CREATE TABLE IF NOT EXISTS `designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `company_id`, `name`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 6, 'General Manager (GM)', '2023-03-20 13:07:51', NULL, '2023-03-20 18:18:01'),
(2, 6, 'Director', '2023-03-20 13:15:33', NULL, '2023-03-20 13:15:33'),
(3, 6, 'Vice President', '2023-03-20 13:15:51', NULL, '2023-03-20 13:15:51'),
(4, 6, 'Manager Operations', '2023-03-20 13:16:37', NULL, '2023-03-20 13:16:37'),
(5, 6, 'Assistant Manager Operations', '2023-03-20 13:16:46', NULL, '2023-03-20 13:16:46'),
(6, 6, 'Senior Manager Operations', '2023-03-20 13:16:55', NULL, '2023-03-20 13:16:55');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `company_id`, `name`, `created_at`, `updated_at`) VALUES
(2, 6, 'Registration Form', '2023-03-20 13:08:51', '2023-03-20 16:38:45'),
(3, 6, 'Day Sheet', '2023-03-20 16:38:55', '2023-03-20 16:38:55'),
(4, 6, 'EOBs', '2023-03-20 16:39:05', '2023-03-20 16:39:05'),
(5, 6, 'Super Bill', '2023-03-20 16:39:17', '2023-03-20 16:39:17'),
(6, 6, 'Insurance letters', '2023-03-20 16:39:30', '2023-03-20 16:39:30'),
(7, 6, 'Medical Notes', '2023-03-20 16:39:49', '2023-03-20 16:39:49'),
(8, 6, 'Call Charges', '2023-03-20 16:42:25', '2023-03-20 16:42:25'),
(9, 6, 'Others', '2023-03-20 16:44:14', '2023-03-20 16:44:14');

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
  `status` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `org_name` tinytext NOT NULL,
  `path` mediumtext NOT NULL,
  `ext` varchar(50) NOT NULL,
  `size` varchar(100) NOT NULL,
  `date` date DEFAULT NULL,
  `doc_type` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `practice_id`, `user_id`, `status`, `name`, `org_name`, `path`, `ext`, `size`, `date`, `doc_type`, `created_at`, `updated_at`) VALUES
(1, 4, 10, 14, 'qjbT8BZTaBs80aDtRk1FLxHKXOGmdXnQKVA6R2gD.png', 'secretm.me-verticle-share.png', 'uploads/files/02-2023/qjbT8BZTaBs80aDtRk1FLxHKXOGmdXnQKVA6R2gD.png', 'png', '385.82 KB', NULL, 4, '2023-02-06 20:16:08', '2023-03-21 20:55:29'),
(2, 4, 10, 14, 'McPTd5iZYNSVvNXHxXoiMS1H0gPrugq2lfXz1qQK.png', 'screencapture-secretm-me-inbox-php-2022-09-08-21_15_52.png', 'uploads/files/02-2023/McPTd5iZYNSVvNXHxXoiMS1H0gPrugq2lfXz1qQK.png', 'png', '2.56 MB', NULL, 4, '2023-02-06 20:16:08', '2023-03-22 01:55:55'),
(3, 4, 10, 14, 'K2S7gNAjlvGAWZhqFq2brsnY2hZ90hd0CoM884Oh.png', 'screencapture-publishers-adsterra-stats-2022-10-06-12_35_35.png', 'uploads/files/02-2023/K2S7gNAjlvGAWZhqFq2brsnY2hZ90hd0CoM884Oh.png', 'png', '191.23 KB', NULL, 4, '2023-02-06 20:16:08', '2023-03-22 01:55:55'),
(4, 4, 10, 14, 'UmPHvRQg1nFiSUy8QSQIKaPZ5qGyBLwvyBUVr3De.png', 'secretm.me-verticle-share.png', 'uploads/files/02-2023/UmPHvRQg1nFiSUy8QSQIKaPZ5qGyBLwvyBUVr3De.png', 'png', '385.82 KB', NULL, 4, '2023-02-06 20:16:18', '2023-03-22 01:55:55'),
(5, 4, 10, 14, '8DiR6bU392EtXfnlR2iuxS5ZRw7wOSTNK0P0zZsM.png', 'screencapture-secretm-me-inbox-php-2022-09-08-21_15_52.png', 'uploads/files/02-2023/8DiR6bU392EtXfnlR2iuxS5ZRw7wOSTNK0P0zZsM.png', 'png', '2.56 MB', NULL, 4, '2023-02-06 20:16:18', '2023-03-22 01:55:55'),
(6, 4, 10, 14, 'VSfKIATTISBcvvDvY326lC1PIf9oVKqt0upd9MYi.png', 'screencapture-publishers-adsterra-stats-2022-10-06-12_35_35.png', 'uploads/files/02-2023/VSfKIATTISBcvvDvY326lC1PIf9oVKqt0upd9MYi.png', 'png', '191.23 KB', NULL, 4, '2023-02-06 20:16:18', '2023-03-22 01:55:55'),
(7, 4, 10, 14, '7iO2YMMujOSB7GwIsBOCgruGBs0TVzF309q24SGu.png', 'Web Developer Php Laravel.png', 'uploads/files/02-2023/7iO2YMMujOSB7GwIsBOCgruGBs0TVzF309q24SGu.png', 'png', '52.81 KB', NULL, 4, '2023-02-06 20:17:47', '2023-03-22 01:55:55'),
(8, 4, 15, 14, 'cqDk3feTSHL8ARw3xVExMCZMNVOFYHR0jZyaUAMk.jpg', 'image004.jpg', 'uploads/files/02-2023/cqDk3feTSHL8ARw3xVExMCZMNVOFYHR0jZyaUAMk.jpg', 'jpg', '97.22 KB', NULL, 4, '2023-02-16 21:13:24', '2023-03-22 01:55:55'),
(9, 4, 15, 14, 'e892BTm1RqGla3X7RsDNoajOAi9G6za5WteoYtT8.jpg', '1933136_188282907860672_4388842_o.jpg', 'uploads/files/02-2023/e892BTm1RqGla3X7RsDNoajOAi9G6za5WteoYtT8.jpg', 'jpg', '408.74 KB', NULL, 4, '2023-02-16 22:41:32', '2023-03-22 01:55:55'),
(10, 4, 15, 14, 'SbQPg6d3akY0Kv0bprp2H3rmMQXcnlu5nlYb6xwy.jpg', 'image004.jpg', 'uploads/files/02-2023/SbQPg6d3akY0Kv0bprp2H3rmMQXcnlu5nlYb6xwy.jpg', 'jpg', '97.22 KB', NULL, 4, '2023-02-21 22:32:24', '2023-03-22 01:55:55'),
(11, 4, 15, 14, 'WPBx6rp0eCQCltRmF5kAAhOFIwNZ1Dw91ncjbz61.pdf', 'Document.pdf', 'uploads/files/02-2023/WPBx6rp0eCQCltRmF5kAAhOFIwNZ1Dw91ncjbz61.pdf', 'pdf', '13.62 KB', NULL, 4, '2023-02-22 17:10:45', '2023-03-22 01:55:55'),
(12, 4, 15, 14, 'GDVa4jNRLK581Sr5yXfeeMqI32ltZ1MlcM50UGdA.xlsx', 'AttendanceList123.xlsx', 'uploads/files/02-2023/GDVa4jNRLK581Sr5yXfeeMqI32ltZ1MlcM50UGdA.xlsx', 'xlsx', '22.46 KB', NULL, 4, '2023-02-22 17:53:13', '2023-03-22 01:55:55'),
(13, 4, 15, 14, '5f5TDxQLrmDtjt1CUToQYDPerLUMakXWku3HTFbp.xlsx', 'AttendanceList (1).xlsx', 'uploads/files/03-2023/5f5TDxQLrmDtjt1CUToQYDPerLUMakXWku3HTFbp.xlsx', 'xlsx', '22.49 KB', '2023-03-09', 4, '2023-03-21 14:24:07', '2023-03-22 01:54:45'),
(14, 4, 15, 14, '2RiQeo0dhS2M9d45LxRbNsA1bIYRg89L8gAx8ZcH.xlsx', 'AttendanceList.xlsx', 'uploads/files/03-2023/2RiQeo0dhS2M9d45LxRbNsA1bIYRg89L8gAx8ZcH.xlsx', 'xlsx', '22.46 KB', '2023-03-09', 4, '2023-03-21 14:24:07', '2023-03-22 01:44:28');

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
(20, 'App\\Models\\User', 16),
(20, 'App\\Models\\User', 19),
(20, 'App\\Models\\User', 20);

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(76, 'sms alerts', 'SMS Alerts', 'notification', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(77, 'view company', 'Can View Company', 'setting', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(78, 'update company', 'Can Update Company', 'setting', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(79, 'view business', 'Can View', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(80, 'update business', 'Can Update', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(82, 'update business status', 'Can Update Status', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(83, 'update business info', 'Can Update Info', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(84, 'update business address', 'Can Update Address', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(85, 'update business contact info', 'Can Update Contact Info', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(86, 'update business provider info', 'Can Update Provider Info', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(87, 'update business system detail', 'Can Update System Detail', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(88, 'update business payers enrollment info', 'Can Update Payers Enrollment Info', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(89, 'update business claim frequency', 'Can Update Claim Frequency', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(90, 'update business attachment', 'Can Update Attachment', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(91, 'update business services', 'Can Update Services', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(92, 'update business assigned team', 'Can Update Assigned Team', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(93, 'update business crm', 'Can Update CRM', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(94, 'update business operations', 'Can Update Operations', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(95, 'update business threshold per hour', 'Can Update Threshold Per Hour', 'business', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(96, 'add designation', 'can create', 'designation', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(97, 'delete designation', 'can delete', 'designation', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(98, 'update designation', 'can update', 'designation', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(99, 'view designation', 'can view', 'designation', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41');

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
  `company_id` int(11) DEFAULT NULL,
  `name` mediumtext,
  `status` int(11) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `speciality` text,
  `avg_charges` int(11) DEFAULT NULL,
  `group_npi` varchar(64) DEFAULT NULL,
  `group_ptan` varchar(64) DEFAULT NULL,
  `tax_id` varchar(64) DEFAULT NULL,
  `physical_address` json NOT NULL,
  `mailing_address` json NOT NULL,
  `location_address` json NOT NULL,
  `dmail_emails` varchar(256) DEFAULT NULL,
  `focal_info` json NOT NULL,
  `owner_info` json NOT NULL,
  `provider_information` json NOT NULL,
  `caqh` json NOT NULL,
  `clearinghouse` json NOT NULL,
  `ehr` json NOT NULL,
  `management_software` json NOT NULL,
  `payers_info` json NOT NULL,
  `claim_creation_frequency` json NOT NULL,
  `bellmedex_services` json NOT NULL,
  `crm` json NOT NULL,
  `operations` json NOT NULL,
  `practice_threshold_per_hour` json NOT NULL,
  `thresh_payer` json NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practices`
--

INSERT INTO `practices` (`id`, `company_id`, `name`, `status`, `reason`, `date`, `speciality`, `avg_charges`, `group_npi`, `group_ptan`, `tax_id`, `physical_address`, `mailing_address`, `location_address`, `dmail_emails`, `focal_info`, `owner_info`, `provider_information`, `caqh`, `clearinghouse`, `ehr`, `management_software`, `payers_info`, `claim_creation_frequency`, `bellmedex_services`, `crm`, `operations`, `practice_threshold_per_hour`, `thresh_payer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'test practice', 1, '', NULL, '', 0, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 16:57:06', '2023-02-05 16:57:06', NULL),
(2, 1, 'bme pract', 1, '', NULL, '', 0, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 17:37:33', '2023-02-05 17:37:33', NULL),
(3, 1, 'bme test p', 1, '', NULL, '', 0, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 17:38:27', '2023-02-05 17:38:27', NULL),
(4, 6, 'New Practice 123', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": null, \"logins_receipt\": \"0\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-16 21:12:26', '2023-03-08 16:58:02', NULL),
(5, 6, 'Practice ABC', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": \"2023-03-08\", \"logins_receipt\": \"1\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}]', '2023-02-24 17:34:02', '2023-03-08 16:57:03', NULL),
(6, 6, 'Test ABC 123', 3, 'asdsadsad', NULL, NULL, NULL, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}, {\"npi\": null, \"payer_name\": null, \"enroll_type\": \"group\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": null, \"logins_receipt\": \"0\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-03-06 21:27:31', '2023-03-08 17:39:28', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practice_user`
--

INSERT INTO `practice_user` (`id`, `user_id`, `practice_id`, `type`, `user_type`, `is_parent`, `created_at`, `updated_at`) VALUES
(2, 17, 5, 2, 1, NULL, '2023-02-24 03:08:43', '2023-02-27 20:00:55'),
(6, 19, 4, 1, 1, NULL, '2023-03-03 01:50:31', '2023-03-03 01:50:31'),
(7, 16, 4, 1, 1, NULL, '2023-03-03 01:50:40', '2023-03-03 01:50:40'),
(8, 20, 4, 1, 1, NULL, '2023-03-03 02:12:52', '2023-03-03 02:12:52'),
(9, 20, 5, 1, 1, NULL, '2023-03-03 02:12:52', '2023-03-03 02:12:52'),
(10, 15, 4, 1, 1, NULL, '2023-03-21 19:32:10', '2023-03-21 19:32:10'),
(11, 15, 5, 1, 1, NULL, '2023-03-21 19:32:10', '2023-03-21 19:32:10'),
(12, 15, 6, 1, 1, NULL, '2023-03-21 19:32:10', '2023-03-21 19:32:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(18, 'new-Super Admin', 'web', 6, 'Super Admin', '2023-02-16 16:08:10', '2023-03-03 17:52:54'),
(19, 'bme-Team Lead', 'web', 1, 'Team Lead', '2023-02-17 17:35:14', '2023-02-17 17:35:14'),
(20, 'new-Client', 'web', 6, 'Client', '2023-03-02 14:54:21', '2023-03-02 14:54:21');

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
(77, 18),
(78, 18),
(79, 18),
(80, 18),
(82, 18),
(83, 18),
(84, 18),
(85, 18),
(86, 18),
(87, 18),
(88, 18),
(89, 18),
(90, 18),
(91, 18),
(92, 18),
(93, 18),
(94, 18),
(95, 18),
(96, 18),
(97, 18),
(98, 18),
(99, 18),
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
(38, 19),
(15, 20),
(19, 20),
(20, 20),
(33, 20),
(34, 20),
(36, 20),
(39, 20),
(40, 20),
(41, 20),
(42, 20),
(47, 20),
(48, 20),
(49, 20),
(60, 20),
(64, 20),
(65, 20),
(69, 20),
(70, 20),
(71, 20),
(72, 20),
(73, 20);

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
  `default` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `company_id`, `name`, `type`, `default`, `created_at`, `updated_at`) VALUES
(1, 6, 'To Be Posted', 'document', 0, '2023-02-22 18:07:25', '2023-03-07 09:45:16'),
(2, 6, 'Active', 'user', 1, '2023-02-23 11:40:41', '2023-03-07 09:51:06'),
(3, 6, 'Active', 'practice', 1, '2023-03-06 15:35:08', '2023-03-07 09:45:20'),
(4, 6, 'On Hold', 'practice', 0, '2023-03-06 15:35:20', '2023-03-07 09:45:20'),
(5, 6, 'Terminated', 'practice', 0, '2023-03-06 15:50:03', '2023-03-07 09:45:20'),
(6, 6, 'On Termination Notice', 'practice', 0, '2023-03-06 15:50:12', '2023-03-07 09:45:20'),
(7, 6, 'On Boarding In Process', 'practice', 0, '2023-03-06 15:50:23', '2023-03-07 09:45:20'),
(8, 6, 'Retention In Progress', 'practice', 0, '2023-03-06 15:50:32', '2023-03-07 09:45:20'),
(9, 6, 'Not Onboarded', 'practice', 0, '2023-03-06 15:50:43', '2023-03-07 09:45:20'),
(10, 6, 'Actice', 'client', 1, '2023-03-06 17:49:39', '2023-03-07 09:45:10'),
(11, 6, 'Inactive', 'client', 0, '2023-03-06 17:49:48', '2023-03-07 09:45:10'),
(12, 6, 'Inactive', 'user', 0, '2023-03-06 17:50:03', '2023-03-07 09:51:06'),
(13, 6, 'Posted', 'document', 0, '2023-03-07 09:14:32', '2023-03-07 09:45:16'),
(14, 6, 'In-Progress', 'document', 0, '2023-03-07 09:14:53', '2023-03-07 09:45:16'),
(15, 6, 'Pending', 'document', 1, '2023-03-07 09:15:05', '2023-03-07 09:45:16'),
(16, 6, 'Complete', 'document', 0, '2023-03-07 09:15:18', '2023-03-07 09:45:16'),
(17, 6, 'Pending (For Coding)', 'document', 0, '2023-03-07 09:15:36', '2023-03-07 09:45:16'),
(18, 6, 'On-Hold (For Coding)', 'document', 0, '2023-03-07 09:15:52', '2023-03-07 09:45:16'),
(19, 6, 'Coded', 'document', 0, '2023-03-07 09:16:04', '2023-03-07 09:45:16'),
(20, 6, 'Active', 'team', 1, '2023-03-07 09:17:06', '2023-03-07 09:45:23'),
(21, 6, 'Inactive', 'team', 0, '2023-03-07 09:17:21', '2023-03-07 09:45:23'),
(22, 6, 'Open', 'ticket', 1, '2023-03-07 10:07:48', '2023-03-20 15:35:33'),
(23, 6, 'In-Process', 'ticket', 0, '2023-03-07 10:08:09', '2023-03-20 15:35:33'),
(24, 6, 'Reopen', 'ticket', 0, '2023-03-07 10:08:46', '2023-03-20 15:35:33'),
(25, 6, 'On-Hold', 'ticket', 0, '2023-03-07 10:09:00', '2023-03-20 15:35:33'),
(26, 6, 'Waiting Approval', 'ticket', 0, '2023-03-07 10:09:38', '2023-03-20 15:35:33'),
(27, 6, 'Rejected', 'ticket', 0, '2023-03-07 10:09:48', '2023-03-20 15:35:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_user`
--

INSERT INTO `team_user` (`id`, `user_id`, `team_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 1, '2023-02-21 16:21:50', '2023-02-21 16:21:50', NULL),
(3, 15, 3, '2023-02-21 18:38:08', '2023-02-21 18:38:08', NULL),
(5, 17, 3, '2023-02-22 01:21:58', '2023-02-22 01:21:58', NULL),
(12, 18, 3, '2023-02-27 22:43:41', '2023-02-27 22:43:41', NULL),
(13, 18, 4, '2023-02-27 22:43:41', '2023-02-27 22:43:41', NULL),
(14, 16, 5, '2023-02-27 23:06:19', '2023-02-27 23:06:19', NULL),
(15, 19, 3, '2023-03-03 01:49:40', '2023-03-03 01:49:40', NULL),
(16, 20, 3, '2023-03-03 02:12:25', '2023-03-03 02:12:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '2:user,3:doctor',
  `creator_name` varchar(128) NOT NULL,
  `department_id` int(11) NOT NULL,
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
  `response_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=Open,1=Inprocess,2=Closed,3=Reopen,4=Onhold,5=Waiting Approval,6=Rejected',
  `remarks` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `company_id`, `user_id`, `user_type`, `creator_name`, `department_id`, `department_name`, `practice_id`, `practice_name`, `team_id`, `team_name`, `type`, `priority`, `subject`, `message`, `creator`, `response_at`, `status`, `remarks`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 4, 'New Practice 123', 0, '', 'Info/Other', 'High', 'Test subject', 'test message', 'New Test Company', NULL, 0, NULL, '2023-02-24 16:17:37', NULL, '2023-02-28 15:58:46'),
(2, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'practice ABC', 0, '', 'Info/Other', 'Concerning', 'Test subject', 'test message', 'New Test Company', NULL, 0, NULL, '2023-02-24 16:17:37', NULL, '2023-02-24 16:17:37'),
(3, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'test practice', 0, 'Team B', 'Info/Other', 'Low', 'Test', 'message', 'New Test Company', NULL, 0, NULL, '2023-02-27 11:23:47', NULL, '2023-02-27 11:23:47'),
(4, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'test practice', 4, 'Team B', 'Info/Other', 'Concerning', 'Test', 'dsadsad', 'New Test Company', NULL, 0, NULL, '2023-02-27 11:51:23', NULL, '2023-02-27 11:51:23'),
(5, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'Practice ABC', 4, 'Team B', 'Info/Other', 'Concerning', 'dsf', 'dsfdsfsd', 'New Test Company', NULL, 0, NULL, '2023-02-27 11:56:17', NULL, '2023-02-27 11:56:17'),
(6, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'Practice ABC', 4, 'Team B', 'Info/Other', 'Medium', 'Testdsadsa', 'asdsadsadsad', 'New Test Company', NULL, 0, NULL, '2023-02-27 11:57:24', NULL, '2023-02-27 11:57:24'),
(7, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Test', 'sadsadsad', 'New Test Company', NULL, 0, NULL, '2023-02-27 14:34:36', NULL, '2023-02-27 14:34:36'),
(8, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 4, 'New Practice 123', 0, '', 'Info/Other', 'Concerning', 'Testsadsa', 'asdsadsadsad', 'New Test Company', NULL, 0, NULL, '2023-02-27 14:41:23', NULL, '2023-02-27 14:41:23'),
(9, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Test', 'sadsad', 'New Test Company', NULL, 0, NULL, '2023-02-27 15:27:16', NULL, '2023-02-27 15:27:16'),
(10, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Test', 'sadsad', 'New Test Company', NULL, 0, NULL, '2023-02-27 15:29:38', NULL, '2023-02-27 15:29:38'),
(11, 6, 15, 2, 'Asad Nazir', 6, 'CRM', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Testfg', 'fdgfdgfdg', 'New Test Company', NULL, 0, NULL, '2023-02-27 15:30:53', NULL, '2023-03-02 13:18:34'),
(12, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'Test', 'sadsadsad', 'New Test Company', NULL, 0, NULL, '2023-02-27 15:34:19', NULL, '2023-02-27 15:34:19'),
(13, 6, 15, 2, 'Asad Nazir', 3, 'Sales', 5, 'Practice ABC', 5, 'Team C', 'Info/Other', 'Concerning', 'sdsad', 'adsad', 'New Test Company', NULL, 0, NULL, '2023-02-27 15:37:34', NULL, '2023-02-27 15:37:34'),
(14, 6, 15, 2, 'Asad Nazir', 6, 'CRM', 4, 'New Practice 123', 0, '', 'Info/Other', 'Concerning', 'Test', 'Asad Nazir\r\nsadsadsa\r\nasdsad', 'New Test Company', NULL, 0, NULL, '2023-02-28 16:34:53', NULL, '2023-02-28 16:34:53'),
(15, 6, 15, 2, 'Asad Nazir', 4, 'Audit', 4, 'New Practice 123', 0, '', 'Info/Other', 'Low', 'Test', '<p><strong>Hi Ewa and Team,</strong><br />\n<br />\nAfter reviewing the patient account in detail. We have found that all the services are getting paid by both insurances except the lab services.<br />\nAs we already discussed his lab services amount is on the patient end because of the denials we had received from his both insurance. Now we send all his lab services balance on the patient end. There is a $6744.80 patient balance left as of now.&nbsp;<br />\n<br />\nWarm Regards,<br />\n<strong>Peter Alex!</strong></p>', 'New Test Company', NULL, 0, NULL, '2023-03-01 11:35:16', NULL, '2023-03-01 11:35:16'),
(16, 6, 16, 3, 'New Client 1', 6, 'CRM', 4, 'New Practice 123', 3, 'Team A', 'Info/Other', 'Concerning', 'Client ticket', '<p>Client ticket message</p>', 'Provider', NULL, 0, NULL, '2023-03-02 16:40:14', NULL, '2023-03-02 16:40:14'),
(17, 6, 16, 3, 'New Client 1', 6, 'CRM', 4, 'New Practice 123', 3, 'Team A', 'Info/Other', 'Concerning', 'Client ticket', '<p>Client ticket message</p>', 'Provider', NULL, 0, NULL, '2023-03-02 16:40:53', NULL, '2023-03-02 16:40:53'),
(18, 6, 16, 3, 'New Client 1', 6, 'CRM', 4, 'New Practice 123', 3, 'Team A', 'Info/Other', 'Concerning', 'Client ticket', '<p>Client ticket message</p>', 'Provider', NULL, 0, NULL, '2023-03-02 16:42:38', NULL, '2023-03-02 16:42:38'),
(19, 6, 15, 2, 'Asad Nazir', 6, 'CRM', 5, 'Practice ABC', 3, 'Team A', 'Info/Other', 'Concerning', 'Testing notification', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'New Test Company', NULL, 0, NULL, '2023-03-03 12:13:55', NULL, '2023-03-03 12:24:51');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_attachments`
--

DROP TABLE IF EXISTS `ticket_attachments`;
CREATE TABLE IF NOT EXISTS `ticket_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `reply_id` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0=ticket,1=reply',
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

INSERT INTO `ticket_attachments` (`id`, `ticket_id`, `reply_id`, `type`, `name`, `org_name`, `path`, `ext`, `size`, `created_at`, `updated_at`) VALUES
(1, 11, 0, 0, 'UmU9JYLoqORaVoXIids3rHGHl7X51VI5ZGNl0t7I.xlsx', 'AttendanceList.xlsx', 'uploads/ticket_attachments/UmU9JYLoqORaVoXIids3rHGHl7X51VI5ZGNl0t7I.xlsx', 'xlsx', '22.46 KB', '2023-02-27 20:30:54', '2023-02-27 20:30:54'),
(2, 12, 0, 0, 'UIRQAfyGBerJlnjksiN7awLYXb6qaicdy7i4OAAb.xlsx', 'AttendanceList.xlsx', 'uploads/ticket_attachments/UIRQAfyGBerJlnjksiN7awLYXb6qaicdy7i4OAAb.xlsx', 'xlsx', '22.46 KB', '2023-02-27 20:34:19', '2023-02-27 20:34:19'),
(3, 13, 0, 0, 'fcyAw274dujqS6KP8l8xN2cg0ObhhigBoK2jS83d.xlsx', 'AttendanceList (1).xlsx', 'uploads/ticket_attachments/fcyAw274dujqS6KP8l8xN2cg0ObhhigBoK2jS83d.xlsx', 'xlsx', '22.49 KB', '2023-02-27 20:37:35', '2023-02-27 20:37:35');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_ccs`
--

DROP TABLE IF EXISTS `ticket_ccs`;
CREATE TABLE IF NOT EXISTS `ticket_ccs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `resource_type` int(11) NOT NULL COMMENT '0=department,1=user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `department_id` (`resource_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_ccs`
--

INSERT INTO `ticket_ccs` (`id`, `ticket_id`, `resource_id`, `resource_type`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 0, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(2, 1, 5, 0, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(3, 1, 4, 0, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(4, 2, 3, 0, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(5, 2, 5, 0, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(6, 2, 4, 0, '2023-02-24 16:17:37', '2023-02-24 16:17:37'),
(7, 3, 3, 0, '2023-02-27 11:23:47', '2023-02-27 11:23:47'),
(8, 4, 5, 0, '2023-02-27 11:51:23', '2023-02-27 11:51:23'),
(9, 5, 5, 0, '2023-02-27 11:56:17', '2023-02-27 11:56:17'),
(10, 14, 5, 0, '2023-02-28 16:34:53', '2023-02-28 16:34:53'),
(11, 18, 3, 0, '2023-03-02 16:42:38', '2023-03-02 16:42:38'),
(12, 18, 19, 1, '2023-03-02 16:42:38', '2023-03-02 16:42:38'),
(13, 18, 20, 1, '2023-03-02 16:42:38', '2023-03-02 16:42:38'),
(14, 19, 3, 0, '2023-03-03 12:13:55', '2023-03-03 12:13:55');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
CREATE TABLE IF NOT EXISTS `ticket_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creator_name` varchar(128) NOT NULL,
  `message` text NOT NULL,
  `is_refered` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `user_id`, `creator_name`, `message`, `is_refered`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 11, 15, 'Asad Nazir', '<p><strong>Hi Ewa and Team,</strong><br />\r\n<br />\r\nAfter reviewing the patient account in detail. We have found that all the services are getting paid by both insurances except the lab services.<br />\r\nAs we already discussed his lab services amount is on the patient end because of the denials we had received from his both insurance. Now we send all his lab services balance on the patient end. There is a $6744.80 patient balance left as of now.&nbsp;<br />\r\n<br />\r\nWarm Regards,<br />\r\n<strong>Peter Alex!</strong></p>', 0, '2023-03-01 19:42:24', NULL, '2023-03-01 20:49:49'),
(2, 11, 15, 'Asad Nazir', '<p><strong>Hi Ewa and Team,</strong><br />\r\n<br />\r\nAfter reviewing the patient account in detail. We have found that all the services are getting paid by both insurances except the lab services.<br />\r\nAs we already discussed his lab services amount is on the patient end because of the denials we had received from his both insurance. Now we send all his lab services balance on the patient end. There is a $6744.80 patient balance left as of now.&nbsp;<br />\r\n<br />\r\nWarm Regards,<br />\r\n<strong>Peter Alex!</strong></p>', 0, '2023-03-01 19:42:24', NULL, '2023-03-01 20:49:54'),
(3, 11, 15, 'Asad Nazir', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 0, '2023-03-02 12:55:52', NULL, '2023-03-02 12:55:52'),
(4, 11, 15, 'Asad Nazir', '<p>Refered.</p>', 0, '2023-03-02 13:18:34', NULL, '2023-03-02 13:18:34'),
(5, 11, 15, 'Asad Nazir', '<p class=\"text-center text-danger mb-0 font-weight-bold\">This ticket is forwarded from Sales to CRM</p>', 1, '2023-03-02 13:18:34', NULL, '2023-03-02 22:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '2' COMMENT '0:dev,1:superadmin, 2:user, 3:doctor',
  `status` int(11) NOT NULL DEFAULT '1',
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `psudo_name` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `timezone` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `employee_id`, `designation_id`, `type`, `status`, `firstname`, `lastname`, `psudo_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `last_activity`, `timezone`, `created_at`, `updated_at`) VALUES
(10, 0, 0, 2, 0, 1, 'Junaid', 'Khan', NULL, 'junaid@mail.com', '', NULL, '$2a$12$TWJEfJ3kvFfnS49Yn5lvMe4qqxJUy/Oy1Gy5fvHgkzpshsC3WlApi', 'KtWFy3D6RihiQYwg2xlCZ0NtoNlDrsDkfJsuOaNF4jC2Ckq7hUQmaemU8nbh', NULL, 0, '2023-01-04 04:24:33', '2023-02-24 09:42:42'),
(11, 4, 0, 2, 2, 1, 'Super', 'Admin', NULL, 'superadmin4@bmb.com', '', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, 0, '2023-01-19 13:39:09', '2023-01-19 13:39:09'),
(12, 5, 0, 2, 2, 1, 'Super', 'Admin', NULL, 'superadmin5@test.com', '', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, 0, '2023-01-22 12:33:56', '2023-01-22 12:33:56'),
(13, 1, 0, 2, 2, 1, 'John D.', 'John D.', NULL, 'JohnDMurray@teleworm.us', '', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, 0, '2023-01-25 10:36:08', '2023-01-25 10:36:08'),
(14, 1, 0, 2, 3, 1, 'test', 'client', NULL, 'client@gmail.com', '', NULL, '$2a$12$DAeA/CC/k2xUF8g1hN6toeW6cnwZFtWKDaBcEEW5Y4Fptw1OaVWAC', NULL, NULL, 0, '2023-02-05 10:19:42', '2023-02-05 10:19:42'),
(15, 6, 2703, 6, 2, 2, 'Asad', 'Nazir', 'Asad Nazir Awan', 'superadmin6@new.com', 'superadmin6', NULL, '$2y$10$T9jRrchuuBhVQfaaYMdlLubDgSlSz/x9UR0V8J0XZkE4zLYKM6U4W', NULL, NULL, 7, '2023-02-16 16:08:10', '2023-03-20 15:18:50'),
(16, 6, 0, 2, 3, 10, 'New', 'Client 1', NULL, 'newclient@gmail.com', 'newclient', NULL, '$2y$10$T9jRrchuuBhVQfaaYMdlLubDgSlSz/x9UR0V8J0XZkE4zLYKM6U4W', NULL, NULL, 4, '2023-02-16 16:10:37', '2023-03-20 15:27:50'),
(17, 6, 0, 2, 2, 2, 'Test', 'Test', NULL, 'test@gmail.com', '', NULL, '$2y$10$KA8vHn1FJekCLjBDir/Lhupag4peomZl1wjv46CfjoePjiO3s1UfS', NULL, NULL, 0, '2023-02-21 12:54:37', '2023-03-07 12:22:27'),
(18, 6, 0, 2, 2, 12, 'Test', 'User', NULL, 'testuser@gmail.com', '', NULL, '$2y$10$ZQuRQ6iuGSvo7nmORZGVy.lMWvW02ow3pYCkJltN5U/f4JLmKO.wi', NULL, NULL, 0, '2023-02-27 12:43:41', '2023-03-07 12:23:13'),
(19, 6, 0, 2, 3, 1, 'New', 'Client 2', NULL, 'newclient2@gmail.com', '', NULL, '$2y$10$Ovd3DnCDg5o2iAv0YELZnuBf8fqNsUFxZBiLClLDaxIyWiRDKYKi.', NULL, NULL, 0, '2023-03-02 15:49:40', '2023-03-02 15:49:40'),
(20, 6, 0, 2, 3, 1, 'New', 'Client 3', NULL, 'newclient3@gmail.com', '', NULL, '$2y$10$iqKPkotw5IJ5sgn9cA48cuQz6zJy/fTJo.ut/PV6iIfL1HNWHF2pe', NULL, NULL, 0, '2023-03-02 16:12:25', '2023-03-02 16:12:25');

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
