-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 25, 2019 at 11:20 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie`
--
CREATE DATABASE IF NOT EXISTS `movie` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci;
USE `movie`;

-- --------------------------------------------------------

--
-- Table structure for table `casts`
--

DROP TABLE IF EXISTS `casts`;
CREATE TABLE IF NOT EXISTS `casts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `casts`
--

INSERT INTO `casts` (`id`, `first_name`, `last_name`, `middle_name`, `birth_date`, `created_at`, `updated_at`) VALUES
(1, 'Nicolas', 'Cage', '', '1995-08-11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_movie_id_foreign` (`movie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `movie_id`, `created_at`, `updated_at`) VALUES
(1, 'Some comment', 1, 34, '2019-03-23 12:25:01', '2019-03-23 12:25:01');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', NULL, NULL),
(2, 'Albania', NULL, NULL),
(3, 'Algeria', NULL, NULL),
(4, 'Andorra', NULL, NULL),
(5, 'Angola', NULL, NULL),
(6, 'Antigua & Deps', NULL, NULL),
(7, 'Argentina', NULL, NULL),
(8, 'Armenia', NULL, NULL),
(9, 'Australia', NULL, NULL),
(10, 'Austria', NULL, NULL),
(11, 'Azerbaijan', NULL, NULL),
(12, 'Bahamas', NULL, NULL),
(13, 'Bahrain', NULL, NULL),
(14, 'Bangladesh', NULL, NULL),
(15, 'Barbados', NULL, NULL),
(16, 'Belarus', NULL, NULL),
(17, 'Belgium', NULL, NULL),
(18, 'Belize', NULL, NULL),
(19, 'Benin', NULL, NULL),
(20, 'Bhutan', NULL, NULL),
(21, 'Bolivia', NULL, NULL),
(22, 'Bosnia Herzegovina', NULL, NULL),
(23, 'Botswana', NULL, NULL),
(24, 'Brazil', NULL, NULL),
(25, 'Brunei', NULL, NULL),
(26, 'Bulgaria', NULL, NULL),
(27, 'Burkina', NULL, NULL),
(28, 'Burundi', NULL, NULL),
(29, 'Cambodia', NULL, NULL),
(30, 'Cameroon', NULL, NULL),
(31, 'Canada', NULL, NULL),
(32, 'Cape Verde', NULL, NULL),
(33, 'Central African Rep', NULL, NULL),
(34, 'Chad', NULL, NULL),
(35, 'Chile', NULL, NULL),
(36, 'China', NULL, NULL),
(37, 'Colombia', NULL, NULL),
(38, 'Comoros', NULL, NULL),
(39, 'Congo', NULL, NULL),
(40, 'Congo {Democratic Rep}', NULL, NULL),
(41, 'Costa Rica', NULL, NULL),
(42, 'Croatia', NULL, NULL),
(43, 'Cuba', NULL, NULL),
(44, 'Cyprus', NULL, NULL),
(45, 'Czech Republic', NULL, NULL),
(46, 'Denmark', NULL, NULL),
(47, 'Djibouti', NULL, NULL),
(48, 'Dominica', NULL, NULL),
(49, 'Dominican Republic', NULL, NULL),
(50, 'East Timor', NULL, NULL),
(51, 'Ecuador', NULL, NULL),
(52, 'Egypt', NULL, NULL),
(53, 'El Salvador', NULL, NULL),
(54, 'Equatorial Guinea', NULL, NULL),
(55, 'Eritrea', NULL, NULL),
(56, 'Estonia', NULL, NULL),
(57, 'Ethiopia', NULL, NULL),
(58, 'Fiji', NULL, NULL),
(59, 'Finland', NULL, NULL),
(60, 'France', NULL, NULL),
(61, 'Gabon', NULL, NULL),
(62, 'Gambia', NULL, NULL),
(63, 'Georgia', NULL, NULL),
(64, 'Germany', NULL, NULL),
(65, 'Ghana', NULL, NULL),
(66, 'Greece', NULL, NULL),
(67, 'Grenada', NULL, NULL),
(68, 'Guatemala', NULL, NULL),
(69, 'Guinea', NULL, NULL),
(70, 'Guinea-Bissau', NULL, NULL),
(71, 'Guyana', NULL, NULL),
(72, 'Haiti', NULL, NULL),
(73, 'Honduras', NULL, NULL),
(74, 'Hungary', NULL, NULL),
(75, 'Iceland', NULL, NULL),
(76, 'India', NULL, NULL),
(77, 'Indonesia', NULL, NULL),
(78, 'Iran', NULL, NULL),
(79, 'Iraq', NULL, NULL),
(80, 'Ireland {Republic}', NULL, NULL),
(81, 'Israel', NULL, NULL),
(82, 'Italy', NULL, NULL),
(83, 'Ivory Coast', NULL, NULL),
(84, 'Jamaica', NULL, NULL),
(85, 'Japan', NULL, NULL),
(86, 'Jordan', NULL, NULL),
(87, 'Kazakhstan', NULL, NULL),
(88, 'Kenya', NULL, NULL),
(89, 'Kiribati', NULL, NULL),
(90, 'Korea North', NULL, NULL),
(91, 'Korea South', NULL, NULL),
(92, 'Kosovo', NULL, NULL),
(93, 'Kuwait', NULL, NULL),
(94, 'Kyrgyzstan', NULL, NULL),
(95, 'Laos', NULL, NULL),
(96, 'Latvia', NULL, NULL),
(97, 'Lebanon', NULL, NULL),
(98, 'Lesotho', NULL, NULL),
(99, 'Liberia', NULL, NULL),
(100, 'Libya', NULL, NULL),
(101, 'Liechtenstein', NULL, NULL),
(102, 'Lithuania', NULL, NULL),
(103, 'Luxembourg', NULL, NULL),
(104, 'Macedonia', NULL, NULL),
(105, 'Madagascar', NULL, NULL),
(106, 'Malawi', NULL, NULL),
(107, 'Malaysia', NULL, NULL),
(108, 'Maldives', NULL, NULL),
(109, 'Mali', NULL, NULL),
(110, 'Malta', NULL, NULL),
(111, 'Marshall Islands', NULL, NULL),
(112, 'Mauritania', NULL, NULL),
(113, 'Mauritius', NULL, NULL),
(114, 'Mexico', NULL, NULL),
(115, 'Micronesia', NULL, NULL),
(116, 'Moldova', NULL, NULL),
(117, 'Monaco', NULL, NULL),
(118, 'Mongolia', NULL, NULL),
(119, 'Montenegro', NULL, NULL),
(120, 'Morocco', NULL, NULL),
(121, 'Mozambique', NULL, NULL),
(122, 'Myanmar, {Burma}', NULL, NULL),
(123, 'Namibia', NULL, NULL),
(124, 'Nauru', NULL, NULL),
(125, 'Nepal', NULL, NULL),
(126, 'Netherlands', NULL, NULL),
(127, 'New Zealand', NULL, NULL),
(128, 'Nicaragua', NULL, NULL),
(129, 'Niger', NULL, NULL),
(130, 'Nigeria', NULL, NULL),
(131, 'Norway', NULL, NULL),
(132, 'Oman', NULL, NULL),
(133, 'Pakistan', NULL, NULL),
(134, 'Palau', NULL, NULL),
(135, 'Panama', NULL, NULL),
(136, 'Papua New Guinea', NULL, NULL),
(137, 'Paraguay', NULL, NULL),
(138, 'Peru', NULL, NULL),
(139, 'Philippines', NULL, NULL),
(140, 'Poland', NULL, NULL),
(141, 'Portugal', NULL, NULL),
(142, 'Qatar', NULL, NULL),
(143, 'Romania', NULL, NULL),
(144, 'Russian Federation', NULL, NULL),
(145, 'Rwanda', NULL, NULL),
(146, 'St Kitts & Nevis', NULL, NULL),
(147, 'St Lucia', NULL, NULL),
(148, 'Saint Vincent & the Grenadines', NULL, NULL),
(149, 'Samoa', NULL, NULL),
(150, 'San Marino', NULL, NULL),
(151, 'Sao Tome & Principe', NULL, NULL),
(152, 'Saudi Arabia', NULL, NULL),
(153, 'Senegal', NULL, NULL),
(154, 'Serbia', NULL, NULL),
(155, 'Seychelles', NULL, NULL),
(156, 'Sierra Leone', NULL, NULL),
(157, 'Singapore', NULL, NULL),
(158, 'Slovakia', NULL, NULL),
(159, 'Slovenia', NULL, NULL),
(160, 'Solomon Islands', NULL, NULL),
(161, 'Somalia', NULL, NULL),
(162, 'South Africa', NULL, NULL),
(163, 'South Sudan', NULL, NULL),
(164, 'Spain', NULL, NULL),
(165, 'Sri Lanka', NULL, NULL),
(166, 'Sudan', NULL, NULL),
(167, 'Suriname', NULL, NULL),
(168, 'Swaziland', NULL, NULL),
(169, 'Sweden', NULL, NULL),
(170, 'Switzerland', NULL, NULL),
(171, 'Syria', NULL, NULL),
(172, 'Taiwan', NULL, NULL),
(173, 'Tajikistan', NULL, NULL),
(174, 'Tanzania', NULL, NULL),
(175, 'Thailand', NULL, NULL),
(176, 'Togo', NULL, NULL),
(177, 'Tonga', NULL, NULL),
(178, 'Trinidad & Tobago', NULL, NULL),
(179, 'Tunisia', NULL, NULL),
(180, 'Turkey', NULL, NULL),
(181, 'Turkmenistan', NULL, NULL),
(182, 'Tuvalu', NULL, NULL),
(183, 'Uganda', NULL, NULL),
(184, 'Ukraine', NULL, NULL),
(185, 'United Arab Emirates', NULL, NULL),
(186, 'United Kingdom', NULL, NULL),
(187, 'United States', NULL, NULL),
(188, 'Uruguay', NULL, NULL),
(189, 'Uzbekistan', NULL, NULL),
(190, 'Vanuatu', NULL, NULL),
(191, 'Vatican City', NULL, NULL),
(192, 'Venezuela', NULL, NULL),
(193, 'Vietnam', NULL, NULL),
(194, 'Yemen', NULL, NULL),
(195, 'Zambia', NULL, NULL),
(196, 'Zimbabwe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE IF NOT EXISTS `genres` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genres_genre_name_unique` (`genre_name`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `genre_name`, `created_at`, `updated_at`) VALUES
(1, 'Action', NULL, NULL),
(2, 'Biography', NULL, NULL),
(3, 'Crime', NULL, NULL),
(4, 'Family', NULL, NULL),
(5, 'Horror', NULL, NULL),
(6, 'Romance', NULL, NULL),
(7, 'Sports', NULL, NULL),
(8, 'War', NULL, NULL),
(9, 'Adventure', NULL, NULL),
(10, 'Comedy', NULL, NULL),
(11, 'Documentary', NULL, NULL),
(12, 'Fantasy', NULL, NULL),
(13, 'Thriller', NULL, NULL),
(14, 'Animation', NULL, NULL),
(15, 'Costume', NULL, NULL),
(16, 'Drama', NULL, NULL),
(17, 'History', NULL, NULL),
(18, 'Musical', NULL, NULL),
(19, 'Psychological', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genre_to_movie`
--

DROP TABLE IF EXISTS `genre_to_movie`;
CREATE TABLE IF NOT EXISTS `genre_to_movie` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre_id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `genre_to_movie_genre_id_foreign` (`genre_id`),
  KEY `genre_to_movie_movie_id_foreign` (`movie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genre_to_movie`
--

INSERT INTO `genre_to_movie` (`id`, `genre_id`, `movie_id`, `created_at`, `updated_at`) VALUES
(1, 14, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 1, 2, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 1, 3, NULL, NULL),
(6, 2, 3, NULL, NULL),
(7, 1, 4, NULL, NULL),
(8, 2, 4, NULL, NULL),
(9, 1, 5, NULL, NULL),
(10, 2, 5, NULL, NULL),
(11, 1, 6, NULL, NULL),
(12, 2, 6, NULL, NULL),
(13, 1, 7, NULL, NULL),
(14, 2, 7, NULL, NULL),
(15, 1, 8, NULL, NULL),
(16, 2, 8, NULL, NULL),
(17, 1, 9, NULL, NULL),
(18, 2, 9, NULL, NULL),
(19, 1, 10, NULL, NULL),
(20, 2, 10, NULL, NULL),
(21, 1, 11, NULL, NULL),
(22, 2, 11, NULL, NULL),
(23, 1, 12, NULL, NULL),
(24, 2, 12, NULL, NULL),
(25, 1, 13, NULL, NULL),
(26, 2, 13, NULL, NULL),
(27, 1, 14, NULL, NULL),
(28, 2, 14, NULL, NULL),
(29, 1, 15, NULL, NULL),
(30, 2, 15, NULL, NULL),
(31, 1, 16, NULL, NULL),
(32, 2, 16, NULL, NULL),
(33, 1, 17, NULL, NULL),
(34, 2, 17, NULL, NULL),
(35, 1, 18, NULL, NULL),
(36, 2, 18, NULL, NULL),
(37, 1, 19, NULL, NULL),
(38, 2, 19, NULL, NULL),
(39, 1, 20, NULL, NULL),
(40, 2, 20, NULL, NULL),
(41, 1, 21, NULL, NULL),
(42, 2, 21, NULL, NULL),
(43, 1, 22, NULL, NULL),
(44, 2, 22, NULL, NULL),
(45, 1, 23, NULL, NULL),
(46, 2, 23, NULL, NULL),
(47, 1, 24, NULL, NULL),
(48, 2, 24, NULL, NULL),
(49, 1, 25, NULL, NULL),
(50, 2, 25, NULL, NULL),
(51, 1, 26, NULL, NULL),
(52, 2, 26, NULL, NULL),
(53, 1, 27, NULL, NULL),
(54, 2, 27, NULL, NULL),
(55, 1, 28, NULL, NULL),
(56, 2, 28, NULL, NULL),
(57, 1, 29, NULL, NULL),
(58, 2, 29, NULL, NULL),
(59, 1, 30, NULL, NULL),
(60, 2, 30, NULL, NULL),
(61, 1, 34, NULL, NULL),
(62, 10, 34, NULL, NULL),
(63, 14, 34, NULL, NULL),
(64, 1, 35, NULL, NULL),
(65, 13, 35, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_02_26_142804_create_countries_table', 1),
(4, '2018_02_27_205907_create_movies_table', 1),
(5, '2018_02_27_205950_create_genres_table', 1),
(6, '2018_02_27_211807_create_casts_table', 1),
(7, '2018_02_27_311741_create_roles_table', 1),
(8, '2018_03_03_170115_create_comments_table', 1),
(9, '2018_03_31_123805_create_ratings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trailer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_country_id_foreign` (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `year`, `description`, `poster`, `trailer`, `country_id`, `created_at`, `updated_at`) VALUES
(1, 'Bad Moms', 2016, 'When three overworked and under-appreciated moms are pushed beyond their limits, they ditch their conventional responsibilities for a jolt of long overdue freedom, fun, and comedic self-indulgence.', 'images/c8.jpg', 'iKCw-kqo3cs', 1, NULL, NULL),
(2, 'Barbershop: The Next Cut', 2015, 'As their surrounding community has taken a turn for the worse, the crew at Calvin\'s Barbershop come together to bring some much needed change to their neighborhood.', 'images/c9.jpg', 'l2vPDGStL4k', 1, NULL, NULL),
(3, 'Billy Lynn\'s Long Halftime Walk', 2015, '19-year-old Billy Lynn is brought home for a victory tour after a harrowing Iraq battle. Through flashbacks the film shows what really happened to his squad--contrasting the realities of war with America\'s perceptions.', 'images/c11.jpg', 'mUULFJ_I048', 1, NULL, NULL),
(4, 'Central Intelligence', 2016, 'After he reconnects with an awkward pal from high school through Facebook, a mild-mannered accountant is lured into the world of international espionage.', 'images/m9.jpg', 'MxEw3elSJ8M', 1, NULL, NULL),
(5, 'The Avengers', 2012, 'Earth\'s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.', 'images/avenge.jpg', 'eOrNdBpGMv8', 1, NULL, NULL),
(6, 'Iron Man', 2008, 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.', 'images/ironman.jpg', '8hYlB38asDY', 1, NULL, NULL),
(7, 'Citizen Soldier', 2016, 'CITIZEN SOLDIER is a dramatic feature film, told from the point of view of a group of Soldiers in the Oklahoma Army National Guard\'s 45th Infantry Brigade Combat Team, known since World War II as the \"Thunderbirds.\" Set in one of the most dangerous parts of Afghanistan at the height of the surge, it is a heart-pounding, heartfelt grunts\' eye-view of the war. A modern day Band of Brothers, Citizen Soldier tells the true story of a group of Soldiers and their life-changing tour of duty in Afghanistan, offering an excruciatingly personal look into modern warfare, brotherhood, and patriotism. Using real footage from multiple cameras, including helmet cams, these Citizen Soldiers give the audience an intimate view into the chaos and horrors of combat and, in the process, display their bravery and valor under the most hellish of conditions.', 'images/m13.jpg', '-d-BcfRGl7c', 1, NULL, NULL),
(8, 'Dirty Grandpa', 2015, 'Right before his wedding, an uptight guy is tricked into driving his grandfather, a lecherous former Army Lieutenant Colonel, to Florida for Spring Break.', 'images/c2.jpg', 'aZSzMIFZT7Q', 1, NULL, NULL),
(9, 'The Room', 2003, 'Johnny is a successful banker who lives happily in a San Francisco townhouse with his fiancée, Lisa. One day, inexplicably, she gets bored with him and decides to seduce his best friend, Mark. From there, nothing will be the same again.', 'images/room.jpg', 'Z9cB0TjfIkM', 1, NULL, NULL),
(10, 'The Interview', 2014, 'Dave Skylark and his producer Aaron Rapoport run the celebrity tabloid show \"SkylarkTonight\". When they land an interview with a surprise fan, North Korean dictator Kim Jong-un, they are recruited by the CIA to turn their trip to Pyongyang into an assassination mission.', 'images/interview.jpg', 'frsvWVEHowg', 1, NULL, NULL),
(11, 'Don\'t Think Twice', 2016, 'When a member of a popular New York City improv troupe gets a huge break, the rest of the group - all best friends - start to realize that not everyone is going to make it after all.', 'images/m10.jpg', '9RFTpObS95U', 1, NULL, NULL),
(12, 'God’s Compass', 2016, 'On the night Suzanne Waters celebrates her retirement, she is faced with a series of crisis she could not have imagined.', 'images/m15.jpg', 'qLtD4orE2r4', 1, NULL, NULL),
(13, '21 Jump Street', 2012, 'A pair of underachieving cops are sent back to a local high school to blend in and bring down a synthetic drug ring.', 'images/21jump.jpg', 'RLoKtb4c4W0', 1, NULL, NULL),
(14, '22 Jump Street', 2014, 'After making their way through high school (twice), big changes are in store for officers Schmidt and Jenko when they go deep undercover at a local college.', 'images/22jump.jpg', 'qP755JkDxyM', 1, NULL, NULL),
(15, 'Greater', 2016, 'The story of Brandon Burlsworth, possibly the greatest walk-on in the history of college football.', 'images/m12.jpg', 'v0Ow6lhvPNk', 1, NULL, NULL),
(16, 'Ice Age: Collision Course', 2016, 'Manny, Diego, and Sid join up with Buck to fend off a meteor strike that would destroy the world.', 'images/c6.jpg', 'Ohq6NmKMja8', 1, NULL, NULL),
(17, 'Keanu', 2016, 'When an L.A. drug kingpin\'s kitten unexpectedly enters the life of two cousins, they will have to go through gangs, hitmen and drug dealers who claim him in order to get him back.', 'images/c5.jpg', 'KjEusWO6VPg', 1, NULL, NULL),
(18, 'Django Unchained', 2012, 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.', 'images/django_unchained.jpg', 'eUdM9vrCbow', 1, NULL, NULL),
(19, 'The Hateful Eight', 2015, 'In the dead of a Wyoming winter, a bounty hunter and his prisoner find shelter in a cabin currently inhabited by a collection of nefarious characters.', 'images/hateful_eight.jpg', 'gnRbXn4-Yis', 1, NULL, NULL),
(20, 'Guardians Of The Galaxy', 2014, 'A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the univers', 'images/guardians_of_the_galaxy.jpg', 'd96cjJhvlMA', 1, NULL, NULL),
(21, 'Mike and Dave Need Wedding Dates ', 2016, 'Two hard-partying brothers place an online ad to find the perfect dates for their sister\'s Hawaiian wedding. Hoping for a wild getaway, the boys instead find themselves out-hustled by an uncontrollable duo.', 'images/c7.jpg', '33MtR-g4Jcg', 1, NULL, NULL),
(22, 'Pulp Fiction', 1994, 'The lives of two mob hitmen, a boxer, a gangster\'s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'images/pulp_fiction.jpg', 's7EdQ4FqbhY', 1, NULL, NULL),
(23, 'Nine Lives', 2016, 'A stuffy businessman finds himself trapped inside the body of his family\'s cat.', 'images/c10.jpg', '_jHA97HzhxE', 1, NULL, NULL),
(24, 'The Apostle Peter: Redemption', 2016, 'Tormented by his denial of Christ, Peter spent his life attempting to atone for his failures. Now as he faces certain death at the hand of Nero, will he falter again, his weakness betray him or will he rise up triumphant in his final moment?', 'images/m17.jpg', '43aUvmQw55Q', 1, NULL, NULL),
(25, 'Ride Along 2', 2016, 'As his wedding day approaches, Ben heads to Miami with his soon-to-be brother-in-law James to bring down a drug dealer who\'s supplying the dealers of Atlanta with product.', 'images/c3.jpg', '5klp6rkHIks', 1, NULL, NULL),
(26, 'Straight Outta Compton', 2015, 'The group NWA emerges from the mean streets of Compton in Los Angeles, California, in the mid-1980s and revolutionizes Hip Hop culture with their music and tales about life in the hood.', 'images/straight_outta_compton.jpg', 'rsbWEF1Sju0', 1, NULL, NULL),
(27, 'Friday', 1995, 'Two homies, Smokey and Craig, smoke a dope dealer\'s weed and try to figure a way to get the $200 they owe to the dealer by 10 p.m. that same night.', 'images/friday.jpg', 'nH1Ulp4PBtA', 1, NULL, NULL),
(28, 'The BFG', 2016, 'An orphan little girl befriends a benevolent giant who takes her to Giant Country, where they attempt to stop the man-eating giants that are invading the human world.', 'images/m8.jpg', 'GZ0Bey4YUGI', 1, NULL, NULL),
(29, 'The Boss', 2016, 'A titan of industry is sent to prison after she\'s caught insider trading. When she emerges ready to rebrand herself as America\'s latest sweetheart, not everyone she screwed over is so quick to forgive and forget.', 'images/c4.jpg', 'yakeigyf0vc', 1, NULL, NULL),
(30, 'War on Everyone', 2016, 'Two corrupt cops set out to blackmail and frame every criminal unfortunate enough to cross their path. Events, however, are complicated by the arrival of someone who appears to be even more dangerous than they are.', 'images/c12.jpg', 'XQ2L1heHHnk', 1, NULL, NULL),
(31, 'X-Men', 2000, 'Two mutants come to a private academy for their kind whose resident superhero team must oppose a terrorist organization with similar powers.', 'images/xmen.jpg', 'Iy5R5_T243w', 1, NULL, NULL),
(32, 'Logan', 2017, 'In the near future, a weary Logan cares for an ailing Professor X, somewhere on the Mexican border. However, Logan\'s attempts to hide from the world, and his legacy, are upended when a young mutant arrives, pursued by dark forces.', 'images/logan.jpg', 'Div0iP65aZo', 1, NULL, NULL),
(33, 'X-Men: Apocalypse', 2016, 'After the re-emergence of the world\'s first mutant, world-destroyer Apocalypse, the X-Men must unite to defeat his extinction level plan.', 'images/m11.jpg', 'COvnHv42T-A', 1, NULL, NULL),
(34, 'Alita: Battle Angel', 2019, 'A deactivated female cyborg is revived, but cannot remember anything of her past life and goes on a quest to find out who she is.', 'images/MV5BNzVhMjcxYjYtOTVhOS00MzQ1LWFiNTAtZmY2ZmJjNjIxMjllXkEyXkFqcGdeQXVyNTc5OTMwOTQ@._V1_.jpg', 'GPr2uDKOGT4', 187, '2019-03-23 12:09:09', '2019-03-23 12:09:09'),
(35, 'John Wick: Chapter 3', 2019, 'Super-Assassin John Wick is on the run after killing a member of the international assassin\'s guild, and with a $14 million price tag on his head - he is the target of hit men and women everywhere.', 'images/MV5BMDg2YzI0ODctYjliMy00NTU0LTkxODYtYTNkNjQwMzVmOTcxXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SY1000_CR0,0,648,1000_AL_.jpg', 'P9RVh8LAwdI', 186, '2019-03-23 17:45:28', '2019-03-23 17:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating_value` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ratings_user_id_foreign` (`user_id`),
  KEY `ratings_movie_id_foreign` (`movie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `rating_value`, `user_id`, `movie_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 1, NULL, '2019-03-23 15:34:04'),
(2, 4, 2, 2, '2019-03-22 12:00:26', '2019-03-24 13:02:24'),
(3, 3, 2, 3, '2019-03-22 12:00:28', '2019-03-22 12:00:28'),
(4, 4, 2, 1, '2019-03-22 13:43:09', '2019-03-24 13:02:22'),
(5, 5, 1, 34, '2019-03-23 12:09:28', '2019-03-23 12:09:28'),
(6, 4, 1, 19, '2019-03-23 13:57:51', '2019-03-23 13:57:51'),
(7, 3, 1, 14, '2019-03-23 13:57:53', '2019-03-23 13:57:53'),
(8, 4, 1, 8, '2019-03-23 13:57:56', '2019-03-23 13:57:56'),
(9, 4, 1, 4, '2019-03-23 13:57:59', '2019-03-23 13:58:01'),
(10, 5, 1, 5, '2019-03-23 13:58:00', '2019-03-23 13:58:00'),
(11, 4, 1, 11, '2019-03-23 13:58:03', '2019-03-23 13:58:03'),
(12, 2, 1, 10, '2019-03-23 13:58:06', '2019-03-23 13:58:06'),
(13, 5, 1, 6, '2019-03-23 13:58:07', '2019-03-23 13:58:07'),
(14, 3, 1, 7, '2019-03-23 13:58:10', '2019-03-23 13:58:10'),
(15, 3, 1, 12, '2019-03-23 13:58:13', '2019-03-23 13:58:13'),
(16, 3, 1, 13, '2019-03-23 13:58:15', '2019-03-23 13:58:15'),
(17, 3, 1, 35, '2019-03-23 19:18:23', '2019-03-23 19:18:23');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` enum('Actor','Director','Crew') COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `movie_id` int(10) UNSIGNED NOT NULL,
  `cast_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_movie_id_foreign` (`movie_id`),
  KEY `roles_cast_id_foreign` (`cast_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `credit`, `movie_id`, `cast_id`, `created_at`, `updated_at`) VALUES
(1, 'Crew', '', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('USER','ADMIN') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile_picture`, `user_type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@laravel.com', '$2y$10$kgpRBwZZad.6Ws7sFmfuh.4tmCzAtuYvK6N06SylqbhtsW5o9/C6q', NULL, 'ADMIN', 'X3KiSQqksxaxbLk2bnw2Q2HGb2TnwExpIiU7YddtzMWbVjeFaJKzAYUW0VsL', NULL, NULL),
(2, 'test', 'test@tester.com', '$2y$10$2jZDAv83LiU1VAKqdEynJ.YFfLrsaQgcKicauc0YPbbvhWoc8QvJ2', NULL, 'USER', '6CoZOsJspVEVzGjM4JtWFMbRXaGMm6L9Jg1UYLBkgJ2uFwgxnNOrBxv9E52r', '2019-03-22 12:00:17', '2019-03-22 12:00:17'),
(3, 'admin', 'admin@admin.com', '$2y$10$FCupoFxGC9epLFE5.d5zfOYLsNB0WcRDLZG1Ff77LbEgrfBmteTZ6', NULL, 'ADMIN', 'xbnKI8BGcd5Nr5hkq9puXPys3W5iGNYcl60Lmiy0zu7qBdhJDOZmMijGgHPb', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
