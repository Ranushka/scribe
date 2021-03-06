-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 10, 2015 at 07:41 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scribylog`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_group`
--

CREATE TABLE IF NOT EXISTS `tbl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  `enable` char(1) DEFAULT '1' COMMENT '1 =  Enable,\n0 =Disbale',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_group`
--

INSERT INTO `tbl_group` (`id`, `group_name`, `enable`, `created`, `modified`) VALUES
(1, 'grop1', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting`
--

CREATE TABLE IF NOT EXISTS `tbl_meeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `sub_title` varchar(100) DEFAULT NULL,
  `note` varchar(255) DEFAULT 'none',
  `date` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `conducted_by` int(11) NOT NULL,
  `held_status` int(11) DEFAULT '1',
  `enable` char(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_meeting`
--

INSERT INTO `tbl_meeting` (`id`, `title`, `sub_title`, `note`, `date`, `end_time`, `conducted_by`, `held_status`, `enable`, `created`, `modified`) VALUES
(1, NULL, NULL, 'none', '2015-06-09 08:00:00', '2015-06-09 09:00:00', 1, 3, '1', NULL, NULL),
(2, NULL, NULL, 'none', '2015-06-09 00:00:00', NULL, 2, 1, '1', '2015-06-09 20:22:24', '2015-06-09 20:22:24'),
(3, NULL, NULL, 'none', '2015-06-09 00:00:00', NULL, 2, 1, '1', '2015-06-09 20:22:36', '2015-06-09 20:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting_for_user`
--

CREATE TABLE IF NOT EXISTS `tbl_meeting_for_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `meeting_id` int(11) NOT NULL,
  `invited_guest` char(1) DEFAULT '1' COMMENT '1=Invited, 2=Guest',
  `participatation` char(1) DEFAULT '1' COMMENT '1=invited, 2=Came, 3=Not come',
  `enable` char(1) DEFAULT '1' COMMENT '1=Pending, 2=Came, 3=Guest',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_meeting_for_user`
--

INSERT INTO `tbl_meeting_for_user` (`id`, `user_id`, `meeting_id`, `invited_guest`, `participatation`, `enable`, `created`, `modified`) VALUES
(1, 1, 1, '1', '1', '1', NULL, NULL),
(2, 2, 1, '1', '1', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting_goals`
--

CREATE TABLE IF NOT EXISTS `tbl_meeting_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goal` varchar(45) NOT NULL,
  `by` int(11) NOT NULL DEFAULT '0',
  `meeting_id` int(11) NOT NULL DEFAULT '0',
  `enable` char(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_meeting_goals`
--

INSERT INTO `tbl_meeting_goals` (`id`, `goal`, `by`, `meeting_id`, `enable`, `created`, `modified`) VALUES
(1, 'goal1', 0, 0, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting_held_status`
--

CREATE TABLE IF NOT EXISTS `tbl_meeting_held_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `img` varchar(100) DEFAULT 'default.jpg',
  `enable` char(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_meeting_held_status`
--

INSERT INTO `tbl_meeting_held_status` (`id`, `name`, `img`, `enable`, `created`, `modified`) VALUES
(1, 'Planed', 'default.jpg', '1', NULL, NULL),
(2, 'On going', 'default.jpg', '1', NULL, NULL),
(3, 'Held', 'default.jpg', '1', NULL, NULL),
(4, 'Cancel', 'default.jpg', '1', NULL, NULL),
(5, 'Postpond', 'default.jpg', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_meeting_tag`
--

CREATE TABLE IF NOT EXISTS `tbl_meeting_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `enable` char(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_meeting_tag`
--

INSERT INTO `tbl_meeting_tag` (`id`, `meeting_id`, `tag_id`, `enable`, `created`, `modified`) VALUES
(1, 1, 1, '1', NULL, NULL),
(2, 1, 2, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_option`
--

CREATE TABLE IF NOT EXISTS `tbl_option` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `option_name` text,
  `variable_name` text,
  `option_value` text,
  `scale` varchar(100) DEFAULT NULL,
  `option_type` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_option`
--

INSERT INTO `tbl_option` (`id`, `option_name`, `variable_name`, `option_value`, `scale`, `option_type`, `created`, `modified`) VALUES
(1, 'Site name', 'site_name', 'Mad framework', '13', 'string', '2014-10-10 20:18:05', '2014-10-10 20:18:14'),
(2, 'Address', 'address1', 'Kirulaponne', '11', '1', '2014-10-10 20:20:49', '2014-10-10 20:20:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tags`
--

CREATE TABLE IF NOT EXISTS `tbl_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) NOT NULL,
  `enable` char(1) DEFAULT '1',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_tags`
--

INSERT INTO `tbl_tags` (`id`, `tag`, `enable`, `created`, `modified`) VALUES
(1, 'tag1', '1', NULL, NULL),
(2, 'tag2', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(250) NOT NULL,
  `img` varchar(45) DEFAULT 'default.jpg',
  `user_type` int(11) DEFAULT '1' COMMENT '0=admin, 1=''member'',',
  `enable` char(1) DEFAULT '1' COMMENT '1 =  Enable,\n0 =Disbale',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `fname`, `lname`, `email`, `password`, `img`, `user_type`, `enable`, `created`, `modified`) VALUES
(2, 'fuser1', 'luser2', 'user1@gmail.com', '47bce5c74f589f4867dbd57e9ca9f8080123456789hello', 'default.jpg', 1, '1', NULL, NULL),
(3, 'fuser3', 'luser3', 'user3@gmail.com', '47bce5c74f589f4867dbd57e9ca9f8080123456789hello', 'default.jpg', 1, '1', NULL, NULL),
(4, 'admin_F', 'admin_L', 'admin@scribylog.com', '47bce5c74f589f4867dbd57e9ca9f8080123456789hello', 'default.jpg', 0, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_group`
--

CREATE TABLE IF NOT EXISTS `tbl_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `enable` char(1) DEFAULT '1' COMMENT '1 =  Enable,\n0 =Disbale',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;