-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: comment
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
-- Table structure for table `shared/admin/小米`
--

DROP TABLE IF EXISTS `shared/admin/小米`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/admin/小米` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/admin/小米`
--

LOCK TABLES `shared/admin/小米` WRITE;
/*!40000 ALTER TABLE `shared/admin/小米` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/admin/小米` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/admin/小米科技`
--

DROP TABLE IF EXISTS `shared/admin/小米科技`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/admin/小米科技` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/admin/小米科技`
--

LOCK TABLES `shared/admin/小米科技` WRITE;
/*!40000 ALTER TABLE `shared/admin/小米科技` DISABLE KEYS */;
INSERT INTO `shared/admin/小米科技` VALUES (1,'admin','顶','2017-11-13 22:40:58');
/*!40000 ALTER TABLE `shared/admin/小米科技` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/admin/小米笔记本`
--

DROP TABLE IF EXISTS `shared/admin/小米笔记本`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/admin/小米笔记本` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/admin/小米笔记本`
--

LOCK TABLES `shared/admin/小米笔记本` WRITE;
/*!40000 ALTER TABLE `shared/admin/小米笔记本` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/admin/小米笔记本` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/admin/新浪科技`
--

DROP TABLE IF EXISTS `shared/admin/新浪科技`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/admin/新浪科技` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/admin/新浪科技`
--

LOCK TABLES `shared/admin/新浪科技` WRITE;
/*!40000 ALTER TABLE `shared/admin/新浪科技` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/admin/新浪科技` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/admin/新零售`
--

DROP TABLE IF EXISTS `shared/admin/新零售`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/admin/新零售` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/admin/新零售`
--

LOCK TABLES `shared/admin/新零售` WRITE;
/*!40000 ALTER TABLE `shared/admin/新零售` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared/admin/新零售` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/admin/测试`
--

DROP TABLE IF EXISTS `shared/admin/测试`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/admin/测试` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/admin/测试`
--

LOCK TABLES `shared/admin/测试` WRITE;
/*!40000 ALTER TABLE `shared/admin/测试` DISABLE KEYS */;
INSERT INTO `shared/admin/测试` VALUES (1,'admin','好闻','2017-11-12 12:57:32');
/*!40000 ALTER TABLE `shared/admin/测试` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared/yangfan/我要上船`
--

DROP TABLE IF EXISTS `shared/yangfan/我要上船`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared/yangfan/我要上船` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared/yangfan/我要上船`
--

LOCK TABLES `shared/yangfan/我要上船` WRITE;
/*!40000 ALTER TABLE `shared/yangfan/我要上船` DISABLE KEYS */;
INSERT INTO `shared/yangfan/我要上船` VALUES (1,'yangfan','傻吊','2017-11-13 15:23:45');
/*!40000 ALTER TABLE `shared/yangfan/我要上船` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(16) DEFAULT NULL,
  `context` varchar(140) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-13 22:48:46
