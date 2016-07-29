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
-- Create schema link
--

CREATE DATABASE IF NOT EXISTS link;
USE link;

--
-- Definition of table `link`.`data`
--

DROP TABLE IF EXISTS `link`.`data`;
CREATE TABLE  `link`.`data` (
  `no` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `passw` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY  (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `link`.`data`
--

/*!40000 ALTER TABLE `data` DISABLE KEYS */;
INSERT INTO `link`.`data` (`no`,`username`,`passw`,`name`) VALUES 
 (1,'user','12345','admin'),
 (2,'lee','55555','ling'),
 (3,'knight','753159','doll'),
 (4,'jimmy','111222','kenny');
/*!40000 ALTER TABLE `data` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
