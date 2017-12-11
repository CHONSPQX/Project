CREATE DATABASE  IF NOT EXISTS `project` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `project`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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
INSERT INTO `publictext` VALUES ('shared/admin/ROS.html','admin','2017-12-11 21:40:25'),('shared/asd/炒股.html','asd','2017-12-11 21:42:14'),('shared/mamba/1234.html','mamba','2017-12-11 18:20:18'),('shared/yangfan/杨帆.html','yangfan','2017-12-11 21:53:50'),('shared/zhouxi/四风.html','zhouxi','2017-12-11 22:27:00'),('shared/zhouxi/谷歌新闻.html','zhouxi','2017-12-11 22:27:04'),('shared/zhouxi/软件工程.html','zhouxi','2017-12-11 22:27:09'),('shared/zx/Data.html','zx','2017-12-11 21:51:57'),('shared/zx/doc.html','zx','2017-12-11 18:29:44');
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
  `UserEmail` varchar(45) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','Qq1','泡泡堂',1,'2017-12-28','江山如此多娇','1234590@qq.com','哈尔滨'),('asd','Aa1',NULL,0,NULL,NULL,'1366117617@qq.com',NULL),('hello','Qwe123',NULL,0,NULL,NULL,'1345789@qq.com',NULL),('mamba','Aa1',NULL,0,NULL,NULL,'1366117618@qq.com',NULL),('qiaoq','Qq1',NULL,0,NULL,NULL,'79257842@qq.com',NULL),('yangfan','Yf010333',NULL,0,NULL,NULL,'1401997998@qq.com',NULL),('yangyang','Qq1',NULL,0,NULL,NULL,'457382@qq.com',NULL),('zhou','Au87bt','yangfan',0,'2017-12-06','nvde','1235435345@qq.com','巴拉巴拉'),('zhoux','Qq1',NULL,0,NULL,NULL,'123234@qq.com',NULL),('zhouxi','Au87bt','zhouxiong',0,'2017-09-14','asdfasdf','12342134@qq.com','asdiugfasdf'),('zx','Aa1',NULL,0,NULL,NULL,'1286052098@qq.com',NULL),('zxc','Aa1',NULL,0,NULL,NULL,'1266117617@qq.com',NULL),('zxcv','Aa1',NULL,0,NULL,NULL,'1166117617@qq.com',NULL),('zz','Aa1',NULL,0,NULL,NULL,'1112@qq.com',NULL);
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

-- Dump completed on 2017-12-11 23:00:28
