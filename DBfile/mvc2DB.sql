-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: mvc
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mvc_board`
--

DROP TABLE IF EXISTS `mvc_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mvc_board` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bName` varchar(12) DEFAULT NULL,
  `bTitle` varchar(100) DEFAULT NULL,
  `bContent` text,
  `bDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mvc_board`
--

LOCK TABLES `mvc_board` WRITE;
/*!40000 ALTER TABLE `mvc_board` DISABLE KEYS */;
INSERT INTO `mvc_board` VALUES (1,'jain','lol','game','2022-03-08 00:00:00'),(2,'james','nba','basketball','2022-03-24 10:52:46'),(3,'jobs','apple','fruit','2022-03-24 10:53:46'),(4,'john','baby','lotion','2022-03-24 10:54:05'),(5,'akali','top','ninza','2022-03-24 10:54:28'),(6,'zed','mid','ninza','2022-03-24 10:54:38'),(7,'zinx','bottom','adcarry','2022-03-24 10:55:09'),(8,'paka','bj','troll','2022-03-24 10:55:25');
/*!40000 ALTER TABLE `mvc_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oneline`
--

DROP TABLE IF EXISTS `oneline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oneline` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(12) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oneline`
--

LOCK TABLES `oneline` WRITE;
/*!40000 ALTER TABLE `oneline` DISABLE KEYS */;
INSERT INTO `oneline` VALUES (1,'유비','죽교','2022-03-25 12:00:36'),(2,'장비','선죽교','2022-03-25 12:00:36'),(3,'관우','장신','2022-03-25 12:00:36'),(5,'aa','bb','2022-03-25 12:34:18'),(6,'?','?','2022-03-25 12:34:39'),(7,'?','?','2022-03-25 12:34:49');
/*!40000 ALTER TABLE `oneline` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-25 18:44:19
