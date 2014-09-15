CREATE DATABASE  IF NOT EXISTS `mail` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mail`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: mail
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `outbox`
--

DROP TABLE IF EXISTS `outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbox` (
  `id` int(64) NOT NULL,
  `receiver` varchar(64) DEFAULT NULL,
  `sender` varchar(64) DEFAULT NULL,
  `msg` text,
  `dat` date DEFAULT NULL,
  `subject` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbox`
--

LOCK TABLES `outbox` WRITE;
/*!40000 ALTER TABLE `outbox` DISABLE KEYS */;
INSERT INTO `outbox` VALUES (2,'nakul15_2003@yahoo.com','nakuldani2012@gmail.com','Hi','2014-04-26','Hello1'),(7,'ndani@ilstu.edu','aayush.ag85@gmail.com','hkjhkjhjkkk','2014-04-28','hjkhjk'),(8,'ndani@ilstu.edu','aayush.ag85@gmail.com','hkjhkjhjkkk','2014-04-28','hjkhjk'),(9,'safafafasf','nakuldani2012@gmail.com','fafaf','2014-04-28','fafa'),(10,'aaaaaa','nakuldani2012@gmail.com','ssss','2014-04-28','sss'),(11,'aayush.ag85@gmail.com','nakuldani2012@gmail.com','kk','2014-04-28','kk'),(12,'ndani@ilstu.edu','nakuldani2012@gmail.com','Hello','2014-04-29','Hi'),(13,'nakuldani2012@gmail.com','nakuldani2012@gmail.com','Hi','2014-04-30','Heloo'),(15,'ndani@ilstu.edu','nakuldani2012@gmail.com','Hi','2014-05-01','Hi');
/*!40000 ALTER TABLE `outbox` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-01 19:46:55
