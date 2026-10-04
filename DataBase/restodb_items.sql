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
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `Items_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `price` int NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `preparing_time` tinyint NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `Type_id` int NOT NULL,
  `Restaurant_id` int NOT NULL,
  PRIMARY KEY (`Items_id`,`Type_id`,`Restaurant_id`),
  KEY `fk_Items_Types1_idx` (`Type_id`),
  KEY `fk_Items_Restaurants1_idx` (`Restaurant_id`),
  CONSTRAINT `fk_Items_Restaurants1` FOREIGN KEY (`Restaurant_id`) REFERENCES `restaurants` (`Restaurant_id`),
  CONSTRAINT `fk_Items_Types1` FOREIGN KEY (`Type_id`) REFERENCES `types` (`Type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'dragon','chill chicken lettes chese',12000,'img',15,'e',1,1),(2,'escalop','fried chicken lettes mayo corn',14000,'img',12,'e',1,1),(3,'choclate','150 ml',12000,'img',1,'e',5,1),(4,'toshka','chill meeat lettes chese tometo',12000,'img',10,'e',2,1),(5,'potato sup','poteto carrot lettes chese mayo',5000,'img',12,'e',3,1),(6,'kingbee','chill chicken burger  lettes chese mayo coocamper',20000,'img',13,'e',1,1),(7,'shish','smoked chicken',9000,'img',11,'e',1,1),(8,'mexican','grilled chicken pices',12000,'img',16,'e',1,1),(9,'piccata','chill chicken soy socs',12000,'img',20,'e',1,1),(10,'choclate','150 ml',12000,'img',1,'e',5,2),(11,'toshka','chill meeat lettes chese tometo',12000,'img',10,'e',2,2),(12,'potato sup','poteto carrot lettes chese mayo',5000,'img',12,'e',3,2),(13,'kingbee','chill chicken burger  lettes chese mayo coocamper',20000,'img',13,'e',1,2),(14,'shish','smoked chicken',9000,'img',11,'e',1,2),(15,'mexican','grilled chicken pices',12000,'img',16,'e',1,2),(16,'piccata','chill chicken soy socs',12000,'img',20,'e',1,2),(17,'choclate','150 ml',12000,'img',1,'e',5,3),(18,'toshka','chill meeat lettes chese tometo',12000,'img',10,'e',2,4),(19,'potato sup','poteto carrot lettes chese mayo',5000,'img',12,'e',3,3),(20,'kingbee','chill chicken burger  lettes chese mayo coocamper',20000,'img',13,'e',1,4),(21,'shish','smoked chicken',9000,'img',11,'e',1,3),(22,'mexican','grilled chicken pices',12000,'img',16,'e',1,4),(23,'piccata','chill chicken soy socs',12000,'img',20,'e',1,3),(24,'choclate','150 ml',12000,'img',1,'e',5,6),(25,'toshka','chill meeat lettes chese tometo',12000,'img',10,'e',2,5),(26,'potato sup','poteto carrot lettes chese mayo',5000,'img',12,'e',3,6),(27,'kingbee','chill chicken burger  lettes chese mayo coocamper',20000,'img',13,'e',1,5),(28,'shish','smoked chicken',9000,'img',11,'e',1,6),(29,'mexican','grilled chicken pices',12000,'img',16,'e',1,5),(30,'piccata','chill chicken soy socs',12000,'img',20,'e',1,6),(31,'choclate','150 ml',12000,'img',1,'e',5,7),(32,'toshka','chill meeat lettes chese tometo',12000,'img',10,'e',2,7),(33,'potato sup','poteto carrot lettes chese mayo',5000,'img',12,'e',3,8),(34,'kingbee','chill chicken burger  lettes chese mayo coocamper',20000,'img',13,'e',1,8),(35,'shish','smoked chicken',9000,'img',11,'e',1,8),(36,'mexican','grilled chicken pices',12000,'img',16,'e',1,7),(37,'piccata','chill chicken soy socs',12000,'img',20,'e',1,8);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
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
