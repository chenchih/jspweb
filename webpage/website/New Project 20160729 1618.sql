-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.24a-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema webapp
--

CREATE DATABASE IF NOT EXISTS webapp;
USE webapp;

--
-- Definition of table `link`
--

DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `link` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `link`
--

/*!40000 ALTER TABLE `link` DISABLE KEYS */;
INSERT INTO `link` (`id`,`link`) VALUES 
 (2,'www.google.com');
/*!40000 ALTER TABLE `link` ENABLE KEYS */;


--
-- Definition of table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(45) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `year` varchar(45) NOT NULL,
  `month` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `member`
--

/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`id`,`userid`,`pwd`,`name`,`gender`,`year`,`month`,`date`,`address`,`email`,`phone`) VALUES 
 ('1','hot','bk','111','111@hot.com','','','','','',''),
 ('2016-07-28 18:09:47','jack','123456','jack','1','1950','1','3','ee','jacklee26@gmail.com','111111111');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


--
-- Definition of table `new_vocab`
--

DROP TABLE IF EXISTS `new_vocab`;
CREATE TABLE `new_vocab` (
  `no` int(100) unsigned NOT NULL auto_increment,
  `id` varchar(45) NOT NULL,
  `term_eng` varchar(45) NOT NULL,
  `term_chi` text NOT NULL,
  `type` varchar(45) NOT NULL,
  `note` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `new_vocab`
--

/*!40000 ALTER TABLE `new_vocab` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_vocab` ENABLE KEYS */;


--
-- Definition of table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `no` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `note` varchar(45) NOT NULL,
  `id` int(100) unsigned NOT NULL auto_increment,
  `edit_time` varchar(45) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `note`
--

/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` (`no`,`type`,`subject`,`note`,`id`,`edit_time`) VALUES 
 ('2016-07-29 11:06:10','busienss','244','reference: 222244\r\n	  ',2,''),
 ('2016-07-29 11:10:42','busienss','www','reference:  sssss',3,'2016-07-29 13:22:17');
/*!40000 ALTER TABLE `note` ENABLE KEYS */;


--
-- Definition of table `terms`
--

DROP TABLE IF EXISTS `terms`;
CREATE TABLE `terms` (
  `term1` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `term_chi` varchar(45) NOT NULL,
  `id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`term1`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` (`term1`,`description`,`term_chi`,`id`) VALUES 
 ('Asymmetric Encryption','test','11ww',1),
 ('Authentication','sss','sdxc',2),
 ('Authentication','d','s',3);
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;


--
-- Definition of table `vocab`
--

DROP TABLE IF EXISTS `vocab`;
CREATE TABLE `vocab` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `term_eng` varchar(45) NOT NULL,
  `term_chi` text NOT NULL,
  `type` varchar(45) NOT NULL,
  `note` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vocab`
--

/*!40000 ALTER TABLE `vocab` DISABLE KEYS */;
/*!40000 ALTER TABLE `vocab` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
