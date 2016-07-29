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
-- Create schema test
--

CREATE DATABASE IF NOT EXISTS test;
USE test;

--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `contactNo` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY  USING BTREE (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`id`,`Name`,`Address`,`contactNo`,`Email`) VALUES 
 (1,'johnny','bkk','123456','111@hot.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


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




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
