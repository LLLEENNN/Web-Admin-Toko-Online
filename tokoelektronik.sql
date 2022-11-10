-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2022 at 06:18 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoelektronik`
--

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
(25, '2014_10_12_000000_create_users_table', 1),
(26, '2014_10_12_100000_create_password_resets_table', 1),
(27, '2022_06_21_114847_add_paid_to_users', 1),
(28, '2022_06_22_174934_create_produks_table', 1),
(29, '2022_06_29_082506_create_transaksis_table', 1),
(30, '2022_06_29_082533_create_transaksi_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `produks`
--

INSERT INTO `produks` (`id`, `name`, `harga`, `deskripsi`, `category_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Kulkas LG 2 Pintu', '5000000', 'LG', 1, '062022301313861_LG 2 pintu.jpg', '2022-06-30 06:37:13', '2022-06-30 06:37:13'),
(2, 'Kulkas SAMSUNG 2 Pintu', '6000000', 'SAMSUNG', 1, '062022301341249_samsung 2 pintu.jpg', '2022-06-30 06:37:41', '2022-06-30 06:37:41'),
(3, 'Kulkas SHARP 2 Pintu', '4500000', 'SHARP', 1, '062022301309837_sharp 2 pintu.jpg', '2022-06-30 06:38:09', '2022-06-30 06:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `kode_payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_trx` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_item` int(10) UNSIGNED NOT NULL,
  `total_harga` bigint(20) UNSIGNED NOT NULL,
  `kode_unik` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kurir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detail_lokasi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksis`
--

INSERT INTO `transaksis` (`id`, `user_id`, `kode_payment`, `kode_trx`, `total_item`, `total_harga`, `kode_unik`, `status`, `resi`, `kurir`, `name`, `phone`, `detail_lokasi`, `deskripsi`, `metode`, `expired_at`, `created_at`, `updated_at`) VALUES
(1, 11, 'INV/PYM/2022-06-30/205', 'INV/PYM/2022-06-30/672', 7, 38000000, 592, 'MENUNGGU', NULL, NULL, 'jatis', '081235491399', NULL, NULL, NULL, '2022-07-01 06:24:14', '2022-06-30 06:24:14', '2022-06-30 06:24:14'),
(2, 1, 'INV/PYM/2022-06-30/399', 'INV/PYM/2022-06-30/603', 10, 38000000, 589, 'MENUNGGU', NULL, NULL, 'Admin', '081235491399', NULL, NULL, NULL, '2022-07-01 06:39:06', '2022-06-30 06:39:06', '2022-06-30 06:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaksi_id` int(10) UNSIGNED NOT NULL,
  `produk_id` int(10) UNSIGNED NOT NULL,
  `total_item` int(10) UNSIGNED NOT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_harga` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaksi_details`
--

INSERT INTO `transaksi_details` (`id`, `transaksi_id`, `produk_id`, `total_item`, `catatan`, `total_harga`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 4, 'CASH', 20000000, '2022-06-30 06:24:14', '2022-06-30 06:24:14'),
(2, 1, 9, 3, 'CREDIT', 18000000, '2022-06-30 06:24:14', '2022-06-30 06:24:14'),
(3, 1, 9, 4, 'CREDITS', 4000000, '2022-06-30 06:24:14', '2022-06-30 06:24:14'),
(4, 2, 1, 4, 'CASH', 20000000, '2022-06-30 06:39:06', '2022-06-30 06:39:06'),
(5, 2, 2, 3, 'CREDIT', 18000000, '2022-06-30 06:39:06', '2022-06-30 06:39:06'),
(6, 2, 3, 4, 'CREDITS', 4000000, '2022-06-30 06:39:06', '2022-06-30 06:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$5lylaGUu7MXc9TxLMMvUo.AFYPIwCHq1AsRXDrAi/hFWylcqUqMKG', NULL, '2022-06-30 06:36:43', '2022-06-30 06:36:43', NULL),
(2, 'Anggit Studio', 'anggitstudio@gmail.com', NULL, '$2y$10$6FA3UAnFmiUkiawLg4He1.xhvoqfMzL1oyWxqImDaAhSF/Ia/YUsK', NULL, '2022-07-04 06:30:36', '2022-07-04 06:30:36', '081235491366'),
(3, 'yoga', 'yoga@gmail.com', NULL, '$2y$10$dxy5TrKLoUwTvVaDimrS7eU/w97zpkAFkksroIf6yvuFDR/wEtZ7u', NULL, '2022-07-21 07:39:30', '2022-07-21 07:39:30', '08123456789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi_details`
--
ALTER TABLE `transaksi_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
