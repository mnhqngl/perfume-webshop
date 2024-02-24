-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 24, 2024 lúc 01:42 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(2, 'Test', 'test@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 1, 1706019411),
(1, 'Quang', 'quang@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 0, 1706019411);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Danh mục', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Giỏ hàng', '', 0, 5, '2017-04-22 05:36:49'),
(6, 'Liên hệ', '', 0, 6, '2017-04-22 05:37:02'),
(7, 'Nước hoa nam', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'Nước hoa nữ', '', 1, 2, '2017-04-22 05:37:36'),
(32, 'DIOR', '', 7, 4, '0000-00-00 00:00:00'),
(31, 'Gucci', '', 8, 3, '0000-00-00 00:00:00'),
(30, 'Versace', '', 8, 2, '0000-00-00 00:00:00'),
(29, 'DIOR', '', 8, 1, '0000-00-00 00:00:00'),
(28, 'Calvin Klein', '', 7, 3, '0000-00-00 00:00:00'),
(27, 'CHANEL', '', 7, 2, '0000-00-00 00:00:00'),
(26, 'Creed', '', 7, 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(16, 13, 55, 2, 5480000.00, 0),
(17, 14, 54, 1, 900000.00, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) NOT NULL,
  `image_list` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(56, 29, 'DIOR POISON GIRL 100ML', '<p><strong><strong><em>&nbsp;Poison Girl</em></strong></strong></p>\r\n\r\n<p>Đ&acirc;y l&agrave; sản phẩm d&agrave;nh cho những người trẻ y&ecirc;u mến h&igrave;nh tượng thương hiệu. Dior Poison Girl được lấy cảm hứng từ những c&ocirc; g&aacute;i trẻ mạnh mẽ v&agrave; c&oacute; phần nổi loạn.&nbsp;Hương thơm mới mẻ n&agrave;y l&agrave; sự h&ograve;a quyện c&aacute;c hương hoa kh&aacute;c nhau. Th&iacute;ch hợp cho những c&ocirc; n&agrave;ng năng động, trẻ trung v&agrave; cuồng nhiệt.</p>\r\n\r\n<ul>\r\n	<li>Thương hiệu:&nbsp;<strong>Dior</strong></li>\r\n	<li>Nồng độ:&nbsp;Eau de Toilette (EDT)</li>\r\n	<li>Loại nước hoa nữ</li>\r\n	<li>Nh&oacute;m hương:&nbsp;Oriental Vanilla</li>\r\n	<li>Phong c&aacute;ch: Nổi loạn, hiện đại, quyến rũ</li>\r\n	<li>Dung t&iacute;ch: 100ml</li>\r\n	<li>C&aacute;ch sử dụng: Xịt</li>\r\n	<li>Người s&aacute;ng lập: Francois Demachy</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2016</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>M&ugrave;i hương đặc trưng\r\n	<ul>\r\n		<li>Hương đầu:&nbsp;cam đắng, chanh</li>\r\n		<li>Hương giữa: hoa&nbsp;hồng Grasse, hồng Đan Mạch, hoa cam</li>\r\n		<li>Hương cuối: đậu Tonka, gỗ đ&agrave;n hương, hương vani,&nbsp;hạnh nh&acirc;n, nhựa c&acirc;y Balsam, gỗ cashmere, hoa v&ograve;i voi</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<ul>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo</strong>&nbsp;<strong>h&agrave;nh&nbsp;</strong>trọn&nbsp;đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 3450000.00, 600000, 'DIOR-POISON-GIRL-100ML2.jpg', '[\"DIOR-POISON-GIRL-100ML11.jpg\"]', 1, 0, 4, 1, 1706172076),
(55, 32, 'DIOR SAUVAGE EDT 100ML', '<p><strong><strong><em>Dior Sauvage</em></strong></strong></p>\r\n\r\n<p>Lấy cảm hứng từ v&ugrave;ng đồng bằng hung dữ v&agrave; kh&ocirc;ng gian mở hoang d&atilde; của v&ugrave;ng đất hoang, sauvage sẽ giải ph&oacute;ng mặt tr&aacute;i của bạn với m&ugrave;i hương nguy&ecirc;n sơ v&agrave; m&aacute;t mẻ của n&oacute;.<strong><strong><em>&nbsp;&nbsp;&nbsp;</em></strong></strong></p>\r\n\r\n<ul>\r\n	<li>Thương hiệu: Dior</li>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Loại nước hoa nam</li>\r\n	<li>Nh&oacute;m hương:&nbsp;Aromatic Fougere</li>\r\n	<li>Phong c&aacute;ch:&nbsp;Tự nhi&ecirc;n, ấm &aacute;p, ph&oacute;ng kho&aacute;ng</li>\r\n	<li>Dung t&iacute;ch: 100ml</li>\r\n	<li>C&aacute;ch sử dụng: Xịt</li>\r\n	<li>T&ecirc;n người s&aacute;ng lập:&nbsp;Francois Demachy</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh:&nbsp;9/2015</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>M&ugrave;i hương đặc trưng\r\n	<ul>\r\n		<li>Hương đầu: cam Bergamot, ti&ecirc;u</li>\r\n		<li>Hương giữa:&nbsp;hoa phong lữ, hoa oải hương, ti&ecirc;u hồng, ti&ecirc;u Tứ Xuy&ecirc;n, cỏ Vetiver, c&acirc;y Patchouli</li>\r\n		<li>Hương cuối: nhựa Ambroxan, nhựa Labdanum, gỗ&nbsp;</li>\r\n	</ul>\r\n	</li>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo&nbsp;h&agrave;nh&nbsp;</strong>trọn&nbsp;đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 3890000.00, 1150000, 'DIOR-SAUVAGE-EDT-100ML2.jpg', '[\"DIOR-SAUVAGE-EDT-100ML11.jpg\"]', 2, 1, 4, 1, 1706171754),
(54, 28, 'CALVIN KLEIN ETERNITY NOW 30ML', '<p><em><strong>&nbsp; &nbsp;Eternity Now 30ML</strong></em></p>\r\n\r\n<p>Được ph&aacute;t h&agrave;nh n&oacute; v&agrave;o năm 2015. N&oacute; l&agrave; một bổ sung cho bộ sưu tập nước hoa vĩnh cửu. Một sự pha trộn nam t&iacute;nh nhiệt đới tươi m&aacute;t với sự ấm &aacute;p của vani kem.</p>\r\n\r\n<ul>\r\n	<li>Thương hiệu: Calvin Klein</li>\r\n	<li>Nồng độ: Eau de Toilette (EDT)</li>\r\n	<li>Nh&oacute;m hương: Woody</li>\r\n	<li>Dung t&iacute;ch: 100ml</li>\r\n	<li>C&aacute;ch sử dụng: Xịt</li>\r\n	<li>Xuất xứ: Mỹ</li>\r\n	<li>Loại nước hoa: Nam&nbsp;</li>\r\n	<li>Phong c&aacute;ch : Ngọt ng&agrave;o, quyến rũ .</li>\r\n	<li>M&ugrave;i hương đặc trưng:</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Hương đầu:&nbsp; &nbsp;c&acirc;y hồi, gừng đắng v&agrave; nước dừa.</li>\r\n	<li>Hương giữa:&nbsp;&nbsp; l&aacute; tuyết t&ugrave;ng, hoắc hương v&agrave; tr&aacute;i c&acirc;y sao</li>\r\n	<li>Hương cuối:&nbsp; &nbsp;đậu tonka, gỗ tuyết t&ugrave;ng Ma-rốc v&agrave; vani madagascan.</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%</strong>.<br />\r\n	&rarr;&nbsp;<strong>Bảo h&agrave;nh</strong>&nbsp;trọn đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 2250000.00, 1350000, 'CALVIN-KLEIN-ETERNITY-NOW-30ML1.png', '[\"CALVIN-KLEIN-ETERNITY-NOW-30ML11.jpg\"]', 1, 0, 4, 1, 1706171377),
(53, 27, 'CHANEL ANTAEUS COLOGNE 100ML', '<p><strong><em>Antaeus Cologne</em></strong></p>\r\n\r\n<p>N&oacute; được ph&aacute;t h&agrave;nh v&agrave;o năm 1981. Một loại nước hoa gỗ cay cay sang trọng với sắc th&aacute;i nhẹ của cam qu&yacute;t.&nbsp; Đầy sức sống v&agrave; tinh thần, m&ugrave;i hương n&agrave;y sẽ cung cấp cho bạn tất cả những điều đang cần</p>\r\n\r\n<ul>\r\n	<li>Thương hiệu: Chanel&nbsp;</li>\r\n	<li>Nồng độ: Eau De Toilette&nbsp; (EDT)</li>\r\n	<li>Nh&oacute;m hương: Woody</li>\r\n	<li>Phong c&aacute;ch: lịch l&atilde;m, nam t&iacute;nh, ấm &aacute;p</li>\r\n	<li>Dung t&iacute;ch: 100ml</li>\r\n	<li>C&aacute;ch sử dụng: Xịt</li>\r\n	<li>Th&iacute;ch hợp sử dụng h&agrave;ng ng&agrave;y</li>\r\n	<li>T&ecirc;n người s&aacute;ng lập: Jacques Polge</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 1981</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Loại nước hoa : Nam</li>\r\n	<li>M&ugrave;i hương đặc trưng\r\n	<ul>\r\n		<li>Hương đầu:&nbsp; rau m&ugrave;i, chanh, cam bergamot, c&acirc;y x&ocirc; thơm clary, chanh v&agrave; myrrh.&nbsp;</li>\r\n		<li>Hương giữa:&nbsp;hoa hồng, hoa nh&agrave;i l&atilde;ng mạn, h&uacute;ng t&acirc;y v&agrave; h&uacute;ng quế</li>\r\n		<li>Hương cuối:&nbsp;labdanum, hoắc hương, r&ecirc;u sồi v&agrave; castoreum</li>\r\n	</ul>\r\n	</li>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;<strong>&nbsp;Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo h&agrave;nh</strong>&nbsp;trọn đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 3900000.00, 850000, 'CHANEL-ANTAEUS-COLOGNE1.jpg', '[\"CHANEL-ANTAEUS-COLOGNE11.png\"]', 1, 0, 4, 1, 1706171193),
(58, 31, 'GUCCI BAMBOO 75ML', '<p><em><strong>Gucci&nbsp;Bamboo</strong></em></p>\r\n\r\n<p>Nước hoa&nbsp;<strong>Gucci Bamboo</strong>&nbsp;được tạo ra v&agrave;o năm 2015, l&agrave; một sự h&ograve;a quyện l&yacute; tưởng của hoa Huệ, hoa Cam với hoa Bergamot v&agrave; hoa ylang ylang.&nbsp;Thoa n&oacute; trước khi đi l&agrave;m v&agrave;o buổi s&aacute;ng, hoặc cho m&igrave;nh một b&igrave;nh xịt nhỏ trước một đ&ecirc;m tr&ecirc;n thị trấn để đảm bảo bạn c&oacute; m&ugrave;i tuyệt vời cả đ&ecirc;m</p>\r\n\r\n<ul>\r\n	<li><strong>Nh&atilde;n hiệu:</strong>&nbsp;Nước hoa Gucci</li>\r\n	<li><strong>Giới t&iacute;nh:</strong>&nbsp;Nữ</li>\r\n	<li><strong>Phong c&aacute;ch:</strong>&nbsp;Hiện đại, sang trọng.</li>\r\n	<li><strong>Dung t&iacute;ch:</strong>&nbsp;75ml&nbsp;</li>\r\n	<li><strong>Ph&aacute;t h&agrave;nh:</strong>&nbsp;2015</li>\r\n	<li><strong>Xuất xứ:</strong>&nbsp;&Yacute;</li>\r\n	<li><strong>Nồng độ:</strong>&nbsp;Eau de parfum</li>\r\n	<li><strong>Nh&oacute;m hương:</strong>&nbsp;Hương Hoa cỏ &ndash; Floral</li>\r\n	<li><strong>M&ugrave;i hương đặc trưng:</strong></li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Hương đầu:&nbsp; Hoa Lily.</li>\r\n	<li>Hương giữa:&nbsp; Hoa cam, ylang ylang.</li>\r\n	<li>Hương cuối:&nbsp; Gỗ đ&agrave;n hương, vani Tahiti, hổ ph&aacute;ch x&aacute;m</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo&nbsp;h&agrave;nh&nbsp;</strong>trọn&nbsp;đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 2885000.00, 1105000, 'GUCCI-BAMBOO-75ML1.jpg', '[\"GUCCI-BAMBOO-75ML11.png\"]', 1, 0, 4, 1, 1706173004),
(51, 26, 'Creed Viking Cologne 100ml', '<p><strong><em>Viking Cologne</em></strong></p>\r\n\r\n<p>L&agrave; một hương thơm tuyệt vời cho nam giới xuất hiện v&agrave;o năm 2016.&nbsp;Với sự pha trộn tinh tế chưa từng c&oacute; chắc chắn sẽ khiến bất kỳ người đ&agrave;n &ocirc;ng n&agrave;o cũng cảm thấy như một ng&ocirc;i sao điện ảnh nổi tiếng.&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Nh&atilde;n hiệu: Creed</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Nồng độ: Eau de Parfum (EDP)</li>\r\n	<li>Nh&agrave; pha chế: Erwin Creed Seventh Generation</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Nh&oacute;m hương: Chypre Fruity</li>\r\n	<li>Phong c&aacute;ch: Ho&agrave;n hảo v&agrave; m&atilde;nh liệt</li>\r\n	<li>Ph&aacute;t h&agrave;nh: 2016</li>\r\n	<li>Hương đặc trưng:</li>\r\n</ul>\r\n\r\n<p>Hương đầu:&nbsp;Hạt ti&ecirc;u hồng, nho đen v&agrave; cam bergamot &nbsp;<br />\r\nHương giữa: Hoa hồng, muối v&agrave; lũa<br />\r\nHương cuối:&nbsp;Muối biển, gỗ đ&agrave;n hương, r&ecirc;u sồi v&agrave; ambergris</p>\r\n\r\n<ul>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo h&agrave;nh</strong>&nbsp;trọn đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 7890000.00, 1350000, 'Creed-viking-cologne1.jpg', '[\"Creed-Original-V\\u00e9tiver-12.jpg\",\"Creed-Original-V\\u00e9tiver-22.jpg\"]', 2, 0, 4, 1, 1706170484),
(52, 27, 'Allure Chanel Homme Sport 100ml', '<p><em><strong>Allure Chanel Homme Sport</strong></em></p>\r\n\r\n<p>Nhằm đến sự quyến rũ tự nhi&ecirc;n của cơ thể, Jacques Polge tạo ra chai nước hoa tập trung v&agrave;o 4 yếu tố ch&iacute;nh: sự sảng kh&oacute;ai, gợi cảm, hương vị gỗ v&agrave; hương vị cay &ndash; vốn l&agrave; những đặc trưng đ&atilde; l&agrave;m n&ecirc;n t&ecirc;n tuổi của ALLURE HOMME</p>\r\n\r\n<ul>\r\n	<li>Thương hiệu: Chanel</li>\r\n	<li>Nồng độ: Eau De Toilette (EDT)</li>\r\n	<li>Loại nước hoa: Nam</li>\r\n	<li>M&ugrave;i hương đặc trưng:</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Hương đầu: cam, qu&yacute;t, m&ugrave;i nước biển</li>\r\n	<li>Hương giữa: hạt ti&ecirc;u, tinh dầu hoa cam, tuyết t&ugrave;ng</li>\r\n	<li>Hương cuối: đậu tonka, hổ ph&aacute;ch, vani, cỏ vetiver, xạ hương</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Nh&oacute;m hương: Oriental</li>\r\n	<li>Phong c&aacute;ch: trẻ trung, gợi cảm, tươi m&aacute;t</li>\r\n	<li>Dung t&iacute;ch: 100ml</li>\r\n	<li>C&aacute;ch sử dụng: xịt</li>\r\n	<li>Thời gian lưu hương k&eacute;o d&agrave;i ph&ugrave; hợp với hoạt động ngo&agrave;i trời</li>\r\n	<li>T&ecirc;n người s&aacute;ng lập: Jacques Polge</li>\r\n	<li>Năm ph&aacute;t h&agrave;nh: 2004</li>\r\n	<li>Xuất xứ: Ph&aacute;p</li>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo h&agrave;nh</strong>&nbsp;trọn đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 3950000.00, 1050000, 'Allure-Chanel-Homme-Sport2.jpg', '[\"Allure-Chanel-Homme-Sport11.jpg\"]', 1, 0, 4, 1, 1706170915),
(50, 26, 'Creed Original Vétiver 100ml', '<p><strong><em>Original Vetiver</em>&nbsp;</strong></p>\r\n\r\n<p>Vetiver gốc l&agrave; một loại nước hoa sảng kho&aacute;i cho người đ&agrave;n &ocirc;ng năng động v&agrave; nhiệt&nbsp;huyết. Hương thơm nam t&iacute;nh, mạnh mẽ được lấy cảm hứng từ những m&ugrave;i hương sạch sẽ, trong l&agrave;nh của kh&iacute; trời v&agrave;o mỗi buổi sớm mai<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>Nh&atilde;n hiệu: Creed</li>\r\n	<li>Giới t&iacute;nh: Nam</li>\r\n	<li>Nồng độ: Eau de Parfum (EDP)</li>\r\n	<li>Nh&agrave; pha chế: Erwin Creed Seventh Generation</li>\r\n	<li>Xuất xứ:Ph&aacute;p</li>\r\n	<li>Nh&oacute;m hương: Chypre Fruity</li>\r\n	<li>Phong c&aacute;ch:&nbsp; Hiện đại v&agrave; tinh tế</li>\r\n	<li>Ph&aacute;t h&agrave;nh: 2004</li>\r\n	<li>M&ugrave;i hương đặc trưng:\r\n	<ul>\r\n		<li>Hương đầu:Hương&nbsp;cam bergamot v&agrave; cam qu&yacute;t&nbsp;</li>\r\n		<li>Hương giữa:&nbsp;Cỏ vetiver xanh&nbsp;</li>\r\n		<li>Hương cuối:&nbsp;Iris hoa v&agrave; gỗ đ&agrave;n hương</li>\r\n	</ul>\r\n	</li>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo h&agrave;nh</strong>&nbsp;trọn đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 6200000.00, 800000, 'Creed-Original-Vétiver1.jpg', '[\"Creed-Original-V\\u00e9tiver-11.jpg\",\"Creed-Original-V\\u00e9tiver-21.jpg\"]', 2, 0, 4, 1, 1706169960),
(59, 31, 'GUCCI BLOOM NETTARE DI FIORI 100ML', '<p><em><strong>&nbsp;Gucci Bloom Nettare Di Fiori&nbsp;</strong></em></p>\r\n\r\n<p>Được giới thiệu v&agrave;o năm 2018, gucci bloom nettare di fiori l&agrave; một m&ugrave;i hương hoa thơm, nữ t&iacute;nh lấy cảm hứng từ thi&ecirc;n nhi&ecirc;n.M&ugrave;i hương n&agrave;y l&agrave; một sự bổ sung đ&aacute;ng hoan ngh&ecirc;nh cho d&ograve;ng nước hoa của nh&agrave; Gucci</p>\r\n\r\n<ul>\r\n	<li>Nh&atilde;n hiệu: Nước hoa Gucci</li>\r\n	<li>Giới t&iacute;nh: Nữ</li>\r\n	<li>Nồng độ:&nbsp;Eau De Parfum (EDP)</li>\r\n	<li>Phong c&aacute;ch: Nữ t&iacute;nh, gợi cảm , quyến rũ.</li>\r\n	<li>Dung t&iacute;ch: 100ml</li>\r\n	<li>Ph&aacute;t h&agrave;nh: 2018</li>\r\n	<li>Xuất xứ: &Yacute;</li>\r\n	<li>Nh&oacute;m hương:&nbsp;Hương hoa cỏ xanh tự nhi&ecirc;n &ndash; Floral Green</li>\r\n	<li>M&ugrave;i hương đặc trưng:</li>\r\n</ul>\r\n\r\n<ol>\r\n	<li>Hương đầu:&nbsp;hoa hồng v&agrave; gừng</li>\r\n	<li>Hương giữa:&nbsp;hoa kim ng&acirc;n v&agrave; hoa nh&agrave;i ngọt ng&agrave;o</li>\r\n	<li>Hương cuối:&nbsp;xạ hương v&agrave; hoắc hương</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo</strong>&nbsp;<strong>h&agrave;nh&nbsp;</strong>trọn&nbsp;đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 3350000.00, 1250000, 'GUCCI-BLOOM-NETTARE-DI-FIOR-100ML1.jpg', '[\"GUCCI-BLOOM-NETTARE-DI-FIORI-100ML1.png\"]', 2, 0, 4, 1, 1706173217),
(57, 30, 'VERSACE WOMAN 100ML', '<p><em><strong>&nbsp; &nbsp;Versace Woman</strong></em></p>\r\n\r\n<p>Một sự pha trộn s&ocirc;i động của c&aacute;c nốt hương nữ t&iacute;nh nhưng kh&ocirc;ng qu&aacute; nữ t&iacute;nh, rất gợi cảm trong tự nhi&ecirc;n với một v&ograve;ng tay ấm &aacute;p.&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>Thương hiệu:</strong>&nbsp;Versace</li>\r\n	<li><strong>Nồng độ:</strong>&nbsp;Eau De Parfum (EDP)</li>\r\n	<li><strong>Nh&oacute;m hương:</strong>&nbsp;Aromatic, fougere</li>\r\n	<li><strong>Phong c&aacute;ch:</strong>&nbsp;Mạnh mẽ, quyến rũ, tinh tế&nbsp;</li>\r\n	<li><strong>Dung t&iacute;ch:</strong>&nbsp;100ml</li>\r\n	<li><strong>C&aacute;ch sử dụng:</strong>&nbsp;Xịt</li>\r\n	<li><strong>T&ecirc;n người s&aacute;ng lập:</strong>&nbsp;Aurelien Guichard</li>\r\n	<li><strong>Xuất xứ:</strong>&nbsp;&Yacute;</li>\r\n	<li><strong>Loại nước hoa:</strong>&nbsp;Nữ</li>\r\n	<li><strong>M&ugrave;i hương đặc trưng:</strong></li>\r\n	<li>Hương đầu: Hoa nh&agrave;i, cam bergamont v&agrave; eglantine</li>\r\n	<li>Hương giữa: Hoa sen padparadscha,&nbsp;</li>\r\n	<li>Hương cuối: Mận v&agrave; m&acirc;m x&ocirc;i, tuyết t&ugrave;ng xanh, hổ ph&aacute;ch xạ hương v&agrave; gỗ inoke</li>\r\n	<li>Sản phẩm của h&agrave;ng ch&uacute;ng t&ocirc;i cam kết:<br />\r\n	&rarr;&nbsp;<strong>Nước hoa ch&iacute;nh h&atilde;ng 100%.</strong><br />\r\n	&rarr;&nbsp;<strong>Bảo</strong>&nbsp;<strong>h&agrave;nh&nbsp;</strong>trọn&nbsp;đời sản phẩm.<br />\r\n	&rarr; N&oacute;i&nbsp;<strong>KH&Ocirc;NG</strong>&nbsp;với h&agrave;ng giả, h&agrave;ng nh&aacute;i.</li>\r\n</ul>\r\n', 3150000.00, 1300000, 'VERSACE-WOMAN-100ML2.jpg', '[\"VERSACE-WOMAN-100ML11.jpg\"]', 1, 0, 4, 1, 1706172338);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image_link` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(7, 'Slide1', 'slide1.jpg', 'http://localhost/webshop/gucci-bloom-nettare-di-fiori-100ml-p59', 1, '2024-01-25 17:17:38'),
(6, 'Slide5', 'slide5.jpg', 'http://localhost/webshop/dior-sauvage-edt-100ml-p55', 5, '2024-01-25 17:17:03'),
(8, 'Slide2', 'slide2.png', 'http://localhost/webshop/dior-poison-girl-100ml-p56', 2, '2024-01-25 17:19:10'),
(9, 'Slide3', 'slide3.png', 'http://localhost/webshop/calvin-klein-eternity-now-30ml-p54', 3, '2024-01-25 17:20:50'),
(10, 'Slide4', 'slide4.jpg', 'http://localhost/webshop/calvin-klein-eternity-now-30ml-p54', 4, '2024-01-25 17:21:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(14, 0, 9, 'quang register', 'quang.register@gmail.com', '0988686868', 'Thanh Hoá', 'Mua thử dùng chán đánh giá 1 sao !', 900000.00, '', 1706203372),
(13, 1, 0, 'Quang test mua hàng', 'quang.test@gmail.com', '0123456789', 'Hà Nội', 'Giao ngay trong ngày nha', 5480000.00, '', 1706203180);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(9, 'quang register', 'quang.register@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', '0988686868', 'Thanh Hoá', 2024);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
