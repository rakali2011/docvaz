-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 17, 2023 at 08:45 PM
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
-- Database: `docuhub`
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
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
CREATE TABLE IF NOT EXISTS `audits` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'updated', 'App\\Models\\Book', 1, '{\"name\":\"test book\"}', '{\"name\":\"sadsadasd\"}', 'http://127.0.0.1:8000/book', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 12:18:57', '2023-03-28 12:18:57'),
(2, 'App\\Models\\User', 15, 'created', 'App\\Models\\Department', 9, '[]', '{\"name\":\"Coding\",\"parent_id\":\"0\",\"company_id\":6,\"id\":9}', 'http://127.0.0.1:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 13:44:07', '2023-03-28 13:44:07'),
(3, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Department', 9, '{\"name\":\"Coding\"}', '{\"name\":\"Codings\"}', 'http://127.0.0.1:8000/update-department/eyJpdiI6InhnRDJNTVlsY2VMNU1PVklVZzJ4NHc9PSIsInZhbHVlIjoiWG83TUduT1paejlvbFQ4bjhJaVJKZz09IiwibWFjIjoiZmQ1NDQ2YjdmY2M4ZTU1Y2Q5ZjAzZWViZTJhNmFhY2Y3M2E3OThkOGRmOWY5OTMzNzk3N2U2OGUwOTFlYmEwNiIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 13:44:55', '2023-03-28 13:44:55'),
(4, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Department', 9, '{\"name\":\"Codings\"}', '{\"name\":\"Coding\"}', 'http://127.0.0.1:8000/update-department/eyJpdiI6IkRTUWo4UE1lVnVKcSt4R1VoZVRKdWc9PSIsInZhbHVlIjoiNUl4dlpMMzBpN2d4R1E1WlFNQjJxdz09IiwibWFjIjoiNzk3YmQ4ZmFkZGJhNjYwYWYzZmNiNDQyMDRmMjc1ZDhlM2M0NGI4YTA5NDcyZDlmODRmNDRlZTE1MGQ1NTU3YiIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 13:45:43', '2023-03-28 13:45:43'),
(5, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Department', 8, '{\"name\":\"Claim Submission\"}', '{\"name\":\"Claim Submissions\"}', 'http://127.0.0.1:8000/update-department/eyJpdiI6IlpQNVJ0eFVTQm8xSmVOOW5CTFcvd3c9PSIsInZhbHVlIjoiaURtL29iOUFBTjFFd3lodEFNaVg4QT09IiwibWFjIjoiNGQ4ZTgyYmUyYmZjODliYjAzZjI0NDViYjk3ZjEzN2RlNTFhZGIxOGMzZTVhZmZiMzVjOWQwZjQ2YWYwOTBmOCIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 13:48:00', '2023-03-28 13:48:00'),
(6, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Department', 8, '{\"name\":\"Claim Submissions\"}', '{\"name\":\"Claim Submission\"}', 'http://127.0.0.1:8000/update-department/eyJpdiI6Im43ODdyMDduV0JydjcxNis4RjZBWXc9PSIsInZhbHVlIjoiRGJXZ0lGMCt3ajZTOTNIV3VVTlFRZz09IiwibWFjIjoiNmJmZjE4MDA2YmVmOTJkYTg4ZDVjNjRiYTM0NDA1NjJkMDgyNzhmY2RiNGRhZGQxNTQ2MDljNTY4YWNkNTZkYSIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 13:48:15', '2023-03-28 13:48:15'),
(7, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 17, '{\"employee_id\":0,\"psudo_name\":null,\"username\":\"\"}', '{\"employee_id\":\"23213\",\"psudo_name\":\"Asad Nazir Awan\",\"username\":\"admin\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6Ik5pQk4zZkVYalpibmE2U0xTNVlpclE9PSIsInZhbHVlIjoiM1oxbmMvQ3g1dVd3YTRhWHF5TzQvZz09IiwibWFjIjoiNWQwNDZkODNiMWE3ZDA2YTkzMGM5NDM5OWU2ZmRiNmVhOThhMTRkNjUzZjEzMWE3ODJlNjI0MDBhODk4OGJkNCIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 14:57:06', '2023-03-28 14:57:06'),
(8, 'App\\Models\\User', 15, 'updated', 'App\\Models\\File', 9, '{\"doc_type\":4}', '{\"doc_type\":\"3\"}', 'http://127.0.0.1:8000/update-file/eyJpdiI6IjR4OXdXaS84dFdjdk52dW12eUVSL3c9PSIsInZhbHVlIjoibnBWK1g3eXcxcXI1bVE0dm4xWldWUT09IiwibWFjIjoiYWZmNTVjODVlNjdiN2JjMTAwZjU0N2E5MTExMDBiOTA2ZDg1NThhYzViY2UwNWFjN2RjNzRmYTkyNzM2OTM0ZiIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 14:59:28', '2023-03-28 14:59:28'),
(9, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 1, '{\"message\":\"test message\"}', '{\"message\":\"<p>test message abc<\\/p>\"}', 'http://127.0.0.1:8000/tickets/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 15:00:22', '2023-03-28 15:00:22'),
(10, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Designation', 5, '{\"name\":\"Assistant Manager Operations\"}', '{\"name\":\"Assistant Manager Operations (AMO)\"}', 'http://127.0.0.1:8000/designations/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 15:06:20', '2023-03-28 15:06:20'),
(11, 'App\\Models\\User', 15, 'updated', 'App\\Models\\DocumentType', 9, '{\"name\":\"Others\"}', '{\"name\":\"Other\"}', 'http://127.0.0.1:8000/document_types/9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 15:06:50', '2023-03-28 15:06:50'),
(12, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Status', 19, '{\"name\":\"Coded\"}', '{\"name\":\"Code\"}', 'http://127.0.0.1:8000/statuses/19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 15:07:13', '2023-03-28 15:07:13'),
(13, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Status', 19, '{\"name\":\"Code\"}', '{\"name\":\"Coded\"}', 'http://127.0.0.1:8000/statuses/19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 15:07:29', '2023-03-28 15:07:29'),
(14, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Practice', 7, '{\"avg_charges\":null,\"physical_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"mailing_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"location_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"focal_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}]\",\"owner_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}]\",\"provider_information\":\"[{\\\"dob\\\": null, \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}]\",\"caqh\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"clearinghouse\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"ehr\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"management_software\":\"[{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}]\",\"payers_info\":\"[{\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": null, \\\"enroll_with\\\": null, \\\"provider_name\\\": null, \\\"effective_date\\\": null}]\",\"claim_creation_frequency\":\"{\\\"value\\\": null, \\\"option\\\": null}\",\"bellmedex_services\":\"{\\\"ar\\\": 0, \\\"phd\\\": 0, \\\"coding\\\": 0, \\\"billing\\\": 0, \\\"ar_start\\\": null, \\\"authorization\\\": 0, \\\"credentialing\\\": 0, \\\"eligibility_check\\\": 0, \\\"patient_statement\\\": 0, \\\"key_billing_issues\\\": null, \\\"special_instructions\\\": null, \\\"complementary_services\\\": null}\",\"crm\":\"{\\\"welcome_email\\\": null, \\\"orientation_by\\\": null, \\\"mom_sharing_date\\\": null, \\\"docuhub_orientation\\\": \\\"0\\\", \\\"attended_by_crm_team\\\": null, \\\"orientation_datetime\\\": null, \\\"onboarding_metting_date\\\": null}\",\"operations\":\"{\\\"login_date\\\": null, \\\"logins_receipt\\\": \\\"0\\\", \\\"sop_preparation\\\": \\\"0\\\", \\\"preparation_date\\\": null, \\\"first_billing_received\\\": null, \\\"first_service_provided_name\\\": null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_auth\\\": null, \\\"thresh_elect\\\": null, \\\"thresh_portal\\\": null, \\\"thresh_denials\\\": null, \\\"thresh_posting\\\": null, \\\"thresh_rejections\\\": null, \\\"thresh_eligibility\\\": null, \\\"thresh_charge_entry\\\": null, \\\"thresh_posting_elect\\\": null, \\\"thresh_charge_elect_checkbox\\\": 0, \\\"thresh_charge_manual_checkbox\\\": 0, \\\"thresh_posting_elect_checkbox\\\": 0, \\\"thresh_posting_manual_checkbox\\\": 0, \\\"thresh_eligibility_cal_checkbox\\\": 0, \\\"thresh_eligibility_portal_checkbox\\\": 0, \\\"thresh_charge_with_demo_graphics_checkbox\\\": 0}\",\"thresh_payer\":\"[{\\\"name\\\": null, \\\"claims\\\": null}]\"}', '{\"avg_charges\":\"1500\",\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null}]\",\"claim_creation_frequency\":\"{\\\"option\\\":null,\\\"value\\\":null}\",\"bellmedex_services\":\"{\\\"credentialing\\\":0,\\\"coding\\\":0,\\\"phd\\\":0,\\\"billing\\\":0,\\\"eligibility_check\\\":0,\\\"authorization\\\":0,\\\"patient_statement\\\":0,\\\"ar\\\":0,\\\"ar_start\\\":null,\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":\\\"0\\\",\\\"orientation_datetime\\\":null,\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":null}\",\"operations\":\"{\\\"logins_receipt\\\":\\\"0\\\",\\\"login_date\\\":null,\\\"sop_preparation\\\":\\\"0\\\",\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_eligibility_cal_checkbox\\\":0,\\\"thresh_eligibility\\\":null,\\\"thresh_charge_manual_checkbox\\\":0,\\\"thresh_charge_with_demo_graphics_checkbox\\\":0,\\\"thresh_charge_entry\\\":null,\\\"thresh_posting_manual_checkbox\\\":0,\\\"thresh_posting\\\":null,\\\"thresh_eligibility_portal_checkbox\\\":0,\\\"thresh_portal\\\":null,\\\"thresh_charge_elect_checkbox\\\":0,\\\"thresh_elect\\\":null,\\\"thresh_posting_elect_checkbox\\\":0,\\\"thresh_posting_elect\\\":null,\\\"thresh_auth\\\":null,\\\"thresh_rejections\\\":null,\\\"thresh_denials\\\":null}\",\"thresh_payer\":\"[{\\\"name\\\":null,\\\"claims\\\":null}]\"}', 'http://127.0.0.1:8000/update-practice/eyJpdiI6ImZ1ZHBwYm1ua1hmVHF1djE1dU8rNWc9PSIsInZhbHVlIjoiN01yNlM0bzFXU0x2V0lqVjJlTzZMQT09IiwibWFjIjoiOTA0ZTUyODRhNWE0YmI0MGU0ZmY2ZTRlNDdkZDI1MzBmMmMyNzcwZGM4MjhkODlhYjdmODZiMTk1NjQzNDQ5ZiIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-28 15:13:23', '2023-03-28 15:13:23'),
(15, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Designation', 6, '{\"name\":\"Senior Manager Operations\"}', '{\"name\":\"Senior Manager Operations (SMO)\"}', 'http://127.0.0.1:8000/designations/6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 08:56:40', '2023-03-29 08:56:40'),
(16, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Designation', 4, '{\"name\":\"Manager Operations\"}', '{\"name\":\"Manager Operations (MO)\"}', 'http://127.0.0.1:8000/designations/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 08:57:01', '2023-03-29 08:57:01'),
(17, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Designation', 3, '{\"name\":\"Vice President\"}', '{\"name\":\"Vice President (VP)\"}', 'http://127.0.0.1:8000/designations/3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 08:57:14', '2023-03-29 08:57:14'),
(18, 'App\\Models\\User', 15, 'created', 'App\\Models\\Ticket', 20, '[]', '{\"company_id\":6,\"user_id\":15,\"user_type\":2,\"department_id\":\"7\",\"target_id\":\"4\",\"team_id\":3,\"type\":\"Info\\/Other\",\"priority\":\"Concerning\",\"subject\":\"Test\",\"message\":\"<p>sdadsadsa<\\/p>\",\"creator\":\"New Test Company\",\"is_external\":\"1\",\"id\":20}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 12:24:55', '2023-03-29 12:24:55'),
(19, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketCC', 15, '[]', '{\"ticket_id\":20,\"resource_id\":\"4\",\"resource_type\":0,\"id\":15}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 12:24:55', '2023-03-29 12:24:55'),
(20, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketAttachment', 4, '[]', '{\"ticket_id\":20,\"reply_id\":0,\"type\":0,\"name\":\"fcpISL9YWBzG8PEFAbkNvytFSuLI6SwsHv3kyZox.xlsx\",\"org_name\":\"14.xlsx\",\"path\":\"uploads\\/ticket_attachments\\/fcpISL9YWBzG8PEFAbkNvytFSuLI6SwsHv3kyZox.xlsx\",\"ext\":\"xlsx\",\"size\":\"22.46 KB\",\"id\":4}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 12:24:57', '2023-03-29 12:24:57'),
(21, 'App\\Models\\User', 15, 'created', 'App\\Models\\Ticket', 21, '[]', '{\"company_id\":6,\"user_id\":15,\"user_type\":2,\"department_id\":\"4\",\"target_id\":\"7\",\"team_id\":0,\"type\":\"Info\\/Other\",\"priority\":\"Concerning\",\"subject\":\"Ticket 21\",\"message\":\"<p>message 21<\\/p>\",\"creator\":\"New Test Company\",\"is_external\":\"0\",\"id\":21}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 12:42:25', '2023-03-29 12:42:25'),
(22, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketCC', 16, '[]', '{\"ticket_id\":21,\"resource_id\":\"7\",\"resource_type\":0,\"id\":16}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 12:42:25', '2023-03-29 12:42:25'),
(23, 'App\\Models\\User', 15, 'created', 'App\\Models\\Ticket', 22, '[]', '{\"company_id\":6,\"user_id\":15,\"user_type\":2,\"department_id\":\"4\",\"target_id\":\"3\",\"team_id\":0,\"type\":\"Info\\/Other\",\"priority\":\"Concerning\",\"subject\":\"Ticket 22\",\"message\":\"<p>message 22<\\/p>\",\"creator\":\"New Test Company\",\"is_external\":\"0\",\"id\":22}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:02:14', '2023-03-29 13:02:14'),
(24, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketCC', 17, '[]', '{\"ticket_id\":22,\"resource_id\":\"7\",\"resource_type\":0,\"id\":17}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:02:14', '2023-03-29 13:02:14'),
(25, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketCC', 18, '[]', '{\"ticket_id\":22,\"resource_id\":\"9\",\"resource_type\":0,\"id\":18}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:02:14', '2023-03-29 13:02:14'),
(26, 'App\\Models\\User', 15, 'created', 'App\\Models\\Ticket', 23, '[]', '{\"company_id\":6,\"user_id\":15,\"user_type\":2,\"department_id\":\"4\",\"target_id\":\"3\",\"team_id\":0,\"type\":\"Info\\/Other\",\"priority\":\"Concerning\",\"subject\":\"Ticket 23\",\"message\":\"<p>message 23<\\/p>\",\"creator\":\"New Test Company\",\"is_external\":\"0\",\"id\":23}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(27, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketCC', 19, '[]', '{\"ticket_id\":23,\"resource_id\":\"7\",\"resource_type\":0,\"id\":19}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(28, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketCC', 20, '[]', '{\"ticket_id\":23,\"resource_id\":\"9\",\"resource_type\":0,\"id\":20}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(29, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketLog', 3, '[]', '{\"ticket_id\":23,\"user_id\":15,\"seen\":0,\"id\":3}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(30, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketLog', 4, '[]', '{\"ticket_id\":23,\"user_id\":16,\"seen\":0,\"id\":4}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(31, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketLog', 5, '[]', '{\"ticket_id\":23,\"user_id\":19,\"seen\":0,\"id\":5}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(32, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketLog', 6, '[]', '{\"ticket_id\":23,\"user_id\":20,\"seen\":0,\"id\":6}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(33, 'App\\Models\\User', 15, 'created', 'App\\Models\\Ticket', 24, '[]', '{\"company_id\":6,\"user_id\":15,\"user_type\":2,\"department_id\":\"4\",\"target_id\":\"7\",\"team_id\":0,\"type\":\"Info\\/Other\",\"priority\":\"Concerning\",\"subject\":\"Ticket 24\",\"message\":\"<p>Message 24<\\/p>\",\"creator\":\"New Test Company\",\"is_external\":\"1\",\"id\":24}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:06:45', '2023-03-29 13:06:45'),
(34, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketCC', 21, '[]', '{\"ticket_id\":24,\"resource_id\":\"6\",\"resource_type\":0,\"id\":21}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:06:45', '2023-03-29 13:06:45'),
(35, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketCC', 22, '[]', '{\"ticket_id\":24,\"resource_id\":\"3\",\"resource_type\":0,\"id\":22}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:06:45', '2023-03-29 13:06:45'),
(36, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketAttachment', 5, '[]', '{\"ticket_id\":24,\"reply_id\":0,\"type\":0,\"name\":\"ukxQBLcBpKtvkIBuArVLZW8AA31D3u1JDQCl1jN1.xlsx\",\"org_name\":\"20220509093844_Practice Info Sheet.xlsx\",\"path\":\"uploads\\/ticket_attachments\\/ukxQBLcBpKtvkIBuArVLZW8AA31D3u1JDQCl1jN1.xlsx\",\"ext\":\"xlsx\",\"size\":\"12.57 KB\",\"id\":5}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:06:46', '2023-03-29 13:06:46'),
(37, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketAttachment', 6, '[]', '{\"ticket_id\":24,\"reply_id\":0,\"type\":0,\"name\":\"ci3Pal8Tujw4q6dCI2HdLrl1gFqgrZAxPwqitqam.xlsx\",\"org_name\":\"20220915010715_Practice Info Sheet.xlsx\",\"path\":\"uploads\\/ticket_attachments\\/ci3Pal8Tujw4q6dCI2HdLrl1gFqgrZAxPwqitqam.xlsx\",\"ext\":\"xlsx\",\"size\":\"12.59 KB\",\"id\":6}', 'http://127.0.0.1:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 13:06:47', '2023-03-29 13:06:47'),
(38, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 18, '{\"employee_id\":0,\"psudo_name\":null,\"username\":\"\"}', '{\"employee_id\":\"2312\",\"psudo_name\":\"abc\",\"username\":\"frank\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6InNlRXhrcitHem5uNDdTczlxNDhyYXc9PSIsInZhbHVlIjoiWlZNVWExaisrRnZlclVORWpQQ2RtQT09IiwibWFjIjoiY2UyOGEwYWQ1YjQ2OTE4MjgyM2RjM2ZlZGJkMDBlOGEwNWJlY2ViZDExODNkZTZjYmY2ODQzNGY5ZDYxNGE5YSIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-03-29 14:34:23', '2023-03-29 14:34:23'),
(39, 'App\\Models\\User', 15, 'created', 'App\\Models\\Designation', 7, '[]', '{\"name\":\"Director\",\"company_id\":6,\"id\":7}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-03 14:00:35', '2023-04-03 14:00:35'),
(40, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"KtWFy3D6RihiQYwg2xlCZ0NtoNlDrsDkfJsuOaNF4jC2Ckq7hUQmaemU8nbh\"}', '{\"remember_token\":\"DOGMciFOE9hAZ2z8kbr1FdaDASBRhGKe8TtNEEGxdUnH5R3FEym6IRdzs4yo\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 08:28:56', '2023-04-04 08:28:56'),
(41, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 17, '{\"designation_id\":2}', '{\"designation_id\":\"5\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6InZQSk5ZT1RhOVdIS0EvOUJpK01VT3c9PSIsInZhbHVlIjoiVWFmQm1RaEFxZ2ladndkMjBkUmkrdz09IiwibWFjIjoiOTUyZGEwN2MxZmMyMDg4MDNlZjQ2N2JkMGMwZGE3NjJkZWJhMDEzOTY2YTAxYjFjZmRiYjdkNTNkZTA1NjNkNyIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 11:12:23', '2023-04-04 11:12:23'),
(42, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 18, '{\"designation_id\":2}', '{\"designation_id\":\"4\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6IjVFZ3Y0RnhCZ0c0dy9aWWErSHp2a2c9PSIsInZhbHVlIjoiYVkyYldDb3FmYmtic1NVQjJZQ3NkZz09IiwibWFjIjoiNTMxYWM4MzcxMDJjNjZjOTVmODYxN2U3NjEyNGYxYzU3MTU4MTMzMGQ1NWUzNzNjMDE5YWQ0MjU3MTUxZjdlMCIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 11:12:36', '2023-04-04 11:12:36'),
(43, 'App\\Models\\User', 15, 'created', 'App\\Models\\File', 15, '[]', '{\"practice_id\":4,\"user_id\":15,\"status\":\"14\",\"doc_type\":\"8\",\"name\":\"vvwGLaPpkKuEUuGrdjcqJAW6QvZ0g9NNf3ul7ZZt.pdf\",\"org_name\":\"Document.pdf\",\"path\":\"uploads\\/files\\/04-2023\\/vvwGLaPpkKuEUuGrdjcqJAW6QvZ0g9NNf3ul7ZZt.pdf\",\"ext\":\"pdf\",\"size\":\"13.62 KB\",\"id\":15}', 'http://127.0.0.1:8000/post-file', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 14:50:14', '2023-04-04 14:50:14'),
(44, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 24, '{\"priority\":\"Concerning\",\"response_at\":null,\"status\":0}', '{\"priority\":\"High\",\"response_at\":\"2023-04-04 20:11:52\",\"status\":\"26\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 15:11:52', '2023-04-04 15:11:52'),
(45, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 19, '{\"priority\":\"High\",\"response_at\":null,\"status\":26}', '{\"priority\":\"Concerning\",\"response_at\":\"2023-04-04 20:50:18\",\"status\":\"23\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 15:50:18', '2023-04-04 15:50:18'),
(46, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 6, '{\"priority\":\"High\",\"response_at\":null}', '{\"priority\":\"Concerning\",\"response_at\":\"2023-04-04 20:51:10\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 15:51:10', '2023-04-04 15:51:10'),
(47, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 19, '{\"priority\":\"Concerning\",\"response_at\":\"2023-04-04 20:50:18\"}', '{\"priority\":\"Low\",\"response_at\":\"2023-04-04 20:54:10\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 15:54:10', '2023-04-04 15:54:10'),
(48, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 20, '{\"priority\":\"Concerning\",\"response_at\":null,\"status\":0}', '{\"priority\":\"Low\",\"response_at\":\"2023-04-04 20:54:41\",\"status\":\"26\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 15:54:41', '2023-04-04 15:54:41'),
(49, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 21, '{\"priority\":\"Concerning\",\"response_at\":null,\"status\":0}', '{\"priority\":\"Low\",\"response_at\":\"2023-04-04 20:58:12\",\"status\":\"26\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 15:58:12', '2023-04-04 15:58:12'),
(50, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 21, '{\"priority\":\"Low\",\"response_at\":\"2023-04-04 20:58:12\"}', '{\"priority\":\"Medium\",\"response_at\":\"2023-04-04 20:59:14\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-04 15:59:14', '2023-04-04 15:59:14'),
(51, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 24, '{\"priority\":\"High\",\"response_at\":\"2023-04-04 20:11:52\"}', '{\"priority\":\"Medium\",\"response_at\":\"2023-04-05 15:06:17\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-05 10:06:17', '2023-04-05 10:06:17'),
(52, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 21, '{\"priority\":\"Medium\",\"response_at\":\"2023-04-04 20:59:14\"}', '{\"priority\":\"Low\",\"response_at\":\"2023-04-05 15:24:03\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-05 10:24:03', '2023-04-05 10:24:03'),
(53, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 22, '{\"priority\":\"Concerning\",\"response_at\":null,\"status\":0}', '{\"priority\":\"Medium\",\"response_at\":\"2023-04-05 15:34:35\",\"status\":\"26\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-05 10:34:35', '2023-04-05 10:34:35'),
(54, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 1, '{\"response_at\":null}', '{\"response_at\":\"2023-04-06 14:44:42\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-06 09:44:42', '2023-04-06 09:44:42'),
(55, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketReply', 18, '[]', '{\"ticket_id\":\"1\",\"user_id\":15,\"creator_name\":\"Asad Nazir\",\"message\":\"<p>test reply<\\/p>\",\"is_refered\":0,\"id\":18}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-06 09:44:43', '2023-04-06 09:44:43'),
(56, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketAttachment', 7, '[]', '{\"ticket_id\":\"1\",\"reply_id\":18,\"type\":1,\"name\":\"y4MrxeRWDeuC7k0eMwZ2p9AcqlyFHLDiZostSU3u.xlsx\",\"org_name\":\"AttendanceList.xlsx\",\"path\":\"uploads\\/ticket_attachments\\/y4MrxeRWDeuC7k0eMwZ2p9AcqlyFHLDiZostSU3u.xlsx\",\"ext\":\"xlsx\",\"size\":\"22.46 KB\",\"id\":7}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-06 09:44:43', '2023-04-06 09:44:43'),
(57, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketAttachment', 8, '[]', '{\"ticket_id\":\"1\",\"reply_id\":18,\"type\":1,\"name\":\"FkEwDt1hJI7123H0nNu5OCXq5kk1rmJ3LQKTIl1R.xls\",\"org_name\":\"16740728274397_#_ADD-Clinic-Of-Idaho-AR-Report (1).xls\",\"path\":\"uploads\\/ticket_attachments\\/FkEwDt1hJI7123H0nNu5OCXq5kk1rmJ3LQKTIl1R.xls\",\"ext\":\"xls\",\"size\":\"115.00 KB\",\"id\":8}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-06 09:44:43', '2023-04-06 09:44:43'),
(58, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketAttachment', 9, '[]', '{\"ticket_id\":\"1\",\"reply_id\":18,\"type\":1,\"name\":\"r498Bqqrb5vRQkzieHn7z0viS1piKCeO4jUiA3wz.xlsx\",\"org_name\":\"20220509093844_Practice Info Sheet.xlsx\",\"path\":\"uploads\\/ticket_attachments\\/r498Bqqrb5vRQkzieHn7z0viS1piKCeO4jUiA3wz.xlsx\",\"ext\":\"xlsx\",\"size\":\"12.57 KB\",\"id\":9}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-06 09:44:43', '2023-04-06 09:44:43'),
(59, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketAttachment', 10, '[]', '{\"ticket_id\":\"1\",\"reply_id\":18,\"type\":1,\"name\":\"DESDToPAZwM7IHhDckovKZDvHZ4w78kJpnNzv2sx.xlsx\",\"org_name\":\"20220915010715_Practice Info Sheet.xlsx\",\"path\":\"uploads\\/ticket_attachments\\/DESDToPAZwM7IHhDckovKZDvHZ4w78kJpnNzv2sx.xlsx\",\"ext\":\"xlsx\",\"size\":\"12.59 KB\",\"id\":10}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-06 09:44:43', '2023-04-06 09:44:43'),
(60, NULL, NULL, 'created', 'App\\Models\\Practice', 8, '[]', '{\"company_id\":6,\"link_id\":3,\"name\":\"Test ABC by link\",\"speciality\":null,\"avg_charges\":null,\"group_npi\":null,\"group_ptan\":null,\"tax_id\":null,\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"dmail_emails\":null,\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null}]\",\"claim_creation_frequency\":\"{\\\"option\\\":\\\"daily\\\",\\\"value\\\":\\\"1\\\"}\",\"bellmedex_services\":\"{\\\"credentialing\\\":0,\\\"coding\\\":0,\\\"phd\\\":0,\\\"billing\\\":0,\\\"eligibility_check\\\":0,\\\"authorization\\\":0,\\\"patient_statement\\\":0,\\\"ar\\\":0,\\\"ar_start\\\":null,\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\": null,\\\"orientation_by\\\": null,\\\"mom_sharing_date\\\": null,\\\"docuhub_orientation\\\": \\\"0\\\",\\\"attended_by_crm_team\\\": null,\\\"orientation_datetime\\\": null,\\\"onboarding_metting_date\\\": null}\",\"operations\":\"{\\\"logins_receipt\\\": null,\\\"sop_preparation\\\": \\\"0\\\",\\\"preparation_date\\\": null,\\\"first_billing_received\\\": null,\\\"first_service_provided_name\\\": null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_auth\\\": null,\\\"thresh_elect\\\": null,\\\"thresh_portal\\\": null,\\\"thresh_denials\\\": null,\\\"thresh_posting\\\": null,\\\"thresh_rejections\\\": null,\\\"thresh_eligibility\\\": null,\\\"thresh_charge_entry\\\": null,\\\"thresh_posting_elect\\\": null,\\\"thresh_charge_elect_checkbox\\\": \\\"0\\\",\\\"thresh_charge_manual_checkbox\\\": \\\"0\\\",\\\"thresh_posting_elect_checkbox\\\": \\\"0\\\",\\\"thresh_posting_manual_checkbox\\\": \\\"0\\\",\\\"thresh_eligibility_cal_checkbox\\\": \\\"0\\\",\\\"thresh_eligibility_portal_checkbox\\\": \\\"0\\\",\\\"thresh_charge_with_demo_graphics_checkbox\\\": \\\"0\\\"}\",\"thresh_payer\":\"[{\\\"name\\\": null,\\\"claims\\\": null}]\",\"id\":8}', 'http://127.0.0.1:8000/practice_info_form', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-14 12:12:48', '2023-04-14 12:12:48'),
(61, NULL, NULL, 'updated', 'App\\Models\\Practice', 8, '{\"physical_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"mailing_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"location_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"focal_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}]\",\"owner_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}]\",\"provider_information\":\"[{\\\"dob\\\": null, \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}]\",\"caqh\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"clearinghouse\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"ehr\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"management_software\":\"[{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}]\",\"payers_info\":\"[{\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": null, \\\"enroll_with\\\": null, \\\"provider_name\\\": null, \\\"effective_date\\\": null}]\",\"claim_creation_frequency\":\"{\\\"value\\\": \\\"1\\\", \\\"option\\\": \\\"daily\\\"}\",\"bellmedex_services\":\"{\\\"ar\\\": 0, \\\"phd\\\": 0, \\\"coding\\\": 0, \\\"billing\\\": 0, \\\"ar_start\\\": null, \\\"authorization\\\": 0, \\\"credentialing\\\": 0, \\\"eligibility_check\\\": 0, \\\"patient_statement\\\": 0, \\\"key_billing_issues\\\": null, \\\"special_instructions\\\": null, \\\"complementary_services\\\": null}\"}', '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null}]\",\"claim_creation_frequency\":\"{\\\"option\\\":null,\\\"value\\\":null}\",\"bellmedex_services\":\"{\\\"credentialing\\\":\\\"1\\\",\\\"coding\\\":\\\"1\\\",\\\"phd\\\":\\\"1\\\",\\\"billing\\\":\\\"1\\\",\\\"eligibility_check\\\":\\\"1\\\",\\\"authorization\\\":\\\"1\\\",\\\"patient_statement\\\":\\\"1\\\",\\\"ar\\\":\\\"1\\\",\\\"ar_start\\\":\\\"2023-04-14\\\",\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\"}', 'http://127.0.0.1:8000/practice_info_form/8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-14 13:01:06', '2023-04-14 13:01:06'),
(62, NULL, NULL, 'updated', 'App\\Models\\Practice', 8, '{\"physical_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"mailing_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"location_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"focal_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}]\",\"owner_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}]\",\"provider_information\":\"[{\\\"dob\\\": null, \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}]\",\"caqh\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"clearinghouse\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"ehr\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"management_software\":\"[{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}]\",\"payers_info\":\"[{\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": null, \\\"enroll_with\\\": null, \\\"provider_name\\\": null, \\\"effective_date\\\": null}]\",\"claim_creation_frequency\":\"{\\\"value\\\": null, \\\"option\\\": null}\",\"bellmedex_services\":\"{\\\"ar\\\": \\\"1\\\", \\\"phd\\\": \\\"1\\\", \\\"coding\\\": \\\"1\\\", \\\"billing\\\": \\\"1\\\", \\\"ar_start\\\": \\\"2023-04-14\\\", \\\"authorization\\\": \\\"1\\\", \\\"credentialing\\\": \\\"1\\\", \\\"eligibility_check\\\": \\\"1\\\", \\\"patient_statement\\\": \\\"1\\\", \\\"key_billing_issues\\\": null, \\\"special_instructions\\\": null, \\\"complementary_services\\\": null}\"}', '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":\\\"individual\\\",\\\"enroll_with\\\":\\\"tax_id\\\",\\\"effective_date\\\":\\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"option\\\":\\\"daily\\\",\\\"value\\\":\\\"1\\\"}\",\"bellmedex_services\":\"{\\\"credentialing\\\":\\\"1\\\",\\\"coding\\\":\\\"1\\\",\\\"phd\\\":\\\"1\\\",\\\"billing\\\":\\\"1\\\",\\\"eligibility_check\\\":\\\"1\\\",\\\"authorization\\\":\\\"1\\\",\\\"patient_statement\\\":\\\"1\\\",\\\"ar\\\":\\\"1\\\",\\\"ar_start\\\":\\\"2023-04-14\\\",\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\"}', 'http://127.0.0.1:8000/practice_info_form/8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-14 14:18:47', '2023-04-14 14:18:47'),
(63, NULL, NULL, 'updated', 'App\\Models\\Practice', 8, '{\"speciality\":null,\"physical_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"mailing_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"location_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"focal_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}]\",\"owner_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}]\",\"provider_information\":\"[{\\\"dob\\\": null, \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}]\",\"caqh\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"clearinghouse\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"ehr\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"management_software\":\"[{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}]\",\"payers_info\":\"[{\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": \\\"individual\\\", \\\"enroll_with\\\": \\\"tax_id\\\", \\\"provider_name\\\": null, \\\"effective_date\\\": \\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"value\\\": \\\"1\\\", \\\"option\\\": \\\"daily\\\"}\",\"bellmedex_services\":\"{\\\"ar\\\": \\\"1\\\", \\\"phd\\\": \\\"1\\\", \\\"coding\\\": \\\"1\\\", \\\"billing\\\": \\\"1\\\", \\\"ar_start\\\": \\\"2023-04-14\\\", \\\"authorization\\\": \\\"1\\\", \\\"credentialing\\\": \\\"1\\\", \\\"eligibility_check\\\": \\\"1\\\", \\\"patient_statement\\\": \\\"1\\\", \\\"key_billing_issues\\\": null, \\\"special_instructions\\\": null, \\\"complementary_services\\\": null}\"}', '{\"speciality\":\"HOME HEALTH CARE AGENCY,COUNSELOR,GYNOCOLOGY,NATUROPATHIC MEDICINE,FAMILY MEDICINE,NURSE PRACTITIONER FAMILY,RADIOLOGY VASCULAR & INTERVENTI,CARDIOLOGY,APPLIED BEHAVIOR ANALYST,NON-EMERGENCY MEDICAL TRANSPORT\",\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null},{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":\\\"individual\\\",\\\"enroll_with\\\":\\\"tax_id\\\",\\\"effective_date\\\":\\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"option\\\":\\\"daily\\\",\\\"value\\\":\\\"1\\\"}\",\"bellmedex_services\":\"{\\\"credentialing\\\":\\\"1\\\",\\\"coding\\\":\\\"1\\\",\\\"phd\\\":\\\"1\\\",\\\"billing\\\":\\\"1\\\",\\\"eligibility_check\\\":\\\"1\\\",\\\"authorization\\\":\\\"1\\\",\\\"patient_statement\\\":\\\"1\\\",\\\"ar\\\":\\\"1\\\",\\\"ar_start\\\":\\\"2023-04-14\\\",\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\"}', 'http://127.0.0.1:8000/practice_info_form/8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-17 08:27:03', '2023-04-17 08:27:03');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(64, NULL, NULL, 'updated', 'App\\Models\\Practice', 8, '{\"physical_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"mailing_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"location_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"dmail_emails\":null,\"focal_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}]\",\"owner_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}]\",\"provider_information\":\"[{\\\"dob\\\": null, \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}]\",\"caqh\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"clearinghouse\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"ehr\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"management_software\":\"[{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}]\",\"payers_info\":\"[{\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": null, \\\"enroll_with\\\": null, \\\"provider_name\\\": null, \\\"effective_date\\\": null}, {\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": \\\"individual\\\", \\\"enroll_with\\\": \\\"tax_id\\\", \\\"provider_name\\\": null, \\\"effective_date\\\": \\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"value\\\": \\\"1\\\", \\\"option\\\": \\\"daily\\\"}\",\"bellmedex_services\":\"{\\\"ar\\\": \\\"1\\\", \\\"phd\\\": \\\"1\\\", \\\"coding\\\": \\\"1\\\", \\\"billing\\\": \\\"1\\\", \\\"ar_start\\\": \\\"2023-04-14\\\", \\\"authorization\\\": \\\"1\\\", \\\"credentialing\\\": \\\"1\\\", \\\"eligibility_check\\\": \\\"1\\\", \\\"patient_statement\\\": \\\"1\\\", \\\"key_billing_issues\\\": null, \\\"special_instructions\\\": null, \\\"complementary_services\\\": null}\"}', '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"dmail_emails\":\"asad.nazir@bellmedex.com,asad@bellmedex.com\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null},{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":\\\"individual\\\",\\\"enroll_with\\\":\\\"tax_id\\\",\\\"effective_date\\\":\\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"option\\\":\\\"daily\\\",\\\"value\\\":\\\"1\\\"}\",\"bellmedex_services\":\"{\\\"credentialing\\\":\\\"1\\\",\\\"coding\\\":\\\"1\\\",\\\"phd\\\":\\\"1\\\",\\\"billing\\\":\\\"1\\\",\\\"eligibility_check\\\":\\\"1\\\",\\\"authorization\\\":\\\"1\\\",\\\"patient_statement\\\":\\\"1\\\",\\\"ar\\\":\\\"1\\\",\\\"ar_start\\\":\\\"2023-04-14\\\",\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\"}', 'http://127.0.0.1:8000/practice_info_form/8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-17 08:29:20', '2023-04-17 08:29:20'),
(65, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"DOGMciFOE9hAZ2z8kbr1FdaDASBRhGKe8TtNEEGxdUnH5R3FEym6IRdzs4yo\"}', '{\"remember_token\":\"AprvTRG8o2BmcXXayfINcWoVJ109j8sOfEIAeWSGmsas0Uwc7Itp5qj1az6H\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-17 13:01:23', '2023-04-17 13:01:23'),
(66, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"AprvTRG8o2BmcXXayfINcWoVJ109j8sOfEIAeWSGmsas0Uwc7Itp5qj1az6H\"}', '{\"remember_token\":\"6aTM95gLPKJEI89VjHKFm00SlsY5sNEXEAUnrW66ft6zwKPy7ay2gEVhY4sd\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-17 14:27:56', '2023-04-17 14:27:56'),
(67, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"6aTM95gLPKJEI89VjHKFm00SlsY5sNEXEAUnrW66ft6zwKPy7ay2gEVhY4sd\"}', '{\"remember_token\":\"1b5YKxZAiZ6zR8c1sQtcNnRE2xStiuURvEiu0LrsquG4gy3tbHFjEf4G2yge\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-17 14:40:19', '2023-04-17 14:40:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `company_id`, `parent_id`, `name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 0, 'Billing', NULL, 1, '2023-01-25 17:10:51', '2023-02-17 21:32:05', NULL),
(2, 1, 1, 'Claim Submission', NULL, 1, '2023-01-25 17:10:51', '2023-02-17 21:31:47', NULL),
(3, 6, 0, 'Sales', NULL, 1, '2023-02-21 20:53:42', '2023-02-27 21:19:07', NULL),
(4, 6, 0, 'Audit', NULL, 1, '2023-02-23 19:32:09', '2023-02-27 21:18:50', NULL),
(5, 6, 0, 'Software', NULL, 1, '2023-02-23 19:34:15', '2023-02-27 21:18:36', NULL),
(6, 6, 0, 'CRM', NULL, 1, '2023-02-27 21:19:14', '2023-02-27 21:19:14', NULL),
(7, 6, 0, 'Billing', NULL, 1, '2023-03-27 13:13:12', '2023-03-27 13:13:12', NULL),
(8, 6, 7, 'Claim Submission', NULL, 1, '2023-03-27 13:13:21', '2023-03-28 18:48:15', NULL),
(9, 6, 0, 'Coding', NULL, 1, '2023-03-28 18:44:07', '2023-03-28 18:45:43', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

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
(13, 20, 3, '2023-03-03 02:12:39', '2023-03-03 02:12:39'),
(14, 18, 3, '2023-04-04 21:08:58', '2023-04-04 21:08:58'),
(15, 17, 3, '2023-04-04 21:19:50', '2023-04-04 21:19:50'),
(16, 15, 6, '2023-04-07 18:28:52', '2023-04-07 18:28:52'),
(17, 18, 7, '2023-04-07 21:10:03', '2023-04-07 21:10:03');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
CREATE TABLE IF NOT EXISTS `designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `company_id`, `name`, `rank`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 6, 'General Manager (GM)', 3, '2023-03-20 13:07:51', NULL, '2023-04-11 20:40:07'),
(2, 5, 'Director', NULL, '2023-03-20 13:15:33', NULL, '2023-04-03 18:51:25'),
(3, 6, 'Vice President (VP)', 2, '2023-03-20 13:15:51', NULL, '2023-04-11 20:40:07'),
(4, 6, 'Manager Operations (MO)', 5, '2023-03-20 13:16:37', NULL, '2023-04-11 20:39:46'),
(5, 6, 'Assistant Manager Operations (AMO)', 6, '2023-03-20 13:16:46', NULL, '2023-04-11 20:39:46'),
(6, 6, 'Senior Manager Operations (SMO)', 4, '2023-03-20 13:16:55', NULL, '2023-04-04 16:42:11'),
(7, 6, 'Director', 1, '2023-04-03 14:00:35', NULL, '2023-04-03 19:35:07');

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
(9, 6, 'Other', '2023-03-20 16:44:14', '2023-03-28 15:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `document_type_user`
--

DROP TABLE IF EXISTS `document_type_user`;
CREATE TABLE IF NOT EXISTS `document_type_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document_type_user`
--

INSERT INTO `document_type_user` (`id`, `user_id`, `document_type_id`, `created_at`, `updated_at`) VALUES
(1, 18, 8, '2023-04-06 21:36:40', '2023-04-06 21:36:40'),
(2, 18, 3, '2023-04-06 21:36:40', '2023-04-06 21:36:40'),
(3, 17, 8, '2023-04-06 21:37:19', '2023-04-06 21:37:19'),
(4, 17, 6, '2023-04-06 21:37:19', '2023-04-06 21:37:19'),
(5, 17, 3, '2023-04-06 21:46:34', '2023-04-06 21:46:34'),
(6, 15, 8, '2023-04-06 22:07:00', '2023-04-06 22:07:00'),
(7, 15, 3, '2023-04-06 22:07:00', '2023-04-06 22:07:00'),
(8, 15, 4, '2023-04-06 22:07:00', '2023-04-06 22:07:00');

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
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `practice_id`, `user_id`, `status`, `name`, `org_name`, `path`, `ext`, `size`, `date`, `doc_type`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 4, 10, 13, 'qjbT8BZTaBs80aDtRk1FLxHKXOGmdXnQKVA6R2gD.png', 'secretm.me-verticle-share.png', 'uploads/files/02-2023/qjbT8BZTaBs80aDtRk1FLxHKXOGmdXnQKVA6R2gD.png', 'png', '385.82 KB', '2023-03-09', 4, '2023-02-06 20:16:08', NULL, '2023-04-12 20:10:24'),
(2, 4, 10, 14, 'McPTd5iZYNSVvNXHxXoiMS1H0gPrugq2lfXz1qQK.png', 'screencapture-secretm-me-inbox-php-2022-09-08-21_15_52.png', 'uploads/files/02-2023/McPTd5iZYNSVvNXHxXoiMS1H0gPrugq2lfXz1qQK.png', 'png', '2.56 MB', '2023-03-09', 4, '2023-02-06 20:16:08', NULL, '2023-03-22 19:29:40'),
(3, 4, 10, 15, 'K2S7gNAjlvGAWZhqFq2brsnY2hZ90hd0CoM884Oh.png', 'screencapture-publishers-adsterra-stats-2022-10-06-12_35_35.png', 'uploads/files/02-2023/K2S7gNAjlvGAWZhqFq2brsnY2hZ90hd0CoM884Oh.png', 'png', '191.23 KB', '2023-03-09', 4, '2023-02-06 20:16:08', NULL, '2023-04-12 20:10:27'),
(4, 4, 10, 16, 'UmPHvRQg1nFiSUy8QSQIKaPZ5qGyBLwvyBUVr3De.png', 'secretm.me-verticle-share.png', 'uploads/files/02-2023/UmPHvRQg1nFiSUy8QSQIKaPZ5qGyBLwvyBUVr3De.png', 'png', '385.82 KB', '2023-03-09', 4, '2023-02-06 20:16:18', NULL, '2023-04-12 20:10:34'),
(5, 4, 10, 17, '8DiR6bU392EtXfnlR2iuxS5ZRw7wOSTNK0P0zZsM.png', 'screencapture-secretm-me-inbox-php-2022-09-08-21_15_52.png', 'uploads/files/02-2023/8DiR6bU392EtXfnlR2iuxS5ZRw7wOSTNK0P0zZsM.png', 'png', '2.56 MB', '2023-03-09', 4, '2023-02-06 20:16:18', NULL, '2023-04-12 20:10:37'),
(6, 4, 10, 18, 'VSfKIATTISBcvvDvY326lC1PIf9oVKqt0upd9MYi.png', 'screencapture-publishers-adsterra-stats-2022-10-06-12_35_35.png', 'uploads/files/02-2023/VSfKIATTISBcvvDvY326lC1PIf9oVKqt0upd9MYi.png', 'png', '191.23 KB', '2023-03-09', 4, '2023-02-06 20:16:18', NULL, '2023-04-12 20:10:39'),
(7, 4, 10, 19, '7iO2YMMujOSB7GwIsBOCgruGBs0TVzF309q24SGu.png', 'Web Developer Php Laravel.png', 'uploads/files/02-2023/7iO2YMMujOSB7GwIsBOCgruGBs0TVzF309q24SGu.png', 'png', '52.81 KB', '2023-03-09', 4, '2023-02-06 20:17:47', NULL, '2023-04-12 20:10:42'),
(8, 4, 15, 13, 'cqDk3feTSHL8ARw3xVExMCZMNVOFYHR0jZyaUAMk.jpg', 'image004.jpg', 'uploads/files/02-2023/cqDk3feTSHL8ARw3xVExMCZMNVOFYHR0jZyaUAMk.jpg', 'jpg', '97.22 KB', '2023-03-09', 4, '2023-02-16 21:13:24', NULL, '2023-04-12 20:10:46'),
(9, 4, 16, 14, 'e892BTm1RqGla3X7RsDNoajOAi9G6za5WteoYtT8.jpg', '1933136_188282907860672_4388842_o.jpg', 'uploads/files/02-2023/e892BTm1RqGla3X7RsDNoajOAi9G6za5WteoYtT8.jpg', 'jpg', '408.74 KB', '2023-03-09', 3, '2023-02-16 22:41:32', NULL, '2023-03-28 19:59:28'),
(10, 4, 17, 15, 'SbQPg6d3akY0Kv0bprp2H3rmMQXcnlu5nlYb6xwy.jpg', 'image004.jpg', 'uploads/files/02-2023/SbQPg6d3akY0Kv0bprp2H3rmMQXcnlu5nlYb6xwy.jpg', 'jpg', '97.22 KB', '2023-03-09', 4, '2023-02-21 22:32:24', NULL, '2023-04-12 20:10:50'),
(11, 4, 18, 16, 'WPBx6rp0eCQCltRmF5kAAhOFIwNZ1Dw91ncjbz61.pdf', 'Document.pdf', 'uploads/files/02-2023/WPBx6rp0eCQCltRmF5kAAhOFIwNZ1Dw91ncjbz61.pdf', 'pdf', '13.62 KB', '2023-03-09', 4, '2023-02-22 17:10:45', NULL, '2023-04-12 20:10:52'),
(12, 4, 19, 17, 'GDVa4jNRLK581Sr5yXfeeMqI32ltZ1MlcM50UGdA.xlsx', 'AttendanceList123.xlsx', 'uploads/files/02-2023/GDVa4jNRLK581Sr5yXfeeMqI32ltZ1MlcM50UGdA.xlsx', 'xlsx', '22.46 KB', '2023-03-09', 4, '2023-02-22 17:53:13', NULL, '2023-04-12 20:10:54'),
(13, 4, 20, 18, '5f5TDxQLrmDtjt1CUToQYDPerLUMakXWku3HTFbp.xlsx', 'AttendanceList (1).xlsx', 'uploads/files/03-2023/5f5TDxQLrmDtjt1CUToQYDPerLUMakXWku3HTFbp.xlsx', 'xlsx', '22.49 KB', '2023-03-09', 4, '2023-03-21 14:24:07', NULL, '2023-04-12 20:11:01'),
(14, 4, 15, 19, '2RiQeo0dhS2M9d45LxRbNsA1bIYRg89L8gAx8ZcH.xlsx', 'AttendanceList.xlsx', 'uploads/files/03-2023/2RiQeo0dhS2M9d45LxRbNsA1bIYRg89L8gAx8ZcH.xlsx', 'xlsx', '22.46 KB', '2023-03-09', 4, '2023-03-21 14:24:07', NULL, '2023-04-12 20:11:04'),
(15, 4, 15, 14, 'vvwGLaPpkKuEUuGrdjcqJAW6QvZ0g9NNf3ul7ZZt.pdf', 'Document.pdf', 'uploads/files/04-2023/vvwGLaPpkKuEUuGrdjcqJAW6QvZ0g9NNf3ul7ZZt.pdf', 'pdf', '13.62 KB', NULL, 8, '2023-04-04 19:50:14', NULL, '2023-04-04 19:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider_name` varchar(64) NOT NULL,
  `token` varchar(32) NOT NULL,
  `link` varchar(256) NOT NULL,
  `created_at` timestamp NOT NULL,
  `expired_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `company_id`, `user_id`, `provider_name`, `token`, `link`, `created_at`, `expired_at`, `updated_at`) VALUES
(1, 6, 6, 'Test Provider', '5dd0768dacfd73dcd198b755d1d48b88', 'http://127.0.0.1:8000/practice-info-form/5dd0768dacfd73dcd198b755d1d48b88', '2023-04-13 14:45:11', '2023-04-17 18:45:11', '2023-04-13 14:45:11'),
(2, 6, 6, 'Usman Ali', '74f37767246678ba0d36235fda96e320', 'http://127.0.0.1:8000/practice-info-form/74f37767246678ba0d36235fda96e320', '2023-04-13 15:43:59', '2023-04-16 19:43:59', '2023-04-13 15:43:59'),
(3, 6, 6, 'Test Provider 4', '439a695e31be0163c1ce54e30873c387', 'http://127.0.0.1:8000/practice-info-form/439a695e31be0163c1ce54e30873c387', '2023-04-14 08:11:22', '2023-04-17 18:11:22', '2023-04-14 08:11:22'),
(4, 6, 6, 'Director', 'ad0fdfdc01569b071cdf8815ccb7b647', 'http://127.0.0.1:8000/practice-info-form/ad0fdfdc01569b071cdf8815ccb7b647', '2023-04-14 12:25:11', '2023-04-17 17:25:11', '2023-04-14 12:25:11');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(20, 'App\\Models\\User', 17),
(20, 'App\\Models\\User', 18),
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `type`, `guard_name`, `created_at`, `updated_at`) VALUES
(13, 'add role', 'can create', 'role', 'web', '2023-01-19 11:17:29', '2023-01-19 11:17:29'),
(14, 'view role', 'can view', 'role', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(15, 'view user', 'can view all', 'user', 'web', '2023-01-19 11:53:09', '2023-01-19 11:53:09'),
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
(99, 'view designation', 'can view', 'designation', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(100, 'external ticket', 'can external', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(102, 'update company setting', 'can update', 'company', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
(103, 'view audit system log', 'can audit system log', 'reports', 'web', '2023-02-06 14:30:49', '2023-02-06 14:30:49'),
(104, 'view his own users', 'can view his own', 'user', 'web', '2023-01-19 11:53:09', '2023-01-19 11:53:09'),
(105, 'assign document user', 'can assign document type', 'user', 'web', '2023-02-06 10:02:32', '2023-02-06 10:02:32'),
(106, 'create link', 'can create link', 'user', 'web', '2023-02-06 10:02:32', '2023-02-06 10:02:32');

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
  `link_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practices`
--

INSERT INTO `practices` (`id`, `company_id`, `link_id`, `name`, `status`, `reason`, `date`, `speciality`, `avg_charges`, `group_npi`, `group_ptan`, `tax_id`, `physical_address`, `mailing_address`, `location_address`, `dmail_emails`, `focal_info`, `owner_info`, `provider_information`, `caqh`, `clearinghouse`, `ehr`, `management_software`, `payers_info`, `claim_creation_frequency`, `bellmedex_services`, `crm`, `operations`, `practice_threshold_per_hour`, `thresh_payer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'test practice', 1, '', NULL, '', 0, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 16:57:06', '2023-02-05 16:57:06', NULL),
(2, 1, NULL, 'bme pract', 1, '', NULL, '', 0, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 17:37:33', '2023-02-05 17:37:33', NULL),
(3, 1, NULL, 'bme test p', 1, '', NULL, '', 0, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 17:38:27', '2023-02-05 17:38:27', NULL),
(4, 6, NULL, 'New Practice 123', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": null, \"logins_receipt\": \"0\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-16 21:12:26', '2023-03-08 16:58:02', NULL),
(5, 6, NULL, 'Practice ABC', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', '0', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": \"2023-03-08\", \"logins_receipt\": \"1\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}]', '2023-02-24 17:34:02', '2023-03-08 16:57:03', NULL),
(6, 6, NULL, 'Test ABC 123', 3, 'asdsadsad', NULL, NULL, NULL, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}, {\"npi\": null, \"payer_name\": null, \"enroll_type\": \"group\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": null, \"logins_receipt\": \"0\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": \"2023-03-24\", \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-03-06 21:27:31', '2023-03-24 16:22:31', NULL),
(7, 6, NULL, 'Test ABC 123456', 3, NULL, NULL, NULL, 1500, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": 0, \"phd\": 0, \"coding\": 0, \"billing\": 0, \"ar_start\": null, \"authorization\": 0, \"credentialing\": 0, \"eligibility_check\": 0, \"patient_statement\": 0, \"key_billing_issues\": null, \"special_instructions\": null, \"complementary_services\": null}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": null, \"logins_receipt\": \"0\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": 0, \"thresh_charge_manual_checkbox\": 0, \"thresh_posting_elect_checkbox\": 0, \"thresh_posting_manual_checkbox\": 0, \"thresh_eligibility_cal_checkbox\": 0, \"thresh_eligibility_portal_checkbox\": 0, \"thresh_charge_with_demo_graphics_checkbox\": 0}', '[{\"name\": null, \"claims\": null}]', '2023-03-24 16:46:24', '2023-03-28 20:13:23', NULL),
(8, 6, 3, 'Test ABC by link', NULL, NULL, NULL, 'HOME HEALTH CARE AGENCY,COUNSELOR,GYNOCOLOGY,NATUROPATHIC MEDICINE,FAMILY MEDICINE,NURSE PRACTITIONER FAMILY,RADIOLOGY VASCULAR & INTERVENTI,CARDIOLOGY,APPLIED BEHAVIOR ANALYST,NON-EMERGENCY MEDICAL TRANSPORT', NULL, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', 'asad.nazir@bellmedex.com,asad@bellmedex.com', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}, {\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": \"2023-04-15\"}]', '{\"value\": \"1\", \"option\": \"daily\"}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2023-04-14\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": null, \"special_instructions\": null, \"complementary_services\": null}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"0\", \"thresh_charge_manual_checkbox\": \"0\", \"thresh_posting_elect_checkbox\": \"0\", \"thresh_posting_manual_checkbox\": \"0\", \"thresh_eligibility_cal_checkbox\": \"0\", \"thresh_eligibility_portal_checkbox\": \"0\", \"thresh_charge_with_demo_graphics_checkbox\": \"0\"}', '[{\"name\": null, \"claims\": null}]', '2023-04-14 17:12:48', '2023-04-17 13:29:20', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practice_user`
--

INSERT INTO `practice_user` (`id`, `user_id`, `practice_id`, `type`, `user_type`, `is_parent`, `created_at`, `updated_at`) VALUES
(6, 19, 4, 1, 1, NULL, '2023-03-03 01:50:31', '2023-03-03 01:50:31'),
(7, 16, 4, 1, 1, NULL, '2023-03-03 01:50:40', '2023-03-03 01:50:40'),
(8, 20, 4, 1, 1, NULL, '2023-03-03 02:12:52', '2023-03-03 02:12:52'),
(9, 20, 5, 1, 1, NULL, '2023-03-03 02:12:52', '2023-03-03 02:12:52'),
(15, 15, 4, 1, 1, NULL, '2023-03-22 23:17:19', '2023-03-22 23:17:19'),
(16, 15, 5, 1, 1, NULL, '2023-03-22 23:17:19', '2023-03-22 23:17:19'),
(17, 15, 6, 1, 1, NULL, '2023-03-22 23:17:19', '2023-03-22 23:17:19'),
(28, 17, 6, 1, 1, NULL, '2023-04-05 00:22:54', '2023-04-05 00:22:54'),
(33, 18, 4, 1, 1, NULL, '2023-04-17 21:17:04', '2023-04-17 21:17:04'),
(34, 18, 5, 1, 1, NULL, '2023-04-17 21:17:04', '2023-04-17 21:17:04'),
(35, 18, 6, 1, 1, NULL, '2023-04-17 21:17:04', '2023-04-17 21:17:04'),
(36, 18, 7, 1, 1, NULL, '2023-04-17 21:17:04', '2023-04-17 21:17:04');

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
(100, 18),
(102, 18),
(103, 18),
(105, 18),
(106, 18),
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
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `type` varchar(64) DEFAULT NULL COMMENT 'SMTP,wasabi',
  `host` varchar(64) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `port` varchar(16) DEFAULT NULL,
  `enc_type` varchar(16) DEFAULT NULL,
  `region` varchar(64) DEFAULT NULL,
  `version` varchar(16) DEFAULT NULL,
  `endpoint` varchar(256) DEFAULT NULL,
  `secret_key` varchar(256) DEFAULT NULL,
  `wkey` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_id`, `type`, `host`, `username`, `password`, `port`, `enc_type`, `region`, `version`, `endpoint`, `secret_key`, `wkey`, `created_at`, `updated_at`) VALUES
(1, 6, 'smtp', 'localhost', 'docuhub', 'fdsfdsfdsfdsf', '25', '23213wewqewqe', NULL, NULL, NULL, NULL, NULL, '2023-03-27 15:25:04', '2023-03-27 15:25:04'),
(2, 6, 'wasabi', NULL, NULL, NULL, NULL, NULL, 'sadsa', NULL, NULL, NULL, NULL, '2023-03-27 15:26:21', '2023-03-27 15:26:21');

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
(19, 6, 'Coded', 'document', 0, '2023-03-07 09:16:04', '2023-03-28 15:07:29'),
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

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
(16, 20, 3, '2023-03-03 02:12:25', '2023-03-03 02:12:25', NULL),
(17, 15, 4, '2023-03-23 00:03:31', '2023-03-23 00:03:31', NULL),
(18, 15, 5, '2023-03-23 00:03:31', '2023-03-23 00:03:31', NULL),
(19, 15, 6, '2023-03-23 00:03:31', '2023-03-23 00:03:31', NULL);

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
  `department_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL COMMENT 'practice id in case of external, department id in case of internal tickets',
  `team_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `priority` varchar(32) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `creator` varchar(32) NOT NULL,
  `response_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `remarks` varchar(256) DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  `is_external` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `company_id`, `user_id`, `user_type`, `department_id`, `target_id`, `team_id`, `type`, `priority`, `subject`, `message`, `creator`, `response_at`, `status`, `remarks`, `flag`, `is_external`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 6, 15, 2, 3, 4, 0, 'Info/Other', 'High', 'Test subject', '<p>test message abc</p>', 'New Test Company', '2023-04-06 09:44:42', 22, NULL, 0, 1, '2023-02-24 16:17:37', NULL, '2023-04-06 09:44:42'),
(2, 6, 15, 2, 3, 5, 0, 'Info/Other', 'Concerning', 'Test subject', 'test message', 'New Test Company', NULL, 23, NULL, 0, 1, '2023-02-24 16:17:37', NULL, '2023-02-24 16:17:37'),
(3, 6, 15, 2, 3, 5, 0, 'Info/Other', 'Low', 'Test', 'message', 'New Test Company', '2023-02-27 11:23:47', 24, NULL, 0, 1, '2023-02-27 11:23:47', NULL, '2023-02-27 11:23:47'),
(4, 6, 15, 2, 3, 5, 4, 'Info/Other', 'Concerning', 'Test', 'dsadsad', 'New Test Company', NULL, 25, NULL, 0, 1, '2023-02-27 11:51:23', NULL, '2023-02-27 11:51:23'),
(5, 6, 15, 2, 3, 5, 4, 'Info/Other', 'Concerning', 'dsf', 'dsfdsfsd', 'New Test Company', NULL, 26, NULL, 0, 1, '2023-02-27 11:56:17', NULL, '2023-02-27 11:56:17'),
(6, 6, 15, 2, 3, 5, 4, 'Info/Other', 'Concerning', 'Testdsadsa', 'asdsadsadsad', 'New Test Company', '2023-04-04 15:51:10', 27, NULL, 0, 1, '2023-02-27 11:57:24', NULL, '2023-04-04 15:51:10'),
(7, 6, 15, 2, 3, 5, 5, 'Info/Other', 'Concerning', 'Test', 'sadsadsad', 'New Test Company', NULL, 22, NULL, 0, 1, '2023-02-27 14:34:36', NULL, '2023-02-27 14:34:36'),
(8, 6, 15, 2, 3, 4, 0, 'Info/Other', 'Concerning', 'Testsadsa', 'asdsadsadsad', 'New Test Company', NULL, 23, NULL, 0, 1, '2023-02-27 14:41:23', NULL, '2023-02-27 14:41:23'),
(9, 6, 15, 2, 3, 5, 5, 'Info/Other', 'Concerning', 'Test', 'sadsad', 'New Test Company', NULL, 24, NULL, 0, 1, '2023-02-27 15:27:16', NULL, '2023-02-27 15:27:16'),
(10, 6, 15, 2, 3, 5, 5, 'Info/Other', 'Concerning', 'Test', 'sadsad', 'New Test Company', NULL, 25, NULL, 0, 1, '2023-02-27 15:29:38', NULL, '2023-02-27 15:29:38'),
(11, 6, 15, 2, 6, 5, 5, 'Info/Other', 'Concerning', 'Testfg', 'fdgfdgfdg', 'New Test Company', NULL, 26, NULL, 1, 1, '2023-02-27 15:30:53', NULL, '2023-03-23 10:15:53'),
(12, 6, 15, 2, 3, 5, 5, 'Info/Other', 'Concerning', 'Test', 'sadsadsad', 'New Test Company', NULL, 27, NULL, 0, 1, '2023-02-27 15:34:19', NULL, '2023-02-27 15:34:19'),
(13, 6, 15, 2, 3, 5, 5, 'Info/Other', 'Concerning', 'sdsad', 'adsad', 'New Test Company', NULL, 22, NULL, 0, 1, '2023-02-27 15:37:34', NULL, '2023-02-27 15:37:34'),
(14, 6, 15, 2, 6, 4, 0, 'Info/Other', 'Concerning', 'Test', 'Asad Nazir\r\nsadsadsa\r\nasdsad', 'New Test Company', NULL, 23, NULL, 1, 1, '2023-02-28 16:34:53', NULL, '2023-03-23 10:23:12'),
(15, 6, 15, 2, 4, 4, 0, 'Info/Other', 'High', 'Test', '<p><strong>Hi Ewa and Team,</strong><br />\n<br />\nAfter reviewing the patient account in detail. We have found that all the services are getting paid by both insurances except the lab services.<br />\nAs we already discussed his lab services amount is on the patient end because of the denials we had received from his both insurance. Now we send all his lab services balance on the patient end. There is a $6744.80 patient balance left as of now.&nbsp;<br />\n<br />\nWarm Regards,<br />\n<strong>Peter Alex!</strong></p>', 'New Test Company', NULL, 24, NULL, 0, 1, '2023-03-01 11:35:16', NULL, '2023-03-23 13:08:49'),
(16, 6, 16, 3, 6, 4, 3, 'Info/Other', 'Concerning', 'Client ticket', '<p>Client ticket message</p>', 'Provider', NULL, 25, NULL, 0, 1, '2023-03-02 16:40:14', NULL, '2023-03-02 16:40:14'),
(17, 6, 16, 3, 6, 4, 3, 'Info/Other', 'Concerning', 'Client ticket', '<p>Client ticket message</p>', 'Provider', NULL, 26, NULL, 0, 1, '2023-03-02 16:40:53', NULL, '2023-03-02 16:40:53'),
(18, 6, 16, 3, 6, 4, 3, 'Info/Other', 'Concerning', 'Client ticket', '<p>Client ticket message</p>', 'Provider', NULL, 27, NULL, 0, 1, '2023-03-02 16:42:38', NULL, '2023-03-02 16:42:38'),
(19, 6, 15, 2, 4, 5, 3, 'Info/Other', 'Low', 'Testing notification', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'New Test Company', '2023-04-04 15:54:10', 22, 'Ticket Forward Remarks', 1, 1, '2023-03-03 12:13:55', NULL, '2023-04-04 15:54:10'),
(20, 6, 15, 2, 7, 4, 3, 'Info/Other', 'Low', 'Test', '<p>sdadsadsa</p>', 'New Test Company', '2023-04-04 15:54:41', 23, NULL, 0, 1, '2023-03-29 12:24:55', NULL, '2023-04-04 15:54:41'),
(21, 6, 15, 2, 4, 7, 0, 'Info/Other', 'Low', 'Ticket 21', '<p>message 21</p>', 'New Test Company', '2023-04-05 10:24:03', 24, NULL, 0, 0, '2023-03-29 12:42:25', NULL, '2023-04-05 10:24:03'),
(22, 6, 15, 2, 4, 3, 0, 'Info/Other', 'Medium', 'Ticket 22', '<p>message 22</p>', 'New Test Company', '2023-04-05 10:34:35', 25, NULL, 0, 0, '2023-03-29 13:02:14', NULL, '2023-04-05 10:34:35'),
(23, 6, 15, 2, 4, 3, 0, 'Info/Other', 'Concerning', 'Ticket 23', '<p>message 23</p>', 'New Test Company', NULL, 26, NULL, 0, 0, '2023-03-29 13:03:42', NULL, '2023-03-29 13:03:42'),
(24, 6, 15, 2, 4, 7, 0, 'Info/Other', 'Medium', 'Ticket 24', '<p>Message 24</p>', 'New Test Company', '2023-04-05 10:06:17', 27, NULL, 0, 1, '2023-03-29 13:06:45', NULL, '2023-04-05 10:06:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket_attachments`
--

INSERT INTO `ticket_attachments` (`id`, `ticket_id`, `reply_id`, `type`, `name`, `org_name`, `path`, `ext`, `size`, `created_at`, `updated_at`) VALUES
(1, 11, 0, 0, 'UmU9JYLoqORaVoXIids3rHGHl7X51VI5ZGNl0t7I.xlsx', 'AttendanceList.xlsx', 'uploads/ticket_attachments/UmU9JYLoqORaVoXIids3rHGHl7X51VI5ZGNl0t7I.xlsx', 'xlsx', '22.46 KB', '2023-02-27 20:30:54', '2023-02-27 20:30:54'),
(2, 12, 0, 0, 'UIRQAfyGBerJlnjksiN7awLYXb6qaicdy7i4OAAb.xlsx', 'AttendanceList.xlsx', 'uploads/ticket_attachments/UIRQAfyGBerJlnjksiN7awLYXb6qaicdy7i4OAAb.xlsx', 'xlsx', '22.46 KB', '2023-02-27 20:34:19', '2023-02-27 20:34:19'),
(3, 13, 0, 0, 'fcyAw274dujqS6KP8l8xN2cg0ObhhigBoK2jS83d.xlsx', 'AttendanceList (1).xlsx', 'uploads/ticket_attachments/fcyAw274dujqS6KP8l8xN2cg0ObhhigBoK2jS83d.xlsx', 'xlsx', '22.49 KB', '2023-02-27 20:37:35', '2023-02-27 20:37:35'),
(5, 24, 0, 0, 'ukxQBLcBpKtvkIBuArVLZW8AA31D3u1JDQCl1jN1.xlsx', '20220509093844_Practice Info Sheet.xlsx', 'uploads/ticket_attachments/ukxQBLcBpKtvkIBuArVLZW8AA31D3u1JDQCl1jN1.xlsx', 'xlsx', '12.57 KB', '2023-03-29 18:06:46', '2023-03-29 18:06:46'),
(6, 24, 0, 0, 'ci3Pal8Tujw4q6dCI2HdLrl1gFqgrZAxPwqitqam.xlsx', '20220915010715_Practice Info Sheet.xlsx', 'uploads/ticket_attachments/ci3Pal8Tujw4q6dCI2HdLrl1gFqgrZAxPwqitqam.xlsx', 'xlsx', '12.59 KB', '2023-03-29 18:06:47', '2023-03-29 18:06:47'),
(7, 1, 18, 1, 'y4MrxeRWDeuC7k0eMwZ2p9AcqlyFHLDiZostSU3u.xlsx', 'AttendanceList.xlsx', 'uploads/ticket_attachments/y4MrxeRWDeuC7k0eMwZ2p9AcqlyFHLDiZostSU3u.xlsx', 'xlsx', '22.46 KB', '2023-04-06 14:44:43', '2023-04-06 14:44:43'),
(8, 1, 18, 1, 'FkEwDt1hJI7123H0nNu5OCXq5kk1rmJ3LQKTIl1R.xls', '16740728274397_#_ADD-Clinic-Of-Idaho-AR-Report (1).xls', 'uploads/ticket_attachments/FkEwDt1hJI7123H0nNu5OCXq5kk1rmJ3LQKTIl1R.xls', 'xls', '115.00 KB', '2023-04-06 14:44:43', '2023-04-06 14:44:43'),
(9, 1, 18, 1, 'r498Bqqrb5vRQkzieHn7z0viS1piKCeO4jUiA3wz.xlsx', '20220509093844_Practice Info Sheet.xlsx', 'uploads/ticket_attachments/r498Bqqrb5vRQkzieHn7z0viS1piKCeO4jUiA3wz.xlsx', 'xlsx', '12.57 KB', '2023-04-06 14:44:43', '2023-04-06 14:44:43'),
(10, 1, 18, 1, 'DESDToPAZwM7IHhDckovKZDvHZ4w78kJpnNzv2sx.xlsx', '20220915010715_Practice Info Sheet.xlsx', 'uploads/ticket_attachments/DESDToPAZwM7IHhDckovKZDvHZ4w78kJpnNzv2sx.xlsx', 'xlsx', '12.59 KB', '2023-04-06 14:44:43', '2023-04-06 14:44:43');

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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(14, 19, 3, 0, '2023-03-03 12:13:55', '2023-03-03 12:13:55'),
(15, 20, 4, 0, '2023-03-29 12:24:55', '2023-03-29 12:24:55'),
(16, 21, 7, 0, '2023-03-29 12:42:25', '2023-03-29 12:42:25'),
(17, 22, 7, 0, '2023-03-29 13:02:14', '2023-03-29 13:02:14'),
(18, 22, 9, 0, '2023-03-29 13:02:14', '2023-03-29 13:02:14'),
(19, 23, 7, 0, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(20, 23, 9, 0, '2023-03-29 13:03:42', '2023-03-29 13:03:42'),
(21, 24, 6, 0, '2023-03-29 13:06:45', '2023-03-29 13:06:45'),
(22, 24, 3, 0, '2023-03-29 13:06:45', '2023-03-29 13:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_logs`
--

DROP TABLE IF EXISTS `ticket_logs`;
CREATE TABLE IF NOT EXISTS `ticket_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_logs`
--

INSERT INTO `ticket_logs` (`id`, `ticket_id`, `user_id`, `seen`, `created_at`, `updated_at`) VALUES
(1, 19, 17, 0, '2023-03-23 12:45:20', '2023-03-23 17:45:20'),
(2, 19, 20, 0, '2023-03-23 12:45:20', '2023-03-23 17:45:20'),
(3, 23, 15, 0, '2023-03-29 13:03:42', '2023-03-29 18:03:42'),
(4, 23, 16, 0, '2023-03-29 13:03:42', '2023-03-29 18:03:42'),
(5, 23, 19, 0, '2023-03-29 13:03:42', '2023-03-29 18:03:42'),
(6, 23, 20, 0, '2023-03-29 13:03:42', '2023-03-29 18:03:42');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_replies`
--

INSERT INTO `ticket_replies` (`id`, `ticket_id`, `user_id`, `creator_name`, `message`, `is_refered`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 11, 15, 'Asad Nazir', '<p><strong>Hi Ewa and Team,</strong><br />\r\n<br />\r\nAfter reviewing the patient account in detail. We have found that all the services are getting paid by both insurances except the lab services.<br />\r\nAs we already discussed his lab services amount is on the patient end because of the denials we had received from his both insurance. Now we send all his lab services balance on the patient end. There is a $6744.80 patient balance left as of now.&nbsp;<br />\r\n<br />\r\nWarm Regards,<br />\r\n<strong>Peter Alex!</strong></p>', 0, '2023-03-01 19:42:24', NULL, '2023-03-01 20:49:49'),
(2, 11, 15, 'Asad Nazir', '<p><strong>Hi Ewa and Team,</strong><br />\r\n<br />\r\nAfter reviewing the patient account in detail. We have found that all the services are getting paid by both insurances except the lab services.<br />\r\nAs we already discussed his lab services amount is on the patient end because of the denials we had received from his both insurance. Now we send all his lab services balance on the patient end. There is a $6744.80 patient balance left as of now.&nbsp;<br />\r\n<br />\r\nWarm Regards,<br />\r\n<strong>Peter Alex!</strong></p>', 0, '2023-03-01 19:42:24', NULL, '2023-03-01 20:49:54'),
(3, 11, 15, 'Asad Nazir', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 0, '2023-03-02 12:55:52', NULL, '2023-03-02 12:55:52'),
(4, 11, 15, 'Asad Nazir', '<p>Refered.</p>', 0, '2023-03-02 13:18:34', NULL, '2023-03-02 13:18:34'),
(5, 11, 15, 'Asad Nazir', '<p class=\"text-center text-danger mb-0 font-weight-bold\">This ticket is forwarded from Sales to CRM</p>', 1, '2023-03-02 13:18:34', NULL, '2023-03-02 22:16:25'),
(6, 19, 15, 'Asad Nazir', '<p>dsadsadsad</p>', 0, '2023-03-23 12:27:00', NULL, '2023-03-23 12:27:00'),
(7, 19, 15, 'Asad Nazir', '<p class=\"text-center text-danger mb-0 font-weight-bold\">This ticket is forwarded from CRM to Audit</p>', 1, '2023-03-23 12:27:00', NULL, '2023-03-23 12:27:00'),
(8, 19, 15, 'Asad Nazir', '<p>dsadsadsad</p>', 0, '2023-03-23 12:27:06', NULL, '2023-03-23 12:27:06'),
(9, 19, 15, 'Asad Nazir', '<p class=\"text-center text-danger mb-0 font-weight-bold\">This ticket is forwarded from Audit to Audit</p>', 1, '2023-03-23 12:27:06', NULL, '2023-03-23 12:27:06'),
(10, 19, 15, 'Asad Nazir', '<p>dsadsadsad</p>', 0, '2023-03-23 12:27:56', NULL, '2023-03-23 12:27:56'),
(11, 19, 15, 'Asad Nazir', '<p class=\"text-center text-danger mb-0 font-weight-bold\">This ticket is forwarded from Audit to Audit</p>', 1, '2023-03-23 12:27:56', NULL, '2023-03-23 12:27:56'),
(12, 19, 15, 'Asad Nazir', '<p>asdsadsadsadsad</p>', 0, '2023-03-23 12:43:28', NULL, '2023-03-23 12:43:28'),
(13, 19, 15, 'Asad Nazir', '<p class=\"text-center text-danger mb-0 font-weight-bold\">This ticket is forwarded from Audit to Audit</p>', 1, '2023-03-23 12:43:28', NULL, '2023-03-23 12:43:28'),
(14, 19, 15, 'Asad Nazir', '<p>asdsadsadsadsad</p>', 0, '2023-03-23 12:44:19', NULL, '2023-03-23 12:44:19'),
(15, 19, 15, 'Asad Nazir', '<p class=\"text-center text-danger mb-0 font-weight-bold\">This ticket is forwarded from Audit to Audit</p>', 1, '2023-03-23 12:44:19', NULL, '2023-03-23 12:44:19'),
(16, 19, 15, 'Asad Nazir', '<p>asdsadsadsadsad</p>', 0, '2023-03-23 12:45:20', NULL, '2023-03-23 12:45:20'),
(17, 19, 15, 'Asad Nazir', '<p class=\"text-center text-danger mb-0 font-weight-bold\">This ticket is forwarded from Audit to Audit</p>', 1, '2023-03-23 12:45:20', NULL, '2023-03-23 12:45:20'),
(18, 1, 15, 'Asad Nazir', '<p>test reply</p>', 0, '2023-04-06 09:44:42', NULL, '2023-04-06 09:44:42');

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
(10, 0, 123, 2, 0, 2, 'Rahmat', 'Ali', 'Rahmat Ali', 'admin@mail.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', '1b5YKxZAiZ6zR8c1sQtcNnRE2xStiuURvEiu0LrsquG4gy3tbHFjEf4G2yge', NULL, 0, '2023-01-04 04:24:33', '2023-02-24 09:42:42'),
(11, 4, 1234, 2, 2, 2, 'Super', 'Admin', NULL, 'superadmin4@bmb.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-01-19 13:39:09', '2023-01-19 13:39:09'),
(12, 5, 124, 2, 2, 2, 'Super', 'Admin', NULL, 'superadmin5@test.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-01-22 12:33:56', '2023-01-22 12:33:56'),
(13, 1, 125, 2, 2, 2, 'John D.', 'John D.', NULL, 'JohnDMurray@teleworm.us', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-01-25 10:36:08', '2023-01-25 10:36:08'),
(14, 1, 126, 2, 3, 2, 'test', 'client', NULL, 'client@gmail.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-02-05 10:19:42', '2023-02-05 10:19:42'),
(15, 6, 2703, 6, 2, 2, 'Asad', 'Nazir', 'Asad Nazir Awan', 'superadmin6@new.com', 'superadmin6', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 7, '2023-02-16 16:08:10', '2023-03-20 15:18:50'),
(16, 6, 127, 2, 3, 12, 'New', 'Client 1', NULL, 'newclient@gmail.com', 'newclient', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 4, '2023-02-16 16:10:37', '2023-03-20 15:27:50'),
(17, 6, 23213, 5, 2, 2, 'Test', 'Test', 'Asad Nazir Awan', 'test@gmail.com', 'admin', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-02-21 12:54:37', '2023-04-04 11:12:23'),
(18, 6, 2312, 4, 2, 12, 'Test', 'User', 'abc', 'testuser@gmail.com', 'frank', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-02-27 12:43:41', '2023-04-04 11:12:36'),
(19, 6, 128, 2, 3, 2, 'New', 'Client 2', NULL, 'newclient2@gmail.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-03-02 15:49:40', '2023-03-02 15:49:40'),
(20, 6, 129, 2, 3, 2, 'New', 'Client 3', NULL, 'newclient3@gmail.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-03-02 16:12:25', '2023-03-02 16:12:25');

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
