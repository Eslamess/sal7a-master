-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2020 at 09:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sal7a_mobapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supervisor` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `web_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `supervisor`, `name`, `username`, `email`, `password`, `web_token`, `created_at`, `updated_at`) VALUES
(1, 0, 'Karim Hassan', 'karim', 'karim@app.com', '$2y$12$/CUcmSdnNM45xsFkh/OD5u6pz2F/zq/7PXwS3UJy3tVa60VKh0Ira', 'djZNKsXPXuY:APA91bEOmuOjonxYgA8XJ89qZ9Hdp4VRJXpQtPVj5fyfOOEcoN2QC1tO0EXq3tUCiZhToH4Jb-ouKTDAECBLL9NOYL-eqVuRWKwsX_Vuul7o-tZw1lV9eNLs_SYrSkQrcXhxg2E8-KWr', NULL, '2020-03-10 11:41:56'),
(2, 1, 'عجايب', 'karim@app.comss', 'karim@app.comss', '$2y$10$XxdnXNJiEs4qvg0Sl7eFMeulx.l88XFIuGcmNx9pLm8YQHm4Cq8AK', 'djZNKsXPXuY:APA91bEOmuOjonxYgA8XJ89qZ9Hdp4VRJXpQtPVj5fyfOOEcoN2QC1tO0EXq3tUCiZhToH4Jb-ouKTDAECBLL9NOYL-eqVuRWKwsX_Vuul7o-tZw1lV9eNLs_SYrSkQrcXhxg2E8-KWr', '2020-02-17 13:14:39', '2020-03-10 11:41:40'),
(3, 1, 'خالد', 'karims@app.com', 'karims@app.com', '$2y$10$gkoGUVGGQDPitLHbn74VPOAbbTjHxGx17xzImYH2sNSw8w7p96iM2', NULL, '2020-02-19 09:09:50', '2020-02-19 09:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id2` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('new','active','banned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `rate` double DEFAULT 5,
  `rate_count` int(11) NOT NULL DEFAULT 0,
  `is_available` tinyint(1) DEFAULT 1,
  `device_token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `documents_images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ios_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `android_token` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`id`, `admin_id`, `name`, `email`, `email_verified_at`, `phone`, `phone_verified_at`, `password`, `birthday`, `image`, `national_id`, `national_id2`, `category_id`, `city_id`, `latitude`, `longitude`, `status`, `rate`, `rate_count`, `is_available`, `device_token`, `documents_images`, `created_at`, `updated_at`, `ios_token`, `android_token`) VALUES
(1, 2, 'Karim', 'mohamedx@app.com', NULL, '+201119494098', NULL, '$2y$10$7dVHUlYg2qjXNZ2JglsmaeaXhQTlZqTio9TFDRyPF/qXlcvNcd5vG', '0000-00-00', NULL, NULL, '', 6, 4, '454354.1213', '5.55454', 'active', 4.859375, 5, 1, NULL, NULL, NULL, '2020-03-03 11:46:55', '', 'ekkury1waYo:APA91bENWcSnQUmyIaQmBHv65VKdIwkb0r4KhFPax5rnqh7fI7vNw6vNUXEMQ4QrBI5HH2D1UIqJohfuoi4xVaEose91L7t4dRnQ8nQ0TpqwlZfydk0bs-PwGjuT-_Y_sRprRHIERt4T'),
(2, 2, 'Karim', 'agent@app.com', NULL, '+2011194940098', NULL, '$2y$10$5Mb/WtuMfvGF8b0K9OGIa.QxufiNlMddMaTkYB0r5o9OsNhx4Ia1K', '1996-06-30', NULL, NULL, '', 6, 4, NULL, NULL, 'active', 3, 0, 1, NULL, NULL, NULL, '2020-03-03 11:47:51', '', 'fj1fnsjenvs:APA91bE65VO2-JY0AhaRdXQJkNl4xkz2dleBIbQTwmpZ8cTbLCvttSGqKT3rwPlbihEgB_-yip1O60XS2UJ4b9dae1CfnQrzO4buUzuRrcR2rq-tYNrFETUwlIMP6iEnUya5CWyEJSay'),
(3, NULL, 'Karim', 'karim22x120@app.com', NULL, '201119494098+', NULL, '$2y$10$6shw4wZ8c1py2XMG4OPzWOa6xPkArQdL9Ssp2qFCEao4MocpmJ3Se', '1996-06-30', NULL, NULL, '', 6, 2, '454354.1213', '5.55454', 'active', 0, 0, 1, NULL, NULL, '2020-01-16 11:55:17', '2020-01-16 11:55:17', '', ''),
(4, NULL, 'Karim', 'karim220@app.com', NULL, '010154351454', NULL, '$2y$10$5.1kHwRc2A16zqZHCm0mL.Rf0W2dEzStSDRvN4Sa4VYiiCmz8VMgi', '1996-06-30', '/tmp/phpbCcNCg', '/tmp/phpVRxu6K', '', 6, 2, '454354.1213', '5.55454', 'active', 0, 0, 1, NULL, NULL, '2020-01-16 12:53:11', '2020-02-24 12:55:52', '', ''),
(5, NULL, 'Karim', 'karim2x20@app.com', NULL, '010222351454', NULL, '$2y$10$1y04vUgdbpiBsewiaXUeoujmrlDOFoiCOWWAEQnlsGViZfR6KeCna', '1996-06-30', '/tmp/phpWtYNLN', '/tmp/php13sb1K', '', 6, 2, '454354.1213', '5.55454', 'banned', 0, 0, 1, NULL, NULL, '2020-01-16 12:55:45', '2020-01-23 09:51:16', '', ''),
(6, NULL, 'Karim', 'karimwx20@app.com', NULL, '010222251454', NULL, '$2y$10$I6GfdPoOLJh/pfJy/MOnH.IpnJNbA5FmQj7bsxjoqTyQnwpZhXP/K', '1996-06-30', '/storage/agents/78397951_1302121589958280_5315900834943336448_n_1581508994.jpg', '/storage/id/logo4_1579179389.png', '', 6, 2, '454354.1213', '5.55454', 'active', 0, 0, 1, NULL, NULL, '2020-01-16 12:56:29', '2020-02-24 12:59:53', '', ''),
(7, NULL, 'aya', 'aya@app.com', NULL, '0102222514', NULL, '$2y$10$XPzoezagzQakxDovBUUAi.gdEqKd0BQDR9cyWQv.qy1.MPwLA/o3O', '1996-06-30', '/storage/agents/12_1579181349.png', '/storage/id/12_1579181349.png', '', 6, 2, '454354.1213', '5.55454', 'active', 0, 0, 1, NULL, NULL, '2020-01-16 13:29:09', '2020-02-24 13:00:07', '', ''),
(8, NULL, 'Karim', 'karimxwx20@app.com', NULL, '010200251454', NULL, '$2y$10$gr9uxWdrCOotOh8FPNF2ZOOyGUBlKdJqB/dA6jufB2VK1Wm8Vu7O2', '1996-06-30', '/storage/agents/Logo55_1579182334.png', '/storage/id/logo4_1579182334.png', '', 6, 2, '454354.1213', '5.55454', 'active', 0, 0, 1, NULL, NULL, '2020-01-16 13:45:34', '2020-02-24 13:03:40', '', ''),
(9, NULL, 'aya', 'aya123@app.com', NULL, '01020025145', NULL, '$2y$10$HAWid807Ty2FcnEc8qnqGuby47QyE/NEFqoCps3DwGPr7pLToG3jC', '1996-06-30', '/storage/agents/12_1579184379.png', '/storage/id/12_1579184379.png', '', 6, 2, '454354.1213', '5.55454', 'new', 0, 0, 1, NULL, NULL, '2020-01-16 14:19:39', '2020-01-16 14:19:39', '', ''),
(10, NULL, 'aya', 'aya124@app.com', NULL, '010200251556', NULL, '$2y$10$SMqkON9K3vyupo9oSiR2IOaQKCVFv1zlCn/ngmlmmoMvYrdsyIFI2', '1996-06-30', '/storage/agents/12_1579424615.png', '/storage/id/12_1579424615.png', '', 4, 2, '454354.1213', '5.55454', 'new', 0, 0, 1, NULL, NULL, '2020-01-19 09:03:35', '2020-01-19 09:03:35', '', ''),
(11, NULL, 'aya', 'aya1@app.com', NULL, '01020025145423', NULL, '$2y$10$Nqi4AXoKvzYeemHHQ2cE5uKe.jNjq5pDniXVqHT6UyibeOLWcIfh2', '1996-06-30', '/storage/agents/12_1579535278.png', '/storage/id/12_1579535278.png', '15614561565616', 6, 2, '454354.1213', '5.55454', 'new', 0, 0, 1, NULL, NULL, '2020-01-20 15:47:58', '2020-01-20 15:47:58', '', ''),
(12, NULL, 'aya', 'aya3@app.com', NULL, '010200251458', NULL, '$2y$10$sKb4A3QI1wgdDGZ2xMB0K.5XIfkAHEod5/tmScKfvPxQui2SadNW2', '1996-06-30', '/storage/agents/12_1579603058.png', '/storage/id/12_1579603058.png', '5318848', 6, 2, '30.1213', '31.55454', 'new', 0, 0, 1, NULL, NULL, '2020-01-21 10:37:38', '2020-01-21 10:37:38', '', ''),
(13, NULL, 'wwww', 'walid@yahoo.com', NULL, '01222500505', NULL, '$2y$10$j6/s9thmfRKwsD/GEAUOd.kGGBEKoITmz60DZ/YBOWtPykdHfR0Dy', '1983-01-22', '/storage/agents/Capture_1579616652.PNG', '/storage/id/Capture_1579616652.PNG', '/tmp/phpV3gxPS', 6, 2, '-122.08400000000002', '37.421998333333335', 'new', 0, 0, 1, NULL, NULL, '2020-01-21 14:24:12', '2020-01-21 14:24:12', '', ''),
(14, NULL, 'Karim', 'karimxwx2j0@app.com', NULL, '0102002514545', NULL, '$2y$10$0grDMvOZz02Fu/dCcKWffO02QNRzUIecr3rlEOIsz0Z6LsJtdcQc.', '1996-06-30', '/storage/agents/_104842882_students_1579616964.jpg', '/storage/id/menu (1)_1579616964.png', '245151', 6, 2, '454354.1213', '5.55454', 'new', 0, 0, 1, NULL, NULL, '2020-01-21 14:29:24', '2020-01-21 14:29:24', '', ''),
(15, NULL, 'walid', 'walid44443@yahoo.com', NULL, '01282500505', NULL, '$2y$10$9EWCCj8VP8Cc2PfnMoWMAuOmbeUXGrc8N4qr00uLuOItEOudp/3OO', '1982-01-21', '/storage/agents/googlelogo_color_160x56dp_1579616965.png', '/storage/id/googlelogo_color_160x56dp_1579616965.png', '/tmp/php3wsOnI', 6, 1, '37.421998333333335', '-122.08400000000002', 'new', 0, 0, 1, NULL, NULL, '2020-01-21 14:29:25', '2020-01-21 14:29:25', '', ''),
(16, NULL, 'walid', 'walid4444@yahoo.com', NULL, '01202500505', NULL, '$2y$10$lo7X8h0cwXjLpPIfuUNloOM.ogPGmGxE25J8HXyotbwjx7qRB3.vu', '1982-01-21', '/storage/agents/googlelogo_color_160x56dp_1579617056.png', '/storage/id/googlelogo_color_160x56dp_1579617056.png', '/tmp/phpKXpchF', 6, 1, '37.421998333333335', '-122.08400000000002', 'new', 0, 0, 1, NULL, NULL, '2020-01-21 14:30:56', '2020-01-21 14:30:56', '', ''),
(17, NULL, 'aaa', 'wal4443@yahoo.com', NULL, '01232500505', NULL, '$2y$10$PPeNH6NGxVfjuRQDKyuVR.0TrcAB1mZgpJL9MqYC2W2rUKEefO1V6', '1989-01-21', '/storage/agents/googlelogo_color_160x56dp_1579617760.png', '/storage/id/googlelogo_color_160x56dp_1579617760.png', '52222222222', 6, 1, '37.421998333333335', '-122.08400000000002', 'new', 0, 0, 1, NULL, NULL, '2020-01-21 14:42:40', '2020-01-21 14:42:40', '', ''),
(18, NULL, 'Karim', 'x.kemo7@gmail.com', NULL, '01020025145436', NULL, '$2y$10$3M7s61eFTFrGy81FiRblVeklx03CeN0e6aBbNeaNIpDCpBWjzHJLW', '1996-06-30', '/storage/agents/_104842882_students_1582024578.jpg', '/storage/id/logo4_1579770769.png', '21546541321', 6, 2, '454354.1213', '5.55454', 'active', 0, 0, 1, NULL, NULL, '2020-01-23 09:12:49', '2020-02-18 11:16:18', '12356', ''),
(19, NULL, 'Karim', 'daliaawad@gmail.com', NULL, '010200251454364', NULL, '$2y$10$Xs1pyQXR8dQOj0AzDGI6eOEJwwuRrO37sb3395dym/fDIxf9aU01i', '1996-06-30', '/storage/agents/_104842882_students_1580806964.jpg', '/storage/id/_104842882_students_1580806964.jpg,/storage/id/menu (1)_1580806964.png', '565456446545465', 6, 2, '454354.1213', '5.55454', 'new', 0, 0, 1, NULL, '/storage/documents/menu (1)_1580806964.png,/storage/documents/menu_1580806964.png', '2020-02-04 09:02:44', '2020-02-04 09:02:44', '', ''),
(20, NULL, 'خالد', 'khaled@app.com', NULL, '01019985262', NULL, '$2y$10$624vqEB1Wskj937RGkYizeG1A0W4dTQObzu6ddcuP.gRHnkPu54T6', '2020-02-19', '/storage/agents/74667344_472311863632015_3135759020128731136_o_1581845941.jpg', '/storage/id/74667344_472311863632015_3135759020128731136_o_1581845941.jpg', '123456789561231864897', 4, 1, NULL, NULL, 'active', 5, 0, 1, NULL, '/storage/documents/1200px-Anonymous.svg_1581845941.png,/storage/documents/74667344_472311863632015_3135759020128731136_o_1581845941.jpg', '2020-02-16 09:39:01', '2020-02-24 13:00:13', '', ''),
(21, NULL, 'عجايبs', 'karisssssm@app.com', NULL, '0506943146', NULL, '$2y$10$CKz/KN4wCXM8oyM1IhSVoe3baEEJDq.g8HQRzKGMMEV6m7oK8eGiW', '2020-03-01', '/storage/agents/1200px-Anonymous.svg_1583837755.png', '/storage/id/1200px-Anonymous.svg_1583837755.png', '13515353153', 4, 1, NULL, NULL, 'new', 5, 0, 1, NULL, '/storage/documents/74667344_472311863632015_3135759020128731136_o_1583837755.jpg', '2020-03-10 10:55:55', '2020-03-10 10:55:55', '', ''),
(22, NULL, 'عجايب', 'karissssm@app.com', NULL, '0506943146314314', NULL, '$2y$10$Yq3tZ8PPv6M6BG.YehWg5.gvmmM5dWbZ.ZaeTWc3nor6waAUA1W1e', '2020-03-09', '/storage/agents/74667344_472311863632015_3135759020128731136_o_1583837831.jpg', '/storage/id/74667344_472311863632015_3135759020128731136_o_1583837831.jpg', '13515353153', 4, 1, NULL, NULL, 'new', 5, 0, 1, NULL, '/storage/documents/74667344_472311863632015_3135759020128731136_o_1583837831.jpg', '2020-03-10 10:57:11', '2020-03-10 10:57:11', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `apprates`
--

CREATE TABLE `apprates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_rates`
--

CREATE TABLE `app_rates` (
  `id` bigint(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `app_rates`
--

INSERT INTO `app_rates` (`id`, `user_id`, `comment`, `rate`, `created_at`, `updated_at`) VALUES
(1, 18, 'ya rayaa', 2, '2020-02-10 08:13:16', '2020-02-10 13:14:48'),
(2, 18, 'ya rayaa', 2, '2020-02-10 08:15:32', '2020-02-10 13:14:48'),
(3, 18, 'ya rayaa', 2, '2020-02-10 08:45:16', '2020-02-10 13:14:48'),
(4, 24, 'Amar', 4, '2020-02-10 08:55:25', '2020-02-10 13:10:40'),
(5, 24, 'Amar', 4, '2020-02-10 09:59:04', '2020-02-10 13:10:40'),
(6, 18, 'ya rayaa', 2, '2020-02-10 09:59:16', '2020-02-10 13:14:48'),
(7, 18, 'ya rayaa', 2, '2020-02-10 09:59:17', '2020-02-10 13:14:48'),
(8, 24, 'Amar', 4, '2020-02-10 10:02:01', '2020-02-10 13:10:40'),
(9, 18, 'ya rayaa', 2, '2020-02-10 10:03:26', '2020-02-10 13:14:48'),
(10, 24, 'Amar', 4, '2020-02-10 10:07:12', '2020-02-10 13:10:40'),
(11, 24, 'Amar', 4, '2020-02-10 10:07:12', '2020-02-10 13:10:40'),
(12, 24, 'Amar', 4, '2020-02-10 10:07:12', '2020-02-10 13:10:40'),
(13, 24, 'Amar', 4, '2020-02-10 10:07:12', '2020-02-10 13:10:40'),
(14, 24, 'Amar', 4, '2020-02-10 10:07:12', '2020-02-10 13:10:40'),
(15, 24, 'Amar', 4, '2020-02-10 10:07:13', '2020-02-10 13:10:40'),
(16, 24, 'Amar', 4, '2020-02-10 10:10:43', '2020-02-10 13:10:40'),
(17, 24, 'Amar', 4, '2020-02-10 10:10:49', '2020-02-10 13:10:40'),
(18, 24, 'Amar', 4, '2020-02-10 10:10:50', '2020-02-10 13:10:40'),
(19, 24, 'Amar', 4, '2020-02-10 10:12:05', '2020-02-10 13:10:40'),
(20, 24, 'Amar', 4, '2020-02-10 10:12:08', '2020-02-10 13:10:40'),
(21, 24, 'Amar', 4, '2020-02-10 10:22:16', '2020-02-10 13:10:40'),
(22, 18, 'ya rayaa', 2, '2020-02-10 13:14:53', '2020-02-10 13:14:53'),
(23, 18, 'ya rayaa', 2, '2020-02-12 09:40:58', '2020-02-12 09:40:58'),
(24, 2, 'Pretty App !', 0, '2020-02-12 10:17:54', '2020-02-12 10:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visit_fees` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `name_en`, `icon`, `visit_fees`) VALUES
(4, 'تكييفات', 'Air Conditioning', '/storage/category/air-conditioner_1581585506.png', 0),
(5, 'نظافة', 'Cleaning', '/storage/category/broom1576673097.png', 0),
(6, 'ابواب', 'Doors', '/storage/category/door.png', 1),
(7, 'كهرباء', 'electirc', '/storage/category/electricity.png', 0),
(8, 'سباكة', 'windos', '/storage/category/broom.png', 0),
(9, 'حاسوب وشبكات', 'computer', '/storage/category/laptop@3x.png', 0),
(10, 'ارضيات', 'floor', '/storage/category/floor.png', 0),
(11, 'حداده', 'steel', '/storage/category/welder.png', 0),
(12, 'دهانات', 'skip', '/storage/category/painting.png', 0),
(13, 'نجارة والومنيوم', 'carbenter', '/storage/category/carpenter.png', 0),
(14, 'مبيدات', 'anti-char', '/storage/category/spray.png', 0),
(15, 'تنسيق حدائق', 'tree orginization', '/storage/category/landscape.png', 0),
(16, 'ماركت', 'market', '/storage/category/logo_1583139943.png', 5);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `name_en`, `parent_id`) VALUES
(1, 'القاهرة', 'Cairo', NULL),
(2, 'شبرا مصر', 'Shoubra Misr', 1),
(3, 'شبرا مصر', 'Shoubra Misr', 1),
(4, 'شبرا مصر', 'Shoubra Misr', 1),
(5, 'جيزة', 'giza', NULL),
(6, 'tdwg', 'asdfas', 5),
(7, 'خالد', 'uoi;', NULL),
(8, 'خالد2', 'W5JH', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_code`
--

CREATE TABLE `email_code` (
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_code`
--

INSERT INTO `email_code` (`email`, `code`, `created_at`) VALUES
('ahmad@app.com', '479316', '2020-02-04 13:57:41'),
('amr@yahoo.com', '586170', '2020-02-02 13:59:20'),
('ayaosamaahmed@gmail.com', '189035', '2020-01-29 10:50:56'),
('daliaawad108@dalia.com', '682350', '2020-02-05 13:31:43'),
('daliaawaded@gmail.com', '574196', '2020-02-04 13:15:57'),
('daliaawadelsayedddd@gmail.com', '781963', '2020-02-04 10:19:02'),
('daliad@gmail.com', '196208', '2020-02-05 13:22:21'),
('daliadd@gmail.com', '120495', '2020-02-05 14:14:37'),
('me@app.com', '762314', '2020-02-05 13:26:59'),
('mer@yaho.com', '341628', '2020-02-02 10:50:22'),
('mohmedx@app.com', '236095', '2020-02-04 12:10:46'),
('v@yahoo.com', '293604', '2020-02-03 11:31:21'),
('w_amri@hotmail.com', '136247', '2020-02-10 15:47:41'),
('mm@app.com', '869417', '2020-02-13 09:11:59'),
('mm@mmm.com', '961748', '2020-02-13 09:12:42'),
('house@app.om', '068439', '2020-02-13 09:24:12'),
('meritte@app.com', '609315', '2020-02-13 11:20:12'),
('merited@app.com', '025916', '2020-02-13 11:20:13'),
('hamam@app.fcom', '295867', '2020-02-16 08:28:28'),
('x.d@gmail.com', '756032', '2020-02-16 11:16:21'),
('khaled.abodaif@yahoo.com', '243109', '2020-02-16 14:03:38'),
('walid@gmail.com', '025847', '2020-02-16 14:47:13'),
('ahmad@app.com', '479316', '2020-02-04 13:57:41'),
('amr@yahoo.com', '586170', '2020-02-02 13:59:20'),
('ayaosamaahmed@gmail.com', '189035', '2020-01-29 10:50:56'),
('daliaawad108@dalia.com', '682350', '2020-02-05 13:31:43'),
('daliaawaded@gmail.com', '574196', '2020-02-04 13:15:57'),
('daliaawadelsayedddd@gmail.com', '781963', '2020-02-04 10:19:02'),
('daliad@gmail.com', '196208', '2020-02-05 13:22:21'),
('daliadd@gmail.com', '120495', '2020-02-05 14:14:37'),
('me@app.com', '762314', '2020-02-05 13:26:59'),
('mer@yaho.com', '341628', '2020-02-02 10:50:22'),
('mohmedx@app.com', '236095', '2020-02-04 12:10:46'),
('v@yahoo.com', '293604', '2020-02-03 11:31:21'),
('w_amri@hotmail.com', '136247', '2020-02-10 15:47:41'),
('mm@app.com', '869417', '2020-02-13 09:11:59'),
('mm@mmm.com', '961748', '2020-02-13 09:12:42'),
('house@app.om', '068439', '2020-02-13 09:24:12'),
('meritte@app.com', '609315', '2020-02-13 11:20:12'),
('merited@app.com', '025916', '2020-02-13 11:20:13'),
('hamam@app.fcom', '295867', '2020-02-16 08:28:28'),
('x.d@gmail.com', '756032', '2020-02-16 11:16:21'),
('khaled.abodaif@yahoo.com', '243109', '2020-02-16 14:03:38'),
('walid@gmail.com', '025847', '2020-02-16 14:47:13'),
('ahmad@app.com', '479316', '2020-02-04 13:57:41'),
('amr@yahoo.com', '586170', '2020-02-02 13:59:20'),
('ayaosamaahmed@gmail.com', '189035', '2020-01-29 10:50:56'),
('daliaawad108@dalia.com', '682350', '2020-02-05 13:31:43'),
('daliaawaded@gmail.com', '574196', '2020-02-04 13:15:57'),
('daliaawadelsayedddd@gmail.com', '781963', '2020-02-04 10:19:02'),
('daliad@gmail.com', '196208', '2020-02-05 13:22:21'),
('daliadd@gmail.com', '120495', '2020-02-05 14:14:37'),
('me@app.com', '762314', '2020-02-05 13:26:59'),
('mer@yaho.com', '341628', '2020-02-02 10:50:22'),
('mohmedx@app.com', '236095', '2020-02-04 12:10:46'),
('v@yahoo.com', '293604', '2020-02-03 11:31:21'),
('w_amri@hotmail.com', '136247', '2020-02-10 15:47:41'),
('mm@app.com', '869417', '2020-02-13 09:11:59'),
('mm@mmm.com', '961748', '2020-02-13 09:12:42'),
('house@app.om', '068439', '2020-02-13 09:24:12'),
('meritte@app.com', '609315', '2020-02-13 11:20:12'),
('merited@app.com', '025916', '2020-02-13 11:20:13'),
('hamam@app.fcom', '295867', '2020-02-16 08:28:28'),
('x.d@gmail.com', '756032', '2020-02-16 11:16:21'),
('khaled.abodaif@yahoo.com', '243109', '2020-02-16 14:03:38'),
('walid@gmail.com', '025847', '2020-02-16 14:47:13');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2019_12_15_115240_create_categories_table', 1),
(4, '2019_12_15_115254_create_cities_table', 1),
(5, '2019_12_15_115255_create_users_table', 1),
(6, '2019_12_15_115419_create_admins_table', 1),
(7, '2019_12_15_115433_create_agents_table', 1),
(8, '2019_12_15_115538_create_offers_table', 1),
(9, '2019_12_15_115558_create_settings_table', 1),
(10, '2019_12_15_115835_create_notifications_table', 1),
(11, '2019_12_15_115937_create_orders_table', 1),
(12, '2019_12_24_125223_create_phone_code_table', 2),
(13, '2020_01_06_102424_create_pages_table', 3),
(14, '2020_01_06_110422_create_order_images_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notifiable_id` int(11) NOT NULL,
  `user_role` enum('agent','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('reservation') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notifiable_id`, `user_role`, `type`, `user_id`, `title`, `body`, `url`, `created_at`, `updated_at`) VALUES
(1, 6, 'user', '', 24, 'تم تغير الحالة', 'تم وصول العامل', '', '2020-02-26 10:27:10', '2020-02-26 10:27:10'),
(2, 6, 'user', '', 24, 'تم تغير الحالة', 'تم وصول العامل', '', '2020-02-26 10:37:46', '2020-02-26 10:37:46'),
(3, 6, 'user', '', 24, 'تم تغير الحالة', 'تم وصول العامل', '', '2020-02-26 10:39:29', '2020-02-26 10:39:29'),
(4, 164, 'user', '', 0, 'عروض صلحها', 'يوجد عرض جديد بأنتظارك!', '', '2020-02-26 12:10:31', '2020-02-26 12:10:31'),
(5, 127, 'user', '', 0, 'عروض صلحها', 'Blanditiis enim.تم تمديد وقت العرض ', '', '2020-02-26 12:13:50', '2020-02-26 12:13:50'),
(6, 119, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 09:29:09', '2020-03-02 09:29:09'),
(7, 120, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-02 09:30:45', '2020-03-02 09:30:45'),
(8, 121, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 12:40:30', '2020-03-02 12:40:30'),
(9, 122, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 13:49:50', '2020-03-02 13:49:50'),
(10, 123, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 13:51:05', '2020-03-02 13:51:05'),
(11, 124, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 13:52:06', '2020-03-02 13:52:06'),
(12, 125, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 13:52:58', '2020-03-02 13:52:58'),
(13, 126, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 13:57:18', '2020-03-02 13:57:18'),
(14, 127, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 13:58:22', '2020-03-02 13:58:22'),
(15, 128, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 13:58:59', '2020-03-02 13:58:59'),
(16, 129, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:13:34', '2020-03-02 14:13:34'),
(17, 129, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-02 14:13:34', '2020-03-02 14:13:34'),
(18, 130, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:16:38', '2020-03-02 14:16:38'),
(19, 131, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:16:43', '2020-03-02 14:16:43'),
(20, 132, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:17:44', '2020-03-02 14:17:44'),
(21, 132, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-02 14:17:44', '2020-03-02 14:17:44'),
(22, 133, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:19:06', '2020-03-02 14:19:06'),
(23, 133, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-02 14:19:06', '2020-03-02 14:19:06'),
(24, 134, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:25:14', '2020-03-02 14:25:14'),
(25, 134, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-02 14:25:14', '2020-03-02 14:25:14'),
(26, 136, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:27:33', '2020-03-02 14:27:33'),
(27, 137, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:28:02', '2020-03-02 14:28:02'),
(28, 138, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:28:38', '2020-03-02 14:28:38'),
(29, 142, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:31:28', '2020-03-02 14:31:28'),
(30, 147, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:35:54', '2020-03-02 14:35:54'),
(31, 167, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-02 14:54:29', '2020-03-02 14:54:29'),
(32, 168, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:56:35', '2020-03-02 14:56:35'),
(33, 168, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-02 14:56:35', '2020-03-02 14:56:35'),
(34, 169, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 14:57:40', '2020-03-02 14:57:40'),
(35, 171, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 15:18:16', '2020-03-02 15:18:16'),
(36, 172, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 15:18:23', '2020-03-02 15:18:23'),
(37, 173, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 15:20:50', '2020-03-02 15:20:50'),
(38, 174, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 15:20:55', '2020-03-02 15:20:55'),
(39, 175, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 15:21:06', '2020-03-02 15:21:06'),
(40, 175, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-02 15:21:06', '2020-03-02 15:21:06'),
(41, 176, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-02 15:21:20', '2020-03-02 15:21:20'),
(42, 176, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-02 15:21:20', '2020-03-02 15:21:20'),
(43, 176, 'user', '', 3, 'تم تغير الحالة', 'تم وصول العامل', '', '2020-03-02 15:29:11', '2020-03-02 15:29:11'),
(44, 1, 'user', '', 1, 'تم تغير الحالة', 'تم المعاينة', '', '2020-03-03 11:10:02', '2020-03-03 11:10:02'),
(45, 1, 'user', '', 1, 'تم تغير الحالة', 'تم وصول العامل', '', '2020-03-03 11:13:11', '2020-03-03 11:13:11'),
(46, 1, 'user', '', 1, 'تم تغير الحالة', 'تم وصول العامل', '', '2020-03-03 11:13:28', '2020-03-03 11:13:28'),
(47, 1, 'user', '', 1, 'تم تغير الحالة', 'تم وصول العامل', '', '2020-03-03 11:13:41', '2020-03-03 11:13:41'),
(48, 1, 'user', '', 1, 'تم تغير الحالة', 'تم الموافقة', '', '2020-03-03 11:20:46', '2020-03-03 11:20:46'),
(49, 1, 'agent', '', 2, 'تم الغاء الطلب', 'سبب الالغاء العميل:', '', '2020-03-03 11:21:59', '2020-03-03 11:21:59'),
(50, 1, 'agent', '', 2, 'تم الغاء الطلب', 'سبب الالغاء العميل:', '', '2020-03-03 11:23:24', '2020-03-03 11:23:24'),
(51, 1, 'agent', '', 2, 'تم الغاء الطلب', 'سبب الالغاء العميل:', '', '2020-03-03 11:30:27', '2020-03-03 11:30:27'),
(52, 1, 'agent', '', 2, 'تم الغاء الطلب', 'سبب الالغاء العميل:', '', '2020-03-03 11:32:29', '2020-03-03 11:32:29'),
(53, 1, 'agent', '', 1, 'تم اقاف عضويتك', 'لقد قام المدير بأقاف عضويتك', '', '2020-03-03 11:46:51', '2020-03-03 11:46:51'),
(54, 1, 'agent', '', 2, 'تم اقاف عضويتك', 'لقد قام المدير بأقاف عضويتك', '', '2020-03-03 11:47:02', '2020-03-03 11:47:02'),
(55, 1, 'agent', '', 2, 'تم تفعيل عضويتك', 'لقد قام المدير بتفعيل عضويتك', '', '2020-03-03 11:47:52', '2020-03-03 11:47:52'),
(56, 177, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:48:19', '2020-03-03 13:48:19'),
(57, 177, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:48:19', '2020-03-03 13:48:19'),
(58, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/177', '2020-03-03 13:48:19', '2020-03-03 13:48:19'),
(59, 178, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:48:50', '2020-03-03 13:48:50'),
(60, 178, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:48:50', '2020-03-03 13:48:50'),
(61, 179, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:49:58', '2020-03-03 13:49:58'),
(62, 179, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:49:58', '2020-03-03 13:49:58'),
(63, 180, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:50:08', '2020-03-03 13:50:08'),
(64, 180, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:50:08', '2020-03-03 13:50:08'),
(65, 181, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:50:58', '2020-03-03 13:50:58'),
(66, 181, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:50:58', '2020-03-03 13:50:58'),
(67, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/181', '2020-03-03 13:50:58', '2020-03-03 13:50:58'),
(68, 182, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:51:50', '2020-03-03 13:51:50'),
(69, 182, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:51:50', '2020-03-03 13:51:50'),
(70, 183, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:52:09', '2020-03-03 13:52:09'),
(71, 183, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:52:09', '2020-03-03 13:52:09'),
(72, 184, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:53:05', '2020-03-03 13:53:05'),
(73, 184, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:53:05', '2020-03-03 13:53:05'),
(74, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/184', '2020-03-03 13:53:05', '2020-03-03 13:53:05'),
(75, 185, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:53:33', '2020-03-03 13:53:33'),
(76, 185, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:53:33', '2020-03-03 13:53:33'),
(77, 186, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:54:09', '2020-03-03 13:54:09'),
(78, 186, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:54:09', '2020-03-03 13:54:09'),
(79, 187, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:55:17', '2020-03-03 13:55:17'),
(80, 187, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:55:17', '2020-03-03 13:55:17'),
(81, 188, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:55:53', '2020-03-03 13:55:53'),
(82, 188, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:55:53', '2020-03-03 13:55:53'),
(83, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/188', '2020-03-03 13:55:53', '2020-03-03 13:55:53'),
(84, 189, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 13:56:29', '2020-03-03 13:56:29'),
(85, 189, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 13:56:29', '2020-03-03 13:56:29'),
(86, 190, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:16:02', '2020-03-03 14:16:02'),
(87, 190, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:16:03', '2020-03-03 14:16:03'),
(88, 191, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:21:34', '2020-03-03 14:21:34'),
(89, 191, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:21:34', '2020-03-03 14:21:34'),
(90, 192, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:23:33', '2020-03-03 14:23:33'),
(91, 192, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:23:33', '2020-03-03 14:23:33'),
(92, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/192', '2020-03-03 14:23:33', '2020-03-03 14:23:33'),
(93, 193, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:24:35', '2020-03-03 14:24:35'),
(94, 193, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:24:35', '2020-03-03 14:24:35'),
(95, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/193', '2020-03-03 14:24:35', '2020-03-03 14:24:35'),
(96, 194, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:27:00', '2020-03-03 14:27:00'),
(97, 194, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:27:00', '2020-03-03 14:27:00'),
(98, 195, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:27:46', '2020-03-03 14:27:46'),
(99, 195, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:27:47', '2020-03-03 14:27:47'),
(100, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/195', '2020-03-03 14:27:47', '2020-03-03 14:27:47'),
(101, 196, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:28:06', '2020-03-03 14:28:06'),
(102, 196, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:28:06', '2020-03-03 14:28:06'),
(103, 197, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:31:26', '2020-03-03 14:31:26'),
(104, 197, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:31:26', '2020-03-03 14:31:26'),
(105, 198, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:36:43', '2020-03-03 14:36:43'),
(106, 198, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:36:43', '2020-03-03 14:36:43'),
(107, 199, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:37:16', '2020-03-03 14:37:16'),
(108, 199, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:37:16', '2020-03-03 14:37:16'),
(109, 200, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:40:32', '2020-03-03 14:40:32'),
(110, 200, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:40:32', '2020-03-03 14:40:32'),
(111, 201, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:43:08', '2020-03-03 14:43:08'),
(112, 201, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:43:08', '2020-03-03 14:43:08'),
(113, 202, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:43:25', '2020-03-03 14:43:25'),
(114, 202, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:43:25', '2020-03-03 14:43:25'),
(115, 203, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:44:34', '2020-03-03 14:44:34'),
(116, 203, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:44:34', '2020-03-03 14:44:34'),
(117, 204, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:46:04', '2020-03-03 14:46:04'),
(118, 204, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:46:04', '2020-03-03 14:46:04'),
(119, 205, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:48:17', '2020-03-03 14:48:17'),
(120, 205, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:48:18', '2020-03-03 14:48:18'),
(121, 206, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:51:13', '2020-03-03 14:51:13'),
(122, 206, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:51:13', '2020-03-03 14:51:13'),
(123, 207, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:53:38', '2020-03-03 14:53:38'),
(124, 207, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:53:38', '2020-03-03 14:53:38'),
(125, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/207', '2020-03-03 14:53:39', '2020-03-03 14:53:39'),
(126, 208, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:54:21', '2020-03-03 14:54:21'),
(127, 208, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:54:21', '2020-03-03 14:54:21'),
(128, 209, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:55:47', '2020-03-03 14:55:47'),
(129, 209, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:55:48', '2020-03-03 14:55:48'),
(130, 210, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:56:51', '2020-03-03 14:56:51'),
(131, 210, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:56:51', '2020-03-03 14:56:51'),
(132, 0, '', '', 0, 'لديك طلب جديد', 'يوجد طلب جديد في قسمابواب', 'https://sal7a.dtagdev.com/dashboard/order/210', '2020-03-03 14:56:51', '2020-03-03 14:56:51'),
(133, 211, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-03 14:57:10', '2020-03-03 14:57:10'),
(134, 211, 'user', '', 3, 'تكاليف الخدمة', 'تم سحب مبلغ الخدمة من محفظتك وتكاليف الزياره مجانا!', '', '2020-03-03 14:57:10', '2020-03-03 14:57:10'),
(135, 212, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-04 09:34:41', '2020-03-04 09:34:41'),
(136, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 12:26:58', '2020-03-10 12:26:58'),
(137, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 12:27:52', '2020-03-10 12:27:52'),
(138, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 12:28:10', '2020-03-10 12:28:10'),
(139, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 12:43:26', '2020-03-10 12:43:26'),
(140, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 12:44:34', '2020-03-10 12:44:34'),
(141, 10, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-10 12:44:45', '2020-03-10 12:44:45'),
(142, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 13:31:06', '2020-03-10 13:31:06'),
(143, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 13:32:22', '2020-03-10 13:32:22'),
(144, 10, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-10 13:36:12', '2020-03-10 13:36:12'),
(145, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 13:36:23', '2020-03-10 13:36:23'),
(146, 10, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-10 13:36:31', '2020-03-10 13:36:31'),
(147, 5, 'user', '', 1, 'تم تغير الحالة', 'العامل في الطريق', '', '2020-03-10 13:44:33', '2020-03-10 13:44:33'),
(148, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 13:47:44', '2020-03-10 13:47:44'),
(149, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 13:49:30', '2020-03-10 13:49:30'),
(150, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 13:54:53', '2020-03-10 13:54:53'),
(151, 10, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-10 13:55:02', '2020-03-10 13:55:02'),
(152, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 13:58:23', '2020-03-10 13:58:23'),
(153, 10, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-10 13:58:31', '2020-03-10 13:58:31'),
(154, 10, 'agent', '', 3, 'لديك طلب جديد', '', '', '2020-03-10 14:06:52', '2020-03-10 14:06:52'),
(155, 10, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-10 14:07:16', '2020-03-10 14:07:16'),
(156, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 14:08:15', '2020-03-10 14:08:15'),
(157, 10, 'agent', '', 2, 'لديك طلب جديد', '', '', '2020-03-10 14:08:48', '2020-03-10 14:08:48'),
(158, 10, 'agent', '', 1, 'لديك طلب جديد', '', '', '2020-03-10 14:11:27', '2020-03-10 14:11:27'),
(159, 10, 'agent', '', 3, 'لديك طلب جديد', '', '', '2020-03-10 14:32:34', '2020-03-10 14:32:34'),
(160, 10, 'agent', '', 4, 'لديك طلب جديد', '', '', '2020-03-10 14:32:56', '2020-03-10 14:32:56'),
(161, 10, 'agent', '', 6, 'لديك طلب جديد', '', '', '2020-03-10 14:33:09', '2020-03-10 14:33:09'),
(162, 10, 'agent', '', 7, 'لديك طلب جديد', '', '', '2020-03-10 14:33:12', '2020-03-10 14:33:12'),
(163, 10, 'agent', '', 8, 'لديك طلب جديد', '', '', '2020-03-10 14:33:14', '2020-03-10 14:33:14'),
(164, 10, 'agent', '', 18, 'لديك طلب جديد', '', '', '2020-03-10 14:33:16', '2020-03-10 14:33:16'),
(165, 10, 'agent', '', 8, 'لديك طلب جديد', '', '', '2020-03-11 10:49:14', '2020-03-11 10:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('percentage','amount') COLLATE utf8mb4_unicode_ci DEFAULT 'amount',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','deactivated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `name_ar`, `name_en`, `text_ar`, `text_en`, `coupon`, `discount`, `type`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'عيد الاضحي', 'daha', 'عرض العروض', 'best offers', '47415', '50', 'percentage', '2020-01-18', '2030-02-17', 'active', '2020-01-16 11:54:09', '2020-02-25 09:51:13'),
(5, 'Voluptas veniam ex.', 'Dicta porro ut.', 'Error est libero eius est. Repellat et sunt ut quia doloremque. Dolorum quo neque sunt et ad. Necessitatibus non dolorem quas culpa architecto et inventore. Placeat ipsa architecto necessitatibus nihil nemo.', 'Aut in sint fugiat ut deserunt nobis iusto. Veritatis aut consequatur voluptatem repellendus aut ducimus perferendis. Qui dignissimos eligendi dolore consequatur recusandae ea ut. Quae tempora veritatis error aut molestias ullam similique.', '84426', '23', 'amount', '2025-11-09', '2025-11-28', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(6, 'Fugiat aut dolorem.', 'Similique nobis.', 'Commodi voluptas nisi corrupti. Itaque perspiciatis sed occaecati modi dolorem. Voluptate ducimus debitis atque necessitatibus. Dolorem reiciendis animi et aliquam ut.', 'Ut assumenda vitae et aut ipsa ut. Rem vero ullam commodi quisquam blanditiis quae. Sed totam corporis eius cupiditate nihil quo voluptatem.', '22422', '12', 'amount', '2020-07-06', '2021-05-03', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(7, 'Delectus rerum ut.', 'Doloremque sint.', 'Ut enim non voluptatem. Et corporis sunt natus eligendi eum. Aliquam quibusdam minima dolores odio maiores facere. Modi animi voluptas maxime molestias.', 'Deserunt autem vel consequatur aperiam sint consequatur rerum. Temporibus dignissimos illum quaerat sunt ut odit. Quasi sit dolore maiores. Quia sit illo ipsum. Dolores architecto et eum. Quae ea enim molestiae deleniti. Reprehenderit at in iste consequatur.', '20691', '77', 'amount', '2021-05-11', '2025-01-03', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(8, 'Libero animi sequi.', 'Quisquam hic.', 'Aliquam sit labore consequatur quibusdam laboriosam voluptas error. Tempora eligendi nostrum cum et est quibusdam. Vero id ullam incidunt perspiciatis assumenda. Voluptatem autem saepe totam modi eum ut.', 'Commodi sit porro eos aut sed illo laudantium. Rerum et architecto incidunt. Et voluptatibus et distinctio ut. Aut sit incidunt et numquam nesciunt nulla. Error sapiente enim qui minus eum eum. Corporis ut labore corporis eum enim. A ipsum necessitatibus voluptatum autem iusto accusamus.', '10990', '58', 'percentage', '2023-08-14', '2023-09-03', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(9, 'Neque tenetur.', 'Aperiam iure minima.', 'Eum qui maxime et. Saepe quisquam deserunt omnis nihil nostrum fugiat libero dolorem. Quo in neque dolore incidunt quaerat eveniet omnis. Sed libero possimus alias voluptatem ut et.', 'Perferendis magnam perferendis et dolore aspernatur assumenda sint. Officiis quod ut et asperiores. Animi tenetur voluptas saepe. Laborum adipisci officia et quam. Eligendi quasi enim officia nisi possimus.', '80218', '99', 'percentage', '2022-01-08', '2023-08-20', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(10, 'Impedit est sit.', 'Sed amet et qui.', 'Ut sint qui deserunt perferendis architecto. Illo earum in sit cum aut. Nostrum nemo a ad sit. Mollitia recusandae ut incidunt id rerum. Hic id consequatur et quis numquam sit voluptatum. Veniam qui nemo libero recusandae. Et veritatis ipsa ut.', 'Adipisci unde nobis omnis perspiciatis. Qui corporis qui et eos nisi necessitatibus. Non quasi reprehenderit ipsum. Ab at et et illum numquam molestiae repudiandae. Vel sed quisquam fuga dolores quia libero omnis. Commodi sunt sequi dolor quis. Tempora laudantium quas modi aut asperiores alias.', '29049', '77', 'amount', '2020-03-26', '2023-08-20', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(11, 'Quis officia ut ad.', 'Perferendis rerum.', 'Quaerat corrupti illo itaque assumenda. Praesentium corporis expedita unde quam beatae. Quod rerum architecto autem maiores. Doloremque reiciendis doloribus delectus facilis.', 'Error dolor ad et sint. Illum iste necessitatibus ut fugiat minima. Magnam consequatur molestiae vel iste nihil quo. Velit voluptate molestiae doloribus sed numquam. Sequi voluptatibus distinctio eos qui autem magni et. In quae et qui eos.', '5236', '55', 'percentage', '2019-11-27', '2022-08-04', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(12, 'Nulla cum eaque.', 'Aut nesciunt nulla.', 'Nobis ad nam odio eos ab odio. Ab qui et ea quae quibusdam dolor adipisci. Blanditiis amet delectus id quos. Quo dolores repellendus inventore occaecati. Excepturi pariatur voluptatibus hic molestiae asperiores aperiam.', 'Distinctio fuga sit quia. Aut enim ut nesciunt voluptatem architecto. Quaerat ut cum sed voluptatum. Id quas aliquid voluptatem odio quae et. Consectetur pariatur non et sed ab. Exercitationem cum voluptatum molestias. Ut et consectetur incidunt.', '72251', '81', 'percentage', '2020-06-28', '2020-09-20', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(13, 'Corrupti.', 'Inventore delectus.', 'Atque dolorem omnis quae impedit. Laudantium et et voluptatum ipsa est unde. Labore quibusdam molestias assumenda voluptatum nihil omnis optio. Doloribus commodi hic fugit. Consectetur corrupti cumque odit consequatur occaecati tempore. Minima et commodi in odit placeat eaque.', 'Doloribus minus earum laudantium recusandae adipisci doloremque sit repellendus. Placeat ullam vitae eligendi consequatur. Vitae quod sit hic sapiente non quia. Veritatis consequuntur labore qui sit.', '41586', '20', 'percentage', '2024-06-25', '2025-02-27', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(14, 'Sed inventore.', 'Et ipsam voluptatum.', 'Corrupti eum occaecati molestiae est minima quia. Et iure qui non debitis. Eum velit perspiciatis similique laboriosam et doloribus facere explicabo. Dolores et aperiam eos veritatis sit voluptas voluptatem. Vero repudiandae nemo impedit omnis doloribus et nam. Et deserunt nemo aut consequatur.', 'Adipisci distinctio sit est enim voluptas. Hic dolorem nihil quaerat. Eaque dolores unde suscipit enim. Fuga ratione nisi enim quae. Sed adipisci repellendus ea delectus vero maxime. Et repellendus cum dolore.', '16185', '13', 'percentage', '2024-07-16', '2024-12-10', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(15, 'Voluptates rem id.', 'Aut neque quidem.', 'Id culpa nulla ut rem. Deserunt ad enim exercitationem qui. Sit et iusto quod aspernatur natus et et. Molestiae qui vel praesentium quod quia natus non ut. Voluptate voluptatibus qui possimus in. Autem consequuntur quod eos odio deleniti eaque pariatur. Qui optio non blanditiis est.', 'Voluptas eum voluptate hic harum dolorem. Nisi repellat numquam facere aliquam qui. Pariatur excepturi voluptatem perspiciatis id sunt consequatur. Nesciunt fuga quis voluptas optio ducimus corporis. Ut eligendi et qui adipisci.', '39683', '8', 'amount', '2025-10-22', '2025-11-17', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(16, 'Nesciunt totam.', 'Ab repellat id et.', 'Quia nihil eligendi quis qui quis cupiditate quibusdam. Et rerum hic autem consequatur. Quia veniam qui cum sequi praesentium eum maiores iste. Ea est eius dolor id officiis. Perspiciatis beatae dolores fuga labore saepe.', 'Animi autem adipisci voluptatem sint reiciendis omnis ut nemo. Quia doloremque vero sapiente quibusdam. Fuga veritatis necessitatibus et eos et et qui. Ad autem reprehenderit dolorem quia odio enim ex.', '83722', '9', 'amount', '2019-09-27', '2021-04-02', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(17, 'Tenetur qui.', 'Eaque voluptatem.', 'Sit laudantium amet quidem iure neque adipisci vero. Sit accusantium qui eum eius labore. Quo quo iste fugiat inventore voluptate corporis possimus et.', 'Rerum molestiae nostrum commodi consequatur non incidunt. Velit et cupiditate cum quos. A quas eaque ipsa exercitationem et provident.', '28919', '14', 'percentage', '2020-07-06', '2022-08-01', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(18, 'Similique molestiae.', 'Qui quas nesciunt.', 'Non nihil hic omnis et et enim natus odio. Dolores praesentium suscipit fuga provident nulla. Autem neque harum odio tempore. Ut et neque aut aut non qui voluptatem tempore. Et et ex harum atque omnis enim illum. Laboriosam aut est ut. Amet rerum id libero aliquid.', 'Minima adipisci vel amet dicta. Ipsam accusantium fuga voluptatem iusto a ab. Repellat vel accusamus aut adipisci inventore aut. Libero a voluptas beatae eligendi. Ex aut odio velit unde.', '3624', '70', 'amount', '2025-12-16', '2025-12-17', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(19, 'Quod id quia.', 'Fugit placeat alias.', 'Quaerat enim tempora iusto asperiores nam. Aut voluptatem quod tenetur deleniti voluptas. Aspernatur tempora quidem qui eos consequuntur qui. Exercitationem quisquam asperiores id quo et modi eum.', 'Aut esse qui inventore quae sint. Nostrum suscipit laborum officia voluptas voluptas inventore et. Molestiae maiores laboriosam possimus eius dolor.', '801', '62', 'percentage', '2020-10-17', '2021-06-16', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(20, 'Accusantium.', 'Necessitatibus quos.', 'Occaecati quaerat ad voluptatem blanditiis. Earum dicta tempora aut dolores nisi dolores enim. Rerum voluptates porro saepe atque labore eligendi.', 'Facere voluptates aut enim molestiae. Veritatis esse numquam enim ut totam. Vel non repudiandae et fugiat placeat. Ipsa ipsam fugiat enim dolorum unde dignissimos hic.', '54184', '82', 'amount', '2021-05-28', '2023-09-03', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(21, 'Aperiam excepturi.', 'Mollitia et.', 'Porro esse rerum voluptatem occaecati. Recusandae voluptatem eum omnis et non reprehenderit suscipit. Aut cupiditate tempore earum fugiat accusantium neque. Doloremque dignissimos ut ipsa quaerat quos et.', 'Quisquam iste repudiandae accusantium et et saepe. Sed distinctio qui id magnam ut unde. Et vel consequatur eveniet exercitationem voluptatibus facilis. Quibusdam et qui reiciendis cupiditate labore iusto.', '35801', '100', 'percentage', '2019-11-30', '2022-10-30', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(22, 'Ut tempore quos ut.', 'Sint dolor et.', 'Ducimus ut et unde delectus. Sed veritatis totam numquam soluta accusamus quidem. Sit laborum doloribus totam voluptas aut quidem. Et sed sint veniam culpa pariatur placeat magnam ex. Excepturi sit libero porro voluptas.', 'Deserunt doloribus libero occaecati ut eos. Et et consequatur dolorem qui. Ducimus ut officia eligendi facilis qui eos aspernatur. Aut consequatur itaque minus quasi.', '54923', '48', 'amount', '2024-05-07', '2024-12-08', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(23, 'Quam labore.', 'Quas et facere.', 'Assumenda assumenda soluta est quaerat. Aut et possimus quis sequi magni quam. Voluptas deserunt qui totam sit dolores est nisi. Incidunt voluptas excepturi quo dolores aut.', 'Quasi ipsam et facilis voluptas velit quam consequatur. Libero cumque non impedit sed illo voluptas quis. Soluta culpa aliquid minus ad.', '48270', '58', 'percentage', '2020-02-21', '2022-12-27', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(24, 'Nesciunt molestias.', 'Quam animi id sit.', 'Voluptas ut sunt ipsum quas perferendis rem et. Maiores aut eos esse ab. Quis qui suscipit iusto quis. Dolorum illum harum voluptatem aut officiis natus culpa. Quam et accusantium ut quasi voluptas. Itaque ducimus totam ratione qui rerum pariatur fugit. Asperiores adipisci iure dolores qui et.', 'Qui reiciendis maiores iusto adipisci aspernatur sint. Officiis consequatur cum totam asperiores eum aut. Est fugiat est quia fugiat. Voluptate praesentium sint aliquam fugiat.', '25060', '48', 'percentage', '2023-11-25', '2025-11-05', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(25, 'Ut deleniti qui.', 'Sint occaecati nam.', 'Vel sed omnis qui iusto ratione facere perferendis. Accusamus explicabo et modi exercitationem. Dolores labore qui adipisci amet autem. Nesciunt accusantium praesentium ad aliquid mollitia occaecati.', 'Aspernatur et voluptas quidem quis aliquid. Tempora distinctio adipisci occaecati molestiae qui amet quae pariatur. Animi deleniti aut est itaque ea rerum.', '88789', '36', 'amount', '2022-11-16', '2025-11-03', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(26, 'Dolor non eos.', 'Dolore quibusdam.', 'Debitis ex fugit dolore omnis. Est odio aut consectetur et nesciunt. Nisi eligendi praesentium dolores voluptatum.', 'Id repellat ea et rerum. Velit quis placeat labore reiciendis qui illo et. Aut voluptas omnis aliquam quis. A saepe perspiciatis velit nesciunt quidem repudiandae.', '65170', '51', 'percentage', '2022-07-06', '2025-03-16', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(27, 'Mollitia quod.', 'Reprehenderit.', 'Repudiandae dolorem ab nemo minima nisi eos. Ipsa suscipit qui labore magnam. Voluptatem harum necessitatibus dolor quibusdam sapiente est nobis. Qui reiciendis dolor corrupti neque amet. Natus explicabo ab et corporis nostrum commodi quaerat. Porro sunt quisquam architecto rem est.', 'Qui assumenda qui ut. Dignissimos impedit aperiam qui quis optio provident labore. Expedita nemo at quis repudiandae aut consectetur ut. In voluptas et et odit et. Ullam earum mollitia eveniet explicabo. Occaecati eum sint facilis accusamus commodi.', '79715', '32', 'amount', '2023-07-21', '2023-08-02', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(28, 'Magni corporis.', 'Error non suscipit.', 'Omnis ad deserunt omnis. Sit earum praesentium reprehenderit recusandae quis. Consequatur quia animi itaque perferendis vel accusamus.', 'Consequatur et incidunt dolores doloribus molestias ut. Veniam architecto necessitatibus dolores minima nihil. Repudiandae officia architecto tempore quo asperiores voluptas. Voluptates tempore minus quas fuga quae modi.', '24967', '75', 'amount', '2020-12-04', '2021-05-15', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(29, 'Facilis nostrum.', 'Tenetur ratione.', 'Explicabo quo odio consequatur qui rerum at sed. Voluptas amet nostrum et iste et. Qui accusantium id minima ut aut dolore non. Praesentium distinctio voluptate nesciunt autem omnis. Fugiat qui repellendus quo aut consequatur expedita incidunt. Vero corrupti placeat itaque qui excepturi.', 'Repudiandae eos corrupti sed. Aliquid nihil et aliquam ducimus rerum dolores et. Nostrum ad officia sed qui. Et repellendus nobis rerum non id qui. Ratione ab aut enim. Voluptatem est quis aspernatur. Dolorum sunt est impedit rem.', '27931', '25', 'percentage', '2020-03-13', '2020-04-25', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(30, 'Consequatur iste.', 'Tempore temporibus.', 'Eos eaque explicabo aspernatur voluptatem dicta voluptate. Quaerat vel soluta voluptatum necessitatibus numquam doloribus accusamus. Quibusdam ut quos illo. Sit consequatur voluptas qui nam ab ut tempore porro.', 'Aut dolores provident consequuntur esse deserunt qui. Qui consequatur aut ad est. Totam sunt quisquam amet dolor. Numquam maiores voluptas ut rem aut. Minus maxime et quia reiciendis ut consequatur. Aliquam dolores esse nostrum consectetur atque officia placeat.', '17070', '27', 'percentage', '2023-03-15', '2023-10-17', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(31, 'Aspernatur commodi.', 'Quis maiores.', 'Quasi et autem aut rerum dolores officia. Est aspernatur et in quas eaque voluptate. Ipsam qui sint et nesciunt earum eum voluptas odit. Expedita quasi rerum voluptas deserunt illo mollitia. Eum quia error alias velit et fuga. Distinctio veniam mollitia provident iste illo et tenetur.', 'Iste odio alias iste quaerat. Aut consequuntur sit sit rem consequatur. Beatae velit eaque ut dolorem. Aut soluta excepturi ipsa error quia. Eaque minima rerum quibusdam reprehenderit. Dolores non fugit rerum. Voluptate iure ullam consequatur ab.', '91203', '62', 'amount', '2021-02-19', '2022-09-16', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(32, 'Officiis voluptate.', 'Deleniti in itaque.', 'Blanditiis dolorem quia esse officia. Ut fugit et voluptas. Quam at et dignissimos autem mollitia. Quo iusto odio fugit animi est totam et. Id aliquam harum dignissimos animi. Dolorum ipsa eos accusantium ipsum deserunt aut modi.', 'Harum quos dicta ea quas nostrum dolorem nam. Aut cumque delectus pariatur non ut. Voluptas aspernatur aliquid voluptatem minima et accusamus. Iusto impedit laboriosam maxime expedita modi.', '34977', '37', 'amount', '2021-10-03', '2023-10-12', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(33, 'Deleniti.', 'Et voluptas itaque.', 'Itaque recusandae quas voluptatem repellendus modi excepturi consequatur. Veniam qui nam animi. Quia repellendus ipsum itaque et.', 'Blanditiis nulla tempore veritatis quia reiciendis cupiditate hic. Porro deserunt ex minima dolore. Natus unde qui sint quae. Ea magni ut ut qui ratione.', '75', '16', 'amount', '2023-12-30', '2025-04-10', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(34, 'Rerum quo molestias.', 'Eum alias.', 'Iure minima ut et quo fugit tempore iure qui. Hic animi eum totam vel ut. Beatae nobis perspiciatis dolorem earum illum excepturi. Excepturi ut cupiditate voluptas voluptatum. Est ducimus cumque beatae rerum. Possimus omnis et quo occaecati.', 'Aut et laudantium inventore. Sunt vitae ipsam qui non tenetur qui. Vel fuga consequatur ut explicabo accusamus incidunt sapiente.', '88794', '80', 'amount', '2025-06-23', '2025-09-14', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(35, 'Aspernatur.', 'Nostrum et.', 'Qui repellat aut fugit aut quibusdam odio. Libero in fuga reprehenderit aut. Animi ipsam doloribus autem. Aliquam consectetur dolores molestiae possimus.', 'Et quam cumque ab sit. Pariatur harum ut qui eveniet. Voluptatibus praesentium sit enim quis.', '43325', '28', 'percentage', '2024-05-27', '2025-01-18', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(36, 'Tenetur ipsa.', 'Ex porro ab quam ut.', 'Magni incidunt architecto doloribus sit sint fuga ipsum. Et harum expedita et nam dolores nihil corrupti. Enim recusandae exercitationem totam quo dolorum. Et et minima non doloremque. Dolores quibusdam nobis non maiores ducimus et molestiae. Adipisci aut doloremque qui quis illo.', 'Quidem sit eos nulla sed ea odit. Dignissimos temporibus culpa tempore exercitationem reiciendis. Corporis debitis quia aliquam ex non eius aut. Assumenda neque voluptatem quibusdam at ea. Dolore nihil doloribus hic quasi. Rerum a sunt iste nisi.', '89961', '40', 'percentage', '2022-02-25', '2023-03-25', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(37, 'Ut hic rerum earum.', 'Et in et accusamus.', 'Est animi itaque placeat harum atque autem nihil veritatis. Eos consequatur autem deserunt recusandae aliquid. Quos modi praesentium animi laudantium aliquid. Quisquam et est exercitationem. Sit ab et quasi qui iste ad. Consectetur hic accusamus non dolorem. Nemo sit ea earum quo omnis accusantium.', 'Vitae culpa et excepturi atque recusandae enim dolorem non. Consequatur sed tenetur laboriosam laborum ducimus non ratione. Officiis eum labore quidem atque.', '98733', '100', 'amount', '2022-02-05', '2022-04-06', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(38, 'Officiis esse.', 'Quis maxime autem.', 'Tempore quia quod est incidunt architecto laborum. Id est ducimus aliquam quam tempore quo veritatis et. Veniam a aliquam autem tempora est nesciunt. Velit doloribus optio ut.', 'Quo qui consequatur amet corporis perspiciatis sapiente. Qui commodi nemo a. Blanditiis voluptatem cum adipisci et. Incidunt corrupti ipsa non nam est est expedita.', '62373', '30', 'percentage', '2024-11-10', '2025-09-09', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(39, 'Magnam provident.', 'Perferendis veniam.', 'Tempore quo voluptas voluptas autem officia pariatur et. Laboriosam illo debitis qui eius. Aut consequatur minus adipisci quo. Sunt minima fugit doloremque eos. Et illum autem vitae adipisci et. Similique nisi consectetur deleniti et laborum laboriosam libero vero. Qui qui omnis impedit autem.', 'Odit et et laudantium dolore. Ab illum qui quia nisi. Magni quo et corrupti nihil vel qui et. Sunt perferendis eum numquam impedit eos dolores praesentium. Repudiandae expedita vero natus aliquid distinctio. Eum recusandae reprehenderit ab quis ipsam.', '66880', '38', 'percentage', '2022-04-05', '2023-04-26', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(40, 'Reiciendis.', 'Dolorum illo aut.', 'Est quo beatae ipsum autem quis sed officiis aspernatur. Eius quo ullam id accusantium exercitationem. Facilis recusandae atque eum nam autem voluptatibus. Reiciendis cum corrupti ipsam provident ea voluptatem iusto.', 'Saepe porro omnis deleniti ut praesentium eos. Suscipit nulla hic quia velit quaerat. Sed culpa et aut esse. Quisquam sed cumque veniam magnam qui. Harum culpa quae dolore dolores. Minus nobis nisi ipsam qui consequuntur et aut dolore.', '51919', '89', 'percentage', '2025-03-19', '2025-06-29', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(41, 'Quaerat reiciendis.', 'In in et soluta.', 'Excepturi adipisci ea excepturi ut veritatis. Voluptatem in placeat sed quod dolorem error. Laudantium et ut odit quia earum neque. Molestiae optio sapiente dolor fugit saepe.', 'Enim architecto molestiae distinctio maxime sunt. Modi aperiam culpa eaque et tempora soluta omnis. Corrupti omnis commodi eius sit tempore itaque. Quis velit vero molestiae magni aliquid reprehenderit. Nihil quia est ut et.', '9653', '90', 'amount', '2024-04-09', '2024-04-11', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(42, 'Sunt praesentium.', 'Nobis non ut.', 'Voluptatibus modi et assumenda dolores. Ratione non totam expedita qui. Est est temporibus et est expedita modi ipsam.', 'Veniam exercitationem temporibus consequatur qui quis dicta et sed. Eos unde ipsum corporis cumque odio explicabo. Eum aperiam voluptatem quasi quas delectus maxime nulla accusamus.', '68056', '58', 'amount', '2020-04-22', '2025-08-19', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(43, 'Delectus nemo fugit.', 'Quae reiciendis.', 'Ut sit modi et. Id voluptates unde voluptatem quasi sed ab temporibus facilis. Magnam aliquid deserunt architecto ut.', 'Est blanditiis ut ad aut rerum qui in nihil. Omnis praesentium sed est recusandae. Fugit at unde voluptas mollitia totam esse delectus. Ad natus architecto et commodi. Nemo nihil molestiae aperiam. Id qui non itaque aut omnis et.', '37229', '66', 'amount', '2025-04-26', '2025-07-04', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(44, 'Qui dolor eos nobis.', 'Ut corporis.', 'Tempore ab et molestiae voluptas consequatur totam quia. Iste ea impedit sed atque. Facere doloremque et asperiores porro culpa quibusdam doloribus. Dolor incidunt saepe harum et dicta. Quidem ducimus dolorem aliquid cum est qui ipsa. Eum ea qui dicta quasi.', 'Eius aut excepturi voluptates soluta. Eligendi consequuntur veniam officiis modi et quam. Recusandae est non tempora rerum esse nostrum. Earum quidem enim harum qui sed.', '73478', '68', 'amount', '2022-11-11', '2024-02-09', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(45, 'Voluptate ut.', 'Consequatur.', 'Facilis ut et praesentium fugit. Et necessitatibus repellat at atque tempore laudantium amet officiis. Optio sint dolores esse reprehenderit quis accusamus natus rerum.', 'Velit veniam nam vitae laboriosam quo et voluptas. Corporis fugiat ut itaque. Laudantium totam quia consectetur beatae ad. Nihil ea qui error incidunt.', '83924', '90', 'amount', '2024-11-25', '2025-03-08', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(46, 'Doloribus nulla.', 'Iure eos.', 'Adipisci dolore distinctio ea ipsum. Sunt quaerat voluptatibus expedita. Totam autem soluta quidem sed praesentium. Consectetur aut asperiores soluta ea laudantium at veritatis. Repellendus totam blanditiis reiciendis omnis porro aliquid. Ea accusantium et cupiditate.', 'Aut dolores consectetur quae ratione. Numquam dolore voluptatem consequatur. Voluptatem qui voluptatem fuga cum ut quaerat. Qui iste excepturi nulla et. Maxime ea velit id quisquam est rerum. Asperiores eos iste nisi ut rerum. Nihil possimus aut omnis laboriosam. Iusto quae ipsam quo qui aliquam.', '91562', '46', 'percentage', '2023-01-13', '2025-11-28', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(47, 'Ut quia facilis.', 'Laboriosam.', 'Sit et amet doloribus id. Quasi occaecati repellat culpa ducimus enim. Qui vero alias tempora sapiente explicabo tempore dignissimos perspiciatis. Debitis esse facilis quis voluptas consequatur voluptates.', 'Doloribus quia provident molestiae et. Officia numquam aut aut exercitationem maiores consequatur ut. Veniam exercitationem sit architecto eaque dolor debitis eum sint.', '62720', '59', 'percentage', '2025-09-12', '2025-12-03', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(48, 'Doloremque qui.', 'Mollitia sit atque.', 'Ut ut voluptas et beatae. Ratione minima eum ducimus voluptatem maiores. Commodi dicta accusantium ea repellat. Accusamus dignissimos laborum rerum.', 'Voluptatem alias quia cumque repellat. Aspernatur ducimus id eaque quia pariatur a. Illo ullam excepturi perspiciatis dolores numquam autem molestiae dolorem. Accusamus perspiciatis nemo soluta atque et facere. Delectus assumenda nisi recusandae. Est praesentium eos et ut.', '81473', '8', 'percentage', '2019-05-31', '2022-06-16', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(49, 'Ipsam esse illum.', 'Nobis tempora.', 'Consequatur eligendi omnis neque reprehenderit pariatur voluptatem. Commodi rerum occaecati ducimus adipisci quae animi. Fugit et debitis est consectetur ex perspiciatis. Ut qui quasi facilis sapiente.', 'Quas aut reiciendis cum veritatis nihil rem impedit. Delectus qui dolor sunt aut eum ab. Aut dolorem alias labore cum nihil magni sunt. Dignissimos minima aut est quas dolorem. Odit harum et excepturi dicta ipsum optio. Debitis maiores illum sed.', '38350', '83', 'amount', '2023-01-08', '2025-11-20', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(50, 'Qui voluptatem.', 'Eligendi non aut.', 'Sunt et quae voluptatem est soluta rerum velit. Enim rem magnam quam rerum. Voluptas est et alias ratione est. Alias iusto molestiae iste dolores totam voluptatum. Iure accusamus voluptatibus repellat magni. Nemo ad aut ex aut animi quo. Necessitatibus neque dolore consequatur voluptas assumenda.', 'At vero voluptas vel autem est. Assumenda inventore qui suscipit sed. Doloribus enim quia dolor hic neque a est velit.', '60281', '79', 'percentage', '2021-07-07', '2023-01-13', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(51, 'Sit facere hic quae.', 'Qui eos eos.', 'Quia asperiores iste et. Enim ad adipisci est dolorem. Dolores odit laborum rerum reprehenderit est voluptatum quaerat. Sapiente autem nesciunt nisi omnis. Quia rerum similique neque culpa id accusantium. Deserunt nam corrupti repudiandae facilis et nam. Aperiam aut eaque et quia ut dicta.', 'Nostrum quis unde consequatur repellat reprehenderit consequatur vel. Possimus ipsa velit qui ut. Quibusdam excepturi quas in quas veritatis. Aspernatur nulla porro delectus labore quibusdam dignissimos.', '57028', '23', 'amount', '2022-08-03', '2023-09-11', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(52, 'Eius et voluptas et.', 'Praesentium.', 'Iure possimus cumque velit dolor quam id. Explicabo consequuntur illum unde id qui. Et dolor eum animi ratione praesentium dolorem.', 'Aut laborum asperiores et velit corporis perferendis. Aut totam facere autem et est. Quae temporibus labore veritatis dicta incidunt. Necessitatibus ea dolores reprehenderit. Unde id rerum et quia ipsa hic ipsa aut.', '83773', '35', 'percentage', '2023-09-23', '2025-01-11', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(53, 'Ipsum molestiae.', 'Sed sed fugiat.', 'Nulla similique et ad architecto quae dolorum error. Nihil omnis eius assumenda consequuntur exercitationem autem est. Non excepturi qui nihil iste. Corporis optio voluptatem modi. Minima aspernatur ea et occaecati consequatur molestias quia. Omnis aut velit soluta omnis consequatur voluptas fuga.', 'Dicta minima incidunt et ipsa et deleniti. Et cum velit voluptatem nisi et. Consequatur harum ut vero voluptatibus doloremque. Sit fugit non commodi. Omnis et voluptates ipsam exercitationem quam quia. Officiis id alias a est consequatur iusto autem.', '40348', '29', 'amount', '2022-09-04', '2023-05-17', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(54, 'Delectus aspernatur.', 'Repellat eius minus.', 'Ratione labore et rerum et porro mollitia reprehenderit. Maxime pariatur est excepturi qui natus debitis est. Dolor animi est voluptates quas voluptas. Quod aut est quibusdam placeat eligendi.', 'Aut voluptas reiciendis quaerat odit facere harum. Eum quasi consequuntur pariatur unde fugit. Ullam dolorum quaerat animi minus aspernatur incidunt.', '942', '87', 'amount', '2020-06-08', '2022-05-21', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(55, 'Expedita nesciunt.', 'Eligendi tenetur.', 'Dolores eaque fugit ut ullam consequatur ullam odio. Quae consequatur ut omnis aut. Nostrum est sint qui esse ducimus omnis voluptatem occaecati. Facilis ut in ullam eos. Placeat magni culpa soluta id soluta repellat. Fuga facere quaerat et quidem. Aut sint aperiam ad accusamus officia a.', 'Necessitatibus ipsa quidem quisquam voluptatem. Voluptas quod praesentium vitae dignissimos reiciendis. Eligendi aperiam voluptates consectetur ipsum ad incidunt ad.', '42866', '71', 'percentage', '2024-12-05', '2025-10-20', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(56, 'Doloribus alias eum.', 'Voluptas.', 'Mollitia reiciendis similique aut dolore qui. Magnam rerum quisquam molestias assumenda accusamus laboriosam. Soluta id quam reiciendis ducimus non consequatur et nemo. Cupiditate dolore doloribus quisquam asperiores beatae. Rem dicta qui ab et.', 'Est nihil culpa veritatis id. Amet sint laborum quasi ab quaerat accusantium. Aut non debitis ducimus maiores modi nesciunt vel. Est eveniet necessitatibus omnis quod culpa. In aut consequuntur id et aut. Nesciunt in non id et molestiae aspernatur non voluptatum.', '29317', '91', 'amount', '2022-12-14', '2023-06-01', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(57, 'Porro non tempore.', 'Vitae harum dolor.', 'Possimus optio fugit omnis aut. Nostrum explicabo libero maiores sapiente. Sit illo tempora illum. Ut voluptate veritatis molestias maiores. Id et eius ullam voluptatem. Velit consequatur rem sint omnis et quas ipsam.', 'Qui tempore ullam repellendus quo. Natus quae quia maiores sit natus tempora sapiente. Cum et qui quod voluptas consectetur.', '48468', '81', 'amount', '2022-10-09', '2024-02-06', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(58, 'Id distinctio quos.', 'Eos aspernatur qui.', 'Quam nam accusamus iusto necessitatibus dolor dignissimos doloribus. Eum mollitia explicabo ullam dignissimos. Ex consequatur saepe reiciendis voluptatem nemo. Dicta aut est dicta officiis.', 'Iusto quidem quo a perspiciatis modi. Eligendi molestias corrupti consequuntur in perferendis. Iure sunt tempore ut architecto. Ea sunt facilis ut. Sequi eos eveniet ipsam quo. Et nemo facere aut vel quis soluta. Neque deleniti quae ut modi.', '63617', '6', 'amount', '2020-08-25', '2021-07-06', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(59, 'Magni voluptas.', 'Vel non non qui aut.', 'Consequuntur quibusdam ut placeat dolorum doloremque id. Voluptates qui quisquam magnam sequi quidem rerum fuga. Expedita ea qui architecto maiores non. Ipsam nesciunt culpa atque enim praesentium perferendis. Officia culpa voluptatem veritatis ducimus et ut velit.', 'Mollitia reiciendis tenetur voluptatibus. Ut architecto aut accusantium sed doloremque. Et necessitatibus consectetur ipsam animi suscipit minima.', '74277', '69', 'percentage', '2021-10-23', '2021-12-10', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(60, 'Et tempore est.', 'Ab ex nam aut qui.', 'Facilis sed fugiat provident accusantium. Quia minus mollitia repellat velit. Dignissimos magnam sed voluptatem quaerat eos tenetur itaque.', 'Non ratione voluptas beatae veritatis est. Sapiente quam non voluptas autem blanditiis est voluptatem repellat. Natus sit deleniti consequatur unde consequatur velit qui.', '89374', '90', 'amount', '2025-04-15', '2025-11-23', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(61, 'Cumque quam facilis.', 'Asperiores quae.', 'Cumque dignissimos itaque ut eaque exercitationem sint. Sunt commodi pariatur inventore numquam qui aut nulla ut. Perferendis possimus vel dolores praesentium. Asperiores aspernatur ex esse cum laborum.', 'Non iste explicabo ex commodi aut. Odio quia exercitationem dolor dolores. Eligendi sunt consequuntur omnis quo totam qui. Inventore aut aliquid quibusdam rerum placeat sed tenetur.', '42306', '87', 'amount', '2024-06-04', '2025-12-29', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(62, 'Nemo quo expedita.', 'Omnis tempora.', 'Sunt aut asperiores qui voluptas deserunt itaque sint. Laboriosam commodi odit eligendi molestiae debitis. Qui commodi consequatur ut ad.', 'Quo sit fugiat debitis qui et voluptas tempore. Et tempore sed occaecati error illo excepturi. Libero autem qui quos porro quas est quia. Ipsum vel molestias libero et sed ex quas. Ut et necessitatibus quo excepturi.', '60238', '90', 'percentage', '2019-02-18', '2022-06-11', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(63, 'Accusamus dolores.', 'Enim voluptatibus.', 'Commodi iusto et non nostrum. Nobis non molestiae qui. Quis ipsa et praesentium odit. Asperiores accusamus dolor rerum nisi est eos labore. Ratione totam optio atque minima.', 'Hic cupiditate veniam et a enim ut. Aliquam dolores sequi est nesciunt odit culpa. Et non aut voluptas magnam ut. Vitae molestias maxime inventore non veritatis nulla et. Delectus velit itaque aut architecto.', '19457', '0', 'amount', '2022-06-08', '2023-01-10', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(64, 'Blanditiis.', 'Esse harum fugit.', 'Expedita et maiores odit rerum omnis et aperiam. Quas culpa hic at maxime voluptate atque. Ullam nobis aliquid quae. Voluptatem quam pariatur expedita similique odit.', 'Aut et et earum velit provident consequatur. Nihil eum ea delectus. Temporibus minus sequi atque doloribus modi architecto. Et sit voluptatum odio hic nemo aspernatur eum. In eum est eos aliquam blanditiis est qui.', '54156', '27', 'amount', '2025-03-07', '2025-12-28', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(65, 'Architecto ut.', 'Sint perferendis.', 'Sit tempora reiciendis est non omnis corrupti. Iure architecto officia laboriosam inventore. Necessitatibus officiis et temporibus quia dolorum cum. Quos aliquam harum voluptatem dolores totam atque cumque.', 'Harum vel quas est quod nemo non ipsam. In nesciunt sapiente quia vel repudiandae quasi. Quis perspiciatis veniam iste. Esse dolor id numquam quaerat culpa accusamus culpa beatae. Laboriosam a nisi cum excepturi.', '89155', '99', 'amount', '2022-12-04', '2024-05-02', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(66, 'Et excepturi et.', 'Est quia.', 'Libero sunt voluptatem autem et aut minima. Minus incidunt ea amet quaerat aut. Distinctio quidem perferendis molestiae et consequatur laborum odio. Totam qui et temporibus.', 'Ratione quos ut labore id in ea. Ullam eos atque enim distinctio. Rem aspernatur sed maiores ipsa. Illo quis molestiae nobis neque molestias aut.', '65060', '99', 'amount', '2021-08-18', '2025-10-26', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(67, 'Sit modi.', 'Id qui laborum quis.', 'Quia non dolores aliquam dolor ipsam eum in. Odio error eius corporis assumenda quia illo. Inventore et ullam et culpa fuga aut reiciendis. Occaecati officia voluptatibus eum numquam. Sint magnam molestias ut tenetur. Aspernatur quas et officia reprehenderit. Dolor assumenda repellat optio.', 'Labore ut aut dolores esse fugiat. Quibusdam molestiae quae exercitationem fuga. Quos veniam odit enim voluptates nisi. Repellendus ipsum ut sit natus pariatur. Adipisci nihil eos animi optio sed illum dolorum labore.', '18909', '95', 'amount', '2022-06-08', '2024-08-11', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(68, 'Voluptatem quod.', 'Esse sunt porro.', 'Voluptatem numquam sunt iusto odit a. Facere aut nulla quibusdam reiciendis. Ipsam architecto pariatur at repellendus quis commodi ex. Beatae sed natus et.', 'Quis ea numquam excepturi est quasi sed corrupti nulla. Eum cum temporibus magni et numquam id. Repellat quisquam aut dolores iure error ullam autem. Sit tempore sit enim dolor. Labore pariatur cum corporis asperiores sapiente velit asperiores eius. Sed corporis aliquam fugiat est et ea modi.', '50699', '49', 'percentage', '2025-07-18', '2025-12-04', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(69, 'Odit nemo expedita.', 'Dignissimos et ad.', 'Ducimus voluptatem in dolore dolores ad. Adipisci distinctio totam est laboriosam. Quod adipisci qui magni temporibus velit. Iusto molestiae reprehenderit animi omnis nulla ab.', 'Vel et ullam cum aspernatur rerum est facilis. Quia est ducimus aut sint error. Vero iusto et doloremque velit.', '1652', '60', 'amount', '2020-10-23', '2021-03-14', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(70, 'Qui accusantium.', 'Dignissimos atque.', 'Voluptas beatae vitae omnis nisi nihil quo et sit. Eos magni est consectetur rem consequatur enim eos. Maxime nobis nemo aliquam provident sit repellendus reprehenderit. Dolores rerum dignissimos aspernatur illum iusto eveniet alias.', 'Vel eos est blanditiis non aperiam officiis similique delectus. Eos est autem ea est recusandae voluptates repellat quas. Molestiae commodi ut sunt et.', '24475', '38', 'amount', '2024-07-06', '2025-07-17', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(71, 'Vitae eius.', 'Nobis architecto.', 'Dolorum cum molestias fugiat libero consequatur. Totam vel voluptate quo. Quas sunt eaque perspiciatis quia. Sed id totam necessitatibus tempora et sint. Et ad omnis ut eum. Culpa dolor qui explicabo exercitationem ea et. Odio ut hic et magni facere.', 'Dolore et quaerat velit quas expedita. Nihil sint numquam aut voluptate eligendi similique. Unde dolorem sed possimus corrupti qui quas. Nesciunt sed libero animi aliquid. Ad tenetur distinctio nemo illum maiores similique expedita.', '23206', '3', 'amount', '2022-08-19', '2024-04-04', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(72, 'Aut aperiam.', 'Reiciendis sequi.', 'Inventore esse fugit tempora at id. Repudiandae repudiandae dolorum laudantium soluta maiores numquam ut. Illum et doloremque rerum in id ut in odit. Dolorum ipsa quos ullam omnis. Nihil at et sequi aliquam ipsa sint omnis. Similique necessitatibus laborum voluptas. Delectus sed ducimus veritatis.', 'Cupiditate sapiente nesciunt culpa ab velit. Voluptates exercitationem praesentium officiis delectus. Ea totam odit possimus nobis laborum. Facilis accusantium laboriosam quia voluptas consequatur laboriosam quo.', '16084', '82', 'amount', '2024-10-13', '2025-10-09', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(73, 'Ea ratione pariatur.', 'Qui nulla est.', 'Quia eum necessitatibus sit velit consequatur. Ut et qui architecto quibusdam ducimus aliquid.', 'Vitae quia dolorem sed minima perferendis. Rem animi enim ex quae eaque. Necessitatibus eaque quae omnis aut sit voluptatem. Eos nisi deleniti natus cumque.', '28766', '99', 'percentage', '2021-03-03', '2023-08-16', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(74, 'Non quis labore.', 'Expedita delectus.', 'Aspernatur sit quo repellat sit ex recusandae doloribus. Sint ut at culpa iure voluptates. Quam illum sequi corporis totam blanditiis omnis magni. Ipsam modi minus dolorem impedit suscipit.', 'Iure nobis voluptatem non. Molestiae omnis alias maxime nisi. Perferendis occaecati aut architecto. Accusamus totam perferendis officia. Vero necessitatibus ullam facere nisi eligendi. Inventore iusto nobis illum deleniti earum numquam. Vel aperiam excepturi quis possimus rerum.', '66650', '63', 'amount', '2024-08-21', '2025-08-12', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(75, 'Provident quasi.', 'Rem tempora soluta.', 'Corrupti et quas facere tempora. Exercitationem perferendis deserunt quisquam in qui. Sunt et nemo culpa earum dolorum enim. Et possimus id voluptate. Corrupti quia et rerum fugit.', 'Cumque delectus nihil ut est accusamus. Omnis distinctio et nemo voluptas deleniti. Est dolores doloribus alias molestiae eum. Porro magnam labore voluptas laborum aperiam id.', '38633', '7', 'amount', '2025-01-30', '2025-06-16', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(76, 'Doloremque.', 'Cumque illo.', 'Accusantium tenetur quis ad in dolorem eaque. Tempora impedit amet provident exercitationem provident pariatur. Quasi omnis illo ex. Expedita autem dignissimos delectus doloremque. Et dolorem quo soluta autem ut omnis. Ullam et et rem velit. Labore ut vero rerum assumenda accusamus eius et.', 'Quia nihil quibusdam suscipit. Incidunt aspernatur cupiditate explicabo omnis minus quaerat recusandae. Reiciendis reiciendis in praesentium cupiditate.', '22011', '40', 'amount', '2024-08-06', '2025-08-27', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(77, 'Tempore et dolorem.', 'Illum et voluptatem.', 'Omnis a consectetur quasi modi ut et qui. Qui rerum sed facere consequatur repudiandae. Et voluptas id quis commodi. Accusamus occaecati tempore vero soluta omnis voluptatibus. Iste voluptatibus placeat a aut id minima dolorem non. Qui dolorum voluptas alias et ducimus voluptatibus repellat.', 'Ratione dolores rerum officia ut numquam magnam et. Quia porro alias eaque. Praesentium nihil nihil exercitationem. Quas quod quod dignissimos neque ex deleniti. Quis nulla rerum magnam illo in. Cumque recusandae rerum ea eos est. Consequatur ea cupiditate maxime molestias facere velit.', '28468', '32', 'amount', '2025-12-09', '2025-12-18', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(78, 'Tempora aliquam.', 'Unde dolorem iste.', 'Magnam nostrum aspernatur laborum minus dicta rerum necessitatibus repellendus. Pariatur repudiandae suscipit earum est et. Sit sequi nobis sunt inventore vitae deleniti iure.', 'Cumque et nulla commodi harum et. Voluptatem et eius nemo est mollitia eos corporis. Unde ullam reiciendis qui ut molestias. Omnis possimus est cumque aut labore. Doloribus vitae culpa velit et similique.', '71019', '37', 'amount', '2020-03-25', '2025-09-21', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(79, 'Fugit error.', 'Culpa reiciendis.', 'Ratione aliquam doloribus reiciendis mollitia nobis provident iure eos. In amet nostrum harum doloribus. Quibusdam voluptas ipsam omnis enim. Id ratione veritatis ipsa possimus accusantium fugit laborum. Dolore labore quia provident. Porro reiciendis dolor dolorem. Delectus quasi sit minima illo.', 'Mollitia et nostrum repellendus. Ut rem aut magni magnam ducimus. Illo corporis cupiditate quam consectetur enim magni maiores. Laudantium voluptatem assumenda itaque voluptatibus. Et et ea quas eveniet. Voluptatibus ea illo perspiciatis. Magni quia amet in illum nesciunt omnis labore.', '51435', '79', 'amount', '2021-09-04', '2022-01-14', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(80, 'Repellat dolore.', 'A perferendis.', 'Adipisci suscipit maxime mollitia officia in. Occaecati voluptas sunt nostrum exercitationem ut. Doloribus aliquid sequi consequatur voluptatem fugit est.', 'Sunt eum cupiditate non dolor ipsam. Doloribus distinctio saepe explicabo ad. Animi ducimus voluptatum ut cumque odio. Quo quibusdam tenetur possimus cumque iure. Dolorum sed expedita eaque optio explicabo et magnam. Quaerat perspiciatis qui dolorem sequi est.', '47048', '90', 'amount', '2025-09-01', '2025-10-18', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(81, 'Omnis voluptas vel.', 'Excepturi omnis.', 'Dolorum fugit possimus aliquam voluptatibus adipisci. Magnam nostrum tempora qui cupiditate ratione molestias occaecati. Assumenda et mollitia omnis error rerum id. Laudantium sit dignissimos consequatur nulla sit voluptas soluta. Nemo voluptatem consequuntur non velit.', 'Quod aliquid quam possimus non ad ad ut eligendi. Unde ut et ut culpa. Qui fuga ut atque laborum. Debitis quaerat voluptatem ducimus assumenda adipisci tenetur et modi.', '93763', '1', 'amount', '2020-09-19', '2025-08-22', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(82, 'Sed et quis rerum.', 'Dolore officiis.', 'Qui harum eos nihil qui esse. Iste at commodi et maiores tempora officiis. Omnis architecto est doloribus labore natus soluta. Eius provident iusto optio rerum praesentium autem.', 'Quam sed assumenda ut est velit necessitatibus. Hic corporis molestiae necessitatibus rerum. Ut illum rerum excepturi voluptas numquam expedita. Eius eum alias est autem facilis iste molestiae. Eaque voluptate et et est aliquid vitae. Dolor assumenda exercitationem in laudantium dolor.', '74964', '33', 'amount', '2022-05-16', '2025-10-30', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(83, 'Eaque fugiat.', 'Vero quis numquam.', 'Blanditiis voluptas neque quibusdam consectetur iusto vel. Commodi magnam sapiente fuga magnam eos. Eveniet necessitatibus nostrum voluptatibus voluptatibus porro. Aliquam error rerum velit reprehenderit. Aut aperiam veritatis et quasi numquam dolore.', 'Placeat veritatis ut dolores aliquid omnis rerum ullam. Ab dolorum ad iure est eveniet ut fuga. Qui quia nam iusto nostrum quasi error quia.', '40834', '53', 'percentage', '2024-09-15', '2025-01-20', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(84, 'Quo ipsam quis sit.', 'Deleniti laudantium.', 'Et ea tempora corrupti voluptates delectus non autem. Omnis veniam quo reprehenderit ut.', 'Rerum et quia non. Ea sapiente vitae autem eaque. Ut nisi necessitatibus rem qui. Aut voluptas quaerat nihil quaerat. Harum temporibus quas itaque molestias aliquam provident. Laudantium hic odio dolorem recusandae dolor minus.', '48398', '80', 'amount', '2023-04-05', '2023-07-19', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(85, 'Voluptas excepturi.', 'Voluptas quia.', 'Veniam ab quam aliquid molestias dolorem eaque in. Harum a iste eaque eaque eius. Beatae ut quia quod magni optio cum id. Aliquam dolor tempora aliquid est laudantium. Inventore labore nam ipsum sapiente omnis. Qui error eos ducimus fuga sunt. Aut et et odio enim.', 'Omnis quo quae ab molestiae labore. Ut sunt deleniti a dolores voluptatem. Et illum quis quia aut nulla explicabo maiores. Magni facere dolores quaerat porro repudiandae veritatis quisquam.', '13212', '52', 'amount', '2022-12-09', '2025-02-19', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(86, 'Omnis veritatis.', 'Quia blanditiis.', 'Recusandae impedit dolores qui earum. Rerum ut rerum sed. Consequuntur sequi dignissimos illo. Consectetur pariatur dolorem dignissimos rerum consequatur dolorem enim. Nobis et nostrum enim dicta. Impedit numquam cupiditate et voluptate. Dolorem et molestiae aut velit atque occaecati iste.', 'Et nemo quis voluptatibus consequuntur reprehenderit minima nisi aliquam. Et perspiciatis aliquid reiciendis ipsam voluptates ducimus. Ex qui dolores harum magni corporis rerum.', '51633', '28', 'percentage', '2025-01-21', '2025-09-30', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(87, 'Molestiae atque.', 'Ducimus est.', 'Quasi rerum a aut quod nisi deserunt. Id similique ea vel et. Consectetur vel dicta facilis sed rerum totam consequatur. Quisquam perspiciatis dolore voluptatem sint.', 'Labore accusamus in quas cupiditate sint. Eos id incidunt et. Officia explicabo voluptatum sed ut omnis. Nesciunt quo nobis quisquam molestias nostrum laborum doloribus.', '77985', '73', 'percentage', '2023-01-04', '2023-06-16', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(88, 'Quo delectus.', 'Ipsum ipsa nisi et.', 'Quo provident rem dolorem ut iure accusamus sequi. Nostrum nemo sint necessitatibus neque fugiat odit. Autem ab rem aspernatur. Esse itaque sed optio. Earum sint sed id repudiandae aut est non.', 'Iure ullam rerum explicabo sequi ab voluptas quam. Natus expedita corrupti esse quis repudiandae. Magni recusandae assumenda nisi. Vel odio vel eius illo non. Deserunt nam nulla deserunt iste laudantium maxime fugit veritatis.', '24315', '93', 'percentage', '2021-11-16', '2023-01-20', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(89, 'Id animi ipsum ut.', 'Qui debitis.', 'Sint qui nesciunt delectus. Omnis dolores dolores cupiditate excepturi eos. Nam dolorem ut dolore corrupti occaecati. Voluptas labore aperiam dolorum magnam earum adipisci soluta. Et dolor tempora quo excepturi enim. Numquam corrupti quod voluptatem atque quos velit.', 'Corrupti doloribus qui officiis et minus voluptatum qui. Velit at inventore dolorem ipsam. Quibusdam distinctio recusandae et quidem et.', '57207', '31', 'percentage', '2021-08-19', '2024-07-27', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09');
INSERT INTO `offers` (`id`, `name_ar`, `name_en`, `text_ar`, `text_en`, `coupon`, `discount`, `type`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(90, 'Reprehenderit earum.', 'Voluptatum enim.', 'Placeat reiciendis est eius beatae hic qui quaerat. Amet et enim veniam optio esse. Et qui animi rerum distinctio qui accusantium sint. Id et voluptatem quam et distinctio porro. Veniam ut non numquam. Aliquid ea quisquam nihil nihil. In vel reiciendis aut suscipit. Aut dolores eius ea.', 'Nam a quia expedita optio aut repudiandae aut maiores. Natus saepe iusto dolores sit harum ut assumenda. Ad et et repellat incidunt sunt deleniti veritatis. Consequatur qui itaque eveniet. Dolorem adipisci officia sit reiciendis eaque.', '48040', '74', 'percentage', '2024-04-14', '2025-02-10', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(91, 'Incidunt eos.', 'Cumque repellendus.', 'Explicabo sint laboriosam aspernatur. Recusandae est perspiciatis at qui et blanditiis voluptate. Et aliquid quibusdam harum aliquid minus. Itaque quas magni nostrum architecto.', 'Ut est non ex iste autem odit id. Reprehenderit ipsam deserunt voluptatem est. Commodi beatae iure quas ipsa enim.', '61762', '21', 'percentage', '2024-01-06', '2025-09-15', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(92, 'Architecto.', 'Culpa sed eum ab.', 'Est quam adipisci autem ipsa deleniti consequatur. Possimus deserunt dolorem suscipit quis. Maxime omnis animi et et pariatur.', 'Qui ea non ut fugiat alias fuga. Deleniti provident quisquam et quod natus in fuga officiis. Ut quisquam sint molestiae. Accusantium distinctio aliquid est dolores aut. Qui illum sit labore aliquam. Maiores consequatur dolores nemo impedit qui culpa.', '53025', '45', 'amount', '2020-02-16', '2025-12-28', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(93, 'Eveniet.', 'Aperiam harum ullam.', 'Dignissimos reiciendis nemo id officia aut corrupti. Maiores et repudiandae atque non consequatur. Reprehenderit ut et velit doloremque aut. Et officia quibusdam non accusamus assumenda repellendus similique labore.', 'Voluptatem et ut perspiciatis nisi hic dolorem. Voluptatem similique quo repellat qui. Saepe porro voluptatem pariatur fuga aut aliquid nemo. Cum et quia aut animi qui alias non. Omnis modi enim aliquid tenetur deleniti deleniti neque modi.', '89815', '52', 'percentage', '2024-08-16', '2025-06-24', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(94, 'Dicta numquam nihil.', 'Facilis sequi dolor.', 'Doloremque delectus esse et. Quod est quam explicabo vel molestiae repellendus. Mollitia similique laudantium officiis explicabo et. Maxime occaecati est earum id vitae aliquid. Ex nihil repellendus officia atque earum.', 'Id perferendis recusandae eius maiores. Suscipit non debitis esse et. Incidunt eum et perspiciatis labore voluptatem voluptatem eius. Quasi eos expedita ea distinctio non molestias. Maxime enim velit ut quo quas numquam voluptatem. Dolorum delectus omnis eveniet aut culpa porro ducimus.', '35827', '65', 'percentage', '2024-05-04', '2025-03-04', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(95, 'Sunt et laudantium.', 'Ut fugit quos sed.', 'Magni autem optio aut. Ex placeat voluptatem voluptatem eos ea. Voluptatem quaerat quasi voluptatibus consectetur. Vitae commodi et aliquid odio quia repellat et. Ut earum modi nesciunt eveniet. Est dolor dolore omnis qui voluptatem. Sunt maiores eum laboriosam id.', 'Fugiat minima sed beatae. Eius molestias error harum. Aspernatur perspiciatis aut qui aut voluptatem unde omnis praesentium.', '48782', '88', 'percentage', '2020-02-09', '2021-07-05', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(96, 'Sit soluta aut.', 'Eos reiciendis sit.', 'Impedit quia facilis quod assumenda aliquid. Quia et veniam et. Quidem sit ad architecto vero sint accusamus. Soluta itaque sunt optio vero ratione repellendus.', 'Voluptate enim adipisci sequi maiores eius dolorem. Voluptatem quae quia in quis atque saepe et. Eum odio pariatur beatae tenetur recusandae aspernatur. Vero sit voluptas eos ut sit voluptatem incidunt. Sit exercitationem soluta rerum est voluptatem alias nostrum distinctio.', '28496', '44', 'amount', '2019-12-25', '2020-05-24', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(97, 'Veritatis sit.', 'Nostrum facere.', 'Fuga non molestiae molestiae. Vel ut aut odio aut. Enim asperiores pariatur beatae consequatur quia ut perspiciatis. Vel ipsum vitae velit nostrum doloribus fugiat. Velit debitis ratione aspernatur omnis. Est cumque ut non. Non iste aut iure atque nobis dolor possimus.', 'Voluptatum cum blanditiis vitae illo vero et nulla. Ut dolores dolorum sed consequatur molestiae asperiores adipisci. Deleniti occaecati harum eveniet odio qui quaerat pariatur omnis. In molestiae perspiciatis velit nisi qui. Et dolore assumenda optio eum dolorum voluptates.', '66693', '10', 'amount', '2023-04-08', '2025-02-28', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(98, 'Facere incidunt id.', 'Consequuntur qui.', 'Porro sit dolorum omnis incidunt voluptatem. Quam numquam consequatur iure est laborum et at architecto. Ex voluptatem inventore architecto reiciendis incidunt corrupti excepturi.', 'Aut rem minima est suscipit earum sed. Non quas voluptatem odit est dolorem hic. Debitis consequatur molestiae cumque sit in pariatur. Reiciendis laboriosam vel aliquam animi qui et. Aut eum vero quo cum. Temporibus deleniti harum architecto voluptatibus officia.', '77814', '94', 'percentage', '2021-03-09', '2024-04-29', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(99, 'Ut accusamus id sed.', 'Est aut et.', 'Quae placeat quod at inventore voluptas. Nesciunt fugit voluptatem nisi pariatur ea dolorum minus. Cupiditate blanditiis autem eius consequatur id nostrum. Autem eos illum cum. Saepe est ea excepturi enim eaque.', 'Perspiciatis qui ut adipisci enim. Omnis et a in molestias nihil soluta earum. Aliquid molestiae nam nulla. Consequatur eum aliquid et reprehenderit rerum corrupti nesciunt.', '15371', '27', 'percentage', '2022-11-02', '2023-04-18', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(100, 'Vitae cumque.', 'Quia nesciunt qui.', 'Qui illo omnis assumenda qui laudantium tenetur enim. Reprehenderit consectetur et ullam inventore ea. Necessitatibus molestiae a magni facilis porro eum et in. Repellendus non sequi natus nihil et et est fuga.', 'Libero inventore ipsa in reprehenderit. Consectetur eos non et quam. Quia aliquam numquam enim exercitationem. Esse quo ut quisquam ea non velit tempora. Aut consequatur sed et explicabo.', '16395', '87', 'percentage', '2024-10-19', '2025-06-01', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(101, 'Ut eum veniam quia.', 'Libero assumenda.', 'Alias commodi placeat ut iusto. A esse eos nihil facilis. Provident consequatur sint nesciunt labore excepturi. Voluptatem autem rerum deleniti. Suscipit molestias voluptatum officia voluptate ut. Quibusdam ut distinctio voluptates.', 'Et repudiandae rerum unde voluptas modi ipsam omnis. Pariatur neque assumenda non in quidem qui et eum. Dolor illo pariatur similique maiores sed.', '93512', '41', 'percentage', '2021-06-21', '2025-04-21', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(102, 'Exercitationem qui.', 'Voluptate repellat.', 'Omnis aut voluptates rerum consequuntur tempora consequuntur. Ea corporis sunt nihil quibusdam nam hic. Cum voluptatum accusamus et quasi. Corrupti consectetur ut perspiciatis. Ad facere amet animi magni. Similique modi aut qui magni inventore omnis.', 'Aliquid et assumenda eveniet et non et et. Sed nihil alias voluptatem velit amet. Sed eos repudiandae non a rerum omnis ex sed. Optio consequatur unde iure excepturi.', '45488', '3', 'amount', '2022-07-19', '2024-08-22', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(103, 'Nulla neque.', 'Quam non dolorem.', 'Corporis cum nihil perspiciatis unde et incidunt. Voluptatem temporibus nam autem dolorum praesentium maiores. Architecto ex quibusdam et est fugit eius.', 'Nulla qui eum maiores iste nobis non. Minima enim sequi ea. Excepturi voluptas consectetur natus animi exercitationem adipisci est. Quia qui voluptas voluptatum sit sunt ut.', '47393', '53', 'amount', '2023-12-02', '2025-01-31', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(104, 'Sit excepturi quo.', 'Voluptas numquam ut.', 'Aut minus tempora laboriosam accusamus reiciendis necessitatibus. Impedit quia ratione similique explicabo dolor. Consequatur eius non et voluptatum dolorem. Non eaque voluptas placeat quia qui sed.', 'Reiciendis eos ad aliquam beatae molestiae. Enim necessitatibus aperiam excepturi et quia vitae. Dicta sequi sint modi quaerat. Ut unde doloribus in voluptas aut non ea. Laboriosam excepturi et qui quod. Ut repellendus sequi veniam nemo qui.', '68368', '93', 'amount', '2021-11-06', '2025-03-13', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(105, 'Accusantium minus.', 'Provident impedit.', 'Vel possimus harum qui. Possimus est architecto sit enim sint totam et. Eos et ut placeat veritatis quasi. Veniam cumque totam ducimus.', 'Aut asperiores ut perspiciatis earum fuga. Soluta nostrum minus alias. Ratione soluta illum quos qui. Et a doloremque sapiente nam magni. Et excepturi rem et voluptatibus repellat et veniam. Alias eius dolorum adipisci occaecati non magni. In alias reiciendis esse et dolor.', '81868', '44', 'amount', '2022-07-20', '2024-05-06', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(106, 'Non dolor.', 'Soluta dolorem.', 'Sunt similique laborum nobis eos cumque. Iusto harum libero totam et. Placeat quisquam et sapiente. Aut minus ut omnis iure et. Fugit at voluptate voluptatem eveniet aut et. Et id ex sapiente quasi sunt. Nobis expedita at iusto id eum soluta.', 'Animi rerum id ducimus quis perspiciatis quia numquam. Et provident inventore voluptatem nobis. Inventore vel in ea dolor ut qui consequatur. Qui qui porro aut et et.', '58359', '38', 'amount', '2020-01-28', '2024-06-29', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(107, 'Dolorem tempora.', 'Deserunt aut qui.', 'Libero et minima sit. Facilis cupiditate quas et ut et. Voluptas sint repellendus sed neque veritatis. Corrupti reprehenderit deserunt reprehenderit. Earum voluptatem et ut quia.', 'Perferendis ratione eos ratione exercitationem aliquid molestias. Beatae fugit ea explicabo nulla. Asperiores non et non quia non. Non repellat dignissimos dolorem quam est sequi aut.', '2242', '19', 'percentage', '2021-09-07', '2023-08-25', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(108, 'Et non natus.', 'Dolorem error qui.', 'Nihil incidunt cumque et commodi. Commodi perspiciatis et est in. Eligendi eos id veniam corporis. Eum eligendi provident eligendi et. Facere et ea nisi dolor quaerat reprehenderit. Cum corporis ut cum voluptatibus. Eos quo placeat placeat qui eaque tempore quisquam.', 'Et et voluptatibus itaque. Facere est alias fugiat quam porro magni. Aut iure aut voluptate voluptatibus. Placeat facilis et repellendus quisquam officiis beatae. Corrupti quo eos consequatur nesciunt et ut.', '81938', '64', 'percentage', '2020-11-13', '2023-09-27', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(109, 'Quo ut nihil.', 'Voluptas molestiae.', 'Ea quia laboriosam est occaecati adipisci. Assumenda deleniti vitae labore. Minus et quia quo animi quia labore. Sint vel amet impedit suscipit harum eum voluptates.', 'Quam rerum voluptas est eos et. Quaerat quae illum dolor dicta doloribus beatae aliquam. Eum recusandae nulla expedita quis provident. Nisi excepturi fugit dolores exercitationem asperiores sequi sint.', '85566', '39', 'amount', '2025-07-17', '2025-11-22', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(110, 'Repellendus quia.', 'Sed et animi cumque.', 'Quasi magni eaque explicabo distinctio. Quisquam doloribus dicta quis labore maiores doloribus eligendi sed.', 'Dolores vel tempora ut sit. Placeat deserunt vel reprehenderit debitis qui. Et nisi omnis ad voluptates accusantium assumenda. Deserunt minima soluta nobis odit placeat harum distinctio illo. Deserunt rerum cupiditate ad repellat laborum totam. Debitis et quasi nobis fugit.', '81614', '71', 'amount', '2023-02-14', '2023-06-11', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(111, 'Ab soluta id aut.', 'Sed odit alias.', 'Illo cumque temporibus provident. Quisquam ducimus omnis asperiores et quis. In sint dignissimos error veritatis eum. Architecto amet corrupti iusto totam cumque architecto. Tenetur asperiores quisquam amet quasi ducimus. Quo ut est at consequatur sed et. Facilis dignissimos velit dolor laborum.', 'Incidunt nisi recusandae ut cum. Eaque iste est assumenda voluptatem ea illo ab est. Veniam inventore doloribus consequatur id facere. Minima qui similique eaque est quidem veritatis fuga.', '7801', '47', 'percentage', '2020-09-26', '2024-09-10', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(112, 'Sed sint aspernatur.', 'Dolores in.', 'Sed eius quis a quo ut repudiandae. Rerum repellat nostrum quia quia non suscipit. Minus est qui non placeat rerum ex. Qui iste asperiores aut libero adipisci. Voluptatem aut nulla non magni est molestiae beatae. Voluptas repellendus eligendi et voluptate.', 'Accusantium minus perspiciatis qui dolorem. Natus est omnis et ipsum amet. Quo expedita provident quaerat impedit qui aperiam sed. Et maxime molestiae debitis deserunt accusamus et veniam. Numquam aliquam quaerat tempore ratione accusamus. Debitis laborum culpa ullam maxime natus fuga est voluptas.', '4911', '98', 'percentage', '2021-05-12', '2024-05-24', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(113, 'Eveniet ut eveniet.', 'Qui omnis molestias.', 'Qui perferendis atque modi sed veritatis non vitae. In deleniti illo eum laboriosam. Sunt animi consequuntur id temporibus accusamus maiores. Fuga quod maxime unde totam esse. Omnis nam numquam culpa sunt et. Tenetur distinctio est eum voluptatem officiis.', 'Nihil ipsa adipisci corrupti laboriosam dignissimos rerum asperiores. Ut ut eum voluptatem necessitatibus. Qui eligendi et maxime dolorem numquam. Rerum maiores a sit molestias optio. Facilis eos omnis repellat quo qui maiores. Est ut ex dolorem eum.', '2596', '47', 'percentage', '2023-10-21', '2024-10-24', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(114, 'Molestiae unde qui.', 'Rem veniam corrupti.', 'Occaecati at et et nam voluptas velit. Nesciunt hic voluptas aliquam. Et et placeat voluptatibus voluptas quibusdam debitis. Vel architecto ea aut. Cumque nulla quo aliquid incidunt neque inventore dolore sed.', 'Aut corrupti est voluptas nostrum quia commodi. Doloremque vero commodi aut eum. Commodi enim quia omnis sed dicta et est.', '33170', '58', 'amount', '2019-12-26', '2022-01-03', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(115, 'Molestiae labore.', 'Eveniet qui eaque.', 'Officia ipsa ut itaque adipisci. Autem velit consequatur quia. Quasi quia ducimus assumenda quaerat consequatur. Vero cum labore illo et repellat et illum. Ratione quae quibusdam adipisci quis. Repellendus officiis modi id molestias qui. Facilis praesentium eaque mollitia hic.', 'Quia sit quia harum blanditiis rerum debitis. Eligendi corrupti earum enim molestiae aut reprehenderit et quia. Deleniti eveniet quibusdam ea totam placeat vero nisi. Minus atque impedit consectetur omnis illo.', '23914', '70', 'amount', '2019-04-11', '2025-09-13', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(116, 'Tempora nulla earum.', 'Dolores ut neque.', 'Tenetur fuga qui sint voluptas quia. Nemo voluptas atque pariatur voluptatum error consequatur quae. Eligendi ipsum expedita dicta illo. Quia voluptatem culpa molestias aperiam et omnis. Ratione harum ab exercitationem eum quibusdam veniam.', 'Repudiandae aspernatur praesentium iure optio eveniet. Nisi at aut laborum laudantium omnis ut. Ad dolorum ea ut vel odit quia repellat officiis.', '78513', '19', 'percentage', '2023-06-29', '2025-12-03', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(117, 'Veniam qui nihil.', 'Perferendis nam.', 'Ut ea repellat illum consequatur. Cupiditate eius sed vel. Distinctio illum harum voluptatum totam. Omnis pariatur ut et quis. Fuga officia aperiam temporibus voluptatem asperiores quidem ducimus. Sed quos officiis id et officia debitis. Praesentium ut vel et molestiae culpa reprehenderit.', 'Autem est illum error non ut voluptatibus nobis ratione. Accusantium magnam inventore et enim. Tempore commodi numquam dolor rerum quisquam. Consequatur natus facilis dolor voluptas dignissimos velit. Labore iste natus aut omnis.', '16746', '27', 'amount', '2019-01-24', '2023-12-19', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(118, 'Natus laudantium.', 'Eum quidem adipisci.', 'Veritatis vero sunt occaecati ea molestiae provident. Eveniet aut consequuntur quis. Minus illum nemo accusantium aut sint qui eaque. Sed rerum assumenda aut consequatur.', 'Minus et ea soluta eligendi dolores. Iure deserunt dolores ut facilis libero eos. Eveniet omnis ratione est nemo. Omnis nostrum doloribus recusandae non quibusdam dignissimos. In soluta et eaque reprehenderit. Soluta ex modi qui laboriosam quam facere. Alias cumque nam sit sit.', '48352', '4', 'percentage', '2020-03-19', '2024-10-12', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(119, 'Iste magnam quod.', 'Iusto tenetur nam.', 'Omnis omnis nisi odit adipisci qui nihil debitis. Occaecati consequatur deserunt expedita officiis fugit consequuntur impedit voluptates. Esse aut porro odit dicta vel cum ipsum. Magni accusamus provident consequatur ad voluptatem.', 'Similique quam nihil reiciendis alias dolorum ut dolorem. Provident quod eum voluptate hic deleniti dolorem. Saepe vitae aliquam distinctio possimus autem ab. Veniam quo nam ipsa voluptatum enim.', '52669', '39', 'percentage', '2019-06-04', '2020-08-13', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(120, 'Sed fugiat optio.', 'Officia dolore non.', 'Quidem dolore dignissimos velit est laudantium exercitationem. Ducimus hic pariatur nulla quam assumenda incidunt. Quas dolor et sint excepturi eaque voluptatibus. Quia neque inventore optio sit autem.', 'Dolorum porro omnis quam magnam eos aut et. Voluptates cum dicta asperiores eum distinctio. Velit suscipit molestiae dicta. Nihil rem voluptatibus aliquid.', '64558', '98', 'percentage', '2019-09-30', '2024-09-09', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(121, 'Amet et eaque ipsam.', 'Nostrum animi.', 'Incidunt id sit amet enim molestias exercitationem. Iste rerum est officiis laudantium quo et. Qui mollitia veniam voluptas est voluptates. Deleniti possimus totam ut laudantium exercitationem.', 'Occaecati rerum est explicabo repellat fugiat. Consequatur aperiam ipsam natus maiores nesciunt totam doloribus. Ipsam id non doloribus consequuntur aut hic praesentium aliquam. Et qui amet aut et officia.', '58570', '68', 'amount', '2024-10-31', '2025-07-09', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(122, 'Unde quia nemo amet.', 'Praesentium dolore.', 'Nihil et ipsum iure commodi. Laboriosam sed dolorum ullam occaecati temporibus ipsum et. Laudantium et qui culpa voluptatem. Aut provident unde ipsam tempore. Sunt numquam similique earum distinctio. Possimus eos ut nihil eaque. Molestias suscipit earum ipsam sit ut voluptatem.', 'Vitae fugiat molestiae soluta. Qui et mollitia est. Laudantium dolores et nihil laborum est est. Optio et nobis a animi dolorum id. Non accusamus nemo nam sed ut sit. Quisquam ad ab voluptatem quo ut. Eum ipsum vel dolores ut ut.', '84640', '41', 'percentage', '2020-07-06', '2025-08-21', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(123, 'Blanditiis velit.', 'Illo nihil quod.', 'Et velit a qui possimus. In numquam exercitationem nulla alias vero. Explicabo libero aliquam nesciunt reprehenderit molestias qui.', 'Voluptatem eaque incidunt ipsum odio ipsum quam quos nesciunt. Dignissimos quis ab officiis soluta excepturi deserunt fuga. Corrupti sunt aut dolorem aut. Expedita qui rerum ut natus.', '146', '3', 'amount', '2024-04-04', '2025-09-08', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(124, 'Dolor laborum iusto.', 'Et minus voluptatem.', 'Dicta dolor dolores tempore dolorum adipisci. Asperiores et facere odio est. Consectetur fugiat maxime voluptatem dolorum molestias ut blanditiis. Non dolore corporis dolor possimus iste perspiciatis a. Ut esse sed iste ad. Rerum qui quos ut pariatur nulla.', 'Rem quos ea qui similique ea nihil. Eos sed recusandae vero rem. Id ratione perspiciatis omnis quia adipisci sed aut a. Est recusandae consequuntur inventore itaque quia sunt quia. Enim ea adipisci repudiandae eius perferendis dolores.', '20701', '55', 'amount', '2024-07-06', '2025-09-16', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(125, 'Corporis et rerum.', 'Modi veniam sed.', 'Est rerum commodi aut. Occaecati ab minus nulla ipsa voluptates. Adipisci nulla sunt hic animi eos recusandae optio. Consequuntur ea sed aspernatur quos.', 'Possimus possimus ab dolorem deleniti earum esse. Adipisci enim iste rerum non dicta. Aspernatur non sunt aut sit ducimus mollitia consequatur. Harum et expedita quae quas sed ut blanditiis.', '23934', '98', 'percentage', '2023-04-05', '2025-05-11', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(126, 'Velit voluptas sed.', 'Iusto ut illum.', 'Quia et omnis debitis voluptatem. Quia autem perferendis autem doloribus fugiat suscipit minus eum. Totam asperiores provident quia quia voluptatum. Dolores inventore excepturi eos architecto voluptatem sint et.', 'Dignissimos placeat nihil ipsa accusamus accusantium. Pariatur dolores temporibus repudiandae in neque ut. A aliquid reprehenderit ut consequatur non sit velit. Nostrum qui quod sequi ipsam odit.', '49328', '19', 'percentage', '2023-10-19', '2024-11-29', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(127, 'Blanditiis enim.', 'Veritatis tenetur.', 'Ut accusantium molestiae ab et culpa. Qui odio in modi magnam et quas ipsam. Rerum in doloribus et consequatur. Qui similique eos voluptatibus corporis accusamus. Iste itaque sequi est eligendi non similique. Qui qui beatae amet quis.', 'Perspiciatis repudiandae rerum optio est labore. Est delectus sapiente in animi a. Dolorem nostrum asperiores et magnam repellendus. Iure fugiat omnis commodi quod repellendus veritatis et.', '95018', '20', 'percentage', '2019-04-05', '2020-03-20', 'deactivated', '2020-01-16 11:54:09', '2020-02-26 12:13:46'),
(128, 'Enim ducimus ut.', 'Quaerat eum velit.', 'Magnam aut et quae neque iusto odio ipsum. Enim veniam omnis voluptatem commodi eos qui sunt. Molestias fuga sapiente veritatis illo dolor minima ut. Voluptatem ut voluptatem et recusandae animi. Voluptatum voluptatibus neque iste.', 'Expedita architecto asperiores molestiae eum temporibus. Commodi omnis sapiente culpa aut optio voluptatem. Et nihil id nemo laboriosam corporis eum non. Corporis et qui deserunt. Accusantium id voluptatem aut quibusdam architecto. Occaecati id et repellat ipsa expedita.', '33335', '78', 'percentage', '2023-10-09', '2025-02-15', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(129, 'Qui labore sit.', 'Mollitia.', 'Sapiente illum doloribus eum molestiae quisquam fugit. Dicta eos dolorum cupiditate. Illo aliquid ducimus omnis sunt doloribus. Molestias sit in sequi ut est.', 'Eius velit blanditiis fugit explicabo exercitationem labore. Sit quia similique vitae. Aut consectetur tempore est enim dicta asperiores illo.', '7385', '82', 'amount', '2022-08-31', '2024-10-07', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(130, 'Aliquid tempora.', 'Quam et eveniet ut.', 'Laborum explicabo ipsum nostrum. In quis reprehenderit laudantium omnis aut. Et accusamus est laborum cum. Consectetur quis quis minus est. Ut et qui nihil autem saepe. Qui nesciunt eius est velit aperiam.', 'Assumenda distinctio accusamus quia soluta facere. Delectus quas aliquam nam ipsum illum ullam sapiente. Quidem a temporibus nesciunt et placeat. Eos dolores iste nisi optio unde amet.', '38325', '75', 'amount', '2022-12-12', '2023-09-24', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(131, 'Voluptatem.', 'Dolorem et.', 'Consequatur recusandae recusandae ipsa laborum earum. Provident distinctio consequatur voluptatibus et dolorem fugit. Consequatur vel libero reiciendis et.', 'Sint sit aperiam adipisci ut aperiam quam eum. Quis quia qui cum fugit commodi. Qui ut enim placeat quasi est repellendus.', '33651', '93', 'percentage', '2019-03-05', '2025-05-19', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(132, 'Sint aliquam aut.', 'Deserunt qui nemo.', 'Sit ut qui neque sapiente. Et rem est eaque explicabo voluptas repellat. Dolor explicabo est velit eaque autem voluptatem. Aut non assumenda nisi illum qui enim eveniet. Nihil in et omnis et dolorum et itaque. Quia et consequatur inventore minima quos.', 'Voluptatem beatae dignissimos consequuntur. Eligendi dicta hic rem id voluptas quas.', '83472', '86', 'amount', '2022-07-04', '2023-06-02', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(133, 'Consequatur ipsa.', 'Corporis iste.', 'Eius quis adipisci atque quia pariatur accusantium. Tempore numquam ea voluptatem laudantium. Voluptas et iusto dolores magnam accusamus. Enim dignissimos perspiciatis nihil et. Voluptas aut est et sit autem.', 'Explicabo veritatis sit dolorum ut voluptate ex vel qui. Distinctio ullam beatae et rem ipsam. Accusamus placeat sint ullam labore error. Id minima veniam quibusdam molestiae. Laudantium officia corrupti dolorem voluptas assumenda inventore reprehenderit.', '94656', '29', 'percentage', '2025-08-15', '2025-11-28', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(134, 'Dolor qui et.', 'Quia omnis quia.', 'Quas sit molestiae et nisi earum accusantium. Debitis nulla sed qui. Est reiciendis eum non cum dolorem inventore facilis. Est necessitatibus et dolor magnam consequatur.', 'Assumenda ut aut omnis occaecati. Sapiente est velit ut aut esse quo. Ut quod ut similique consequatur.', '41392', '11', 'amount', '2024-01-30', '2024-01-30', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(135, 'Repellendus dicta.', 'Eum magnam eveniet.', 'Aut voluptatem ducimus quo modi. Voluptate ullam explicabo sed non et harum tempore. Nostrum laborum illum omnis sint eligendi quod et. Tenetur consequatur est aperiam provident enim perferendis.', 'Soluta in dicta officia consectetur accusantium quia. Et et unde ut dolorem enim. Rem dolores eligendi non dolore sunt harum corporis. Fuga sunt hic vero in soluta suscipit amet.', '72390', '54', 'percentage', '2023-06-04', '2023-08-20', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(136, 'Impedit sit sequi.', 'Ut neque ducimus.', 'Voluptas impedit corporis corporis vel vitae repellendus et. Quas quo earum alias aliquam doloremque ratione nulla voluptatum. Est possimus officia numquam ex. Earum nesciunt et beatae.', 'Laudantium suscipit cum placeat quia facere et omnis ipsam. Hic corrupti ut sunt ut rerum tenetur rerum. Praesentium quos odio voluptas ut cumque quo velit. Hic voluptas corrupti porro voluptas consequatur placeat eius ut.', '41298', '25', 'amount', '2025-09-22', '2025-12-28', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(137, 'Quia voluptas et.', 'Cumque dignissimos.', 'Saepe minima voluptatem doloribus est. Ut reiciendis saepe ut et magnam velit. Velit repellendus sapiente ut hic. Necessitatibus quia non nulla laboriosam sapiente quam suscipit. Amet quo eos ut asperiores in ex recusandae. Quidem aliquam eum sed sint praesentium ut illo soluta.', 'Ut aut recusandae assumenda enim in. Corrupti et natus quo hic eaque. Nulla delectus aut assumenda. Neque rerum a rem. Atque iure iure et aut rerum autem minima alias. Repellendus error ab dolorum omnis inventore neque. Voluptatem sunt quas voluptatem sit. Quo dicta soluta odit nulla.', '18440', '48', 'amount', '2019-12-12', '2024-09-24', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(138, 'Et repudiandae.', 'Eos assumenda.', 'Qui ut et autem omnis sit nihil omnis. Voluptatem consequatur minus itaque ad dignissimos non. Et voluptas facilis molestiae exercitationem debitis sit nulla. Aut ea sit modi sint qui eum rerum id.', 'Inventore repellat eum voluptas quisquam accusamus adipisci nesciunt. Tempore aut in esse ut. Iusto sit quidem quod iusto. Ut libero laborum iste id consequatur. Aut aut fugit sed voluptatem. Reiciendis nulla consectetur quia nesciunt. Illum saepe impedit necessitatibus et.', '64501', '37', 'percentage', '2019-04-09', '2024-11-02', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(139, 'Magnam culpa iure.', 'Dolore ut odit qui.', 'Voluptatem qui omnis sit. Laboriosam facere est ducimus. Et voluptas ipsam ea voluptatibus id. Eius modi exercitationem amet est ut vero tempore. Et esse fugiat placeat voluptatem. Rerum voluptatem eveniet omnis tenetur libero explicabo.', 'In distinctio harum cum reiciendis ipsum cupiditate. Velit eum tempora dolores consequatur vitae nihil non quod. Velit ut accusamus ut nemo. Consequatur ea porro quis. Praesentium omnis nostrum sint sint eos est. Possimus aut architecto consequatur optio asperiores sed facere.', '4278', '8', 'percentage', '2020-10-09', '2024-01-28', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(140, 'Quisquam amet autem.', 'Laboriosam.', 'Asperiores aut et tempora non maiores corporis sint dignissimos. Inventore vel aut ut aliquam. Non eaque eum aspernatur molestias porro voluptas. At quo est facilis recusandae aut. Laudantium maiores rem cum provident. Error dolore id nostrum officia. Reiciendis et corrupti corporis natus.', 'Atque esse fugiat alias nam perspiciatis. Fuga recusandae quibusdam numquam non qui. Sint molestiae est nobis consectetur ut consequatur expedita.', '54844', '69', 'percentage', '2025-05-24', '2025-06-02', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(141, 'Ducimus maiores.', 'Delectus delectus.', 'Illum culpa quia omnis culpa. Dolor officia libero voluptas. Totam architecto numquam est ut qui corporis. Ut voluptatem veritatis similique vero. Voluptatem consequatur rerum possimus ut sunt nisi. Est itaque cum excepturi. Rerum natus accusamus quisquam veritatis.', 'Perspiciatis sed sunt dicta aut deserunt voluptatem consectetur. Consequuntur voluptatem ipsam dolor vel. Aut id itaque et ipsum quod totam recusandae sed.', '48772', '43', 'percentage', '2022-07-12', '2022-12-13', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(142, 'Voluptate assumenda.', 'Laboriosam quia.', 'Excepturi amet delectus architecto. Omnis omnis qui sed aut dignissimos illum. Nesciunt tenetur laboriosam alias quis illo et officia laudantium. In sit rerum numquam. Quo accusantium quis eum soluta et sint doloribus. Impedit facere et eaque praesentium possimus eligendi.', 'Autem labore odit debitis expedita veniam. Quis molestiae quas iste. Dolorem nesciunt autem voluptate doloremque alias. Pariatur est quae pariatur optio porro quas consectetur. Optio dolore fuga et aliquid. Voluptatem accusamus accusantium ut vel. Qui nam optio voluptatibus dolorem illum.', '41537', '3', 'amount', '2025-11-29', '2025-12-28', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(143, 'Sunt laboriosam.', 'Enim nihil.', 'Exercitationem consequatur voluptatem deleniti fuga corporis expedita et placeat. Facere repellat hic voluptas laboriosam qui necessitatibus tempore autem. Autem iure quia qui dolores repudiandae sed aliquid. Corporis autem vel assumenda error.', 'Hic nihil itaque ratione iure. Consequatur ratione rerum ea quia. Deserunt sequi sit suscipit nobis iusto. Consequatur officiis ea illum accusantium dicta. Laboriosam nihil amet possimus iure.', '77242', '45', 'amount', '2019-08-09', '2019-10-28', 'deactivated', '2020-01-16 11:54:09', '2020-02-19 08:21:34'),
(144, 'Sequi repellendus.', 'Officiis ut dolor.', 'Est ab nulla ducimus doloremque. Eveniet occaecati aut tempora qui et quam consequatur. Distinctio deleniti qui non consequatur nihil illum impedit. Facere ullam officiis sunt consequatur et molestiae. Et vitae consequatur et molestiae quaerat fugiat fugiat.', 'Recusandae id quo quo quibusdam et. Ab nobis ut est omnis omnis qui earum eos. Voluptas quasi necessitatibus quod molestiae cupiditate voluptas odio. Dolores hic dolor necessitatibus qui qui adipisci quaerat.', '64374', '38', 'amount', '2020-05-21', '2022-08-07', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(145, 'Odit maxime.', 'Et similique quas.', 'Ut eos quam assumenda quo. Nihil culpa facere laborum possimus eos quisquam. Voluptatum est asperiores non voluptas sed quis enim. Praesentium sequi vero voluptatem nisi ipsam. Est neque sed et delectus. Sapiente sunt libero facere sapiente. Id itaque consequatur atque at ea asperiores minima.', 'Voluptas voluptatem dolores ipsum qui nihil harum. Dolores est ab dolorem esse cum. Fugiat quis quas quisquam assumenda vero. Iusto aut architecto blanditiis sint enim.', '61903', '5', 'amount', '2021-12-16', '2023-02-09', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(146, 'Sed et et dolores.', 'Aut maiores ducimus.', 'Ex sed iure architecto et expedita eos molestiae et. Ut minima atque animi eligendi officia eum natus. Nobis impedit omnis architecto maiores at veniam. Autem labore et nemo. Vel vitae omnis dolorem et et odio sit. Velit veniam quibusdam non dignissimos inventore.', 'Et dicta unde repudiandae debitis occaecati neque architecto. Necessitatibus adipisci qui nemo deserunt quia voluptate ut sit. Inventore voluptatem corporis laudantium aut. Dolor occaecati id labore. Earum odit doloribus minima ipsum blanditiis vitae eveniet eum.', '60144', '65', 'amount', '2025-03-09', '2025-04-24', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(147, 'Eveniet et possimus.', 'Dolorum architecto.', 'Ab fugiat autem quia facere rerum quia consequuntur est. Eum et saepe magnam. Aut illo voluptatum est quisquam quas consequatur est.', 'Quibusdam est quae assumenda. Quo ut ex ab. Officia delectus amet enim. Eveniet vel animi officiis eius. Voluptatem quam dolorum rerum. Consequuntur fugiat sed et ad eum nam.', '69203', '20', 'percentage', '2023-05-07', '2023-07-02', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(148, 'Qui nam dolorum.', 'Id possimus commodi.', 'Et quia blanditiis fugiat. Modi quo eum sapiente quasi voluptas. Non dolorem voluptas animi id. Pariatur ipsa delectus velit. Ipsam voluptas architecto iste rerum recusandae aut error et. Voluptates odit vel facere ducimus. Iste non aut illo repellat voluptas.', 'Nobis dolorem voluptatem iusto quo unde dolore accusantium. Molestiae porro hic placeat quis mollitia. Non amet fugiat veritatis sequi molestiae libero. Error necessitatibus modi vel consectetur magnam.', '38829', '87', 'percentage', '2020-05-23', '2025-03-24', 'deactivated', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(149, 'Magnam recusandae.', 'Non quia enim quia.', 'Neque iste excepturi accusamus corporis officia dolorem odio. Quia aperiam recusandae quo culpa. Et non sit voluptatem ratione. Dignissimos amet aperiam magni. Nisi ut porro et rerum minus repudiandae. Expedita qui quaerat eum totam eum ut quam.', 'Quam non sunt et. Eius ut est quo quo commodi optio a. Eius possimus recusandae et eos eligendi. Rem et omnis omnis vero at dolorem aut doloremque. Nihil facere voluptates accusamus minima quasi itaque. Ab a ea sint quisquam.', '26780', '48', 'percentage', '2025-09-22', '2025-09-30', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(150, 'Nam saepe quas.', 'Vel eum incidunt et.', 'Error sapiente illo fugit sit dolores sapiente perspiciatis. Velit reprehenderit maiores cumque assumenda tempore ad molestiae. Rerum ipsum sit et possimus vero officiis ullam.', 'Vitae rem distinctio et qui. Eligendi eligendi repellendus repellendus magnam repudiandae. Corrupti officia cum est consequatur qui cupiditate debitis. Et quos a sit ea.', '96149', '11', 'percentage', '2019-03-05', '2021-03-14', 'active', '2020-01-16 11:54:09', '2020-01-16 11:54:09'),
(152, 'خصم جديد', 'new offer', 'خصم جديد', 'new offer', '65895', '30', 'amount', '2020-02-11', '2020-02-13', 'active', '2020-02-24 11:10:03', '2020-02-24 11:11:05'),
(153, 'عيد', 'uoi;', 'asf awedfgwegwr', 'gwergwrgwergwerg', '12257', '30', 'amount', '2020-02-14', '2020-02-29', 'active', '2020-02-25 09:51:50', '2020-02-25 09:51:50'),
(154, 'عيد الاضحيo', 'uoi;', 'fofoff', 'ffukfyukfyuk', '522252', '30', 'amount', '2020-02-05', '2020-02-29', 'active', '2020-02-26 11:14:49', '2020-02-26 11:14:49'),
(155, 'عيد الاضحيo', 'uoi;', 'fofoff', 'ffukfyukfyuk', '522252', '30', 'amount', '2020-02-05', '2020-02-29', 'active', '2020-02-26 11:19:45', '2020-02-26 11:19:45'),
(156, 'عيد الاضحيjrt6', 'W5JH', 'tje', 'trjtrjtrj', '55555', '30', 'percentage', '2020-02-15', '2020-02-29', 'active', '2020-02-26 11:20:20', '2020-02-26 11:20:20'),
(157, 'عيد الاضحيjrt6', 'W5JH', 'tje', 'trjtrjtrj', '55555', '30', 'percentage', '2020-02-15', '2020-02-29', 'active', '2020-02-26 11:21:25', '2020-02-26 11:21:25'),
(158, 'tehtrh', 'uoi;', 'asfasf', 'fasfas', '8782378378', '30', 'amount', '2020-02-21', '2020-02-29', 'active', '2020-02-26 11:22:27', '2020-02-26 11:22:27'),
(159, 'tehtrh', 'uoi;', 'asfasf', 'fasfas', '8782378378', '30', 'amount', '2020-02-21', '2020-02-29', 'active', '2020-02-26 11:27:47', '2020-02-26 11:27:47'),
(160, 'tehtrh', 'uoi;', 'asfasf', 'fasfas', '8782378378', '30', 'amount', '2020-02-21', '2020-02-29', 'active', '2020-02-26 11:31:36', '2020-02-26 11:31:36'),
(161, 'tehtrh', 'uoi;', 'asfasf', 'fasfas', '8782378378', '30', 'amount', '2020-02-21', '2020-02-29', 'active', '2020-02-26 12:07:57', '2020-02-26 12:07:57'),
(162, 'tehtrh', 'uoi;', 'asfasf', 'fasfas', '8782378378', '30', 'amount', '2020-02-21', '2020-02-29', 'active', '2020-02-26 12:08:07', '2020-02-26 12:08:07'),
(163, 'tehtrh', 'uoi;', 'asfasf', 'fasfas', '8782378378', '30', 'amount', '2020-02-21', '2020-02-29', 'active', '2020-02-26 12:08:21', '2020-02-26 12:08:21'),
(164, 'tehtrh', 'uoi;', 'asfasf', 'fasfas', '8782378378', '30', 'amount', '2020-02-21', '2020-02-29', 'active', '2020-02-26 12:10:26', '2020-02-26 12:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `agent_id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('new','on_way','arrived','approved','rejected','completed','rated','cancelled','paid','not_paid','checked') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent_description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` enum('cash','visa') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visit_fees` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `cost` double DEFAULT 0,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `rate` double DEFAULT NULL,
  `rate_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_now` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cancel_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refused_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `agent_id`, `city_id`, `category_id`, `offer_id`, `address`, `latitude`, `longitude`, `qr_code`, `status`, `description`, `agent_description`, `payment_method`, `visit_fees`, `discount`, `cost`, `date`, `time`, `rate`, `rate_comment`, `date_now`, `created_at`, `updated_at`, `cancel_reason`, `refused_ids`) VALUES
(1, 1, 2, 2, 4, NULL, '000', '30.1412526', '31.2781776', '', 'cancelled', '', 'completed', NULL, 0, 0, 0, '0000-00-00', '00:00:00', 0.5, NULL, '0000-00-00', '2019-12-17 15:58:11', '2020-03-03 11:21:59', 'انا حر', NULL),
(2, 1, 2, 2, 6, NULL, '000', '30.1412526', '31.2781776', '', 'completed', '', 'ejwj', NULL, 0, 0, 50, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '2019-12-18 10:49:32', '2020-02-16 12:51:31', NULL, NULL),
(3, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', '', 'xx', NULL, 0, 0, 50, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '2019-12-22 12:05:29', '2020-02-26 10:19:37', 'انا حر', NULL),
(4, 1, 2, 1, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', '', NULL, NULL, 0, 0, 0, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '2019-12-23 06:30:53', '2020-02-02 08:38:54', NULL, NULL),
(5, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'on_way', '', 'xx', NULL, 0, 0, 50, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '2019-12-23 07:57:55', '2020-03-10 12:56:29', NULL, NULL),
(6, 24, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', '', NULL, NULL, 0, 0, 0, '0000-00-00', '00:00:00', NULL, NULL, '0000-00-00', '2019-12-23 08:02:21', '2020-02-26 10:26:39', NULL, NULL),
(7, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2019-12-23 11:52:04', '2020-02-13 11:06:07', NULL, NULL),
(8, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2019-12-23 11:56:31', '2019-12-23 11:56:31', NULL, NULL),
(9, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', 'completed', NULL, 0, 0, 0, '2019-12-27', '20:55:25', NULL, NULL, '0000-00-00', '2019-12-24 07:05:09', '2020-01-26 11:57:22', NULL, NULL),
(10, 1, 8, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', '', NULL, NULL, 0, 0, 0, '2019-12-27', '20:55:25', NULL, NULL, '0000-00-00', '2019-12-24 11:19:51', '2020-03-11 10:49:14', NULL, '1,2,3,4,6,7,8'),
(11, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2019-12-27', '20:55:25', NULL, NULL, '0000-00-00', '2019-12-24 11:22:56', '2019-12-24 11:22:56', NULL, NULL),
(12, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'checked', '', 'on_way', NULL, 0, 0, 0, '2019-12-27', '20:55:25', NULL, NULL, '0000-00-00', '2019-12-24 11:24:13', '2020-02-13 13:26:18', NULL, NULL),
(13, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', 'on_way', NULL, 0, 0, 0, '2019-12-27', '20:55:25', NULL, NULL, '0000-00-00', '2019-12-24 11:24:21', '2020-01-26 11:13:57', NULL, NULL),
(14, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2019-12-25 08:23:41', '2020-02-05 14:49:33', NULL, NULL),
(15, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', 'completed', NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 08:04:55', '2020-01-26 11:32:40', NULL, NULL),
(16, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 08:05:00', '2020-02-18 09:19:38', NULL, NULL),
(17, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 08:11:34', '2020-02-18 09:24:19', NULL, NULL),
(18, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 10:36:09', '2020-01-05 10:36:09', NULL, NULL),
(19, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 11:14:49', '2020-01-05 11:14:49', NULL, NULL),
(20, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 12:35:33', '2020-01-05 12:35:33', NULL, NULL),
(21, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 13:45:43', '2020-01-05 13:45:43', NULL, NULL),
(22, 1, 2, 2, 6, NULL, 'obour', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2020-01-20', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 13:46:38', '2020-01-05 13:46:38', NULL, NULL),
(23, 1, 2, 2, 6, NULL, 'obour', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2020-01-20', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-05 14:28:41', '2020-01-05 14:28:41', NULL, NULL),
(24, 1, 2, 2, 6, NULL, 'obour', '30.1412526', '31.2781776', '', 'new', '', NULL, NULL, 0, 0, 0, '2020-01-20', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 07:32:01', '2020-01-06 07:32:01', NULL, NULL),
(25, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 11:35:26', '2020-01-06 11:35:26', NULL, NULL),
(26, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 12:40:27', '2020-01-06 12:40:27', NULL, NULL),
(27, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 12:40:57', '2020-01-06 12:40:57', NULL, NULL),
(28, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 12:46:27', '2020-01-06 12:46:27', NULL, NULL),
(29, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'completed', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 12:46:48', '2020-02-16 12:52:48', NULL, NULL),
(30, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 12:49:00', '2020-01-16 12:43:57', 'انا حر', NULL),
(31, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 12:49:06', '2020-01-06 12:49:06', NULL, NULL),
(32, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 13:06:29', '2020-01-06 13:06:29', NULL, NULL),
(33, 1, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 13:17:50', '2020-01-06 13:17:50', NULL, NULL),
(34, 1, 2, 2, 6, NULL, 'xyz', '31.2781776', '30.1412526', '', 'new', 'cakmgfeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 13:32:37', '2020-01-06 13:32:37', NULL, NULL),
(35, 24, 2, 4, 4, NULL, 'obour', '30.107361666666666', '31.333513333333332', '', 'rated', 'rhrb3h4u5jbrbetbg3rgeyjtunesegetbtmtnrtbetbrj4yryytqdwfg', NULL, NULL, 0, 0, 0, '2020-01-28', '05:45:00', 0.5, NULL, '0000-00-00', '2020-01-06 13:45:28', '2020-01-20 09:28:05', NULL, NULL),
(36, 1, 2, 2, 6, NULL, 'xyz', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 13:52:44', '2020-01-06 13:52:44', NULL, NULL),
(37, 1, 2, 2, 6, NULL, 'xyz', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:11:37', '2020-01-06 14:11:37', NULL, NULL),
(38, 1, 2, 2, 6, NULL, 'xyz', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:11:44', '2020-01-06 14:11:44', NULL, NULL),
(39, 1, 2, 2, 6, NULL, 'xyz', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:11:53', '2020-01-06 14:11:53', NULL, NULL),
(40, 1, 2, 2, 6, NULL, 'xyz', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:17:32', '2020-01-06 14:17:32', NULL, NULL),
(41, 1, 2, 2, 6, NULL, 'xyz', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:25:05', '2020-01-06 14:25:05', NULL, NULL),
(42, 1, 2, 2, 6, NULL, 'xyz', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:25:47', '2020-01-06 14:25:47', NULL, NULL),
(43, 1, 2, 2, 6, NULL, 'currentorderrrnqqqnqwn', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:26:21', '2020-01-06 14:26:21', NULL, NULL),
(44, 1, 2, 2, 6, NULL, 'currentorderrrnqqqnqwn', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:26:45', '2020-01-06 14:26:45', NULL, NULL),
(45, 1, 2, 2, 6, NULL, 'currentorderrrnqqqnqwn', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:27:19', '2020-01-06 14:27:19', NULL, NULL),
(46, 1, 2, 2, 6, NULL, 'currentorderrrnqqqnqwn', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:27:58', '2020-01-06 14:27:58', NULL, NULL),
(47, 1, 2, 2, 6, NULL, 'currentorderrrnqqqnqwn', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-06 14:32:01', '2020-01-06 14:32:01', NULL, NULL),
(48, 24, 2, 4, 6, NULL, 'obour', '30.107361666666666', '31.333513333333332', '', 'rated', 'hfsjwjsjzwjdkekwjsjswuxuduewhisjdi12838fuswjshs', NULL, NULL, 0, 0, 0, '2020-01-28', '06:48:00', 3, NULL, '0000-00-00', '2020-01-06 14:48:54', '2020-01-20 09:28:58', NULL, NULL),
(49, 1, 2, 2, 6, NULL, 'currentorderrrnqqqnqwn', '30.1412526', '31.2781776', '', 'new', 'cakmlDSKVJNKLJSSDLNCASNSVLMKS;DNNVSDVNSDLNVKDSKVNLNKSCN SLDCNSDJCAMADVSCNK;ZLC', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-07 07:47:41', '2020-01-07 07:47:41', NULL, NULL),
(50, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-08 14:54:02', '2020-01-08 14:54:02', NULL, NULL),
(51, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-12 08:56:17', '2020-01-12 08:56:17', NULL, NULL),
(52, 24, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-12 09:14:43', '2020-01-19 13:53:47', 'السعر مرتفع', NULL),
(53, 24, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-21 09:14:47', '2020-01-19 14:14:41', 'الموعد بعيد لا استطيع الانتظار', NULL),
(54, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-22 11:57:35', '2020-01-14 11:57:35', NULL, NULL),
(55, 2, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-22 14:24:17', '2020-01-14 14:24:17', NULL, NULL),
(56, 1, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', 'bshwwje', NULL, 0, 0, 6746, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-19 14:15:40', '2020-02-03 09:36:47', NULL, NULL),
(57, 1, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-19 14:15:50', '2020-02-03 09:43:13', NULL, NULL),
(58, 1, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-19 14:16:34', '2020-02-03 09:40:19', NULL, NULL),
(59, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-19 14:19:17', '2020-01-19 14:20:42', 'لم يعجبني العامل', NULL),
(60, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-19 14:19:33', '2020-01-19 14:22:30', 'الفني لم يلتزم بالموعد', NULL),
(61, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-19 14:19:46', '2020-01-20 12:11:38', NULL, NULL),
(62, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-20 08:48:41', '2020-01-29 14:07:18', NULL, NULL),
(63, 2, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-20 08:49:58', '2020-02-02 13:45:57', NULL, NULL),
(64, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 08:51:55', '2020-01-20 12:25:21', NULL, NULL),
(65, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-20 09:48:25', '2020-01-29 15:21:47', NULL, NULL),
(66, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'on_way', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-20 11:18:47', '2020-01-29 14:10:46', NULL, NULL),
(67, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:16:38', '2020-01-20 12:27:09', NULL, NULL),
(68, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:16:38', '2020-01-20 12:28:08', NULL, NULL),
(69, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-20 12:16:47', '2020-01-20 12:31:05', 'The technician did not stick to the appointment', NULL),
(70, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:17:14', '2020-01-20 12:21:04', NULL, NULL),
(71, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:43:13', '2020-01-20 12:48:07', NULL, NULL),
(72, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:43:16', '2020-01-20 12:56:53', NULL, NULL),
(73, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:43:34', '2020-01-20 12:59:14', NULL, NULL),
(74, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:44:12', '2020-01-20 13:02:54', NULL, NULL),
(75, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:44:21', '2020-01-20 13:04:10', NULL, NULL),
(76, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 0, NULL, '0000-00-00', '2020-01-20 12:44:26', '2020-01-20 13:05:30', NULL, NULL),
(77, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'rated', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', 4, NULL, '0000-00-00', '2020-01-20 12:44:38', '2020-01-24 22:16:27', NULL, NULL),
(78, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-20 12:46:47', '2020-01-23 12:55:32', NULL, NULL),
(79, 24, 1, 2, 4, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-20 12:46:55', '2020-01-23 12:57:04', NULL, NULL),
(80, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-20 14:01:25', '2020-02-03 09:37:46', NULL, NULL),
(81, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-21 08:06:27', '2020-01-29 14:15:29', NULL, NULL),
(82, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'on_way', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-21 13:03:43', '2020-02-04 14:23:53', NULL, NULL),
(83, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-21 13:03:45', '2020-01-21 13:03:45', NULL, NULL),
(84, 24, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-21 14:27:05', '2020-01-23 12:58:45', NULL, NULL),
(85, 24, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-22 11:01:04', '2020-01-23 13:02:49', 'The technician did not stick to the appointment', NULL),
(86, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-22 11:43:14', '2020-02-06 10:30:29', NULL, NULL),
(87, 2, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, 'cash', 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-22 11:43:37', '2020-01-22 11:43:37', NULL, NULL),
(88, 24, 2, 1, 6, NULL, 'vvvvvvvvv', '0.0', '0.0', '', 'on_way', '<Sal7ha.OrderInformationVC: 0x7fafd1039600>', 'hgdxfgvjh', 'cash', 0, 0, 0, '0000-00-00', '00:00:01', NULL, NULL, '0000-00-00', '2020-01-22 11:53:50', '2020-01-28 13:22:07', NULL, NULL),
(89, 24, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-27 10:29:06', '2020-01-27 11:17:29', NULL, NULL),
(90, 24, 1, 1, 6, NULL, 'mmmmmm', '0.0', '0.0', '', 'rated', '<Sal7ha.OrderInformationVC: 0x7f842d026000>', 'hgdxfgvjh', '', 0, 0, 0, '0000-00-00', '00:00:01', 0, NULL, '0000-00-00', '2020-01-29 10:18:32', '2020-02-05 14:00:57', NULL, NULL),
(91, 24, 1, 1, 6, NULL, 'mmmm', '0.0', '0.0', '', 'cancelled', '<Sal7ha.OrderInformationVC: 0x7fc47503e400>', NULL, 'cash', 0, 0, 0, '0000-00-00', '00:00:01', NULL, NULL, '0000-00-00', '2020-01-29 10:25:00', '2020-02-05 12:21:14', NULL, NULL),
(92, 24, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'on_way', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-29 12:49:32', '2020-01-29 13:53:40', NULL, NULL),
(93, 24, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'cancelled', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-29 12:49:51', '2020-02-17 10:08:43', NULL, NULL),
(94, 24, 1, 2, 6, NULL, '2 Ahmed', '30.14125262222222222222222', '31.27817761111111111111', '', 'on_way', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-29 12:54:06', '2020-01-29 14:01:14', NULL, NULL),
(95, 24, 1, 4, 6, NULL, 'Shoubra', '37.421997499999996', '-122.08399609999998', '', 'approved', 'wwwwwwwwwwwwwwwwwwwwwwwww', 'xyz', 'cash', 0, 0, 123, '2020-01-31', '05:03:00', NULL, NULL, '0000-00-00', '2020-01-29 13:04:27', '2020-02-02 14:40:15', NULL, NULL),
(96, 24, 2, 4, 6, NULL, 'Shoubra', '37.421997499999996', '-122.08399609999998', '', 'new', 'wwwwwwwwwwwwwwwwwwwwwwwww', NULL, 'cash', 0, 0, 0, '2020-01-31', '05:03:00', NULL, NULL, '0000-00-00', '2020-01-29 13:27:42', '2020-01-29 13:27:42', NULL, NULL),
(97, 24, 2, 4, 6, NULL, 'Shoubra', '37.421997499999996', '-122.08399609999998', '', 'new', 'wwwwwwwwwwwwwwwwwwwwwwwww', NULL, 'cash', 0, 0, 0, '2020-01-31', '05:03:00', NULL, NULL, '0000-00-00', '2020-01-29 13:28:07', '2020-01-29 13:28:07', NULL, NULL),
(98, 24, 1, 4, 6, NULL, 'Shoubra', '37.42199803188567', '-122.08399968221784', '', 'arrived', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', NULL, 'cash', 0, 0, 0, '2020-01-31', '05:28:00', NULL, NULL, '0000-00-00', '2020-01-29 14:29:19', '2020-02-03 14:15:09', NULL, NULL),
(99, 24, 1, 2, 6, NULL, '2 Ahmed', '30.14125262222222222222222', '31.27817761111111111111', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '0000-00-00', '2020-01-30 07:46:31', '2020-02-03 09:48:48', NULL, NULL),
(100, 24, 1, 1, 6, NULL, 'jjjjjjjjjj', '0.0', '0.0', '', 'rated', '<Sal7ha.OrderInformationVC: 0x7fef36886200>', NULL, '', 0, 0, 0, '0000-00-00', '00:00:01', 0, NULL, '0000-00-00', '2020-01-30 08:02:34', '2020-02-05 14:47:45', NULL, NULL),
(101, 24, 2, 4, 4, NULL, 'Shoubra', '30.107097499999995', '31.333175799999996', '', 'arrived', 'bsqhajajsj2jwjajaisjwjwajqjqjajsjsjeejejejsjsj', NULL, 'visa', 0, 0, 0, '2020-02-27', '15:03:00', NULL, NULL, '0000-00-00', '2020-02-03 13:04:17', '2020-02-18 09:26:35', NULL, NULL),
(102, 24, 2, 4, 4, NULL, 'Shoubra', '30.1071275', '31.3331836', '', 'arrived', 'xyzywywywhwjekajwjajejwjsjdjejwajak3jdjqjajdjdjejsjd2usjs', NULL, 'visa', 0, 0, 0, '2020-02-29', '15:09:00', NULL, NULL, '0000-00-00', '2020-02-03 13:10:26', '2020-02-18 09:27:13', NULL, NULL),
(103, 24, 2, 4, 4, NULL, 'Shoubra', '30.107052499999995', '31.3332461', '', 'cancelled', 'bsqhajajsj2jwjajaisjwjwajqjqjajsjsjeejejejsjsj', NULL, 'visa', 0, 0, 0, '2020-02-27', '15:03:00', NULL, NULL, '0000-00-00', '2020-02-03 13:17:50', '2020-02-03 14:11:50', 'The technician did not stick to the appointment', NULL),
(104, 24, 2, 4, 4, NULL, 'Shoubra', '30.107102500000003', '31.333175799999996', '', 'new', 'xbwhdjxjejxxkwkzjdj2jsjs1jsjdjsjsjs', NULL, 'visa', 0, 0, 0, '2020-02-04', '15:35:00', NULL, NULL, '0000-00-00', '2020-02-03 13:36:18', '2020-02-03 13:36:18', NULL, NULL),
(105, 24, 2, 4, 4, NULL, 'Shoubra', '30.107102500000003', '31.333191399999997', '', 'new', 'vshwheehehehdshwhdjdejdjdjsdjdjdj', NULL, 'cash', 0, 0, 0, '2020-02-26', '15:40:00', NULL, NULL, '0000-00-00', '2020-02-03 13:40:44', '2020-02-03 13:40:44', NULL, NULL),
(106, 24, 2, 4, 4, NULL, 'Shoubra', '30.107097499999995', '31.333207', '', 'new', 'ndjsjdjsj2jrjrwiekrkwiwjdis2idieiwjriddidid', NULL, 'cash', 0, 0, 0, '2020-02-21', '15:43:00', NULL, NULL, '0000-00-00', '2020-02-03 13:44:07', '2020-02-03 13:44:07', NULL, NULL),
(107, 24, 2, 4, 6, NULL, 'Shoubra', '30.107247499999996', '31.333121100000003', '', 'new', 'eujrnkyrhsvsj4tjwevsgnryjerbsfbfHktjsbsnfkrhsfbdgk', NULL, 'cash', 0, 0, 0, '2020-02-10', '06:04:00', NULL, NULL, '0000-00-00', '2020-02-03 14:07:01', '2020-02-03 14:07:01', NULL, NULL),
(108, 24, 2, 1, 6, NULL, ',mmmmmm', '0.0', '0.0', '', 'new', '<Sal7ha.OrderInformationVC: 0x7fcc170a3a00>', NULL, 'cash', 0, 0, 0, '0000-00-00', '00:00:02', NULL, NULL, '0000-00-00', '2020-02-04 08:39:39', '2020-02-04 08:39:39', NULL, NULL),
(109, 24, 2, 4, 5, NULL, 'Shoubra', '30.1070925', '31.3332227', '', 'arrived', 'bdhaxhshfjwcjsjdjwjfsjwjxjwj2sjsjwje', 'dhahdhdhahab', 'cash', 0, 0, 848484, '2020-02-14', '15:46:00', NULL, NULL, '0000-00-00', '2020-02-05 13:47:15', '2020-02-05 13:59:54', NULL, NULL),
(110, 24, 2, 1, 6, NULL, 'mmmmmmm', '0.0', '0.0', '', 'new', '<Sal7ha.OrderInformationVC: 0x7fb0138b3400>', NULL, '', 0, 0, 0, '0000-00-00', '00:00:02', NULL, NULL, '0000-00-00', '2020-02-05 14:00:47', '2020-02-05 14:00:47', NULL, NULL),
(111, 24, 2, 1, 11, NULL, 'hhhhhhh', '0.0', '0.0', '', 'new', '<Sal7ha.OrderInformationVC: 0x7f935701a600>', NULL, '', 0, 0, 0, '0000-00-00', '00:00:02', NULL, NULL, '0000-00-00', '2020-02-05 14:04:48', '2020-02-05 14:04:48', NULL, NULL),
(112, 24, 2, 1, 6, NULL, 'llllllllll', '0.0', '0.0', '', 'new', '<Sal7ha.OrderInformationVC: 0x7fcdba076a00>', NULL, '', 0, 0, 0, '0000-00-00', '00:00:02', NULL, NULL, '0000-00-00', '2020-02-05 14:07:43', '2020-02-05 14:07:43', NULL, NULL),
(113, 24, 2, 1, 6, NULL, 'kkkkkkkkkkk', '0.0', '0.0', '', 'new', '<Sal7ha.OrderInformationVC: 0x7fc1dd8fd000>', NULL, 'cash', 0, 0, 0, '0000-00-00', '00:00:02', NULL, NULL, '0000-00-00', '2020-02-05 17:42:17', '2020-02-05 17:42:17', NULL, NULL),
(114, 35, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-02-10', '2020-02-10 14:47:02', '2020-02-10 14:47:02', NULL, NULL),
(115, 35, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-02-10', '2020-02-10 14:47:31', '2020-02-10 14:47:31', NULL, NULL),
(116, 35, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-02-09', '2020-02-10 14:47:45', '2020-02-10 14:47:45', NULL, NULL),
(117, 35, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-02-09', '2020-02-10 14:49:26', '2020-02-10 14:49:26', NULL, NULL),
(118, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-02-19', '2020-02-19 12:47:02', '2020-02-19 12:47:02', NULL, NULL),
(119, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 09:29:07', '2020-03-02 09:29:07', NULL, NULL),
(120, 3, 1, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 09:30:44', '2020-03-02 09:30:44', NULL, NULL),
(121, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 12:40:28', '2020-03-02 12:40:28', NULL, NULL),
(122, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 13:49:49', '2020-03-02 13:49:49', NULL, NULL),
(123, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 13:51:05', '2020-03-02 13:51:05', NULL, NULL),
(124, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 13:52:05', '2020-03-02 13:52:05', NULL, NULL),
(125, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 13:52:57', '2020-03-02 13:52:57', NULL, NULL),
(126, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 13:57:18', '2020-03-02 13:57:18', NULL, NULL),
(127, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 13:58:21', '2020-03-02 13:58:21', NULL, NULL),
(128, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 13:58:58', '2020-03-02 13:58:58', NULL, NULL),
(129, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:13:33', '2020-03-02 14:13:33', NULL, NULL),
(130, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:16:38', '2020-03-02 14:16:38', NULL, NULL),
(131, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:16:43', '2020-03-02 14:16:43', NULL, NULL),
(132, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:17:43', '2020-03-02 14:17:43', NULL, NULL),
(133, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:19:06', '2020-03-02 14:19:06', NULL, NULL),
(134, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:25:14', '2020-03-02 14:25:14', NULL, NULL),
(135, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:25:23', '2020-03-02 14:25:23', NULL, NULL),
(136, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:27:33', '2020-03-02 14:27:33', NULL, NULL),
(137, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:28:01', '2020-03-02 14:28:01', NULL, NULL),
(138, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:28:37', '2020-03-02 14:28:37', NULL, NULL),
(139, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:29:56', '2020-03-02 14:29:56', NULL, NULL),
(140, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:30:26', '2020-03-02 14:30:26', NULL, NULL),
(141, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:31:03', '2020-03-02 14:31:03', NULL, NULL),
(142, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:31:28', '2020-03-02 14:31:28', NULL, NULL),
(143, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:33:15', '2020-03-02 14:33:15', NULL, NULL),
(144, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:35:11', '2020-03-02 14:35:11', NULL, NULL),
(145, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:35:28', '2020-03-02 14:35:28', NULL, NULL),
(146, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:35:48', '2020-03-02 14:35:48', NULL, NULL),
(147, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:35:53', '2020-03-02 14:35:53', NULL, NULL),
(148, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:36:17', '2020-03-02 14:36:17', NULL, NULL),
(149, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:36:33', '2020-03-02 14:36:33', NULL, NULL),
(150, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:37:49', '2020-03-02 14:37:49', NULL, NULL),
(151, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:38:03', '2020-03-02 14:38:03', NULL, NULL),
(152, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:40:02', '2020-03-02 14:40:02', NULL, NULL),
(153, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:42:14', '2020-03-02 14:42:14', NULL, NULL),
(154, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:44:21', '2020-03-02 14:44:21', NULL, NULL),
(155, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:45:05', '2020-03-02 14:45:05', NULL, NULL),
(156, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:45:20', '2020-03-02 14:45:20', NULL, NULL),
(157, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:46:22', '2020-03-02 14:46:22', NULL, NULL),
(158, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:48:13', '2020-03-02 14:48:13', NULL, NULL),
(159, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:48:31', '2020-03-02 14:48:31', NULL, NULL),
(160, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:48:59', '2020-03-02 14:48:59', NULL, NULL),
(161, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:49:54', '2020-03-02 14:49:54', NULL, NULL),
(162, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:50:10', '2020-03-02 14:50:10', NULL, NULL),
(163, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:50:30', '2020-03-02 14:50:30', NULL, NULL),
(164, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:50:53', '2020-03-02 14:50:53', NULL, NULL),
(165, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:51:19', '2020-03-02 14:51:19', NULL, NULL),
(166, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:53:36', '2020-03-02 14:53:36', NULL, NULL),
(167, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:54:29', '2020-03-02 14:54:29', NULL, NULL),
(168, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:56:35', '2020-03-02 14:56:35', NULL, NULL),
(169, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 14:57:40', '2020-03-02 14:57:40', NULL, NULL),
(170, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 15:17:46', '2020-03-02 15:17:46', NULL, NULL),
(171, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 15:18:15', '2020-03-02 15:18:15', NULL, NULL),
(172, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 15:18:22', '2020-03-02 15:18:22', NULL, NULL),
(173, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 15:20:49', '2020-03-02 15:20:49', NULL, NULL),
(174, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 1, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 15:20:55', '2020-03-02 15:20:55', NULL, NULL),
(175, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 15:21:05', '2020-03-02 15:21:05', NULL, NULL);
INSERT INTO `orders` (`id`, `user_id`, `agent_id`, `city_id`, `category_id`, `offer_id`, `address`, `latitude`, `longitude`, `qr_code`, `status`, `description`, `agent_description`, `payment_method`, `visit_fees`, `discount`, `cost`, `date`, `time`, `rate`, `rate_comment`, `date_now`, `created_at`, `updated_at`, `cancel_reason`, `refused_ids`) VALUES
(176, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'arrived', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-02', '2020-03-02 15:21:20', '2020-03-02 15:29:11', NULL, NULL),
(177, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:48:19', '2020-03-03 13:48:19', NULL, NULL),
(178, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:48:49', '2020-03-03 13:48:49', NULL, NULL),
(179, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:49:57', '2020-03-03 13:49:57', NULL, NULL),
(180, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:50:08', '2020-03-03 13:50:08', NULL, NULL),
(181, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:50:57', '2020-03-03 13:50:57', NULL, NULL),
(182, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:51:50', '2020-03-03 13:51:50', NULL, NULL),
(183, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:52:08', '2020-03-03 13:52:08', NULL, NULL),
(184, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:53:04', '2020-03-03 13:53:04', NULL, NULL),
(185, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:53:32', '2020-03-03 13:53:32', NULL, NULL),
(186, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:54:09', '2020-03-03 13:54:09', NULL, NULL),
(187, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:55:16', '2020-03-03 13:55:16', NULL, NULL),
(188, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:55:52', '2020-03-03 13:55:52', NULL, NULL),
(189, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 13:56:29', '2020-03-03 13:56:29', NULL, NULL),
(190, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:16:02', '2020-03-03 14:16:02', NULL, NULL),
(191, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:21:34', '2020-03-03 14:21:34', NULL, NULL),
(192, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:23:32', '2020-03-03 14:23:32', NULL, NULL),
(193, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:24:34', '2020-03-03 14:24:34', NULL, NULL),
(194, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:27:00', '2020-03-03 14:27:00', NULL, NULL),
(195, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:27:46', '2020-03-03 14:27:46', NULL, NULL),
(196, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:28:05', '2020-03-03 14:28:05', NULL, NULL),
(197, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:31:26', '2020-03-03 14:31:26', NULL, NULL),
(198, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:36:42', '2020-03-03 14:36:42', NULL, NULL),
(199, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:37:16', '2020-03-03 14:37:16', NULL, NULL),
(200, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:40:31', '2020-03-03 14:40:31', NULL, NULL),
(201, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:43:07', '2020-03-03 14:43:07', NULL, NULL),
(202, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:43:25', '2020-03-03 14:43:25', NULL, NULL),
(203, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:44:34', '2020-03-03 14:44:34', NULL, NULL),
(204, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:46:03', '2020-03-03 14:46:03', NULL, NULL),
(205, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:48:17', '2020-03-03 14:48:17', NULL, NULL),
(206, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:51:12', '2020-03-03 14:51:12', NULL, NULL),
(207, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:53:38', '2020-03-03 14:53:38', NULL, NULL),
(208, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:54:21', '2020-03-03 14:54:21', NULL, NULL),
(209, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:55:47', '2020-03-03 14:55:47', NULL, NULL),
(210, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:56:50', '2020-03-03 14:56:50', NULL, NULL),
(211, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-03', '2020-03-03 14:57:10', '2020-03-03 14:57:10', NULL, NULL),
(212, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-04', '2020-03-04 09:34:40', '2020-03-04 09:34:40', NULL, NULL),
(213, 3, 2, 2, 6, NULL, '2 Ahmed', '30.1412526', '31.2781776', '', 'new', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', NULL, NULL, 0, 0, 0, '2020-06-30', '22:12:00', NULL, NULL, '2020-03-11', '2020-03-11 09:26:06', '2020-03-11 09:26:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_images`
--

CREATE TABLE `order_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `src` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_images`
--

INSERT INTO `order_images` (`id`, `order_id`, `src`) VALUES
(12, 33, '/storage/order/ft7y_1578316670.PNG'),
(13, 36, '/storage/order/ft7y_1578318764.PNG'),
(14, 47, '/storage/order/ft7y_1578321121.PNG'),
(15, 49, '/storage/order/ft7y_1578383261.PNG'),
(16, 84, '/storage/order/Capture_1579616825.PNG'),
(17, 84, '/storage/order/ft7y_1579616825.PNG'),
(18, 84, '/storage/order/menu_1579616825.png'),
(19, 85, '/storage/order/Capture_1579690864.PNG'),
(20, 85, '/storage/order/ft7y_1579690865.PNG'),
(21, 85, '/storage/order/menu_1579690865.png'),
(22, 87, '/storage/order/dogs-pics_599477363_1579693417.jpg'),
(23, 98, '/storage/order/download_1580308159.jpeg'),
(24, 101, '/storage/order/Screenshot_2020-02-03-13-19-40-63_e79ab189def2eb40e517d1753f54285f_1580735057.png'),
(25, 101, '/storage/order/2020-02-03-13-21-06-782_1580735057.jpg'),
(26, 101, '/storage/order/2020-02-03-13-21-08-950_1580735057.jpg'),
(27, 101, '/storage/order/2020-02-03-13-17-49-269_1580735057.jpg'),
(28, 101, '/storage/order/2020-02-03-13-18-00-820_1580735057.jpg'),
(29, 102, '/storage/order/Screenshot_2020-02-03-13-19-40-63_e79ab189def2eb40e517d1753f54285f_1580735426.png'),
(30, 102, '/storage/order/2020-02-03-13-21-08-950_1580735426.jpg'),
(31, 102, '/storage/order/2020-02-03-13-21-06-782_1580735426.jpg'),
(32, 102, '/storage/order/2020-02-03-13-18-00-820_1580735426.jpg'),
(33, 105, '/storage/order/2020-02-03-13-21-06-782_1580737244.jpg'),
(34, 105, '/storage/order/2020-02-03-13-21-08-950_1580737244.jpg'),
(35, 106, '/storage/order/2020-02-03-13-21-06-782_1580737447.jpg'),
(36, 107, '/storage/order/2020-02-03-13-21-08-950_1580738821.jpg'),
(37, 107, '/storage/order/2020-02-03-13-21-06-782_1580738821.jpg'),
(12, 33, '/storage/order/ft7y_1578316670.PNG'),
(13, 36, '/storage/order/ft7y_1578318764.PNG'),
(14, 47, '/storage/order/ft7y_1578321121.PNG'),
(15, 49, '/storage/order/ft7y_1578383261.PNG'),
(16, 84, '/storage/order/Capture_1579616825.PNG'),
(17, 84, '/storage/order/ft7y_1579616825.PNG'),
(18, 84, '/storage/order/menu_1579616825.png'),
(19, 85, '/storage/order/Capture_1579690864.PNG'),
(20, 85, '/storage/order/ft7y_1579690865.PNG'),
(21, 85, '/storage/order/menu_1579690865.png'),
(22, 87, '/storage/order/dogs-pics_599477363_1579693417.jpg'),
(23, 98, '/storage/order/download_1580308159.jpeg'),
(24, 101, '/storage/order/Screenshot_2020-02-03-13-19-40-63_e79ab189def2eb40e517d1753f54285f_1580735057.png'),
(25, 101, '/storage/order/2020-02-03-13-21-06-782_1580735057.jpg'),
(26, 101, '/storage/order/2020-02-03-13-21-08-950_1580735057.jpg'),
(27, 101, '/storage/order/2020-02-03-13-17-49-269_1580735057.jpg'),
(28, 101, '/storage/order/2020-02-03-13-18-00-820_1580735057.jpg'),
(29, 102, '/storage/order/Screenshot_2020-02-03-13-19-40-63_e79ab189def2eb40e517d1753f54285f_1580735426.png'),
(30, 102, '/storage/order/2020-02-03-13-21-08-950_1580735426.jpg'),
(31, 102, '/storage/order/2020-02-03-13-21-06-782_1580735426.jpg'),
(32, 102, '/storage/order/2020-02-03-13-18-00-820_1580735426.jpg'),
(33, 105, '/storage/order/2020-02-03-13-21-06-782_1580737244.jpg'),
(34, 105, '/storage/order/2020-02-03-13-21-08-950_1580737244.jpg'),
(35, 106, '/storage/order/2020-02-03-13-21-06-782_1580737447.jpg'),
(36, 107, '/storage/order/2020-02-03-13-21-08-950_1580738821.jpg'),
(37, 107, '/storage/order/2020-02-03-13-21-06-782_1580738821.jpg'),
(12, 33, '/storage/order/ft7y_1578316670.PNG'),
(13, 36, '/storage/order/ft7y_1578318764.PNG'),
(14, 47, '/storage/order/ft7y_1578321121.PNG'),
(15, 49, '/storage/order/ft7y_1578383261.PNG'),
(16, 84, '/storage/order/Capture_1579616825.PNG'),
(17, 84, '/storage/order/ft7y_1579616825.PNG'),
(18, 84, '/storage/order/menu_1579616825.png'),
(19, 85, '/storage/order/Capture_1579690864.PNG'),
(20, 85, '/storage/order/ft7y_1579690865.PNG'),
(21, 85, '/storage/order/menu_1579690865.png'),
(22, 87, '/storage/order/dogs-pics_599477363_1579693417.jpg'),
(23, 98, '/storage/order/download_1580308159.jpeg'),
(24, 101, '/storage/order/Screenshot_2020-02-03-13-19-40-63_e79ab189def2eb40e517d1753f54285f_1580735057.png'),
(25, 101, '/storage/order/2020-02-03-13-21-06-782_1580735057.jpg'),
(26, 101, '/storage/order/2020-02-03-13-21-08-950_1580735057.jpg'),
(27, 101, '/storage/order/2020-02-03-13-17-49-269_1580735057.jpg'),
(28, 101, '/storage/order/2020-02-03-13-18-00-820_1580735057.jpg'),
(29, 102, '/storage/order/Screenshot_2020-02-03-13-19-40-63_e79ab189def2eb40e517d1753f54285f_1580735426.png'),
(30, 102, '/storage/order/2020-02-03-13-21-08-950_1580735426.jpg'),
(31, 102, '/storage/order/2020-02-03-13-21-06-782_1580735426.jpg'),
(32, 102, '/storage/order/2020-02-03-13-18-00-820_1580735426.jpg'),
(33, 105, '/storage/order/2020-02-03-13-21-06-782_1580737244.jpg'),
(34, 105, '/storage/order/2020-02-03-13-21-08-950_1580737244.jpg'),
(35, 106, '/storage/order/2020-02-03-13-21-06-782_1580737447.jpg'),
(36, 107, '/storage/order/2020-02-03-13-21-08-950_1580738821.jpg'),
(37, 107, '/storage/order/2020-02-03-13-21-06-782_1580738821.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_en` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_ar` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content_en`, `content_ar`, `page_name`) VALUES
(1, 'about', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non sodales neque sodales ut etiam. Praesent elementum facilisis leo vel fringilla. Id diam maecenas ultricies mi eget mauris pharetra et. Nunc sed blandit libero volutpat sed. Proin sagittis nisl rhoncus mattis rhoncus. Sit amet aliquam id diam maecenas ultricies mi eget mauris. Fusce id velit ut tortor pretium viverra suspendisse potenti. Eget egestas purus viverra accumsan in nisl nisi. Massa eget egestas purus viverra.', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق \"ليتراسيت\" (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل \"ألدوس بايج مايكر\" (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.', 'about'),
(2, 'terms', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'خلافاَ للإعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني الكلاسيكي منذ العام 45 قبل الميلاد، مما يجعله أكثر من 2000 عام في القدم. قام البروفيسور \"ريتشارد ماك لينتوك\" (Richard McClintock) وهو بروفيسور اللغة اللاتينية في جامعة هامبدن-سيدني في فيرجينيا بالبحث عن أصول كلمة لاتينية غامضة في نص لوريم إيبسوم وهي \"consectetur\"، وخلال تتبعه لهذه الكلمة في الأدب اللاتيني اكتشف المصدر الغير قابل للشك. فلقد اتضح أن كلمات نص لوريم إيبسوم تأتي من الأقسام 1.10.32 و 1.10.33 من كتاب \"حول أقاصي الخير والشر\" (de Finibus Bonorum et Malorum) للمفكر شيشيرون (Cicero) والذي كتبه في عام 45 قبل الميلاد. هذا الكتاب هو بمثابة مقالة علمية مطولة في نظرية الأخلاق، وكان له شعبية كبيرة في عصر النهضة. السطر الأول من لوريم إيبسوم \"Lorem ipsum dolor sit amet..\" يأتي من سطر في القسم 1.20.32 من هذا الكتاب.', 'about'),
(3, 'usage', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.', 'about'),
(1, 'about', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non sodales neque sodales ut etiam. Praesent elementum facilisis leo vel fringilla. Id diam maecenas ultricies mi eget mauris pharetra et. Nunc sed blandit libero volutpat sed. Proin sagittis nisl rhoncus mattis rhoncus. Sit amet aliquam id diam maecenas ultricies mi eget mauris. Fusce id velit ut tortor pretium viverra suspendisse potenti. Eget egestas purus viverra accumsan in nisl nisi. Massa eget egestas purus viverra.', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق \"ليتراسيت\" (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل \"ألدوس بايج مايكر\" (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.', 'about'),
(2, 'terms', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'خلافاَ للإعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني الكلاسيكي منذ العام 45 قبل الميلاد، مما يجعله أكثر من 2000 عام في القدم. قام البروفيسور \"ريتشارد ماك لينتوك\" (Richard McClintock) وهو بروفيسور اللغة اللاتينية في جامعة هامبدن-سيدني في فيرجينيا بالبحث عن أصول كلمة لاتينية غامضة في نص لوريم إيبسوم وهي \"consectetur\"، وخلال تتبعه لهذه الكلمة في الأدب اللاتيني اكتشف المصدر الغير قابل للشك. فلقد اتضح أن كلمات نص لوريم إيبسوم تأتي من الأقسام 1.10.32 و 1.10.33 من كتاب \"حول أقاصي الخير والشر\" (de Finibus Bonorum et Malorum) للمفكر شيشيرون (Cicero) والذي كتبه في عام 45 قبل الميلاد. هذا الكتاب هو بمثابة مقالة علمية مطولة في نظرية الأخلاق، وكان له شعبية كبيرة في عصر النهضة. السطر الأول من لوريم إيبسوم \"Lorem ipsum dolor sit amet..\" يأتي من سطر في القسم 1.20.32 من هذا الكتاب.', 'about'),
(3, 'usage', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.', 'about'),
(1, 'about', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Arcu non sodales neque sodales ut etiam. Praesent elementum facilisis leo vel fringilla. Id diam maecenas ultricies mi eget mauris pharetra et. Nunc sed blandit libero volutpat sed. Proin sagittis nisl rhoncus mattis rhoncus. Sit amet aliquam id diam maecenas ultricies mi eget mauris. Fusce id velit ut tortor pretium viverra suspendisse potenti. Eget egestas purus viverra accumsan in nisl nisi. Massa eget egestas purus viverra.', 'لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني. انتشر بشكل كبير في ستينيّات هذا القرن مع إصدار رقائق \"ليتراسيت\" (Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل \"ألدوس بايج مايكر\" (Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.', 'about'),
(2, 'terms', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'خلافاَ للإعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني الكلاسيكي منذ العام 45 قبل الميلاد، مما يجعله أكثر من 2000 عام في القدم. قام البروفيسور \"ريتشارد ماك لينتوك\" (Richard McClintock) وهو بروفيسور اللغة اللاتينية في جامعة هامبدن-سيدني في فيرجينيا بالبحث عن أصول كلمة لاتينية غامضة في نص لوريم إيبسوم وهي \"consectetur\"، وخلال تتبعه لهذه الكلمة في الأدب اللاتيني اكتشف المصدر الغير قابل للشك. فلقد اتضح أن كلمات نص لوريم إيبسوم تأتي من الأقسام 1.10.32 و 1.10.33 من كتاب \"حول أقاصي الخير والشر\" (de Finibus Bonorum et Malorum) للمفكر شيشيرون (Cicero) والذي كتبه في عام 45 قبل الميلاد. هذا الكتاب هو بمثابة مقالة علمية مطولة في نظرية الأخلاق، وكان له شعبية كبيرة في عصر النهضة. السطر الأول من لوريم إيبسوم \"Lorem ipsum dolor sit amet..\" يأتي من سطر في القسم 1.20.32 من هذا الكتاب.', 'about'),
(3, 'usage', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.', 'about');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` enum('user','agent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `user_type`, `created_at`) VALUES
('x.kemo7@gmail.com', '342510', 'user', NULL),
('agent@app.com', '462971', 'agent', NULL),
('daliaawadelsayedd@gmail.com', '287945', 'user', NULL),
('daliaawadelsayed@gmail.com', '478359', 'user', NULL),
('x.kemo7@gmail.com', '342510', 'user', NULL),
('agent@app.com', '462971', 'agent', NULL),
('daliaawadelsayedd@gmail.com', '287945', 'user', NULL),
('daliaawadelsayed@gmail.com', '478359', 'user', NULL),
('x.kemo7@gmail.com', '342510', 'user', NULL),
('agent@app.com', '462971', 'agent', NULL),
('daliaawadelsayedd@gmail.com', '287945', 'user', NULL),
('daliaawadelsayed@gmail.com', '478359', 'user', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` bigint(20) NOT NULL COMMENT 'add stages if the clint ask for points not going to be zeron and if stage one add 2 if stage 2 addd 5..',
  `point_value` int(11) DEFAULT NULL,
  `credit_value` int(11) NOT NULL,
  `point_per_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `point_value`, `credit_value`, `point_per_order`, `created_at`, `updated_at`) VALUES
(1, 10, 2, 5, NULL, '2020-03-02 12:22:03');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://twitter.com/', NULL, NULL, NULL),
(2, 'whatsApp', '+966586923', NULL, NULL, NULL),
(3, 'support', '+96665265814', NULL, NULL, NULL),
(4, 'email', 'letmeknow@yahoo.com', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('new','active','banned') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `point_value` int(11) NOT NULL DEFAULT 0,
  `credits` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ios_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `android_token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `email_verified_at`, `phone`, `phone_verified_at`, `password`, `city_id`, `address`, `latitude`, `longitude`, `status`, `remember_token`, `device_token`, `points`, `point_value`, `credits`, `created_at`, `updated_at`, `ios_token`, `android_token`, `rate`) VALUES
(1, 'Karim H', 'karim@app.com', NULL, NULL, '+201119494098www', NULL, '$2y$10$CQm0LINSJ3Ha.Yfi5fqW.uZ3FrYEpZJWoqo1x.YwnAQARWmc/8MoS', 4, '2 Ahmed Abdella', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2019-12-22 06:49:20', '2020-03-05 10:23:04', '', '', 5),
(3, 'Karim', 'karim2@app.com', NULL, NULL, '011194954098', NULL, '$2y$10$5G0v8Ur6I54BL/hNjZXSWOEfi1WuOWr8HUQEDgmQ7rw9bkN5f2Lju', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 5, 0, 1, '2019-12-24 14:35:37', '2020-03-11 09:26:06', '', 'fj1fnsjenvs:APA91bE65VO2-JY0AhaRdXQJkNl4xkz2dleBIbQTwmpZ8cTbLCvttSGqKT3rwPlbihEgB_-yip1O60XS2UJ4b9dae1CfnQrzO4buUzuRrcR2rq-tYNrFETUwlIMP6iEnUya5CWyEJSay', 5),
(4, 'Karim', 'karim22@app.com', NULL, NULL, '011119494098', NULL, '$2y$10$Sq3PxCFPpluU8ylmCparWuv6n2VeqWtBp9J9eufFsnTZkZcSGylBa', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2019-12-24 14:37:17', '2020-01-23 09:16:31', '', '', 5),
(5, 'Karim', 'karim222@app.com', NULL, NULL, '01219494098', NULL, '$2y$10$Q5g5tiVqJdPDQrkM/vbxveD9WYK/XNB/2pfzoLp/6U9f78lapeokK', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2019-12-24 14:38:34', '2020-01-23 09:23:49', '', '', 5),
(6, 'Karim', 'karim2212@app.com', NULL, NULL, '012219494098', NULL, '$2y$10$365ei43iThTvGd3kvE.ndeOk4VI7qUGhxCBb1GpIkwufCBZveC.X2', 2, 'xxx', '454354.1213', '5.55454', 'new', NULL, NULL, 0, 0, 0, '2019-12-24 14:42:38', '2019-12-24 14:42:38', '', '', 5),
(7, 'Karim', 'karimm@app.com', NULL, NULL, '01100253855', NULL, '$2y$10$VIwmRTGzUxSlJWtlo9rfoeHPh07eJsFvc..TSijGmVrSSyaw/.g7m', 2, 'xxx', '454354.1213', '5.55454', 'new', NULL, NULL, 0, 0, 0, '2019-12-29 12:39:05', '2019-12-29 12:39:05', '', '', 5),
(8, 'Karim', 'karimnm@app.com', NULL, NULL, '011002538555', NULL, '$2y$10$4SjEEFqC3tzAYU6XKQwySulSGxZHDptgbt2EQhV09ar4HDPgFP.L2', 2, 'xxx', '454354.1213', '5.55454', 'new', NULL, NULL, 0, 0, 0, '2019-12-29 13:24:38', '2019-12-29 13:24:38', '', '', 5),
(9, 'dalia awad', 'daliaawadelsayed@gmail.com', NULL, NULL, '0110025385555', NULL, '$2y$10$fM525z7.AA.abMNkbkILKO9x/NaiBsUh4//zJgV8sKpjTuz1gwkVS', 1, 'obour', '30.107123333333334', '31.333231666666666', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 11:32:58', '2020-01-19 13:09:02', '', '', 5),
(10, 'dalia awad', 'app.app@app.com', NULL, NULL, '0110025385500', NULL, '$2y$10$QXV/PvRGcc9hch98kbTgwuilq3hndvl8O4OEdCrR6t0vsa61egJj2', 1, 'xyz', '30.107135000000003', '31.333126666666665', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 11:38:50', '2019-12-30 11:38:50', '', '', 5),
(11, 'dalia awad', 'app.app@com', NULL, NULL, '01100253855000', NULL, '$2y$10$2w3CmPJH8ujcleWAaP6oQ.IDtP/XjVlmUd6LzTQV5hjh/E5b2uEMi', 3, 'xxx', '454354.1213', '5.55454', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 11:40:04', '2019-12-30 11:40:04', '', '', 5),
(12, 'Karim', 'kari2@app.com', NULL, NULL, '018219494098', NULL, '$2y$10$3VTwgR1U7D/sK4KRnYP/D.DUn3eDzYVbZ5FGdZ9dZl/zvWeJJ4yLa', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2019-12-30 11:46:12', '2020-01-23 09:19:20', '', '', 5),
(13, 'dalia awad', 'app.appp@com', NULL, NULL, '1234567891011', NULL, '$2y$10$amn3yH7FCpWivbbJj0XMyOmy8pSzpH8C34Y8Kge6x21r1aUJ6LB2O', 3, 'xxx', '454354.1213', '5.55454', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 11:51:20', '2019-12-30 11:51:20', '', '', 5),
(14, 'dalia awad', 'app.apppp@com', NULL, NULL, '1213141516171819', NULL, '$2y$10$PYwJZEpvfFWL.7AsTbXZ9eNH/x/X4ZcA7XUigg28.t2G9DOofB7bG', 3, 'xxx', '454354.1213', '5.55454', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 11:57:16', '2019-12-30 11:57:16', '', '', 5),
(15, 'daliz', 'hanaahassan14219968@gmail.com', NULL, NULL, '12345678910111213', NULL, '$2y$10$KS2NeBZosgf1pY.uZSOLUuNOivyI0qcFwicntfXfgs/yGlOhrzbvG', 1, 'fscg', '30.106568333333332', '31.332919999999998', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 11:59:52', '2020-02-11 11:33:07', '', '', 3.5),
(16, 'daliz', 'app.ayhaga@com', NULL, NULL, '012345678910', NULL, '$2y$10$lsyGzeIRdSWGCtKcOZy38uuRBqil7FbAwk6LFIQqB1lmyWIwRZ/tO', 3, 'xxx', '454354.1213', '5.55454', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 12:31:52', '2019-12-30 12:31:52', '', '', 5),
(17, 'dou', 'hanjaahassan14219968@gmail.com', NULL, NULL, '01234567891011', NULL, '$2y$10$h4shZcQf3zJLxOEvoa782./NJ30g34bfCFRecfYQA2z00vXWwICIy', 4, 'xyz', '30.10701333333333', '31.33319333333333', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 13:48:39', '2019-12-30 13:48:39', '', '', 5),
(18, 'dalia', 'dalia@appp.com', NULL, NULL, '01111111111', NULL, '$2y$10$N8uuElyrlRA0LOlgoKz4Cug55/H05B1ihcs/LZVzV6lHVLSryuSIq', 3, 'obour', '30.106990000000003', '31.333156666666664', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 14:04:28', '2019-12-30 14:04:28', '', '', 5),
(19, 'dina', 'dina@app.com', NULL, NULL, '011111111111', NULL, '$2y$10$izUJDW7bk4aJNFKDC0p/aebCdmIusw/1bVVEy2kLwBODKkG51qT6G', 2, 'ay haga', '30.106988333333334', '31.333066666666664', 'new', NULL, NULL, 0, 0, 0, '2019-12-30 14:24:19', '2019-12-30 14:24:19', '', '', 5),
(20, 'daliz', 'app.yahoo@com', NULL, NULL, '0111111111111', NULL, '$2y$10$Jf8tBfScZb6x7Zlls2YH6.QWY9.dCFXARrEUdBPDeG9pI6dkJN0ou', 3, 'obour', '454354.1213', '5.55454', 'new', NULL, NULL, 0, 0, 0, '2019-12-31 08:20:25', '2019-12-31 08:20:25', '', '', 5),
(21, 'gehash', 'daliahshwshawadelsayed@gmail.com', NULL, NULL, '0101010101010', NULL, '$2y$10$VlSy6rA0Ydqo4gFz9wN5FubfMwLWBGHlVE6XjirTHaczu9IBFrISW', 3, 'hdsh', '30.107124999999996', '31.333293333333337', 'active', NULL, NULL, 0, 0, 0, '2020-01-01 11:07:29', '2020-01-01 11:07:29', '', '', 5),
(22, 'daliaa', 'appp@app.com', NULL, NULL, '010000000000', NULL, '$2y$10$g.LeKCrFDhevzGPV5XENmOxvQhlDJnFg9tU301V6jqx7ucUL7Xzx2', 3, 'xyz', '30.107135000000003', '31.333225000000002', 'active', NULL, NULL, 0, 0, 0, '2020-01-05 11:13:31', '2020-01-05 11:13:31', '', '', 5),
(23, 'dalia awad', 'daliaawadelsayed108@gmail.com', NULL, NULL, '01000000000', NULL, '$2y$10$FLyCKgt4sv4SkVClwQwR5OmHrduyqSwABHfgm7rGR.AIVq8QK1Uaa', 2, 'xyz', NULL, NULL, 'active', NULL, NULL, 0, 0, 0, '2020-01-05 12:59:16', '2020-01-05 12:59:43', '', '', 5),
(24, 'dalia', 'daliaawadelsayedd@gmail.com', NULL, NULL, '011949489855', NULL, '$2y$10$I12G8qGUafGSgfC3JaVTa.YG.1mrIv/WdcCSyh2cKoNWzoA6CN6we', 4, 'Shoubra', NULL, NULL, 'active', NULL, NULL, 0, 0, 0, '2020-01-05 13:35:17', '2020-02-18 11:53:47', '', 'fj1fnsjenvs:APA91bE65VO2-JY0AhaRdXQJkNl4xkz2dleBIbQTwmpZ8cTbLCvttSGqKT3rwPlbihEgB_-yip1O60XS2UJ4b9dae1CfnQrzO4buUzuRrcR2rq-tYNrFETUwlIMP6iEnUya5CWyEJSay', 5),
(25, 'Karim', 'mervat@yahoo.com', NULL, NULL, '011223344556677', NULL, '$2y$10$9DgJk.5ETBu21qYkd7.adud6k79Vh2hyiNzt.Kd5HbJhbbIpFhhCW', 2, 'nnnnnnnn', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2020-01-08 11:26:03', '2020-01-08 11:26:03', '', '', 5),
(26, 'nnnnnnnnnnnn', 'mer@yahoo.com', NULL, NULL, '02244668800', NULL, '$2y$10$ZU4vXtfozMlrmpfJm4FcEOG3RUIzaSG.NTGab9ruD8A1hoToD0Zie', 1, 'bbbbbbbb', '0', '0', 'active', NULL, NULL, 0, 0, 0, '2020-01-08 12:07:24', '2020-01-08 12:07:24', '', '', 5),
(27, 'nnnnnnnnnn', 'mervo@yahoo.com', NULL, NULL, '0123456712345', NULL, '$2y$10$uD5LafiKGQrWIWz5qh9DkeZ5ldR3xd7e7zmqBACgmitRDECa7UyE.', 1, 'vvvv', '0', '0', 'active', NULL, NULL, 0, 0, 0, '2020-01-09 09:39:41', '2020-01-09 09:39:41', '', '', 5),
(28, 'mervat', 'merv@yahoo.com', NULL, NULL, '098765432112345', NULL, '$2y$10$YU9nutkl0wctPk5NS1Wj4uknCOWZDjAE5fEUahd60n9ViuypWM8mi', 1, 'vvv', '0', '0', 'active', NULL, NULL, 0, 0, 0, '2020-01-09 09:42:56', '2020-01-13 10:49:54', '', '', 5),
(29, 'Kareem Hassan', 'karim@appp.com', NULL, NULL, '801119494098', NULL, '$2y$10$gQ8QOOVanGYn9vX4GuJaWeGv.vF2a8XLtmch1lPC5To4hwdW/P5y6', 3, '59 Lebanon, Mit Akaba', '0.0', '0.0', 'active', NULL, NULL, 0, 0, 0, '2020-01-14 11:05:03', '2020-01-14 11:05:03', '', '', 5),
(30, 'Karim', 'karim222120@app.com', NULL, NULL, '01333333333', NULL, '$2y$10$2qG5.A7eh4o/1KUh6nP37O06WXy3.kUh2DarCNep6XJiS65eV75aa', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2020-01-14 14:43:14', '2020-01-14 14:43:14', '', '', 5),
(31, 'dalia awad', 'user@app.com', NULL, NULL, '088888888888', NULL, '$2y$10$vCpIGN1tqAhMznQ3gu9cH.mDEmVyCsdXAZnhWlzEFGih1r8cbqrli', 2, 'obour', '30.107128333333335', '31.333246666666664', 'active', NULL, NULL, 0, 0, 0, '2020-01-15 07:43:09', '2020-01-15 07:43:09', '', '', 5),
(32, 'Karim', 'karim22s21m20@app.com', NULL, NULL, '055555555555', NULL, '$2y$10$v4ZPyCyBnIw.b2TOyQUrw.rK8pLER0vncWedekxAvF8wKoW8DBaRK', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2020-01-15 08:15:18', '2020-01-15 08:15:18', '', '', 5),
(33, 'user', 'user@user.com', NULL, NULL, '08888888888', NULL, '$2y$10$kz34FKxatGooDOutZFCxIOf4Hx.hOUGldhcEbTL.Leu13R7vbFciC', 2, 'userobour', '30.107446666666668', '31.333485000000003', 'active', NULL, NULL, 0, 0, 0, '2020-01-15 08:23:49', '2020-01-15 08:23:49', '', '', 5),
(34, 'hdsj', 'userrole@user.com', NULL, NULL, '09999999999', NULL, '$2y$10$Kll0buzGSeZL0S/Mmifqa.XYYcLg5hejwAaDnHvQQ9cJqcAExP31m', 2, 'oubour', '30.107446666666668', '31.333485000000003', 'active', NULL, NULL, 0, 0, 0, '2020-01-15 08:39:23', '2020-01-15 08:39:23', '', '', 5),
(35, 'Karim', 'x.kemo7@gmail.com', NULL, NULL, '01119494098', NULL, '$2y$10$ItCGO0T/zl3kJnt3wAc0W.3PDe2KIIerFqIywHyeJWG8NdnCdXxVa', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, '50', 0, 0, 0, '2020-01-22 13:38:51', '2020-02-10 13:38:07', '12354534655', '12354534655', 5),
(36, 'Karim', 'daliaawadelsayeddd@gmail.com', NULL, NULL, '0111944\n554494098', NULL, '$2y$10$knXxmQOSUQggjMmmwzqaIOoFJA0wClz7JtaLwCr7EwlDCpkxyn.g2', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2020-02-03 11:37:38', '2020-02-03 11:37:38', '', '', 5),
(37, 'Karim', 'dalia@dalia.com', NULL, NULL, '01119\n554494098', NULL, '$2y$10$Cxzvpe.AwRlSoq1CTAP6M.nq0fkXu6bZy3at9alUqaM63rH1tXe2K', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2020-02-05 13:15:52', '2020-02-05 13:15:52', '', '', 5),
(38, 'Karim', 'x.skemo7@gmail.com', NULL, NULL, '01119474098', NULL, '$2y$10$lCtXj3oV2dljMW3YHElOw.CU2JVNAooEbkHo9gbmw5LwotIqyer4O', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2020-02-16 14:39:39', '2020-02-16 14:39:39', '', '', 5),
(39, 'Karim', 'hahahaha@gmail.com', NULL, NULL, '01119494092', NULL, '$2y$10$dJTAwumMoSBnAq7RfxnD2eJxDfEnZ5/tzUDpktIDs5PpRhtbCWTDe', 2, 'xxx', '454354.1213', '5.55454', 'active', NULL, NULL, 0, 0, 0, '2020-02-16 14:46:33', '2020-02-16 14:46:33', '', '', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agents_email_unique` (`email`),
  ADD UNIQUE KEY `agents_phone_unique` (`phone`),
  ADD KEY `agents_category_id_foreign` (`category_id`),
  ADD KEY `agents_city_id_foreign` (`city_id`);

--
-- Indexes for table `apprates`
--
ALTER TABLE `apprates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_rates`
--
ALTER TABLE `app_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `u` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_agent_id_foreign` (`agent_id`),
  ADD KEY `orders_city_id_foreign` (`city_id`),
  ADD KEY `orders_category_id_foreign` (`category_id`),
  ADD KEY `orders_offer_id_foreign` (`offer_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`phone`),
  ADD KEY `users_city_id_foreign` (`city_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `app_rates`
--
ALTER TABLE `app_rates`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'add stages if the clint ask for points not going to be zeron and if stage one add 2 if stage 2 addd 5..', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
