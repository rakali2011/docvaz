-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 15, 2023 at 09:11 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(67, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"6aTM95gLPKJEI89VjHKFm00SlsY5sNEXEAUnrW66ft6zwKPy7ay2gEVhY4sd\"}', '{\"remember_token\":\"1b5YKxZAiZ6zR8c1sQtcNnRE2xStiuURvEiu0LrsquG4gy3tbHFjEf4G2yge\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', NULL, '2023-04-17 14:40:19', '2023-04-17 14:40:19'),
(68, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"1b5YKxZAiZ6zR8c1sQtcNnRE2xStiuURvEiu0LrsquG4gy3tbHFjEf4G2yge\"}', '{\"remember_token\":\"IWttNjoLxVWp7cACv3VcI6IQpSrBWFUQMYtjLZIIs7KIshPpZVN4F7NFmqmb\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-18 11:17:20', '2023-04-18 11:17:20'),
(69, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"IWttNjoLxVWp7cACv3VcI6IQpSrBWFUQMYtjLZIIs7KIshPpZVN4F7NFmqmb\"}', '{\"remember_token\":\"t3GoR3sKYoOoaMbsKabfrhFLwox613TIxGp0SARJ3lVpum2VlhPHMl0ND5H9\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-18 11:44:42', '2023-04-18 11:44:42'),
(70, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"t3GoR3sKYoOoaMbsKabfrhFLwox613TIxGp0SARJ3lVpum2VlhPHMl0ND5H9\"}', '{\"remember_token\":\"m3ICTU9nK12pTNCzevg7IHErU4brhjqUZ0ZKpDcqFp1Yn8OaSP3tXE2rH9N1\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-18 14:49:19', '2023-04-18 14:49:19'),
(71, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"m3ICTU9nK12pTNCzevg7IHErU4brhjqUZ0ZKpDcqFp1Yn8OaSP3tXE2rH9N1\"}', '{\"remember_token\":\"l0Xpfmf6ESocYBdfAcypgpsWlWbrN2F6FelzDICXRqhb5N4dQlutx3W31NWk\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-18 15:00:29', '2023-04-18 15:00:29'),
(72, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"l0Xpfmf6ESocYBdfAcypgpsWlWbrN2F6FelzDICXRqhb5N4dQlutx3W31NWk\"}', '{\"remember_token\":\"KtHzuF5Lu9SJqH76OUM6YYxmhMlbweMJxlbsaSCccB21EUmh54xrPrDVlThD\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-19 11:14:26', '2023-04-19 11:14:26'),
(73, 'App\\Models\\User', 15, 'created', 'App\\Models\\User', 21, '[]', '{\"company_id\":6,\"firstname\":\"Rafia\",\"lastname\":\"Afzal\",\"psudo_name\":\"Rafiya Afzal\",\"employee_id\":\"2520\",\"email\":\"rafia.afzal@bellmedex.com\",\"username\":\"rafia.afzal\",\"password\":\"$2y$10$bPr25IIXV2ZmFkoyjrm1\\/uGDs73CrqYjszHWn5L8hKsFrIPN5qODq\",\"type\":2,\"timezone\":\"0\",\"status\":\"2\",\"designation_id\":\"5\",\"id\":21}', 'http://127.0.0.1:8000/post-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-20 12:52:02', '2023-04-20 12:52:02'),
(74, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 21, '{\"timezone\":0}', '{\"timezone\":\"2\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6Im5mZmx4SlIzWTJmbFZzVlVMdCtkeGc9PSIsInZhbHVlIjoiMDdxWHRjNWx5ZUsxcTN1ZTFxSTl0dz09IiwibWFjIjoiNTY3MjQ5M2FmMjAyYzhkNTFmZDFiOTk5YzFkMDVmZGI2NTNjMjcyNzQxZjE1ZWY3NTQ1ZTJmMDkzNWM1M2ZkNyIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-20 15:36:13', '2023-04-20 15:36:13'),
(75, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 17, '{\"firstname\":\"Test\",\"lastname\":\"Test\",\"psudo_name\":\"Asad Nazir Awan\",\"email\":\"test@gmail.com\",\"username\":\"admin\"}', '{\"firstname\":\"Haroon\",\"lastname\":\"Khan\",\"psudo_name\":\"Haroon Khan\",\"email\":\"haroon.khan@bellmedex.com\",\"username\":\"haroon.khan\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6IlVoWElVTHRCVytncVFmWktNQTZaV1E9PSIsInZhbHVlIjoiL3JsbTk0ZUxMMFlnQkJoNTFHaDhkUT09IiwibWFjIjoiNWZmMWM3OTVkM2JhZjY4ODdiZDZlMjE1ODVkNDFjMmZhZjUzNThiZDIwZWVjNDY3MmM2NDkxMGZjNGJhMmI3NSIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-20 15:51:54', '2023-04-20 15:51:54'),
(76, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 17, '{\"employee_id\":23213}', '{\"employee_id\":\"2704\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6IkFJSG05ZFpPMEduUkJ0aDd6akovTXc9PSIsInZhbHVlIjoiUVZXUWs1RFpXa1FybUtkbEFJZlpwdz09IiwibWFjIjoiNTUyYjQ1NDEzZGM0ZmIzODk0MjNjYzU1NzM0MzMyMGJmZDUxNmFkN2M1YzlhMjg2ZjliYWFjNDNkNmNhZWEzYyIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-20 15:52:09', '2023-04-20 15:52:09'),
(77, 'App\\Models\\User', 15, 'created', 'App\\Models\\User', 22, '[]', '{\"company_id\":6,\"firstname\":\"Laiba\",\"lastname\":\"Malik\",\"psudo_name\":\"Laiba Malik\",\"employee_id\":\"2709\",\"email\":\"laiba.malik@bellmedex.com\",\"username\":\"laiba.malik\",\"password\":\"$2y$10$MEgSFuJ1aQLVdwKM9Pkmz.DL7OpReRHi5HaHr1g8DweR2ECnjcNCC\",\"type\":2,\"timezone\":\"7\",\"status\":\"2\",\"designation_id\":\"5\",\"id\":22}', 'http://127.0.0.1:8000/post-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 09:52:39', '2023-04-25 09:52:39'),
(78, 'App\\Models\\User', 15, 'created', 'App\\Models\\Designation', 8, '[]', '{\"name\":\"Software Developer\",\"company_id\":6,\"id\":8}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 09:53:12', '2023-04-25 09:53:12'),
(79, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 22, '{\"designation_id\":5}', '{\"designation_id\":\"8\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6Ii9BNHVuV0lzVFhNQUVaWGJuVFFLMWc9PSIsInZhbHVlIjoiRXNMTmwwM1lsdWhFYnlNNWl0c3d1dz09IiwibWFjIjoiYmQyZmIwYzgwNmI0M2I0NDU1YzdlYmJkMzA3ZjlmZDY3MzIyMmEwMThhZTc1ZjgxNmMwMzA3NDFiMjFiNWI5MSIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 09:53:39', '2023-04-25 09:53:39'),
(80, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 21, '{\"designation_id\":5}', '{\"designation_id\":\"8\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6ImU1a3ZLWUx0Z0Y0bEpOUzRTUC9LRFE9PSIsInZhbHVlIjoiL3VXRWtVV3gzSnRnZGx0ZlM5dmhXdz09IiwibWFjIjoiY2ViM2JlYjZkMjZmYjAzZGRjYzcyYzJmNTczYmVlMjUzY2I1ZGFlNTg3MDIyZmQzNGYxNzFjMzYyYTk1NTAyYyIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 09:53:56', '2023-04-25 09:53:56'),
(81, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 18, '{\"status\":12,\"firstname\":\"Test\",\"lastname\":\"User\",\"psudo_name\":\"abc\",\"email\":\"testuser@gmail.com\",\"username\":\"frank\"}', '{\"status\":\"2\",\"firstname\":\"Frank\",\"lastname\":\"Lee\",\"psudo_name\":\"Frank Lee\",\"email\":\"frank.lee@bellmedex.com\",\"username\":\"frank.lee\"}', 'http://127.0.0.1:8000/update-user/eyJpdiI6ImxVTi83LzNvbEtQWjVnUFhFOWJxSkE9PSIsInZhbHVlIjoiNzd0QXVDdmFZZk1nYXZuVmI2TGlzZz09IiwibWFjIjoiYzVlYzFmMGQ3MzBmZGYxNzA0NDFiMWVjYTE3M2I5YWRjMTcwYTQwNTNlNTFjNmMwNWVjNGMyYzAyNDc1ZGE0NCIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 09:55:44', '2023-04-25 09:55:44'),
(82, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 20, '{\"status\":2,\"username\":\"\"}', '{\"status\":\"10\",\"username\":\"newclient3\"}', 'http://127.0.0.1:8000/update-client/eyJpdiI6IlJKR1BwNSsvMGVLeVZxMFRFeDM0Z2c9PSIsInZhbHVlIjoiYVpTaWdSOThORE8ybkQwTTQ5eEQ4dz09IiwibWFjIjoiODcxYjVlOTVjMjY3N2FmMjlhYTcwNTUxODhiMzhlNGI3NTljZDYxMTAzMzdjZmIxYmRhMWJiZjE3ZjJiNTBjMCIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 11:21:07', '2023-04-25 11:21:07'),
(83, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 19, '{\"status\":2,\"username\":\"\"}', '{\"status\":\"10\",\"username\":\"newclient2\"}', 'http://127.0.0.1:8000/update-client/eyJpdiI6Imtua1BZL3dPSjE0WVgyamZUQVAvOHc9PSIsInZhbHVlIjoiNHFRMWpoSDRYN2pMcTFaZU9oT1NCQT09IiwibWFjIjoiMjIwOTNiZTU0M2VjNWJhYTg0OGQyYTM5NTBkMzhjYmFkZjY0Yjk0NDQzNDYxODI0YWQ3MGMyYWE1NWVhYmQ5NyIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 11:21:21', '2023-04-25 11:21:21'),
(84, 'App\\Models\\User', 15, 'updated', 'App\\Models\\User', 16, '{\"status\":12}', '{\"status\":\"10\"}', 'http://127.0.0.1:8000/update-client/eyJpdiI6IkNQb1pEcUd0VEZ6T1B5K090SldEVlE9PSIsInZhbHVlIjoiK21xaGFOdmU4c1lReVFvZjd1R3R5Zz09IiwibWFjIjoiY2ZlMDExMjhhMjZhODk2OGU0ZDM5YjQzOGMxYzg4NGVjMGQ1MTNiNmMyOTJlMWY0ZTVhNGMzMmE0Nzc0MmUzZiIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 11:21:36', '2023-04-25 11:21:36'),
(85, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Practice', 8, '{\"physical_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"mailing_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"location_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"dmail_emails\":\"asad.nazir@bellmedex.com,asad@bellmedex.com\",\"focal_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}]\",\"owner_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}]\",\"provider_information\":\"[{\\\"dob\\\": null, \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}]\",\"caqh\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"clearinghouse\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"ehr\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"management_software\":\"[{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}]\",\"payers_info\":\"[{\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": null, \\\"enroll_with\\\": null, \\\"provider_name\\\": null, \\\"effective_date\\\": null}, {\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": \\\"individual\\\", \\\"enroll_with\\\": \\\"tax_id\\\", \\\"provider_name\\\": null, \\\"effective_date\\\": \\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"value\\\": \\\"1\\\", \\\"option\\\": \\\"daily\\\"}\",\"bellmedex_services\":\"{\\\"ar\\\": \\\"1\\\", \\\"phd\\\": \\\"1\\\", \\\"coding\\\": \\\"1\\\", \\\"billing\\\": \\\"1\\\", \\\"ar_start\\\": \\\"2023-04-14\\\", \\\"authorization\\\": \\\"1\\\", \\\"credentialing\\\": \\\"1\\\", \\\"eligibility_check\\\": \\\"1\\\", \\\"patient_statement\\\": \\\"1\\\", \\\"key_billing_issues\\\": null, \\\"special_instructions\\\": null, \\\"complementary_services\\\": null}\",\"crm\":\"{\\\"welcome_email\\\": null, \\\"orientation_by\\\": null, \\\"mom_sharing_date\\\": null, \\\"docuhub_orientation\\\": \\\"0\\\", \\\"attended_by_crm_team\\\": null, \\\"orientation_datetime\\\": null, \\\"onboarding_metting_date\\\": null}\",\"operations\":\"{\\\"logins_receipt\\\": null, \\\"sop_preparation\\\": \\\"0\\\", \\\"preparation_date\\\": null, \\\"first_billing_received\\\": null, \\\"first_service_provided_name\\\": null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_auth\\\": null, \\\"thresh_elect\\\": null, \\\"thresh_portal\\\": null, \\\"thresh_denials\\\": null, \\\"thresh_posting\\\": null, \\\"thresh_rejections\\\": null, \\\"thresh_eligibility\\\": null, \\\"thresh_charge_entry\\\": null, \\\"thresh_posting_elect\\\": null, \\\"thresh_charge_elect_checkbox\\\": \\\"0\\\", \\\"thresh_charge_manual_checkbox\\\": \\\"0\\\", \\\"thresh_posting_elect_checkbox\\\": \\\"0\\\", \\\"thresh_posting_manual_checkbox\\\": \\\"0\\\", \\\"thresh_eligibility_cal_checkbox\\\": \\\"0\\\", \\\"thresh_eligibility_portal_checkbox\\\": \\\"0\\\", \\\"thresh_charge_with_demo_graphics_checkbox\\\": \\\"0\\\"}\",\"thresh_payer\":\"[{\\\"name\\\": null, \\\"claims\\\": null}]\"}', '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"dmail_emails\":\"asad.nazir@bellmedex.com,asad@bellmedex.com,shehbaz@bellmedex.com\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null},{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":\\\"individual\\\",\\\"enroll_with\\\":\\\"tax_id\\\",\\\"effective_date\\\":\\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"option\\\":null,\\\"value\\\":null}\",\"bellmedex_services\":\"{\\\"credentialing\\\":\\\"1\\\",\\\"coding\\\":\\\"1\\\",\\\"phd\\\":\\\"1\\\",\\\"billing\\\":\\\"1\\\",\\\"eligibility_check\\\":\\\"1\\\",\\\"authorization\\\":\\\"1\\\",\\\"patient_statement\\\":\\\"1\\\",\\\"ar\\\":\\\"1\\\",\\\"ar_start\\\":\\\"2023-04-14\\\",\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":\\\"0\\\",\\\"orientation_datetime\\\":null,\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":null}\",\"operations\":\"{\\\"logins_receipt\\\":\\\"0\\\",\\\"login_date\\\":null,\\\"sop_preparation\\\":\\\"0\\\",\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_eligibility_cal_checkbox\\\":0,\\\"thresh_eligibility\\\":null,\\\"thresh_charge_manual_checkbox\\\":0,\\\"thresh_charge_with_demo_graphics_checkbox\\\":0,\\\"thresh_charge_entry\\\":null,\\\"thresh_posting_manual_checkbox\\\":0,\\\"thresh_posting\\\":null,\\\"thresh_eligibility_portal_checkbox\\\":0,\\\"thresh_portal\\\":null,\\\"thresh_charge_elect_checkbox\\\":0,\\\"thresh_elect\\\":null,\\\"thresh_posting_elect_checkbox\\\":0,\\\"thresh_posting_elect\\\":null,\\\"thresh_auth\\\":null,\\\"thresh_rejections\\\":null,\\\"thresh_denials\\\":null}\",\"thresh_payer\":\"[{\\\"name\\\":null,\\\"claims\\\":null}]\"}', 'http://127.0.0.1:8000/update-practice/eyJpdiI6IjcvMVg0VVgxN3JuWEhFNHRSenFWNVE9PSIsInZhbHVlIjoicHRPa1R2ZUdENitqWENCN2p4Q0RQdz09IiwibWFjIjoiZTQ0MzFiMGM4ZTY1YTQxOTQ2YTI1ZGRiOWFhZDc5Y2MzOTkwM2M5MzVhZjkyNDJjOWE2MzkzZGJlOGFjMzgyNCIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 14:32:28', '2023-04-25 14:32:28'),
(86, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Practice', 8, '{\"speciality\":\"HOME HEALTH CARE AGENCY,COUNSELOR,GYNOCOLOGY,NATUROPATHIC MEDICINE,FAMILY MEDICINE,NURSE PRACTITIONER FAMILY,RADIOLOGY VASCULAR & INTERVENTI,CARDIOLOGY,APPLIED BEHAVIOR ANALYST,NON-EMERGENCY MEDICAL TRANSPORT\",\"physical_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"mailing_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"location_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"dmail_emails\":\"asad.nazir@bellmedex.com,asad@bellmedex.com,shehbaz@bellmedex.com\",\"focal_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}]\",\"owner_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}]\",\"provider_information\":\"[{\\\"dob\\\": null, \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}]\",\"caqh\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"clearinghouse\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"ehr\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"management_software\":\"[{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}]\",\"payers_info\":\"[{\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": null, \\\"enroll_with\\\": null, \\\"provider_name\\\": null, \\\"effective_date\\\": null}, {\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": \\\"individual\\\", \\\"enroll_with\\\": \\\"tax_id\\\", \\\"provider_name\\\": null, \\\"effective_date\\\": \\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"value\\\": null, \\\"option\\\": null}\",\"bellmedex_services\":\"{\\\"ar\\\": \\\"1\\\", \\\"phd\\\": \\\"1\\\", \\\"coding\\\": \\\"1\\\", \\\"billing\\\": \\\"1\\\", \\\"ar_start\\\": \\\"2023-04-14\\\", \\\"authorization\\\": \\\"1\\\", \\\"credentialing\\\": \\\"1\\\", \\\"eligibility_check\\\": \\\"1\\\", \\\"patient_statement\\\": \\\"1\\\", \\\"key_billing_issues\\\": null, \\\"special_instructions\\\": null, \\\"complementary_services\\\": null}\",\"crm\":\"{\\\"welcome_email\\\": null, \\\"orientation_by\\\": null, \\\"mom_sharing_date\\\": null, \\\"docuhub_orientation\\\": \\\"0\\\", \\\"attended_by_crm_team\\\": null, \\\"orientation_datetime\\\": null, \\\"onboarding_metting_date\\\": null}\",\"operations\":\"{\\\"login_date\\\": null, \\\"logins_receipt\\\": \\\"0\\\", \\\"sop_preparation\\\": \\\"0\\\", \\\"preparation_date\\\": null, \\\"first_billing_received\\\": null, \\\"first_service_provided_name\\\": null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_auth\\\": null, \\\"thresh_elect\\\": null, \\\"thresh_portal\\\": null, \\\"thresh_denials\\\": null, \\\"thresh_posting\\\": null, \\\"thresh_rejections\\\": null, \\\"thresh_eligibility\\\": null, \\\"thresh_charge_entry\\\": null, \\\"thresh_posting_elect\\\": null, \\\"thresh_charge_elect_checkbox\\\": 0, \\\"thresh_charge_manual_checkbox\\\": 0, \\\"thresh_posting_elect_checkbox\\\": 0, \\\"thresh_posting_manual_checkbox\\\": 0, \\\"thresh_eligibility_cal_checkbox\\\": 0, \\\"thresh_eligibility_portal_checkbox\\\": 0, \\\"thresh_charge_with_demo_graphics_checkbox\\\": 0}\",\"thresh_payer\":\"[{\\\"name\\\": null, \\\"claims\\\": null}]\"}', '{\"speciality\":\"COUNSELOR,HOME HEALTH CARE AGENCY,CHIROPRACTOR,GYNOCOLOGY\",\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"dmail_emails\":\"asad.nazir@bellmedex.com,asad@bellmedex.com,shehbaz@bellmedex.com,abc@mail.com\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null},{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":\\\"individual\\\",\\\"enroll_with\\\":\\\"tax_id\\\",\\\"effective_date\\\":\\\"2023-04-15\\\"}]\",\"claim_creation_frequency\":\"{\\\"option\\\":null,\\\"value\\\":null}\",\"bellmedex_services\":\"{\\\"credentialing\\\":\\\"1\\\",\\\"coding\\\":\\\"1\\\",\\\"phd\\\":\\\"1\\\",\\\"billing\\\":\\\"1\\\",\\\"eligibility_check\\\":\\\"1\\\",\\\"authorization\\\":\\\"1\\\",\\\"patient_statement\\\":\\\"1\\\",\\\"ar\\\":\\\"1\\\",\\\"ar_start\\\":\\\"2023-04-14\\\",\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":\\\"0\\\",\\\"orientation_datetime\\\":null,\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":null}\",\"operations\":\"{\\\"logins_receipt\\\":\\\"0\\\",\\\"login_date\\\":null,\\\"sop_preparation\\\":\\\"0\\\",\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_eligibility_cal_checkbox\\\":0,\\\"thresh_eligibility\\\":null,\\\"thresh_charge_manual_checkbox\\\":0,\\\"thresh_charge_with_demo_graphics_checkbox\\\":0,\\\"thresh_charge_entry\\\":null,\\\"thresh_posting_manual_checkbox\\\":0,\\\"thresh_posting\\\":null,\\\"thresh_eligibility_portal_checkbox\\\":0,\\\"thresh_portal\\\":null,\\\"thresh_charge_elect_checkbox\\\":0,\\\"thresh_elect\\\":null,\\\"thresh_posting_elect_checkbox\\\":0,\\\"thresh_posting_elect\\\":null,\\\"thresh_auth\\\":null,\\\"thresh_rejections\\\":null,\\\"thresh_denials\\\":null}\",\"thresh_payer\":\"[{\\\"name\\\":null,\\\"claims\\\":null}]\"}', 'http://127.0.0.1:8000/update-practice/eyJpdiI6InRDT25SQ09aZER4YWNmRC9IaVM4TVE9PSIsInZhbHVlIjoibk1ZQS9Fd2VNaW81MkIvaEVlaGlpdz09IiwibWFjIjoiYjA3YjQ3YTU2MjZiN2I0ODI4ODQ0ZjlkYWRjMzUwNzQwNDQwNWE2ODEwMjA5YTVkMjQ2MzhmYzcyZjcxZWVhYiIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-25 15:06:14', '2023-04-25 15:06:14'),
(87, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"KtHzuF5Lu9SJqH76OUM6YYxmhMlbweMJxlbsaSCccB21EUmh54xrPrDVlThD\"}', '{\"remember_token\":\"zd4DrbIxyFnyijUrWN2zRJHdLTQvlKTLGzlCwwF2KQnLiYAOur42nxGNjlAg\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-26 08:19:44', '2023-04-26 08:19:44'),
(88, 'App\\Models\\User', 15, 'created', 'App\\Models\\Team', 7, '[]', '{\"name\":\"Team E\",\"company_id\":6,\"id\":7}', 'http://127.0.0.1:8000/post-team', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-26 08:55:10', '2023-04-26 08:55:10'),
(89, 'App\\Models\\User', 15, 'created', 'App\\Models\\Team', 8, '[]', '{\"name\":\"Team F\",\"company_id\":6,\"id\":8}', 'http://127.0.0.1:8000/post-team', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-26 08:55:27', '2023-04-26 08:55:27'),
(90, 'App\\Models\\User', 15, 'created', 'App\\Models\\Team', 9, '[]', '{\"name\":\"Team G\",\"company_id\":6,\"id\":9}', 'http://127.0.0.1:8000/post-team', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-26 08:55:40', '2023-04-26 08:55:40'),
(91, 'App\\Models\\User', 15, 'created', 'App\\Models\\Designation', 9, '[]', '{\"name\":\"Team Lead\",\"company_id\":6,\"id\":9}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-26 09:22:52', '2023-04-26 09:22:52'),
(92, 'App\\Models\\User', 15, 'created', 'App\\Models\\Designation', 10, '[]', '{\"name\":\"Backup Team Lead\",\"company_id\":6,\"id\":10}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-26 09:23:27', '2023-04-26 09:23:27'),
(93, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Designation', 8, '{\"name\":\"Software Developer\"}', '{\"name\":\"Senior Software Developer\"}', 'http://127.0.0.1:8000/designations/8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-26 09:24:12', '2023-04-26 09:24:12'),
(94, 'App\\Models\\User', 15, 'created', 'App\\Models\\Designation', 11, '[]', '{\"name\":\"Junior Software Developer\",\"company_id\":6,\"id\":11}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-04-26 09:24:51', '2023-04-26 09:24:51'),
(95, 'App\\Models\\User', 10, 'created', 'App\\Models\\Company', 7, '[]', '{\"name\":\"Apple\",\"prefix\":\"apple\",\"id\":7}', 'http://127.0.0.1:8000/post-company', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 13:33:41', '2023-05-01 13:33:41'),
(96, 'App\\Models\\User', 10, 'created', 'App\\Models\\Company', 8, '[]', '{\"name\":\"Apple\",\"prefix\":\"apple\",\"id\":8}', 'http://127.0.0.1:8000/post-company', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 13:35:42', '2023-05-01 13:35:42'),
(97, 'App\\Models\\User', 10, 'created', 'App\\Models\\Company', 9, '[]', '{\"name\":\"Apple\",\"prefix\":\"apple\",\"id\":9}', 'http://127.0.0.1:8000/post-company', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 13:43:39', '2023-05-01 13:43:39'),
(98, 'App\\Models\\User', 10, 'created', 'App\\Models\\Company', 10, '[]', '{\"name\":\"Apple\",\"prefix\":\"apple\",\"id\":10}', 'http://127.0.0.1:8000/post-company', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 13:45:39', '2023-05-01 13:45:39'),
(99, 'App\\Models\\User', 10, 'created', 'App\\Models\\User', 23, '[]', '{\"company_id\":10,\"firstname\":\"Super\",\"lastname\":\"Admin\",\"email\":\"superadmin10@apple.com\",\"username\":\"superadmin10\",\"timezone\":\"0\",\"password\":\"$2y$10$l.i1Ne5ZUIluwqoL4I1lCujw\\/xaIToHAlRvYlX1c27lP2YHka7JlS\",\"id\":23}', 'http://127.0.0.1:8000/post-company', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 13:45:39', '2023-05-01 13:45:39'),
(100, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"zd4DrbIxyFnyijUrWN2zRJHdLTQvlKTLGzlCwwF2KQnLiYAOur42nxGNjlAg\"}', '{\"remember_token\":\"Sn86y6XERNVUWz7DDArjuJdnVFW84w2lnVYZr5aW1O53kKBW6ELG2luWmfAz\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:07:02', '2023-05-01 14:07:02'),
(101, 'App\\Models\\User', 23, 'created', 'App\\Models\\Department', 10, '[]', '{\"name\":\"Medical Billing\",\"parent_id\":\"0\",\"company_id\":10,\"id\":10}', 'http://127.0.0.1:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:21:54', '2023-05-01 14:21:54'),
(102, 'App\\Models\\User', 23, 'created', 'App\\Models\\Department', 11, '[]', '{\"name\":\"Claim Submission\",\"parent_id\":\"10\",\"company_id\":10,\"id\":11}', 'http://127.0.0.1:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:22:34', '2023-05-01 14:22:34'),
(103, 'App\\Models\\User', 23, 'created', 'App\\Models\\Department', 12, '[]', '{\"name\":\"Payment Posting\",\"parent_id\":\"10\",\"company_id\":10,\"id\":12}', 'http://127.0.0.1:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:23:13', '2023-05-01 14:23:13'),
(104, 'App\\Models\\User', 23, 'created', 'App\\Models\\Department', 13, '[]', '{\"name\":\"Sales\",\"parent_id\":\"0\",\"company_id\":10,\"id\":13}', 'http://127.0.0.1:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:23:58', '2023-05-01 14:23:58'),
(105, 'App\\Models\\User', 23, 'created', 'App\\Models\\Designation', 12, '[]', '{\"name\":\"SMO\",\"company_id\":10,\"id\":12}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:24:39', '2023-05-01 14:24:39'),
(106, 'App\\Models\\User', 23, 'created', 'App\\Models\\Designation', 13, '[]', '{\"name\":\"MO\",\"company_id\":10,\"id\":13}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:24:46', '2023-05-01 14:24:46'),
(107, 'App\\Models\\User', 23, 'created', 'App\\Models\\Designation', 14, '[]', '{\"name\":\"Sales Executive\",\"company_id\":10,\"id\":14}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:24:59', '2023-05-01 14:24:59'),
(108, 'App\\Models\\User', 23, 'created', 'App\\Models\\Designation', 15, '[]', '{\"name\":\"Billing Executive\",\"company_id\":10,\"id\":15}', 'http://127.0.0.1:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:25:22', '2023-05-01 14:25:22'),
(109, 'App\\Models\\User', 23, 'created', 'App\\Models\\DocumentType', 10, '[]', '{\"name\":\"Registration Form\",\"company_id\":10,\"id\":10}', 'http://127.0.0.1:8000/document_types', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:26:26', '2023-05-01 14:26:26'),
(110, 'App\\Models\\User', 23, 'created', 'App\\Models\\DocumentType', 11, '[]', '{\"name\":\"Day Sheet\",\"company_id\":10,\"id\":11}', 'http://127.0.0.1:8000/document_types', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:26:34', '2023-05-01 14:26:34'),
(111, 'App\\Models\\User', 23, 'created', 'App\\Models\\DocumentType', 12, '[]', '{\"name\":\"EOBs\",\"company_id\":10,\"id\":12}', 'http://127.0.0.1:8000/document_types', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:26:51', '2023-05-01 14:26:51'),
(112, 'App\\Models\\User', 23, 'created', 'App\\Models\\DocumentType', 13, '[]', '{\"name\":\"Super Bill\",\"company_id\":10,\"id\":13}', 'http://127.0.0.1:8000/document_types', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:27:07', '2023-05-01 14:27:07'),
(113, 'App\\Models\\User', 23, 'created', 'App\\Models\\DocumentType', 14, '[]', '{\"name\":\"Insurance Letters\",\"company_id\":10,\"id\":14}', 'http://127.0.0.1:8000/document_types', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:27:54', '2023-05-01 14:27:54'),
(114, 'App\\Models\\User', 23, 'created', 'App\\Models\\DocumentType', 15, '[]', '{\"name\":\"Call Charges\",\"company_id\":10,\"id\":15}', 'http://127.0.0.1:8000/document_types', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:28:03', '2023-05-01 14:28:03'),
(115, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 28, '[]', '{\"name\":\"To be posted\",\"type\":\"document\",\"company_id\":10,\"id\":28}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:55:42', '2023-05-01 14:55:42'),
(116, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 29, '[]', '{\"name\":\"Posted\",\"type\":\"document\",\"company_id\":10,\"id\":29}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:55:53', '2023-05-01 14:55:53'),
(117, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 30, '[]', '{\"name\":\"Pending\",\"type\":\"document\",\"company_id\":10,\"id\":30}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:56:04', '2023-05-01 14:56:04'),
(118, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 31, '[]', '{\"name\":\"Completed\",\"type\":\"document\",\"company_id\":10,\"id\":31}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:56:13', '2023-05-01 14:56:13'),
(119, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 32, '[]', '{\"name\":\"Open\",\"type\":\"ticket\",\"company_id\":10,\"id\":32}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:56:35', '2023-05-01 14:56:35'),
(120, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 33, '[]', '{\"name\":\"Close\",\"type\":\"ticket\",\"company_id\":10,\"id\":33}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:56:43', '2023-05-01 14:56:43'),
(121, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 34, '[]', '{\"name\":\"In process\",\"type\":\"ticket\",\"company_id\":10,\"id\":34}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:56:55', '2023-05-01 14:56:55'),
(122, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 35, '[]', '{\"name\":\"Active\",\"type\":\"user\",\"company_id\":10,\"id\":35}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:57:09', '2023-05-01 14:57:09'),
(123, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 36, '[]', '{\"name\":\"Inactive\",\"type\":\"user\",\"company_id\":10,\"id\":36}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:57:19', '2023-05-01 14:57:19'),
(124, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 37, '[]', '{\"name\":\"Active\",\"type\":\"client\",\"company_id\":10,\"id\":37}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:57:34', '2023-05-01 14:57:34'),
(125, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 38, '[]', '{\"name\":\"Inactive\",\"type\":\"client\",\"company_id\":10,\"id\":38}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:57:43', '2023-05-01 14:57:43'),
(126, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 39, '[]', '{\"name\":\"Active\",\"type\":\"practice\",\"company_id\":10,\"id\":39}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:03', '2023-05-01 14:58:03'),
(127, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 40, '[]', '{\"name\":\"Inactive\",\"type\":\"practice\",\"company_id\":10,\"id\":40}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:13', '2023-05-01 14:58:13'),
(128, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 41, '[]', '{\"name\":\"On boarding in process\",\"type\":\"practice\",\"company_id\":10,\"id\":41}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:27', '2023-05-01 14:58:27'),
(129, 'App\\Models\\User', 23, 'created', 'App\\Models\\Status', 42, '[]', '{\"name\":\"Terminated\",\"type\":\"practice\",\"company_id\":10,\"id\":42}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:35', '2023-05-01 14:58:35'),
(130, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Status', 37, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:41', '2023-05-01 14:58:41'),
(131, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Status', 28, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:44', '2023-05-01 14:58:44'),
(132, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Status', 39, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:47', '2023-05-01 14:58:47'),
(133, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Status', 41, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:49', '2023-05-01 14:58:49'),
(134, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Status', 32, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:51', '2023-05-01 14:58:51'),
(135, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Status', 35, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 14:58:54', '2023-05-01 14:58:54'),
(136, 'App\\Models\\User', 23, 'created', 'App\\Models\\User', 24, '[]', '{\"company_id\":10,\"firstname\":\"Mazhar\",\"lastname\":\"Aftab\",\"psudo_name\":\"Max Smith\",\"employee_id\":\"1000\",\"email\":\"max.smith@apple.com\",\"username\":\"max.smith@apple.com\",\"password\":\"$2y$10$BhvWa5Lc\\/w4e1ZNaV8EK3.lcHGN6zRwwrvzq42cEhV9YInldQM2Gu\",\"type\":2,\"timezone\":\"0\",\"status\":\"35\",\"designation_id\":\"13\",\"id\":24}', 'http://127.0.0.1:8000/post-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:01:46', '2023-05-01 15:01:46');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(137, 'App\\Models\\User', 23, 'created', 'App\\Models\\Practice', 9, '[]', '{\"company_id\":10,\"status\":\"39\",\"reason\":null,\"date\":null,\"name\":null,\"speciality\":null,\"avg_charges\":null,\"group_npi\":null,\"group_ptan\":null,\"tax_id\":null,\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"dmail_emails\":null,\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null}]\",\"claim_creation_frequency\":\"{\\\"option\\\":null,\\\"value\\\":null}\",\"bellmedex_services\":\"{\\\"credentialing\\\":0,\\\"coding\\\":0,\\\"phd\\\":0,\\\"billing\\\":0,\\\"eligibility_check\\\":0,\\\"authorization\\\":0,\\\"patient_statement\\\":0,\\\"ar\\\":0,\\\"ar_start\\\":null,\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":0,\\\"orientation_datetime\\\":null,\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":null}\",\"operations\":\"{\\\"logins_receipt\\\":0,\\\"login_date\\\":null,\\\"sop_preparation\\\":0,\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_eligibility_cal_checkbox\\\":0,\\\"thresh_eligibility\\\":null,\\\"thresh_charge_manual_checkbox\\\":0,\\\"thresh_charge_with_demo_graphics_checkbox\\\":0,\\\"thresh_charge_entry\\\":null,\\\"thresh_posting_manual_checkbox\\\":0,\\\"thresh_posting\\\":null,\\\"thresh_eligibility_portal_checkbox\\\":0,\\\"thresh_portal\\\":null,\\\"thresh_charge_elect_checkbox\\\":0,\\\"thresh_elect\\\":null,\\\"thresh_posting_elect_checkbox\\\":0,\\\"thresh_posting_elect\\\":null,\\\"thresh_auth\\\":null,\\\"thresh_rejections\\\":null,\\\"thresh_denials\\\":null}\",\"thresh_payer\":\"[{\\\"name\\\":null,\\\"claims\\\":null}]\",\"id\":9}', 'http://127.0.0.1:8000/post-practice', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:03:33', '2023-05-01 15:03:33'),
(138, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Practice', 9, '{\"name\":null,\"speciality\":null,\"avg_charges\":null,\"group_npi\":null,\"group_ptan\":null,\"tax_id\":null,\"bellmedex_services\":\"{\\\"credentialing\\\":0,\\\"coding\\\":0,\\\"phd\\\":0,\\\"billing\\\":0,\\\"eligibility_check\\\":0,\\\"authorization\\\":0,\\\"patient_statement\\\":0,\\\"ar\\\":0,\\\"ar_start\\\":null,\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":0,\\\"orientation_datetime\\\":null,\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":null}\",\"operations\":\"{\\\"logins_receipt\\\":0,\\\"login_date\\\":null,\\\"sop_preparation\\\":0,\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\"}', '{\"name\":\"Demo Practice\",\"speciality\":\"HOME HEALTH CARE AGENCY,CHIROPRACTOR\",\"avg_charges\":\"10000\",\"group_npi\":\"1013403427\",\"group_ptan\":\"MZ610\",\"tax_id\":\"32432\",\"bellmedex_services\":\"{\\\"credentialing\\\":\\\"1\\\",\\\"coding\\\":\\\"1\\\",\\\"phd\\\":\\\"1\\\",\\\"billing\\\":\\\"1\\\",\\\"eligibility_check\\\":\\\"1\\\",\\\"authorization\\\":0,\\\"patient_statement\\\":\\\"1\\\",\\\"ar\\\":\\\"1\\\",\\\"ar_start\\\":null,\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":\\\"1\\\",\\\"orientation_datetime\\\":\\\"2023-05-02T01:07\\\",\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":\\\"2023-05-02T01:08\\\"}\",\"operations\":\"{\\\"logins_receipt\\\":\\\"0\\\",\\\"login_date\\\":\\\"2023-05-02\\\",\\\"sop_preparation\\\":\\\"0\\\",\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\"}', 'http://127.0.0.1:8000/update-practice/eyJpdiI6Ilo1RFZhMk1NbnBqZnR6T2Y1dHJUeXc9PSIsInZhbHVlIjoiQVAydHRoNzZ6UXBRb3Y5c1pIM3NkQT09IiwibWFjIjoiMWJjOGZmOWRkN2EyYjA3NjNiNzNlNDYxY2IzODIwZDJkZDE0YjJkZjZhNGRmMjI2NGZhNzNjZjFmYWEyMTgwNyIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:11:48', '2023-05-01 15:11:48'),
(139, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Practice', 9, '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\"}', '{\"physical_address\":\"[{\\\"address\\\":\\\"werew\\\",\\\"zip\\\":\\\"fas13\\\",\\\"state\\\":\\\"asfda\\\",\\\"city\\\":\\\"asdfa\\\"}]\",\"mailing_address\":\"[{\\\"address\\\":\\\"werew\\\",\\\"zip\\\":\\\"_____\\\",\\\"state\\\":\\\"asfda\\\",\\\"city\\\":\\\"asdfa\\\"}]\"}', 'http://127.0.0.1:8000/update-practice/eyJpdiI6ImJRWld4bkg5VkJaRTZhdWtINi9HTmc9PSIsInZhbHVlIjoiU2Z4cG9MUklLYU9iK3NDZjVUWTdEQT09IiwibWFjIjoiMmYxMWY1NTcwMmY0ZGJkMTlmZDEyOTRiNjNkYTYxODFkMDU5ZGI3YTI1MGMxM2Y1ZDhlOWM4YzJjMTkwNTMyZSIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:12:02', '2023-05-01 15:12:02'),
(140, 'App\\Models\\User', 23, 'updated', 'App\\Models\\Practice', 9, '{\"physical_address\":\"[{\\\"address\\\":\\\"werew\\\",\\\"zip\\\":\\\"fas13\\\",\\\"state\\\":\\\"asfda\\\",\\\"city\\\":\\\"asdfa\\\"}]\",\"mailing_address\":\"[{\\\"address\\\":\\\"werew\\\",\\\"zip\\\":\\\"_____\\\",\\\"state\\\":\\\"asfda\\\",\\\"city\\\":\\\"asdfa\\\"}]\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\"}', '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null},{\\\"address\\\":\\\"werew\\\",\\\"zip\\\":\\\"fas13\\\",\\\"state\\\":\\\"asfda\\\",\\\"city\\\":\\\"asdfa\\\"}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null},{\\\"address\\\":\\\"werew\\\",\\\"zip\\\":\\\"_____\\\",\\\"state\\\":\\\"asfda\\\",\\\"city\\\":\\\"asdfa\\\"}]\",\"focal_info\":\"[{\\\"designation\\\":\\\"Doctor\\\",\\\"email\\\":\\\"focal2@gmail.com\\\",\\\"fax\\\":\\\"150002\\\",\\\"name\\\":\\\"SDFAS\\\",\\\"phone\\\":\\\"12345678902\\\"}]\",\"owner_info\":\"[{\\\"title\\\":\\\"MR\\\",\\\"name\\\":\\\"ALEJANDRA\\\",\\\"fax\\\":\\\"12646\\\",\\\"email\\\":\\\"test@temp.com\\\",\\\"phone\\\":\\\"123456\\\"}]\"}', 'http://127.0.0.1:8000/update-practice/eyJpdiI6IlUrbTlyby9CcHkwK0MzOEtReDZOMHc9PSIsInZhbHVlIjoiMThkSjlqSkxSUiswT2VNR2dMc2tMQT09IiwibWFjIjoiZjA1MWQ0NmU3MjJkZDg2MWZhMTlhNWM3ZjczOTczMzhmMjgzZTlkOTdkNDQ2NmJiNzhhMjQwOTY5ZTNhMzE2ZSIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:13:08', '2023-05-01 15:13:08'),
(141, 'App\\Models\\User', 23, 'created', 'App\\Models\\User', 25, '[]', '{\"firstname\":\"Nathan\",\"lastname\":\"Micry\",\"email\":\"nathan@example.com\",\"username\":\"nathan@example.com\",\"company_id\":10,\"password\":\"$2y$10$bJ4cKNWa7j0ExhZdIppniOZ0dxUTDTVLh.L8xEzOpEnGKLVmJQmCC\",\"type\":3,\"timezone\":\"7\",\"status\":\"37\",\"id\":25}', 'http://127.0.0.1:8000/post-client', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:16:51', '2023-05-01 15:16:51'),
(142, 'App\\Models\\User', 24, 'created', 'App\\Models\\File', 16, '[]', '{\"practice_id\":9,\"user_id\":24,\"status\":\"29\",\"doc_type\":\"11\",\"name\":\"JGhaY6ypWuZ7XUeBPpU0bKtbBy7ugnEymW5xvLuk.pdf\",\"org_name\":\"sample.pdf\",\"path\":\"uploads\\/files\\/05-2023\\/JGhaY6ypWuZ7XUeBPpU0bKtbBy7ugnEymW5xvLuk.pdf\",\"ext\":\"pdf\",\"size\":\"2.96 KB\",\"id\":16}', 'http://127.0.0.1:8000/post-file', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:35:40', '2023-05-01 15:35:40'),
(143, 'App\\Models\\User', 24, 'created', 'App\\Models\\File', 17, '[]', '{\"practice_id\":9,\"user_id\":24,\"status\":\"29\",\"doc_type\":\"11\",\"name\":\"J6nTA7ppUhDAiHoJJ2E2UAw4BFZYaWXw86DA0OwV.pdf\",\"org_name\":\"pdf-sample.pdf\",\"path\":\"uploads\\/files\\/05-2023\\/J6nTA7ppUhDAiHoJJ2E2UAw4BFZYaWXw86DA0OwV.pdf\",\"ext\":\"pdf\",\"size\":\"7.76 KB\",\"id\":17}', 'http://127.0.0.1:8000/post-file', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:35:40', '2023-05-01 15:35:40'),
(144, 'App\\Models\\User', 25, 'created', 'App\\Models\\File', 18, '[]', '{\"practice_id\":9,\"user_id\":25,\"status\":\"28\",\"doc_type\":\"11\",\"name\":\"i1enFNCDcJONPZVwrI9V63hnJc5djXfyVfR3Hcx2.pdf\",\"org_name\":\"sample.pdf\",\"path\":\"uploads\\/files\\/05-2023\\/i1enFNCDcJONPZVwrI9V63hnJc5djXfyVfR3Hcx2.pdf\",\"ext\":\"pdf\",\"size\":\"2.96 KB\",\"id\":18}', 'http://127.0.0.1:8000/post-file', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 15:43:34', '2023-05-01 15:43:34'),
(145, 'App\\Models\\User', 23, 'created', 'App\\Models\\Practice', 10, '[]', '{\"company_id\":10,\"status\":\"39\",\"reason\":null,\"date\":null,\"name\":\"Demo Practice 2\",\"speciality\":\"HOME HEALTH CARE AGENCY,CHIROPRACTOR,COUNSELOR\",\"avg_charges\":\"100\",\"group_npi\":\"1013403427\",\"group_ptan\":\"0497713\",\"tax_id\":\"32432\",\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"dmail_emails\":null,\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null}]\",\"claim_creation_frequency\":\"{\\\"option\\\":null,\\\"value\\\":null}\",\"bellmedex_services\":\"{\\\"credentialing\\\":0,\\\"coding\\\":0,\\\"phd\\\":0,\\\"billing\\\":0,\\\"eligibility_check\\\":0,\\\"authorization\\\":0,\\\"patient_statement\\\":0,\\\"ar\\\":0,\\\"ar_start\\\":null,\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":0,\\\"orientation_datetime\\\":null,\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":null}\",\"operations\":\"{\\\"logins_receipt\\\":0,\\\"login_date\\\":null,\\\"sop_preparation\\\":0,\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_eligibility_cal_checkbox\\\":0,\\\"thresh_eligibility\\\":null,\\\"thresh_charge_manual_checkbox\\\":0,\\\"thresh_charge_with_demo_graphics_checkbox\\\":0,\\\"thresh_charge_entry\\\":null,\\\"thresh_posting_manual_checkbox\\\":0,\\\"thresh_posting\\\":null,\\\"thresh_eligibility_portal_checkbox\\\":0,\\\"thresh_portal\\\":null,\\\"thresh_charge_elect_checkbox\\\":0,\\\"thresh_elect\\\":null,\\\"thresh_posting_elect_checkbox\\\":0,\\\"thresh_posting_elect\\\":null,\\\"thresh_auth\\\":null,\\\"thresh_rejections\\\":null,\\\"thresh_denials\\\":null}\",\"thresh_payer\":\"[{\\\"name\\\":null,\\\"claims\\\":null}]\",\"id\":10}', 'http://127.0.0.1:8000/post-practice', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 16:09:18', '2023-05-01 16:09:18'),
(146, 'App\\Models\\User', 23, 'created', 'App\\Models\\User', 26, '[]', '{\"firstname\":\"Demo 2\",\"lastname\":\"Client\",\"email\":\"demo2@apple.com\",\"username\":\"demo2@apple.com\",\"company_id\":10,\"password\":\"$2y$10$Optrhh1KrCJagFHBwVzQ3uM6IyjXCi9GXZRl.fMRpfqryANmMQEzG\",\"type\":3,\"timezone\":\"7\",\"status\":\"37\",\"id\":26}', 'http://127.0.0.1:8000/post-client', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 16:10:43', '2023-05-01 16:10:43'),
(147, 'App\\Models\\User', 23, 'created', 'App\\Models\\User', 27, '[]', '{\"company_id\":10,\"firstname\":\"User2\",\"lastname\":\"name\",\"psudo_name\":\"User2Psudo\",\"employee_id\":\"1102\",\"email\":\"user2@apple.com\",\"username\":\"user2@apple.com\",\"password\":\"$2y$10$501860a92LpWtZx48ggIWeFJh.RkGe2PTzDquZMgplfrd4xbP\\/La6\",\"type\":2,\"timezone\":\"0\",\"status\":\"35\",\"designation_id\":\"13\",\"id\":27}', 'http://127.0.0.1:8000/post-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 16:13:47', '2023-05-01 16:13:47'),
(148, 'App\\Models\\User', 27, 'created', 'App\\Models\\File', 19, '[]', '{\"practice_id\":10,\"user_id\":27,\"status\":\"28\",\"doc_type\":\"12\",\"name\":\"oNy91ltZsXsHB8IuXBWX8DQtULq5GAqF79XBOMWi.pdf\",\"org_name\":\"sample.pdf\",\"path\":\"uploads\\/files\\/05-2023\\/oNy91ltZsXsHB8IuXBWX8DQtULq5GAqF79XBOMWi.pdf\",\"ext\":\"pdf\",\"size\":\"2.96 KB\",\"id\":19}', 'http://127.0.0.1:8000/post-file', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 16:16:37', '2023-05-01 16:16:37'),
(149, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"Sn86y6XERNVUWz7DDArjuJdnVFW84w2lnVYZr5aW1O53kKBW6ELG2luWmfAz\"}', '{\"remember_token\":\"3iy3SB6wnFEDeSKeDJ9g92PtZoL4QESlWaeOl57yRdwOOsBwNuV6gerc4Nrh\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 16:18:06', '2023-05-01 16:18:06'),
(150, 'App\\Models\\User', 24, 'created', 'App\\Models\\File', 20, '[]', '{\"practice_id\":9,\"user_id\":24,\"status\":\"28\",\"doc_type\":\"13\",\"name\":\"90kj3M4TfTfEVVE2el2EvliTbiaOySq9NFl6gUwh.docx\",\"org_name\":\"testdoc.docx\",\"path\":\"uploads\\/files\\/05-2023\\/90kj3M4TfTfEVVE2el2EvliTbiaOySq9NFl6gUwh.docx\",\"ext\":\"docx\",\"size\":\"10.97 KB\",\"id\":20}', 'http://127.0.0.1:8000/post-file', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 16:25:14', '2023-05-01 16:25:14'),
(151, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"3iy3SB6wnFEDeSKeDJ9g92PtZoL4QESlWaeOl57yRdwOOsBwNuV6gerc4Nrh\"}', '{\"remember_token\":\"yYUku8idJQVdnbqUL6yvffiiSQ0f0woh51rQWn9IGcGzaxFHQ4QkkZOuOfX4\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-01 16:32:19', '2023-05-01 16:32:19'),
(152, 'App\\Models\\User', 10, 'created', 'App\\Models\\Company', 11, '[]', '{\"name\":\"BPOLOGIC\",\"prefix\":\"bpo\",\"id\":11}', 'http://localhost:8000/post-company', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 10:54:19', '2023-05-04 10:54:19'),
(153, 'App\\Models\\User', 10, 'created', 'App\\Models\\User', 28, '[]', '{\"company_id\":11,\"firstname\":\"Super\",\"lastname\":\"Admin\",\"email\":\"superadmin11@bpo.com\",\"username\":\"superadmin11\",\"timezone\":0,\"password\":\"$2y$10$fnnYzPLVySBJZJBVaMp03u04eeqLDbmjwcPrS1L.RnDyUTGuN8epS\",\"id\":28}', 'http://localhost:8000/post-company', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 10:54:19', '2023-05-04 10:54:19'),
(154, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"yYUku8idJQVdnbqUL6yvffiiSQ0f0woh51rQWn9IGcGzaxFHQ4QkkZOuOfX4\"}', '{\"remember_token\":\"fbNIG0DXpjsXRNEwbFDAQxynp8y8uydRVL4vNPdCRnS1l50zwfTBlE9T65j9\"}', 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 10:54:44', '2023-05-04 10:54:44'),
(155, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 43, '[]', '{\"name\":\"Active\",\"type\":\"user\",\"company_id\":11,\"id\":43}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:08:52', '2023-05-04 11:08:52'),
(156, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 44, '[]', '{\"name\":\"Inactive\",\"type\":\"user\",\"company_id\":11,\"id\":44}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:09:07', '2023-05-04 11:09:07'),
(157, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 45, '[]', '{\"name\":\"On Notice Period\",\"type\":\"user\",\"company_id\":11,\"id\":45}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:09:37', '2023-05-04 11:09:37'),
(158, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 46, '[]', '{\"name\":\"To be posted\",\"type\":\"document\",\"company_id\":11,\"id\":46}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:09:49', '2023-05-04 11:09:49'),
(159, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 47, '[]', '{\"name\":\"Posted\",\"type\":\"document\",\"company_id\":11,\"id\":47}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:10:01', '2023-05-04 11:10:01'),
(160, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 48, '[]', '{\"name\":\"Pending\",\"type\":\"document\",\"company_id\":11,\"id\":48}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:10:13', '2023-05-04 11:10:13'),
(161, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 49, '[]', '{\"name\":\"Active\",\"type\":\"client\",\"company_id\":11,\"id\":49}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:10:24', '2023-05-04 11:10:24'),
(162, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 50, '[]', '{\"name\":\"Inactive\",\"type\":\"client\",\"company_id\":11,\"id\":50}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:10:34', '2023-05-04 11:10:34'),
(163, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 51, '[]', '{\"name\":\"Terminated\",\"type\":\"client\",\"company_id\":11,\"id\":51}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:10:44', '2023-05-04 11:10:44'),
(164, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 52, '[]', '{\"name\":\"Active\",\"type\":\"practice\",\"company_id\":11,\"id\":52}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:12:22', '2023-05-04 11:12:22'),
(165, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 53, '[]', '{\"name\":\"Open\",\"type\":\"ticket\",\"company_id\":11,\"id\":53}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:12:31', '2023-05-04 11:12:31'),
(166, 'App\\Models\\User', 28, 'created', 'App\\Models\\Status', 54, '[]', '{\"name\":\"Close\",\"type\":\"ticket\",\"company_id\":11,\"id\":54}', 'http://localhost:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:12:40', '2023-05-04 11:12:40'),
(167, 'App\\Models\\User', 28, 'created', 'App\\Models\\Practice', 11, '[]', '{\"company_id\":11,\"status\":\"52\",\"reason\":null,\"date\":null,\"name\":\"All 4 one\",\"speciality\":\"COUNSELOR,NURSING HOME\",\"avg_charges\":\"50000\",\"group_npi\":\"1013403427\",\"group_ptan\":\"MZ610\",\"tax_id\":\"32432\",\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"dmail_emails\":null,\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null}]\",\"claim_creation_frequency\":\"{\\\"option\\\":null,\\\"value\\\":null}\",\"bellmedex_services\":\"{\\\"credentialing\\\":0,\\\"coding\\\":0,\\\"phd\\\":0,\\\"billing\\\":0,\\\"eligibility_check\\\":0,\\\"authorization\\\":0,\\\"patient_statement\\\":0,\\\"ar\\\":0,\\\"ar_start\\\":null,\\\"key_billing_issues\\\":null,\\\"complementary_services\\\":null,\\\"special_instructions\\\":null}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":0,\\\"orientation_datetime\\\":null,\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":null}\",\"operations\":\"{\\\"logins_receipt\\\":0,\\\"login_date\\\":null,\\\"sop_preparation\\\":0,\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_eligibility_cal_checkbox\\\":0,\\\"thresh_eligibility\\\":null,\\\"thresh_charge_manual_checkbox\\\":0,\\\"thresh_charge_with_demo_graphics_checkbox\\\":0,\\\"thresh_charge_entry\\\":null,\\\"thresh_posting_manual_checkbox\\\":0,\\\"thresh_posting\\\":null,\\\"thresh_eligibility_portal_checkbox\\\":0,\\\"thresh_portal\\\":null,\\\"thresh_charge_elect_checkbox\\\":0,\\\"thresh_elect\\\":null,\\\"thresh_posting_elect_checkbox\\\":0,\\\"thresh_posting_elect\\\":null,\\\"thresh_auth\\\":null,\\\"thresh_rejections\\\":null,\\\"thresh_denials\\\":null}\",\"thresh_payer\":\"[{\\\"name\\\":null,\\\"claims\\\":null}]\",\"id\":11}', 'http://localhost:8000/post-practice', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:14:54', '2023-05-04 11:14:54'),
(168, 'App\\Models\\User', 28, 'created', 'App\\Models\\User', 29, '[]', '{\"firstname\":\"Danny\",\"lastname\":\"Smith\",\"email\":\"danny@example.com\",\"username\":\"danny@example.com\",\"company_id\":11,\"password\":\"$2y$10$isq28PEaA2cn3Cfs7i\\/RLuuUwVx61gjxZlr.\\/1idGiSAw30sFuoqu\",\"type\":3,\"timezone\":\"7\",\"status\":\"49\",\"id\":29}', 'http://localhost:8000/post-client', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:20:00', '2023-05-04 11:20:00'),
(169, 'App\\Models\\User', 28, 'created', 'App\\Models\\Department', 14, '[]', '{\"name\":\"CRM\",\"parent_id\":\"0\",\"company_id\":11,\"id\":14}', 'http://localhost:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:21:35', '2023-05-04 11:21:35'),
(170, 'App\\Models\\User', 28, 'created', 'App\\Models\\Department', 15, '[]', '{\"name\":\"Operations\",\"parent_id\":\"0\",\"company_id\":11,\"id\":15}', 'http://localhost:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:22:03', '2023-05-04 11:22:03'),
(171, 'App\\Models\\User', 28, 'created', 'App\\Models\\Department', 16, '[]', '{\"name\":\"Claim Submission\",\"parent_id\":\"15\",\"company_id\":11,\"id\":16}', 'http://localhost:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:22:24', '2023-05-04 11:22:24'),
(172, 'App\\Models\\User', 28, 'created', 'App\\Models\\Department', 17, '[]', '{\"name\":\"Payment Posting\",\"parent_id\":\"15\",\"company_id\":11,\"id\":17}', 'http://localhost:8000/post-department', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:22:37', '2023-05-04 11:22:37'),
(173, 'App\\Models\\User', 28, 'created', 'App\\Models\\DocumentType', 16, '[]', '{\"name\":\"Super Bill\",\"company_id\":11,\"id\":16}', 'http://localhost:8000/document_types', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:24:44', '2023-05-04 11:24:44'),
(174, 'App\\Models\\User', 28, 'created', 'App\\Models\\DocumentType', 17, '[]', '{\"name\":\"Medical Notes\",\"company_id\":11,\"id\":17}', 'http://localhost:8000/document_types', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:25:49', '2023-05-04 11:25:49'),
(175, 'App\\Models\\User', 28, 'created', 'App\\Models\\Designation', 16, '[]', '{\"name\":\"Director\",\"company_id\":11,\"id\":16}', 'http://localhost:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:34:10', '2023-05-04 11:34:10'),
(176, 'App\\Models\\User', 28, 'created', 'App\\Models\\Designation', 17, '[]', '{\"name\":\"SMO\",\"company_id\":11,\"id\":17}', 'http://localhost:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:34:25', '2023-05-04 11:34:25'),
(177, 'App\\Models\\User', 28, 'created', 'App\\Models\\Designation', 18, '[]', '{\"name\":\"MO\",\"company_id\":11,\"id\":18}', 'http://localhost:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:34:34', '2023-05-04 11:34:34'),
(178, 'App\\Models\\User', 28, 'created', 'App\\Models\\Designation', 19, '[]', '{\"name\":\"AMO\",\"company_id\":11,\"id\":19}', 'http://localhost:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:34:50', '2023-05-04 11:34:50'),
(179, 'App\\Models\\User', 28, 'created', 'App\\Models\\Designation', 20, '[]', '{\"name\":\"GM\",\"company_id\":11,\"id\":20}', 'http://localhost:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:35:23', '2023-05-04 11:35:23'),
(180, 'App\\Models\\User', 28, 'created', 'App\\Models\\Designation', 21, '[]', '{\"name\":\"CEO\",\"company_id\":11,\"id\":21}', 'http://localhost:8000/designations', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:35:33', '2023-05-04 11:35:33'),
(181, 'App\\Models\\User', 28, 'created', 'App\\Models\\User', 30, '[]', '{\"company_id\":11,\"firstname\":\"Maria\",\"lastname\":\"Smith\",\"psudo_name\":\"Maria Smith\",\"employee_id\":\"1976\",\"email\":\"maria@bellmedex.com\",\"username\":\"maria@bellmedex.com\",\"password\":\"$2y$10$ovgTdi6AW7.4kA8g.oyUO.QH3l8zRMv70yz0fVF0fUqt17bRXRL42\",\"type\":2,\"timezone\":\"0\",\"status\":\"43\",\"designation_id\":\"16\",\"id\":30}', 'http://localhost:8000/post-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-04 11:36:58', '2023-05-04 11:36:58'),
(182, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"fbNIG0DXpjsXRNEwbFDAQxynp8y8uydRVL4vNPdCRnS1l50zwfTBlE9T65j9\"}', '{\"remember_token\":\"7wKkudlvG2yULArH2j0JQvXoXrpTewnxWv5wx7dBWxLRUvH8SdXZBP71lIV1\"}', 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-05 12:21:22', '2023-05-05 12:21:22'),
(183, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Practice', 4, '{\"physical_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}, {\\\"zip\\\": \\\"3213\\\", \\\"city\\\": \\\"1232133\\\", \\\"state\\\": \\\"123213\\\", \\\"address\\\": \\\"asdsad\\\"}]\",\"mailing_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}, {\\\"zip\\\": \\\"123213\\\", \\\"city\\\": \\\"3213213\\\", \\\"state\\\": \\\"asdsad\\\", \\\"address\\\": \\\"123213\\\"}]\",\"location_address\":\"[{\\\"zip\\\": null, \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}, {\\\"zip\\\": \\\"123\\\", \\\"city\\\": null, \\\"state\\\": null, \\\"address\\\": null}]\",\"focal_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}, {\\\"fax\\\": \\\"12345\\\", \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"designation\\\": null}]\",\"owner_info\":\"[{\\\"fax\\\": null, \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}, {\\\"fax\\\": \\\"1234\\\", \\\"name\\\": null, \\\"email\\\": null, \\\"phone\\\": null, \\\"title\\\": null}]\",\"provider_information\":\"[{\\\"dob\\\": null, \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}, {\\\"dob\\\": \\\"1997-04-02\\\", \\\"ssn\\\": null, \\\"name\\\": null, \\\"tax_id\\\": null, \\\"individual_npi\\\": null, \\\"individual_ptan\\\": null}]\",\"caqh\":\"{\\\"url\\\": null, \\\"name\\\": \\\"dsadsad\\\", \\\"password\\\": null, \\\"username\\\": null}\",\"clearinghouse\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"ehr\":\"{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}\",\"management_software\":\"[{\\\"url\\\": null, \\\"name\\\": null, \\\"password\\\": null, \\\"username\\\": null}]\",\"payers_info\":\"[{\\\"npi\\\": null, \\\"payer_name\\\": null, \\\"enroll_type\\\": null, \\\"enroll_with\\\": null, \\\"provider_name\\\": null, \\\"effective_date\\\": null}]\",\"claim_creation_frequency\":\"{\\\"value\\\": null, \\\"option\\\": null}\",\"bellmedex_services\":\"{\\\"ar\\\": \\\"1\\\", \\\"phd\\\": \\\"1\\\", \\\"coding\\\": \\\"1\\\", \\\"billing\\\": \\\"1\\\", \\\"ar_start\\\": \\\"2022-04-03\\\", \\\"authorization\\\": \\\"1\\\", \\\"credentialing\\\": \\\"1\\\", \\\"eligibility_check\\\": \\\"1\\\", \\\"patient_statement\\\": \\\"1\\\", \\\"key_billing_issues\\\": \\\"issue\\\", \\\"special_instructions\\\": \\\"ins\\\", \\\"complementary_services\\\": \\\"ser\\\"}\",\"crm\":\"{\\\"welcome_email\\\": null, \\\"orientation_by\\\": null, \\\"mom_sharing_date\\\": null, \\\"docuhub_orientation\\\": \\\"0\\\", \\\"attended_by_crm_team\\\": null, \\\"orientation_datetime\\\": null, \\\"onboarding_metting_date\\\": null}\",\"operations\":\"{\\\"login_date\\\": null, \\\"logins_receipt\\\": \\\"0\\\", \\\"sop_preparation\\\": \\\"0\\\", \\\"preparation_date\\\": null, \\\"first_billing_received\\\": null, \\\"first_service_provided_name\\\": null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_auth\\\": null, \\\"thresh_elect\\\": null, \\\"thresh_portal\\\": null, \\\"thresh_denials\\\": null, \\\"thresh_posting\\\": null, \\\"thresh_rejections\\\": null, \\\"thresh_eligibility\\\": null, \\\"thresh_charge_entry\\\": null, \\\"thresh_posting_elect\\\": null, \\\"thresh_charge_elect_checkbox\\\": \\\"1\\\", \\\"thresh_charge_manual_checkbox\\\": \\\"1\\\", \\\"thresh_posting_elect_checkbox\\\": \\\"1\\\", \\\"thresh_posting_manual_checkbox\\\": \\\"1\\\", \\\"thresh_eligibility_cal_checkbox\\\": \\\"1\\\", \\\"thresh_eligibility_portal_checkbox\\\": \\\"1\\\", \\\"thresh_charge_with_demo_graphics_checkbox\\\": \\\"1\\\"}\",\"thresh_payer\":\"[{\\\"name\\\": null, \\\"claims\\\": null}, {\\\"name\\\": \\\"sadasdsad\\\", \\\"claims\\\": null}]\"}', '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null},{\\\"address\\\":\\\"asdsad\\\",\\\"zip\\\":\\\"3213\\\",\\\"state\\\":\\\"123213\\\",\\\"city\\\":\\\"1232133\\\"},{\\\"address\\\":\\\"aaaaaaaaa\\\",\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\",\"mailing_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null},{\\\"address\\\":\\\"123213\\\",\\\"zip\\\":\\\"123213\\\",\\\"state\\\":\\\"asdsad\\\",\\\"city\\\":\\\"3213213\\\"}]\",\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null},{\\\"address\\\":null,\\\"zip\\\":\\\"123\\\",\\\"state\\\":null,\\\"city\\\":null}]\",\"focal_info\":\"[{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":null,\\\"name\\\":null,\\\"phone\\\":null},{\\\"designation\\\":null,\\\"email\\\":null,\\\"fax\\\":\\\"12345\\\",\\\"name\\\":null,\\\"phone\\\":null}]\",\"owner_info\":\"[{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":null,\\\"email\\\":null,\\\"phone\\\":null},{\\\"title\\\":null,\\\"name\\\":null,\\\"fax\\\":\\\"1234\\\",\\\"email\\\":null,\\\"phone\\\":null}]\",\"provider_information\":\"[{\\\"dob\\\":null,\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null},{\\\"dob\\\":\\\"1997-04-02\\\",\\\"individual_npi\\\":null,\\\"individual_ptan\\\":null,\\\"name\\\":null,\\\"ssn\\\":null,\\\"tax_id\\\":null}]\",\"caqh\":\"{\\\"name\\\":\\\"dsadsad\\\",\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"clearinghouse\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"ehr\":\"{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}\",\"management_software\":\"[{\\\"name\\\":null,\\\"url\\\":null,\\\"username\\\":null,\\\"password\\\":null}]\",\"payers_info\":\"[{\\\"payer_name\\\":null,\\\"provider_name\\\":null,\\\"npi\\\":null,\\\"enroll_type\\\":null,\\\"enroll_with\\\":null,\\\"effective_date\\\":null}]\",\"claim_creation_frequency\":\"{\\\"option\\\":null,\\\"value\\\":null}\",\"bellmedex_services\":\"{\\\"credentialing\\\":\\\"1\\\",\\\"coding\\\":\\\"1\\\",\\\"phd\\\":\\\"1\\\",\\\"billing\\\":\\\"1\\\",\\\"eligibility_check\\\":\\\"1\\\",\\\"authorization\\\":\\\"1\\\",\\\"patient_statement\\\":\\\"1\\\",\\\"ar\\\":\\\"1\\\",\\\"ar_start\\\":\\\"2022-04-03\\\",\\\"key_billing_issues\\\":\\\"issue\\\",\\\"complementary_services\\\":\\\"ser\\\",\\\"special_instructions\\\":\\\"ins\\\"}\",\"crm\":\"{\\\"welcome_email\\\":null,\\\"onboarding_metting_date\\\":null,\\\"attended_by_crm_team\\\":null,\\\"docuhub_orientation\\\":\\\"0\\\",\\\"orientation_datetime\\\":null,\\\"orientation_by\\\":null,\\\"mom_sharing_date\\\":null}\",\"operations\":\"{\\\"logins_receipt\\\":\\\"0\\\",\\\"login_date\\\":null,\\\"sop_preparation\\\":\\\"0\\\",\\\"first_service_provided_name\\\":null,\\\"preparation_date\\\":null,\\\"first_billing_received\\\":null}\",\"practice_threshold_per_hour\":\"{\\\"thresh_eligibility_cal_checkbox\\\":\\\"1\\\",\\\"thresh_eligibility\\\":null,\\\"thresh_charge_manual_checkbox\\\":\\\"1\\\",\\\"thresh_charge_with_demo_graphics_checkbox\\\":\\\"1\\\",\\\"thresh_charge_entry\\\":null,\\\"thresh_posting_manual_checkbox\\\":\\\"1\\\",\\\"thresh_posting\\\":null,\\\"thresh_eligibility_portal_checkbox\\\":\\\"1\\\",\\\"thresh_portal\\\":null,\\\"thresh_charge_elect_checkbox\\\":\\\"1\\\",\\\"thresh_elect\\\":null,\\\"thresh_posting_elect_checkbox\\\":\\\"1\\\",\\\"thresh_posting_elect\\\":null,\\\"thresh_auth\\\":null,\\\"thresh_rejections\\\":null,\\\"thresh_denials\\\":null}\",\"thresh_payer\":\"[{\\\"name\\\":null,\\\"claims\\\":null},{\\\"name\\\":\\\"sadasdsad\\\",\\\"claims\\\":null}]\"}', 'http://localhost:8000/update-practice/eyJpdiI6Imlabi9IaERSQWFPS2I3QXJsMHVpNkE9PSIsInZhbHVlIjoiV0tlUGRGOFpya3g4OHQ0Tmdycmo4QT09IiwibWFjIjoiODg1ZjNkZjBjNmM0YWNmZmM3NWYzMDJlNzI2ZWFiMDk5MmQ5NDkzZGYxMTczNWNhMGU3NGVkZWE2Y2RiMTE2MyIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-05 12:27:31', '2023-05-05 12:27:31'),
(184, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Practice', 4, '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null},{\\\"address\\\":\\\"asdsad\\\",\\\"zip\\\":\\\"3213\\\",\\\"state\\\":\\\"123213\\\",\\\"city\\\":\\\"1232133\\\"},{\\\"address\\\":\\\"aaaaaaaaa\\\",\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\"}', '{\"physical_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null},{\\\"address\\\":\\\"asdsad\\\",\\\"zip\\\":\\\"3213\\\",\\\"state\\\":\\\"123213\\\",\\\"city\\\":\\\"1232133\\\"}]\"}', 'http://localhost:8000/update-practice/eyJpdiI6IktWQkJBUEZYdE9JaEZ3S0xETlB3VUE9PSIsInZhbHVlIjoiZlBuRUdaU2l1SWRnenZqV0xubk9qQT09IiwibWFjIjoiM2ZkMzc3NTM0MmZhZGYzNjBmMGI0NWMwYTA5Njk3MzE0NmY5MTE1NDY3MjkwZjE4NTAzMGE4MjQ5MTk5ODM2YyIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-05 12:28:11', '2023-05-05 12:28:11'),
(185, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Practice', 4, '{\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null},{\\\"address\\\":null,\\\"zip\\\":\\\"123\\\",\\\"state\\\":null,\\\"city\\\":null}]\"}', '{\"location_address\":\"[{\\\"address\\\":null,\\\"zip\\\":null,\\\"state\\\":null,\\\"city\\\":null}]\"}', 'http://localhost:8000/update-practice/eyJpdiI6ImcwVEhWcy9oa1djdk5ncEdpcno5SkE9PSIsInZhbHVlIjoiRStmcml0RVpmNFdaN2EvaGpjWGNYUT09IiwibWFjIjoiOWMwNmY4NWMzM2Q0NzVhNjI2YmYwOTkyNTQ3NmIxMzYxNDI1ZDE3NTQzMjk4OGVmMzQzNWE1NjM0YmVlMzliZiIsInRhZyI6IiJ9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-05 12:28:33', '2023-05-05 12:28:33'),
(186, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"7wKkudlvG2yULArH2j0JQvXoXrpTewnxWv5wx7dBWxLRUvH8SdXZBP71lIV1\"}', '{\"remember_token\":\"n5rORuX4FaKoTonoyotzbeSgLm3mwjBClN3Nxyld1BZQhWqe0B1HsLy56PDG\"}', 'http://localhost:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 12:46:17', '2023-05-08 12:46:17'),
(187, 'App\\Models\\User', 24, 'created', 'App\\Models\\Ticket', 25, '[]', '{\"company_id\":10,\"user_id\":24,\"user_type\":2,\"department_id\":\"11\",\"target_id\":\"9\",\"team_id\":0,\"type\":\"Query\",\"priority\":\"High\",\"subject\":\"Ticket created by user to client Demo Practice\",\"message\":\"<p>This is a test message<\\/p>\",\"creator\":\"Apple\",\"is_external\":\"1\",\"id\":25}', 'http://localhost:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:16:26', '2023-05-08 14:16:26'),
(188, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketAttachment', 11, '[]', '{\"ticket_id\":25,\"reply_id\":0,\"type\":0,\"name\":\"kaJbhB0dbcqmnugtkSQvNSI5cBqJ47UkegHnkIjo.pdf\",\"org_name\":\"sample.pdf\",\"path\":\"uploads\\/ticket_attachments\\/kaJbhB0dbcqmnugtkSQvNSI5cBqJ47UkegHnkIjo.pdf\",\"ext\":\"pdf\",\"size\":\"2.96 KB\",\"id\":11}', 'http://localhost:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:16:27', '2023-05-08 14:16:27'),
(189, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketLog', 7, '[]', '{\"ticket_id\":25,\"user_id\":25,\"seen\":0,\"id\":7}', 'http://localhost:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:16:27', '2023-05-08 14:16:27'),
(190, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketLog', 8, '[]', '{\"ticket_id\":25,\"user_id\":24,\"seen\":0,\"id\":8}', 'http://localhost:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:16:27', '2023-05-08 14:16:27'),
(191, 'App\\Models\\User', 24, 'updated', 'App\\Models\\Ticket', 25, '{\"priority\":\"High\",\"response_at\":null,\"status\":0}', '{\"priority\":\"Low\",\"response_at\":\"2023-05-08 19:20:27\",\"status\":\"32\"}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:20:27', '2023-05-08 14:20:27'),
(192, 'App\\Models\\User', 24, 'updated', 'App\\Models\\Ticket', 25, '{\"message\":\"<p>This is a test message<\\/p>\"}', '{\"message\":\"<p>This is a test message updated<\\/p>\"}', 'http://localhost:8000/tickets/25', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:20:52', '2023-05-08 14:20:52'),
(193, 'App\\Models\\User', 24, 'updated', 'App\\Models\\Ticket', 25, '{\"response_at\":\"2023-05-08 19:20:27\"}', '{\"response_at\":\"2023-05-08 19:30:37\"}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:30:37', '2023-05-08 14:30:37'),
(194, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketReply', 19, '[]', '{\"ticket_id\":\"25\",\"user_id\":24,\"creator_name\":\"Mazhar Aftab\",\"message\":\"<p>Replied by user<\\/p>\",\"is_refered\":0,\"id\":19}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:30:37', '2023-05-08 14:30:37'),
(195, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketAttachment', 12, '[]', '{\"ticket_id\":\"25\",\"reply_id\":19,\"type\":1,\"name\":\"lTK2IpoDA3WApfl1fYpQovsSycJOKlHyBCUAW4c7.pdf\",\"org_name\":\"sample.pdf\",\"path\":\"uploads\\/ticket_attachments\\/lTK2IpoDA3WApfl1fYpQovsSycJOKlHyBCUAW4c7.pdf\",\"ext\":\"pdf\",\"size\":\"2.96 KB\",\"id\":12}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:30:37', '2023-05-08 14:30:37'),
(196, 'App\\Models\\User', 24, 'updated', 'App\\Models\\Ticket', 25, '{\"response_at\":\"2023-05-08 19:30:37\"}', '{\"response_at\":\"2023-05-08 19:31:09\"}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:31:09', '2023-05-08 14:31:09'),
(197, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketReply', 20, '[]', '{\"ticket_id\":\"25\",\"user_id\":24,\"creator_name\":\"Mazhar Aftab\",\"message\":\"<p>Reply 2 by user<\\/p>\",\"is_refered\":0,\"id\":20}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:31:09', '2023-05-08 14:31:09'),
(198, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketAttachment', 13, '[]', '{\"ticket_id\":\"25\",\"reply_id\":20,\"type\":1,\"name\":\"Lmg5oirpXwPA3ljJ2Pr2678GgkAdAZWPDdHU05ej.pdf\",\"org_name\":\"sample.pdf\",\"path\":\"uploads\\/ticket_attachments\\/Lmg5oirpXwPA3ljJ2Pr2678GgkAdAZWPDdHU05ej.pdf\",\"ext\":\"pdf\",\"size\":\"2.96 KB\",\"id\":13}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 14:31:09', '2023-05-08 14:31:09'),
(199, 'App\\Models\\User', 24, 'created', 'App\\Models\\Ticket', 26, '[]', '{\"company_id\":10,\"user_id\":24,\"user_type\":2,\"department_id\":\"11\",\"target_id\":\"9\",\"team_id\":0,\"type\":\"Other\",\"priority\":\"Medium\",\"subject\":\"Ticket created by User for Demo practice\",\"message\":\"<p>Testing message from user to demo practice<\\/p>\",\"creator\":\"Apple\",\"is_external\":\"1\",\"id\":26}', 'http://localhost:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 15:30:42', '2023-05-08 15:30:42'),
(200, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketAttachment', 14, '[]', '{\"ticket_id\":26,\"reply_id\":0,\"type\":0,\"name\":\"xNqsQgqCVnQoTffj6UG5LYbKknhkY5VpC4xx3TFE.pdf\",\"org_name\":\"sample.pdf\",\"path\":\"uploads\\/ticket_attachments\\/xNqsQgqCVnQoTffj6UG5LYbKknhkY5VpC4xx3TFE.pdf\",\"ext\":\"pdf\",\"size\":\"2.96 KB\",\"id\":14}', 'http://localhost:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 15:30:42', '2023-05-08 15:30:42');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(201, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketLog', 9, '[]', '{\"ticket_id\":26,\"user_id\":25,\"seen\":0,\"id\":9}', 'http://localhost:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 15:30:42', '2023-05-08 15:30:42'),
(202, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketLog', 10, '[]', '{\"ticket_id\":26,\"user_id\":24,\"seen\":0,\"id\":10}', 'http://localhost:8000/tickets', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 15:30:42', '2023-05-08 15:30:42'),
(203, 'App\\Models\\User', 24, 'updated', 'App\\Models\\Ticket', 26, '{\"response_at\":null,\"status\":0}', '{\"response_at\":\"2023-05-08 20:33:06\",\"status\":\"32\"}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 15:33:06', '2023-05-08 15:33:06'),
(204, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketReply', 21, '[]', '{\"ticket_id\":\"26\",\"user_id\":24,\"creator_name\":\"Mazhar Aftab\",\"message\":\"<p>Reply by user<\\/p>\",\"is_refered\":0,\"id\":21}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 15:33:06', '2023-05-08 15:33:06'),
(205, 'App\\Models\\User', 24, 'created', 'App\\Models\\TicketAttachment', 15, '[]', '{\"ticket_id\":\"26\",\"reply_id\":21,\"type\":1,\"name\":\"WUVuPKhZEnGTTqdycRbeLeBmaG6s88LBpRurd4KO.pdf\",\"org_name\":\"sample.pdf\",\"path\":\"uploads\\/ticket_attachments\\/WUVuPKhZEnGTTqdycRbeLeBmaG6s88LBpRurd4KO.pdf\",\"ext\":\"pdf\",\"size\":\"2.96 KB\",\"id\":15}', 'http://localhost:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 15:33:06', '2023-05-08 15:33:06'),
(206, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"n5rORuX4FaKoTonoyotzbeSgLm3mwjBClN3Nxyld1BZQhWqe0B1HsLy56PDG\"}', '{\"remember_token\":\"TwbGzSDSV5NZNhf2j0ck34f37DOUCDGtrwnnvCklpnBynIo39oIld81ak9Je\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-08 17:05:34', '2023-05-08 17:05:34'),
(207, 'App\\Models\\User', 15, 'deleted', 'App\\Models\\Ticket', 19, '{\"id\":19,\"company_id\":6,\"user_id\":15,\"user_type\":2,\"department_id\":4,\"target_id\":5,\"team_id\":3,\"type\":\"Info\\/Other\",\"priority\":\"Low\",\"subject\":\"Testing notification\",\"message\":\"<h2>What is Lorem Ipsum?<\\/h2>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\",\"creator\":\"New Test Company\",\"response_at\":\"2023-04-04 20:54:10\",\"status\":22,\"remarks\":\"Ticket Forward Remarks\",\"flag\":1,\"is_external\":1}', '[]', 'http://127.0.0.1:8000/tickets/19', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-09 13:18:14', '2023-05-09 13:18:14'),
(208, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 20, '{\"message\":\"<p>sdadsadsa<\\/p>\"}', '{\"message\":\"<p>this is test message.<\\/p>\"}', 'http://127.0.0.1:8000/update-ticket', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-09 15:08:29', '2023-05-09 15:08:29'),
(209, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Ticket', 24, '{\"response_at\":\"2023-04-05 15:06:17\"}', '{\"response_at\":\"2023-05-11 14:00:40\"}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-11 09:00:40', '2023-05-11 09:00:40'),
(210, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketReply', 22, '[]', '{\"ticket_id\":\"24\",\"user_id\":15,\"creator_name\":\"Asad Nazir\",\"message\":\"<p>test mesage<\\/p>\",\"is_refered\":0,\"id\":22}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-11 09:00:40', '2023-05-11 09:00:40'),
(211, 'App\\Models\\User', 15, 'created', 'App\\Models\\TicketAttachment', 16, '[]', '{\"ticket_id\":\"24\",\"reply_id\":22,\"type\":1,\"name\":\"oKKddtYr4yxexJBMjbhqYIRqpnXiTAUKWr3276Qx.xlsx\",\"org_name\":\"Sign off (3).xlsx\",\"path\":\"uploads\\/ticket_attachments\\/oKKddtYr4yxexJBMjbhqYIRqpnXiTAUKWr3276Qx.xlsx\",\"ext\":\"xlsx\",\"size\":\"23.41 KB\",\"id\":16}', 'http://127.0.0.1:8000/ticket_replies', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-11 09:00:40', '2023-05-11 09:00:40'),
(212, 'App\\Models\\User', 15, 'created', 'App\\Models\\File', 21, '[]', '{\"practice_id\":5,\"user_id\":15,\"status\":\"19\",\"doc_type\":\"3\",\"name\":\"gPoLY1BFNTk2sBqYzYETtHA3CvVkuywSEdQHKKy1.xlsx\",\"org_name\":\"Sign off (3).xlsx\",\"path\":\"uploads\\/files\\/05-2023\\/gPoLY1BFNTk2sBqYzYETtHA3CvVkuywSEdQHKKy1.xlsx\",\"ext\":\"xlsx\",\"size\":\"23.41 KB\",\"id\":21}', 'http://127.0.0.1:8000/post-file', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-11 14:55:41', '2023-05-11 14:55:41'),
(213, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"TwbGzSDSV5NZNhf2j0ck34f37DOUCDGtrwnnvCklpnBynIo39oIld81ak9Je\"}', '{\"remember_token\":\"R8CS6SI37KvFnnaEFwBnPTgwJCohmKIhI5Xun0ICtSBqfiJlrznldHHPMs8R\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-12 08:16:42', '2023-05-12 08:16:42'),
(214, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Status', 10, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-12 12:53:41', '2023-05-12 12:53:41'),
(215, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Status', 14, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-12 12:53:46', '2023-05-12 12:53:46'),
(216, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Status', 3, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-12 12:53:49', '2023-05-12 12:53:49'),
(217, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Status', 23, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-12 12:53:53', '2023-05-12 12:53:53'),
(218, 'App\\Models\\User', 15, 'updated', 'App\\Models\\Status', 2, '{\"default\":0}', '{\"default\":1}', 'http://127.0.0.1:8000/default-status', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-12 12:53:55', '2023-05-12 12:53:55'),
(219, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"R8CS6SI37KvFnnaEFwBnPTgwJCohmKIhI5Xun0ICtSBqfiJlrznldHHPMs8R\"}', '{\"remember_token\":\"SgTQUJ6GRTjPNTokqhjcGIUgBhmoqGLPCrussnFGmdl8ZKLSQjbl0n6j2Mck\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-15 09:46:42', '2023-05-15 09:46:42'),
(220, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"SgTQUJ6GRTjPNTokqhjcGIUgBhmoqGLPCrussnFGmdl8ZKLSQjbl0n6j2Mck\"}', '{\"remember_token\":\"umkSmzLoOGH4HpZkFOmvsNYLQheE9kNmmDDOJw8jUekhM7y1N43jCC431Zuc\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', NULL, '2023-05-15 10:08:14', '2023-05-15 10:08:14'),
(221, 'App\\Models\\User', 10, 'updated', 'App\\Models\\User', 10, '{\"remember_token\":\"umkSmzLoOGH4HpZkFOmvsNYLQheE9kNmmDDOJw8jUekhM7y1N43jCC431Zuc\"}', '{\"remember_token\":\"FyP1cCglCqasjcuhEpk4KcxQP7L4tjEp7i09NWuwilmURv3pNon8ACHsqPd4\"}', 'http://127.0.0.1:8000/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', NULL, '2023-05-15 11:08:32', '2023-05-15 11:08:32'),
(222, 'App\\Models\\User', 15, 'created', 'App\\Models\\Status', 55, '[]', '{\"name\":\"Closed\",\"type\":\"ticket\",\"company_id\":6,\"id\":55}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', NULL, '2023-05-15 12:34:43', '2023-05-15 12:34:43'),
(223, 'App\\Models\\User', 15, 'deleted', 'App\\Models\\Status', 55, '{\"id\":55,\"company_id\":6,\"name\":\"Closed\",\"type\":\"ticket\",\"default\":0}', '[]', 'http://127.0.0.1:8000/statuses/55', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', NULL, '2023-05-15 12:36:18', '2023-05-15 12:36:18'),
(224, 'App\\Models\\User', 15, 'created', 'App\\Models\\Status', 56, '[]', '{\"name\":\"Closed\",\"type\":\"ticket\",\"company_id\":6,\"id\":56}', 'http://127.0.0.1:8000/statuses', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', NULL, '2023-05-15 13:17:02', '2023-05-15 13:17:02'),
(225, 'App\\Models\\User', 15, 'created', 'App\\Models\\Setting', 3, '[]', '{\"company_id\":6,\"type\":\"ticket\",\"id\":3}', 'http://127.0.0.1:8000/settings', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', NULL, '2023-05-15 15:16:51', '2023-05-15 15:16:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `prefix`, `logo`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BellMedEx', 'bme', NULL, 1, '2023-01-04 17:26:24', '2023-02-17 21:32:39', NULL),
(4, 'Best Medical Billing', 'bmb', NULL, 1, '2023-01-19 18:39:09', '2023-02-17 21:33:35', NULL),
(5, 'Test', 'test', NULL, 1, '2023-01-22 17:33:56', '2023-02-17 21:33:20', NULL),
(6, 'New Test Company', 'new', NULL, 1, '2023-02-16 21:08:10', '2023-02-17 21:33:11', NULL),
(10, 'Apple', 'apple', NULL, 1, '2023-05-01 18:45:39', '2023-05-01 18:45:39', NULL),
(11, 'BPOLOGIC', 'bpo', NULL, 1, '2023-05-04 15:54:19', '2023-05-04 15:54:19', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

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
(9, 6, 0, 'Coding', NULL, 1, '2023-03-28 18:44:07', '2023-03-28 18:45:43', NULL),
(10, 10, 0, 'Medical Billing', NULL, 1, '2023-05-01 19:21:54', '2023-05-01 19:21:54', NULL),
(11, 10, 10, 'Claim Submission', NULL, 1, '2023-05-01 19:22:34', '2023-05-01 19:22:34', NULL),
(12, 10, 10, 'Payment Posting', NULL, 1, '2023-05-01 19:23:13', '2023-05-01 19:23:13', NULL),
(13, 10, 0, 'Sales', NULL, 1, '2023-05-01 19:23:58', '2023-05-01 19:23:58', NULL),
(14, 11, 0, 'CRM', NULL, 1, '2023-05-04 16:21:35', '2023-05-04 16:21:35', NULL),
(15, 11, 0, 'Operations', NULL, 1, '2023-05-04 16:22:03', '2023-05-04 16:22:03', NULL),
(16, 11, 15, 'Claim Submission', NULL, 1, '2023-05-04 16:22:24', '2023-05-04 16:22:24', NULL),
(17, 11, 15, 'Payment Posting', NULL, 1, '2023-05-04 16:22:37', '2023-05-04 16:22:37', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

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
(17, 18, 7, '2023-04-07 21:10:03', '2023-04-07 21:10:03'),
(18, 22, 5, '2023-04-26 18:13:18', '2023-04-26 18:13:18'),
(19, 21, 5, '2023-04-26 18:13:28', '2023-04-26 18:13:28'),
(20, 24, 11, '2023-05-02 01:02:36', '2023-05-02 01:02:36'),
(21, 24, 12, '2023-05-02 01:02:36', '2023-05-02 01:02:36'),
(22, 25, 11, '2023-05-02 01:17:37', '2023-05-02 01:17:37'),
(23, 25, 10, '2023-05-02 01:17:37', '2023-05-02 01:17:37'),
(24, 25, 12, '2023-05-02 01:17:37', '2023-05-02 01:17:37'),
(25, 25, 13, '2023-05-02 01:17:37', '2023-05-02 01:17:37'),
(26, 26, 11, '2023-05-02 02:11:21', '2023-05-02 02:11:21'),
(27, 26, 12, '2023-05-02 02:11:21', '2023-05-02 02:11:21'),
(28, 27, 11, '2023-05-02 02:14:03', '2023-05-02 02:14:03'),
(29, 27, 12, '2023-05-02 02:14:03', '2023-05-02 02:14:03'),
(30, 29, 16, '2023-05-04 21:23:46', '2023-05-04 21:23:46'),
(31, 29, 14, '2023-05-04 21:23:46', '2023-05-04 21:23:46'),
(32, 29, 15, '2023-05-04 21:23:46', '2023-05-04 21:23:46'),
(33, 29, 17, '2023-05-04 21:23:46', '2023-05-04 21:23:46'),
(34, 28, 16, '2023-05-04 21:27:10', '2023-05-04 21:27:10'),
(35, 28, 14, '2023-05-04 21:27:10', '2023-05-04 21:27:10'),
(36, 30, 16, '2023-05-04 21:37:19', '2023-05-04 21:37:19'),
(37, 30, 14, '2023-05-04 21:37:19', '2023-05-04 21:37:19'),
(38, 30, 15, '2023-05-04 21:37:19', '2023-05-04 21:37:19'),
(39, 30, 17, '2023-05-04 21:37:19', '2023-05-04 21:37:19'),
(40, 23, 11, '2023-05-09 01:42:43', '2023-05-09 01:42:43'),
(41, 23, 10, '2023-05-09 01:42:43', '2023-05-09 01:42:43'),
(42, 23, 12, '2023-05-09 01:42:43', '2023-05-09 01:42:43'),
(43, 23, 13, '2023-05-09 01:42:43', '2023-05-09 01:42:43');

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `company_id`, `name`, `rank`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 6, 'General Manager (GM)', 3, '2023-03-20 13:07:51', NULL, '2023-04-11 20:40:07'),
(2, 5, 'Director', NULL, '2023-03-20 13:15:33', NULL, '2023-04-03 18:51:25'),
(3, 6, 'Vice President (VP)', 2, '2023-03-20 13:15:51', NULL, '2023-05-15 16:50:53'),
(4, 6, 'Manager Operations (MO)', 5, '2023-03-20 13:16:37', NULL, '2023-04-11 20:39:46'),
(5, 6, 'Assistant Manager Operations (AMO)', 6, '2023-03-20 13:16:46', NULL, '2023-04-11 20:39:46'),
(6, 6, 'Senior Manager Operations (SMO)', 4, '2023-03-20 13:16:55', NULL, '2023-04-04 16:42:11'),
(7, 6, 'Director', 1, '2023-04-03 14:00:35', NULL, '2023-05-15 16:50:53'),
(8, 6, 'Senior Software Developer', 9, '2023-04-25 09:53:12', NULL, '2023-04-26 09:24:12'),
(9, 6, 'Team Lead', 7, '2023-04-26 09:22:52', NULL, '2023-04-26 14:22:58'),
(10, 6, 'Backup Team Lead', 8, '2023-04-26 09:23:27', NULL, '2023-04-26 14:23:31'),
(11, 6, 'Junior Software Developer', 10, '2023-04-26 09:24:51', NULL, '2023-04-26 14:24:55'),
(12, 10, 'SMO', 1, '2023-05-01 14:24:39', NULL, '2023-05-12 13:17:46'),
(13, 10, 'MO', 2, '2023-05-01 14:24:46', NULL, '2023-05-12 13:17:46'),
(14, 10, 'Sales Executive', 3, '2023-05-01 14:24:59', NULL, '2023-05-12 13:17:46'),
(15, 10, 'Billing Executive', 4, '2023-05-01 14:25:22', NULL, '2023-05-12 13:17:46'),
(16, 11, 'Director', 3, '2023-05-04 11:34:10', NULL, '2023-05-04 16:35:39'),
(17, 11, 'SMO', 4, '2023-05-04 11:34:25', NULL, '2023-05-04 16:35:39'),
(18, 11, 'MO', 5, '2023-05-04 11:34:34', NULL, '2023-05-04 16:35:39'),
(19, 11, 'AMO', 6, '2023-05-04 11:34:50', NULL, '2023-05-04 16:35:39'),
(20, 11, 'GM', 2, '2023-05-04 11:35:23', NULL, '2023-05-04 16:35:39'),
(21, 11, 'CEO', 1, '2023-05-04 11:35:33', NULL, '2023-05-04 16:35:39');

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

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
(9, 6, 'Other', '2023-03-20 16:44:14', '2023-03-28 15:06:50'),
(10, 10, 'Registration Form', '2023-05-01 14:26:26', '2023-05-01 14:26:26'),
(11, 10, 'Day Sheet', '2023-05-01 14:26:34', '2023-05-01 14:26:34'),
(12, 10, 'EOBs', '2023-05-01 14:26:51', '2023-05-01 14:26:51'),
(13, 10, 'Super Bill', '2023-05-01 14:27:07', '2023-05-01 14:27:07'),
(14, 10, 'Insurance Letters', '2023-05-01 14:27:54', '2023-05-01 14:27:54'),
(15, 10, 'Call Charges', '2023-05-01 14:28:03', '2023-05-01 14:28:03'),
(16, 11, 'Super Bill', '2023-05-04 11:24:44', '2023-05-04 11:24:44'),
(17, 11, 'Medical Notes', '2023-05-04 11:25:49', '2023-05-04 11:25:49');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

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
(8, 15, 4, '2023-04-06 22:07:00', '2023-04-06 22:07:00'),
(9, 24, 15, '2023-05-02 01:02:59', '2023-05-02 01:02:59'),
(10, 24, 11, '2023-05-02 01:02:59', '2023-05-02 01:02:59'),
(11, 24, 12, '2023-05-02 01:02:59', '2023-05-02 01:02:59'),
(12, 24, 14, '2023-05-02 01:02:59', '2023-05-02 01:02:59'),
(13, 24, 10, '2023-05-02 01:02:59', '2023-05-02 01:02:59'),
(14, 24, 13, '2023-05-02 01:02:59', '2023-05-02 01:02:59'),
(15, 25, 15, '2023-05-02 01:40:58', '2023-05-02 01:40:58'),
(16, 25, 11, '2023-05-02 01:40:58', '2023-05-02 01:40:58'),
(17, 25, 12, '2023-05-02 01:40:58', '2023-05-02 01:40:58'),
(18, 25, 14, '2023-05-02 01:40:58', '2023-05-02 01:40:58'),
(19, 25, 10, '2023-05-02 01:40:58', '2023-05-02 01:40:58'),
(20, 25, 13, '2023-05-02 01:40:58', '2023-05-02 01:40:58'),
(21, 26, 12, '2023-05-02 02:11:30', '2023-05-02 02:11:30'),
(22, 27, 12, '2023-05-02 02:14:15', '2023-05-02 02:14:15'),
(23, 29, 17, '2023-05-04 21:26:42', '2023-05-04 21:26:42'),
(24, 29, 16, '2023-05-04 21:26:42', '2023-05-04 21:26:42'),
(25, 28, 17, '2023-05-04 21:27:18', '2023-05-04 21:27:18'),
(26, 28, 16, '2023-05-04 21:27:18', '2023-05-04 21:27:18'),
(27, 30, 17, '2023-05-04 21:37:29', '2023-05-04 21:37:29'),
(28, 30, 16, '2023-05-04 21:37:29', '2023-05-04 21:37:29'),
(29, 26, 15, '2023-05-09 00:00:58', '2023-05-09 00:00:58'),
(30, 26, 11, '2023-05-09 00:00:58', '2023-05-09 00:00:58'),
(31, 26, 14, '2023-05-09 00:00:58', '2023-05-09 00:00:58'),
(32, 26, 10, '2023-05-09 00:00:58', '2023-05-09 00:00:58'),
(33, 26, 13, '2023-05-09 00:00:58', '2023-05-09 00:00:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

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
(15, 4, 15, 14, 'vvwGLaPpkKuEUuGrdjcqJAW6QvZ0g9NNf3ul7ZZt.pdf', 'Document.pdf', 'uploads/files/04-2023/vvwGLaPpkKuEUuGrdjcqJAW6QvZ0g9NNf3ul7ZZt.pdf', 'pdf', '13.62 KB', NULL, 8, '2023-04-04 19:50:14', NULL, '2023-04-04 19:50:14'),
(16, 9, 24, 29, 'JGhaY6ypWuZ7XUeBPpU0bKtbBy7ugnEymW5xvLuk.pdf', 'sample.pdf', 'uploads/files/05-2023/JGhaY6ypWuZ7XUeBPpU0bKtbBy7ugnEymW5xvLuk.pdf', 'pdf', '2.96 KB', NULL, 11, '2023-05-01 20:35:40', NULL, '2023-05-01 20:35:40'),
(17, 9, 24, 29, 'J6nTA7ppUhDAiHoJJ2E2UAw4BFZYaWXw86DA0OwV.pdf', 'pdf-sample.pdf', 'uploads/files/05-2023/J6nTA7ppUhDAiHoJJ2E2UAw4BFZYaWXw86DA0OwV.pdf', 'pdf', '7.76 KB', NULL, 11, '2023-05-01 20:35:40', NULL, '2023-05-01 20:35:40'),
(18, 9, 25, 28, 'i1enFNCDcJONPZVwrI9V63hnJc5djXfyVfR3Hcx2.pdf', 'sample.pdf', 'uploads/files/05-2023/i1enFNCDcJONPZVwrI9V63hnJc5djXfyVfR3Hcx2.pdf', 'pdf', '2.96 KB', NULL, 11, '2023-05-01 20:43:34', NULL, '2023-05-01 20:43:34'),
(19, 10, 27, 28, 'oNy91ltZsXsHB8IuXBWX8DQtULq5GAqF79XBOMWi.pdf', 'sample.pdf', 'uploads/files/05-2023/oNy91ltZsXsHB8IuXBWX8DQtULq5GAqF79XBOMWi.pdf', 'pdf', '2.96 KB', NULL, 12, '2023-05-01 21:16:37', NULL, '2023-05-01 21:16:37'),
(20, 9, 24, 28, '90kj3M4TfTfEVVE2el2EvliTbiaOySq9NFl6gUwh.docx', 'testdoc.docx', 'uploads/files/05-2023/90kj3M4TfTfEVVE2el2EvliTbiaOySq9NFl6gUwh.docx', 'docx', '10.97 KB', NULL, 13, '2023-05-01 21:25:14', NULL, '2023-05-01 21:25:14'),
(21, 5, 15, 19, 'gPoLY1BFNTk2sBqYzYETtHA3CvVkuywSEdQHKKy1.xlsx', 'Sign off (3).xlsx', 'uploads/files/05-2023/gPoLY1BFNTk2sBqYzYETtHA3CvVkuywSEdQHKKy1.xlsx', 'xlsx', '23.41 KB', NULL, 3, '2023-05-11 19:55:41', NULL, '2023-05-11 19:55:41');

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
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expired_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `company_id`, `user_id`, `provider_name`, `token`, `link`, `created_at`, `expired_at`, `updated_at`) VALUES
(1, 6, 6, 'Test Provider', '5dd0768dacfd73dcd198b755d1d48b88', 'http://127.0.0.1:8000/practice-info-form/5dd0768dacfd73dcd198b755d1d48b88', '2023-04-13 14:45:11', '2023-04-17 18:45:11', '2023-04-13 14:45:11'),
(2, 6, 6, 'Usman Ali', '74f37767246678ba0d36235fda96e320', 'http://127.0.0.1:8000/practice-info-form/74f37767246678ba0d36235fda96e320', '2023-04-13 15:43:59', '2023-04-16 19:43:59', '2023-04-13 15:43:59'),
(3, 6, 6, 'Test Provider 4', '439a695e31be0163c1ce54e30873c387', 'http://127.0.0.1:8000/practice-info-form/439a695e31be0163c1ce54e30873c387', '2023-04-14 08:11:22', '2023-04-17 18:11:22', '2023-04-14 08:11:22'),
(4, 6, 6, 'Director', 'ad0fdfdc01569b071cdf8815ccb7b647', 'http://127.0.0.1:8000/practice-info-form/ad0fdfdc01569b071cdf8815ccb7b647', '2023-04-14 12:25:11', '2023-04-17 17:25:11', '2023-04-14 12:25:11'),
(5, 6, 6, 'Test Provider 1234', '65e93691803dd9b7d94033c27ecedfe6', 'http://127.0.0.1:8000/practice-info-form/65e93691803dd9b7d94033c27ecedfe6', '2023-04-26 09:19:31', '2023-04-26 23:19:31', '2023-04-26 09:19:31'),
(6, 11, 11, 'Crystal Rainbow', '590469a72d58602874376984a76b8ef7', 'http://localhost:8000/practice-info-form/590469a72d58602874376984a76b8ef7', '2023-05-04 11:29:39', '2023-05-04 21:29:39', '2023-05-04 11:29:39');

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
(20, 'App\\Models\\User', 20),
(20, 'App\\Models\\User', 21),
(20, 'App\\Models\\User', 22),
(25, 'App\\Models\\User', 23),
(27, 'App\\Models\\User', 24),
(28, 'App\\Models\\User', 25),
(28, 'App\\Models\\User', 26),
(27, 'App\\Models\\User', 27),
(29, 'App\\Models\\User', 28),
(31, 'App\\Models\\User', 29),
(29, 'App\\Models\\User', 30),
(30, 'App\\Models\\User', 30),
(31, 'App\\Models\\User', 30);

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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(71, 'approve ticket', 'can approve ', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00'),
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
(106, 'create link', 'can create link', 'user', 'web', '2023-02-06 10:02:32', '2023-02-06 10:02:32'),
(107, 'set order designation', 'can set order', 'designation', 'web', '2023-01-19 11:21:41', '2023-01-19 11:21:41'),
(108, 'required review', 'can review', 'ticket', 'web', '2023-01-25 10:07:00', '2023-01-25 10:07:00');

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
  `physical_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `mailing_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `location_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dmail_emails` varchar(256) DEFAULT NULL,
  `focal_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `owner_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `provider_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `caqh` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `clearinghouse` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ehr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `management_software` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `payers_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `claim_creation_frequency` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `bellmedex_services` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `crm` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `operations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `practice_threshold_per_hour` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `thresh_payer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practices`
--

INSERT INTO `practices` (`id`, `company_id`, `link_id`, `name`, `status`, `reason`, `date`, `speciality`, `avg_charges`, `group_npi`, `group_ptan`, `tax_id`, `physical_address`, `mailing_address`, `location_address`, `dmail_emails`, `focal_info`, `owner_info`, `provider_information`, `caqh`, `clearinghouse`, `ehr`, `management_software`, `payers_info`, `claim_creation_frequency`, `bellmedex_services`, `crm`, `operations`, `practice_threshold_per_hour`, `thresh_payer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, NULL, 'test practice', 1, '', NULL, '', NULL, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 16:57:06', '2023-02-05 16:57:06', NULL),
(2, 1, NULL, 'bme pract', 1, '', NULL, '', 0, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 17:37:33', '2023-02-05 17:37:33', NULL),
(3, 1, NULL, 'bme test p', 1, '', NULL, '', 0, '', '', '', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"logins_receipt\": null, \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-02-05 17:38:27', '2023-02-05 17:38:27', NULL),
(4, 6, NULL, 'New Practice 123', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null},{\"address\":\"asdsad\",\"zip\":\"3213\",\"state\":\"123213\",\"city\":\"1232133\"}]', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null},{\"address\":\"123213\",\"zip\":\"123213\",\"state\":\"asdsad\",\"city\":\"3213213\"}]', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null}]', NULL, '[{\"designation\":null,\"email\":null,\"fax\":null,\"name\":null,\"phone\":null},{\"designation\":null,\"email\":null,\"fax\":\"12345\",\"name\":null,\"phone\":null}]', '[{\"title\":null,\"name\":null,\"fax\":null,\"email\":null,\"phone\":null},{\"title\":null,\"name\":null,\"fax\":\"1234\",\"email\":null,\"phone\":null}]', '[{\"dob\":null,\"individual_npi\":null,\"individual_ptan\":null,\"name\":null,\"ssn\":null,\"tax_id\":null},{\"dob\":\"1997-04-02\",\"individual_npi\":null,\"individual_ptan\":null,\"name\":null,\"ssn\":null,\"tax_id\":null}]', '{\"name\":\"dsadsad\",\"url\":null,\"username\":null,\"password\":null}', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '[{\"name\":null,\"url\":null,\"username\":null,\"password\":null}]', '[{\"payer_name\":null,\"provider_name\":null,\"npi\":null,\"enroll_type\":null,\"enroll_with\":null,\"effective_date\":null}]', '{\"option\":null,\"value\":null}', '{\"credentialing\":\"1\",\"coding\":\"1\",\"phd\":\"1\",\"billing\":\"1\",\"eligibility_check\":\"1\",\"authorization\":\"1\",\"patient_statement\":\"1\",\"ar\":\"1\",\"ar_start\":\"2022-04-03\",\"key_billing_issues\":\"issue\",\"complementary_services\":\"ser\",\"special_instructions\":\"ins\"}', '{\"welcome_email\":null,\"onboarding_metting_date\":null,\"attended_by_crm_team\":null,\"docuhub_orientation\":\"0\",\"orientation_datetime\":null,\"orientation_by\":null,\"mom_sharing_date\":null}', '{\"logins_receipt\":\"0\",\"login_date\":null,\"sop_preparation\":\"0\",\"first_service_provided_name\":null,\"preparation_date\":null,\"first_billing_received\":null}', '{\"thresh_eligibility_cal_checkbox\":\"1\",\"thresh_eligibility\":null,\"thresh_charge_manual_checkbox\":\"1\",\"thresh_charge_with_demo_graphics_checkbox\":\"1\",\"thresh_charge_entry\":null,\"thresh_posting_manual_checkbox\":\"1\",\"thresh_posting\":null,\"thresh_eligibility_portal_checkbox\":\"1\",\"thresh_portal\":null,\"thresh_charge_elect_checkbox\":\"1\",\"thresh_elect\":null,\"thresh_posting_elect_checkbox\":\"1\",\"thresh_posting_elect\":null,\"thresh_auth\":null,\"thresh_rejections\":null,\"thresh_denials\":null}', '[{\"name\":null,\"claims\":null},{\"name\":\"sadasdsad\",\"claims\":null}]', '2023-02-16 21:12:26', '2023-05-05 17:28:33', NULL),
(5, 6, NULL, 'Practice ABC', 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": \"2023-03-08\", \"logins_receipt\": \"1\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}]', '2023-02-24 17:34:02', '2023-03-08 16:57:03', NULL),
(6, 6, NULL, 'Test ABC 123', 5, 'asdsadsad', NULL, NULL, NULL, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"3213\", \"city\": \"1232133\", \"state\": \"123213\", \"address\": \"asdsad\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123213\", \"city\": \"3213213\", \"state\": \"asdsad\", \"address\": \"123213\"}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}, {\"zip\": \"123\", \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}, {\"fax\": \"12345\", \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}, {\"fax\": \"1234\", \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}, {\"dob\": \"1997-04-02\", \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": \"dsadsad\", \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}, {\"npi\": null, \"payer_name\": null, \"enroll_type\": \"group\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2022-04-03\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": \"issue\", \"special_instructions\": \"ins\", \"complementary_services\": \"ser\"}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": null, \"logins_receipt\": \"0\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": \"2023-03-24\", \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": \"1\", \"thresh_charge_manual_checkbox\": \"1\", \"thresh_posting_elect_checkbox\": \"1\", \"thresh_posting_manual_checkbox\": \"1\", \"thresh_eligibility_cal_checkbox\": \"1\", \"thresh_eligibility_portal_checkbox\": \"1\", \"thresh_charge_with_demo_graphics_checkbox\": \"1\"}', '[{\"name\": null, \"claims\": null}, {\"name\": \"sadasdsad\", \"claims\": null}]', '2023-03-06 21:27:31', '2023-03-24 16:22:31', NULL),
(7, 6, NULL, 'Test ABC 123456', 6, NULL, NULL, NULL, 1500, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', NULL, '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}]', '{\"value\": null, \"option\": null}', '{\"ar\": 0, \"phd\": 0, \"coding\": 0, \"billing\": 0, \"ar_start\": null, \"authorization\": 0, \"credentialing\": 0, \"eligibility_check\": 0, \"patient_statement\": 0, \"key_billing_issues\": null, \"special_instructions\": null, \"complementary_services\": null}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": null, \"logins_receipt\": \"0\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": 0, \"thresh_charge_manual_checkbox\": 0, \"thresh_posting_elect_checkbox\": 0, \"thresh_posting_manual_checkbox\": 0, \"thresh_eligibility_cal_checkbox\": 0, \"thresh_eligibility_portal_checkbox\": 0, \"thresh_charge_with_demo_graphics_checkbox\": 0}', '[{\"name\": null, \"claims\": null}]', '2023-03-24 16:46:24', '2023-03-28 20:13:23', NULL),
(8, 6, 3, 'Test ABC by link', 7, NULL, NULL, 'COUNSELOR,HOME HEALTH CARE AGENCY,CHIROPRACTOR,GYNOCOLOGY', NULL, NULL, NULL, NULL, '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', '[{\"zip\": null, \"city\": null, \"state\": null, \"address\": null}]', 'asad.nazir@bellmedex.com,asad@bellmedex.com,shehbaz@bellmedex.com,abc@mail.com', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"designation\": null}]', '[{\"fax\": null, \"name\": null, \"email\": null, \"phone\": null, \"title\": null}]', '[{\"dob\": null, \"ssn\": null, \"name\": null, \"tax_id\": null, \"individual_npi\": null, \"individual_ptan\": null}]', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '{\"url\": null, \"name\": null, \"password\": null, \"username\": null}', '[{\"url\": null, \"name\": null, \"password\": null, \"username\": null}]', '[{\"npi\": null, \"payer_name\": null, \"enroll_type\": null, \"enroll_with\": null, \"provider_name\": null, \"effective_date\": null}, {\"npi\": null, \"payer_name\": null, \"enroll_type\": \"individual\", \"enroll_with\": \"tax_id\", \"provider_name\": null, \"effective_date\": \"2023-04-15\"}]', '{\"value\": null, \"option\": null}', '{\"ar\": \"1\", \"phd\": \"1\", \"coding\": \"1\", \"billing\": \"1\", \"ar_start\": \"2023-04-14\", \"authorization\": \"1\", \"credentialing\": \"1\", \"eligibility_check\": \"1\", \"patient_statement\": \"1\", \"key_billing_issues\": null, \"special_instructions\": null, \"complementary_services\": null}', '{\"welcome_email\": null, \"orientation_by\": null, \"mom_sharing_date\": null, \"docuhub_orientation\": \"0\", \"attended_by_crm_team\": null, \"orientation_datetime\": null, \"onboarding_metting_date\": null}', '{\"login_date\": null, \"logins_receipt\": \"0\", \"sop_preparation\": \"0\", \"preparation_date\": null, \"first_billing_received\": null, \"first_service_provided_name\": null}', '{\"thresh_auth\": null, \"thresh_elect\": null, \"thresh_portal\": null, \"thresh_denials\": null, \"thresh_posting\": null, \"thresh_rejections\": null, \"thresh_eligibility\": null, \"thresh_charge_entry\": null, \"thresh_posting_elect\": null, \"thresh_charge_elect_checkbox\": 0, \"thresh_charge_manual_checkbox\": 0, \"thresh_posting_elect_checkbox\": 0, \"thresh_posting_manual_checkbox\": 0, \"thresh_eligibility_cal_checkbox\": 0, \"thresh_eligibility_portal_checkbox\": 0, \"thresh_charge_with_demo_graphics_checkbox\": 0}', '[{\"name\": null, \"claims\": null}]', '2023-04-14 17:12:48', '2023-04-25 20:06:14', NULL),
(9, 10, NULL, 'Demo Practice', 39, NULL, NULL, 'HOME HEALTH CARE AGENCY,CHIROPRACTOR', 10000, '1013403427', 'MZ610', '32432', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null},{\"address\":\"werew\",\"zip\":\"fas13\",\"state\":\"asfda\",\"city\":\"asdfa\"}]', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null},{\"address\":\"werew\",\"zip\":\"_____\",\"state\":\"asfda\",\"city\":\"asdfa\"}]', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null}]', NULL, '[{\"designation\":\"Doctor\",\"email\":\"focal2@gmail.com\",\"fax\":\"150002\",\"name\":\"SDFAS\",\"phone\":\"12345678902\"}]', '[{\"title\":\"MR\",\"name\":\"ALEJANDRA\",\"fax\":\"12646\",\"email\":\"test@temp.com\",\"phone\":\"123456\"}]', '[{\"dob\":null,\"individual_npi\":null,\"individual_ptan\":null,\"name\":null,\"ssn\":null,\"tax_id\":null}]', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '[{\"name\":null,\"url\":null,\"username\":null,\"password\":null}]', '[{\"payer_name\":null,\"provider_name\":null,\"npi\":null,\"enroll_type\":null,\"enroll_with\":null,\"effective_date\":null}]', '{\"option\":null,\"value\":null}', '{\"credentialing\":\"1\",\"coding\":\"1\",\"phd\":\"1\",\"billing\":\"1\",\"eligibility_check\":\"1\",\"authorization\":0,\"patient_statement\":\"1\",\"ar\":\"1\",\"ar_start\":null,\"key_billing_issues\":null,\"complementary_services\":null,\"special_instructions\":null}', '{\"welcome_email\":null,\"onboarding_metting_date\":null,\"attended_by_crm_team\":null,\"docuhub_orientation\":\"1\",\"orientation_datetime\":\"2023-05-02T01:07\",\"orientation_by\":null,\"mom_sharing_date\":\"2023-05-02T01:08\"}', '{\"logins_receipt\":\"0\",\"login_date\":\"2023-05-02\",\"sop_preparation\":\"0\",\"first_service_provided_name\":null,\"preparation_date\":null,\"first_billing_received\":null}', '{\"thresh_eligibility_cal_checkbox\":0,\"thresh_eligibility\":null,\"thresh_charge_manual_checkbox\":0,\"thresh_charge_with_demo_graphics_checkbox\":0,\"thresh_charge_entry\":null,\"thresh_posting_manual_checkbox\":0,\"thresh_posting\":null,\"thresh_eligibility_portal_checkbox\":0,\"thresh_portal\":null,\"thresh_charge_elect_checkbox\":0,\"thresh_elect\":null,\"thresh_posting_elect_checkbox\":0,\"thresh_posting_elect\":null,\"thresh_auth\":null,\"thresh_rejections\":null,\"thresh_denials\":null}', '[{\"name\":null,\"claims\":null}]', '2023-05-01 20:03:33', '2023-05-01 20:13:08', NULL),
(10, 10, NULL, 'Demo Practice 2', 39, NULL, NULL, 'HOME HEALTH CARE AGENCY,CHIROPRACTOR,COUNSELOR', 100, '1013403427', '0497713', '32432', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null}]', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null}]', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null}]', NULL, '[{\"designation\":null,\"email\":null,\"fax\":null,\"name\":null,\"phone\":null}]', '[{\"title\":null,\"name\":null,\"fax\":null,\"email\":null,\"phone\":null}]', '[{\"dob\":null,\"individual_npi\":null,\"individual_ptan\":null,\"name\":null,\"ssn\":null,\"tax_id\":null}]', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '[{\"name\":null,\"url\":null,\"username\":null,\"password\":null}]', '[{\"payer_name\":null,\"provider_name\":null,\"npi\":null,\"enroll_type\":null,\"enroll_with\":null,\"effective_date\":null}]', '{\"option\":null,\"value\":null}', '{\"credentialing\":0,\"coding\":0,\"phd\":0,\"billing\":0,\"eligibility_check\":0,\"authorization\":0,\"patient_statement\":0,\"ar\":0,\"ar_start\":null,\"key_billing_issues\":null,\"complementary_services\":null,\"special_instructions\":null}', '{\"welcome_email\":null,\"onboarding_metting_date\":null,\"attended_by_crm_team\":null,\"docuhub_orientation\":0,\"orientation_datetime\":null,\"orientation_by\":null,\"mom_sharing_date\":null}', '{\"logins_receipt\":0,\"login_date\":null,\"sop_preparation\":0,\"first_service_provided_name\":null,\"preparation_date\":null,\"first_billing_received\":null}', '{\"thresh_eligibility_cal_checkbox\":0,\"thresh_eligibility\":null,\"thresh_charge_manual_checkbox\":0,\"thresh_charge_with_demo_graphics_checkbox\":0,\"thresh_charge_entry\":null,\"thresh_posting_manual_checkbox\":0,\"thresh_posting\":null,\"thresh_eligibility_portal_checkbox\":0,\"thresh_portal\":null,\"thresh_charge_elect_checkbox\":0,\"thresh_elect\":null,\"thresh_posting_elect_checkbox\":0,\"thresh_posting_elect\":null,\"thresh_auth\":null,\"thresh_rejections\":null,\"thresh_denials\":null}', '[{\"name\":null,\"claims\":null}]', '2023-05-01 21:09:18', '2023-05-01 21:09:18', NULL),
(11, 11, NULL, 'All 4 one', 52, NULL, NULL, 'COUNSELOR,NURSING HOME', 50000, '1013403427', 'MZ610', '32432', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null}]', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null}]', '[{\"address\":null,\"zip\":null,\"state\":null,\"city\":null}]', NULL, '[{\"designation\":null,\"email\":null,\"fax\":null,\"name\":null,\"phone\":null}]', '[{\"title\":null,\"name\":null,\"fax\":null,\"email\":null,\"phone\":null}]', '[{\"dob\":null,\"individual_npi\":null,\"individual_ptan\":null,\"name\":null,\"ssn\":null,\"tax_id\":null}]', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '{\"name\":null,\"url\":null,\"username\":null,\"password\":null}', '[{\"name\":null,\"url\":null,\"username\":null,\"password\":null}]', '[{\"payer_name\":null,\"provider_name\":null,\"npi\":null,\"enroll_type\":null,\"enroll_with\":null,\"effective_date\":null}]', '{\"option\":null,\"value\":null}', '{\"credentialing\":0,\"coding\":0,\"phd\":0,\"billing\":0,\"eligibility_check\":0,\"authorization\":0,\"patient_statement\":0,\"ar\":0,\"ar_start\":null,\"key_billing_issues\":null,\"complementary_services\":null,\"special_instructions\":null}', '{\"welcome_email\":null,\"onboarding_metting_date\":null,\"attended_by_crm_team\":null,\"docuhub_orientation\":0,\"orientation_datetime\":null,\"orientation_by\":null,\"mom_sharing_date\":null}', '{\"logins_receipt\":0,\"login_date\":null,\"sop_preparation\":0,\"first_service_provided_name\":null,\"preparation_date\":null,\"first_billing_received\":null}', '{\"thresh_eligibility_cal_checkbox\":0,\"thresh_eligibility\":null,\"thresh_charge_manual_checkbox\":0,\"thresh_charge_with_demo_graphics_checkbox\":0,\"thresh_charge_entry\":null,\"thresh_posting_manual_checkbox\":0,\"thresh_posting\":null,\"thresh_eligibility_portal_checkbox\":0,\"thresh_portal\":null,\"thresh_charge_elect_checkbox\":0,\"thresh_elect\":null,\"thresh_posting_elect_checkbox\":0,\"thresh_posting_elect\":null,\"thresh_auth\":null,\"thresh_rejections\":null,\"thresh_denials\":null}', '[{\"name\":null,\"claims\":null}]', '2023-05-04 16:14:54', '2023-05-04 16:14:54', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `practice_user`
--

INSERT INTO `practice_user` (`id`, `user_id`, `practice_id`, `type`, `user_type`, `is_parent`, `created_at`, `updated_at`) VALUES
(6, 19, 4, 1, 1, NULL, '2023-03-03 01:50:31', '2023-03-03 01:50:31'),
(7, 16, 4, 1, 1, NULL, '2023-03-03 01:50:40', '2023-03-03 01:50:40'),
(8, 20, 4, 1, 1, NULL, '2023-03-03 02:12:52', '2023-03-03 02:12:52'),
(9, 20, 5, 1, 1, NULL, '2023-03-03 02:12:52', '2023-03-03 02:12:52'),
(15, 15, 8, 1, 1, NULL, '2023-03-22 23:17:19', '2023-05-11 18:06:40'),
(28, 17, 6, 1, 1, NULL, '2023-04-05 00:22:54', '2023-04-05 00:22:54'),
(33, 18, 4, 1, 1, NULL, '2023-04-17 21:17:04', '2023-04-17 21:17:04'),
(34, 18, 5, 1, 1, NULL, '2023-04-17 21:17:04', '2023-04-17 21:17:04'),
(35, 18, 6, 1, 1, NULL, '2023-04-17 21:17:04', '2023-04-17 21:17:04'),
(36, 18, 7, 1, 1, NULL, '2023-04-17 21:17:04', '2023-04-17 21:17:04'),
(37, 25, 9, 1, 1, NULL, '2023-05-02 01:17:47', '2023-05-02 01:17:47'),
(38, 24, 9, 1, 1, NULL, '2023-05-02 01:18:53', '2023-05-02 01:18:53'),
(39, 26, 10, 1, 1, NULL, '2023-05-02 02:11:44', '2023-05-02 02:11:44'),
(40, 27, 10, 1, 1, NULL, '2023-05-02 02:14:23', '2023-05-02 02:14:23'),
(41, 29, 11, 1, 1, NULL, '2023-05-04 21:20:57', '2023-05-04 21:20:57'),
(42, 30, 11, 1, 1, NULL, '2023-05-04 21:37:39', '2023-05-04 21:37:39'),
(43, 23, 9, 1, 1, NULL, '2023-05-09 01:42:32', '2023-05-09 01:42:32'),
(44, 22, 5, 1, 1, NULL, '2023-05-09 21:19:16', '2023-05-09 21:19:16'),
(45, 22, 6, 1, 1, NULL, '2023-05-09 21:19:16', '2023-05-09 21:19:16'),
(46, 15, 8, 1, 1, NULL, '2023-05-11 18:06:40', '2023-05-11 18:06:40'),
(47, 15, 5, 1, 1, NULL, '2023-05-11 18:06:40', '2023-05-11 18:06:40'),
(48, 15, 6, 1, 1, NULL, '2023-05-11 18:06:40', '2023-05-11 18:06:40'),
(49, 15, 7, 1, 1, NULL, '2023-05-11 18:06:40', '2023-05-11 18:06:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(20, 'new-Client', 'web', 6, 'Client', '2023-03-02 14:54:21', '2023-03-02 14:54:21'),
(21, 'new-User', 'web', 6, 'User', '2023-04-25 12:34:06', '2023-04-25 12:34:06'),
(25, 'apple-superadmin', 'web', 10, 'superadmin', '2023-05-01 13:45:39', '2023-05-01 13:45:39'),
(26, 'apple-Admin', 'web', 10, 'Admin', '2023-05-01 14:13:17', '2023-05-01 14:13:17'),
(27, 'apple-Manager', 'web', 10, 'Manager', '2023-05-01 14:16:22', '2023-05-01 14:16:22'),
(28, 'apple-Client', 'web', 10, 'Client', '2023-05-01 14:21:07', '2023-05-01 14:21:07'),
(29, 'bpo-superadmin', 'web', 11, 'superadmin', '2023-05-04 10:54:19', '2023-05-04 10:54:19'),
(30, 'bpo-bpo_support', 'web', 11, 'bpo_support', '2023-05-04 11:01:29', '2023-05-04 11:01:29'),
(31, 'bpo-Client', 'web', 11, 'Client', '2023-05-04 11:01:56', '2023-05-04 11:01:56');

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
(13, 10),
(14, 10),
(15, 10),
(16, 10),
(17, 10),
(19, 10),
(20, 10),
(21, 10),
(22, 10),
(23, 10),
(24, 10),
(25, 10),
(26, 10),
(27, 10),
(28, 10),
(29, 10),
(30, 10),
(31, 10),
(32, 10),
(33, 10),
(34, 10),
(35, 10),
(36, 10),
(37, 10),
(38, 10),
(39, 10),
(40, 10),
(41, 10),
(42, 10),
(44, 10),
(45, 10),
(46, 10),
(47, 10),
(48, 10),
(49, 10),
(50, 10),
(51, 10),
(52, 10),
(53, 10),
(54, 10),
(55, 10),
(56, 10),
(57, 10),
(58, 10),
(59, 10),
(60, 10),
(61, 10),
(62, 10),
(63, 10),
(64, 10),
(65, 10),
(66, 10),
(67, 10),
(68, 10),
(69, 10),
(70, 10),
(71, 10),
(73, 10),
(74, 10),
(75, 10),
(76, 10),
(77, 10),
(78, 10),
(79, 10),
(80, 10),
(82, 10),
(83, 10),
(84, 10),
(85, 10),
(86, 10),
(87, 10),
(88, 10),
(89, 10),
(90, 10),
(91, 10),
(92, 10),
(93, 10),
(94, 10),
(95, 10),
(96, 10),
(97, 10),
(98, 10),
(99, 10),
(100, 10),
(102, 10),
(103, 10),
(105, 10),
(106, 10),
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
(107, 18),
(108, 18),
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
(73, 20),
(19, 21),
(20, 21),
(34, 21),
(39, 21),
(40, 21),
(41, 21),
(49, 21),
(64, 21),
(65, 21),
(73, 21),
(79, 21),
(80, 21),
(83, 21),
(84, 21),
(85, 21),
(86, 21),
(13, 25),
(14, 25),
(15, 25),
(16, 25),
(17, 25),
(19, 25),
(20, 25),
(21, 25),
(22, 25),
(23, 25),
(24, 25),
(25, 25),
(26, 25),
(27, 25),
(28, 25),
(29, 25),
(30, 25),
(31, 25),
(32, 25),
(33, 25),
(34, 25),
(35, 25),
(36, 25),
(37, 25),
(38, 25),
(39, 25),
(40, 25),
(41, 25),
(42, 25),
(44, 25),
(45, 25),
(46, 25),
(47, 25),
(48, 25),
(49, 25),
(50, 25),
(51, 25),
(52, 25),
(53, 25),
(54, 25),
(55, 25),
(56, 25),
(57, 25),
(58, 25),
(59, 25),
(60, 25),
(61, 25),
(62, 25),
(63, 25),
(64, 25),
(65, 25),
(66, 25),
(67, 25),
(68, 25),
(69, 25),
(70, 25),
(71, 25),
(73, 25),
(74, 25),
(75, 25),
(76, 25),
(77, 25),
(78, 25),
(79, 25),
(80, 25),
(82, 25),
(83, 25),
(84, 25),
(85, 25),
(86, 25),
(87, 25),
(88, 25),
(89, 25),
(90, 25),
(91, 25),
(92, 25),
(93, 25),
(94, 25),
(95, 25),
(96, 25),
(97, 25),
(98, 25),
(99, 25),
(100, 25),
(102, 25),
(103, 25),
(104, 25),
(105, 25),
(106, 25),
(14, 26),
(15, 26),
(16, 26),
(17, 26),
(19, 26),
(20, 26),
(21, 26),
(22, 26),
(23, 26),
(28, 26),
(29, 26),
(30, 26),
(31, 26),
(32, 26),
(33, 26),
(34, 26),
(35, 26),
(36, 26),
(37, 26),
(38, 26),
(39, 26),
(40, 26),
(41, 26),
(42, 26),
(44, 26),
(47, 26),
(48, 26),
(49, 26),
(50, 26),
(51, 26),
(52, 26),
(53, 26),
(54, 26),
(55, 26),
(56, 26),
(57, 26),
(58, 26),
(60, 26),
(61, 26),
(62, 26),
(63, 26),
(64, 26),
(65, 26),
(66, 26),
(67, 26),
(68, 26),
(69, 26),
(70, 26),
(71, 26),
(73, 26),
(74, 26),
(75, 26),
(76, 26),
(77, 26),
(78, 26),
(79, 26),
(80, 26),
(82, 26),
(83, 26),
(84, 26),
(85, 26),
(86, 26),
(87, 26),
(88, 26),
(89, 26),
(90, 26),
(91, 26),
(92, 26),
(93, 26),
(94, 26),
(95, 26),
(96, 26),
(97, 26),
(98, 26),
(99, 26),
(100, 26),
(103, 26),
(104, 26),
(105, 26),
(106, 26),
(15, 27),
(19, 27),
(20, 27),
(21, 27),
(22, 27),
(23, 27),
(28, 27),
(32, 27),
(34, 27),
(35, 27),
(36, 27),
(37, 27),
(38, 27),
(39, 27),
(40, 27),
(41, 27),
(42, 27),
(44, 27),
(47, 27),
(48, 27),
(49, 27),
(54, 27),
(58, 27),
(61, 27),
(62, 27),
(63, 27),
(64, 27),
(65, 27),
(69, 27),
(70, 27),
(71, 27),
(73, 27),
(74, 27),
(75, 27),
(76, 27),
(77, 27),
(79, 27),
(80, 27),
(82, 27),
(83, 27),
(84, 27),
(85, 27),
(86, 27),
(87, 27),
(88, 27),
(89, 27),
(90, 27),
(91, 27),
(92, 27),
(93, 27),
(94, 27),
(95, 27),
(99, 27),
(100, 27),
(104, 27),
(105, 27),
(19, 28),
(39, 28),
(40, 28),
(41, 28),
(42, 28),
(47, 28),
(48, 28),
(49, 28),
(64, 28),
(65, 28),
(70, 28),
(73, 28),
(74, 28),
(75, 28),
(76, 28),
(13, 29),
(14, 29),
(15, 29),
(16, 29),
(17, 29),
(19, 29),
(20, 29),
(21, 29),
(22, 29),
(23, 29),
(24, 29),
(25, 29),
(26, 29),
(27, 29),
(28, 29),
(29, 29),
(30, 29),
(31, 29),
(32, 29),
(33, 29),
(34, 29),
(35, 29),
(36, 29),
(37, 29),
(38, 29),
(39, 29),
(40, 29),
(41, 29),
(42, 29),
(44, 29),
(45, 29),
(46, 29),
(47, 29),
(48, 29),
(49, 29),
(50, 29),
(51, 29),
(52, 29),
(53, 29),
(54, 29),
(55, 29),
(56, 29),
(57, 29),
(58, 29),
(59, 29),
(60, 29),
(61, 29),
(62, 29),
(63, 29),
(64, 29),
(65, 29),
(66, 29),
(67, 29),
(68, 29),
(69, 29),
(70, 29),
(71, 29),
(73, 29),
(74, 29),
(75, 29),
(76, 29),
(77, 29),
(78, 29),
(79, 29),
(80, 29),
(82, 29),
(83, 29),
(84, 29),
(85, 29),
(86, 29),
(87, 29),
(88, 29),
(89, 29),
(90, 29),
(91, 29),
(92, 29),
(93, 29),
(94, 29),
(95, 29),
(96, 29),
(97, 29),
(98, 29),
(99, 29),
(100, 29),
(102, 29),
(103, 29),
(104, 29),
(105, 29),
(106, 29),
(15, 30),
(16, 30),
(17, 30),
(19, 30),
(20, 30),
(21, 30),
(22, 30),
(23, 30),
(28, 30),
(29, 30),
(30, 30),
(31, 30),
(32, 30),
(33, 30),
(34, 30),
(35, 30),
(36, 30),
(37, 30),
(38, 30),
(39, 30),
(40, 30),
(41, 30),
(42, 30),
(44, 30),
(47, 30),
(48, 30),
(49, 30),
(51, 30),
(52, 30),
(53, 30),
(54, 30),
(55, 30),
(56, 30),
(57, 30),
(58, 30),
(60, 30),
(61, 30),
(62, 30),
(63, 30),
(64, 30),
(65, 30),
(66, 30),
(67, 30),
(68, 30),
(69, 30),
(70, 30),
(71, 30),
(73, 30),
(77, 30),
(78, 30),
(79, 30),
(80, 30),
(82, 30),
(83, 30),
(86, 30),
(87, 30),
(88, 30),
(89, 30),
(90, 30),
(91, 30),
(92, 30),
(93, 30),
(94, 30),
(95, 30),
(96, 30),
(97, 30),
(98, 30),
(99, 30),
(100, 30),
(103, 30),
(104, 30),
(105, 30),
(106, 30),
(19, 31),
(39, 31),
(40, 31),
(41, 31),
(42, 31),
(47, 31),
(48, 31),
(49, 31),
(64, 31),
(65, 31),
(69, 31),
(70, 31),
(71, 31),
(73, 31),
(100, 31);

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
  `type` varchar(64) DEFAULT NULL COMMENT 'SMTP,wasabi,ticket',
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
  `ticket_review` tinyint(4) NOT NULL DEFAULT '0',
  `ticke_approval` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_id`, `type`, `host`, `username`, `password`, `port`, `enc_type`, `region`, `version`, `endpoint`, `secret_key`, `wkey`, `ticket_review`, `ticke_approval`, `created_at`, `updated_at`) VALUES
(1, 6, 'smtp', 'Host', 'Username', 'Password', 'Port', 'Enc Type', NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-03-27 15:25:04', '2023-03-27 15:25:04'),
(2, 6, 'wasabi', NULL, NULL, NULL, NULL, NULL, 'Region', 'Version', 'Endpoint', 'Secret Key', 'Key', 0, 0, '2023-03-27 15:26:21', '2023-03-27 15:26:21'),
(3, 6, 'ticket', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2023-05-15 15:16:51', '2023-05-15 15:16:51');

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `company_id`, `name`, `type`, `default`, `created_at`, `updated_at`) VALUES
(1, 6, 'To Be Posted', 'document', 0, '2023-02-22 18:07:25', '2023-05-12 12:53:46'),
(2, 6, 'Active', 'user', 1, '2023-02-23 11:40:41', '2023-05-12 12:53:55'),
(3, 6, 'Active', 'practice', 1, '2023-03-06 15:35:08', '2023-05-12 12:53:49'),
(4, 6, 'On Hold', 'practice', 0, '2023-03-06 15:35:20', '2023-05-12 12:53:49'),
(5, 6, 'Terminated', 'practice', 0, '2023-03-06 15:50:03', '2023-05-12 12:53:49'),
(6, 6, 'On Termination Notice', 'practice', 0, '2023-03-06 15:50:12', '2023-05-12 12:53:49'),
(7, 6, 'On Boarding In Process', 'practice', 0, '2023-03-06 15:50:23', '2023-05-12 12:53:49'),
(8, 6, 'Retention In Progress', 'practice', 0, '2023-03-06 15:50:32', '2023-05-12 12:53:49'),
(9, 6, 'Not Onboarded', 'practice', 0, '2023-03-06 15:50:43', '2023-05-12 12:53:49'),
(10, 6, 'Actice', 'client', 1, '2023-03-06 17:49:39', '2023-05-12 12:53:41'),
(11, 6, 'Inactive', 'client', 0, '2023-03-06 17:49:48', '2023-05-12 12:53:41'),
(12, 6, 'Inactive', 'user', 0, '2023-03-06 17:50:03', '2023-05-12 12:53:55'),
(13, 6, 'Posted', 'document', 0, '2023-03-07 09:14:32', '2023-05-12 12:53:46'),
(14, 6, 'In-Progress', 'document', 1, '2023-03-07 09:14:53', '2023-05-12 12:53:46'),
(15, 6, 'Pending', 'document', 0, '2023-03-07 09:15:05', '2023-05-12 12:53:46'),
(16, 6, 'Complete', 'document', 0, '2023-03-07 09:15:18', '2023-05-12 12:53:46'),
(17, 6, 'Pending (For Coding)', 'document', 0, '2023-03-07 09:15:36', '2023-05-12 12:53:46'),
(18, 6, 'On-Hold (For Coding)', 'document', 0, '2023-03-07 09:15:52', '2023-05-12 12:53:46'),
(19, 6, 'Coded', 'document', 0, '2023-03-07 09:16:04', '2023-05-12 12:53:46'),
(20, 6, 'Active', 'team', 1, '2023-03-07 09:17:06', '2023-03-07 09:45:23'),
(21, 6, 'Inactive', 'team', 0, '2023-03-07 09:17:21', '2023-03-07 09:45:23'),
(22, 6, 'Open', 'ticket', 0, '2023-03-07 10:07:48', '2023-05-12 12:53:53'),
(23, 6, 'In-Process', 'ticket', 1, '2023-03-07 10:08:09', '2023-05-12 12:53:53'),
(24, 6, 'Reopen', 'ticket', 0, '2023-03-07 10:08:46', '2023-05-12 12:53:53'),
(25, 6, 'On-Hold', 'ticket', 0, '2023-03-07 10:09:00', '2023-05-12 12:53:53'),
(26, 6, 'Waiting Approval', 'ticket', 0, '2023-03-07 10:09:38', '2023-05-12 12:53:53'),
(27, 6, 'Rejected', 'ticket', 0, '2023-03-07 10:09:48', '2023-05-12 12:53:53'),
(28, 10, 'To be posted', 'document', 0, '2023-05-01 14:55:42', '2023-05-12 12:53:46'),
(29, 10, 'Posted', 'document', 0, '2023-05-01 14:55:53', '2023-05-12 12:53:46'),
(30, 10, 'Pending', 'document', 0, '2023-05-01 14:56:04', '2023-05-12 12:53:46'),
(31, 10, 'Completed', 'document', 0, '2023-05-01 14:56:13', '2023-05-12 12:53:46'),
(32, 10, 'Open', 'ticket', 0, '2023-05-01 14:56:35', '2023-05-12 12:53:53'),
(33, 10, 'Close', 'ticket', 0, '2023-05-01 14:56:43', '2023-05-12 12:53:53'),
(34, 10, 'In process', 'ticket', 0, '2023-05-01 14:56:55', '2023-05-12 12:53:53'),
(35, 10, 'Active', 'user', 0, '2023-05-01 14:57:09', '2023-05-12 12:53:55'),
(36, 10, 'Inactive', 'user', 0, '2023-05-01 14:57:19', '2023-05-12 12:53:55'),
(37, 10, 'Active', 'client', 0, '2023-05-01 14:57:34', '2023-05-12 12:53:41'),
(38, 10, 'Inactive', 'client', 0, '2023-05-01 14:57:43', '2023-05-12 12:53:41'),
(39, 10, 'Active', 'practice', 0, '2023-05-01 14:58:03', '2023-05-12 12:53:49'),
(40, 10, 'Inactive', 'practice', 0, '2023-05-01 14:58:13', '2023-05-12 12:53:49'),
(41, 10, 'On boarding in process', 'practice', 0, '2023-05-01 14:58:27', '2023-05-12 12:53:49'),
(42, 10, 'Terminated', 'practice', 0, '2023-05-01 14:58:35', '2023-05-12 12:53:49'),
(43, 11, 'Active', 'user', 0, '2023-05-04 11:08:52', '2023-05-12 12:53:55'),
(44, 11, 'Inactive', 'user', 0, '2023-05-04 11:09:07', '2023-05-12 12:53:55'),
(45, 11, 'On Notice Period', 'user', 0, '2023-05-04 11:09:37', '2023-05-12 12:53:55'),
(46, 11, 'To be posted', 'document', 0, '2023-05-04 11:09:49', '2023-05-12 12:53:46'),
(47, 11, 'Posted', 'document', 0, '2023-05-04 11:10:01', '2023-05-12 12:53:46'),
(48, 11, 'Pending', 'document', 0, '2023-05-04 11:10:13', '2023-05-12 12:53:46'),
(49, 11, 'Active', 'client', 0, '2023-05-04 11:10:24', '2023-05-12 12:53:41'),
(50, 11, 'Inactive', 'client', 0, '2023-05-04 11:10:34', '2023-05-12 12:53:41'),
(51, 11, 'Terminated', 'client', 0, '2023-05-04 11:10:44', '2023-05-12 12:53:41'),
(52, 11, 'Active', 'practice', 0, '2023-05-04 11:12:22', '2023-05-12 12:53:49'),
(53, 11, 'Open', 'ticket', 0, '2023-05-04 11:12:31', '2023-05-12 12:53:53'),
(54, 11, 'Close', 'ticket', 0, '2023-05-04 11:12:40', '2023-05-12 12:53:53'),
(56, 6, 'Closed', 'ticket', 0, '2023-05-15 13:17:02', '2023-05-15 13:17:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `company_id`, `name`, `description`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Team A', NULL, 1, '2023-01-25 16:44:17', '2023-01-25 16:44:17', NULL),
(2, 1, 'Team B', NULL, 1, '2023-02-17 20:12:34', '2023-02-17 20:13:16', NULL),
(3, 6, 'Team A', NULL, 1, '2023-02-21 17:54:56', '2023-02-21 17:54:56', NULL),
(4, 6, 'Team B', NULL, 1, '2023-02-22 18:30:53', '2023-02-22 18:30:53', NULL),
(5, 6, 'Team C', NULL, 1, '2023-02-22 18:31:00', '2023-02-22 18:31:00', NULL),
(6, 6, 'Team D', NULL, 1, '2023-02-22 18:33:32', '2023-02-22 18:33:32', NULL),
(7, 6, 'Team E', NULL, 1, '2023-04-26 13:55:10', '2023-04-26 13:55:10', NULL),
(8, 6, 'Team F', NULL, 1, '2023-04-26 13:55:27', '2023-04-26 13:55:27', NULL),
(9, 6, 'Team G', NULL, 1, '2023-04-26 13:55:40', '2023-04-26 13:55:40', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

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
(16, 20, 6, '2023-03-03 02:12:25', '2023-03-03 02:12:25', NULL),
(17, 15, 4, '2023-03-23 00:03:31', '2023-03-23 00:03:31', NULL),
(18, 15, 5, '2023-03-23 00:03:31', '2023-03-23 00:03:31', NULL),
(19, 15, 6, '2023-03-23 00:03:31', '2023-03-23 00:03:31', NULL),
(20, 21, 3, '2023-04-20 22:52:02', '2023-04-20 22:52:02', NULL),
(21, 21, 6, '2023-04-21 01:36:01', '2023-04-21 01:36:01', NULL),
(22, 22, 4, '2023-04-25 19:52:39', '2023-04-25 19:52:39', NULL),
(23, 22, 6, '2023-04-25 19:52:39', '2023-04-25 19:52:39', NULL);

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `company_id`, `user_id`, `user_type`, `department_id`, `target_id`, `team_id`, `type`, `priority`, `subject`, `message`, `creator`, `response_at`, `status`, `remarks`, `flag`, `is_external`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 6, 15, 2, 3, 4, 0, 'Info/Other', 'High', 'Test subject', '<p>test message abc</p>', 'New Test Company', '2023-04-06 09:44:42', 56, NULL, 0, 1, '2023-02-24 16:17:37', NULL, '2023-04-06 09:44:42'),
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
(19, 6, 15, 2, 4, 5, 3, 'Info/Other', 'Low', 'Testing notification', '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'New Test Company', '2023-04-04 15:54:10', 22, 'Ticket Forward Remarks', 1, 1, '2023-03-03 12:13:55', '2023-05-09 13:18:14', '2023-05-09 13:18:14'),
(20, 6, 15, 2, 7, 4, 3, 'Info/Other', 'Low', 'Test', '<p>this is test message.</p>', 'New Test Company', '2023-04-04 15:54:41', 23, NULL, 0, 1, '2023-03-29 12:24:55', NULL, '2023-05-09 15:08:29'),
(21, 6, 15, 2, 4, 7, 0, 'Info/Other', 'Low', 'Ticket 21', '<p>message 21</p>', 'New Test Company', '2023-04-05 10:24:03', 24, NULL, 0, 0, '2023-03-29 12:42:25', NULL, '2023-04-05 10:24:03'),
(22, 6, 15, 2, 4, 3, 0, 'Info/Other', 'Medium', 'Ticket 22', '<p>message 22</p>', 'New Test Company', '2023-04-05 10:34:35', 25, NULL, 0, 0, '2023-03-29 13:02:14', NULL, '2023-04-05 10:34:35'),
(23, 6, 15, 2, 4, 3, 0, 'Info/Other', 'Concerning', 'Ticket 23', '<p>message 23</p>', 'New Test Company', NULL, 26, NULL, 0, 0, '2023-03-29 13:03:42', NULL, '2023-03-29 13:03:42'),
(24, 6, 15, 2, 4, 7, 0, 'Info/Other', 'Medium', 'Ticket 24', '<p>Message 24</p>', 'New Test Company', '2023-05-11 09:00:40', 27, NULL, 0, 1, '2023-03-29 13:06:45', NULL, '2023-05-11 09:00:40'),
(25, 10, 24, 2, 11, 9, 0, 'Query', 'Low', 'Ticket created by user to client Demo Practice', '<p>This is a test message updated</p>', 'Apple', '2023-05-08 14:31:09', 32, NULL, 0, 1, '2023-05-08 14:16:26', NULL, '2023-05-08 14:31:09'),
(26, 10, 24, 2, 11, 9, 0, 'Other', 'Medium', 'Ticket created by User for Demo practice', '<p>Testing message from user to demo practice</p>', 'Apple', '2023-05-08 15:33:06', 32, NULL, 0, 1, '2023-05-08 15:30:42', NULL, '2023-05-08 15:33:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

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
(10, 1, 18, 1, 'DESDToPAZwM7IHhDckovKZDvHZ4w78kJpnNzv2sx.xlsx', '20220915010715_Practice Info Sheet.xlsx', 'uploads/ticket_attachments/DESDToPAZwM7IHhDckovKZDvHZ4w78kJpnNzv2sx.xlsx', 'xlsx', '12.59 KB', '2023-04-06 14:44:43', '2023-04-06 14:44:43'),
(11, 25, 0, 0, 'kaJbhB0dbcqmnugtkSQvNSI5cBqJ47UkegHnkIjo.pdf', 'sample.pdf', 'uploads/ticket_attachments/kaJbhB0dbcqmnugtkSQvNSI5cBqJ47UkegHnkIjo.pdf', 'pdf', '2.96 KB', '2023-05-08 19:16:27', '2023-05-08 19:16:27'),
(12, 25, 19, 1, 'lTK2IpoDA3WApfl1fYpQovsSycJOKlHyBCUAW4c7.pdf', 'sample.pdf', 'uploads/ticket_attachments/lTK2IpoDA3WApfl1fYpQovsSycJOKlHyBCUAW4c7.pdf', 'pdf', '2.96 KB', '2023-05-08 19:30:37', '2023-05-08 19:30:37'),
(13, 25, 20, 1, 'Lmg5oirpXwPA3ljJ2Pr2678GgkAdAZWPDdHU05ej.pdf', 'sample.pdf', 'uploads/ticket_attachments/Lmg5oirpXwPA3ljJ2Pr2678GgkAdAZWPDdHU05ej.pdf', 'pdf', '2.96 KB', '2023-05-08 19:31:09', '2023-05-08 19:31:09'),
(14, 26, 0, 0, 'xNqsQgqCVnQoTffj6UG5LYbKknhkY5VpC4xx3TFE.pdf', 'sample.pdf', 'uploads/ticket_attachments/xNqsQgqCVnQoTffj6UG5LYbKknhkY5VpC4xx3TFE.pdf', 'pdf', '2.96 KB', '2023-05-08 20:30:42', '2023-05-08 20:30:42'),
(15, 26, 21, 1, 'WUVuPKhZEnGTTqdycRbeLeBmaG6s88LBpRurd4KO.pdf', 'sample.pdf', 'uploads/ticket_attachments/WUVuPKhZEnGTTqdycRbeLeBmaG6s88LBpRurd4KO.pdf', 'pdf', '2.96 KB', '2023-05-08 20:33:06', '2023-05-08 20:33:06'),
(16, 24, 22, 1, 'oKKddtYr4yxexJBMjbhqYIRqpnXiTAUKWr3276Qx.xlsx', 'Sign off (3).xlsx', 'uploads/ticket_attachments/oKKddtYr4yxexJBMjbhqYIRqpnXiTAUKWr3276Qx.xlsx', 'xlsx', '23.41 KB', '2023-05-11 14:00:40', '2023-05-11 14:00:40');

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
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_logs`
--

INSERT INTO `ticket_logs` (`id`, `ticket_id`, `user_id`, `seen`, `created_at`, `updated_at`) VALUES
(1, 19, 17, 0, '2023-03-23 12:45:20', '2023-03-23 17:45:20'),
(2, 19, 20, 0, '2023-03-23 12:45:20', '2023-03-23 17:45:20'),
(3, 23, 15, 0, '2023-03-29 13:03:42', '2023-03-29 18:03:42'),
(4, 23, 16, 0, '2023-03-29 13:03:42', '2023-03-29 18:03:42'),
(5, 23, 19, 0, '2023-03-29 13:03:42', '2023-03-29 18:03:42'),
(6, 23, 20, 0, '2023-03-29 13:03:42', '2023-03-29 18:03:42'),
(7, 25, 25, 0, '2023-05-08 14:16:27', '2023-05-08 19:16:27'),
(8, 25, 24, 0, '2023-05-08 14:16:27', '2023-05-08 19:16:27'),
(9, 26, 25, 0, '2023-05-08 15:30:42', '2023-05-08 20:30:42'),
(10, 26, 24, 0, '2023-05-08 15:30:42', '2023-05-08 20:30:42');

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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

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
(18, 1, 15, 'Asad Nazir', '<p>test reply</p>', 0, '2023-04-06 09:44:42', NULL, '2023-04-06 09:44:42'),
(19, 25, 24, 'Mazhar Aftab', '<p>Replied by user</p>', 0, '2023-05-08 14:30:37', NULL, '2023-05-08 14:30:37'),
(20, 25, 24, 'Mazhar Aftab', '<p>Reply 2 by user</p>', 0, '2023-05-08 14:31:09', NULL, '2023-05-08 14:31:09'),
(21, 26, 24, 'Mazhar Aftab', '<p>Reply by user</p>', 0, '2023-05-08 15:33:06', NULL, '2023-05-08 15:33:06'),
(22, 24, 15, 'Asad Nazir', '<p>test mesage</p>', 0, '2023-05-11 09:00:40', NULL, '2023-05-11 09:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `employee_id`, `designation_id`, `type`, `status`, `firstname`, `lastname`, `psudo_name`, `email`, `username`, `email_verified_at`, `password`, `remember_token`, `last_activity`, `timezone`, `created_at`, `updated_at`) VALUES
(10, 0, 123, 2, 0, 2, 'Rahmat', 'Ali', 'Rahmat Ali', 'admin@mail.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', 'FyP1cCglCqasjcuhEpk4KcxQP7L4tjEp7i09NWuwilmURv3pNon8ACHsqPd4', NULL, 0, '2023-01-04 04:24:33', '2023-02-24 09:42:42'),
(11, 4, 1234, 2, 2, 2, 'Super', 'Admin', NULL, 'superadmin4@bmb.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-01-19 13:39:09', '2023-01-19 13:39:09'),
(12, 5, 124, 2, 2, 2, 'Super', 'Admin', NULL, 'superadmin5@test.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-01-22 12:33:56', '2023-01-22 12:33:56'),
(13, 1, 125, 2, 2, 2, 'John D.', 'John D.', NULL, 'JohnDMurray@teleworm.us', 'JohnDMurray', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-01-25 10:36:08', '2023-01-25 10:36:08'),
(14, 1, 126, NULL, 3, 2, 'test', 'client', NULL, 'client@gmail.com', '', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-02-05 10:19:42', '2023-02-05 10:19:42'),
(15, 6, 2703, 6, 2, 2, 'Asad', 'Nazir', 'Asad Nazir Awan', 'superadmin6@new.com', 'superadmin6', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 7, '2023-02-16 16:08:10', '2023-03-20 15:18:50'),
(16, 6, 127, NULL, 3, 10, 'New', 'Client 1', NULL, 'newclient@gmail.com', 'newclient', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 4, '2023-02-16 16:10:37', '2023-04-25 11:21:36'),
(17, 6, 2704, 5, 2, 2, 'Haroon', 'Khan', 'Haroon Khan', 'haroon.khan@bellmedex.com', 'haroon.khan', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-02-21 12:54:37', '2023-04-20 15:52:09'),
(18, 6, 2312, 4, 2, 2, 'Frank', 'Lee', 'Frank Lee', 'frank.lee@bellmedex.com', 'frank.lee', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-02-27 12:43:41', '2023-04-25 09:55:44'),
(19, 6, 128, NULL, 3, 10, 'New', 'Client 2', NULL, 'newclient2@gmail.com', 'newclient2', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-03-02 15:49:40', '2023-04-25 11:21:21'),
(20, 6, 129, NULL, 3, 10, 'New', 'Client 3', NULL, 'newclient3@gmail.com', 'newclient3', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-03-02 16:12:25', '2023-04-25 11:21:07'),
(21, 6, 2520, 8, 2, 2, 'Rafia', 'Afzal', 'Rafiya Afzal', 'rafia.afzal@bellmedex.com', 'rafia.afzal', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 2, '2023-04-20 12:52:02', '2023-04-25 09:53:56'),
(22, 6, 2709, 8, 2, 2, 'Laiba', 'Malik', 'Laiba Malik', 'laiba.malik@bellmedex.com', 'laiba.malik', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 7, '2023-04-25 09:52:39', '2023-04-25 09:53:39'),
(23, 10, NULL, NULL, 2, 1, 'Super', 'Admin', NULL, 'superadmin10@apple.com', 'superadmin10', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-05-01 13:45:39', '2023-05-01 13:45:39'),
(24, 10, 1000, 13, 2, 35, 'Mazhar', 'Aftab', 'Max Smith', 'max.smith@apple.com', 'max.smith@apple.com', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-05-01 15:01:46', '2023-05-01 15:01:46'),
(25, 10, NULL, NULL, 3, 37, 'Nathan', 'Micry', NULL, 'nathan@example.com', 'nathan@example.com', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 7, '2023-05-01 15:16:51', '2023-05-01 15:16:51'),
(26, 10, NULL, NULL, 3, 37, 'Demo 2', 'Client', NULL, 'demo2@apple.com', 'demo2@apple.com', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 7, '2023-05-01 16:10:43', '2023-05-01 16:10:43'),
(27, 10, 1102, 13, 2, 35, 'User2', 'name', 'User2Psudo', 'user2@apple.com', 'user2@apple.com', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-05-01 16:13:47', '2023-05-01 16:13:47'),
(28, 11, NULL, NULL, 2, 1, 'Super', 'Admin', NULL, 'superadmin11@bpo.com', 'superadmin11', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-05-04 10:54:19', '2023-05-04 10:54:19'),
(29, 11, NULL, NULL, 3, 49, 'Danny', 'Smith', NULL, 'danny@example.com', 'danny@example.com', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 7, '2023-05-04 11:20:00', '2023-05-04 11:20:00'),
(30, 11, 1976, 16, 2, 43, 'Maria', 'Smith', 'Maria Smith', 'maria@bellmedex.com', 'maria@bellmedex.com', NULL, '$2y$10$cEJsuBpta26C6aMp.MaCY.5apeaYbYNQ2pY1azhsk1cvfo4GhMaNy', NULL, NULL, 0, '2023-05-04 11:36:58', '2023-05-04 11:36:58');

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
