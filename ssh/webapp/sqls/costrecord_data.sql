-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ssh
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_costrecord`
--

DROP TABLE IF EXISTS `t_costrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float NOT NULL,
  `costFor` varchar(255) DEFAULT NULL,
  `costdate` datetime DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costrecord`
--

LOCK TABLES `t_costrecord` WRITE;
/*!40000 ALTER TABLE `t_costrecord` DISABLE KEYS */;
INSERT INTO `t_costrecord` VALUES (5,10,'买菜','2015-11-04 00:00:00','买菜',0,'2',NULL,NULL),(6,40,'买菜','2015-11-05 00:00:00','买菜',0,'2',NULL,NULL),(7,32,'买菜','2015-11-04 00:00:00','买菜',0,'1',NULL,NULL),(8,250,'饮水机','2015-11-07 00:00:00','饮水机饮水机饮水机',0,'2',NULL,NULL),(9,100,'买菜+买米','2015-11-07 00:00:00','菜+20斤米',0,'1',NULL,NULL),(10,37,'买菜','2015-11-08 00:00:00','买菜',0,'2',NULL,NULL);
/*!40000 ALTER TABLE `t_costrecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-09 16:30:55
