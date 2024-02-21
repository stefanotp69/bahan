-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Feb 2024 pada 19.20
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_templating`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(8, '2024_02_21_013548_create_produks_table', 2),
(9, '2024_02_21_044233_create_transaksis_table', 3),
(10, '2024_02_21_081546_create_transaksi_details_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `produks`
--

CREATE TABLE `produks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `harga` bigint(20) NOT NULL DEFAULT 0,
  `stok` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `produks`
--

INSERT INTO `produks` (`id`, `name`, `harga`, `stok`, `created_at`, `updated_at`) VALUES
(1, 'Tanggo Vanila', 5000, 200, '2024-02-20 20:06:05', '2024-02-20 20:52:01'),
(2, 'Nabati', 3000, 500, '2024-02-20 20:06:37', '2024-02-20 20:06:37'),
(3, 'Nissin', 10000, 50, '2024-02-20 20:16:06', '2024-02-20 20:16:06'),
(4, 'Oreo', 2000, 300, '2024-02-20 20:17:48', '2024-02-20 20:17:48'),
(5, 'Bengbeng', 2000, 500, '2024-02-20 20:23:14', '2024-02-20 20:23:14'),
(6, 'Pillow', 20000, 100, '2024-02-20 20:23:39', '2024-02-20 20:23:39'),
(7, 'Top', 1000, 1000, '2024-02-20 20:33:36', '2024-02-20 20:33:36'),
(9, 'peposdent', 10000, 300, '2024-02-21 01:55:35', '2024-02-21 01:55:35'),
(10, 'sarden', 30000, 10, '2024-02-21 10:19:37', '2024-02-21 10:19:37'),
(11, 'Indomie', 3000, 1000, '2024-02-21 10:48:08', '2024-02-21 10:48:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksis`
--

CREATE TABLE `transaksis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total` bigint(20) NOT NULL,
  `kasir_name` varchar(255) DEFAULT NULL,
  `status` enum('selesai','tertunda') NOT NULL DEFAULT 'tertunda',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksis`
--

INSERT INTO `transaksis` (`id`, `user_id`, `total`, `kasir_name`, `status`, `created_at`, `updated_at`) VALUES
(25, 8, 76000, 'admin', 'selesai', '2024-02-21 10:36:48', '2024-02-21 10:39:55'),
(27, 8, 49000, 'admin', 'selesai', '2024-02-21 10:48:31', '2024-02-21 10:49:26'),
(28, 8, 15000, 'admin', 'selesai', '2024-02-21 10:49:56', '2024-02-21 10:51:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_details`
--

CREATE TABLE `transaksi_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transaksi_id` bigint(20) UNSIGNED NOT NULL,
  `produk_id` bigint(20) UNSIGNED NOT NULL,
  `produk_name` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `subtotal` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi_details`
--

INSERT INTO `transaksi_details` (`id`, `transaksi_id`, `produk_id`, `produk_name`, `qty`, `subtotal`, `created_at`, `updated_at`) VALUES
(3, 17, 9, 'peposdent', '2', '20000', '2024-02-21 06:05:41', '2024-02-21 06:34:36'),
(4, 17, 2, 'Nabati', '3', '9000', '2024-02-21 06:23:43', '2024-02-21 06:23:43'),
(5, 17, 4, 'Oreo', '10', '20000', '2024-02-21 06:23:58', '2024-02-21 06:34:09'),
(6, 18, 6, 'Pillow', '2', '40000', '2024-02-21 06:37:47', '2024-02-21 06:37:47'),
(7, 18, 5, 'Bengbeng', '3', '6000', '2024-02-21 06:37:53', '2024-02-21 06:37:53'),
(8, 18, 7, 'Top', '1', '1000', '2024-02-21 06:38:02', '2024-02-21 06:38:02'),
(9, 18, 3, 'Nissin', '6', '60000', '2024-02-21 06:47:27', '2024-02-21 06:47:42'),
(10, 19, 3, 'Nissin', '1', '10000', '2024-02-21 06:48:12', '2024-02-21 06:48:12'),
(11, 19, 5, 'Bengbeng', '1', '2000', '2024-02-21 06:48:16', '2024-02-21 06:48:16'),
(12, 20, 1, 'Tanggo Vanila', '2', '10000', '2024-02-21 06:54:54', '2024-02-21 06:54:54'),
(15, 21, 1, 'Tanggo Vanila', '2', '10000', '2024-02-21 07:31:54', '2024-02-21 07:31:54'),
(16, 21, 9, 'peposdent', '1', '10000', '2024-02-21 07:31:59', '2024-02-21 07:31:59'),
(18, 25, 1, 'Tanggo Vanila', '2', '10000', '2024-02-21 10:37:00', '2024-02-21 10:37:00'),
(19, 25, 6, 'Pillow', '3', '60000', '2024-02-21 10:37:06', '2024-02-21 10:37:06'),
(20, 25, 2, 'Nabati', '2', '6000', '2024-02-21 10:39:55', '2024-02-21 10:39:55'),
(21, 27, 3, 'Nissin', '4', '40000', '2024-02-21 10:48:41', '2024-02-21 10:49:08'),
(22, 27, 2, 'Nabati', '3', '9000', '2024-02-21 10:49:00', '2024-02-21 10:49:00'),
(23, 28, 1, 'Tanggo Vanila', '3', '15000', '2024-02-21 10:50:42', '2024-02-21 10:50:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'admin', 'admin@gmail.com', NULL, '$2y$12$bDDo4M84dXyE1SO0XwD8i.MHoT.EJiv0/2N0xsIq/O60JK6VsPxEC', NULL, '2024-02-21 10:35:59', '2024-02-21 10:42:12'),
(9, 'Stefano Talenta Putra', 'stefanotputra@gmail.com', NULL, '$2y$12$PhJDcYql9gOCmbu4a9DbEe8f0dX.UuqmTxml/JY7.uzZfDMV7XD4m', NULL, '2024-02-21 10:42:03', '2024-02-21 10:42:03');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `produks`
--
ALTER TABLE `produks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi_details`
--
ALTER TABLE `transaksi_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `produks`
--
ALTER TABLE `produks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `transaksis`
--
ALTER TABLE `transaksis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `transaksi_details`
--
ALTER TABLE `transaksi_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
