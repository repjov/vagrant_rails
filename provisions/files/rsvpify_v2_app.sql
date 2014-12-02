-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 19, 2014 at 08:42 AM
-- Server version: 5.1.73-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rsvpify_v2_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `appetizers`
--

CREATE TABLE IF NOT EXISTS `appetizers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appetizers_event_id_foreign` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `appetizers`
--

INSERT INTO `appetizers` (`id`, `event_id`, `value`) VALUES
(1, 4, 'Soup'),
(2, 4, 'Salad'),
(3, 4, 'Other'),
(4, 1, 'App 1'),
(5, 1, 'App 2'),
(6, 1, 'App 3'),
(7, 8, 'gjhg'),
(8, 8, 'kllklklk'),
(9, 8, 'mkjkj'),
(10, 7, 'French Onion Soup'),
(11, 7, 'Beef Skewers'),
(12, 7, 'm,m');

-- --------------------------------------------------------

--
-- Table structure for table `custom_questions`
--

CREATE TABLE IF NOT EXISTS `custom_questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `type` enum('dropdown','multiple_choice','textbox','input','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_individual` tinyint(1) NOT NULL,
  `for_attendees_only` tinyint(1) NOT NULL,
  `order_position` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_questions_event_id_foreign` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `custom_questions`
--

INSERT INTO `custom_questions` (`id`, `event_id`, `type`, `question`, `is_required`, `is_individual`, `for_attendees_only`, `order_position`) VALUES
(1, 4, 'dropdown', 'I have a question...', 1, 1, 1, 0),
(2, 4, 'input', 'What hotel are you staying at?', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_questions_answers`
--

CREATE TABLE IF NOT EXISTS `custom_questions_answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_question_id` int(10) unsigned NOT NULL,
  `questionable_id` int(10) unsigned NOT NULL,
  `questionable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_questions_answers_custom_question_id_foreign` (`custom_question_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `custom_questions_options`
--

CREATE TABLE IF NOT EXISTS `custom_questions_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `custom_question_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custom_questions_options_custom_question_id_foreign` (`custom_question_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `custom_questions_options`
--

INSERT INTO `custom_questions_options` (`id`, `custom_question_id`, `value`) VALUES
(1, 1, 'Yes'),
(2, 1, 'No'),
(3, 1, 'Maybe');

-- --------------------------------------------------------

--
-- Table structure for table `email_confirmations`
--

CREATE TABLE IF NOT EXISTS `email_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `email_confirmations_token_index` (`token`),
  KEY `email_confirmations_user_id_foreign` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `email_confirmations`
--

INSERT INTO `email_confirmations` (`id`, `token`, `user_id`, `email`, `created_at`) VALUES
(1, 'GGsfby3GHwlRi8f9IOVQJBID1BqDVlNinuDyitDH', 1, 'music.sanil@gmail.com', '2014-09-19 10:25:02'),
(2, 'T4GOVmVK27WSb5qjkNYId2GaFNByzh5oLzivJhmc', 2, 'ari@rsvpify.com', '2014-09-19 10:45:12'),
(3, 'SGOgDl9z7ngrYmbm4NjZumqrF4Z23bjmAkGde0zA', 2, 'ari2@rsvpify.com', '2014-09-19 11:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `entrees`
--

CREATE TABLE IF NOT EXISTS `entrees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entrees_event_id_foreign` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `entrees`
--

INSERT INTO `entrees` (`id`, `event_id`, `value`) VALUES
(1, 4, 'Steak'),
(2, 4, 'Salmon'),
(3, 4, 'Salad'),
(4, 4, 'Tuna'),
(5, 4, 'MahiMahi'),
(6, 1, 'Entree 1'),
(7, 1, 'Entree 2'),
(8, 1, 'Entree 3'),
(9, 8, 'mnkjhk'),
(10, 8, 'kkjlkl'),
(11, 7, 'Filet Mignon'),
(12, 7, 'Pasta');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('wedding','birthday','baby_shower','bar_bat_mitzwah','corporate','other') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('closed','open') COLLATE utf8_unicode_ci NOT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subdomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guests_since_start` int(10) unsigned NOT NULL,
  `date_of_event` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `events_subdomain_index` (`subdomain`),
  KEY `events_user_id_foreign` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `type`, `status`, `heading`, `subdomain`, `guests_since_start`, `date_of_event`, `created_at`, `updated_at`) VALUES
(1, 1, 'birthday', 'closed', 'Readonly', 'readonly', 0, '2014-12-12 00:00:00', '2014-09-19 15:27:10', '2014-09-19 15:27:10'),
(2, 1, 'wedding', 'closed', 'Admin', 'admin', 0, '2014-12-12 00:00:00', '2014-09-19 15:27:30', '2014-09-19 15:27:30'),
(3, 1, 'other', 'closed', 'Third', 'third', 0, '2014-12-12 00:00:00', '2014-09-19 15:46:03', '2014-09-19 15:46:03'),
(6, 1, 'other', 'closed', 'Other Event', 'otherevent', 0, '2014-12-19 00:00:00', '2014-10-02 18:31:13', '2014-10-02 18:31:13'),
(7, 2, 'wedding', 'closed', 'John and Jane''s Wedding', 'johnandjane', 0, '2014-10-31 00:00:00', '2014-10-02 20:02:57', '2014-10-25 15:05:26'),
(8, 2, 'wedding', 'closed', 'This is a Test of How Long a', 'test263756723', 0, '2015-02-28 00:00:00', '2014-10-13 03:14:27', '2014-10-21 01:54:17'),
(9, 2, 'wedding', 'closed', 'Test', 'gjhghjgjkhkj', 0, '2014-10-31 00:00:00', '2014-10-25 20:15:35', '2014-10-25 20:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `event_domains`
--

CREATE TABLE IF NOT EXISTS `event_domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `event_domains_event_id_foreign` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_links`
--

CREATE TABLE IF NOT EXISTS `event_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_links_event_id_foreign` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `event_links`
--

INSERT INTO `event_links` (`id`, `event_id`, `link`, `title`) VALUES
(1, 6, 'http://test.com', 'Test Link'),
(2, 7, 'http://www.google.com', 'Registry');

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` int(10) unsigned NOT NULL,
  `title` enum('ms','mrs','mr','dr','miss') COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accepted` tinyint(1) NOT NULL,
  `entree` int(10) unsigned NOT NULL,
  `table_id` int(10) unsigned NOT NULL,
  `table_position` int(10) unsigned NOT NULL,
  `guest_list_guest_id` int(10) unsigned NOT NULL,
  `guest_list_is_plus_one` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guests_table_id_index` (`table_id`),
  KEY `guests_guest_list_guest_id_index` (`guest_list_guest_id`),
  KEY `guests_submission_id_foreign` (`submission_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=785210 ;

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`id`, `submission_id`, `title`, `first_name`, `last_name`, `accepted`, `entree`, `table_id`, `table_position`, `guest_list_guest_id`, `guest_list_is_plus_one`) VALUES
(570771, 307341, '', 'Tilak R.', 'Gupta', 1, 0, 0, 0, 79535, 0),
(570772, 307341, '', 'Rekha', 'Gupta', 1, 0, 0, 0, 79536, 0),
(570773, 307341, '', 'Rita', 'Gupta', 1, 0, 0, 0, 79537, 0),
(576046, 310262, '', 'Adrian Felix', 'Gonzalez', 1, 0, 0, 0, 79481, 0),
(576047, 310262, '', 'Liz ', 'Vazquez', 1, 0, 0, 0, 79481, 1),
(612945, 330255, '', 'Gumeet Kaur', 'Jamarai', 1, 0, 0, 0, 174471, 0),
(613091, 330335, '', 'Norman', 'Olsen', 1, 0, 0, 0, 79636, 0),
(613092, 330335, '', 'Helen', 'Olsen', 1, 0, 0, 0, 79637, 0),
(619082, 333652, '', 'Nilesh', 'Patel', 1, 0, 0, 0, 174210, 0),
(619083, 333652, '', 'Hamali', 'Patel', 1, 0, 0, 0, 174211, 0),
(629514, 339264, '', 'Dr. Harbans Singh', 'Multani', 1, 0, 0, 0, 79461, 0),
(629515, 339264, '', 'Renu', 'Multani', 1, 0, 0, 0, 79462, 0),
(646415, 348477, '', 'Jake', 'Lee', 0, 0, 0, 0, 79484, 0),
(646416, 348477, '', 'Mia', 'Lee', 0, 0, 0, 0, 79485, 0),
(655897, 353386, '', 'Muninder Singh', 'Virk', 1, 0, 0, 0, 174229, 0),
(655898, 353386, '', 'Jaswinder Kaur', 'Virk', 1, 0, 0, 0, 174230, 0),
(672240, 362450, '', 'Johhny', 'Lira', 0, 0, 0, 0, 79745, 0),
(672241, 362450, '', 'Nicole', 'Agundez-Lira', 0, 0, 0, 0, 79746, 0),
(679847, 366541, '', 'Sanjeev Singh', 'Kohli', 1, 0, 0, 0, 79467, 0),
(679848, 366541, '', 'Arveen Kaur', 'Kohli', 1, 0, 0, 0, 79468, 0),
(683884, 368769, '', 'Harbhajan Singh', 'Gill', 1, 0, 0, 0, 79497, 0),
(683885, 368769, '', 'Rajinder Kaur', 'Gill', 1, 0, 0, 0, 79498, 0),
(688918, 371502, '', 'Kulwant Singh', 'Gill', 1, 0, 0, 0, 79499, 0),
(688919, 371502, '', 'Gurbinder Kaur', 'Gill', 1, 0, 0, 0, 79500, 0),
(688920, 371502, '', 'Kiran Kaur', 'Gill', 1, 0, 0, 0, 79501, 0),
(691876, 373120, '', 'Scott', 'Moore', 0, 0, 0, 0, 174295, 0),
(691877, 373120, '', 'Gina', 'Moore', 0, 0, 0, 0, 174296, 0),
(696347, 375647, '', 'Harkewal', 'Singh', 1, 0, 0, 0, 79515, 0),
(696348, 375647, '', 'Inderjeet', 'Kaur', 1, 0, 0, 0, 79516, 0),
(699202, 377306, '', 'Rajinder Singh', 'Gydee', 1, 0, 0, 0, 174039, 0),
(699203, 377306, '', 'Jaspal Kaur', 'Gydee', 1, 0, 0, 0, 174040, 0),
(703733, 379797, '', 'Upminder Singh', 'Sandhu', 1, 0, 0, 0, 79453, 0),
(703734, 379797, '', 'Aman Kaur', 'Sandhu', 1, 0, 0, 0, 79454, 0),
(706068, 381016, '', 'Charanjit', 'Singh', 1, 0, 0, 0, 79465, 0),
(706069, 381016, '', 'Maninder', 'Kaur', 1, 0, 0, 0, 79466, 0),
(708282, 382210, '', 'Dr. Charanpreet Singh', 'Boparai', 1, 0, 0, 0, 174467, 0),
(708283, 382210, '', 'Rimpi Kaur', 'Boparai', 1, 0, 0, 0, 174468, 0),
(708284, 382210, '', 'Robby', 'Boparai', 1, 0, 0, 0, 174469, 0),
(708285, 382210, '', 'Asees Kaur', 'Boparai', 1, 0, 0, 0, 174470, 0),
(709898, 383096, '', 'Lakha Singh', 'Walha', 1, 0, 0, 0, 174456, 0),
(709899, 383096, '', 'Gurpreet Kaur', 'Walha', 1, 0, 0, 0, 174457, 0),
(709900, 383096, '', 'Noneet Kaur', 'Walha', 1, 0, 0, 0, 174458, 0),
(722157, 389775, '', 'Naresh L.', 'Vermani', 1, 0, 0, 0, 79444, 0),
(722158, 389775, '', 'Lata', 'Vermani', 1, 0, 0, 0, 79445, 0),
(722159, 389775, '', 'Nitin', 'Vermani', 1, 0, 0, 0, 79446, 0),
(722160, 389775, '', 'Rachna', 'Vermani', 1, 0, 0, 0, 79447, 0),
(727025, 392334, '', 'Naresh N.', 'Bakshi', 1, 0, 0, 0, 79469, 0),
(727026, 392334, '', 'Lalita K.', 'Bakshi', 1, 0, 0, 0, 79470, 0),
(733655, 395896, '', 'Dr. Jatinder Singh', 'Sandhu', 1, 0, 0, 0, 79471, 0),
(733656, 395896, '', 'Balwinder Kaur', 'Sandhu', 1, 0, 0, 0, 79472, 0),
(733657, 395896, '', 'Jasdeep', 'Sandhu', 1, 0, 0, 0, 79473, 0),
(733658, 395896, '', 'Jasmine', 'Sandhu', 1, 0, 0, 0, 79474, 0),
(734652, 396385, '', 'Ana', 'Valdez', 1, 0, 0, 0, 79477, 0),
(734866, 396492, '', 'Manjit', 'Singh', 0, 0, 0, 0, 79448, 0),
(734867, 396492, '', 'Ramanjit Kaur', 'Sibia', 1, 0, 0, 0, 79449, 0),
(734932, 396532, '', 'Ranjit Singh', 'Randhawa', 1, 0, 0, 0, 79344, 0),
(734933, 396532, '', 'Rosie Kaur', 'Randhawa', 1, 0, 0, 0, 79345, 0),
(734934, 396532, '', 'Bibi', 'Kaur', 1, 0, 0, 0, 79346, 0),
(734935, 396532, '', 'Sabtaj Singh', 'Randhawa', 1, 0, 0, 0, 79347, 0),
(735152, 396647, '', 'Maneka', 'Shewa', 1, 0, 0, 0, 79480, 0),
(735162, 396653, '', 'Andres', 'Lira', 1, 0, 0, 0, 174235, 0),
(735730, 396961, '', 'Sucha Singh', 'Sangha', 1, 0, 0, 0, 79385, 0),
(735731, 396961, '', 'Inderjit Singh', 'Sangha', 1, 0, 0, 0, 79386, 0),
(735797, 396997, '', 'Pawan K.', 'Bagga', 1, 0, 0, 0, 223813, 0),
(735798, 396997, '', 'Susnita', 'Bagga', 1, 0, 0, 0, 223814, 0),
(735799, 396997, '', 'Pitha Ji.', 'Bagga', 0, 0, 0, 0, 223815, 0),
(735800, 396997, '', 'Rahul', 'Bagga', 0, 0, 0, 0, 223816, 0),
(735801, 396997, '', 'Kunal', 'Bagga', 0, 0, 0, 0, 223817, 0),
(735808, 397001, '', 'Barbara B.', 'Miller', 1, 0, 0, 0, 79588, 0),
(735809, 397002, '', 'Balkar Singh', 'Chhina', 1, 0, 0, 0, 79575, 0),
(735810, 397002, '', 'Surinder', 'Kaur', 1, 0, 0, 0, 79576, 0),
(735811, 397002, '', 'Jobanpreet Singh', 'Chhina', 1, 0, 0, 0, 79577, 0),
(735812, 397002, '', 'Mandeep', 'Sandhu', 1, 0, 0, 0, 79578, 0),
(735813, 397002, '', 'Deep', 'Riar', 1, 0, 0, 0, 79579, 0),
(736126, 397173, '', 'Satinder Singh', 'Chandi', 1, 0, 0, 0, 175514, 0),
(736127, 397173, '', 'Ninder Kaur', 'Chandi', 1, 0, 0, 0, 175515, 0),
(736300, 397270, '', 'Gurpreet Singh', 'Bindra', 1, 0, 0, 0, 79459, 0),
(736301, 397270, '', 'Dr. Ravneet Kaur', 'Bindra', 1, 0, 0, 0, 79460, 0),
(736919, 397596, '', 'Avtar Singh', 'Takhar', 1, 0, 0, 0, 174231, 0),
(736920, 397596, '', 'Sarbjit Kaur', 'Takhar', 1, 0, 0, 0, 174232, 0),
(737050, 397662, '', 'Satwinder Singh', 'Grewal', 1, 0, 0, 0, 79450, 0),
(737051, 397662, '', 'Satinder Kaur', 'Grewal', 1, 0, 0, 0, 79451, 0),
(737052, 397662, '', 'Bibi', 'Grewal', 1, 0, 0, 0, 79452, 0),
(737426, 397877, '', 'Bhai Jaswant', 'Singh', 1, 0, 0, 0, 79582, 0),
(737427, 397877, '', 'Rani', 'Kaur', 1, 0, 0, 0, 79583, 0),
(737428, 397877, '', 'Rupinder', 'Kaur', 1, 0, 0, 0, 79584, 0),
(740246, 399401, '', 'Ryan F.', 'Delarosa', 0, 0, 0, 0, 79475, 0),
(740247, 399401, '', 'Wendy', 'Gomez', 0, 0, 0, 0, 79476, 0),
(740819, 399723, '', 'Paramjit', 'Singh', 1, 0, 0, 0, 79493, 0),
(740820, 399723, '', 'Shinder', 'Kaur', 1, 0, 0, 0, 79494, 0),
(750439, 404977, '', 'Satbr Singh', 'Tung', 1, 0, 0, 0, 79542, 0),
(750440, 404977, '', 'Harbrinderjit Kaur', 'Tung', 1, 0, 0, 0, 79543, 0),
(752515, 406117, '', 'Dr. Satpal Singh', 'Multani', 1, 0, 0, 0, 79463, 0),
(752516, 406117, '', 'Baljinder Kaur', 'Multani', 1, 0, 0, 0, 79464, 0),
(754525, 407269, '', 'Jaswant Singh', 'Dhanju', 1, 0, 0, 0, 175510, 0),
(754526, 407269, '', 'Bakshish Kaur', 'Dhanju', 1, 0, 0, 0, 175511, 0),
(754527, 407269, '', 'Akamjot Singh', 'Dhanju', 1, 0, 0, 0, 175512, 0),
(754528, 407269, '', 'Amitaj Singh', 'Dhanju', 1, 0, 0, 0, 175513, 0),
(761192, 410919, '', 'Parkash Kaur', 'Rai', 1, 0, 0, 0, 79514, 0),
(761200, 410924, '', 'Nirmal', 'Kaur', 1, 0, 0, 0, 79276, 0),
(761201, 410924, '', 'Arturo', 'Lira', 1, 0, 0, 0, 79277, 0),
(761202, 410924, '', 'Manpreet', 'Kaur', 1, 0, 0, 0, 79278, 0),
(761203, 410924, '', 'Sukhchain', 'Kaur', 1, 0, 0, 0, 79279, 0),
(761211, 410928, '', 'Avtar Singh', 'Nijjar', 1, 0, 0, 0, 79379, 0),
(761212, 410928, '', 'Baljit Kaur', 'Nijjar', 1, 0, 0, 0, 79380, 0),
(761282, 410968, '', 'Dharamjit Singh', 'Khehra', 0, 0, 0, 0, 232042, 0),
(761283, 410968, '', 'Sukhwinder Kaur', 'Khehra', 1, 0, 0, 0, 232043, 0),
(761284, 410968, '', 'Sukhdeep Singh', 'Khehra', 1, 0, 0, 0, 232044, 0),
(761285, 410968, '', 'Kuljit', 'Dhaliwal', 1, 0, 0, 0, 232044, 1),
(761331, 410994, '', 'Harjit', 'Singh', 1, 0, 0, 0, 232045, 0),
(761332, 410994, '', 'Satinderpal', 'Kaur', 1, 0, 0, 0, 232046, 0),
(761333, 410994, '', 'Maninder', 'Kaur', 1, 0, 0, 0, 232047, 0),
(761334, 410994, '', 'Rajitmeet', 'Singh', 1, 0, 0, 0, 232048, 0),
(761362, 411012, '', 'Karnal Singh', 'Kalar', 1, 0, 0, 0, 79377, 0),
(761363, 411012, '', 'Rajinder', 'Singh', 1, 0, 0, 0, 79377, 1),
(761364, 411012, '', 'Mohinder Kaur', 'Kalar', 1, 0, 0, 0, 79378, 0),
(761371, 411015, '', 'Jagdish Singh', 'Chawla', 1, 0, 0, 0, 79442, 0),
(761372, 411015, '', 'Jasbir Kaur', 'Chawla', 1, 0, 0, 0, 79443, 0),
(761388, 411026, '', 'Ajit Kaur', 'Joneja', 1, 0, 0, 0, 232049, 0),
(761389, 411026, '', 'Guest', 'Joneja', 0, 0, 0, 0, 232049, 1),
(761390, 411026, '', 'Surinder', 'Kaur', 0, 0, 0, 0, 232050, 0),
(761396, 411031, '', 'Anil K.', 'Malhi', 1, 0, 0, 0, 79495, 0),
(761397, 411031, '', 'Santosh D.', 'Malhi', 1, 0, 0, 0, 79496, 0),
(761403, 411036, '', 'Amrik', 'Singh', 0, 0, 0, 0, 79502, 0),
(761404, 411036, '', 'Parmjit', 'Kaur', 0, 0, 0, 0, 79503, 0),
(761406, 411038, '', 'Saminder', 'Singh', 1, 0, 0, 0, 79504, 0),
(761407, 411038, '', 'Rupinder', 'Kaur', 1, 0, 0, 0, 79505, 0),
(761464, 411071, '', 'Kartar', 'Singh', 0, 0, 0, 0, 232056, 0),
(761465, 411071, '', 'Sarbjit', 'Kaur', 1, 0, 0, 0, 232057, 0),
(761466, 411071, '', 'Manmit Kaur', 'Singh', 1, 0, 0, 0, 232058, 0),
(761467, 411071, '', 'Aneeta Kaur', 'Singh', 1, 0, 0, 0, 232059, 0),
(761468, 411071, '', 'Sandeep', 'Singh', 1, 0, 0, 0, 232060, 0),
(761469, 411071, '', 'Tej', 'Kaur', 0, 0, 0, 0, 232061, 0),
(761529, 411109, '', 'Harkirat SIngh', 'Sekhon', 1, 0, 0, 0, 79604, 0),
(761530, 411109, '', 'Baljinder Kaur', 'Sekhon', 1, 0, 0, 0, 79605, 0),
(761545, 411122, '', 'Tahir', 'Ali', 1, 0, 0, 0, 79613, 0),
(761546, 411122, '', 'Khalida', 'Khanum', 1, 0, 0, 0, 79614, 0),
(761547, 411122, '', 'Sabrina', 'Ali', 1, 0, 0, 0, 79615, 0),
(761548, 411122, '', 'Sameer', 'Ali', 1, 0, 0, 0, 79616, 0),
(761561, 411132, '', 'Brinderjit Singh', 'Dhillon', 1, 0, 0, 0, 79626, 0),
(761562, 411132, '', 'Jupinder Kaur', 'Dhillon', 1, 0, 0, 0, 79627, 0),
(761578, 411143, '', 'Dr. Abid', 'Hussain', 0, 0, 0, 0, 173980, 0),
(761579, 411143, '', 'Nasreen', 'Hussain', 0, 0, 0, 0, 173981, 0),
(762186, 411475, '', 'Dr.', 'Qazi', 1, 0, 0, 0, 173978, 0),
(762187, 411475, '', 'Dr. Nawazish', 'Qazi', 1, 0, 0, 0, 173979, 0),
(762196, 411481, '', 'Kuldip Singh', 'Multani', 1, 0, 0, 0, 173982, 0),
(762197, 411481, '', 'Amarjeet Kaur', 'Multani', 1, 0, 0, 0, 173983, 0),
(762245, 411506, '', 'Rajinder Singh', 'Paul', 1, 0, 0, 0, 173984, 0),
(762246, 411506, '', 'Baljeet Kaur', 'Paul', 1, 0, 0, 0, 173985, 0),
(762269, 411521, '', 'Dr.', 'Ahmad', 1, 0, 0, 0, 173976, 0),
(762270, 411521, '', 'Shireen', 'Ahmad', 1, 0, 0, 0, 173977, 0),
(762277, 411526, '', 'Parminder Singh', 'Dhillon', 1, 0, 0, 0, 79290, 0),
(762278, 411526, '', 'Samraj Kaur', 'Dhillon', 1, 0, 0, 0, 79291, 0),
(762279, 411526, '', 'Jasleen Kaur', 'Dhillon', 1, 0, 0, 0, 79292, 0),
(762280, 411526, '', 'Amol Kaur', 'Dhillon', 1, 0, 0, 0, 79293, 0),
(762281, 411526, '', 'Sahib Singh', 'Dhillon', 1, 0, 0, 0, 79294, 0),
(762629, 411704, '', 'Sarbjit SIngh', 'Sangha', 0, 0, 0, 0, 174297, 0),
(762630, 411704, '', 'Kulvinder Kaur', 'Sangha', 0, 0, 0, 0, 174298, 0),
(762632, 411706, '', 'Gurinderbir Singh', 'Lakhanpal', 0, 0, 0, 0, 174139, 0),
(762633, 411706, '', 'Tejpal Kaur', 'Lakhanpal', 0, 0, 0, 0, 174140, 0),
(762634, 411707, '', 'Yudvinder Singh', 'Kang', 1, 0, 0, 0, 174144, 0),
(762635, 411707, '', 'Kamalpreet Kaur', 'Kang', 1, 0, 0, 0, 174145, 0),
(764742, 412851, '', 'Surinder Singh', 'Kang', 1, 0, 0, 0, 79551, 0),
(764743, 412851, '', 'Gurprit Kaur', 'Kang', 1, 0, 0, 0, 79552, 0),
(764744, 412851, '', 'Chacci', 'Kaur', 1, 0, 0, 0, 79553, 0),
(764745, 412851, '', 'Amirt Singh', 'Kang', 1, 0, 0, 0, 79554, 0),
(764759, 412860, '', 'Harjinder Singh', 'Sandhu', 1, 0, 0, 0, 174201, 0),
(764760, 412860, '', 'Varinder Kaur', 'Sandhu', 1, 0, 0, 0, 174202, 0),
(764761, 412860, '', 'Harnoor Kaur', 'Sandhu', 0, 0, 0, 0, 174203, 0),
(764762, 412860, '', 'Gurnoor Singh', 'Sandhu', 0, 0, 0, 0, 174204, 0),
(764768, 412864, '', 'Jaswinder Singh', 'Ghotra', 1, 0, 0, 0, 174198, 0),
(764769, 412864, '', 'Surinder Kaur', 'Ghotra', 1, 0, 0, 0, 174199, 0),
(764770, 412864, '', 'Neelam Kaur', 'Ghotra', 1, 0, 0, 0, 174200, 0),
(764806, 412879, '', 'Jatinderbir Singh', 'Lakhanpal', 1, 0, 0, 0, 79297, 0),
(764807, 412879, '', 'Harneet Kaur', 'Lakhanpal', 1, 0, 0, 0, 79298, 0),
(764808, 412879, '', 'Karman Singh', 'Lakhanpal', 1, 0, 0, 0, 79299, 0),
(764809, 412879, '', 'Sehaj Singh', 'Lakhanpal', 1, 0, 0, 0, 79300, 0),
(765003, 412979, '', 'Rajinder', 'Masson', 1, 0, 0, 0, 79361, 0),
(765004, 412979, '', 'Rekha', 'Masson', 1, 0, 0, 0, 79362, 0),
(765030, 412992, '', 'Balvinder K.', 'Masson', 1, 0, 0, 0, 79365, 0),
(765031, 412992, '', 'Poonam', 'Masson', 1, 0, 0, 0, 79366, 0),
(765036, 412996, '', 'Kewal K.', 'Masson', 1, 0, 0, 0, 79367, 0),
(765037, 412996, '', 'Bubbly', 'Masson', 1, 0, 0, 0, 79368, 0),
(767683, 414454, '', 'Kamaljeet Singh', 'Dhillon', 0, 0, 0, 0, 175503, 0),
(767684, 414454, '', 'Jaswinder Kaur', 'Dhillon', 0, 0, 0, 0, 175504, 0),
(767685, 414454, '', 'Jatinder Kaur', 'Grewal', 1, 0, 0, 0, 175505, 0),
(767688, 414456, '', 'Harkewal', 'Singh', 1, 0, 0, 0, 174142, 0),
(767689, 414456, '', 'Inderjit', 'Kaur', 1, 0, 0, 0, 174143, 0),
(785208, 424303, '', 'Daniel', 'Gomez', 0, 0, 0, 0, 238973, 0),
(785209, 424303, '', 'blanca', 'lopez', 0, 0, 0, 0, 238973, 1);

-- --------------------------------------------------------

--
-- Table structure for table `guest_list_guests`
--

CREATE TABLE IF NOT EXISTS `guest_list_guests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `party_id` int(10) unsigned NOT NULL,
  `title` enum('ms','mrs','mr','dr','miss') COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `plus_one_allowed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guest_list_guests_party_id_foreign` (`party_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=238989 ;

--
-- Dumping data for table `guest_list_guests`
--

INSERT INTO `guest_list_guests` (`id`, `party_id`, `title`, `first_name`, `last_name`, `plus_one_allowed`) VALUES
(79276, 42789, '', 'Nirmal', 'Kaur', 0),
(79277, 42789, '', 'Arturo', 'Lira', 0),
(79278, 42789, '', 'Manpreet', 'Kaur', 0),
(79279, 42789, '', 'Sukhchain', 'Kaur', 0),
(79290, 42792, '', 'Parminder Singh', 'Dhillon', 0),
(79291, 42792, '', 'Samraj Kaur', 'Dhillon', 0),
(79292, 42792, '', 'Jasleen Kaur', 'Dhillon', 0),
(79293, 42792, '', 'Amol Kaur', 'Dhillon', 0),
(79294, 42792, '', 'Sahib Singh', 'Dhillon', 0),
(79297, 42794, '', 'Jatinderbir Singh', 'Lakhanpal', 0),
(79298, 42794, '', 'Harneet Kaur', 'Lakhanpal', 0),
(79299, 42794, '', 'Karman Singh', 'Lakhanpal', 0),
(79300, 42794, '', 'Sehaj Singh', 'Lakhanpal', 0),
(79306, 42797, '', 'Satnam Singh', 'Bhullar', 0),
(79307, 42797, '', 'Simranjit SIngh', 'Bhullar', 0),
(79308, 42797, '', 'Jeskiran Kaur', 'Bhullar', 0),
(79309, 42797, '', 'Harpreet Kaur', 'Bhullar', 0),
(79326, 42808, '', 'Kuldip Singh', 'Bhullar', 0),
(79327, 42808, '', 'Kulbir Kaur', 'Bhullar', 0),
(79328, 42808, '', 'Herman', 'Bhullar', 0),
(79333, 42812, '', 'Parambir Singh', 'Padda', 0),
(79334, 42812, '', 'Kawalpreet Kaur', 'Padda', 0),
(79335, 42812, '', 'Bikram', 'Padda', 0),
(79336, 42812, '', 'Sherman', 'Padda', 0),
(79344, 42818, '', 'Ranjit Singh', 'Randhawa', 0),
(79345, 42818, '', 'Rosie Kaur', 'Randhawa', 0),
(79346, 42818, '', 'Bibi', 'Kaur', 0),
(79347, 42818, '', 'Sabtaj Singh', 'Randhawa', 0),
(79361, 42826, '', 'Rajinder', 'Masson', 0),
(79362, 42826, '', 'Rekha', 'Masson', 0),
(238987, 137401, 'mrs', 'Sarah', 'Driessen', 0),
(238986, 137401, 'mr', 'Ari', 'Driessen', 0),
(79367, 42829, '', 'Kewal K.', 'Masson', 0),
(79368, 42829, '', 'Bubbly', 'Masson', 0),
(79377, 42834, '', 'Karnal Singh', 'Kalar', 1),
(79378, 42834, '', 'Mohinder Kaur', 'Kalar', 0),
(79379, 42835, '', 'Avtar Singh', 'Nijjar', 0),
(79380, 42835, '', 'Baljit Kaur', 'Nijjar', 0),
(79385, 42838, '', 'Sucha Singh', 'Sangha', 1),
(79386, 42838, '', 'Inderjit Singh', 'Sangha', 1),
(79439, 42858, '', 'Tazinder', 'Kaur', 0),
(79440, 42858, '', 'Husband', 'Singh', 0),
(79441, 42858, '', 'Son', 'Singh', 0),
(79442, 42859, '', 'Jagdish Singh', 'Chawla', 0),
(79443, 42859, '', 'Jasbir Kaur', 'Chawla', 0),
(79444, 42860, '', 'Naresh L.', 'Vermani', 0),
(79445, 42860, '', 'Lata', 'Vermani', 0),
(79446, 42860, '', 'Nitin', 'Vermani', 0),
(79447, 42860, '', 'Rachna', 'Vermani', 0),
(79448, 42861, '', 'Manjit', 'Singh', 0),
(79449, 42861, '', 'Ramanjit Kaur', 'Sibia', 0),
(79450, 42862, '', 'Satwinder Singh', 'Grewal', 0),
(79451, 42862, '', 'Satinder Kaur', 'Grewal', 0),
(79452, 42862, '', 'Bibi', 'Grewal', 0),
(79453, 42863, '', 'Upminder Singh', 'Sandhu', 0),
(79454, 42863, '', 'Aman Kaur', 'Sandhu', 0),
(79457, 42865, '', 'Aniel', 'Kumar', 0),
(79458, 42865, '', 'Jyoti', 'Kumar', 0),
(79459, 42866, '', 'Gurpreet Singh', 'Bindra', 0),
(79460, 42866, '', 'Dr. Ravneet Kaur', 'Bindra', 0),
(79461, 42867, '', 'Dr. Harbans Singh', 'Multani', 0),
(79462, 42867, '', 'Renu', 'Multani', 0),
(79463, 42868, '', 'Dr. Satpal Singh', 'Multani', 0),
(79464, 42868, '', 'Baljinder Kaur', 'Multani', 0),
(79465, 42869, '', 'Charanjit', 'Singh', 0),
(79466, 42869, '', 'Maninder', 'Kaur', 0),
(79467, 42870, '', 'Sanjeev Singh', 'Kohli', 0),
(79468, 42870, '', 'Arveen Kaur', 'Kohli', 0),
(79469, 42871, '', 'Naresh N.', 'Bakshi', 0),
(79470, 42871, '', 'Lalita K.', 'Bakshi', 0),
(79471, 42872, '', 'Dr. Jatinder Singh', 'Sandhu', 0),
(79472, 42872, '', 'Balwinder Kaur', 'Sandhu', 0),
(79473, 42872, '', 'Jasdeep', 'Sandhu', 0),
(79474, 42872, '', 'Jasmine', 'Sandhu', 0),
(79475, 42873, '', 'Ryan F.', 'Delarosa', 0),
(79476, 42873, '', 'Wendy', 'Gomez', 0),
(79477, 42874, '', 'Ana', 'Valdez', 0),
(79478, 42875, '', 'Shamoon', 'Budhwani', 0),
(79479, 42875, '', 'Shirin', 'Motaghy', 0),
(79480, 42876, '', 'Maneka', 'Shewa', 1),
(79481, 42877, '', 'Adrian Felix', 'Gonzalez', 1),
(79484, 42879, '', 'Jake', 'Lee', 0),
(79485, 42879, '', 'Mia', 'Lee', 0),
(79486, 42880, '', 'Karen', 'Sandhu', 1),
(79487, 42881, '', 'Gary', 'Chen', 0),
(79488, 42881, '', 'Julie Ho', 'Chen', 0),
(79493, 42886, '', 'Paramjit', 'Singh', 0),
(79494, 42886, '', 'Shinder', 'Kaur', 0),
(79495, 42887, '', 'Anil K.', 'Malhi', 0),
(79496, 42887, '', 'Santosh D.', 'Malhi', 0),
(79497, 42888, '', 'Harbhajan Singh', 'Gill', 0),
(79498, 42888, '', 'Rajinder Kaur', 'Gill', 0),
(79499, 42889, '', 'Kulwant Singh', 'Gill', 0),
(79500, 42889, '', 'Gurbinder Kaur', 'Gill', 0),
(79501, 42889, '', 'Kiran Kaur', 'Gill', 0),
(79502, 42890, '', 'Amrik', 'Singh', 0),
(79503, 42890, '', 'Parmjit', 'Kaur', 0),
(79504, 42891, '', 'Saminder', 'Singh', 0),
(79505, 42891, '', 'Rupinder', 'Kaur', 0),
(79514, 42895, '', 'Parkash Kaur', 'Rai', 0),
(79515, 42896, '', 'Harkewal', 'Singh', 0),
(79516, 42896, '', 'Inderjeet', 'Kaur', 0),
(79535, 42906, '', 'Tilak R.', 'Gupta', 0),
(79536, 42906, '', 'Rekha', 'Gupta', 0),
(79537, 42906, '', 'Rita', 'Gupta', 0),
(79542, 42909, '', 'Satbr Singh', 'Tung', 0),
(79543, 42909, '', 'Harbrinderjit Kaur', 'Tung', 0),
(79544, 42910, '', 'Shamsher Singh', 'Sandhu', 0),
(79545, 42910, '', 'Jasbir Kaur', 'Sandhu', 0),
(79551, 42913, '', 'Surinder Singh', 'Kang', 0),
(79552, 42913, '', 'Gurprit Kaur', 'Kang', 0),
(79553, 42913, '', 'Chacci', 'Kaur', 0),
(79554, 42913, '', 'Amirt Singh', 'Kang', 0),
(79575, 42924, '', 'Balkar Singh', 'Chhina', 0),
(79576, 42924, '', 'Surinder', 'Kaur', 0),
(79577, 42924, '', 'Jobanpreet Singh', 'Chhina', 0),
(79578, 42924, '', 'Mandeep', 'Sandhu', 0),
(79579, 42924, '', 'Deep', 'Riar', 0),
(79582, 42926, '', 'Bhai Jaswant', 'Singh', 0),
(79583, 42926, '', 'Rani', 'Kaur', 0),
(79584, 42926, '', 'Rupinder', 'Kaur', 0),
(79588, 42929, '', 'Barbara B.', 'Miller', 1),
(79604, 42937, '', 'Harkirat SIngh', 'Sekhon', 0),
(79605, 42937, '', 'Baljinder Kaur', 'Sekhon', 0),
(79609, 42940, '', 'Shama', 'Varma', 0),
(79610, 42940, '', 'Harsh', 'Varma', 0),
(238985, 137400, 'mr', 'Ari', 'Driessen', 1),
(79624, 42947, '', 'Dr. Karambir', 'Bhullar', 0),
(79625, 42947, '', 'Sukhwinderjit Kaur', 'Bhullar', 0),
(238988, 137402, 'mr', 'Ari', 'Driessen', 0),
(79630, 42950, '', 'Raghbir Singh', 'Sekhon', 0),
(79631, 42950, '', 'Surinder Kaur', 'Sekhon', 0),
(79636, 42953, 'ms', 'Norman', 'Olsens', 0),
(79637, 42953, 'ms', 'Helen', 'Olsens', 0),
(79685, 42973, '', 'Anthony', 'Durate', 0),
(79686, 42973, '', 'Norma', 'Lira-Durate', 0),
(79691, 42976, '', 'Arturo Jr.', 'Lira', 0),
(79692, 42976, '', 'Crystal', 'Barba-Lira', 0),
(79745, 42996, '', 'Johhny', 'Lira', 0),
(79746, 42996, '', 'Nicole', 'Agundez-Lira', 0),
(173687, 96056, '', 'test', 'test', 0),
(173708, 96065, '', 'Ujjal Singh', 'Goraya', 0),
(173709, 96065, '', 'Sarvjit Kaur', 'Goraya', 0),
(173710, 96065, '', 'Roopinder Singh', 'Goraya', 0),
(173976, 96195, '', 'Dr.', 'Ahmad', 0),
(173977, 96195, '', 'Shireen', 'Ahmad', 0),
(173978, 96196, '', 'Dr.', 'Qazi', 0),
(173979, 96196, '', 'Dr. Nawazish', 'Qazi', 0),
(173980, 96197, '', 'Dr. Abid', 'Hussain', 0),
(173981, 96197, '', 'Nasreen', 'Hussain', 0),
(173982, 96198, 'ms', 'Kuldip Singh', 'Multani', 0),
(173983, 96198, 'ms', 'Amarjeet Kaurs', 'Multani', 0),
(173984, 96199, '', 'Rajinder Singh', 'Paul', 0),
(173985, 96199, '', 'Baljeet Kaur', 'Paul', 0),
(174039, 96204, '', 'Rajinder Singh', 'Gydee', 0),
(174040, 96204, '', 'Jaspal Kaur', 'Gydee', 0),
(174137, 96301, '', 'Shangara', 'Singh', 0),
(174138, 96301, '', 'Surinder', 'Kaur', 0),
(174139, 96302, '', 'Gurinderbir Singh', 'Lakhanpal', 0),
(174140, 96302, '', 'Tejpal Kaur', 'Lakhanpal', 0),
(174141, 96303, '', 'Pargat', 'Singh', 0),
(174142, 96304, '', 'Harkewal', 'Singh', 0),
(174143, 96304, '', 'Inderjit', 'Kaur', 0),
(174144, 96305, '', 'Yudvinder Singh', 'Kang', 0),
(174145, 96305, '', 'Kamalpreet Kaur', 'Kang', 0),
(174198, 96358, '', 'Jaswinder Singh', 'Ghotra', 0),
(174199, 96358, '', 'Surinder Kaur', 'Ghotra', 0),
(174200, 96358, '', 'Neelam Kaur', 'Ghotra', 0),
(174201, 96359, '', 'Harjinder Singh', 'Sandhu', 0),
(174202, 96359, '', 'Varinder Kaur', 'Sandhu', 0),
(174203, 96359, '', 'Harnoor Kaur', 'Sandhu', 0),
(174204, 96359, '', 'Gurnoor Singh', 'Sandhu', 0),
(174210, 96361, '', 'Nilesh', 'Patel', 0),
(174211, 96361, '', 'Hamali', 'Patel', 0),
(174229, 96373, '', 'Muninder Singh', 'Virk', 0),
(174230, 96373, '', 'Jaswinder Kaur', 'Virk', 0),
(174231, 96374, '', 'Avtar Singh', 'Takhar', 0),
(174232, 96374, '', 'Sarbjit Kaur', 'Takhar', 0),
(174233, 96375, '', 'Harish', 'Kapur', 0),
(174234, 96375, '', 'Ranji', 'Kapur', 0),
(174293, 96434, '', 'President Barack', 'Obama', 0),
(174294, 96434, '', 'Michelle', 'Obama', 0),
(174295, 96435, '', 'Scott', 'Moore', 0),
(174296, 96435, '', 'Gina', 'Moore', 0),
(174297, 96436, '', 'Sarbjit SIngh', 'Sangha', 0),
(174298, 96436, '', 'Kulvinder Kaur', 'Sangha', 0),
(174299, 96437, '', 'Sandeep Singh', 'Nagra', 0),
(174300, 96437, '', 'Tazinder Kaur', 'Nagra', 0),
(174447, 96527, '', 'Ruby', 'Goraya', 0),
(174448, 96528, '', 'Dr. Neil', 'Patel', 0),
(174449, 96528, '', 'Neelu', 'Patel', 0),
(174450, 96528, '', 'Lila', 'Patel', 0),
(174451, 96528, '', 'Yasmine', 'Patel', 0),
(174452, 96529, '', 'Dr. Ratul', 'Kumar', 0),
(174453, 96529, '', 'Ranjeeta', 'Kumar', 0),
(174454, 96529, '', 'Sofia', 'Kumar', 0),
(174456, 96531, '', 'Lakha Singh', 'Walha', 0),
(174457, 96531, '', 'Gurpreet Kaur', 'Walha', 0),
(174458, 96531, '', 'Noneet Kaur', 'Walha', 0),
(174467, 96537, '', 'Dr. Charanpreet Singh', 'Boparai', 0),
(174468, 96537, '', 'Rimpi Kaur', 'Boparai', 0),
(174469, 96537, '', 'Robby', 'Boparai', 0),
(174470, 96537, '', 'Asees Kaur', 'Boparai', 0),
(174471, 96538, '', 'Gumeet Kaur', 'Jamarai', 0),
(175503, 97220, '', 'Kamaljeet Singh', 'Dhillon', 0),
(175504, 97220, '', 'Jaswinder Kaur', 'Dhillon', 0),
(175505, 97220, '', 'Jatinder Kaur', 'Grewal', 0),
(175510, 97223, '', 'Jaswant Singh', 'Dhanju', 0),
(175511, 97223, '', 'Bakshish Kaur', 'Dhanju', 0),
(175512, 97223, '', 'Akamjot Singh', 'Dhanju', 0),
(175513, 97223, '', 'Amitaj Singh', 'Dhanju', 0),
(175514, 97224, '', 'Satinder Singh', 'Chandi', 0),
(175515, 97224, '', 'Ninder Kaur', 'Chandi', 0),
(180472, 100273, '', 'Kirpal Singh', 'Dhanju', 0),
(180473, 100273, '', 'Masako A.', 'Dhanju', 0),
(223809, 127226, '', 'Andres', 'Lira', 1),
(223810, 127226, '', 'Ted', 'Lira', 0),
(223813, 127228, 'ms', 'Pawan K.', 'Bagga', 0),
(223814, 127228, 'ms', 'Susnita', 'Bagga', 0),
(223815, 127228, 'ms', 'Pitha Ji.', 'Bagga', 0),
(223816, 127228, 'ms', 'Rahul', 'Bagga', 0),
(232042, 132925, '', 'Dharamjit Singh', 'Khehra', 0),
(232043, 132925, '', 'Sukhwinder Kaur', 'Khehra', 0),
(232044, 132925, '', 'Sukhdeep Singh', 'Khehra', 1),
(232045, 132926, '', 'Harjit', 'Singh', 0),
(232046, 132926, '', 'Satinderpal', 'Kaur', 0),
(232047, 132926, '', 'Maninder', 'Kaur', 0),
(232048, 132926, '', 'Rajitmeet', 'Singh', 0),
(232049, 132927, '', 'Ajit Kaur', 'Joneja', 1),
(232050, 132927, '', 'Surinder', 'Kaur', 0),
(232056, 132930, '', 'Kartar', 'Singh', 0),
(232057, 132930, '', 'Sarbjit', 'Kaur', 0),
(232058, 132930, '', 'Manmit Kaur', 'Singh', 0),
(232059, 132930, '', 'Aneeta Kaur', 'Singh', 0),
(232060, 132930, '', 'Sandeep', 'Singh', 0),
(232061, 132930, '', 'Tej', 'Kaur', 0),
(233278, 133672, '', 'Parminder', 'Kaur', 0),
(233279, 133672, '', 'Gurbir', 'Singh', 0),
(238973, 137394, '', 'Daniel', 'Gomez', 1),
(238974, 137395, 'mr', 'Ari', 'Driessen', 0),
(238975, 137395, 'ms', 'Sarah', 'Garner', 0);

-- --------------------------------------------------------

--
-- Table structure for table `guest_list_parties`
--

CREATE TABLE IF NOT EXISTS `guest_list_parties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `guest_count` smallint(5) unsigned NOT NULL,
  `plus_one_count` smallint(5) unsigned NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `guest_list_parties_event_id_foreign` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=137403 ;

--
-- Dumping data for table `guest_list_parties`
--

INSERT INTO `guest_list_parties` (`id`, `event_id`, `guest_count`, `plus_one_count`, `note`, `created_at`, `updated_at`) VALUES
(42789, 1, 4, 0, 'Bride and Immediate Family', '2014-05-04 17:21:11', '2014-05-04 17:21:11'),
(42792, 1, 5, 0, 'Masi and Maser (Aunt and Uncle)\n3 Children (12 and under)', '2014-05-04 17:25:11', '2014-05-04 17:29:09'),
(42794, 1, 4, 0, 'Cousin and Family\n\n2 children (12 and under)', '2014-05-04 17:26:37', '2014-05-04 17:29:24'),
(42797, 1, 4, 0, 'Mame (Aunt) and First Cousins', '2014-05-04 17:28:25', '2014-05-04 17:28:47'),
(42808, 1, 3, 0, '', '2014-05-04 17:31:07', '2014-05-04 17:31:07'),
(42812, 1, 4, 0, '', '2014-05-04 17:32:04', '2014-05-04 17:32:04'),
(42818, 1, 4, 0, 'Masi and Maser (Aunt and Uncle)\n\n1 child (Under 12)', '2014-05-04 17:34:21', '2014-05-04 17:34:21'),
(42826, 1, 2, 0, '', '2014-05-04 17:37:38', '2014-05-04 17:37:38'),
(137401, 4, 2, 0, '', '2014-09-21 13:57:34', '2014-09-21 14:04:55'),
(42829, 1, 2, 0, '', '2014-05-04 17:38:55', '2014-05-04 17:38:55'),
(42834, 1, 2, 1, '', '2014-05-04 17:43:11', '2014-05-04 17:43:11'),
(42835, 1, 2, 0, '', '2014-05-04 17:43:46', '2014-05-04 17:43:46'),
(42838, 1, 2, 2, '', '2014-05-04 17:45:23', '2014-05-04 17:45:23'),
(42858, 1, 3, 0, '1 Child (12 and under)', '2014-05-04 18:11:50', '2014-05-04 18:11:50'),
(42859, 1, 2, 0, '', '2014-05-04 18:12:22', '2014-05-04 18:12:22'),
(42860, 1, 4, 0, '1 Infant (Not included in guest list)', '2014-05-04 18:14:43', '2014-05-04 18:14:43'),
(42861, 1, 2, 0, '', '2014-05-04 18:15:41', '2014-05-04 18:15:41'),
(42862, 1, 3, 0, '', '2014-05-04 18:16:15', '2014-05-04 18:16:15'),
(42863, 1, 2, 0, '', '2014-05-04 18:16:38', '2014-05-04 18:16:38'),
(42865, 1, 2, 0, 'Redland''s Kitty', '2014-05-04 18:21:25', '2014-05-04 18:21:25'),
(42866, 1, 2, 0, 'Redland''s Kitty', '2014-05-04 18:21:57', '2014-05-04 18:21:57'),
(42867, 1, 2, 0, 'Redland''s Kitty', '2014-05-04 18:22:28', '2014-05-04 18:22:28'),
(42868, 1, 2, 0, 'Redland''s Kitty', '2014-05-04 18:22:55', '2014-05-04 18:22:55'),
(42869, 1, 2, 0, 'Redland''s Kitty \nVinku', '2014-05-04 18:23:36', '2014-07-01 21:09:28'),
(42870, 1, 2, 0, 'Redland''s Kitty', '2014-05-04 18:24:10', '2014-05-04 18:24:10'),
(42871, 1, 2, 0, 'Redland''s Kitty', '2014-05-04 18:24:44', '2014-05-04 18:24:44'),
(42872, 1, 4, 0, 'Redland''s Kitty\n\nCount will vary per function', '2014-05-04 18:25:28', '2014-05-04 18:25:28'),
(42873, 1, 2, 0, '', '2014-05-04 18:27:02', '2014-05-04 18:27:02'),
(42874, 1, 1, 0, '', '2014-05-04 18:27:17', '2014-05-04 18:27:17'),
(42875, 1, 2, 0, '', '2014-05-04 18:27:56', '2014-05-04 18:27:56'),
(42876, 1, 1, 1, '', '2014-05-04 18:28:18', '2014-05-04 18:28:18'),
(42877, 1, 1, 1, '', '2014-05-04 18:28:45', '2014-05-04 18:28:45'),
(42879, 1, 2, 0, 'Co Worker (CUB)', '2014-05-04 18:29:48', '2014-05-04 18:29:48'),
(42880, 1, 1, 1, '', '2014-05-04 18:30:25', '2014-05-04 18:30:25'),
(42881, 1, 2, 0, '', '2014-05-04 18:30:44', '2014-05-04 18:30:44'),
(42886, 1, 2, 0, '', '2014-05-04 18:33:54', '2014-05-04 18:33:54'),
(42887, 1, 2, 0, '', '2014-05-04 18:34:25', '2014-05-04 18:34:25'),
(42888, 1, 2, 0, '', '2014-05-04 18:34:57', '2014-05-04 18:34:57'),
(42889, 1, 3, 0, '', '2014-05-04 18:35:27', '2014-05-04 18:35:27'),
(42890, 1, 2, 0, '', '2014-05-04 18:35:49', '2014-05-04 18:35:49'),
(42891, 1, 2, 0, '', '2014-05-04 18:36:09', '2014-05-04 18:36:09'),
(42895, 1, 1, 0, '', '2014-05-04 18:38:11', '2014-05-04 18:38:11'),
(42896, 1, 2, 0, '', '2014-05-04 18:38:35', '2014-05-04 18:38:35'),
(42906, 1, 3, 0, 'Count varies per function.', '2014-05-04 18:43:23', '2014-05-04 18:43:23'),
(42909, 1, 2, 0, '', '2014-05-04 18:44:04', '2014-05-04 18:44:04'),
(42910, 1, 2, 0, '', '2014-05-04 18:44:30', '2014-05-04 18:44:30'),
(42913, 1, 4, 0, 'One Child - Amrit Singh', '2014-05-04 18:45:23', '2014-06-27 22:08:09'),
(42924, 1, 5, 0, 'One toddler (Sakhi)\n\nCount will varies per function.', '2014-05-04 18:49:27', '2014-05-04 18:49:27'),
(42926, 1, 3, 0, '', '2014-05-04 18:49:59', '2014-05-04 18:49:59'),
(42929, 1, 1, 1, '', '2014-05-04 18:51:00', '2014-07-27 04:58:16'),
(42937, 1, 2, 0, '', '2014-05-04 18:53:26', '2014-05-04 18:53:26'),
(42940, 1, 2, 0, '', '2014-05-04 18:54:04', '2014-05-04 18:54:04'),
(137400, 1, 1, 1, '', '2014-09-19 21:54:20', '2014-09-19 21:54:20'),
(42947, 1, 2, 0, '', '2014-05-04 18:57:13', '2014-05-04 18:57:13'),
(137402, 7, 1, 0, '', '2014-10-22 03:35:33', '2014-10-22 03:36:22'),
(42950, 1, 2, 0, '', '2014-05-04 18:58:28', '2014-05-04 18:58:28'),
(42953, 1, 2, 0, '', '2014-05-04 18:59:28', '2014-05-04 18:59:28'),
(42973, 1, 2, 0, '', '2014-05-04 19:06:06', '2014-05-04 19:06:06'),
(42976, 1, 2, 0, '', '2014-05-04 19:06:48', '2014-05-04 19:06:48'),
(42996, 1, 2, 0, '', '2014-05-04 19:11:30', '2014-05-04 19:11:30'),
(96056, 1, 1, 0, '', '2014-07-27 01:02:20', '2014-07-27 01:02:20'),
(96065, 1, 3, 0, '', '2014-07-27 01:25:27', '2014-07-27 01:25:27'),
(96195, 1, 2, 0, '', '2014-07-27 03:24:26', '2014-07-27 03:24:26'),
(96196, 1, 2, 0, '', '2014-07-27 03:25:44', '2014-07-27 03:25:44'),
(96197, 1, 2, 0, '', '2014-07-27 03:27:50', '2014-07-27 03:27:50'),
(96198, 1, 2, 0, '', '2014-07-27 03:32:43', '2014-07-27 03:32:43'),
(96199, 1, 2, 0, '', '2014-07-27 03:33:43', '2014-07-27 03:33:43'),
(96204, 1, 2, 0, '', '2014-07-27 03:57:38', '2014-07-27 03:57:38'),
(96301, 1, 2, 0, '', '2014-07-27 04:14:37', '2014-07-27 04:14:37'),
(96302, 1, 2, 0, '', '2014-07-27 04:20:33', '2014-07-27 04:20:33'),
(96303, 1, 1, 0, '', '2014-07-27 04:20:50', '2014-07-27 04:20:50'),
(96304, 1, 2, 0, '', '2014-07-27 04:22:48', '2014-07-27 04:22:48'),
(96305, 1, 2, 0, 'Dimple', '2014-07-27 04:26:39', '2014-07-27 04:26:39'),
(96358, 1, 3, 0, '', '2014-07-27 04:48:35', '2014-07-27 04:48:35'),
(96359, 1, 4, 0, 'Count Varies', '2014-07-27 04:55:51', '2014-07-27 04:55:51'),
(96361, 1, 2, 0, '', '2014-07-27 04:59:46', '2014-07-27 04:59:46'),
(96373, 1, 2, 0, '', '2014-07-27 05:15:07', '2014-07-27 05:15:07'),
(96374, 1, 2, 0, '', '2014-07-27 05:16:17', '2014-07-27 05:16:17'),
(96375, 1, 2, 0, '', '2014-07-27 05:18:44', '2014-07-27 05:18:44'),
(96434, 1, 2, 0, '', '2014-07-27 05:53:42', '2014-07-27 05:53:42'),
(96435, 1, 2, 0, '', '2014-07-27 05:56:13', '2014-07-27 05:56:13'),
(96436, 1, 2, 0, '', '2014-07-27 06:05:18', '2014-07-27 06:05:18'),
(96437, 1, 2, 0, '', '2014-07-27 06:09:55', '2014-07-27 06:09:55'),
(96527, 1, 1, 0, '', '2014-07-27 07:10:42', '2014-07-27 07:10:42'),
(96528, 1, 4, 0, '', '2014-07-27 07:11:24', '2014-07-27 07:11:24'),
(96529, 1, 3, 0, '', '2014-07-27 07:12:12', '2014-07-27 07:12:12'),
(96531, 1, 3, 0, '', '2014-07-27 07:22:02', '2014-07-27 07:22:02'),
(96537, 1, 4, 0, '', '2014-07-27 07:29:10', '2014-07-27 07:29:10'),
(96538, 1, 1, 0, '', '2014-07-27 07:29:49', '2014-07-27 07:29:49'),
(97220, 1, 3, 0, '', '2014-07-27 23:20:19', '2014-07-27 23:20:19'),
(97223, 1, 4, 0, '', '2014-07-27 23:32:26', '2014-07-27 23:32:26'),
(97224, 1, 2, 0, '', '2014-07-27 23:35:28', '2014-07-27 23:35:28'),
(100273, 1, 2, 0, '', '2014-08-01 04:03:18', '2014-08-01 04:03:18'),
(127226, 1, 2, 1, '', '2014-09-07 19:46:00', '2014-09-07 19:46:00'),
(127228, 1, 4, 0, '', '2014-09-07 19:47:39', '2014-09-21 12:52:39'),
(132925, 1, 3, 1, 'Sukhwinder Spokane', '2014-09-13 20:26:24', '2014-09-13 20:26:24'),
(132926, 1, 4, 0, '', '2014-09-13 20:35:17', '2014-09-13 20:35:17'),
(132927, 1, 2, 1, '', '2014-09-13 20:54:11', '2014-09-13 20:54:11'),
(132930, 1, 6, 0, '', '2014-09-13 21:12:25', '2014-09-13 21:12:25'),
(133672, 1, 2, 0, '', '2014-09-15 15:44:55', '2014-09-15 15:44:55'),
(137394, 1, 1, 1, '', '2014-09-19 01:39:02', '2014-09-19 01:39:02'),
(137395, 2, 2, 0, '', '2014-09-19 16:09:31', '2014-09-19 16:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE IF NOT EXISTS `invitations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invited_by` int(10) unsigned NOT NULL,
  `invited_user` int(10) unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shared_events` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invitations_invited_by_foreign` (`invited_by`),
  KEY `invitations_invited_user_foreign` (`invited_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `invitations`
--

INSERT INTO `invitations` (`id`, `invited_by`, `invited_user`, `email`, `token`, `shared_events`, `created_at`) VALUES
(2, 2, NULL, 'ahausman2@gmail.com', 'SQBKMnqbUlt6mmF0d2iq2K7cz1Zi1me10ZCqIfNU', '{"4":"administrator"}', '2014-09-19 11:21:53'),
(3, 2, NULL, 'ari.driessen@gmail.com', '22FjodCXheQfi7SDkVBaIZCRLBoJmM0PJBaIlmir', '{"4":"administrator","5":"administrator"}', '2014-09-20 14:30:45'),
(4, 2, NULL, 'ari.driessen@us.pwc.com', 'afg9LLx0oasqGoiwGJWbrEU5BAcIkOqY4Ln5s8cF', '{"7":"administrator"}', '2014-10-03 11:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `meta`
--

CREATE TABLE IF NOT EXISTS `meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `metable_id` int(10) unsigned NOT NULL,
  `metable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_metable_id_index` (`metable_id`),
  KEY `meta_key_index` (`key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=267 ;

--
-- Dumping data for table `meta`
--

INSERT INTO `meta` (`id`, `metable_id`, `metable_type`, `key`, `value`) VALUES
(1, 1, 'User', 'dismissed_sub_events_tip', '0'),
(2, 1, 'EventModel', 'integration_type', 'default'),
(3, 1, 'EventModel', 'entree_selection_enabled', '1'),
(4, 1, 'EventModel', 'appetizer_selection_enabled', '1'),
(5, 1, 'EventModel', 'note_inclusion_enabled', '1'),
(6, 1, 'EventModel', 'note_inclusion_question', 'Would you like to include a note with your RSVP for the bride and groom?'),
(7, 1, 'EventModel', 'logo_image_name', ''),
(8, 1, 'EventModel', 'background_type', 'image'),
(9, 1, 'EventModel', 'background_value', 'default'),
(10, 1, 'EventModel', 'form_background_type', 'color'),
(11, 1, 'EventModel', 'form_background_value', 'ffffff'),
(12, 1, 'EventModel', 'heading_style', '{"font_face":"Arial","font_size":16,"color":"000000","bold":0,"italic":0,"underline":0}'),
(13, 1, 'EventModel', 'thank_you_headline', 'Thank You!'),
(14, 1, 'EventModel', 'thank_you_message', 'We''ve received your RSVP. A copy of your RSVP has been sent to your email address. You may now close this window.'),
(15, 1, 'EventModel', 'security_enabled', '0'),
(16, 1, 'EventModel', 'security_code', ''),
(17, 1, 'EventModel', 'notification_settings', '{"send_copy_to_guests":1,"rsvp_received":1}'),
(18, 1, 'EventModel', 'max_guests_in_party_enabled', '1'),
(19, 1, 'EventModel', 'max_guests_in_party', '10'),
(20, 1, 'EventModel', 'welcome_text', 'To begin your RSVP, please enter your e-mail address and the total number of guests in your party. Please include both acceptances and regrets.'),
(21, 1, 'EventModel', 'max_acceptances_reached_text', '<p><span style="font-size: 14pt;">Sorry, we''re no longer accepting RSVPs for this event.</span></p>'),
(22, 1, 'EventModel', 'closed_text', 'Sorry, this RSVP has closed.'),
(23, 1, 'EventModel', 'ask_for_emails', '1'),
(24, 1, 'EventModel', 'ask_for_titles', '1'),
(25, 1, 'EventModel', 'show_event_name', '1'),
(26, 1, 'EventModel', 'show_date_of_event', '1'),
(27, 1, 'EventModel', 'only_listed_guests_can_rsvp', '0'),
(28, 2, 'EventModel', 'integration_type', 'default'),
(29, 2, 'EventModel', 'entree_selection_enabled', '0'),
(30, 2, 'EventModel', 'appetizer_selection_enabled', '0'),
(31, 2, 'EventModel', 'note_inclusion_enabled', '1'),
(32, 2, 'EventModel', 'note_inclusion_question', 'Would you like to include a note with your RSVP for the bride and groom?'),
(33, 2, 'EventModel', 'logo_image_name', ''),
(34, 2, 'EventModel', 'background_type', 'image'),
(35, 2, 'EventModel', 'background_value', 'default'),
(36, 2, 'EventModel', 'form_background_type', 'color'),
(37, 2, 'EventModel', 'form_background_value', 'ffffff'),
(38, 2, 'EventModel', 'heading_style', '{"font_face":"Arial","font_size":16,"color":"000000","bold":0,"italic":0,"underline":0}'),
(39, 2, 'EventModel', 'thank_you_headline', 'Thank You!'),
(40, 2, 'EventModel', 'thank_you_message', 'We''ve received your RSVP. A copy of your RSVP has been sent to your email address. You may now close this window.'),
(41, 2, 'EventModel', 'security_enabled', '0'),
(42, 2, 'EventModel', 'security_code', ''),
(43, 2, 'EventModel', 'notification_settings', '{"send_copy_to_guests":1,"rsvp_received":1,"new_rsvp":0,"send_rsvp_copy_to_guests":0}'),
(44, 2, 'EventModel', 'max_guests_in_party_enabled', '1'),
(45, 2, 'EventModel', 'max_guests_in_party', '10'),
(46, 2, 'EventModel', 'welcome_text', 'To begin your RSVP, please enter your e-mail address and the total number of guests in your party. Please include both acceptances and regrets.'),
(47, 2, 'EventModel', 'max_acceptances_reached_text', 'Sorry, we''re no longer accepting RSVPs for this event.'),
(48, 2, 'EventModel', 'closed_text', 'Sorry, this RSVP has closed.'),
(49, 2, 'EventModel', 'ask_for_emails', '1'),
(50, 2, 'EventModel', 'ask_for_titles', '1'),
(51, 2, 'EventModel', 'show_event_name', '1'),
(52, 2, 'EventModel', 'show_date_of_event', '1'),
(53, 2, 'EventModel', 'only_listed_guests_can_rsvp', '0'),
(54, 2, 'User', 'dismissed_sub_events_tip', '0'),
(55, 3, 'EventModel', 'integration_type', 'default'),
(56, 3, 'EventModel', 'entree_selection_enabled', '0'),
(57, 3, 'EventModel', 'appetizer_selection_enabled', '0'),
(58, 3, 'EventModel', 'note_inclusion_enabled', '1'),
(59, 3, 'EventModel', 'note_inclusion_question', 'Would you like to include a note with your RSVP for the bride and groom?'),
(60, 3, 'EventModel', 'logo_image_name', ''),
(61, 3, 'EventModel', 'background_type', 'image'),
(62, 3, 'EventModel', 'background_value', 'default'),
(63, 3, 'EventModel', 'form_background_type', 'color'),
(64, 3, 'EventModel', 'form_background_value', 'ffffff'),
(65, 3, 'EventModel', 'heading_style', '{"font_face":"Arial","font_size":16,"color":"000000","bold":0,"italic":0,"underline":0}'),
(66, 3, 'EventModel', 'thank_you_headline', 'Thank You!'),
(67, 3, 'EventModel', 'thank_you_message', 'We''ve received your RSVP. A copy of your RSVP has been sent to your email address. You may now close this window.'),
(68, 3, 'EventModel', 'security_enabled', '0'),
(69, 3, 'EventModel', 'security_code', ''),
(70, 3, 'EventModel', 'notification_settings', '{"send_copy_to_guests":1,"rsvp_received":1}'),
(71, 3, 'EventModel', 'max_guests_in_party_enabled', '1'),
(72, 3, 'EventModel', 'max_guests_in_party', '10'),
(73, 3, 'EventModel', 'welcome_text', 'To begin your RSVP, please enter your e-mail address and the total number of guests in your party. Please include both acceptances and regrets.'),
(74, 3, 'EventModel', 'max_acceptances_reached_text', 'Sorry, we''re no longer accepting RSVPs for this event.'),
(75, 3, 'EventModel', 'closed_text', 'Sorry, this RSVP has closed.'),
(76, 3, 'EventModel', 'ask_for_emails', '1'),
(77, 3, 'EventModel', 'ask_for_titles', '1'),
(78, 3, 'EventModel', 'show_event_name', '1'),
(79, 3, 'EventModel', 'show_date_of_event', '1'),
(80, 3, 'EventModel', 'only_listed_guests_can_rsvp', '0'),
(81, 1, 'SecondaryEvent', 'datetime_details', 'Friday Night'),
(159, 6, 'EventModel', 'welcome_text', 'To begin your RSVP, please enter your e-mail address and the total number of guests in your party. Please include both acceptances and regrets.'),
(158, 6, 'EventModel', 'max_guests_in_party', '10'),
(157, 6, 'EventModel', 'max_guests_in_party_enabled', '1'),
(156, 6, 'EventModel', 'notification_settings', '{"send_rsvp_copy_to_guests":1,"new_rsvp":1}'),
(155, 6, 'EventModel', 'security_code', ''),
(154, 6, 'EventModel', 'security_enabled', '0'),
(153, 6, 'EventModel', 'thank_you_message', 'We''ve received your RSVP. A copy of your RSVP has been sent to your email address. You may now close this window.'),
(152, 6, 'EventModel', 'thank_you_headline', 'Thank You!'),
(151, 6, 'EventModel', 'heading_style', '{"font_face":"Arial","font_size":16,"color":"000000","bold":0,"italic":0,"underline":0}'),
(150, 6, 'EventModel', 'form_background_value', 'ffffff'),
(149, 6, 'EventModel', 'form_background_type', 'color'),
(148, 6, 'EventModel', 'background_value', 'default'),
(146, 6, 'EventModel', 'logo_image_name', ''),
(147, 6, 'EventModel', 'background_type', 'image'),
(145, 6, 'EventModel', 'note_inclusion_question', 'Would you like to include a note with your RSVP for the bride and groom?'),
(144, 6, 'EventModel', 'note_inclusion_enabled', '1'),
(143, 6, 'EventModel', 'appetizer_selection_enabled', '0'),
(142, 6, 'EventModel', 'entree_selection_enabled', '0'),
(141, 6, 'EventModel', 'integration_type', 'default'),
(108, 2, 'SecondaryEvent', 'datetime_details', 'Friday at 5:30 PM @ Chen''s'),
(109, 2, 'SecondaryEvent', 'question_text', 'Can you join us?'),
(110, 2, 'SecondaryEvent', 'accept_text', 'I''ll be there!'),
(111, 2, 'SecondaryEvent', 'decline_text', 'Sorry, can''t make it.'),
(112, 3, 'SecondaryEvent', 'datetime_details', 'Sunday at 10am at The House'),
(113, 4, 'SecondaryEvent', 'datetime_details', 'Midnight to ?'),
(175, 7, 'EventModel', 'note_inclusion_question', 'Would you like to include a note with your RSVP for the bride and groom?'),
(174, 7, 'EventModel', 'note_inclusion_enabled', '1'),
(173, 7, 'EventModel', 'appetizer_selection_enabled', '1'),
(172, 7, 'EventModel', 'entree_selection_enabled', '1'),
(171, 7, 'EventModel', 'integration_type', 'default'),
(170, 6, 'EventModel', 'confirmation_page', '{"title":"Thank you for your RSVP.","details_enabled":1,"details":"","bookmark_enabled":0,"who_is_coming_enabled":0}'),
(169, 6, 'EventModel', 'rsvp_copy_settings', '{"logo_enabled":0,"logo_filename":"","introductory_text":"<p>Dear [Guest''s First Name],<\\/p><p>Thank you for your RSVP. You can update your RSVP at any time using the same e-mail address when RSVPing. Below is a copy of your RSVP.<\\/p>","footer_text":""}'),
(168, 6, 'EventModel', 'max_acceptances', '50'),
(167, 6, 'EventModel', 'max_acceptances_enabled', '0'),
(166, 6, 'EventModel', 'only_listed_guests_can_rsvp', '0'),
(165, 6, 'EventModel', 'show_date_of_event', '1'),
(162, 6, 'EventModel', 'ask_for_emails', '1'),
(163, 6, 'EventModel', 'ask_for_titles', '1'),
(164, 6, 'EventModel', 'show_event_name', '1'),
(161, 6, 'EventModel', 'closed_text', 'Sorry, this RSVP has closed.'),
(160, 6, 'EventModel', 'max_acceptances_reached_text', 'Sorry, we''re no longer accepting RSVPs for this event.'),
(140, 5, 'SecondaryEvent', 'datetime_details', 'Friday'),
(176, 7, 'EventModel', 'logo_image_name', ''),
(177, 7, 'EventModel', 'background_type', 'image'),
(178, 7, 'EventModel', 'background_value', 'default'),
(179, 7, 'EventModel', 'form_background_type', 'color'),
(180, 7, 'EventModel', 'form_background_value', 'ffffff'),
(181, 7, 'EventModel', 'heading_style', '{"font_face":"Arial","font_size":16,"color":"000000","bold":0,"italic":0,"underline":0}'),
(182, 7, 'EventModel', 'thank_you_headline', 'Thank You!'),
(183, 7, 'EventModel', 'thank_you_message', 'We''ve received your RSVP. A copy of your RSVP has been sent to your email address. You may now close this window.'),
(184, 7, 'EventModel', 'security_enabled', '0'),
(185, 7, 'EventModel', 'security_code', ''),
(186, 7, 'EventModel', 'notification_settings', '{"send_rsvp_copy_to_guests":1,"new_rsvp":0}'),
(187, 7, 'EventModel', 'max_guests_in_party_enabled', '1'),
(188, 7, 'EventModel', 'max_guests_in_party', '10'),
(189, 7, 'EventModel', 'welcome_text', 'To begin your RSVP, please enter your e-mail address and the total number of guests in your party. Please include both acceptances and regrets.'),
(190, 7, 'EventModel', 'max_acceptances_reached_text', 'Sorry, we''re no longer accepting RSVPs for this event.'),
(191, 7, 'EventModel', 'closed_text', 'Sorry, this RSVP has closed.'),
(192, 7, 'EventModel', 'ask_for_emails', '1'),
(193, 7, 'EventModel', 'ask_for_titles', '1'),
(194, 7, 'EventModel', 'show_event_name', '1'),
(195, 7, 'EventModel', 'show_date_of_event', '0'),
(196, 7, 'EventModel', 'only_listed_guests_can_rsvp', '0'),
(197, 7, 'EventModel', 'max_acceptances_enabled', '0'),
(198, 7, 'EventModel', 'max_acceptances', '50'),
(199, 7, 'EventModel', 'rsvp_copy_settings', '{"logo_enabled":1,"logo_filename":"6GLY8tPa31tDMCOPsKZeqWf0YV9ovSV2R8N1AEYX","introductory_text":"<p>Dear [Guest''s First Name],<\\/p>\\r\\n<p>Thank you for your RSVP. You can update your RSVP at any time using the same e-mail address when RSVPing. Below is a copy of your RSVP.<\\/p>","footer_text":""}'),
(200, 7, 'EventModel', 'confirmation_page', '{"title":"Thank you for your RSVP.!!!!!","details_enabled":0,"details":"","bookmark_enabled":0,"who_is_coming_enabled":0}'),
(201, 2, 'EventModel', 'rsvp_copy_settings', '{"logo_filename":"h6bOYkkcj2QKrcVKLw9Dmi4hwPeC5DQ3Xx0ovV9i","logo_enabled":1,"introductory_text":""}'),
(202, 6, 'SecondaryEvent', 'datetime_details', 'Friday'),
(203, 8, 'EventModel', 'integration_type', 'default'),
(204, 8, 'EventModel', 'entree_selection_enabled', '1'),
(205, 8, 'EventModel', 'appetizer_selection_enabled', '1'),
(206, 8, 'EventModel', 'note_inclusion_enabled', '1'),
(207, 8, 'EventModel', 'note_inclusion_question', 'Would you like to include a note with your RSVP for the bride and groom?'),
(208, 8, 'EventModel', 'logo_image_name', ''),
(209, 8, 'EventModel', 'background_type', 'image'),
(210, 8, 'EventModel', 'background_value', 'default'),
(211, 8, 'EventModel', 'form_background_type', 'color'),
(212, 8, 'EventModel', 'form_background_value', 'ffffff'),
(213, 8, 'EventModel', 'heading_style', '{"font_face":"Arial","font_size":16,"color":"000000","bold":0,"italic":0,"underline":0}'),
(214, 8, 'EventModel', 'thank_you_headline', 'Thank You!'),
(215, 8, 'EventModel', 'thank_you_message', 'We''ve received your RSVP. A copy of your RSVP has been sent to your email address. You may now close this window.'),
(216, 8, 'EventModel', 'security_enabled', '0'),
(217, 8, 'EventModel', 'security_code', ''),
(218, 8, 'EventModel', 'notification_settings', '{"send_rsvp_copy_to_guests":1,"new_rsvp":1}'),
(219, 8, 'EventModel', 'max_guests_in_party_enabled', '1'),
(220, 8, 'EventModel', 'max_guests_in_party', '10'),
(221, 8, 'EventModel', 'welcome_text', '<p>To begin your RSVP, please enter your e-mail address and the total number of guests in your party. Please include both acceptances and regrets.dcdsddsav ij lskjksdjklkj asdkljsadkl jlsda</p>'),
(222, 8, 'EventModel', 'max_acceptances_reached_text', 'Sorry, we''re no longer accepting RSVPs for this event.'),
(223, 8, 'EventModel', 'closed_text', 'Sorry, this RSVP has closed.'),
(224, 8, 'EventModel', 'ask_for_emails', '1'),
(225, 8, 'EventModel', 'ask_for_titles', '1'),
(226, 8, 'EventModel', 'show_event_name', '1'),
(227, 8, 'EventModel', 'show_date_of_event', '1'),
(228, 8, 'EventModel', 'only_listed_guests_can_rsvp', '0'),
(229, 8, 'EventModel', 'max_acceptances_enabled', '0'),
(230, 8, 'EventModel', 'max_acceptances', '50'),
(231, 8, 'EventModel', 'rsvp_copy_settings', '{"logo_enabled":0,"logo_filename":"","introductory_text":"<p>Dear [Guest''s First Name],<\\/p><p>Thank you for your RSVP. You can update your RSVP at any time using the same e-mail address when RSVPing. Below is a copy of your RSVP.<\\/p>","footer_text":""}'),
(232, 8, 'EventModel', 'confirmation_page', '{"title":"Thank you for your RSVP.","details_enabled":1,"details":"","bookmark_enabled":0,"who_is_coming_enabled":0}'),
(233, 7, 'EventModel', 'design', '{"left_photo":{"enabled":1,"filename":"P0qDdK0gLOKszFStAv0iF4149hYDqWTMR17rYSi0"},"right_section_bg":{"type":"pattern","pattern_type":"theme","value":"canary_yellow"},"top_background":{"type":"pattern","pattern_type":"theme","value":"canary_yellow"},"include_ribbon":1,"theme":"emerald","background_height":"top_half","bottom_background":{"type":"color","value":"000000"},"date_line":"kkkk"}'),
(234, 8, 'EventModel', 'design', '{"left_photo":{"enabled":1,"filename":"pCJvc8bDZZWLH7NGOlSQfCDQ9O55cyVc5gzrLtsd"},"top_background":{"type":"pattern","pattern_type":"theme","value":"silver_gray"},"background_height":"full","include_ribbon":0,"right_section_bg":{"type":"pattern","pattern_type":"theme","value":"emerald"},"color":"5c3a5c","top_bg":{"type":"image","value":"7FzHZhYTRc3MtcfeyF4jRLa4XF2uKAbBJg6GgMXP"},"bottom_bg":{"type":"color","value":"d100d1"}}'),
(235, 7, 'SecondaryEvent', 'datetime_details', 'Friday'),
(236, 9, 'EventModel', 'integration_type', 'default'),
(237, 9, 'EventModel', 'entree_selection_enabled', '0'),
(238, 9, 'EventModel', 'appetizer_selection_enabled', '0'),
(239, 9, 'EventModel', 'note_inclusion_enabled', '1'),
(240, 9, 'EventModel', 'note_inclusion_question', 'Would you like to include a note with your RSVP for the bride and groom?'),
(241, 9, 'EventModel', 'logo_image_name', ''),
(242, 9, 'EventModel', 'background_type', 'image'),
(243, 9, 'EventModel', 'background_value', 'default'),
(244, 9, 'EventModel', 'form_background_type', 'color'),
(245, 9, 'EventModel', 'form_background_value', 'ffffff'),
(246, 9, 'EventModel', 'heading_style', '{"font_face":"Arial","font_size":16,"color":"000000","bold":0,"italic":0,"underline":0}'),
(247, 9, 'EventModel', 'thank_you_headline', 'Thank You!'),
(248, 9, 'EventModel', 'thank_you_message', 'We''ve received your RSVP. A copy of your RSVP has been sent to your email address. You may now close this window.'),
(249, 9, 'EventModel', 'security_enabled', '0'),
(250, 9, 'EventModel', 'security_code', ''),
(251, 9, 'EventModel', 'notification_settings', '{"send_rsvp_copy_to_guests":1,"new_rsvp":1}'),
(252, 9, 'EventModel', 'max_guests_in_party_enabled', '1'),
(253, 9, 'EventModel', 'max_guests_in_party', '10'),
(254, 9, 'EventModel', 'welcome_text', 'To begin your RSVP, please enter your e-mail address and the total number of guests in your party. Please include both acceptances and regrets.'),
(255, 9, 'EventModel', 'max_acceptances_reached_text', 'Sorry, we''re no longer accepting RSVPs for this event.'),
(256, 9, 'EventModel', 'closed_text', 'Sorry, this RSVP has closed.'),
(257, 9, 'EventModel', 'ask_for_emails', '1'),
(258, 9, 'EventModel', 'ask_for_titles', '1'),
(259, 9, 'EventModel', 'show_event_name', '1'),
(260, 9, 'EventModel', 'show_date_of_event', '1'),
(261, 9, 'EventModel', 'only_listed_guests_can_rsvp', '0'),
(262, 9, 'EventModel', 'max_acceptances_enabled', '0'),
(263, 9, 'EventModel', 'max_acceptances', '50'),
(264, 9, 'EventModel', 'rsvp_copy_settings', '{"logo_enabled":0,"logo_filename":"","introductory_text":"<p>Dear [Guest''s First Name],<\\/p><p>Thank you for your RSVP. You can update your RSVP at any time using the same e-mail address when RSVPing. Below is a copy of your RSVP.<\\/p>","footer_text":""}'),
(265, 9, 'EventModel', 'confirmation_page', '{"title":"Thank you for your RSVP.","details_enabled":1,"details":"","bookmark_enabled":0,"who_is_coming_enabled":0}'),
(266, 9, 'EventModel', 'design', '{"color":"000000","left_photo":{"enabled":0,"filename":""},"right_section_bg":{"type":"pattern","pattern_type":"theme","value":"bold_black"},"top_bg":{"type":"color","value":"000000"},"bottom_bg":{"type":"color","value":"000000"},"header_text":{"value":"RSVP","font":"Arial","color":"000000"},"event_name":"Test","date_line":"October 31, 2014"}');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_05_28_122331_create_users_table', 1),
('2014_05_28_122609_create_referrals_table', 1),
('2014_05_28_124719_create_email_confirmations_table', 1),
('2014_05_30_020543_create_password_reminders_table', 1),
('2014_06_14_061102_create_events_table', 1),
('2014_06_30_130646_create_entrees_table', 1),
('2014_07_21_032907_create_submissions_table', 1),
('2014_07_21_033605_create_guests_table', 1),
('2014_07_22_065439_create_meta_table', 1),
('2014_07_23_130658_create_appetizers_table', 1),
('2014_07_27_035424_create_tables_table', 1),
('2014_07_31_043855_create_guest_list_parties_table', 1),
('2014_07_31_044002_create_guest_list_guests_table', 1),
('2014_08_07_043130_create_secondary_events_table', 1),
('2014_08_07_065213_create_custom_questions_table', 1),
('2014_08_07_065439_create_custom_questions_options_table', 1),
('2014_08_07_065859_create_custom_questions_answers_table', 1),
('2014_09_02_040354_create_secondary_event_invites_table', 1),
('2014_09_04_041031_create_user_expenses_table', 1),
('2014_09_05_062747_create_event_domains_table', 1),
('2014_09_06_024140_add_cashier_columns', 1),
('2014_09_06_072839_create_plans_table', 1),
('2014_09_07_030914_create_shared_events_table', 1),
('2014_09_18_080412_create_invitations_table', 1),
('2014_10_02_080321_create_event_links_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reminders`
--

CREATE TABLE IF NOT EXISTS `password_reminders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `password_reminders_token_index` (`token`),
  KEY `password_reminders_user_id_foreign` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `password_reminders`
--

INSERT INTO `password_reminders` (`id`, `token`, `user_id`, `created_at`) VALUES
(1, 'u3OS5KAjuvOejHnU6yPGNY62J1xg6evZPHSiVcz6', 1, '2014-09-19 10:25:55'),
(2, 'zicHKVfHuhB5EiFKyXrt7T9F3iAodMayXCL4jfyn', 2, '2014-09-21 08:05:46');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `recurring` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE IF NOT EXISTS `referrals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `referrer_id` int(10) unsigned NOT NULL,
  `referent_id` int(10) unsigned NOT NULL,
  `referent_upgraded` tinyint(1) NOT NULL,
  `referent_upgrade_status` enum('single-event','pro','pro-cancelled') COLLATE utf8_unicode_ci DEFAULT NULL,
  `earnings` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `referrals_referrer_id_foreign` (`referrer_id`),
  KEY `referrals_referent_id_foreign` (`referent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `secondary_events`
--

CREATE TABLE IF NOT EXISTS `secondary_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `invite_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `secondary_events_event_id_foreign` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `secondary_events`
--

INSERT INTO `secondary_events` (`id`, `event_id`, `name`, `invite_only`) VALUES
(1, 2, 'Bachelor Party', 1),
(2, 4, 'Friday Night Dinner', 1),
(3, 4, 'Sunday Brunch', 1),
(4, 4, 'After-party', 0),
(5, 1, 'Test Event', 0),
(6, 7, 'Test', 1),
(7, 8, 'Rehearsal Dinner', 0);

-- --------------------------------------------------------

--
-- Table structure for table `secondary_event_invites`
--

CREATE TABLE IF NOT EXISTS `secondary_event_invites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `secondary_event_id` int(10) unsigned NOT NULL,
  `guest_list_guest_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `secondary_event_invites_secondary_event_id_foreign` (`secondary_event_id`),
  KEY `secondary_event_invites_guest_list_guest_id_foreign` (`guest_list_guest_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `secondary_event_invites`
--

INSERT INTO `secondary_event_invites` (`id`, `secondary_event_id`, `guest_list_guest_id`) VALUES
(1, 1, 238974),
(2, 2, 238976),
(3, 3, 238976),
(5, 3, 238977),
(6, 2, 238980),
(7, 3, 238981),
(11, 3, 238986),
(9, 3, 238983);

-- --------------------------------------------------------

--
-- Table structure for table `shared_events`
--

CREATE TABLE IF NOT EXISTS `shared_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `permissions` enum('readonly','administrator') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shared_events_event_id_foreign` (`event_id`),
  KEY `shared_events_user_id_foreign` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shared_events`
--

INSERT INTO `shared_events` (`id`, `event_id`, `user_id`, `permissions`) VALUES
(1, 1, 2, 'readonly'),
(2, 2, 2, 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE IF NOT EXISTS `submissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `guest_count` tinyint(3) unsigned NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `guest_list_party_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `submissions_guest_list_party_id_index` (`guest_list_party_id`),
  KEY `submissions_event_id_foreign` (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=424304 ;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`id`, `event_id`, `email`, `guest_count`, `note`, `guest_list_party_id`, `created_at`, `updated_at`) VALUES
(307341, 1, 'Ritag25@gmail.com', 3, '', 42906, '2014-07-28 22:58:08', '0000-00-00 00:00:00'),
(310262, 1, 'Adriangrealtor@yahoo.com', 2, '', 42877, '2014-07-30 00:51:34', '0000-00-00 00:00:00'),
(330255, 1, 'sjamarai@mflex.com', 1, 'Bobby jamarai\r\nKawalpreet Kaur Jamarai and kids\r\nSimmerjit Jamarai\r\nPreety Jamarai and kids', 96538, '2014-08-07 10:42:11', '0000-00-00 00:00:00'),
(330335, 1, 'baker733@sbcglobal.net', 2, '', 42953, '2014-08-07 11:20:37', '0000-00-00 00:00:00'),
(333652, 1, 'Hamalipatel625@gmail.com', 2, '', 96361, '2014-08-08 19:46:31', '0000-00-00 00:00:00'),
(339264, 1, 'renu.c.multani@gmail.com', 2, '', 42867, '2014-08-11 16:41:13', '0000-00-00 00:00:00'),
(348477, 1, 'mlee@cunb.com', 2, '', 42879, '2014-08-15 15:41:23', '0000-00-00 00:00:00'),
(353386, 1, 'Mvirk58@gmail.com', 2, '', 96373, '2014-08-18 10:34:20', '0000-00-00 00:00:00'),
(362450, 1, 'j.lira82@hotmail.com', 2, '', 42996, '2014-08-22 00:59:24', '0000-00-00 00:00:00'),
(366541, 1, 'Kohliarveen@gmail.com', 2, '', 42870, '2014-08-24 14:16:29', '0000-00-00 00:00:00'),
(368769, 1, 'rajendergill@gmail.com', 2, '', 42888, '2014-08-25 14:45:31', '0000-00-00 00:00:00'),
(371502, 1, 'g.kulwant@yahoo.com', 3, '', 42889, '2014-08-26 17:52:24', '0000-00-00 00:00:00'),
(373120, 1, 'GinaLMoore@gmail.com', 2, '', 96435, '2014-08-27 11:33:21', '0000-00-00 00:00:00'),
(375647, 1, 'inderjeet@aol.com', 2, '', 42896, '2014-08-28 12:24:18', '0000-00-00 00:00:00'),
(377306, 1, 'palbhullar@yahoo.com', 2, '', 96204, '2014-08-29 00:46:53', '0000-00-00 00:00:00'),
(379797, 1, 'ujsaman@yahoo.com', 2, '', 42863, '2014-08-30 13:30:29', '0000-00-00 00:00:00'),
(381016, 1, 'garhyuc@yahoo.com', 2, '', 42869, '2014-08-31 11:55:45', '0000-00-00 00:00:00'),
(382210, 1, 'robbyboparai@gmail.com', 4, '', 96537, '2014-09-01 01:33:05', '0000-00-00 00:00:00'),
(383096, 1, 'calijattigrl@aol.com', 3, 'Surname was misspelled on wedding invitation.  Correct spelling is Wahla.  \r\nThank you kindly.\r\nRegards Wahla family. .', 96531, '2014-09-01 13:38:12', '0000-00-00 00:00:00'),
(389775, 1, 'Nick.Vermani@yahoo.com', 4, '', 42860, '2014-09-03 21:41:35', '0000-00-00 00:00:00'),
(392334, 1, 'kidslandacademy@gmail.com', 2, '', 42871, '2014-09-04 22:42:43', '0000-00-00 00:00:00'),
(395896, 1, 'Jsandhu@yahoo.com', 4, '', 42872, '2014-09-06 23:07:51', '0000-00-00 00:00:00'),
(396385, 1, 'aval1809@gmail.com', 1, '', 42874, '2014-09-07 12:02:04', '0000-00-00 00:00:00'),
(396492, 1, 'RSIBIA7@GMAIL.COM', 2, '', 42861, '2014-09-07 13:09:46', '0000-00-00 00:00:00'),
(396532, 1, 'Rranjit60@yahoo.com', 4, '', 42818, '2014-09-07 13:27:48', '0000-00-00 00:00:00'),
(396647, 1, 'Manekashewa@gmail.com', 2, '', 42876, '2014-09-07 14:33:51', '0000-00-00 00:00:00'),
(396653, 1, 'liraa25@yahoo.com', 2, '', 96376, '2014-09-07 14:35:51', '0000-00-00 00:00:00'),
(396961, 1, 'inder70@hotmail.com', 4, 'gurbaksh kaur sangha', 42838, '2014-09-07 16:45:47', '0000-00-00 00:00:00'),
(396997, 1, 'sunitabagga@yahoo.com', 5, 'We will out of town on Path day.\r\n\r\nLadies sangeet = 2 people\r\nChunni = 5 people\r\nWedding = 2 people', 127228, '2014-09-07 17:09:27', '0000-00-00 00:00:00'),
(397001, 1, 'dotgirl3@gmail.com', 2, '', 42929, '2014-09-07 17:13:33', '0000-00-00 00:00:00'),
(397002, 1, 'mandeepsandhu1987@yahoo.com', 5, '', 42924, '2014-09-07 17:15:32', '0000-00-00 00:00:00'),
(397173, 1, 'Johnny_si@yahoo.com', 2, 'We are six adult and two kids\r\n', 97224, '2014-09-07 18:35:07', '0000-00-00 00:00:00'),
(397270, 1, 'Drravneet@yahoo.com', 2, 'Gurpreet Singh and Dr Ravneet kaur Singh ', 42866, '2014-09-07 19:17:00', '0000-00-00 00:00:00'),
(397596, 1, 'atsahib@gmail.com', 2, '', 96374, '2014-09-07 21:16:26', '0000-00-00 00:00:00'),
(397662, 1, 'shinder76@yahoo.com', 3, '', 42862, '2014-09-07 21:54:30', '0000-00-00 00:00:00'),
(397877, 1, 'jszira@gmail.com', 3, '', 42926, '2014-09-08 01:57:21', '0000-00-00 00:00:00'),
(399401, 1, 'Gomezwb@sce.com', 2, '', 42873, '2014-09-08 16:13:50', '0000-00-00 00:00:00'),
(399723, 1, 'Jkaur15@yahoo.com', 2, '2 people \r\nShinder Kaur\r\nAnil Malhi ', 42886, '2014-09-08 18:31:56', '0000-00-00 00:00:00'),
(404977, 1, 'Karantung@gmail.com', 2, '', 42909, '2014-09-10 18:45:30', '0000-00-00 00:00:00'),
(406117, 1, 'Multaniod@yahoo.com', 2, '', 42868, '2014-09-11 09:46:37', '0000-00-00 00:00:00'),
(407269, 1, 'beckyandjesse@live.com', 4, '', 97223, '2014-09-11 17:08:45', '0000-00-00 00:00:00'),
(410919, 1, 'ssinghbhs@gmail.com', 1, 'Please seat me next my Shangara Singh and Family', 42895, '2014-09-13 15:07:25', '0000-00-00 00:00:00'),
(410924, 1, 'Y2kkaur@aol.com', 4, '', 42789, '2014-09-13 15:10:25', '0000-00-00 00:00:00'),
(410928, 1, 'balibittu@live.com', 2, '', 42835, '2014-09-13 15:13:53', '0000-00-00 00:00:00'),
(410968, 1, 'Sukhdeep830@yahoo.com', 4, 'We will confirm are event attendance once our flight is confirmed.', 132925, '2014-09-13 15:29:39', '0000-00-00 00:00:00'),
(410994, 1, 'kmaninder27@yahoo.com', 4, '', 132926, '2014-09-13 15:39:58', '0000-00-00 00:00:00'),
(411012, 1, 'Kalar@noemail.com', 3, 'Need to confirm via Flight Schedule', 42834, '2014-09-13 15:48:35', '0000-00-00 00:00:00'),
(411015, 1, 'Chawla@noemail.com', 2, 'Confirm attendance upon flight confirmation.', 42859, '2014-09-13 15:51:08', '0000-00-00 00:00:00'),
(411026, 1, 'jonejaajitjoneja@aol.com', 3, '', 132927, '2014-09-13 15:59:22', '0000-00-00 00:00:00'),
(411031, 1, 'malhi@noemail.com', 2, 'Amita Malhi will be coming in place of Santosh Malhi.', 42887, '2014-09-13 16:02:03', '0000-00-00 00:00:00'),
(411036, 1, 'ASingh@noemail.com', 2, 'Sincere apologies.  Can''t not get vacation time from work.', 42890, '2014-09-13 16:03:39', '0000-00-00 00:00:00'),
(411038, 1, 'Billu@noemail.com', 2, '', 42891, '2014-09-13 16:04:32', '0000-00-00 00:00:00'),
(411071, 1, 'manmit.k.singh@gmail.com', 6, 'Sunny Ladies Sangeet (Oct 3rd) attendance needs to be confirm with his school.\r\n\r\nManmit, Aneeta and Sandeep are on standby for reception. Awaiting final guest count allowance from Goraya and also out of country guest rsvp.', 132930, '2014-09-13 16:23:05', '0000-00-00 00:00:00'),
(411109, 1, 'sekhonbaljinder@hotmail.com', 2, '', 42937, '2014-09-13 16:39:56', '0000-00-00 00:00:00'),
(411122, 1, 'kk11677@gmail.com', 4, '', 42942, '2014-09-13 16:43:57', '0000-00-00 00:00:00'),
(411132, 1, 'dhillon@noemail.com', 2, '', 42948, '2014-09-13 16:46:59', '0000-00-00 00:00:00'),
(411143, 1, 'Nabid26@yahoo.com', 2, '', 96197, '2014-09-13 16:51:14', '0000-00-00 00:00:00'),
(411475, 1, 'pakistanimade@gmail.com', 2, '', 96196, '2014-09-13 20:32:57', '0000-00-00 00:00:00'),
(411481, 1, 'amultani@noemail.com', 2, 'Will only attend the ceremony portion of Wedding and not participate in lunch due to Karva Chauth', 96198, '2014-09-13 20:35:00', '0000-00-00 00:00:00'),
(411506, 1, 'RajnBaljit@yahoo.com', 2, '', 96199, '2014-09-13 20:47:32', '0000-00-00 00:00:00'),
(411521, 1, 'ahmad_shireen@yahoo.com', 2, '', 96195, '2014-09-13 21:02:18', '0000-00-00 00:00:00'),
(411526, 1, 'Samraj.Dhillon@yahoo.ca', 5, '', 42792, '2014-09-13 21:07:25', '0000-00-00 00:00:00'),
(411704, 1, 'ssangha@noemail.com', 2, '', 96436, '2014-09-14 01:06:39', '0000-00-00 00:00:00'),
(411706, 1, 'glakhanpal@noemail.com', 2, '', 96302, '2014-09-14 01:08:06', '0000-00-00 00:00:00'),
(411707, 1, 'kang@noemail.com', 2, 'Mother in law will be coming along with one child', 96305, '2014-09-14 01:13:13', '0000-00-00 00:00:00'),
(412851, 1, 'skang@noemail.com', 4, '', 42913, '2014-09-14 18:31:20', '0000-00-00 00:00:00'),
(412860, 1, 'hsandhu@noemail.com', 4, '', 96359, '2014-09-14 18:34:34', '0000-00-00 00:00:00'),
(412864, 1, 'neelam.ghotra@laverne.edu', 3, '', 96358, '2014-09-14 18:36:02', '0000-00-00 00:00:00'),
(412879, 1, 'sonuasr23@yahoo.com', 4, '', 42794, '2014-09-14 18:42:41', '0000-00-00 00:00:00'),
(412979, 1, 'shan@noemail.com', 2, 'Full Family at Ladies Sangeet - 5 people\r\nSukhmani Paath - 2 people\r\nWedding - 3 people (Sandy or Shan)\r\nMehndi - 3 people', 42826, '2014-09-14 19:28:21', '0000-00-00 00:00:00'),
(412992, 1, 'Bmasson@noemail.com', 2, '3 People Wedding.\r\nSukhmani Sahib paath', 42828, '2014-09-14 19:33:08', '0000-00-00 00:00:00'),
(412996, 1, 'kmasson@noemail.com', 2, '3 people wedding.\r\nSukhmani Sahib paath.', 42829, '2014-09-14 19:34:09', '0000-00-00 00:00:00'),
(414454, 1, 'kdhillon@noemail.com', 3, '', 97220, '2014-09-15 10:52:56', '0000-00-00 00:00:00'),
(414456, 1, 'Hsingh@noemail.com', 2, '', 96304, '2014-09-15 10:53:57', '0000-00-00 00:00:00');

--
-- Triggers `submissions`
--
DROP TRIGGER IF EXISTS `new_submit`;
DELIMITER //
CREATE TRIGGER `new_submit` AFTER INSERT ON `submissions`
 FOR EACH ROW UPDATE statistics
SET statistics.rsvp_today = statistics.rsvp_today + 1,statistics.rsvp_all_time = statistics.rsvp_all_time +1,
statistics.rsvp_this_week = statistics.rsvp_this_week +1,
statistics.rsvp_this_month = statistics.rsvp_this_month +1,
statistics.guest_total_today = statistics.guest_total_today + NEW.guest_count, statistics.guest_total_this_week = statistics.guest_total_this_week + NEW.guest_count, statistics.guest_total_this_month = statistics.guest_total_this_month +NEW.guest_count, statistics.guest_total_all_time = statistics.guest_total_all_time + NEW.guest_count
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE IF NOT EXISTS `tables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seats_available` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tables_event_id_foreign` (`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_confirmed` tinyint(1) NOT NULL,
  `facebook_id` bigint(20) unsigned NOT NULL,
  `earnings` int(10) unsigned NOT NULL,
  `lifetime_earnings` int(10) unsigned NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stripe_active` tinyint(4) NOT NULL DEFAULT '0',
  `stripe_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_subscription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_plan` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_four` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `subscription_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `email`, `password`, `email_confirmed`, `facebook_id`, `earnings`, `lifetime_earnings`, `remember_token`, `last_login_at`, `created_at`, `updated_at`, `stripe_active`, `stripe_id`, `stripe_subscription`, `stripe_plan`, `last_four`, `trial_ends_at`, `subscription_ends_at`) VALUES
(1, 'Sanil', 'music.sanil@gmail.com', '$2y$10$IkA1sN0QuZH1dlFaTt8cleaGlN5n4EFYJiOVKLN9KXhktHA/c.Ode', 0, 0, 0, 0, 'cxGpKHNUtkuSSPh0v38dSvUPX1gNdFcuqBG1UzNWOJDyHJm5mdX71L89XoiV', '2014-10-06 12:24:22', '2014-09-19 15:25:02', '2014-10-06 17:24:22', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Ari', 'ari@rsvpify.com', '$2y$10$oQ.wnFf7qk.McYJTEYn7HOHJM3xIOuisDjXhq9seCJ.2PeUmUXpgG', 1, 0, 0, 0, '9VgkfHHTE4WHGqsCp9D8ZtRY2ZA2n4uSYEUuejXu2BzHfsmxjZBIO6oxHqTx', '2014-11-19 08:34:47', '2014-09-19 15:45:12', '2014-11-19 14:38:11', 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_expenses`
--

CREATE TABLE IF NOT EXISTS `user_expenses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `charge` int(10) unsigned NOT NULL,
  `card_last_four` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `user_expenses_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
