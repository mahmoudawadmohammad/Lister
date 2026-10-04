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
-- Table structure for table `restaurants_rate`
--

DROP TABLE IF EXISTS `restaurants_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants_rate` (
  `Restaurant_id` int NOT NULL,
  `Customer_id` int NOT NULL,
  `rate` varchar(5) NOT NULL,
  `rate_date_time` datetime NOT NULL,
  `question1` varchar(1) DEFAULT '0',
  `question2` varchar(1) DEFAULT '0',
  `question3` varchar(1) DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Restaurant_id`,`Customer_id`),
  KEY `fk_Restaurants_Rate_Restaurants1_idx` (`Restaurant_id`),
  KEY `fk_Restaurants_Rate_Customers1` (`Customer_id`),
  CONSTRAINT `fk_Restaurants_Rate_Customers1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`),
  CONSTRAINT `fk_Restaurants_Rate_Restaurants1` FOREIGN KEY (`Restaurant_id`) REFERENCES `restaurants` (`Restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants_rate`
--

LOCK TABLES `restaurants_rate` WRITE;
/*!40000 ALTER TABLE `restaurants_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants_rate` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-15 12:25:51
