-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2024 at 05:48 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `cover`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'iphone 12', 'iphone-12', NULL, 5, '2024-03-21 19:23:07', '2024-04-11 07:47:00'),
(2, 'samsung', 'samsung', NULL, NULL, '2024-03-29 02:20:47', '2024-03-29 02:20:47'),
(3, 'Xiaomi', 'xiaomi', NULL, NULL, '2024-04-11 01:32:16', '2024-04-11 01:32:16'),
(4, 'Oppo', 'oppo', NULL, NULL, '2024-04-11 02:26:13', '2024-04-11 02:26:13'),
(5, 'iphone', 'iphone', NULL, NULL, '2024-04-11 07:43:05', '2024-04-11 07:43:05'),
(6, 'iphone 13', 'iphone-13', NULL, 5, '2024-04-11 07:43:59', '2024-04-11 07:46:50'),
(7, 'iphone 14', 'iphone-14', NULL, 5, '2024-04-11 07:44:13', '2024-04-11 07:44:13'),
(8, 'iphone 15', 'iphone-15', NULL, 5, '2024-04-11 07:44:31', '2024-04-11 07:44:31'),
(9, 'iphone 11', 'iphone-11', NULL, 5, '2024-04-11 08:09:53', '2024-04-11 08:09:53');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `uuid`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `conversions_disk`, `size`, `manipulations`, `custom_properties`, `generated_conversions`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(10, 'App\\Models\\Category', 2, '53a08a15-cb72-47e3-b9ee-ce04b2e2ce44', 'photo', '661647fd08f85_sszflip5', '661647fd08f85_sszflip5.jpg', 'image/jpeg', 'public', 'public', 11126, '[]', '[]', '[]', '[]', 1, '2024-04-10 01:04:13', '2024-04-10 01:04:13'),
(12, 'App\\Models\\Product', 2, 'bf19f77b-f6c7-4c37-876b-d168a07f79e4', 'gallery', '66164814474ea_ssS23ultra', '66164814474ea_ssS23ultra.png', 'image/png', 'public', 'public', 82026, '[]', '[]', '[]', '[]', 1, '2024-04-10 01:04:37', '2024-04-10 01:04:37'),
(13, 'App\\Models\\Category', 3, '94d3efac-893c-4834-883f-39d5a8855b7e', 'photo', '6617a00e170c6_xiaomi13Tpro', '6617a00e170c6_xiaomi13Tpro.png', 'image/png', 'public', 'public', 34671, '[]', '[]', '[]', '[]', 1, '2024-04-11 01:32:18', '2024-04-11 01:32:18'),
(16, 'App\\Models\\Product', 1, '1d9fff4d-6141-4044-82cd-3c35510b537b', 'gallery', '6617a630ae443_iphonẹ15plus', '6617a630ae443_iphonẹ15plus.png', 'image/png', 'public', 'public', 54705, '[]', '[]', '[]', '[]', 1, '2024-04-11 01:58:26', '2024-04-11 01:58:26'),
(17, 'App\\Models\\Product', 3, '58b72322-db0c-4fdc-a5ca-92870ba2309f', 'gallery', '6617ac49938d5_xiaomi13T', '6617ac49938d5_xiaomi13T.png', 'image/png', 'public', 'public', 62948, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:24:27', '2024-04-11 02:24:27'),
(18, 'App\\Models\\Category', 4, '1025b37b-6314-489b-8ce0-a3faa99d553d', 'photo', '6617acaa3c95b_oppoReno10pro', '6617acaa3c95b_oppoReno10pro.png', 'image/png', 'public', 'public', 70187, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:26:13', '2024-04-11 02:26:13'),
(19, 'App\\Models\\Product', 4, 'a3819705-5245-4b28-bb0f-6e4d0abb6afa', 'gallery', '6617acd9a7ad4_oppoFindX5Pro', '6617acd9a7ad4_oppoFindX5Pro.png', 'image/png', 'public', 'public', 71959, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:27:42', '2024-04-11 02:27:42'),
(20, 'App\\Models\\Product', 5, '2e56ddb6-a817-4de7-8fc9-ca474c80d7d4', 'gallery', '6617ad52319a4_iphone15promax', '6617ad52319a4_iphone15promax.png', 'image/png', 'public', 'public', 68298, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:28:51', '2024-04-11 02:28:51'),
(21, 'App\\Models\\Product', 6, 'e733b832-2e17-46d0-9aee-50818bdb68d0', 'gallery', '6617adac7d00f_iphone14promax', '6617adac7d00f_iphone14promax.png', 'image/png', 'public', 'public', 63466, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:30:22', '2024-04-11 02:30:22'),
(22, 'App\\Models\\Product', 7, 'f307f59c-5caa-4507-b6ac-0fb0108ccbfd', 'gallery', '6617adcf1294f_ssS22ultra', '6617adcf1294f_ssS22ultra.png', 'image/png', 'public', 'public', 70352, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:30:56', '2024-04-11 02:30:56'),
(23, 'App\\Models\\Product', 8, '8b63d442-c9e9-4786-8071-ab0abed04dc9', 'gallery', '6617adf69ce51_oppoReno8T', '6617adf69ce51_oppoReno8T.png', 'image/png', 'public', 'public', 60921, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:31:51', '2024-04-11 02:31:51'),
(24, 'App\\Models\\Product', 9, 'e8326ec3-895c-4c28-b4ed-42006c4437fd', 'gallery', '6617ae1a4ce0b_xiaomi13Lite', '6617ae1a4ce0b_xiaomi13Lite.png', 'image/png', 'public', 'public', 49240, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:32:41', '2024-04-11 02:32:41'),
(25, 'App\\Models\\Product', 10, 'e48ec275-2dec-4905-b333-3edc05464137', 'gallery', '6617af1cc29b0_iphone13promax', '6617af1cc29b0_iphone13promax.png', 'image/png', 'public', 'public', 72390, '[]', '[]', '[]', '[]', 1, '2024-04-11 02:36:30', '2024-04-11 02:36:30'),
(26, 'App\\Models\\Product', 1, '63bec907-4d8c-476f-98a0-c63b71065cd4', 'gallery', '6617cadc13c82_iphone13', '6617cadc13c82_iphone13.png', 'image/png', 'public', 'public', 49084, '[]', '[]', '[]', '[]', 2, '2024-04-11 04:34:55', '2024-04-11 04:34:55'),
(27, 'App\\Models\\Product', 1, '92dc3ac8-39ad-4dee-b9c1-ab4ba1c92b42', 'gallery', '6617cadc46018_iphone14', '6617cadc46018_iphone14.png', 'image/png', 'public', 'public', 54497, '[]', '[]', '[]', '[]', 3, '2024-04-11 04:34:55', '2024-04-11 04:34:55'),
(28, 'App\\Models\\Product', 1, 'f9c60c94-5ecb-418c-a36c-3010fce2492c', 'gallery', '6617cadc65e83_iphone14plus', '6617cadc65e83_iphone14plus.png', 'image/png', 'public', 'public', 56823, '[]', '[]', '[]', '[]', 4, '2024-04-11 04:34:55', '2024-04-11 04:34:55'),
(29, 'App\\Models\\Category', 5, '7fdf8e51-20cd-4d5c-be96-ad61d9fbe383', 'photo', '6617f6f875670_iphone14pro', '6617f6f875670_iphone14pro.png', 'image/png', 'public', 'public', 55842, '[]', '[]', '[]', '[]', 1, '2024-04-11 07:43:05', '2024-04-11 07:43:05'),
(31, 'App\\Models\\Category', 7, '8a3a05e4-55a5-42f2-92a4-f2813fb6d3c1', 'photo', '6617f73ab5dae_iphone14plus', '6617f73ab5dae_iphone14plus.png', 'image/png', 'public', 'public', 56823, '[]', '[]', '[]', '[]', 1, '2024-04-11 07:44:13', '2024-04-11 07:44:13'),
(32, 'App\\Models\\Category', 8, '523190d5-4296-40dc-9d0f-630fd741bf32', 'photo', '6617f74c2d012_iphone15plus', '6617f74c2d012_iphone15plus.png', 'image/png', 'public', 'public', 59872, '[]', '[]', '[]', '[]', 1, '2024-04-11 07:44:31', '2024-04-11 07:44:31'),
(33, 'App\\Models\\Category', 6, '7b3cf5e1-2118-4744-95b8-44099a111a3b', 'photo', '6617f7d97385c_iphone13', '6617f7d97385c_iphone13.png', 'image/png', 'public', 'public', 49084, '[]', '[]', '[]', '[]', 1, '2024-04-11 07:46:50', '2024-04-11 07:46:50'),
(34, 'App\\Models\\Category', 1, 'bfeb9e6d-172c-470d-9b74-5aa56b552a16', 'photo', '6617f7e3482d5_iphone12', '6617f7e3482d5_iphone12.png', 'image/png', 'public', 'public', 68724, '[]', '[]', '[]', '[]', 1, '2024-04-11 07:47:00', '2024-04-11 07:47:00'),
(35, 'App\\Models\\Product', 11, 'f2b490f9-b8ad-434b-93db-d93464a35a3b', 'gallery', '6617f82ed9928_iphone12promax', '6617f82ed9928_iphone12promax.png', 'image/png', 'public', 'public', 65822, '[]', '[]', '[]', '[]', 1, '2024-04-11 07:48:16', '2024-04-11 07:48:16'),
(36, 'App\\Models\\Category', 9, '2f9895b1-c789-4b12-80d5-9fa092f83886', 'photo', '6617fd2490c8c_iphone13', '6617fd2490c8c_iphone13.png', 'image/png', 'public', 'public', 49084, '[]', '[]', '[]', '[]', 1, '2024-04-11 08:09:53', '2024-04-11 08:09:53'),
(37, 'App\\Models\\Product', 12, '15b1b464-ae92-4c4b-89c1-7284d136448e', 'gallery', '6617fdb6c044c_iphone12', '6617fdb6c044c_iphone12.png', 'image/png', 'public', 'public', 68724, '[]', '[]', '[]', '[]', 1, '2024-04-11 08:12:05', '2024-04-11 08:12:05'),
(38, 'App\\Models\\Product', 12, 'ada1b1f3-eb97-41ca-8980-a98840212136', 'gallery', '6617fdb70dfe4_iphone12promax', '6617fdb70dfe4_iphone12promax.png', 'image/png', 'public', 'public', 65822, '[]', '[]', '[]', '[]', 2, '2024-04-11 08:12:05', '2024-04-11 08:12:05'),
(39, 'App\\Models\\Product', 12, '0e449993-b985-4e73-89b6-4c1d3273bf50', 'gallery', '6617fdb74d9d2_iphone13', '6617fdb74d9d2_iphone13.png', 'image/png', 'public', 'public', 49084, '[]', '[]', '[]', '[]', 3, '2024-04-11 08:12:05', '2024-04-11 08:12:05'),
(40, 'App\\Models\\Product', 12, '68dce612-45ef-48c0-9d56-7d3c5c467c88', 'gallery', '6617fdb78a2e7_iphone13promax', '6617fdb78a2e7_iphone13promax.png', 'image/png', 'public', 'public', 72390, '[]', '[]', '[]', '[]', 4, '2024-04-11 08:12:05', '2024-04-11 08:12:05'),
(41, 'App\\Models\\Product', 12, '055c919e-56b2-4b45-984a-90e0a370dae0', 'gallery', '6617fdb7c95d9_iphone14', '6617fdb7c95d9_iphone14.png', 'image/png', 'public', 'public', 54497, '[]', '[]', '[]', '[]', 5, '2024-04-11 08:12:05', '2024-04-11 08:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_03_30_011648_create_categories_table', 1),
(6, '2022_04_19_071658_create_media_table', 1),
(7, '2022_04_27_063355_create_tags_table', 1),
(8, '2022_04_28_210054_create_products_table', 1),
(9, '2022_05_05_055458_create_product_tag_table', 1),
(10, '2022_08_15_055828_create_orders_table', 1),
(11, '2022_08_16_053218_create_order_items_table', 1),
(12, '2022_08_16_053450_create_shipments_table', 1),
(13, '2022_08_16_053945_create_payments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `payment_due` datetime NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_total_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(16,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_postcode` int(11) DEFAULT NULL,
  `shipping_courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_service_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` bigint(20) UNSIGNED DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `cancelled_by` bigint(20) UNSIGNED DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancellation_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `code`, `status`, `order_date`, `payment_due`, `payment_status`, `payment_token`, `payment_url`, `base_total_price`, `tax_amount`, `tax_percent`, `discount_amount`, `discount_percent`, `shipping_cost`, `grand_total`, `notes`, `customer_first_name`, `customer_address`, `customer_address2`, `customer_phone`, `customer_email`, `customer_city`, `customer_province`, `customer_postcode`, `shipping_courier`, `shipping_service_name`, `approved_by`, `approved_at`, `cancelled_by`, `cancelled_at`, `cancellation_note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'INV/20240411/IV/XI/00001', 'created', '2024-04-11 07:36:35', '2024-04-14 07:36:35', 'unpaid', NULL, NULL, '12345767.00', '0.00', '0.00', '0.00', '0.00', '0.00', '12345767.00', 'bsdjbs', 'lanthanh03', 'acsaaac', NULL, '084227842', 'votranlanthanh.1311@gmail.com', 'caacac', 'ccasasc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-11 00:36:35', '2024-04-11 00:36:35', NULL),
(2, 3, 'INV/20240411/IV/XI/00002', 'created', '2024-04-11 11:26:05', '2024-04-14 11:26:05', 'unpaid', NULL, NULL, '25990000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '25990000.00', 'note note note', 'lanthanh03', '56 hoang dieu 2', NULL, '084227842', 'votranlanthanh.1311@gmail.com', 'thu duc', 'tphcm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-11 04:26:05', '2024-04-11 04:26:05', NULL),
(3, 3, 'INV/20240411/IV/XI/00003', 'created', '2024-04-11 15:15:56', '2024-04-14 15:15:56', 'unpaid', NULL, NULL, '65940000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '65940000.00', 'noehvghvjbjb', 'lanthanh03', '56 hoang dieu 2', NULL, '084227842', 'votranlanthanh.1311@gmail.com', 'thu duc', 'tphcm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-11 08:15:56', '2024-04-11 08:15:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `base_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `base_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `tax_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `discount_percent` decimal(16,2) NOT NULL DEFAULT 0.00,
  `sub_total` decimal(16,2) NOT NULL DEFAULT 0.00,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `qty`, `base_price`, `base_total`, `tax_amount`, `tax_percent`, `discount_amount`, `discount_percent`, `sub_total`, `name`, `weight`, `order_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, '12345767.00', '12345767.00', '0.00', '0.00', '0.00', '0.00', '12345767.00', 'samsung', '23.00', 1, 1, '2024-04-11 00:36:35', '2024-04-11 00:36:35'),
(2, 1, '25990000.00', '25990000.00', '0.00', '0.00', '0.00', '0.00', '25990000.00', 'Samsung S22 Ultra', '123.00', 2, 7, '2024-04-11 04:26:05', '2024-04-11 04:26:05'),
(3, 6, '10990000.00', '65940000.00', '0.00', '0.00', '0.00', '0.00', '65940000.00', 'iphone 11 pro max', '123.00', 3, 12, '2024-04-11 08:15:56', '2024-04-11 08:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ngaimy26@gmail.com', '$2y$10$VlOPIWwpnbGlJcGMDoCl5.BUOSl0kaNt3uFLEh6HgnLmlZYmVWvdu', '2024-04-05 02:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payloads` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payloads`)),
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biller_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` decimal(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `price`, `quantity`, `description`, `details`, `weight`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'iphone 15 plus', 'iphone-15-plus', 12345767, 33, 'gjhg', 'dhgh', '23.00', 8, '2024-03-21 19:25:20', '2024-04-11 07:45:12'),
(2, 'Samsung S23 Ultra', 'samsung-s23-ultra', 29999999, 3, '123', '123', '1.00', 2, '2024-03-29 02:21:37', '2024-04-11 02:31:21'),
(3, 'Xiaomi 13T pro', 'xiaomi-13t-pro', 10990000, 15, 'abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz', 'abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz abcxyz', '123.00', 3, '2024-04-11 01:39:23', '2024-04-11 01:39:23'),
(4, 'Oppo Find X5 Pro', 'oppo-find-x5-pro', 12990000, 20, 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc v', 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc', '123.00', 4, '2024-04-11 02:27:42', '2024-04-11 02:27:42'),
(5, 'Iphone 15 Pro Max', 'iphone-15-pro-max', 32990000, 50, 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', '123.00', 8, '2024-04-11 02:28:51', '2024-04-11 07:45:22'),
(6, 'Iphone 14 Pro Max', 'iphone-14-pro-max', 25990000, 45, 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', '123.00', 7, '2024-04-11 02:30:22', '2024-04-11 07:45:31'),
(7, 'Samsung S22 Ultra', 'samsung-s22-ultra', 25990000, 24, 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', '123.00', 2, '2024-04-11 02:30:56', '2024-04-11 04:26:05'),
(8, 'Oppo Reno 8T', 'oppo-reno-8t', 8990000, 35, 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', '123.00', 4, '2024-04-11 02:31:51', '2024-04-11 02:31:51'),
(9, 'Xiaomi 13 Lite', 'xiaomi-13-lite', 7990000, 24, 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', '123.00', 3, '2024-04-11 02:32:41', '2024-04-11 02:32:41'),
(10, 'Iphone 13 Pro Max', 'iphone-13-pro-max', 16990000, 27, 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc vv', '123.00', 6, '2024-04-11 02:36:30', '2024-04-11 07:47:21'),
(11, 'Iphone 12 Pro Max', 'iphone-12-pro-max', 13990000, 35, 'abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz', 'abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz abc xyz', '123.00', 1, '2024-04-11 07:48:16', '2024-04-11 07:48:16'),
(12, 'iphone 11 pro max', 'iphone-11-pro-max', 10990000, 28, 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc v', 'abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc abc v', '123.00', 9, '2024-04-11 08:12:05', '2024-04-11 08:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 5, 1, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 7, 1, NULL, NULL),
(8, 8, 2, NULL, NULL),
(9, 9, 2, NULL, NULL),
(10, 10, 1, NULL, NULL),
(11, 11, 1, NULL, NULL),
(12, 12, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `track_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_weight` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `shipped_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'expensive', 'expensive', '2024-03-21 19:23:29', '2024-03-21 19:23:29'),
(2, 'medium', 'medium', '2024-04-11 02:25:34', '2024-04-11 02:25:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `is_admin`, `address`, `address2`, `province`, `city`, `postcode`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', NULL, '$2y$10$9KOH9Yn/ieYhZvEMvXnuRu06UgUqVBexPcDqlKyTr0XKUMuEgzUoq', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'thanh', 'abc@gmail.com', NULL, '$2y$10$Htoy26ljMFFSxSdhAyoOEe/t02IsFCbCIXIx/DKMd1zJf8VWFO01S', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-21 19:21:53', '2024-03-21 19:21:53'),
(3, 'lanthanh03', 'votranlanthanh.1311@gmail.com', NULL, '$2y$10$APt4iDszsR4Ypk4TZHR7j.gVN3NdUlhvFXJGnv81VVaSNHxl.7YeS', 0, '56 hoang dieu 2', NULL, 'tphcm', 'thu duc', NULL, '084227842', 'xDIiB9CyPPN3yloelnnJXSWChh1OdtbaTXzQzoKif7WcuhxuworZCd2bcgqC', '2024-04-02 05:28:21', '2024-04-11 04:26:05'),
(4, 'myainguyen', 'ngaimy26@gmail.com', NULL, '$2y$10$0aluD6igGGiYf1LIYO02BuIO3sroQlVi/6.iqBfVTffUbYyiQApK2', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-05 02:02:26', '2024-04-05 02:02:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_unique` (`code`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_approved_by_foreign` (`approved_by`),
  ADD KEY `orders_cancelled_by_foreign` (`cancelled_by`),
  ADD KEY `orders_payment_token_index` (`payment_token`),
  ADD KEY `orders_code_index` (`code`),
  ADD KEY `orders_code_order_date_index` (`code`,`order_date`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_name_index` (`name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_number_unique` (`number`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_number_index` (`number`),
  ADD KEY `payments_method_index` (`method`),
  ADD KEY `payments_token_index` (`token`),
  ADD KEY `payments_payment_type_index` (`payment_type`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_user_id_foreign` (`user_id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_shipped_by_foreign` (`shipped_by`),
  ADD KEY `shipments_track_number_index` (`track_number`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `shipments_shipped_by_foreign` FOREIGN KEY (`shipped_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shipments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
