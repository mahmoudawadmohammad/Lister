-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: restodb
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `Restaurant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `address` varchar(45) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `type` varchar(1) NOT NULL,
  `total_tables` tinyint NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(25) NOT NULL,
  `activation` varchar(4000) NOT NULL,
  `layout` varchar(255) NOT NULL,
  `status` varchar(45) NOT NULL,
  `Owner_id` int NOT NULL,
  `City_id` int NOT NULL,
  PRIMARY KEY (`Restaurant_id`,`Owner_id`,`City_id`),
  KEY `fk_Restaurants_Owners1_idx` (`Owner_id`),
  KEY `fk_Restaurants_Cities1_idx` (`City_id`),
  CONSTRAINT `fk_Restaurants_Cities1` FOREIGN KEY (`City_id`) REFERENCES `cities` (`City_id`),
  CONSTRAINT `fk_Restaurants_Owners1` FOREIGN KEY (`Owner_id`) REFERENCES `owners` (`Owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'warps','o','33.518045,36.300016','0965123812','o',0,'warps@gmail.come','thewarp1231Aa','Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00','no','online',1,2),(2,'ALRWAD SNACKS','no','33.538490,36.295231','0963597215','o',0,'RO@gmail.come','YUHGHULKN11Aa','Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00','no','online',1,1),(3,'MOTO','no','33.534868,36.295467','0932681425','o',0,'MOTO@gmail.com','HJCHJSD11Aa','Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00','no','online',2,2),(4,'GUSTO','no','33.532176,36.295279','0935782168','o',0,'GU@gmail.com','klkvdf11Aa','Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00','no','online',2,1),(5,'epic','no','33.531863,36.296046','0974123598','r',15,'epic@gmail.com','werttyyu11Aa','Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00','no','online',3,2),(6,'Dolco','no','33.535939,36.297462','0963287415','r',15,'Dolco@gmail.com','coolemwe11Aa','Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00','no','online',3,1),(7,'basha','no','33.523784,36.302912','0975134862','r',15,'ba123@gmail.com','svgsd333344fdgfd11Aa','Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00','no','online',4,2),(8,'mira','no','33.521686,36.304567','0963875258','r',15,'miraEp@gmail.com','kvbfvf311Aa','Sun,8:00,14:00-mon,8:00,14:00-Tue,8:00,14:00-WED,8:00,14:00-THU,8:00,14:00-Fri,8:00,14:00-Sat,8:00,14:00','no','online',4,1);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-15 12:25:53
