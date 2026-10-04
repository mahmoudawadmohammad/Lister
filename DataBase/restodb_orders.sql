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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `status` varchar(1) NOT NULL,
  `expected_time` time NOT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `Customer_id` int NOT NULL,
  `Restaurant_id` int NOT NULL,
  `Delivery_Man_id` int NOT NULL,
  `Discount_ID` int DEFAULT NULL,
  PRIMARY KEY (`Order_id`,`Customer_id`,`Restaurant_id`,`Delivery_Man_id`),
  UNIQUE KEY `Discount_ID_UNIQUE` (`Discount_ID`),
  KEY `fk_Orders_Customers_idx` (`Customer_id`),
  KEY `fk_Orders_Restaurants1_idx` (`Restaurant_id`),
  KEY `fk_Orders_Delivery_Men1_idx` (`Delivery_Man_id`),
  KEY `fk_Orders_Discount1_idx` (`Discount_ID`),
  CONSTRAINT `fk_Orders_Customers` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`),
  CONSTRAINT `fk_Orders_Delivery_Men1` FOREIGN KEY (`Delivery_Man_id`) REFERENCES `delivery_men` (`Delivery_Man_id`),
  CONSTRAINT `fk_Orders_Discount1` FOREIGN KEY (`Discount_ID`) REFERENCES `discount` (`Discount_ID`),
  CONSTRAINT `fk_Orders_Restaurants1` FOREIGN KEY (`Restaurant_id`) REFERENCES `restaurants` (`Restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-15 12:25:56
