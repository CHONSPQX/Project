CREATE DATABASE  IF NOT EXISTS `comment` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `comment`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: comment
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
-- Table structure for table `shared/admin/ROS`
--

DROP TABLE IF EXISTS `shared/admin/ROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/admin/ROS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/admin/ROS`
--

LOCK TABLES `shared/admin/ROS` WRITE;
/*!40000 ALTER TABLE `shared/admin/ROS` DISABLE KEYS */;
INSERT INTO `shared/admin/ROS` VALUES (1,'zhouxi','阿斯蒂芬','2017-12-11 22:30:42');
/*!40000 ALTER TABLE `shared/admin/ROS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/asd/炒股`
--

DROP TABLE IF EXISTS `shared/asd/炒股`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/asd/炒股` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/asd/炒股`
--

LOCK TABLES `shared/asd/炒股` WRITE;
/*!40000 ALTER TABLE `shared/asd/炒股` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/asd/炒股` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/mamba/1234`
--

DROP TABLE IF EXISTS `shared/mamba/1234`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/mamba/1234` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/mamba/1234`
--

LOCK TABLES `shared/mamba/1234` WRITE;
/*!40000 ALTER TABLE `shared/mamba/1234` DISABLE KEYS */;
INSERT INTO `shared/mamba/1234` VALUES (1,'zx','你好','2017-12-11 18:37:40'),(2,'zx','mdzz','2017-12-11 18:38:20'),(3,'zhouxi','不错，很好，值得一用','2017-12-11 22:28:51');
/*!40000 ALTER TABLE `shared/mamba/1234` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/yangfan/杨帆`
--

DROP TABLE IF EXISTS `shared/yangfan/杨帆`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/yangfan/杨帆` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/yangfan/杨帆`
--

LOCK TABLES `shared/yangfan/杨帆` WRITE;
/*!40000 ALTER TABLE `shared/yangfan/杨帆` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/yangfan/杨帆` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/zhouxi/四风`
--

DROP TABLE IF EXISTS `shared/zhouxi/四风`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/zhouxi/四风` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/zhouxi/四风`
--

LOCK TABLES `shared/zhouxi/四风` WRITE;
/*!40000 ALTER TABLE `shared/zhouxi/四风` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/zhouxi/四风` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/zhouxi/谷歌新闻`
--

DROP TABLE IF EXISTS `shared/zhouxi/谷歌新闻`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/zhouxi/谷歌新闻` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/zhouxi/谷歌新闻`
--

LOCK TABLES `shared/zhouxi/谷歌新闻` WRITE;
/*!40000 ALTER TABLE `shared/zhouxi/谷歌新闻` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/zhouxi/谷歌新闻` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/zhouxi/软件工程`
--

DROP TABLE IF EXISTS `shared/zhouxi/软件工程`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/zhouxi/软件工程` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/zhouxi/软件工程`
--

LOCK TABLES `shared/zhouxi/软件工程` WRITE;
/*!40000 ALTER TABLE `shared/zhouxi/软件工程` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/zhouxi/软件工程` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/zx/Data`
--

DROP TABLE IF EXISTS `shared/zx/Data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/zx/Data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/zx/Data`
--

LOCK TABLES `shared/zx/Data` WRITE;
/*!40000 ALTER TABLE `shared/zx/Data` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/zx/Data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/zx/doc`
--

DROP TABLE IF EXISTS `shared/zx/doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/zx/doc` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/zx/doc`
--

LOCK TABLES `shared/zx/doc` WRITE;
/*!40000 ALTER TABLE `shared/zx/doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/zx/doc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-11 23:00:03
