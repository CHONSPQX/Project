CREATE DATABASE  IF NOT EXISTS `filerecord` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `filerecord`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: filerecord
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
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('a.html','工程','学习','大三','软件','admin/a.html','2017-12-11','admin','3'),('Google.html',NULL,NULL,NULL,NULL,'admin/Google.html','2017-12-11','admin','0'),('jwc.html',NULL,NULL,NULL,NULL,'admin/jwc.html','2017-12-11','admin','0'),('ROS.html',NULL,NULL,NULL,NULL,'admin/ROS.html','2017-12-11','admin','0'),('wangti.html',NULL,NULL,NULL,NULL,'admin/wangti.html','2017-12-11','admin','0'),('ya.html',NULL,NULL,NULL,NULL,'admin/ya.html','2017-12-11','admin','0'),('哔哩哔哩.html',NULL,NULL,NULL,NULL,'admin/哔哩哔哩.html','2017-12-11','admin','0'),('播放器.html',NULL,NULL,NULL,NULL,'admin/播放器.html','2017-12-11','admin','0'),('镇长.html',NULL,NULL,NULL,NULL,'admin/镇长.html','2017-12-11','admin','0'),('阿里云.html',NULL,NULL,NULL,NULL,'admin/阿里云.html','2017-12-11','admin','0'),('马云.html',NULL,NULL,NULL,NULL,'admin/马云.html','2017-12-11','admin','0');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asd`
--

DROP TABLE IF EXISTS `asd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asd` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asd`
--

LOCK TABLES `asd` WRITE;
/*!40000 ALTER TABLE `asd` DISABLE KEYS */;
INSERT INTO `asd` VALUES ('炒股.html',NULL,NULL,NULL,NULL,'asd/炒股.html','2017-12-11','asd','0');
/*!40000 ALTER TABLE `asd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hello`
--

DROP TABLE IF EXISTS `hello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hello` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hello`
--

LOCK TABLES `hello` WRITE;
/*!40000 ALTER TABLE `hello` DISABLE KEYS */;
INSERT INTO `hello` VALUES ('软件工程要求.html',NULL,NULL,NULL,NULL,'hello/软件工程要求.html','2017-12-11','hello','0');
/*!40000 ALTER TABLE `hello` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mamba`
--

DROP TABLE IF EXISTS `mamba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mamba` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mamba`
--

LOCK TABLES `mamba` WRITE;
/*!40000 ALTER TABLE `mamba` DISABLE KEYS */;
INSERT INTO `mamba` VALUES ('1234.html',NULL,NULL,NULL,NULL,'mamba/1234.html','2017-12-11','mamba','0'),('234.html',NULL,NULL,NULL,NULL,'mamba/234.html','2017-12-11','mamba','0');
/*!40000 ALTER TABLE `mamba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qiaoq`
--

DROP TABLE IF EXISTS `qiaoq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qiaoq` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qiaoq`
--

LOCK TABLES `qiaoq` WRITE;
/*!40000 ALTER TABLE `qiaoq` DISABLE KEYS */;
INSERT INTO `qiaoq` VALUES ('mysql.html','MySQL','学习','大三','数据库','qiaoq/mysql.html','2017-12-11','qiaoq','3'),('基础知识.html',NULL,NULL,NULL,NULL,'qiaoq/基础知识.html','2017-12-11','qiaoq','0');
/*!40000 ALTER TABLE `qiaoq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yangfan`
--

DROP TABLE IF EXISTS `yangfan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yangfan` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yangfan`
--

LOCK TABLES `yangfan` WRITE;
/*!40000 ALTER TABLE `yangfan` DISABLE KEYS */;
INSERT INTO `yangfan` VALUES ('杨帆.html',NULL,NULL,NULL,NULL,'yangfan/杨帆.html','2017-12-11','yangfan','0'),('软件工程.html','软件工程','学习','大三上学期','考试课','yangfan/软件工程.html','2017-12-11','yangfan','3');
/*!40000 ALTER TABLE `yangfan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yangyang`
--

DROP TABLE IF EXISTS `yangyang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yangyang` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yangyang`
--

LOCK TABLES `yangyang` WRITE;
/*!40000 ALTER TABLE `yangyang` DISABLE KEYS */;
INSERT INTO `yangyang` VALUES ('软件工程.html',NULL,NULL,NULL,NULL,'yangyang/软件工程.html','2017-12-11','yangyang','0');
/*!40000 ALTER TABLE `yangyang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhou`
--

DROP TABLE IF EXISTS `zhou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhou` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhou`
--

LOCK TABLES `zhou` WRITE;
/*!40000 ALTER TABLE `zhou` DISABLE KEYS */;
INSERT INTO `zhou` VALUES ('国际新闻.html',NULL,NULL,NULL,NULL,'zhou/国际新闻.html','2017-12-11','zhou','0'),('图片.html',NULL,NULL,NULL,NULL,'zhou/图片.html','2017-12-11','zhou','0'),('数据说明.html',NULL,NULL,NULL,NULL,'zhou/数据说明.html','2017-12-11','zhou','0'),('社会新闻.html',NULL,NULL,NULL,NULL,'zhou/社会新闻.html','2017-12-11','zhou','0'),('软件工程.html',NULL,NULL,NULL,NULL,'zhou/软件工程.html','2017-12-11','zhou','0');
/*!40000 ALTER TABLE `zhou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhoux`
--

DROP TABLE IF EXISTS `zhoux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhoux` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhoux`
--

LOCK TABLES `zhoux` WRITE;
/*!40000 ALTER TABLE `zhoux` DISABLE KEYS */;
INSERT INTO `zhoux` VALUES ('mysql.html',NULL,NULL,NULL,NULL,'zhoux/mysql.html','2017-12-11','zhoux','0');
/*!40000 ALTER TABLE `zhoux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zhouxi`
--

DROP TABLE IF EXISTS `zhouxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zhouxi` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zhouxi`
--

LOCK TABLES `zhouxi` WRITE;
/*!40000 ALTER TABLE `zhouxi` DISABLE KEYS */;
INSERT INTO `zhouxi` VALUES ('四风.html','习大大','国家','新闻','政治','zhouxi/四风.html','2017-12-11','zhouxi','3'),('数据说明.html','文本情感','学习','大三','数据分析','zhouxi/数据说明.html','2017-12-11','zhouxi','3'),('谷歌新闻.html','谷歌','社会','新闻','国际','zhouxi/谷歌新闻.html','2017-12-11','zhouxi','3'),('软件工程.html','实验要求','学习','大三','软件工程','zhouxi/软件工程.html','2017-12-11','zhouxi','3');
/*!40000 ALTER TABLE `zhouxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zx`
--

DROP TABLE IF EXISTS `zx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zx` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zx`
--

LOCK TABLES `zx` WRITE;
/*!40000 ALTER TABLE `zx` DISABLE KEYS */;
INSERT INTO `zx` VALUES ('baidu.html',NULL,NULL,NULL,NULL,'zx/baidu.html','2017-12-11','zx','0'),('cx.html',NULL,NULL,NULL,NULL,'zx/cx.html','2017-12-11','zx','0'),('Data.html',NULL,NULL,NULL,NULL,'zx/Data.html','2017-12-11','zx','0'),('doc.html',NULL,NULL,NULL,NULL,'zx/doc.html','2017-12-11','zx','0'),('google.html',NULL,NULL,NULL,NULL,'zx/google.html','2017-12-11','zx','0'),('zx.html',NULL,NULL,NULL,NULL,'zx/zx.html','2017-12-11','zx','0');
/*!40000 ALTER TABLE `zx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zxc`
--

DROP TABLE IF EXISTS `zxc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zxc` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zxc`
--

LOCK TABLES `zxc` WRITE;
/*!40000 ALTER TABLE `zxc` DISABLE KEYS */;
INSERT INTO `zxc` VALUES ('12345.html',NULL,NULL,NULL,NULL,'zxc/12345.html','2017-12-11','zxc','0');
/*!40000 ALTER TABLE `zxc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zxcv`
--

DROP TABLE IF EXISTS `zxcv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zxcv` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zxcv`
--

LOCK TABLES `zxcv` WRITE;
/*!40000 ALTER TABLE `zxcv` DISABLE KEYS */;
INSERT INTO `zxcv` VALUES ('123456.html',NULL,NULL,NULL,NULL,'zxcv/123456.html','2017-12-11','zxcv','0'),('23456.html',NULL,NULL,NULL,NULL,'zxcv/23456.html','2017-12-11','zxcv','0');
/*!40000 ALTER TABLE `zxcv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zz`
--

DROP TABLE IF EXISTS `zz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zz` (
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `time` date DEFAULT NULL,
  `owner` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `layer` varchar(10) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zz`
--

LOCK TABLES `zz` WRITE;
/*!40000 ALTER TABLE `zz` DISABLE KEYS */;
INSERT INTO `zz` VALUES ('1.html',NULL,NULL,NULL,NULL,'zz/1.html','2017-12-11','zz','0'),('mysql.html',NULL,NULL,NULL,NULL,'zz/mysql.html','2017-12-11','zz','0');
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

-- Dump completed on 2017-12-11 23:02:40
