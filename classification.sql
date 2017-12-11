CREATE DATABASE  IF NOT EXISTS `classification` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `classification`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: classification
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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'学习','大三','软件',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asd`
--

DROP TABLE IF EXISTS `asd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asd`
--

LOCK TABLES `asd` WRITE;
/*!40000 ALTER TABLE `asd` DISABLE KEYS */;
/*!40000 ALTER TABLE `asd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hello`
--

DROP TABLE IF EXISTS `hello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hello` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hello`
--

LOCK TABLES `hello` WRITE;
/*!40000 ALTER TABLE `hello` DISABLE KEYS */;
/*!40000 ALTER TABLE `hello` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mamba`
--

DROP TABLE IF EXISTS `mamba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mamba` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mamba`
--

LOCK TABLES `mamba` WRITE;
/*!40000 ALTER TABLE `mamba` DISABLE KEYS */;
/*!40000 ALTER TABLE `mamba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiaoq`
--

DROP TABLE IF EXISTS `qiaoq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qiaoq` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiaoq`
--

LOCK TABLES `qiaoq` WRITE;
/*!40000 ALTER TABLE `qiaoq` DISABLE KEYS */;
INSERT INTO `qiaoq` VALUES (1,'学习','大三','数据库',1);
/*!40000 ALTER TABLE `qiaoq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yangfan`
--

DROP TABLE IF EXISTS `yangfan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yangfan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yangfan`
--

LOCK TABLES `yangfan` WRITE;
/*!40000 ALTER TABLE `yangfan` DISABLE KEYS */;
INSERT INTO `yangfan` VALUES (1,'学习','大三上学期','考试课',1);
/*!40000 ALTER TABLE `yangfan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yangyang`
--

DROP TABLE IF EXISTS `yangyang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yangyang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yangyang`
--

LOCK TABLES `yangyang` WRITE;
/*!40000 ALTER TABLE `yangyang` DISABLE KEYS */;
/*!40000 ALTER TABLE `yangyang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhou`
--

DROP TABLE IF EXISTS `zhou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhou` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhou`
--

LOCK TABLES `zhou` WRITE;
/*!40000 ALTER TABLE `zhou` DISABLE KEYS */;
/*!40000 ALTER TABLE `zhou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhoux`
--

DROP TABLE IF EXISTS `zhoux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhoux` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhoux`
--

LOCK TABLES `zhoux` WRITE;
/*!40000 ALTER TABLE `zhoux` DISABLE KEYS */;
/*!40000 ALTER TABLE `zhoux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhouxi`
--

DROP TABLE IF EXISTS `zhouxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhouxi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhouxi`
--

LOCK TABLES `zhouxi` WRITE;
/*!40000 ALTER TABLE `zhouxi` DISABLE KEYS */;
INSERT INTO `zhouxi` VALUES (3,'社会','新闻','国际',1),(5,'学习','大三','软件工程',1),(6,'国家','新闻','政治',1),(7,'学习','大三','数据分析',1);
/*!40000 ALTER TABLE `zhouxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zx`
--

DROP TABLE IF EXISTS `zx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zx`
--

LOCK TABLES `zx` WRITE;
/*!40000 ALTER TABLE `zx` DISABLE KEYS */;
/*!40000 ALTER TABLE `zx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zxc`
--

DROP TABLE IF EXISTS `zxc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zxc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zxc`
--

LOCK TABLES `zxc` WRITE;
/*!40000 ALTER TABLE `zxc` DISABLE KEYS */;
/*!40000 ALTER TABLE `zxc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zxcv`
--

DROP TABLE IF EXISTS `zxcv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zxcv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zxcv`
--

LOCK TABLES `zxcv` WRITE;
/*!40000 ALTER TABLE `zxcv` DISABLE KEYS */;
/*!40000 ALTER TABLE `zxcv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zz`
--

DROP TABLE IF EXISTS `zz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zz` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secondclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thirdclass` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zz`
--

LOCK TABLES `zz` WRITE;
/*!40000 ALTER TABLE `zz` DISABLE KEYS */;
/*!40000 ALTER TABLE `zz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-11 22:59:38
