-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: lab7
-- ------------------------------------------------------
-- Server version	8.0.1-dmr-log

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
-- Table structure for table `publictext`
--

DROP TABLE IF EXISTS `publictext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publictext` (
  `Location` varchar(100) NOT NULL,
  `Owner` varchar(16) NOT NULL,
  `Time` datetime NOT NULL,
  PRIMARY KEY (`Location`),
  KEY `id_idx` (`Owner`),
  CONSTRAINT `id` FOREIGN KEY (`Owner`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publictext`
--

LOCK TABLES `publictext` WRITE;
/*!40000 ALTER TABLE `publictext` DISABLE KEYS */;
INSERT INTO `publictext` VALUES ('shared/admin/小米.html','admin','2017-11-13 15:12:15'),('shared/admin/小米科技.html','admin','2017-11-13 16:01:32'),('shared/admin/小米笔记本.html','admin','2017-11-13 16:27:28'),('shared/admin/新浪科技.html','admin','2017-11-13 15:12:05'),('shared/admin/新零售.html','admin','2017-11-13 15:12:10'),('shared/admin/测试.html','admin','2017-11-11 19:47:02'),('shared/yangfan/我要上船.html','yangfan','2017-11-13 15:23:19');
/*!40000 ALTER TABLE `publictext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` varchar(16) NOT NULL,
  `Password` varchar(16) NOT NULL,
  `Name` varchar(16) DEFAULT NULL,
  `Sex` int(1) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Message` varchar(140) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('00001111','00001111','bond',1,'2017-10-20','null'),('123456749','12346789','rtyui',0,'3918-01-12','45218'),('123456789','12346789',NULL,0,NULL,NULL),('admin','admin',NULL,0,NULL,NULL),('yangfan','123456',NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-13 22:49:27
