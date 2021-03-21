CREATE DATABASE  IF NOT EXISTS `dbproizvodi_38` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbproizvodi_38`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbproizvodi_38
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` char(15) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `unitPrice` decimal(8,2) DEFAULT NULL,
  `description` text,
  `manufacturer` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `unitsInStock` int DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('P111','Gallery Canvas',19.99,'Napravljen je od pamuka, mozete poceti odmah prenositi svoje ideje na platno. Perfektno za koristenje  sa uljanim bojama.','Artists Loft','Canvas',30,'https://imgs.michaels.com/MAM/assets/1/726D45CA1C364650A39CD1B336F03305/img/A10FF99F8AEF441FAD7D36F76336D7B6/10317413_u.jpg?fit=inside|1024:1024'),('P113','Acrylic Paint',8.49,'Kreirajte divne detaljne slike na drvetu ili platnu akrilskim bojama od Artists Loft. Ova bogata boja je savrsena za isprobavanje raznih tehnika slikanja.','Artists Loft','Paint Supplies',197,'https://imgs.michaels.com/MAM/assets/1/5E3C12034D34434F8A9BAAFDDF0F8E1B/img/B152872C38794D01AF8C7E82231A339B/10516998_1.jpg?fit=inside|540:540'),('P114','Set od 25 cetkica',5.99,'Ovo pakovanje ukljucuje cetkice raznih velicina i na taj nacin mozete pokriti svaki aspekt svog umjetnickog duha i svoje ideje.','Artists Loft','Art Gift Set',79,'https://imgs.michaels.com/MAM/assets/1/5E3C12034D34434F8A9BAAFDDF0F8E1B/img/7AB82A7C3420414596E01AE8E1805412/10503498_8.jpg'),('P117','Compact Table',40.00,' Ovaj aluminijumski stalak je savrsen za male radove velikog znacaja. Moze se iskoristiti za prikaz ili kao potpora za slikanje. Jednostavan za transport sa mogucnoscu podesavanja krila.','Artists Loft','Art easels',30,'https://imgs.michaels.com/MAM/assets/1/726D45CA1C364650A39CD1B336F03305/img/051CA1326F6541E98EF8B746CE50989D/10194059_2.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-29 23:53:27
