-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2022 at 05:12 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fadhilahfarm`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `nama_bank` varchar(100) DEFAULT NULL,
  `pemilik` varchar(100) DEFAULT NULL,
  `no_rek` varchar(100) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_id`, `nama_bank`, `pemilik`, `no_rek`, `logo`) VALUES
(1, 'BNI', 'Raihan', '12345678', 'bni.png');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `berita_id` int(11) NOT NULL,
  `berita_kategori_id` int(11) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `isi` longtext DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `jenis` enum('berita','halaman') DEFAULT NULL,
  `status` enum('draft','publish') DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`berita_id`, `berita_kategori_id`, `judul`, `slug`, `isi`, `tanggal`, `jenis`, `status`, `user_id`) VALUES
(1, 1, 'Tentang Kami', 'tentang-kami', '<p>Tentang Kami</p>\r\n\r\n<p>Web Fadhila Farm adalah toko online yang menjual berbagai hewan ternak dan pakan ternak</p>\r\n', '2016-05-13 14:54:24', 'halaman', 'publish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `berita_kategori`
--

CREATE TABLE `berita_kategori` (
  `berita_kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(100) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita_kategori`
--

INSERT INTO `berita_kategori` (`berita_kategori_id`, `nama_kategori`, `slug`) VALUES
(1, 'Humor', 'humor');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chat_id` bigint(20) UNSIGNED NOT NULL,
  `pengirim_id` bigint(20) UNSIGNED DEFAULT NULL,
  `penerima_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pesan` text NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`chat_id`, `pengirim_id`, `penerima_id`, `pesan`, `is_read`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 1, 'halo min', 2, '2022-08-11 09:34:07', '2022-08-11 09:34:07', NULL),
(2, 1, 2, 'holaaa', 0, '2022-08-11 11:02:43', '2022-08-11 11:02:43', NULL),
(3, 1, 2, 'holaaa', 0, '2022-08-11 11:02:44', '2022-08-11 11:02:44', NULL),
(4, 1, 2, 'holaaa', 0, '2022-08-11 11:02:45', '2022-08-11 11:02:45', NULL),
(5, 1, 2, 'holaa', 0, '2022-08-11 11:03:17', '2022-08-11 11:03:17', NULL),
(6, 1, 2, 'holaa', 0, '2022-08-11 11:03:29', '2022-08-11 11:03:29', NULL),
(7, 1, 2, 'ola', 0, '2022-08-11 11:04:26', '2022-08-11 11:04:26', NULL),
(8, 1, 2, 'ola', 0, '2022-08-11 11:04:28', '2022-08-11 11:04:28', NULL),
(9, 1, 2, 'ola', 0, '2022-08-11 11:04:29', '2022-08-11 11:04:29', NULL),
(10, 1, 2, 'asda', 0, '2022-08-11 11:04:36', '2022-08-11 11:04:36', NULL),
(11, 1, 2, 'dasdasd', 0, '2022-08-11 11:04:40', '2022-08-11 11:04:40', NULL),
(12, 1, 2, 'hola', 0, '2022-08-11 11:06:01', '2022-08-11 11:06:01', NULL),
(13, 1, 2, 'asasa', 0, '2022-08-11 11:06:03', '2022-08-11 11:06:03', NULL),
(14, 1, 2, 'haloo', 0, '2022-08-11 13:53:08', '2022-08-11 13:53:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `konfigurasi_id` int(11) NOT NULL,
  `nama_key` varchar(50) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `tipe` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`konfigurasi_id`, `nama_key`, `isi`, `tipe`) VALUES
(5, 'company-email', 'raihanf@gmail.com', 'umum'),
(4, 'company-phone', '0812 4945 6350', 'umum'),
(3, 'company-address', 'Magelang', 'umum'),
(2, 'company-name', 'Fadhilah Farm', 'umum'),
(1, 'nama-aplikasi', 'Fadhilah Farm', 'umum'),
(6, 'tema-aktif', 'lte', 'tema'),
(7, 'tema-logo', 'logo-c4ca4238a0b923820dcc509a6f75849b.png', 'tema');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_kota`
--

CREATE TABLE `lokasi_kota` (
  `kota_id` int(11) NOT NULL,
  `provinsi_id` int(11) DEFAULT NULL,
  `nama_kota` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi_kota`
--

INSERT INTO `lokasi_kota` (`kota_id`, `provinsi_id`, `nama_kota`) VALUES
(17, 1, 'Badung'),
(32, 1, 'Bangli'),
(94, 1, 'Buleleng'),
(114, 1, 'Denpasar'),
(128, 1, 'Gianyar'),
(161, 1, 'Jembrana'),
(170, 1, 'Karangasem'),
(197, 1, 'Klungkung'),
(447, 1, 'Tabanan'),
(27, 2, 'Bangka'),
(28, 2, 'Bangka Barat'),
(29, 2, 'Bangka Selatan'),
(30, 2, 'Bangka Tengah'),
(56, 2, 'Belitung'),
(57, 2, 'Belitung Timur'),
(334, 2, 'Pangkal Pinang'),
(106, 3, 'Cilegon'),
(232, 3, 'Lebak'),
(331, 3, 'Pandeglang'),
(402, 3, 'Serang'),
(403, 3, 'Serang'),
(455, 3, 'Tangerang'),
(456, 3, 'Tangerang'),
(457, 3, 'Tangerang Selatan'),
(62, 4, 'Bengkulu'),
(63, 4, 'Bengkulu Selatan'),
(64, 4, 'Bengkulu Tengah'),
(65, 4, 'Bengkulu Utara'),
(175, 4, 'Kaur'),
(183, 4, 'Kepahiang'),
(233, 4, 'Lebong'),
(294, 4, 'Muko Muko'),
(379, 4, 'Rejang Lebong'),
(397, 4, 'Seluma'),
(39, 5, 'Bantul'),
(135, 5, 'Gunung Kidul'),
(210, 5, 'Kulon Progo'),
(419, 5, 'Sleman'),
(501, 5, 'Yogyakarta'),
(151, 6, 'Jakarta Barat'),
(152, 6, 'Jakarta Pusat'),
(153, 6, 'Jakarta Selatan'),
(154, 6, 'Jakarta Timur'),
(155, 6, 'Jakarta Utara'),
(189, 6, 'Kepulauan Seribu'),
(77, 7, 'Boalemo'),
(88, 7, 'Bone Bolango'),
(129, 7, 'Gorontalo'),
(130, 7, 'Gorontalo'),
(131, 7, 'Gorontalo Utara'),
(361, 7, 'Pohuwato'),
(50, 8, 'Batang Hari'),
(97, 8, 'Bungo'),
(156, 8, 'Jambi'),
(194, 8, 'Kerinci'),
(280, 8, 'Merangin'),
(293, 8, 'Muaro Jambi'),
(393, 8, 'Sarolangun'),
(442, 8, 'Sungaipenuh'),
(460, 8, 'Tanjung Jabung Barat'),
(461, 8, 'Tanjung Jabung Timur'),
(471, 8, 'Tebo'),
(22, 9, 'Bandung'),
(23, 9, 'Bandung'),
(24, 9, 'Bandung Barat'),
(34, 9, 'Banjar'),
(54, 9, 'Bekasi'),
(55, 9, 'Bekasi'),
(78, 9, 'Bogor'),
(79, 9, 'Bogor'),
(103, 9, 'Ciamis'),
(104, 9, 'Cianjur'),
(107, 9, 'Cimahi'),
(108, 9, 'Cirebon'),
(109, 9, 'Cirebon'),
(115, 9, 'Depok'),
(126, 9, 'Garut'),
(149, 9, 'Indramayu'),
(171, 9, 'Karawang'),
(211, 9, 'Kuningan'),
(252, 9, 'Majalengka'),
(332, 9, 'Pangandaran'),
(376, 9, 'Purwakarta'),
(428, 9, 'Subang'),
(430, 9, 'Sukabumi'),
(431, 9, 'Sukabumi'),
(440, 9, 'Sumedang'),
(468, 9, 'Tasikmalaya'),
(469, 9, 'Tasikmalaya'),
(37, 10, 'Banjarnegara'),
(41, 10, 'Banyumas'),
(49, 10, 'Batang'),
(76, 10, 'Blora'),
(91, 10, 'Boyolali'),
(92, 10, 'Brebes'),
(105, 10, 'Cilacap'),
(113, 10, 'Demak'),
(134, 10, 'Grobogan'),
(163, 10, 'Jepara'),
(169, 10, 'Karanganyar'),
(177, 10, 'Kebumen'),
(181, 10, 'Kendal'),
(196, 10, 'Klaten'),
(209, 10, 'Kudus'),
(249, 10, 'Magelang'),
(250, 10, 'Magelang'),
(344, 10, 'Pati'),
(348, 10, 'Pekalongan'),
(349, 10, 'Pekalongan'),
(352, 10, 'Pemalang'),
(375, 10, 'Purbalingga'),
(377, 10, 'Purworejo'),
(380, 10, 'Rembang'),
(386, 10, 'Salatiga'),
(398, 10, 'Semarang'),
(399, 10, 'Semarang'),
(427, 10, 'Sragen'),
(433, 10, 'Sukoharjo'),
(445, 10, 'Surakarta (Solo)'),
(472, 10, 'Tegal'),
(473, 10, 'Tegal'),
(476, 10, 'Temanggung'),
(497, 10, 'Wonogiri'),
(498, 10, 'Wonosobo'),
(31, 11, 'Bangkalan'),
(42, 11, 'Banyuwangi'),
(51, 11, 'Batu'),
(74, 11, 'Blitar'),
(75, 11, 'Blitar'),
(80, 11, 'Bojonegoro'),
(86, 11, 'Bondowoso'),
(133, 11, 'Gresik'),
(160, 11, 'Jember'),
(164, 11, 'Jombang'),
(178, 11, 'Kediri'),
(179, 11, 'Kediri'),
(222, 11, 'Lamongan'),
(243, 11, 'Lumajang'),
(247, 11, 'Madiun'),
(248, 11, 'Madiun'),
(251, 11, 'Magetan'),
(256, 11, 'Malang'),
(255, 11, 'Malang'),
(289, 11, 'Mojokerto'),
(290, 11, 'Mojokerto'),
(305, 11, 'Nganjuk'),
(306, 11, 'Ngawi'),
(317, 11, 'Pacitan'),
(330, 11, 'Pamekasan'),
(342, 11, 'Pasuruan'),
(343, 11, 'Pasuruan'),
(363, 11, 'Ponorogo'),
(369, 11, 'Probolinggo'),
(370, 11, 'Probolinggo'),
(390, 11, 'Sampang'),
(409, 11, 'Sidoarjo'),
(418, 11, 'Situbondo'),
(441, 11, 'Sumenep'),
(444, 11, 'Surabaya'),
(487, 11, 'Trenggalek'),
(489, 11, 'Tuban'),
(492, 11, 'Tulungagung'),
(61, 12, 'Bengkayang'),
(168, 12, 'Kapuas Hulu'),
(176, 12, 'Kayong Utara'),
(195, 12, 'Ketapang'),
(208, 12, 'Kubu Raya'),
(228, 12, 'Landak'),
(279, 12, 'Melawi'),
(364, 12, 'Pontianak'),
(365, 12, 'Pontianak'),
(388, 12, 'Sambas'),
(391, 12, 'Sanggau'),
(395, 12, 'Sekadau'),
(415, 12, 'Singkawang'),
(417, 12, 'Sintang'),
(18, 13, 'Balangan'),
(33, 13, 'Banjar'),
(35, 13, 'Banjarbaru'),
(36, 13, 'Banjarmasin'),
(43, 13, 'Barito Kuala'),
(143, 13, 'Hulu Sungai Selatan'),
(144, 13, 'Hulu Sungai Tengah'),
(145, 13, 'Hulu Sungai Utara'),
(203, 13, 'Kotabaru'),
(446, 13, 'Tabalong'),
(452, 13, 'Tanah Bumbu'),
(454, 13, 'Tanah Laut'),
(466, 13, 'Tapin'),
(44, 14, 'Barito Selatan'),
(45, 14, 'Barito Timur'),
(46, 14, 'Barito Utara'),
(136, 14, 'Gunung Mas'),
(167, 14, 'Kapuas'),
(174, 14, 'Katingan'),
(205, 14, 'Kotawaringin Barat'),
(206, 14, 'Kotawaringin Timur'),
(221, 14, 'Lamandau'),
(296, 14, 'Murung Raya'),
(326, 14, 'Palangka Raya'),
(371, 14, 'Pulang Pisau'),
(405, 14, 'Seruyan'),
(432, 14, 'Sukamara'),
(19, 15, 'Balikpapan'),
(66, 15, 'Berau'),
(89, 15, 'Bontang'),
(214, 15, 'Kutai Barat'),
(215, 15, 'Kutai Kartanegara'),
(216, 15, 'Kutai Timur'),
(341, 15, 'Paser'),
(354, 15, 'Penajam Paser Utara'),
(387, 15, 'Samarinda'),
(96, 16, 'Bulungan (Bulongan)'),
(257, 16, 'Malinau'),
(311, 16, 'Nunukan'),
(450, 16, 'Tana Tidung'),
(467, 16, 'Tarakan'),
(48, 17, 'Batam'),
(71, 17, 'Bintan'),
(172, 17, 'Karimun'),
(184, 17, 'Kepulauan Anambas'),
(237, 17, 'Lingga'),
(302, 17, 'Natuna'),
(462, 17, 'Tanjung Pinang'),
(21, 18, 'Bandar Lampung'),
(223, 18, 'Lampung Barat'),
(224, 18, 'Lampung Selatan'),
(225, 18, 'Lampung Tengah'),
(226, 18, 'Lampung Timur'),
(227, 18, 'Lampung Utara'),
(282, 18, 'Mesuji'),
(283, 18, 'Metro'),
(355, 18, 'Pesawaran'),
(356, 18, 'Pesisir Barat'),
(368, 18, 'Pringsewu'),
(458, 18, 'Tanggamus'),
(490, 18, 'Tulang Bawang'),
(491, 18, 'Tulang Bawang Barat'),
(496, 18, 'Way Kanan'),
(14, 19, 'Ambon'),
(99, 19, 'Buru'),
(100, 19, 'Buru Selatan'),
(185, 19, 'Kepulauan Aru'),
(258, 19, 'Maluku Barat Daya'),
(259, 19, 'Maluku Tengah'),
(260, 19, 'Maluku Tenggara'),
(261, 19, 'Maluku Tenggara Barat'),
(400, 19, 'Seram Bagian Barat'),
(401, 19, 'Seram Bagian Timur'),
(488, 19, 'Tual'),
(138, 20, 'Halmahera Barat'),
(139, 20, 'Halmahera Selatan'),
(140, 20, 'Halmahera Tengah'),
(141, 20, 'Halmahera Timur'),
(142, 20, 'Halmahera Utara'),
(191, 20, 'Kepulauan Sula'),
(372, 20, 'Pulau Morotai'),
(477, 20, 'Ternate'),
(478, 20, 'Tidore Kepulauan'),
(1, 21, 'Aceh Barat'),
(2, 21, 'Aceh Barat Daya'),
(3, 21, 'Aceh Besar'),
(4, 21, 'Aceh Jaya'),
(5, 21, 'Aceh Selatan'),
(6, 21, 'Aceh Singkil'),
(7, 21, 'Aceh Tamiang'),
(8, 21, 'Aceh Tengah'),
(9, 21, 'Aceh Tenggara'),
(10, 21, 'Aceh Timur'),
(11, 21, 'Aceh Utara'),
(20, 21, 'Banda Aceh'),
(59, 21, 'Bener Meriah'),
(72, 21, 'Bireuen'),
(127, 21, 'Gayo Lues'),
(230, 21, 'Langsa'),
(235, 21, 'Lhokseumawe'),
(300, 21, 'Nagan Raya'),
(358, 21, 'Pidie'),
(359, 21, 'Pidie Jaya'),
(384, 21, 'Sabang'),
(414, 21, 'Simeulue'),
(429, 21, 'Subulussalam'),
(68, 22, 'Bima'),
(69, 22, 'Bima'),
(118, 22, 'Dompu'),
(238, 22, 'Lombok Barat'),
(239, 22, 'Lombok Tengah'),
(240, 22, 'Lombok Timur'),
(241, 22, 'Lombok Utara'),
(276, 22, 'Mataram'),
(438, 22, 'Sumbawa'),
(439, 22, 'Sumbawa Barat'),
(13, 23, 'Alor'),
(58, 23, 'Belu'),
(122, 23, 'Ende'),
(125, 23, 'Flores Timur'),
(212, 23, 'Kupang'),
(213, 23, 'Kupang'),
(234, 23, 'Lembata'),
(269, 23, 'Manggarai'),
(270, 23, 'Manggarai Barat'),
(271, 23, 'Manggarai Timur'),
(301, 23, 'Nagekeo'),
(304, 23, 'Ngada'),
(383, 23, 'Rote Ndao'),
(385, 23, 'Sabu Raijua'),
(412, 23, 'Sikka'),
(434, 23, 'Sumba Barat'),
(435, 23, 'Sumba Barat Daya'),
(436, 23, 'Sumba Tengah'),
(437, 23, 'Sumba Timur'),
(479, 23, 'Timor Tengah Selatan'),
(480, 23, 'Timor Tengah Utara'),
(16, 24, 'Asmat'),
(67, 24, 'Biak Numfor'),
(90, 24, 'Boven Digoel'),
(111, 24, 'Deiyai (Deliyai)'),
(117, 24, 'Dogiyai'),
(150, 24, 'Intan Jaya'),
(157, 24, 'Jayapura'),
(158, 24, 'Jayapura'),
(159, 24, 'Jayawijaya'),
(180, 24, 'Keerom'),
(193, 24, 'Kepulauan Yapen (Yapen Waropen)'),
(231, 24, 'Lanny Jaya'),
(263, 24, 'Mamberamo Raya'),
(264, 24, 'Mamberamo Tengah'),
(274, 24, 'Mappi'),
(281, 24, 'Merauke'),
(284, 24, 'Mimika'),
(299, 24, 'Nabire'),
(303, 24, 'Nduga'),
(335, 24, 'Paniai'),
(347, 24, 'Pegunungan Bintang'),
(373, 24, 'Puncak'),
(374, 24, 'Puncak Jaya'),
(392, 24, 'Sarmi'),
(443, 24, 'Supiori'),
(484, 24, 'Tolikara'),
(495, 24, 'Waropen'),
(499, 24, 'Yahukimo'),
(500, 24, 'Yalimo'),
(124, 25, 'Fakfak'),
(165, 25, 'Kaimana'),
(272, 25, 'Manokwari'),
(273, 25, 'Manokwari Selatan'),
(277, 25, 'Maybrat'),
(346, 25, 'Pegunungan Arfak'),
(378, 25, 'Raja Ampat'),
(424, 25, 'Sorong'),
(425, 25, 'Sorong'),
(426, 25, 'Sorong Selatan'),
(449, 25, 'Tambrauw'),
(474, 25, 'Teluk Bintuni'),
(475, 25, 'Teluk Wondama'),
(60, 26, 'Bengkalis'),
(120, 26, 'Dumai'),
(147, 26, 'Indragiri Hilir'),
(148, 26, 'Indragiri Hulu'),
(166, 26, 'Kampar'),
(187, 26, 'Kepulauan Meranti'),
(207, 26, 'Kuantan Singingi'),
(350, 26, 'Pekanbaru'),
(351, 26, 'Pelalawan'),
(381, 26, 'Rokan Hilir'),
(382, 26, 'Rokan Hulu'),
(406, 26, 'Siak'),
(253, 27, 'Majene'),
(262, 27, 'Mamasa'),
(265, 27, 'Mamuju'),
(266, 27, 'Mamuju Utara'),
(362, 27, 'Polewali Mandar'),
(38, 28, 'Bantaeng'),
(47, 28, 'Barru'),
(87, 28, 'Bone'),
(95, 28, 'Bulukumba'),
(123, 28, 'Enrekang'),
(132, 28, 'Gowa'),
(162, 28, 'Jeneponto'),
(244, 28, 'Luwu'),
(245, 28, 'Luwu Timur'),
(246, 28, 'Luwu Utara'),
(254, 28, 'Makassar'),
(275, 28, 'Maros'),
(328, 28, 'Palopo'),
(333, 28, 'Pangkajene Kepulauan'),
(336, 28, 'Parepare'),
(360, 28, 'Pinrang'),
(396, 28, 'Selayar (Kepulauan Selayar)'),
(408, 28, 'Sidenreng Rappang/Rapang'),
(416, 28, 'Sinjai'),
(423, 28, 'Soppeng'),
(448, 28, 'Takalar'),
(451, 28, 'Tana Toraja'),
(486, 28, 'Toraja Utara'),
(493, 28, 'Wajo'),
(25, 29, 'Banggai'),
(26, 29, 'Banggai Kepulauan'),
(98, 29, 'Buol'),
(119, 29, 'Donggala'),
(291, 29, 'Morowali'),
(329, 29, 'Palu'),
(338, 29, 'Parigi Moutong'),
(366, 29, 'Poso'),
(410, 29, 'Sigi'),
(482, 29, 'Tojo Una-Una'),
(483, 29, 'Toli-Toli'),
(53, 30, 'Bau-Bau'),
(85, 30, 'Bombana'),
(101, 30, 'Buton'),
(102, 30, 'Buton Utara'),
(182, 30, 'Kendari'),
(198, 30, 'Kolaka'),
(199, 30, 'Kolaka Utara'),
(200, 30, 'Konawe'),
(201, 30, 'Konawe Selatan'),
(202, 30, 'Konawe Utara'),
(295, 30, 'Muna'),
(494, 30, 'Wakatobi'),
(73, 31, 'Bitung'),
(81, 31, 'Bolaang Mongondow (Bolmong)'),
(82, 31, 'Bolaang Mongondow Selatan'),
(83, 31, 'Bolaang Mongondow Timur'),
(84, 31, 'Bolaang Mongondow Utara'),
(188, 31, 'Kepulauan Sangihe'),
(190, 31, 'Kepulauan Siau Tagulandang Biaro (Sitaro)'),
(192, 31, 'Kepulauan Talaud'),
(204, 31, 'Kotamobagu'),
(267, 31, 'Manado'),
(285, 31, 'Minahasa'),
(286, 31, 'Minahasa Selatan'),
(287, 31, 'Minahasa Tenggara'),
(288, 31, 'Minahasa Utara'),
(485, 31, 'Tomohon'),
(12, 32, 'Agam'),
(93, 32, 'Bukittinggi'),
(116, 32, 'Dharmasraya'),
(186, 32, 'Kepulauan Mentawai'),
(236, 32, 'Lima Puluh Koto/Kota'),
(318, 32, 'Padang'),
(321, 32, 'Padang Panjang'),
(322, 32, 'Padang Pariaman'),
(337, 32, 'Pariaman'),
(339, 32, 'Pasaman'),
(340, 32, 'Pasaman Barat'),
(345, 32, 'Payakumbuh'),
(357, 32, 'Pesisir Selatan'),
(394, 32, 'Sawah Lunto'),
(411, 32, 'Sijunjung (Sawah Lunto Sijunjung)'),
(420, 32, 'Solok'),
(421, 32, 'Solok'),
(422, 32, 'Solok Selatan'),
(453, 32, 'Tanah Datar'),
(40, 33, 'Banyuasin'),
(121, 33, 'Empat Lawang'),
(220, 33, 'Lahat'),
(242, 33, 'Lubuk Linggau'),
(292, 33, 'Muara Enim'),
(297, 33, 'Musi Banyuasin'),
(298, 33, 'Musi Rawas'),
(312, 33, 'Ogan Ilir'),
(313, 33, 'Ogan Komering Ilir'),
(314, 33, 'Ogan Komering Ulu'),
(315, 33, 'Ogan Komering Ulu Selatan'),
(316, 33, 'Ogan Komering Ulu Timur'),
(324, 33, 'Pagar Alam'),
(327, 33, 'Palembang'),
(367, 33, 'Prabumulih'),
(15, 34, 'Asahan'),
(52, 34, 'Batu Bara'),
(70, 34, 'Binjai'),
(110, 34, 'Dairi'),
(112, 34, 'Deli Serdang'),
(137, 34, 'Gunungsitoli'),
(146, 34, 'Humbang Hasundutan'),
(173, 34, 'Karo'),
(217, 34, 'Labuhan Batu'),
(218, 34, 'Labuhan Batu Selatan'),
(219, 34, 'Labuhan Batu Utara'),
(229, 34, 'Langkat'),
(268, 34, 'Mandailing Natal'),
(278, 34, 'Medan'),
(307, 34, 'Nias'),
(308, 34, 'Nias Barat'),
(309, 34, 'Nias Selatan'),
(310, 34, 'Nias Utara'),
(319, 34, 'Padang Lawas'),
(320, 34, 'Padang Lawas Utara'),
(323, 34, 'Padang Sidempuan'),
(325, 34, 'Pakpak Bharat'),
(353, 34, 'Pematang Siantar'),
(389, 34, 'Samosir'),
(404, 34, 'Serdang Bedagai'),
(407, 34, 'Sibolga'),
(413, 34, 'Simalungun'),
(459, 34, 'Tanjung Balai'),
(463, 34, 'Tapanuli Selatan'),
(464, 34, 'Tapanuli Tengah'),
(465, 34, 'Tapanuli Utara'),
(470, 34, 'Tebing Tinggi'),
(481, 34, 'Toba Samosir');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_provinsi`
--

CREATE TABLE `lokasi_provinsi` (
  `provinsi_id` int(11) NOT NULL,
  `nama_provinsi` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi_provinsi`
--

INSERT INTO `lokasi_provinsi` (`provinsi_id`, `nama_provinsi`) VALUES
(1, 'Bali'),
(2, 'Bangka Belitung'),
(3, 'Banten'),
(4, 'Bengkulu'),
(5, 'DI Yogyakarta'),
(6, 'DKI Jakarta'),
(7, 'Gorontalo'),
(8, 'Jambi'),
(9, 'Jawa Barat'),
(10, 'Jawa Tengah'),
(11, 'Jawa Timur'),
(12, 'Kalimantan Barat'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Timur'),
(16, 'Kalimantan Utara'),
(17, 'Kepulauan Riau'),
(18, 'Lampung'),
(19, 'Maluku'),
(20, 'Maluku Utara'),
(21, 'Nanggroe Aceh Darussalam (NAD)'),
(22, 'Nusa Tenggara Barat (NTB)'),
(23, 'Nusa Tenggara Timur (NTT)'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Riau'),
(27, 'Sulawesi Barat'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tengah'),
(30, 'Sulawesi Tenggara'),
(31, 'Sulawesi Utara'),
(32, 'Sumatera Barat'),
(33, 'Sumatera Selatan'),
(34, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `pelanggan_id` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `hp` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `kota` varchar(60) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`pelanggan_id`, `nama_pelanggan`, `alamat`, `hp`, `email`, `kota`, `user_id`) VALUES
(1, 'taufik', 'Jl. Nungcik', '0898387271', 'taufikgoodman@gmail.com', '327', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `pembelian_id` int(11) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` enum('daftar','selesai') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `pembelian_detail_id` int(11) NOT NULL,
  `pembelian_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_temp`
--

CREATE TABLE `pembelian_temp` (
  `pembelian_temp_id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `penjualan_id` int(11) NOT NULL,
  `invoice` varchar(40) DEFAULT NULL,
  `pelanggan_id` int(11) DEFAULT NULL,
  `kota` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `kurir` varchar(20) DEFAULT NULL,
  `pelayanan` varchar(50) DEFAULT NULL,
  `ongkir` bigint(20) DEFAULT NULL,
  `berat` int(11) DEFAULT NULL,
  `status` enum('draft','konfirmasi','lunas') DEFAULT NULL,
  `promo` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`penjualan_id`, `invoice`, `pelanggan_id`, `kota`, `alamat`, `tanggal`, `total`, `kurir`, `pelayanan`, `ongkir`, `berat`, `status`, `promo`) VALUES
(14, '1622734833', 1, '327', 'Jl. Nungcik', '2021-06-03 22:40:33', 10000000, 'Armada Peternakan', 'REG', 34000, 100, 'draft', 0),
(15, '1622734911', 1, '327', 'Jl. Nungcik', '2021-06-03 22:41:51', 10000000, 'Armada Peternakan', 'Paket Kilat Khusus', 33000, 100, 'lunas', 0),
(16, '1660116693', 1, '327', 'Jl. Nungcik', '2022-08-10 09:31:33', 5000000, 'Armada Peternakan', 'OKE', 31000, 100, 'lunas', 0),
(17, '1660124835', 1, '327', 'Jl. Nungcik', '2022-08-10 11:47:15', 180000000, 'Armada Peternakan', 'Pos Reguler', 33000, 200, 'konfirmasi', 0),
(18, '1660155253', 1, '327', 'Jl. Nungcik', '2022-08-10 20:14:13', 5000000, '', 'Ambil Sendiri', 0, 100, 'draft', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `penjualan_detail_id` int(11) NOT NULL,
  `penjualan_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`penjualan_detail_id`, `penjualan_id`, `produk_id`, `qty`, `harga`, `subtotal`, `keterangan`) VALUES
(14, 14, 18, 2, 5000000, 10000000, 'Yang bagus ya sapinya'),
(15, 15, 18, 2, 5000000, 10000000, ''),
(16, 16, 18, 1, 5000000, 5000000, ''),
(17, 17, 18, 4, 5000000, 20000000, ''),
(18, 17, 19, 16, 10000000, 160000000, ''),
(19, 18, 18, 1, 5000000, 5000000, '');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_konfirmasi`
--

CREATE TABLE `penjualan_konfirmasi` (
  `konfirmasi_id` int(11) NOT NULL,
  `invoice` varchar(100) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `pemilik` varchar(100) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `tanggal_transfer` date DEFAULT NULL,
  `bukti_transfer` varchar(100) DEFAULT NULL,
  `penjualan_id` int(11) DEFAULT NULL,
  `status_bukti` enum('pending','diterima','ditolak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_konfirmasi`
--

INSERT INTO `penjualan_konfirmasi` (`konfirmasi_id`, `invoice`, `bank_id`, `pemilik`, `tanggal`, `tanggal_transfer`, `bukti_transfer`, `penjualan_id`, `status_bukti`) VALUES
(7, '1660116693', 1, 'taufik', '2022-08-10 09:32:38', '2022-08-10', 'bukti-1660116693.jpg', 16, 'ditolak'),
(8, '1622734911', 1, 'taufik', '2022-08-10 09:33:35', '2022-08-10', 'bukti-1622734911.jpg', 15, 'diterima'),
(9, '1622734833', 1, 'taufik', '2022-08-10 09:34:05', '2022-08-10', 'bukti-1622734833.jpg', 14, 'ditolak'),
(13, '1660116693', 1, 'taufik', '2022-08-10 11:11:58', '2022-08-10', 'bukti-1660116693.jpg', 16, 'diterima'),
(14, '1660124835', 1, 'taufik', '2022-08-10 11:48:38', '2022-08-10', 'bukti-1660124835.jpg', 17, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `kode_produk` varchar(30) DEFAULT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `merek_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `berat` double DEFAULT NULL,
  `jumlah_lihat` int(11) DEFAULT NULL,
  `jumlah_beli` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `kode_produk`, `nama_produk`, `supplier_id`, `merek_id`, `kategori_id`, `deskripsi`, `harga`, `berat`, `jumlah_lihat`, `jumlah_beli`) VALUES
(18, '1', 'Sapi', 1, 0, 1, '<p>Sapi Sehat</p>\r\n\r\n<p>Jantan</p>\r\n\r\n<p>Umur 3 Tahun</p>\r\n', 5000000, 100, 0, 6),
(19, '2', 'Domba', 1, 0, 1, '<p>Domba Sehat</p>\r\n\r\n<p>Jantan</p>\r\n\r\n<p>Umur 5 Tahun<br>\r\n </p>\r\n', 10000000, 100, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `produk_kategori`
--

CREATE TABLE `produk_kategori` (
  `kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_kategori`
--

INSERT INTO `produk_kategori` (`kategori_id`, `nama_kategori`) VALUES
(2, 'Pakan Ternak'),
(1, 'Hewan'),
(0, 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `produk_merek`
--

CREATE TABLE `produk_merek` (
  `merek_id` int(11) NOT NULL,
  `nama_merek` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_merek`
--

INSERT INTO `produk_merek` (`merek_id`, `nama_merek`) VALUES
(4, 'Adidas');

-- --------------------------------------------------------

--
-- Table structure for table `produk_photo`
--

CREATE TABLE `produk_photo` (
  `photo_id` int(11) NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_photo`
--

INSERT INTO `produk_photo` (`photo_id`, `produk_id`, `photo`) VALUES
(9, 1, 'produk_1-3.jpg'),
(8, 1, 'produk_1-2.jpg'),
(7, 1, 'produk_1-1.jpg'),
(10, 1, 'produk_1-4.jpg'),
(12, 2, 'produk_2-1.jpg'),
(17, 5, 'produk_5-1.jpg'),
(16, 4, 'produk_4-1.jpg'),
(18, 6, 'produk_6-1.jpg'),
(82, 8, 'produk_8-1.png'),
(22, 3, 'produk_3-1.jpg'),
(78, 7, 'produk_7-1.png'),
(86, 9, 'produk_9-1.png'),
(90, 10, 'produk_10-1.png'),
(94, 12, 'produk_12-1.png'),
(95, 13, 'produk_13-1.png'),
(96, 14, 'produk_14-1.png'),
(102, 16, 'produk_16-1.png'),
(106, 17, 'produk_17-1.png'),
(113, 18, 'produk_18-1.jpg'),
(109, 19, 'produk_19-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `produk_stok`
--

CREATE TABLE `produk_stok` (
  `stok_id` int(11) NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `toko_id` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `stok_mutasi` int(11) DEFAULT NULL,
  `stok_jual` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk_stok`
--

INSERT INTO `produk_stok` (`stok_id`, `produk_id`, `toko_id`, `stok`, `stok_mutasi`, `stok_jual`) VALUES
(21, 18, 1, 100, 0, 6),
(22, 19, 1, 10, 0, 0),
(18, 15, 1, 1000, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `produk_ukuran`
--

CREATE TABLE `produk_ukuran` (
  `ukuran_id` int(11) NOT NULL,
  `nama_ukuran` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `produk_warna`
--

CREATE TABLE `produk_warna` (
  `warna_id` int(11) NOT NULL,
  `nama_warna` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promo`
--

CREATE TABLE `promo` (
  `promo_id` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `deskripsi` longtext DEFAULT NULL,
  `nilai` bigint(20) DEFAULT NULL,
  `mulai` date DEFAULT NULL,
  `selesai` date DEFAULT NULL,
  `banner_gambar` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promo_data`
--

CREATE TABLE `promo_data` (
  `promo_data_id` int(11) NOT NULL,
  `promo_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `nama_supplier` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `telepon` varchar(30) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `nama_supplier`, `alamat`, `telepon`, `user_id`) VALUES
(1, 'Supplier Pakaian', 'Alamat', '123123', 3);

-- --------------------------------------------------------

--
-- Table structure for table `toko`
--

CREATE TABLE `toko` (
  `toko_id` int(11) NOT NULL,
  `nama_toko` varchar(100) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `telepon` varchar(30) DEFAULT NULL,
  `kota` varchar(50) DEFAULT NULL,
  `tipe` enum('pusat','cabang') DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko`
--

INSERT INTO `toko` (`toko_id`, `nama_toko`, `alamat`, `telepon`, `kota`, `tipe`) VALUES
(1, 'Fadhila Farm', 'Jalan Gunung pangilun', '12345', '318', 'pusat'),
(3, 'Fadhila Farm\r\n', 'Jalan Bukittinggi', '55555', '93', 'cabang');

-- --------------------------------------------------------

--
-- Table structure for table `toko_mutasi`
--

CREATE TABLE `toko_mutasi` (
  `mutasi_id` int(11) NOT NULL,
  `tanggal` datetime DEFAULT NULL,
  `toko_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko_mutasi`
--

INSERT INTO `toko_mutasi` (`mutasi_id`, `tanggal`, `toko_id`, `user_id`, `keterangan`) VALUES
(1, '2016-05-12 03:13:53', 3, 1, 'keterangan'),
(5, '2016-06-23 11:53:56', 3, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `toko_mutasi_detail`
--

CREATE TABLE `toko_mutasi_detail` (
  `mutasi_detail_id` int(11) NOT NULL,
  `mutasi_id` int(11) DEFAULT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `ukuran_id` int(11) DEFAULT NULL,
  `warna_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `toko_mutasi_detail`
--

INSERT INTO `toko_mutasi_detail` (`mutasi_detail_id`, `mutasi_id`, `produk_id`, `ukuran_id`, `warna_id`, `qty`) VALUES
(1, 1, 2, 2, 1, 2),
(2, 5, 7, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `akses` enum('admin','member','op','bos','supplier') DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `status` enum('aktif','banned') DEFAULT NULL,
  `terakhir_login` datetime DEFAULT current_timestamp(),
  `toko_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`user_id`, `nama`, `username`, `password`, `akses`, `photo`, `status`, `terakhir_login`, `toko_id`) VALUES
(1, 'Operator', 'op', '11d8c28a64490a987612f2332502467f', 'op', 'ava-a87ff679a2f3e71d9181a67b7542122c.png', 'aktif', '2022-08-11 15:29:02', NULL),
(2, 'taufik', 'taufik', 'd4305d7ed2ec97107cd6eb8dd4b6f6b7', 'member', '', 'aktif', '2022-08-11 15:29:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`berita_id`),
  ADD KEY `berita_kategori_id` (`berita_kategori_id`);

--
-- Indexes for table `berita_kategori`
--
ALTER TABLE `berita_kategori`
  ADD PRIMARY KEY (`berita_kategori_id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`konfigurasi_id`),
  ADD UNIQUE KEY `nama_key` (`nama_key`);

--
-- Indexes for table `lokasi_kota`
--
ALTER TABLE `lokasi_kota`
  ADD PRIMARY KEY (`kota_id`);

--
-- Indexes for table `lokasi_provinsi`
--
ALTER TABLE `lokasi_provinsi`
  ADD PRIMARY KEY (`provinsi_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`pelanggan_id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`pembelian_id`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`pembelian_detail_id`);

--
-- Indexes for table `pembelian_temp`
--
ALTER TABLE `pembelian_temp`
  ADD PRIMARY KEY (`pembelian_temp_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`penjualan_id`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`penjualan_detail_id`);

--
-- Indexes for table `penjualan_konfirmasi`
--
ALTER TABLE `penjualan_konfirmasi`
  ADD PRIMARY KEY (`konfirmasi_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `produk_merek`
--
ALTER TABLE `produk_merek`
  ADD PRIMARY KEY (`merek_id`);

--
-- Indexes for table `produk_photo`
--
ALTER TABLE `produk_photo`
  ADD PRIMARY KEY (`photo_id`);

--
-- Indexes for table `produk_stok`
--
ALTER TABLE `produk_stok`
  ADD PRIMARY KEY (`stok_id`);

--
-- Indexes for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  ADD PRIMARY KEY (`ukuran_id`);

--
-- Indexes for table `produk_warna`
--
ALTER TABLE `produk_warna`
  ADD PRIMARY KEY (`warna_id`);

--
-- Indexes for table `promo`
--
ALTER TABLE `promo`
  ADD PRIMARY KEY (`promo_id`);

--
-- Indexes for table `promo_data`
--
ALTER TABLE `promo_data`
  ADD PRIMARY KEY (`promo_data_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`toko_id`);

--
-- Indexes for table `toko_mutasi`
--
ALTER TABLE `toko_mutasi`
  ADD PRIMARY KEY (`mutasi_id`);

--
-- Indexes for table `toko_mutasi_detail`
--
ALTER TABLE `toko_mutasi_detail`
  ADD PRIMARY KEY (`mutasi_detail_id`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `berita_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `berita_kategori`
--
ALTER TABLE `berita_kategori`
  MODIFY `berita_kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chat_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `konfigurasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lokasi_kota`
--
ALTER TABLE `lokasi_kota`
  MODIFY `kota_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

--
-- AUTO_INCREMENT for table `lokasi_provinsi`
--
ALTER TABLE `lokasi_provinsi`
  MODIFY `provinsi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `pelanggan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `pembelian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `pembelian_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembelian_temp`
--
ALTER TABLE `pembelian_temp`
  MODIFY `pembelian_temp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `penjualan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `penjualan_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `penjualan_konfirmasi`
--
ALTER TABLE `penjualan_konfirmasi`
  MODIFY `konfirmasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `produk_kategori`
--
ALTER TABLE `produk_kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produk_merek`
--
ALTER TABLE `produk_merek`
  MODIFY `merek_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produk_photo`
--
ALTER TABLE `produk_photo`
  MODIFY `photo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `produk_stok`
--
ALTER TABLE `produk_stok`
  MODIFY `stok_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `produk_ukuran`
--
ALTER TABLE `produk_ukuran`
  MODIFY `ukuran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `produk_warna`
--
ALTER TABLE `produk_warna`
  MODIFY `warna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `promo`
--
ALTER TABLE `promo`
  MODIFY `promo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `promo_data`
--
ALTER TABLE `promo_data`
  MODIFY `promo_data_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `toko`
--
ALTER TABLE `toko`
  MODIFY `toko_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `toko_mutasi`
--
ALTER TABLE `toko_mutasi`
  MODIFY `mutasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `toko_mutasi_detail`
--
ALTER TABLE `toko_mutasi_detail`
  MODIFY `mutasi_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
