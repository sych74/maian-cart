-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Авг 18 2014 г., 08:22
-- Версия сервера: 5.6.17
-- Версия PHP: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `maiancart`
--

-- --------------------------------------------------------

--
-- Структура таблицы `mc_activation_history`
--

CREATE TABLE IF NOT EXISTS `mc_activation_history` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `products` text,
  `restoreDate` date NOT NULL DEFAULT '0000-00-00',
  `restoreTime` time NOT NULL DEFAULT '00:00:00',
  `adminUser` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `saleid_index` (`saleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_attachments`
--

CREATE TABLE IF NOT EXISTS `mc_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `statusID` int(7) NOT NULL DEFAULT '0',
  `attachFolder` varchar(100) NOT NULL DEFAULT '',
  `fileName` varchar(100) NOT NULL DEFAULT '',
  `fileType` varchar(100) NOT NULL DEFAULT '',
  `fileSize` varchar(100) NOT NULL DEFAULT '',
  `isSaved` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `status_index` (`statusID`),
  KEY `sale_index` (`saleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_attributes`
--

CREATE TABLE IF NOT EXISTS `mc_attributes` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `productID` int(10) NOT NULL DEFAULT '0',
  `attrGroup` int(10) NOT NULL DEFAULT '0',
  `attrName` varchar(100) NOT NULL DEFAULT '',
  `attrCost` varchar(50) NOT NULL DEFAULT '',
  `attrStock` int(10) NOT NULL DEFAULT '0',
  `attrWeight` varchar(50) NOT NULL DEFAULT '',
  `orderBy` int(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_index` (`productID`),
  KEY `group_index` (`attrGroup`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `mc_attributes`
--

INSERT INTO `mc_attributes` (`id`, `productID`, `attrGroup`, `attrName`, `attrCost`, `attrStock`, `attrWeight`, `orderBy`) VALUES
(1, 4, 1, '12inch', '12.99', 50, '200', 1),
(2, 4, 1, '15inch', '22.99', 50, '200', 2),
(3, 4, 1, '17inch', '32.99', 50, '200', 3),
(4, 4, 2, 'Carry Case', '9.99', 50, '500', 1),
(5, 4, 2, 'Logitech Wireless Mouse', '19.99', 50, '500', 2),
(6, 4, 2, 'Free Insurance', '0.00', 50, '0', 3),
(7, 6, 3, '10', '0.00', 50, '0', 1),
(8, 6, 3, '14', '0.00', 50, '0', 2),
(9, 6, 3, '16', '0.00', 50, '0', 3),
(10, 6, 4, 'Pink', '0.00', 50, '0', 1),
(11, 6, 4, 'Red', '0.00', 50, '0', 2),
(12, 6, 4, 'Blue', '0.00', 50, '0', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_attr_groups`
--

CREATE TABLE IF NOT EXISTS `mc_attr_groups` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `productID` int(10) NOT NULL DEFAULT '0',
  `groupName` varchar(100) NOT NULL DEFAULT '',
  `orderBy` int(7) NOT NULL DEFAULT '0',
  `allowMultiple` enum('yes','no') NOT NULL DEFAULT 'no',
  `isRequired` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `prod_index` (`productID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `mc_attr_groups`
--

INSERT INTO `mc_attr_groups` (`id`, `productID`, `groupName`, `orderBy`, `allowMultiple`, `isRequired`) VALUES
(1, 4, 'Screen Size', 1, 'no', 'no'),
(2, 4, 'Accessories', 2, 'no', 'no'),
(3, 6, 'Size', 3, 'no', 'yes'),
(4, 6, 'Colour', 4, 'no', 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_banners`
--

CREATE TABLE IF NOT EXISTS `mc_banners` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `bannerFile` varchar(250) NOT NULL DEFAULT '0',
  `bannerText` varchar(250) NOT NULL DEFAULT '0',
  `bannerUrl` varchar(250) NOT NULL DEFAULT '0',
  `bannerLive` enum('yes','no') NOT NULL DEFAULT 'yes',
  `bannerOrder` int(6) NOT NULL DEFAULT '0',
  `bannerCats` text,
  `bannerHome` enum('yes','no') NOT NULL DEFAULT 'no',
  `bannerFrom` date NOT NULL DEFAULT '0000-00-00',
  `bannerTo` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `mc_banners`
--

INSERT INTO `mc_banners` (`id`, `bannerFile`, `bannerText`, `bannerUrl`, `bannerLive`, `bannerOrder`, `bannerCats`, `bannerHome`, `bannerFrom`, `bannerTo`) VALUES
(1, 'banner-3.png', 'TELEVISIONS - ALL THE LATEST DEALS INSTORE', '', 'yes', 3, '', 'yes', '0000-00-00', '0000-00-00'),
(2, 'banner-1.png', 'MOBILE PHONES - ALL THE LATEST DEALS INSTORE', '', 'yes', 1, '', 'yes', '0000-00-00', '0000-00-00'),
(3, 'banner-2.png', 'LAPTOPS - ALL THE LATEST DEALS INSTORE', '', 'yes', 2, '', 'yes', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_brands`
--

CREATE TABLE IF NOT EXISTS `mc_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `bCat` varchar(50) NOT NULL DEFAULT 'all',
  `enBrand` enum('yes','no') NOT NULL DEFAULT 'yes',
  `rwslug` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `mc_brands`
--

INSERT INTO `mc_brands` (`id`, `name`, `bCat`, `enBrand`, `rwslug`) VALUES
(1, 'Acer', '1', 'yes', ''),
(2, 'HTC', '1', 'yes', ''),
(3, 'Samsung', '1', 'yes', ''),
(4, 'Berghaus', '3', 'yes', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_campaigns`
--

CREATE TABLE IF NOT EXISTS `mc_campaigns` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(250) NOT NULL DEFAULT '',
  `cDiscountCode` varchar(50) NOT NULL DEFAULT '',
  `cMin` varchar(50) NOT NULL DEFAULT '0.00',
  `cUsage` int(5) NOT NULL DEFAULT '0',
  `cExpiry` date NOT NULL DEFAULT '0000-00-00',
  `cDiscount` varchar(20) NOT NULL DEFAULT '',
  `cAdded` date DEFAULT '0000-00-00',
  `cLive` enum('yes','no') NOT NULL DEFAULT 'yes',
  `categories` text,
  PRIMARY KEY (`id`),
  KEY `code_index` (`cDiscountCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_categories`
--

CREATE TABLE IF NOT EXISTS `mc_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catname` varchar(250) NOT NULL,
  `titleBar` varchar(250) NOT NULL DEFAULT '',
  `comments` text,
  `catLevel` tinyint(1) NOT NULL DEFAULT '0',
  `childOf` int(6) NOT NULL DEFAULT '0',
  `metaDesc` text,
  `metaKeys` text,
  `enCat` enum('yes','no') NOT NULL DEFAULT 'yes',
  `orderBy` int(5) NOT NULL DEFAULT '0',
  `enDisqus` enum('yes','no') NOT NULL DEFAULT 'no',
  `freeShipping` enum('yes','no') NOT NULL DEFAULT 'no',
  `imgIcon` varchar(100) NOT NULL DEFAULT '',
  `showRelated` enum('yes','no') NOT NULL DEFAULT 'yes',
  `rwslug` varchar(250) NOT NULL DEFAULT '',
  `theme` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `cat_index` (`catLevel`),
  KEY `child_index` (`childOf`),
  KEY `en_index` (`enCat`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `mc_categories`
--

INSERT INTO `mc_categories` (`id`, `catname`, `titleBar`, `comments`, `catLevel`, `childOf`, `metaDesc`, `metaKeys`, `enCat`, `orderBy`, `enDisqus`, `freeShipping`, `imgIcon`, `showRelated`, `rwslug`, `theme`) VALUES
(1, 'Electronic Items', '', 'Electronic Items for sale', 1, 0, 'electronic description', 'electronic keywords', 'yes', 1, 'no', 'no', 'demoicon1.jpg', 'yes', '', ''),
(2, 'CDs', '', 'CDs for sale', 1, 0, 'cd desc', 'cd keywords', 'yes', 2, 'no', 'no', 'demoicon2.gif', 'yes', '', ''),
(3, 'Clothes', '', 'Clothes for sale', 1, 0, 'clothes desc', 'clothes keywords', 'yes', 3, 'no', 'no', 'demoicon3.gif', 'yes', '', ''),
(4, 'Downloads', '', 'Downloads for sale', 1, 0, 'downloads desc', 'instant download', 'yes', 4, 'no', 'no', 'demoicon4.gif', 'yes', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_click_history`
--

CREATE TABLE IF NOT EXISTS `mc_click_history` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `purchaseID` int(7) NOT NULL DEFAULT '0',
  `productID` int(7) NOT NULL DEFAULT '0',
  `clickDate` date NOT NULL DEFAULT '0000-00-00',
  `clickTime` time NOT NULL DEFAULT '00:00:00',
  `clickIP` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `saleid_index` (`saleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_comparisons`
--

CREATE TABLE IF NOT EXISTS `mc_comparisons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `thisProduct` int(7) NOT NULL DEFAULT '0',
  `thatProduct` int(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sale_index` (`saleID`),
  KEY `this_index` (`thisProduct`),
  KEY `that_index` (`thatProduct`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_countries`
--

CREATE TABLE IF NOT EXISTS `mc_countries` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(250) NOT NULL DEFAULT '',
  `cISO` varchar(3) NOT NULL,
  `cISO_2` char(2) NOT NULL DEFAULT '',
  `iso4217` varchar(50) NOT NULL DEFAULT '0',
  `enCountry` enum('yes','no') NOT NULL DEFAULT 'yes',
  `localPickup` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=265 ;

--
-- Дамп данных таблицы `mc_countries`
--

INSERT INTO `mc_countries` (`id`, `cName`, `cISO`, `cISO_2`, `iso4217`, `enCountry`, `localPickup`) VALUES
(1, 'Afghanistan', 'AFG', 'AF', '004', 'no', 'no'),
(2, 'Albania', 'ALB', 'AL', '008', 'no', 'no'),
(3, 'Algeria', 'DZA', 'DZ', '012', 'no', 'no'),
(4, 'Andorra', 'AND', 'AD', '020', 'no', 'no'),
(5, 'Angola', 'AGO', 'AO', '024', 'no', 'no'),
(6, 'Antigua and Barbuda', 'ATG', 'AG', '028', 'no', 'no'),
(7, 'Argentina', 'ARG', 'AR', '032', 'no', 'no'),
(8, 'Armenia', 'ARM', 'AM', '051', 'no', 'no'),
(9, 'Australia', 'AUS', 'AU', '036', 'no', 'no'),
(10, 'Austria', 'AUT', 'AT', '040', 'no', 'no'),
(11, 'Azerbaijan', 'AZE', 'AZ', '031', 'no', 'no'),
(12, 'Bahamas', 'BHS', 'BS', '044', 'no', 'no'),
(13, 'Bahrain', 'BHR', 'BH', '048', 'no', 'no'),
(14, 'Bangladesh', 'BGD', 'BD', '050', 'no', 'no'),
(15, 'Barbados', 'BRB', 'BB', '052', 'no', 'no'),
(16, 'Belarus', 'BLR', 'BY', '112', 'no', 'no'),
(17, 'Belgium', 'BEL', 'BE', '056', 'no', 'no'),
(18, 'Belize', 'BLZ', 'BZ', '084', 'no', 'no'),
(19, 'Benin', 'BEN', 'BJ', '204', 'no', 'no'),
(20, 'Bhutan', 'BTN', 'BT', '064', 'no', 'no'),
(21, 'Bolivia', 'BOL', 'BO', '068', 'no', 'no'),
(22, 'Bosnia and Herzegovina', 'BIH', 'BA', '070', 'no', 'no'),
(23, 'Botswana', 'BWA', 'BW', '072', 'no', 'no'),
(24, 'Brazil', 'BRA', 'BR', '076', 'no', 'no'),
(25, 'Brunei', 'BRN', 'BN', '096', 'no', 'no'),
(26, 'Bulgaria', 'BGR', 'BG', '100', 'no', 'no'),
(27, 'Burkina Faso', 'BFA', 'BF', '854', 'no', 'no'),
(28, 'Burundi', 'BDI', 'BI', '108', 'no', 'no'),
(29, 'Cambodia', 'KHM', 'KH', '116', 'no', 'no'),
(30, 'Cameroon', 'CMR', 'CM', '120', 'no', 'no'),
(31, 'Canada', 'CAN', 'CA', '124', 'no', 'no'),
(32, 'Cape Verde', 'CPV', 'CV', '132', 'no', 'no'),
(33, 'Central African Republic', 'CAF', 'CF', '140', 'no', 'no'),
(34, 'Chad', 'TCD', 'TD', '148', 'no', 'no'),
(35, 'Chile', 'CHL', 'CL', '152', 'no', 'no'),
(36, 'China', 'CHN', 'CN', '156', 'no', 'no'),
(37, 'Colombia', 'COL', 'CO', '170', 'no', 'no'),
(38, 'Comoros', 'COM', 'KM', '174', 'no', 'no'),
(39, 'Congo', 'COG', 'CG', '178', 'no', 'no'),
(41, 'Costa Rica', 'CRI', 'CK', '184', 'no', 'no'),
(42, 'Cote d''Ivoire', 'CIV', 'CR', '188', 'no', 'no'),
(43, 'Croatia', 'HRV', 'CI', '384', 'no', 'no'),
(44, 'Cuba', 'CUB', 'HR', '191', 'no', 'no'),
(45, 'Cyprus', 'CYP', 'CU', '192', 'no', 'no'),
(46, 'Czech Republic', 'CZE', 'CY', '196', 'no', 'no'),
(47, 'Denmark', 'DNK', 'DK', '208', 'no', 'no'),
(48, 'Djibouti', 'DJI', 'DJ', '262', 'no', 'no'),
(49, 'Dominica', 'DMA', 'DM', '212', 'no', 'no'),
(50, 'Dominican Republic', 'DOM', 'DO', '214', 'no', 'no'),
(51, 'Ecuador', 'ECU', 'EC', '218', 'no', 'no'),
(52, 'Egypt', 'EGY', 'EG', '818', 'no', 'no'),
(53, 'El Salvador', 'SLV', 'SV', '222', 'no', 'no'),
(54, 'Equatorial Guinea', 'GNQ', 'GQ', '226', 'no', 'no'),
(55, 'Eritrea', 'ERI', 'ER', '232', 'no', 'no'),
(56, 'Estonia', 'EST', 'EE', '233', 'no', 'no'),
(57, 'Ethiopia', 'ETH', 'ET', '231', 'no', 'no'),
(58, 'Fiji', 'FJI', 'FJ', '242', 'no', 'no'),
(59, 'Finland', 'FIN', 'FI', '246', 'no', 'no'),
(60, 'France', 'FRA', 'FR', '250', 'no', 'no'),
(61, 'Gabon', 'GAB', 'GA', '266', 'no', 'no'),
(62, 'Gambia', 'GMB', 'GM', '270', 'no', 'no'),
(63, 'Georgia', 'GEO', 'GE', '268', 'no', 'no'),
(64, 'Germany', 'DEU', 'DE', '276', 'no', 'no'),
(65, 'Ghana', 'GHA', 'GH', '288', 'no', 'no'),
(66, 'Greece', 'GRC', 'GR', '300', 'no', 'no'),
(67, 'Grenada', 'GRD', 'GD', '308', 'no', 'no'),
(68, 'Guatemala', 'GTM', 'GT', '320', 'no', 'no'),
(69, 'Guinea', 'GIN', 'GN', '324', 'no', 'no'),
(70, 'Guinea-Bissau', 'GNB', 'GW', '624', 'no', 'no'),
(71, 'Guyana', 'GUY', 'GY', '328', 'no', 'no'),
(72, 'Haiti', 'HTI', 'HT', '332', 'no', 'no'),
(73, 'Honduras', 'HND', 'HN', '340', 'no', 'no'),
(74, 'Hungary', 'HUN', 'HU', '348', 'no', 'no'),
(75, 'Iceland', 'ISL', 'IS', '352', 'no', 'no'),
(76, 'India', 'IND', 'IN', '356', 'no', 'no'),
(77, 'Indonesia', 'IDN', 'ID', '360', 'no', 'no'),
(78, 'Iran', 'IRN', 'IR', '364', 'no', 'no'),
(79, 'Iraq', 'IRQ', 'IQ', '368', 'no', 'no'),
(80, 'Ireland', 'IRL', 'IE', '372', 'no', 'no'),
(81, 'Israel', 'ISR', 'IL', '376', 'no', 'no'),
(82, 'Italy', 'ITA', 'IT', '380', 'no', 'no'),
(83, 'Jamaica', 'JAM', 'JM', '388', 'no', 'no'),
(84, 'Japan', 'JPN', 'JP', '392', 'no', 'no'),
(85, 'Jordan', 'JOR', 'JO', '400', 'no', 'no'),
(86, 'Kazakhstan', 'KAZ', 'KZ', '398', 'no', 'no'),
(87, 'Kenya', 'KEN', 'KE', '404', 'no', 'no'),
(88, 'Kiribati', 'KIR', 'KI', '296', 'no', 'no'),
(89, 'South Korea', 'KOR', 'KR', '410', 'no', 'no'),
(90, 'North Korea', 'PRK', 'KP', '408', 'no', 'no'),
(91, 'Kuwait', 'KWT', 'KW', '414', 'no', 'no'),
(92, 'Kyrgyzstan', 'KGZ', 'KG', '417', 'no', 'no'),
(93, 'Laos', 'LAO', 'LA', '418', 'no', 'no'),
(94, 'Latvia', 'LVA', 'LV', '428', 'no', 'no'),
(95, 'Lebanon', 'LBN', 'LB', '422', 'no', 'no'),
(96, 'Lesotho', 'LSO', 'LS', '426', 'no', 'no'),
(97, 'Liberia', 'LBR', 'LR', '430', 'no', 'no'),
(98, 'Libya', 'LBY', 'LY', '434', 'no', 'no'),
(99, 'Liechtenstein', 'LIE', 'LI', '438', 'no', 'no'),
(100, 'Lithuania', 'LTU', 'LT', '440', 'no', 'no'),
(101, 'Luxembourg', 'LUX', 'LU', '442', 'no', 'no'),
(102, 'Macedonia', 'MKD', 'MK', '807', 'no', 'no'),
(103, 'Madagascar', 'MDG', 'MG', '450', 'no', 'no'),
(104, 'Malawi', 'MWI', 'MW', '454', 'no', 'no'),
(105, 'Malaysia', 'MYS', 'MY', '458', 'no', 'no'),
(106, 'Maldives', 'MDV', 'MV', '462', 'no', 'no'),
(107, 'Mali', 'MLI', 'ML', '466', 'no', 'no'),
(108, 'Malta', 'MLT', 'MT', '470', 'no', 'no'),
(109, 'Marshall Islands', 'MHL', 'MH', '584', 'no', 'no'),
(110, 'Mauritania', 'MRT', 'MR', '478', 'no', 'no'),
(111, 'Mauritius', 'MUS', 'MU', '480', 'no', 'no'),
(112, 'Mexico', 'MEX', 'MX', '484', 'no', 'no'),
(113, 'Micronesia', 'FSM', 'FM', '583', 'no', 'no'),
(114, 'Moldova', 'MDA', 'MD', '498', 'no', 'no'),
(115, 'Monaco', 'MCO', 'MC', '492', 'no', 'no'),
(116, 'Mongolia', 'MNG', 'MN', '496', 'no', 'no'),
(117, 'Montenegro', 'MNE', 'ME', '499', 'no', 'no'),
(118, 'Morocco', 'MAR', 'MA', '504', 'no', 'no'),
(119, 'Mozambique', 'MOZ', 'MZ', '508', 'no', 'no'),
(120, 'Myanmar (Burma)', 'MMR', 'MM', '104', 'no', 'no'),
(121, 'Namibia', 'NAM', 'NA', '516', 'no', 'no'),
(122, 'Nauru', 'NRU', 'NR', '520', 'no', 'no'),
(123, 'Nepal', 'NPL', 'NP', '524', 'no', 'no'),
(124, 'Netherlands', 'NLD', 'NL', '528', 'no', 'no'),
(125, 'New Zealand', 'NZL', 'NZ', '554', 'no', 'no'),
(126, 'Nicaragua', 'NIC', 'NI', '558', 'no', 'no'),
(127, 'Niger', 'NER', 'NE', '562', 'no', 'no'),
(128, 'Nigeria', 'NGA', 'NG', '566', 'no', 'no'),
(129, 'Norway', 'NOR', 'NO', '578', 'no', 'no'),
(130, 'Oman', 'OMN', 'OM', '512', 'no', 'no'),
(131, 'Pakistan', 'PAK', 'PK', '586', 'no', 'no'),
(132, 'Palau', 'PLW', 'PW', '585', 'no', 'no'),
(133, 'Panama', 'PAN', 'PA', '591', 'no', 'no'),
(134, 'Papua New Guinea', 'PNG', 'PG', '598', 'no', 'no'),
(135, 'Paraguay', 'PRY', 'PY', '600', 'no', 'no'),
(136, 'Peru', 'PER', 'PE', '604', 'no', 'no'),
(137, 'Philippines', 'PHL', 'PH', '608', 'no', 'no'),
(138, 'Poland', 'POL', 'PL', '616', 'no', 'no'),
(139, 'Portugal', 'PRT', 'PT', '620', 'no', 'no'),
(140, 'Qatar', 'QAT', 'QA', '634', 'no', 'no'),
(141, 'Romania', 'ROU', 'RO', '642', 'no', 'no'),
(142, 'Russian Federation', 'RUS', 'RU', '643', 'no', 'no'),
(143, 'Rwanda', 'RWA', 'RW', '646', 'no', 'no'),
(144, 'Saint Kitts and Nevis', 'KNA', 'KN', '659', 'no', 'no'),
(145, 'Saint Lucia', 'LCA', 'LC', '662', 'no', 'no'),
(146, 'Saint Vincent and the Grenadines', 'VCT', 'VC', '670', 'no', 'no'),
(147, 'Samoa', 'WSM', 'WS', '882', 'no', 'no'),
(148, 'San Marino', 'SMR', 'SM', '674', 'no', 'no'),
(149, 'Sao Tome and Principe', 'STP', 'ST', '678', 'no', 'no'),
(150, 'Saudi Arabia', 'SAU', 'SA', '682', 'no', 'no'),
(151, 'Senegal', 'SEN', 'SN', '686', 'no', 'no'),
(152, 'Serbia', 'SRB', 'RS', '688', 'no', 'no'),
(153, 'Seychelles', 'SYC', 'SC', '690', 'no', 'no'),
(154, 'Sierra Leone', 'SLE', 'SL', '694', 'no', 'no'),
(155, 'Singapore', 'SGP', 'SG', '702', 'no', 'no'),
(156, 'Slovakia', 'SVK', 'SK', '703', 'no', 'no'),
(157, 'Slovenia', 'SVN', 'SI', '705', 'no', 'no'),
(159, 'Somalia', 'SOM', 'SO', '706', 'no', 'no'),
(160, 'South Africa', '+27', 'ZA', '710', 'no', 'no'),
(161, 'Spain', 'ESP', 'ES', '724', 'no', 'no'),
(162, 'Sri Lanka', 'LKA', 'LK', '144', 'no', 'no'),
(163, 'Sudan', 'SDN', 'SD', '736', 'no', 'no'),
(164, 'Suriname', 'SUR', 'SR', '740', 'no', 'no'),
(165, 'Swaziland', 'SWZ', 'SZ', '748', 'no', 'no'),
(166, 'Sweden', 'SWE', 'SE', '752', 'no', 'no'),
(167, 'Switzerland', 'CHE', 'CH', '756', 'no', 'no'),
(168, 'Syrian Arab Republic', 'SYR', 'SY', '760', 'no', 'no'),
(169, 'Tajikistan', 'TJK', 'TJ', '762', 'no', 'no'),
(170, 'Tanzania', 'TZA', 'TZ', '834', 'no', 'no'),
(171, 'Thailand', 'THA', 'TH', '764', 'no', 'no'),
(172, 'Timor-Leste (East Timor)', 'TLS', 'TL', '626', 'no', 'no'),
(173, 'Togo', 'TGO', 'TG', '768', 'no', 'no'),
(174, 'Tonga', 'TON', 'TO', '776', 'no', 'no'),
(175, 'Trinidad and Tobago', 'TTO', 'TT', '780', 'no', 'no'),
(176, 'Tunisia', 'TUN', 'TN', '788', 'no', 'no'),
(177, 'Turkey', 'TUR', 'TR', '792', 'no', 'no'),
(178, 'Turkmenistan', 'TKM', 'TM', '795', 'no', 'no'),
(179, 'Tuvalu', 'TUV', 'TV', '798', 'no', 'no'),
(180, 'Uganda', 'UGA', 'UG', '800', 'no', 'no'),
(181, 'Ukraine', 'UKR', 'UA', '804', 'no', 'no'),
(182, 'United Arab Emirates', 'ARE', 'AE', '784', 'no', 'no'),
(183, 'United Kingdom', 'GBR', 'GB', '826', 'yes', 'yes'),
(184, 'United States', 'USA', 'US', '840', 'yes', 'yes'),
(185, 'Uruguay', 'URY', 'UY', '858', 'no', 'no'),
(186, 'Uzbekistan', 'UZB', 'UZ', '860', 'no', 'no'),
(187, 'Vanuatu', 'VUT', 'VU', '548', 'no', 'no'),
(188, 'Vatican City', 'VAT', 'VA', '336', 'no', 'no'),
(189, 'Venezuela', 'VEN', 'VE', '862', 'no', 'no'),
(190, 'Vietnam', 'VNM', 'VN', '704', 'no', 'no'),
(191, 'Yemen', 'YEM', 'YE', '887', 'no', 'no'),
(192, 'Zambia', 'ZMB', 'ZM', '894', 'no', 'no'),
(193, 'Zimbabwe', 'ZWE', 'ZW', '716', 'no', 'no'),
(202, 'Christmas Island', 'CXR', 'CX', '162', 'no', 'no'),
(203, 'Cocos (Keeling) Islands', 'CCK', 'CC', '166', 'no', 'no'),
(205, 'Heard Island and McDonald Islands', 'HMD', 'HM', '334', 'no', 'no'),
(206, 'Norfolk Island', 'NFK', 'NF', '574', 'no', 'no'),
(207, 'New Caledonia', 'NCL', 'NC', '540', 'no', 'no'),
(208, 'French Polynesia', 'PYF', 'PF', '258', 'no', 'no'),
(209, 'Mayotte', 'MYT', 'YT', '175', 'no', 'no'),
(210, 'Saint Barthelemy', 'GLP', 'BL', '652', 'no', 'no'),
(211, 'Saint Martin', 'GLP', 'MF', '663', 'no', 'no'),
(212, 'Saint Pierre and Miquelon', 'SPM', 'PM', '666', 'no', 'no'),
(213, 'Wallis and Futuna', 'WLF', 'WF', '876', 'no', 'no'),
(214, 'French Southern and Antarctic Lands', 'ATF', 'TF', '260', 'no', 'no'),
(216, 'Bouvet Island', 'BVT', 'BV', '074', 'no', 'no'),
(217, 'Cook Islands', 'COK', 'CD', '180', 'no', 'no'),
(218, 'Niue', 'NIU', 'NU', '570', 'no', 'no'),
(219, 'Tokelau', 'TKL', 'TK', '772', 'no', 'no'),
(220, 'Guernsey', 'GGY', 'GG', '831', 'no', 'no'),
(221, 'Isle of Man', 'IMN', 'IM', '833', 'no', 'no'),
(222, 'Jersey', 'JEY', 'JE', '832', 'no', 'no'),
(223, 'Anguilla', 'AIA', 'AI', '660', 'no', 'no'),
(224, 'Bermuda', 'BMU', 'BM', '060', 'no', 'no'),
(225, 'British Indian Ocean Territory', 'IOT', 'IO', '086', 'no', 'no'),
(227, 'British Virgin Islands', 'VGB', 'VG', '092', 'no', 'no'),
(228, 'Cayman Islands', 'CYM', 'KY', '136', 'no', 'no'),
(229, 'Falkland Islands (Islas Malvinas)', 'FLK', 'FK', '238', 'no', 'no'),
(230, 'Gibraltar', 'GIB', 'GI', '292', 'no', 'no'),
(231, 'Montserrat', 'MSR', 'MS', '500', 'no', 'no'),
(232, 'Pitcairn Islands', 'PCN', 'PN', '612', 'no', 'no'),
(233, 'Saint Helena', 'SHN', 'SH', '654', 'no', 'no'),
(234, 'South Georgia & South Sandwich Islands', 'SGS', 'GS', '239', 'no', 'no'),
(235, 'Turks and Caicos Islands', 'TCA', 'TC', '796', 'no', 'no'),
(236, 'Northern Mariana Islands', 'MNP', 'MP', '580', 'no', 'no'),
(237, 'Puerto Rico', 'PRI', 'PR', '630', 'no', 'no'),
(238, 'American Samoa', 'ASM', 'AS', '016', 'no', 'no'),
(240, 'Guam', 'GUM', 'GU', '316', 'no', 'no'),
(248, 'US Virgin Islands', 'VIR', 'VI', '850', 'no', 'no'),
(250, 'Hong Kong', 'HKG', 'HK', '344', 'no', 'no'),
(251, 'Macau', 'MAC', 'MO', '446', 'no', 'no'),
(252, 'Faroe Islands', 'FRO', 'FO', '234', 'no', 'no'),
(253, 'Greenland', 'GRL', 'GL', '304', 'no', 'no'),
(254, 'French Guiana', 'GUF', 'GF', '254', 'no', 'no'),
(255, 'Guadeloupe', 'GLP', 'GP', '312', 'no', 'no'),
(256, 'Martinique', 'MTQ', 'MQ', '474', 'no', 'no'),
(257, 'Reunion', 'REU', 'RE', '638', 'no', 'no'),
(259, 'Aruba', 'ABW', 'AW', '533', 'no', 'no'),
(260, 'Netherlands Antilles', 'ANT', 'AN', '530', 'no', 'no'),
(261, 'Svalbard and Jan Mayen', 'SJM', 'SJ', '744', 'no', 'no'),
(264, 'Australian Antarctic Territory', 'ATA', 'AQ', '010', 'no', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_coupons`
--

CREATE TABLE IF NOT EXISTS `mc_coupons` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `cCampaign` int(7) NOT NULL DEFAULT '0',
  `cDiscountCode` varchar(200) NOT NULL DEFAULT '',
  `cUseDate` date NOT NULL DEFAULT '0000-00-00',
  `saleID` mediumint(10) NOT NULL DEFAULT '0',
  `discountValue` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `code_index` (`cDiscountCode`),
  KEY `sale_index` (`saleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_currencies`
--

CREATE TABLE IF NOT EXISTS `mc_currencies` (
  `currency` char(3) NOT NULL DEFAULT '',
  `rate` varchar(20) NOT NULL DEFAULT '0',
  `enableCur` enum('yes','no') DEFAULT 'no',
  `curname` varchar(30) NOT NULL,
  `currencyDisplayPref` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`currency`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mc_currencies`
--

INSERT INTO `mc_currencies` (`currency`, `rate`, `enableCur`, `curname`, `currencyDisplayPref`) VALUES
('USD', '1.5293', 'yes', 'US Dollar', 'US&#036;{PRICE}'),
('JPY', '125.5', 'no', 'Japanese Yen', '{PRICE}&#165;'),
('CZK', '25.443', 'no', 'Czech Koruny', ''),
('DKK', '7.4573', 'no', 'Danish Kroner', ''),
('GBP', '1', 'no', 'British Pound', '&pound;{PRICE}'),
('HUF', '297.64', 'no', 'Hungarian Forint', ''),
('LTL', '3.4528', 'no', 'Lithuanian Litai', ''),
('LVL', '0.701', 'no', 'Latvian Lati', ''),
('PLN', '4.138', 'no', 'Polish Zlotych', ''),
('SEK', '8.3239', 'no', 'Swedish Kronor', ''),
('CHF', '1.2355', 'no', 'Swiss Franc', ''),
('NOK', '7.4435', 'no', 'Norwegian Krone', ''),
('HRK', '7.5908', 'no', 'Croatian Kuna', ''),
('RUB', '40.1213', 'no', 'Russian Rubles', ''),
('TRY', '2.349', 'no', 'Turkish New Lira', ''),
('AUD', '1.6667', 'yes', 'Australian Dollar', '&#036;{PRICE}AUD'),
('BRL', '2.5578', 'no', 'Brazilian Real', ''),
('CAD', '1.347', 'no', 'Canadian Dollar', 'CA&#036;{PRICE}'),
('CNY', '8.1413', 'no', 'Chinese Yuan Renminbi', ''),
('HKD', '10.1525', 'no', 'Hong Kong Dollar', 'HK&#036;'),
('IDR', '12676.1', 'no', 'Indonesian Rupiah', ''),
('ILS', '4.8163', 'no', 'Israeli Shekel', ''),
('INR', '71.177', 'no', 'Indian Rupee', ''),
('KRW', '1427.23', 'no', 'South Korean Won', ''),
('MXN', '16.6598', 'no', 'Mexican Peso', ''),
('MYR', '4.0658', 'no', 'Malaysian Ringgit', ''),
('NZD', '1.5789', 'no', 'New Zealand Dollar', ''),
('PHP', '53.221', 'no', 'Philippine Peso', ''),
('SGD', '1.6317', 'no', 'Singapore Dollar', ''),
('THB', '38.903', 'no', 'Thai Baht', ''),
('ZAR', '11.8996', 'no', 'South African Rand', ''),
('EUR', '1.1577', 'yes', 'Euro', '{PRICE}&euro;'),
('NGN', '0', 'no', 'Nigerian Naira', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_entry_log`
--

CREATE TABLE IF NOT EXISTS `mc_entry_log` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL DEFAULT '',
  `loggedDate` date NOT NULL DEFAULT '0000-00-00',
  `loggedTime` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_index` (`userName`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `mc_entry_log`
--

INSERT INTO `mc_entry_log` (`id`, `userName`, `loggedDate`, `loggedTime`) VALUES
(1, 'admin', '2014-08-05', '09:20:59'),
(2, 'admin', '2014-08-05', '09:22:15'),
(3, 'admin', '2014-08-05', '14:09:28'),
(4, 'admin', '2014-08-05', '14:11:30'),
(5, 'admin', '2014-08-05', '14:13:44'),
(6, 'admin', '2014-08-05', '14:14:22'),
(7, 'admin', '2014-08-05', '14:14:55'),
(8, 'admin', '2014-08-18', '08:20:11');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_flat`
--

CREATE TABLE IF NOT EXISTS `mc_flat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inZone` int(8) NOT NULL DEFAULT '0',
  `rate` varchar(30) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `zone_index` (`inZone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_giftcerts`
--

CREATE TABLE IF NOT EXISTS `mc_giftcerts` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `value` varchar(10) NOT NULL DEFAULT '',
  `image` varchar(250) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `orderBy` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `mc_giftcerts`
--

INSERT INTO `mc_giftcerts` (`id`, `name`, `value`, `image`, `enabled`, `orderBy`) VALUES
(1, '5 Pound Gift Certificate', '5.00', 'gift-1.gif', 'yes', 1),
(2, '10 Pound Gift Certificate', '10.00', 'gift-2.gif', 'yes', 2),
(3, '20 Pound Gift Certificate', '20.00', 'gift-3.gif', 'yes', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_giftcodes`
--

CREATE TABLE IF NOT EXISTS `mc_giftcodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `saleID` int(10) NOT NULL DEFAULT '0',
  `purchaseID` int(11) NOT NULL DEFAULT '0',
  `giftID` int(10) NOT NULL DEFAULT '0',
  `code` varchar(200) NOT NULL DEFAULT '',
  `value` varchar(10) NOT NULL DEFAULT '',
  `redeemed` varchar(10) NOT NULL DEFAULT '',
  `from_name` varchar(100) NOT NULL DEFAULT '',
  `from_email` varchar(100) NOT NULL DEFAULT '',
  `to_name` varchar(100) NOT NULL DEFAULT '',
  `to_email` varchar(100) NOT NULL DEFAULT '',
  `message` text,
  `dateAdded` date NOT NULL DEFAULT '0000-00-00',
  `notes` text,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  `active` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `gift_index` (`giftID`),
  KEY `sale_index` (`saleID`),
  KEY `purc_index` (`purchaseID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_methods`
--

CREATE TABLE IF NOT EXISTS `mc_methods` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `orderby` int(3) NOT NULL DEFAULT '0',
  `method` varchar(100) NOT NULL DEFAULT '',
  `display` varchar(100) NOT NULL DEFAULT '',
  `status` enum('yes','no') NOT NULL DEFAULT 'yes',
  `liveserver` varchar(250) NOT NULL DEFAULT '',
  `sandboxserver` varchar(250) NOT NULL DEFAULT '',
  `plaintext` text,
  `htmltext` text,
  `info` text,
  `redirect` varchar(250) NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '',
  `docs` varchar(100) NOT NULL DEFAULT '',
  `webpage` varchar(100) NOT NULL DEFAULT '',
  `statuses` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Дамп данных таблицы `mc_methods`
--

INSERT INTO `mc_methods` (`id`, `orderby`, `method`, `display`, `status`, `liveserver`, `sandboxserver`, `plaintext`, `htmltext`, `info`, `redirect`, `image`, `docs`, `webpage`, `statuses`) VALUES
(1, 1, 'paypal', 'Paypal IPN', 'yes', 'https://www.paypal.com/cgi-bin/webscr', 'https://www.sandbox.paypal.com/cgi-bin/webscr', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'paypal.png', 'payment-1', 'https://www.paypal.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(2, 2, 'twocheckout', '2Checkout', 'yes', 'https://www.2checkout.com/checkout/purchase', 'https://www.2checkout.com/checkout/purchase', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', '2checkout.png', 'payment-2', 'https://www.2checkout.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(3, 3, 'google', 'Google Checkout', 'no', 'https://checkout.google.com/api/checkout/v2/checkoutForm/Merchant/', 'https://sandbox.google.com/checkout/api/checkout/v2/checkoutForm/Merchant/', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'google.png', 'payment-3', 'https://checkout.google.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(4, 4, 'moneybookers', 'Skrill', 'no', 'https://www.moneybookers.com/app/payment.pl', 'https://www.moneybookers.com/app/payment.pl', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'skrill.png', 'payment-5', 'https://www.moneybookers.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(5, 5, 'payza', 'Payza', 'no', 'https://www.payza.com/PayProcess.aspx', 'https://sandbox.payza.com/sandbox/payprocess.aspx', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'payza.png', 'payment-4', 'https://www.payza.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(6, 6, 'payfast', 'Payfast', 'no', 'https://www.payfast.co.za/eng/process', 'https://sandbox.payfast.co.za/eng/process', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'payfast.png', 'payment-7', 'https://www.payfast.co.za', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(7, 99, 'cod', 'Cash on Delivery', 'yes', '', '', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'cod.png', 'payment-6', '', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(8, 100, 'bank', 'Bank Transfer', 'yes', '', '', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'bank.png', 'payment-6', '', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(9, 101, 'cheque', 'Cheque/Check', 'yes', '', '', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'cheque.png', 'payment-6', '', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(10, 102, 'phone', 'Phone Order', 'yes', '', '', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'phone.png', 'payment-6', '', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(11, 7, 'nochex', 'Nochex APC', 'no', 'https://secure.nochex.com', 'https://secure.nochex.com', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'nochex.png', 'payment-8', 'https://www.nochex.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(12, 8, 'cardsave', 'CardSave', 'no', 'https://mms.cardsaveonlinepayments.com/Pages/PublicPages/PaymentForm.aspx', 'https://mms.cardsaveonlinepayments.com/Pages/PublicPages/PaymentForm.aspx', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'cardsave.png', 'payment-9', 'http://www.cardsave.net', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(13, 9, 'sagepay', 'Sage Pay', 'no', 'https://live.sagepay.com/gateway/service/vspform-register.vsp', 'https://test.sagepay.com/Simulator/VSPFormGateway.asp', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'sagepay.png', 'payment-10', 'http://www.sagepay.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(14, 10, 'eway', 'eWay UK', 'no', 'https://payment.ewaygateway.com/Request/', 'https://payment.ewaygateway.com/Results/', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'eway.png', 'payment-11', 'http://www.eway.co.uk', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(15, 11, 'worldpay', 'WorldPay', 'no', 'https://secure.worldpay.com/wcc/purchase', 'https://secure-test.worldpay.com/wcc/purchase', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'worldpay.png', 'payment-12', 'http://www.worldpay.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(16, 12, 'cardstream', 'Cardstream', 'no', 'https://gateway.cardstream.com/hosted/', 'https://gateway.cardstream.com/hosted/', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'cardstream.png', 'payment-13', 'http://www.cardstream.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(17, 13, 'paypoint', 'Paypoint', 'no', 'https://www.secpay.com/java-bin/ValCard', 'https://www.secpay.com/java-bin/ValCard', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'paypoint.png', 'payment-14', 'http://www.paypoint.net', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(18, 14, 'liqpay', 'Liqpay', 'no', 'https://liqpay.com/?do=clickNbuy', 'https://liqpay.com/?do=clickNbuy', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'liqpay.png', 'payment-15', 'http://www.liqpay.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(19, 15, 'authnet', 'Authorize.net', 'no', 'https://secure.authorize.net/gateway/transact.dll', 'https://test.authorize.net/gateway/transact.dll', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'authnet.png', 'payment-16', 'http://www.authorize.net', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(20, 16, 'paymate', 'Paymate', 'no', 'https://www.paymate.com/PayMate/ExpressPayment', 'https://www.paymate.com.au/PayMate/TestExpressPayment', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'paymate.png', 'payment-17', 'http://www.paymate.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(21, 17, 'realex', 'Realex Payments', 'no', 'https://epage.payandshop.com/epage.cgi', 'https://epage.payandshop.com/epage.cgi', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'realex.png', 'payment-18', 'http://www.realexpayments.co.uk', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(22, 18, 'beanstream', 'Beanstream', 'no', 'https://www.beanstream.com/scripts/process_transaction.asp', 'https://www.beanstream.com/scripts/process_transaction.asp', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'beanstream.png', 'payment-19', 'https://www.beanstream.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(24, 19, 'charity', 'Charity Clear', 'no', 'https://gateway.charityclear.com/hosted/', 'https://gateway.charityclear.com/hosted/', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'charity.png', 'payment-20', 'http://www.charityclear.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(25, 20, 'icepay', 'IcePay', 'no', 'https://pay.icepay.eu/Checkout.aspx', 'https://pay.icepay.eu/Checkout.aspx', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'icepay.png', 'payment-21', 'http://www.icepay.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(26, 21, 'ccnow', 'CCNow', 'no', 'https://www.ccnow.com/cgi-local/transact.cgi', 'https://www.ccnow.com/cgi-local/transact.cgi', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'ccnow.png', 'payment-22', 'http://www.ccnow.com', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(27, 23, 'suvtoy', 'Suomen Verkkomaksut', 'no', 'https://payment.verkkomaksut.fi', 'https://payment.verkkomaksut.fi', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'suvtoy.png', 'payment-24', 'http://verkkomaksut.fi/en/', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(28, 22, 'iridium', 'Iridium Corporation', 'no', 'https://mms.iridiumcorp.net/Pages/PublicPages/PaymentForm.aspx', 'https://mms.iridiumcorp.net/Pages/PublicPages/PaymentForm.aspx', '', '', 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'iridium.png', 'payment-23', 'http://www.iridiumcorp.co.uk', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}'),
(29, 24, 'iris', 'Global Iris', 'yes', 'https://redirect.globaliris.com/epage.cgi', 'https://redirect.globaliris.com/epage.cgi', NULL, NULL, 'Lorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.\r\n\r\nLorem ipsum dolor sit amet consectetuer Ut dapibus dui malesuada urna. Adipiscing congue Vestibulum libero ipsum pretium convallis ligula ac Nullam Phasellus. Felis parturient ante In Curabitur eros interdum ut et turpis orci. Et dui magna adipiscing tristique ipsum aliquet adipiscing malesuada Nulla congue. Nec vel condimentum ut Pellentesque platea eleifend massa Sed sed justo. Dui Aliquam tellus sodales massa ipsum metus Vestibulum Maecenas at malesuada. Sit.', '', 'iris.png', 'payment-25', 'http://www.globalpaymentsinc.co.uk/global-iris.html', 'a:5:{s:9:"completed";s:8:"shipping";s:8:"download";s:9:"completed";s:7:"virtual";s:9:"completed";s:7:"pending";s:7:"pending";s:8:"refunded";s:6:"refund";}');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_methods_params`
--

CREATE TABLE IF NOT EXISTS `mc_methods_params` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `method` varchar(200) NOT NULL DEFAULT '',
  `param` varchar(200) NOT NULL DEFAULT '',
  `value` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mthd_index` (`method`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=72 ;

--
-- Дамп данных таблицы `mc_methods_params`
--

INSERT INTO `mc_methods_params` (`id`, `method`, `param`, `value`) VALUES
(1, 'paypal', 'email', ''),
(2, 'paypal', 'pagestyle', ''),
(3, 'paypal', 'locale', ''),
(4, 'twocheckout', 'account', ''),
(5, 'twocheckout', 'secret', ''),
(6, 'google', 'merchant', ''),
(7, 'google', 'key', ''),
(8, 'payza', 'ipncode', ''),
(9, 'payza', 'email', ''),
(10, 'moneybookers', 'email', ''),
(11, 'moneybookers', 'language', 'EN'),
(12, 'moneybookers', 'logo', ''),
(13, 'moneybookers', 'secret', ''),
(15, 'payfast', 'merchant-id', ''),
(16, 'payfast', 'merchant-key', ''),
(17, 'nochex', 'merchant-id', ''),
(18, 'cardsave', 'pre-share-key', ''),
(19, 'cardsave', 'merchant-id', ''),
(20, 'cardsave', 'password', ''),
(21, 'sagepay', 'vendor', ''),
(22, 'sagepay', 'encryption', ''),
(23, 'sagepay', 'xor-password', ''),
(24, 'eway', 'customer-id', ''),
(25, 'eway', 'username', ''),
(26, 'eway', 'language', 'EN'),
(27, 'eway', 'company-logo', ''),
(28, 'eway', 'page-banner', ''),
(29, 'eway', 'page-title', ''),
(30, 'eway', 'page-footer', ''),
(31, 'eway', 'page-desc', ''),
(32, 'worldpay', 'install-id', ''),
(33, 'worldpay', 'callback-pw', ''),
(34, 'cardstream', 'merchant-id', ''),
(35, 'paypoint', 'merchant-id', ''),
(36, 'paypoint', 'pass-remote', ''),
(37, 'paypoint', 'logo', ''),
(38, 'liqpay', 'merchant-id', ''),
(39, 'liqpay', 'signature', ''),
(40, 'nochex', 'check-url', 'https://www.nochex.com/nochex.dll/apc/apc'),
(41, 'payfast', 'validation-url', 'https://www.payfast.co.za/eng/query/validate'),
(42, 'authnet', 'login-id', ''),
(43, 'authnet', 'transaction-key', ''),
(44, 'authnet', 'response-key', ''),
(45, 'paymate', 'merchant-id', ''),
(46, 'realex', 'merchant-id', ''),
(47, 'realex', 'secret-key', ''),
(48, 'beanstream', 'merchant-id', ''),
(49, 'naira', 'username', ''),
(50, 'charity', 'merchant-id', ''),
(51, 'twocheckout', 'language', 'EN'),
(52, 'payfast', 'validation-sand-url', 'https://sandbox.payfast.co.za/eng/query/validate'),
(53, 'icepay', 'merchant-id', ''),
(54, 'icepay', 'language', 'EN'),
(55, 'icepay', 'encryption-code', ''),
(56, 'beanstream', 'language', ''),
(57, 'beanstream', 'hash-value', ''),
(58, 'ccnow', 'login-id', ''),
(59, 'ccnow', 'language', 'en'),
(60, 'ccnow', 'secret-key', ''),
(61, 'ccnow', 'activation-key', ''),
(62, 'suvtoy', 'merchant-id', ''),
(63, 'suvtoy', 'language', ''),
(64, 'suvtoy', 'auth-hash', ''),
(65, 'iridium', 'pre-share-key', ''),
(66, 'iridium', 'merchant-id', ''),
(67, 'iridium', 'password', ''),
(68, 'iris', 'merchant-id', ''),
(69, 'iris', 'secret-key', ''),
(70, 'iris', 'sub-account', ''),
(71, 'realex', 'sub-account', '');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_mp3`
--

CREATE TABLE IF NOT EXISTS `mc_mp3` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(7) NOT NULL DEFAULT '0',
  `filePath` varchar(250) NOT NULL,
  `fileName` varchar(250) NOT NULL DEFAULT '',
  `fileFolder` varchar(250) NOT NULL DEFAULT '',
  `orderBy` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_index` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_newpages`
--

CREATE TABLE IF NOT EXISTS `mc_newpages` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(250) NOT NULL DEFAULT '',
  `pageKeys` text,
  `pageDesc` text,
  `pageText` text,
  `orderBy` int(5) NOT NULL DEFAULT '0',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `linkPos` varchar(10) NOT NULL DEFAULT '1',
  `linkExternal` enum('yes','no') NOT NULL DEFAULT 'no',
  `customTemplate` varchar(250) NOT NULL DEFAULT '',
  `linkTarget` enum('same','new') NOT NULL DEFAULT 'new',
  `landingPage` enum('yes','no') NOT NULL DEFAULT 'no',
  `leftColumn` enum('yes','no') NOT NULL DEFAULT 'yes',
  `rwslug` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `mc_newpages`
--

INSERT INTO `mc_newpages` (`id`, `pageName`, `pageKeys`, `pageDesc`, `pageText`, `orderBy`, `enabled`, `linkPos`, `linkExternal`, `customTemplate`, `linkTarget`, `landingPage`, `leftColumn`, `rwslug`) VALUES
(1, 'Contact Us', 'contact', 'us', 'If you would like to contact us, please use the form below', 2, 'yes', '1,2', 'no', '', 'new', 'no', 'yes', 'contact'),
(2, 'Terms & Conditions', 'terms..', 'conditions..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 9, 'yes', '1,2', 'no', '', 'new', 'no', 'yes', 'terms'),
(3, 'About Us', 'about..', 'us..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 1, 'yes', '1,2', 'no', 'example.tpl.php', 'new', 'no', 'yes', 'about'),
(4, 'Shipping & Returns', 'shipping..', 'returns..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 10, 'yes', '1,2', 'no', '', 'new', 'no', 'yes', 'shipping'),
(5, 'Payment Information', 'payment info..', 'payment info..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 7, 'yes', '3', 'no', '', 'new', 'no', 'yes', ''),
(6, 'Corporate Information', 'corporate info..', 'corporate info..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 5, 'yes', '3', 'no', '', 'new', 'no', 'yes', ''),
(7, 'Privacy & Security', 'privacy..', 'privacy..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 8, 'yes', '3', 'no', '', 'new', 'no', 'yes', 'privacy'),
(8, 'Careers', 'careers..', 'careers..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 4, 'yes', '3', 'no', '', 'new', 'no', 'yes', ''),
(9, 'Order Tracking', 'order tracking..', 'order tracking..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 6, 'yes', '3', 'no', '', 'new', 'no', 'yes', ''),
(10, 'Warranty/Product Care', 'warranty..', 'warranty..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 11, 'yes', '3', 'no', '', 'new', 'no', 'yes', ''),
(11, 'F.A.Q', 'faq..', 'faq..', '(This is only an example: To edit go to admin and System > Manage New Pages)\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiulus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.\r\n\r\nLorem ipsum dolor sit amet consectetuer pede et commodo ridiculus tempus. Suscipit tincidunt adipiscing Pellentesque porta enim porta laoreet interdum Morbi lacus. Curabitur at Pellentesque ac et cursus et accumsan ante orci semper. Penatibus egestas sit vitae ut ipsum nibh dolor Nunc Cum quam. Leo tellus vitae in mi sodales Aenean consequat turpis tempus Aenean. Consectetuer natoque pede tristique dis Pellentesque neque lacinia.', 3, 'yes', '2', 'no', '', 'new', 'no', 'yes', 'faq');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_newsletter`
--

CREATE TABLE IF NOT EXISTS `mc_newsletter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `emailAddress` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `email_index` (`emailAddress`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_newstemplates`
--

CREATE TABLE IF NOT EXISTS `mc_newstemplates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `subject` varchar(250) NOT NULL DEFAULT '',
  `html` text,
  `plain` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_news_ticker`
--

CREATE TABLE IF NOT EXISTS `mc_news_ticker` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `newsText` text,
  `enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `orderBy` int(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `mc_news_ticker`
--

INSERT INTO `mc_news_ticker` (`id`, `newsText`, `enabled`, `orderBy`) VALUES
(1, 'Congratulations, you have successfully installed Maian Cart v2.1, I hope you enjoy it..', 'yes', 1),
(2, 'Please refer to the documentation (docs) on how to get started. Any problems, please post on the support forums, thank you.', 'yes', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_paystatuses`
--

CREATE TABLE IF NOT EXISTS `mc_paystatuses` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `statname` varchar(200) NOT NULL DEFAULT '',
  `pMethod` varchar(15) NOT NULL DEFAULT 'all',
  `homepage` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `mthd_index` (`pMethod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_per`
--

CREATE TABLE IF NOT EXISTS `mc_per` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inZone` int(8) NOT NULL DEFAULT '0',
  `rate` varchar(30) NOT NULL DEFAULT '',
  `item` varchar(30) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `zone_index` (`inZone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_percent`
--

CREATE TABLE IF NOT EXISTS `mc_percent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inZone` int(8) NOT NULL DEFAULT '0',
  `priceFrom` varchar(30) NOT NULL DEFAULT '',
  `priceTo` varchar(30) NOT NULL DEFAULT '',
  `percentage` varchar(30) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `zone_index` (`inZone`),
  KEY `from_index` (`priceFrom`),
  KEY `to_index` (`priceTo`),
  KEY `en_index` (`enabled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_personalisation`
--

CREATE TABLE IF NOT EXISTS `mc_personalisation` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `productID` int(10) NOT NULL DEFAULT '0',
  `persInstructions` text,
  `persOptions` text,
  `maxChars` int(5) NOT NULL DEFAULT '0',
  `persAddCost` varchar(50) NOT NULL DEFAULT '',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'no',
  `boxType` enum('input','textarea') NOT NULL DEFAULT 'input',
  `reqField` enum('yes','no') NOT NULL DEFAULT 'no',
  `orderBy` int(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_index` (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_pictures`
--

CREATE TABLE IF NOT EXISTS `mc_pictures` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(7) NOT NULL DEFAULT '0',
  `picture_path` varchar(250) NOT NULL DEFAULT '',
  `thumb_path` varchar(250) NOT NULL DEFAULT '',
  `folder` varchar(250) NOT NULL DEFAULT '',
  `dimensions` varchar(12) NOT NULL DEFAULT '',
  `displayImg` enum('yes','no') NOT NULL DEFAULT 'no',
  `remoteServer` enum('yes','no') NOT NULL DEFAULT 'no',
  `remoteImg` text,
  `remoteThumb` text,
  PRIMARY KEY (`id`),
  KEY `product_index` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `mc_pictures`
--

INSERT INTO `mc_pictures` (`id`, `product_id`, `picture_path`, `thumb_path`, `folder`, `dimensions`, `displayImg`, `remoteServer`, `remoteImg`, `remoteThumb`) VALUES
(1, 2, 'democart-2-1.jpg', 'democartthumb-2-1.jpg', '', '614,530', 'yes', 'no', NULL, NULL),
(2, 1, 'democart-1-1.jpg', 'democartthumb-1-1.jpg', '', '509,489', 'yes', 'no', NULL, NULL),
(3, 4, 'democart-4-1.jpg', 'democartthumb-4-1.jpg', '', '480,479', 'yes', 'no', NULL, NULL),
(4, 4, 'democart-4-2.jpg', 'democartthumb-4-2.jpg', '', '480,479', 'no', 'no', NULL, NULL),
(5, 4, 'democart-4-3.jpg', 'democartthumb-4-3.jpg', '', '480,479', 'no', 'no', NULL, NULL),
(6, 3, 'democart-3-1.jpg', 'democartthumb-3-1.jpg', '', '479,480', 'yes', 'no', NULL, NULL),
(7, 3, 'democart-3-2.jpg', 'democartthumb-3-2.jpg', '', '479,480', 'no', 'no', NULL, NULL),
(8, 3, 'democart-3-3.jpg', 'democartthumb-3-3.jpg', '', '479,480', 'no', 'no', NULL, NULL),
(9, 5, 'democart-5-1.jpg', 'democartthumb-5-1.jpg', '', '640,480', 'no', 'no', NULL, NULL),
(10, 6, 'democart-6-1.jpg', 'democartthumb-6-1.jpg', '', '300,300', 'yes', 'no', NULL, NULL),
(11, 6, 'democart-6-2.jpg', 'democartthumb-6-2.jpg', '', '300,300', 'no', 'no', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_price_points`
--

CREATE TABLE IF NOT EXISTS `mc_price_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `priceFrom` varchar(30) NOT NULL DEFAULT '',
  `priceTo` varchar(30) NOT NULL DEFAULT '',
  `priceText` varchar(200) NOT NULL DEFAULT '',
  `orderBy` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_index` (`priceFrom`),
  KEY `to_index` (`priceTo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `mc_price_points`
--

INSERT INTO `mc_price_points` (`id`, `priceFrom`, `priceTo`, `priceText`, `orderBy`) VALUES
(1, '0.00', '20.00', '', 1),
(2, '20.00', '50.00', '', 2),
(3, '55.00', '500.00', '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_products`
--

CREATE TABLE IF NOT EXISTS `mc_products` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `pName` varchar(250) NOT NULL DEFAULT '',
  `pTitle` varchar(250) NOT NULL DEFAULT '',
  `pBrands` varchar(250) NOT NULL DEFAULT '',
  `pMetaKeys` text,
  `pMetaDesc` text,
  `pTags` text,
  `pDescription` text,
  `pShortDescription` text,
  `pDownload` enum('yes','no') NOT NULL DEFAULT 'no',
  `pDownloadPath` varchar(250) NOT NULL DEFAULT '',
  `pDownloadLimit` int(7) NOT NULL DEFAULT '0',
  `pCode` varchar(250) NOT NULL DEFAULT '',
  `pStockNotify` int(7) NOT NULL DEFAULT '0',
  `pStock` int(7) NOT NULL DEFAULT '0',
  `pEnable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `pDateAdded` date NOT NULL DEFAULT '0000-00-00',
  `pVisits` int(10) unsigned NOT NULL DEFAULT '0',
  `pVideo` varchar(250) NOT NULL DEFAULT '',
  `pWeight` varchar(50) NOT NULL DEFAULT '',
  `pPrice` varchar(20) NOT NULL DEFAULT '',
  `pInsurance` varchar(10) NOT NULL DEFAULT '0.00',
  `pOfferExpiry` date NOT NULL DEFAULT '0000-00-00',
  `pOffer` varchar(20) NOT NULL DEFAULT '',
  `pMultiBuy` int(10) NOT NULL DEFAULT '0',
  `rssBuildDate` varchar(35) NOT NULL DEFAULT '',
  `enDisqus` enum('yes','no') NOT NULL DEFAULT 'no',
  `freeShipping` enum('yes','no') NOT NULL DEFAULT 'no',
  `pPurchase` enum('yes','no') NOT NULL DEFAULT 'yes',
  `minPurchaseQty` int(10) NOT NULL DEFAULT '0',
  `maxPurchaseQty` int(10) NOT NULL DEFAULT '0',
  `countryRestrictions` text,
  `checkoutTextDisplay` varchar(100) NOT NULL DEFAULT '',
  `pNotes` text,
  `rwslug` varchar(250) NOT NULL DEFAULT '',
  `pAvailableText` varchar(250) NOT NULL DEFAULT '',
  `pCube` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pDownload` (`pDownload`),
  KEY `code_index` (`pCode`),
  KEY `name_index` (`pName`),
  KEY `stock_index` (`pStock`),
  KEY `en_index` (`pEnable`),
  KEY `wght_index` (`pWeight`),
  KEY `brand_index` (`pBrands`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `mc_products`
--

INSERT INTO `mc_products` (`id`, `pName`, `pTitle`, `pBrands`, `pMetaKeys`, `pMetaDesc`, `pTags`, `pDescription`, `pShortDescription`, `pDownload`, `pDownloadPath`, `pDownloadLimit`, `pCode`, `pStockNotify`, `pStock`, `pEnable`, `pDateAdded`, `pVisits`, `pVideo`, `pWeight`, `pPrice`, `pInsurance`, `pOfferExpiry`, `pOffer`, `pMultiBuy`, `rssBuildDate`, `enDisqus`, `freeShipping`, `pPurchase`, `minPurchaseQty`, `maxPurchaseQty`, `countryRestrictions`, `checkoutTextDisplay`, `pNotes`, `rwslug`, `pAvailableText`, `pCube`) VALUES
(1, 'Ayumi Hamasaki - Rock''n''Roll Circus', '', '0', 'meta..', 'meta..', 'ayumi,hamasaki,next level,jpop diva', 'Ayumi Hamasaki is dropping both her ARENA TOUR 2009 A - NEXT LEVEL -  concert DVD and her brand-new album Rock''n''Roll Circus on the same day! Continuing the diva''s trademark rock pop sounds, Rock''n''Roll Circus includes her hit double A-sides from last year, Sunrise / Sunset ~LOVE is ALL~ and You were... / BALLAD, and ten new songs for a total of 14 tracks. Ayumi''s recent CM songs for Panasonic and Honda, Don''t look back and Microphone, are among the album''s new songs.', 'Ayumi Hamasaki is dropping both her ARENA TOUR 2009 A - NEXT LEVEL -  concert DVD and her brand-new album Rock''n''Roll Circus on the same day! Continuing the diva''s trademark rock pop sounds, Rock''n''Roll Circus includes her hit double A-sides from last year, Sunrise / Sunset ~LOVE is ALL~ and You were... / BALLAD, and ten new songs for a total of 14 tracks.', 'no', '', 0, 'AH-RARC-12', 2, 10, 'yes', '2014-08-05', 683, '', '300', '14.43', '0.00', '0000-00-00', '', 0, 'Tue, 5 Aug 2014 09:17:50 UTC', 'no', 'no', 'yes', 0, 0, NULL, '', NULL, '', '', 0),
(2, 'Namie Amuro - Past < Future', '', '0', 'meta..', 'meta..', 'namie,amuro,best fiction,jpop diva', 'On the strength of her best-selling Greatest Hits album BEST FICTION  which has sold more than 1.7 million copies, Namie Amuro is releasing her highly anticipated new original album! About two and a half years after her last album PLAY, the J-pop diva plans to start anew with her latest album Past < Future, packing it with 12 ballads and dance numbers, including lead single FAST CAR, the ballad The Meaning Of Us, and the latest Vidal Sassoon CM songs MY LOVE and COPY THAT!.', 'On the strength of her best-selling Greatest Hits album BEST FICTION  which has sold more than 1.7 million copies, Namie Amuro is releasing her highly anticipated new original album! About two and a half years after her last album PLAY, the J-pop diva plans to start anew with her latest album Past < Future.', 'no', '', 0, 'NA-PF-123', 2, 10, 'yes', '2014-08-05', 592, 'file.flv', '300', '12.39', '0.00', '0000-00-00', '10.99', 0, 'Tue, 5 Aug 2014 09:17:50 UTC', 'no', 'no', 'yes', 0, 0, NULL, '', NULL, '', '', 0),
(3, 'HTC Desire SIM-Free Android Smartphone', '', '2', 'meta..', 'meta..', 'desire,android,snapdragon', 'HTC Desire delivers intense brilliance, sharp contrast, and true colors on the expansive 3.7-inch SuperTFT display. The 1 GHz Qualcomm Snapdragon processor makes the phone incredibly responsive as you multitask from app to app without skipping a beat, while the instinctive HTC Sense experience lets you wield the power of the HTC Desire with the greatest of ease.', 'HTC Desire delivers intense brilliance, sharp contrast, and true colors on the expansive 3.7-inch SuperTFT display. The 1 GHz Qualcomm Snapdragon processor makes the phone incredibly responsive as you multitask from app to app without skipping a beat', 'no', '', 0, 'HTC-123', 2, 10, 'yes', '2014-08-05', 11, '', '1000', '379.81', '0.00', '0000-00-00', '', 0, 'Tue, 5 Aug 2014 09:17:50 UTC', 'no', 'no', 'yes', 0, 0, NULL, '', NULL, '', '', 0),
(4, 'Acer Aspire 5741, 15.6 LED LCD Notebook', '', '1', '', '', 'aspire,wireless,processor', 'Aspire 5741 - everyday home computing with Core i3 power\r\n\r\nProviding the perfect balance of performance, size and boundary-free wireless capability, the modish yet practical Aspire 5741--powered by the latest Intel Core i3 processor--is the right tool for efficient multitasking, smooth communication, and great entertainment at home or away.\r\nSleek Sophisticated Design\r\n\r\nWith a striking mesh cover design, the Aspire 5741 oozes style. Finished off with classy silver frame traces, it has a distinct power key and intricate matte speaker grills finished off with a glossy bevel giving it the perfect finish.', 'Aspire 5741 - everyday home computing with Core i3 power\r\n\r\nProviding the perfect balance of performance, size and boundary-free wireless capability, the modish yet practical Aspire 5741--powered by the latest Intel Core i3 processor--is the right tool for efficient multitasking', 'no', '', 1, 'AC-123', 0, 10, 'yes', '2014-08-05', 22, '0', '2000', '426.93', '0.00', '0000-00-00', '', 0, 'Tue, 5 Aug 2014 09:17:50 UTC', 'no', 'no', 'yes', 0, 0, NULL, '', NULL, '', '', 0),
(5, 'Hong Kong Pictures', '', '0', '', '', 'hong,kong,pictures,beach', 'This is a test downloadable product with a couple of pictures from Hong Kong in a zip file.', 'This is a test downloadable product with a couple of pictures from Hong Kong. This is added in the demo store so you can see an example of how the download manager works.', 'yes', 'hongkong/pics1.zip', 1, 'HK-123', 0, 1000, 'yes', '2014-08-05', 22, '0', '0', '4.99', '0.00', '0000-00-00', '', 0, 'Tue, 5 Aug 2014 09:17:50 UTC', 'no', 'no', 'yes', 0, 0, NULL, '', NULL, '', '', 0),
(6, 'Berghaus Womens Short Sleeve Tech T', '', '4', '', '', 'berghaus,sleeve,tech,activity', 'Lightweight multi-activity base layer that is fast wicking, quick drying and has permanent odour protection meaning you can wear it more and wash it less!\r\nMulti-activity short sleeve base layer using Berghaus own lightweight, fast wicking and quick drying fabric featuring silver ion technology that has permanent odour protection. Wear under a Gore-Tex shell for the best performance.', 'Lightweight multi-activity base layer that is fast wicking, quick drying and has permanent odour protection meaning you can wear it more and wash it less!\r\nMulti-activity short sleeve base layer using Berghaus own lightweight, fast wicking and quick drying fabric featuring silver ion technology th', 'no', '', 1, 'BH-123', 0, 10, 'yes', '2014-08-05', 22, '0', '500', '16.99', '0.00', '0000-00-00', '', 0, 'Tue, 5 Aug 2014 09:17:50 UTC', 'no', 'no', 'yes', 0, 0, NULL, '', NULL, '', '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_prod_category`
--

CREATE TABLE IF NOT EXISTS `mc_prod_category` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(8) NOT NULL DEFAULT '0',
  `category` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_index` (`product`),
  KEY `cat_index` (`category`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `mc_prod_category`
--

INSERT INTO `mc_prod_category` (`id`, `product`, `category`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 4),
(6, 6, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_prod_relation`
--

CREATE TABLE IF NOT EXISTS `mc_prod_relation` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `product` int(8) NOT NULL DEFAULT '0',
  `related` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `prod_index` (`product`),
  KEY `rel_index` (`related`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `mc_prod_relation`
--

INSERT INTO `mc_prod_relation` (`id`, `product`, `related`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_purchases`
--

CREATE TABLE IF NOT EXISTS `mc_purchases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `purchaseDate` date NOT NULL DEFAULT '0000-00-00',
  `purchaseTime` time NOT NULL DEFAULT '00:00:00',
  `saleID` int(11) NOT NULL DEFAULT '0',
  `productType` enum('download','physical','virtual') NOT NULL DEFAULT 'physical',
  `productID` int(7) NOT NULL DEFAULT '0',
  `giftID` int(7) NOT NULL DEFAULT '0',
  `categoryID` int(8) NOT NULL DEFAULT '0',
  `salePrice` varchar(20) NOT NULL DEFAULT '',
  `liveDownload` enum('yes','no') NOT NULL DEFAULT 'no',
  `persPrice` varchar(20) NOT NULL DEFAULT '',
  `attrPrice` varchar(20) NOT NULL DEFAULT '',
  `insPrice` varchar(10) NOT NULL DEFAULT '0.00',
  `globalDiscount` int(3) NOT NULL DEFAULT '0',
  `globalCost` varchar(20) NOT NULL DEFAULT '',
  `productQty` int(5) NOT NULL DEFAULT '0',
  `productWeight` varchar(20) NOT NULL DEFAULT '',
  `downloadAmount` int(7) NOT NULL DEFAULT '0',
  `downloadCode` char(50) NOT NULL DEFAULT '',
  `buyCode` varchar(50) NOT NULL DEFAULT '',
  `saleConfirmation` enum('yes','no') NOT NULL DEFAULT 'no',
  `deletedProductName` varchar(250) NOT NULL DEFAULT '',
  `freeShipping` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `saleid_index` (`saleID`),
  KEY `product_index` (`productID`),
  KEY `cat_index` (`categoryID`),
  KEY `conf_index` (`saleConfirmation`),
  KEY `dcode_index` (`downloadCode`),
  KEY `ld_index` (`liveDownload`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_purch_atts`
--

CREATE TABLE IF NOT EXISTS `mc_purch_atts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `saleID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `purchaseID` int(11) NOT NULL DEFAULT '0',
  `attributeID` int(7) NOT NULL DEFAULT '0',
  `addCost` varchar(20) NOT NULL DEFAULT '',
  `attrName` varchar(100) NOT NULL DEFAULT '',
  `attrWeight` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `saleid_index` (`saleID`),
  KEY `prodid_index` (`productID`),
  KEY `purid_index` (`purchaseID`),
  KEY `attid_index` (`attributeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_purch_pers`
--

CREATE TABLE IF NOT EXISTS `mc_purch_pers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `saleID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `purchaseID` int(11) NOT NULL DEFAULT '0',
  `personalisationID` int(7) NOT NULL DEFAULT '0',
  `visitorData` text,
  `addCost` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `saleid_index` (`saleID`),
  KEY `prod_index` (`productID`),
  KEY `purc_index` (`purchaseID`),
  KEY `pers_index` (`personalisationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_rates`
--

CREATE TABLE IF NOT EXISTS `mc_rates` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rWeightFrom` varchar(50) NOT NULL DEFAULT '0',
  `rWeightTo` varchar(50) NOT NULL DEFAULT '0',
  `rCost` varchar(20) NOT NULL DEFAULT '',
  `rService` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_index` (`rWeightFrom`),
  KEY `to_index` (`rWeightTo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `mc_rates`
--

INSERT INTO `mc_rates` (`id`, `rWeightFrom`, `rWeightTo`, `rCost`, `rService`) VALUES
(1, '0', '9999999999999', '1.99', 1),
(2, '0', '9999999999999', '10.99', 2),
(3, '0', '9999999999999', '15.99', 3),
(4, '0', '9999999999999', '20.99', 4),
(5, '0', '9999999999999', '12.99', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `mc_sales`
--

CREATE TABLE IF NOT EXISTS `mc_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoiceNo` varchar(100) NOT NULL DEFAULT '',
  `saleNotes` text,
  `bill_1` varchar(250) NOT NULL DEFAULT '',
  `bill_2` varchar(250) NOT NULL DEFAULT '',
  `bill_3` varchar(250) NOT NULL DEFAULT '',
  `bill_4` varchar(250) NOT NULL DEFAULT '',
  `bill_5` varchar(250) NOT NULL DEFAULT '',
  `bill_6` varchar(250) NOT NULL DEFAULT '',
  `bill_7` varchar(250) NOT NULL DEFAULT '',
  `bill_8` varchar(250) NOT NULL DEFAULT '',
  `bill_9` int(5) NOT NULL DEFAULT '0',
  `ship_1` varchar(250) NOT NULL DEFAULT '',
  `ship_2` varchar(250) NOT NULL DEFAULT '',
  `ship_3` varchar(250) NOT NULL DEFAULT '',
  `ship_4` varchar(250) NOT NULL DEFAULT '',
  `ship_5` varchar(250) NOT NULL DEFAULT '',
  `ship_6` varchar(250) NOT NULL DEFAULT '',
  `ship_7` varchar(250) NOT NULL DEFAULT '',
  `ship_8` varchar(250) NOT NULL DEFAULT '',
  `buyerAddress` text,
  `paymentStatus` varchar(20) NOT NULL DEFAULT '',
  `gatewayID` varchar(250) NOT NULL DEFAULT '',
  `taxPaid` varchar(20) NOT NULL DEFAULT '',
  `taxRate` varchar(5) NOT NULL DEFAULT '',
  `couponCode` varchar(200) NOT NULL DEFAULT '',
  `couponTotal` varchar(100) NOT NULL DEFAULT '',
  `codeType` varchar(20) NOT NULL DEFAULT '',
  `subTotal` varchar(20) NOT NULL DEFAULT '',
  `grandTotal` varchar(20) NOT NULL DEFAULT '',
  `shipTotal` varchar(20) NOT NULL DEFAULT '',
  `globalTotal` varchar(20) NOT NULL DEFAULT '0',
  `insuranceTotal` varchar(10) NOT NULL DEFAULT '0.00',
  `globalDiscount` int(5) NOT NULL DEFAULT '0',
  `manualDiscount` varchar(20) NOT NULL DEFAULT '',
  `isPickup` enum('yes','no') NOT NULL DEFAULT 'no',
  `shipSetCountry` int(7) NOT NULL DEFAULT '0',
  `shipSetArea` int(7) NOT NULL DEFAULT '0',
  `setShipRateID` int(7) NOT NULL DEFAULT '0',
  `shipType` varchar(20) NOT NULL DEFAULT '',
  `cartWeight` varchar(20) NOT NULL DEFAULT '',
  `purchaseDate` date NOT NULL DEFAULT '0000-00-00',
  `purchaseTime` time NOT NULL DEFAULT '00:00:00',
  `buyCode` varchar(50) NOT NULL,
  `saleConfirmation` enum('yes','no') NOT NULL DEFAULT 'no',
  `paymentMethod` varchar(20) NOT NULL DEFAULT '',
  `ipAddress` text,
  `ipAccess` text,
  `restrictCount` int(7) NOT NULL DEFAULT '0',
  `orderCopyEmails` text,
  `zipLimit` int(5) NOT NULL DEFAULT '0',
  `downloadLock` enum('yes','no') NOT NULL DEFAULT 'no',
  `optInNewsletter` enum('yes','no') NOT NULL DEFAULT 'yes',
  `paypalErrorTrigger` tinyint(1) NOT NULL DEFAULT '0',
  `gateparams` text,
  PRIMARY KEY (`id`),
  KEY `code_index` (`buyCode`),
  KEY `conf_index` (`saleConfirmation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_search_index`
--

CREATE TABLE IF NOT EXISTS `mc_search_index` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `searchCode` varchar(50) NOT NULL DEFAULT '',
  `results` text,
  `searchDate` date NOT NULL DEFAULT '0000-00-00',
  `filters` text,
  PRIMARY KEY (`id`),
  KEY `code_index` (`searchCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_search_log`
--

CREATE TABLE IF NOT EXISTS `mc_search_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` text,
  `results` int(7) NOT NULL DEFAULT '0',
  `searchDate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_services`
--

CREATE TABLE IF NOT EXISTS `mc_services` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `sName` varchar(250) NOT NULL DEFAULT '0',
  `sEstimation` varchar(250) NOT NULL DEFAULT '0',
  `sSignature` enum('yes','no') NOT NULL DEFAULT 'yes',
  `inZone` int(6) NOT NULL DEFAULT '0',
  `enableCOD` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `zone_index` (`inZone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `mc_services`
--

INSERT INTO `mc_services` (`id`, `sName`, `sEstimation`, `sSignature`, `inZone`, `enableCOD`) VALUES
(1, 'Flat Rate', '5/7 Workings Days', 'no', 1, 'yes'),
(2, 'Flat Rate', '14/21 Workings Days', 'no', 2, 'yes'),
(3, 'Flat Rate', '7/9 Workings Days', 'yes', 3, 'yes'),
(4, 'Flat Rate', '5/7 Workings Days', 'no', 4, 'yes'),
(5, 'Flat Rate', '7/14 Workings Days', 'yes', 5, 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_settings`
--

CREATE TABLE IF NOT EXISTS `mc_settings` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `website` varchar(250) NOT NULL DEFAULT '',
  `theme` varchar(100) NOT NULL DEFAULT '_theme_default',
  `email` varchar(250) NOT NULL DEFAULT '',
  `addEmails` text,
  `serverPath` varchar(250) NOT NULL DEFAULT '',
  `languagePref` varchar(40) NOT NULL DEFAULT 'english.php',
  `logoName` varchar(50) NOT NULL DEFAULT '',
  `addThisModule` text,
  `baseCurrency` char(3) NOT NULL DEFAULT 'GBP',
  `currencyDisplayPref` varchar(100) NOT NULL DEFAULT '',
  `logErrors` enum('yes','no') NOT NULL DEFAULT 'no',
  `gatewayMode` enum('test','live') NOT NULL DEFAULT 'test',
  `enableSSL` enum('yes','no') NOT NULL DEFAULT 'no',
  `enablePickUp` enum('yes','no') NOT NULL DEFAULT 'no',
  `shipCountry` varchar(10) NOT NULL DEFAULT '',
  `logFolderName` varchar(50) NOT NULL DEFAULT 'logs',
  `ifolder` varchar(250) NOT NULL DEFAULT '',
  `metaKeys` text,
  `metaDesc` text,
  `enableCart` enum('yes','no') NOT NULL DEFAULT 'yes',
  `offlineDate` date NOT NULL DEFAULT '0000-00-00',
  `offlineText` text,
  `offlineIP` text,
  `en_rss` enum('yes','no') NOT NULL DEFAULT 'yes',
  `rssScroller` enum('yes','no') NOT NULL DEFAULT 'no',
  `rssScrollerUrl` varchar(250) NOT NULL DEFAULT '',
  `rssScrollerLimit` int(3) NOT NULL DEFAULT '10',
  `en_modr` enum('yes','no') NOT NULL DEFAULT 'no',
  `appendindex` enum('yes','no') NOT NULL DEFAULT 'yes',
  `cName` varchar(250) NOT NULL DEFAULT '',
  `cWebsite` varchar(250) NOT NULL DEFAULT '',
  `cTel` varchar(250) NOT NULL DEFAULT '',
  `cFax` varchar(250) NOT NULL DEFAULT '',
  `cAddress` text,
  `cOther` text,
  `cReturns` text,
  `smtp` enum('yes','no') NOT NULL DEFAULT 'no',
  `smtp_host` varchar(100) NOT NULL DEFAULT 'localhost',
  `smtp_user` varchar(100) NOT NULL DEFAULT '',
  `smtp_pass` varchar(100) NOT NULL DEFAULT '',
  `smtp_port` varchar(100) NOT NULL DEFAULT '25',
  `homeProdValue` int(3) NOT NULL DEFAULT '0',
  `homeProdType` varchar(10) NOT NULL DEFAULT 'latest',
  `homeProdCats` text,
  `homeProdIDs` text,
  `adminFooter` text,
  `publicFooter` text,
  `prodKey` char(60) NOT NULL DEFAULT '',
  `encoderVersion` varchar(5) NOT NULL DEFAULT '',
  `activateEmails` enum('yes','no') NOT NULL DEFAULT 'no',
  `saleComparisonItems` int(6) NOT NULL DEFAULT '0',
  `productsPerPage` int(4) NOT NULL DEFAULT '35',
  `mostPopProducts` int(5) NOT NULL DEFAULT '0',
  `mostPopPref` enum('sales','hits') NOT NULL DEFAULT 'sales',
  `latestProdLimit` int(5) NOT NULL DEFAULT '0',
  `latestProdDuration` enum('days','months','years') NOT NULL DEFAULT 'days',
  `searchLowStockLimit` int(5) NOT NULL DEFAULT '1',
  `enSearchLog` enum('yes','no') NOT NULL DEFAULT 'no',
  `savedSearches` int(6) NOT NULL DEFAULT '7',
  `searchSlider` text,
  `searchTagsOnly` enum('yes','no') NOT NULL DEFAULT 'no',
  `flashVideoWidth` int(4) NOT NULL DEFAULT '0',
  `flashVideoHeight` int(4) NOT NULL DEFAULT '0',
  `jsDateFormat` varchar(10) NOT NULL DEFAULT 'DD-MM-YYYY',
  `jsWeekStart` tinyint(1) NOT NULL DEFAULT '0',
  `helpTips` enum('yes','no') NOT NULL DEFAULT 'yes',
  `timezone` varchar(50) NOT NULL DEFAULT 'Europe/London',
  `mysqlDateFormat` varchar(10) NOT NULL DEFAULT '',
  `systemDateFormat` varchar(30) NOT NULL DEFAULT 'j F Y',
  `rssFeedLimit` int(3) NOT NULL DEFAULT '50',
  `minInvoiceDigits` tinyint(2) NOT NULL DEFAULT '5',
  `invoiceNo` int(10) NOT NULL DEFAULT '1',
  `pendingAsComplete` enum('yes','no') NOT NULL DEFAULT 'no',
  `freeShipThreshold` varchar(10) NOT NULL DEFAULT '',
  `enableZip` enum('yes','no') NOT NULL DEFAULT 'no',
  `zipCreationLimit` varchar(100) NOT NULL DEFAULT '0',
  `zipLimit` int(3) NOT NULL DEFAULT '0',
  `zipTimeOut` int(6) NOT NULL DEFAULT '0',
  `zipMemoryLimit` int(5) NOT NULL DEFAULT '0',
  `zipAdditionalFolder` varchar(50) NOT NULL DEFAULT 'additional-zip',
  `enEntryLog` enum('yes','no') NOT NULL DEFAULT 'no',
  `softwareVersion` varchar(10) NOT NULL DEFAULT '',
  `smartQuotes` enum('yes','no') NOT NULL DEFAULT 'yes',
  `hitCounter` enum('yes','no') NOT NULL DEFAULT 'yes',
  `menuSubCats` enum('yes','no') NOT NULL DEFAULT 'yes',
  `adminFolderName` varchar(100) NOT NULL DEFAULT 'admin',
  `facebookLink` varchar(250) NOT NULL DEFAULT '',
  `twitterLink` varchar(250) NOT NULL DEFAULT '',
  `twitterUser` varchar(50) NOT NULL DEFAULT '',
  `twitterLatest` enum('yes','no') NOT NULL DEFAULT 'no',
  `globalDiscount` varchar(20) NOT NULL DEFAULT '0',
  `globalDiscountExpiry` date NOT NULL DEFAULT '0000-00-00',
  `enableRecentView` enum('yes','no') NOT NULL DEFAULT 'yes',
  `disqusShortName` varchar(250) NOT NULL DEFAULT '',
  `disqusDevMode` enum('yes','no') NOT NULL DEFAULT 'yes',
  `freeDownloadRestriction` varchar(10) NOT NULL DEFAULT '0',
  `thumbWidth` int(4) NOT NULL DEFAULT '230',
  `thumbHeight` int(4) NOT NULL DEFAULT '200',
  `thumbQuality` int(3) NOT NULL DEFAULT '99',
  `thumbQualityPNG` tinyint(1) NOT NULL DEFAULT '9',
  `aspectRatio` enum('yes','no') NOT NULL DEFAULT 'yes',
  `renamePics` enum('yes','no') NOT NULL DEFAULT 'yes',
  `tmbPrefix` varchar(100) NOT NULL DEFAULT 'tmb_',
  `imgPrefix` varchar(100) NOT NULL DEFAULT 'img_',
  `showOutofStock` enum('cat','yes','no') NOT NULL DEFAULT 'yes',
  `enableCheckout` enum('yes','no') NOT NULL DEFAULT 'yes',
  `globalDownloadPath` varchar(250) NOT NULL DEFAULT '',
  `optInNewsletter` enum('yes','no') NOT NULL DEFAULT 'yes',
  `maxProductChars` int(8) NOT NULL DEFAULT '200',
  `reduceDownloadStock` enum('yes','no') NOT NULL DEFAULT 'no',
  `enableBBCode` enum('yes','no') NOT NULL DEFAULT 'yes',
  `downloadFolder` varchar(100) NOT NULL DEFAULT '',
  `downloadRestrictIP` enum('yes','no') NOT NULL DEFAULT 'no',
  `downloadRestrictIPLog` enum('yes','no') NOT NULL DEFAULT 'no',
  `downloadRestrictIPCnt` int(7) NOT NULL DEFAULT '0',
  `downloadRestrictIPLock` int(7) NOT NULL DEFAULT '0',
  `downloadRestrictIPMail` enum('yes','no') NOT NULL DEFAULT 'no',
  `downloadRestrictIPGlobal` text,
  `contactDisplay` varchar(250) NOT NULL DEFAULT '',
  `leftBoxOrder` text,
  `leftBoxCustom` text,
  `parentCatHomeDisplay` enum('yes','no') NOT NULL DEFAULT 'no',
  `isbnAPI` varchar(50) NOT NULL DEFAULT '',
  `offerInsurance` enum('yes','no') NOT NULL DEFAULT 'no',
  `insuranceAmount` varchar(10) NOT NULL DEFAULT '',
  `insuranceFilter` char(3) NOT NULL DEFAULT '',
  `insuranceOptional` enum('yes','no') NOT NULL DEFAULT 'no',
  `insuranceValue` varchar(20) NOT NULL DEFAULT '',
  `insuranceInfo` text,
  `freeTextDisplay` varchar(10) NOT NULL DEFAULT '',
  `excludeFreePop` enum('yes','no') NOT NULL DEFAULT 'no',
  `priceTextDisplay` varchar(100) NOT NULL DEFAULT '',
  `en_sitemap` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sitemapPref` enum('list','cat') NOT NULL DEFAULT 'list',
  `cubeUrl` varchar(250) NOT NULL DEFAULT '',
  `cubeAPI` varchar(250) NOT NULL DEFAULT '',
  `minCheckoutAmount` varchar(50) NOT NULL DEFAULT '',
  `showAttrStockLevel` enum('yes','no') NOT NULL DEFAULT 'no',
  `qtyStockThreshold` int(5) NOT NULL DEFAULT '50',
  `productStockThreshold` int(5) NOT NULL DEFAULT '30',
  `autoClear` int(3) NOT NULL DEFAULT '7',
  `batchMail` text,
  `freeAltRedirect` varchar(250) NOT NULL DEFAULT '',
  `menuCatCount` enum('yes','no') NOT NULL DEFAULT 'no',
  `menuBrandCount` enum('yes','no') NOT NULL DEFAULT 'no',
  `catGiftPos` varchar(10) NOT NULL DEFAULT 'end',
  `showBrands` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `mc_settings`
--

INSERT INTO `mc_settings` (`id`, `website`, `theme`, `email`, `addEmails`, `serverPath`, `languagePref`, `logoName`, `addThisModule`, `baseCurrency`, `currencyDisplayPref`, `logErrors`, `gatewayMode`, `enableSSL`, `enablePickUp`, `shipCountry`, `logFolderName`, `ifolder`, `metaKeys`, `metaDesc`, `enableCart`, `offlineDate`, `offlineText`, `offlineIP`, `en_rss`, `rssScroller`, `rssScrollerUrl`, `rssScrollerLimit`, `en_modr`, `appendindex`, `cName`, `cWebsite`, `cTel`, `cFax`, `cAddress`, `cOther`, `cReturns`, `smtp`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `homeProdValue`, `homeProdType`, `homeProdCats`, `homeProdIDs`, `adminFooter`, `publicFooter`, `prodKey`, `encoderVersion`, `activateEmails`, `saleComparisonItems`, `productsPerPage`, `mostPopProducts`, `mostPopPref`, `latestProdLimit`, `latestProdDuration`, `searchLowStockLimit`, `enSearchLog`, `savedSearches`, `searchSlider`, `searchTagsOnly`, `flashVideoWidth`, `flashVideoHeight`, `jsDateFormat`, `jsWeekStart`, `helpTips`, `timezone`, `mysqlDateFormat`, `systemDateFormat`, `rssFeedLimit`, `minInvoiceDigits`, `invoiceNo`, `pendingAsComplete`, `freeShipThreshold`, `enableZip`, `zipCreationLimit`, `zipLimit`, `zipTimeOut`, `zipMemoryLimit`, `zipAdditionalFolder`, `enEntryLog`, `softwareVersion`, `smartQuotes`, `hitCounter`, `menuSubCats`, `adminFolderName`, `facebookLink`, `twitterLink`, `twitterUser`, `twitterLatest`, `globalDiscount`, `globalDiscountExpiry`, `enableRecentView`, `disqusShortName`, `disqusDevMode`, `freeDownloadRestriction`, `thumbWidth`, `thumbHeight`, `thumbQuality`, `thumbQualityPNG`, `aspectRatio`, `renamePics`, `tmbPrefix`, `imgPrefix`, `showOutofStock`, `enableCheckout`, `globalDownloadPath`, `optInNewsletter`, `maxProductChars`, `reduceDownloadStock`, `enableBBCode`, `downloadFolder`, `downloadRestrictIP`, `downloadRestrictIPLog`, `downloadRestrictIPCnt`, `downloadRestrictIPLock`, `downloadRestrictIPMail`, `downloadRestrictIPGlobal`, `contactDisplay`, `leftBoxOrder`, `leftBoxCustom`, `parentCatHomeDisplay`, `isbnAPI`, `offerInsurance`, `insuranceAmount`, `insuranceFilter`, `insuranceOptional`, `insuranceValue`, `insuranceInfo`, `freeTextDisplay`, `excludeFreePop`, `priceTextDisplay`, `en_sitemap`, `sitemapPref`, `cubeUrl`, `cubeAPI`, `minCheckoutAmount`, `showAttrStockLevel`, `qtyStockThreshold`, `productStockThreshold`, `autoClear`, `batchMail`, `freeAltRedirect`, `menuCatCount`, `menuBrandCount`, `catGiftPos`, `showBrands`) VALUES
(1, 'Maian Cart', '_theme_default', 'j', '', '/var/www/webroot/', 'english', '', '', 'GBP', '&pound;{PRICE}', 'yes', 'test', 'no', 'yes', '183', 'logs', 'http://maiancart.demo.jelastic.com/', 'Meta keywords here..', 'Meta description here..', 'yes', '0000-00-00', '', '', 'yes', 'yes', 'http://feeds.bbc.co.uk/iplayer/highlights/tv', 10, 'no', 'yes', 'Maian Cart', 'http://maiancart.demo.jelastic.com/', '01234 456789', '01345 567890', '1 Some Street\r\nSomeplace\r\nSomewhere\r\nWS11 1AB', '', '', 'no', '', '', '', '587', 10, 'latest', '3,2,1', '', '<p><a href="http://www.yoursite.com">Your Website Link</a>. All Rights Reserved.</p>', '<a href="http://www.yoursite.com">Your Website Link</a>. All Rights Reserved.', '5A280CFAF2B24881D42DB58910888979C67FB73B1EC494F10EDA1606C9DC', '4.6', 'yes', 10, 8, 10, 'sales', 6, 'months', 5, 'yes', 7, 'a:4:{s:3:"min";s:1:"0";s:3:"max";s:3:"300";s:5:"start";s:1:"5";s:3:"end";s:3:"100";}', 'no', 425, 300, 'DD/MM/YYYY', 0, 'yes', 'UTC', '%e %b %Y', 'j F Y', 50, 5, 30, 'no', '0.00', 'no', '8388608', 2, 0, 0, 'additional-zip', 'yes', '2.1', 'yes', 'yes', 'yes', 'admin', 'http://www.facebook.com', 'http://www.twitter.com', '', 'no', '0', '0000-00-00', 'yes', '', 'yes', '0', 230, 200, 96, 9, 'yes', 'yes', 'tmb_', 'img_', 'cat', 'yes', '/var/www/webroot/ROOT/', 'yes', 300, 'no', 'yes', 'product-downloads', 'no', 'no', 0, 0, 'no', NULL, 'cName,cWebsite,cTel,cFax,cAddress,cOther', 'a:8:{i:0;a:2:{i:0;s:1:"1";i:1;s:3:"cat";}i:1;a:2:{i:0;s:1:"3";i:1;s:6:"points";}i:2;a:2:{i:0;s:1:"4";i:1;s:7:"popular";}i:3;a:2:{i:0;s:1:"7";i:1;s:6:"tweets";}i:4;a:2:{i:0;s:1:"5";i:1;s:6:"recent";}i:5;a:2:{i:0;s:1:"6";i:1;s:5:"links";}i:6;a:2:{i:0;s:1:"2";i:1;s:6:"brands";}i:7;a:2:{i:0;s:1:"8";i:1;s:3:"rss";}}', '', 'yes', '', 'no', '10', 'op4', 'no', '1.00', 'Lorem ipsum dolor sit amet consectetuer quis est at felis dui....', 'FREE', 'yes', '', 'yes', 'cat', '', '', '0.00', 'no', 50, 30, 0, NULL, '', 'no', 'no', 'end', 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_statuses`
--

CREATE TABLE IF NOT EXISTS `mc_statuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `saleID` int(7) NOT NULL DEFAULT '0',
  `statusNotes` text,
  `dateAdded` date NOT NULL DEFAULT '0000-00-00',
  `timeAdded` time NOT NULL DEFAULT '00:00:00',
  `orderStatus` varchar(20) NOT NULL DEFAULT '',
  `adminUser` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `saleid_index` (`saleID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_status_text`
--

CREATE TABLE IF NOT EXISTS `mc_status_text` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `statTitle` varchar(250) NOT NULL DEFAULT '',
  `statText` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_tare`
--

CREATE TABLE IF NOT EXISTS `mc_tare` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `rWeightFrom` varchar(50) NOT NULL DEFAULT '0',
  `rWeightTo` varchar(50) NOT NULL DEFAULT '0',
  `rCost` varchar(20) NOT NULL DEFAULT '',
  `rService` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `from_index` (`rWeightFrom`),
  KEY `to_index` (`rWeightTo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_themes`
--

CREATE TABLE IF NOT EXISTS `mc_themes` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(200) NOT NULL DEFAULT '',
  `from` date NOT NULL DEFAULT '0000-00-00',
  `to` date NOT NULL DEFAULT '0000-00-00',
  `enabled` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `from_index` (`from`),
  KEY `to_index` (`to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_users`
--

CREATE TABLE IF NOT EXISTS `mc_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(100) NOT NULL DEFAULT '',
  `userPass` varchar(40) NOT NULL DEFAULT '',
  `userType` enum('admin','restricted') NOT NULL DEFAULT 'restricted',
  `userPriv` enum('yes','no') NOT NULL DEFAULT 'no',
  `accessPages` text,
  `enableUser` enum('yes','no') NOT NULL DEFAULT 'no',
  `lastLogin` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `mc_zones`
--

CREATE TABLE IF NOT EXISTS `mc_zones` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `zName` varchar(250) NOT NULL DEFAULT '',
  `zCountry` int(5) NOT NULL DEFAULT '0',
  `zRate` varchar(10) NOT NULL DEFAULT '',
  `zShipping` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `ctry_index` (`zCountry`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `mc_zones`
--

INSERT INTO `mc_zones` (`id`, `zName`, `zCountry`, `zRate`, `zShipping`) VALUES
(1, 'Zone 1', 183, '20', 'yes'),
(2, 'Zone 2', 183, '20', 'yes'),
(3, 'Zone 3', 183, '20', 'yes'),
(4, 'Zone 4', 183, '20', 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `mc_zone_areas`
--

CREATE TABLE IF NOT EXISTS `mc_zone_areas` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `inZone` int(5) NOT NULL DEFAULT '0',
  `areaName` varchar(200) NOT NULL DEFAULT '',
  `zCountry` int(5) NOT NULL DEFAULT '0',
  `zRate` varchar(10) NOT NULL DEFAULT '',
  `zShipping` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `zone_index` (`inZone`),
  KEY `ctry_index` (`zCountry`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `mc_zone_areas`
--

INSERT INTO `mc_zone_areas` (`id`, `inZone`, `areaName`, `zCountry`, `zRate`, `zShipping`) VALUES
(1, 1, 'UK Mainland', 183, '20', 'yes'),
(2, 2, 'South of Scotland', 183, '20', 'yes'),
(3, 2, 'North of Scotland & Northern Ireland', 183, '20', 'yes'),
(4, 2, 'Republic of Ireland', 183, '20', 'yes'),
(5, 3, 'UK Islands & Channel Islands', 183, '20', 'yes');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
