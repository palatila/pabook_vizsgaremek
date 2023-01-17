-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: picksystem.eu    Database: bfarmdb
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.2

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
-- Table structure for table `order_header`
--

DROP TABLE IF EXISTS `order_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_header` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) NOT NULL,
  `payment_option` varchar(3) COLLATE utf8_hungarian_ci NOT NULL,
  `billing_settlement` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `billing_postal_code` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `delivery_settlement` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `delivery_postal_code` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `delivery_address` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `order_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shipping_option` varchar(3) COLLATE utf8_hungarian_ci NOT NULL,
  `order_status` varchar(1) COLLATE utf8_hungarian_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_idx` (`customer_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order` FOREIGN KEY (`id`) REFERENCES `order_item` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_header`
--

LOCK TABLES `order_header` WRITE;
/*!40000 ALTER TABLE `order_header` DISABLE KEYS */;
INSERT INTO `order_header` VALUES (1,2,'COD','Budapest','1234','Teszt utca 3','Budapest','1234','Teszt utca 3','2023-01-17 11:11:11','GLS','N'),(2,2,'CC','Budapest','1234','Teszt utca 3','Budapest','1234','Teszt utca 3','2023-01-17 15:21:44','GLS','N'),(3,1,'CC','Budapest','3375','Teszt utca 5','Budapest','3375','Teszt utca 5','2023-01-17 19:47:48','GLS','N');
/*!40000 ALTER TABLE `order_header` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-17 22:33:36
