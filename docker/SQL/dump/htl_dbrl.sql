-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: Hü_Database1
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Hü_Database1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Hü_Database1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Hü_Database1`;

--
-- Table structure for table `Adresse`
--

DROP TABLE IF EXISTS `Adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Adresse` (
  `idAdresse` int NOT NULL AUTO_INCREMENT,
  `Strasse` varchar(255) NOT NULL,
  `HausNr` varchar(10) NOT NULL,
  `Tuer` varchar(10) DEFAULT NULL,
  `FK_idOrt` int DEFAULT NULL,
  PRIMARY KEY (`idAdresse`),
  KEY `FK_idOrt` (`FK_idOrt`),
  CONSTRAINT `Adresse_ibfk_1` FOREIGN KEY (`FK_idOrt`) REFERENCES `Ort` (`idOrt`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adresse`
--

LOCK TABLES `Adresse` WRITE;
/*!40000 ALTER TABLE `Adresse` DISABLE KEYS */;
INSERT INTO `Adresse` VALUES (1,'Hauptstraße','1','A',1),(2,'Nebenstraße','5',NULL,1),(3,'Musterweg','12','3B',2);
/*!40000 ALTER TABLE `Adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ort`
--

DROP TABLE IF EXISTS `Ort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ort` (
  `idOrt` int NOT NULL AUTO_INCREMENT,
  `Ortsname` varchar(255) NOT NULL,
  `Plz` varchar(10) NOT NULL,
  `Land` varchar(100) NOT NULL,
  PRIMARY KEY (`idOrt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ort`
--

LOCK TABLES `Ort` WRITE;
/*!40000 ALTER TABLE `Ort` DISABLE KEYS */;
INSERT INTO `Ort` VALUES (1,'Wien','1010','Oesterreich'),(2,'Berlin','10115','Deutschland');
/*!40000 ALTER TABLE `Ort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `idPerson` int NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(100) NOT NULL,
  `Nachname` varchar(100) NOT NULL,
  `Geburtsdatum` date NOT NULL,
  `TelefonNr` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idPerson`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'Max','Mustermann','1985-04-23','0123456789'),(2,'Lisa','Musterfrau','1992-07-15','0987654321'),(3,'Hermann','Meier','1978-01-30','01512345678'),(4,'Marcel','Hirscher','1990-11-05','01799887766');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wohnt_in`
--

DROP TABLE IF EXISTS `wohnt_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wohnt_in` (
  `Haupt` varchar(255) NOT NULL,
  `Seit` date NOT NULL,
  `Bis` date NOT NULL,
  `FK_idPerson` int NOT NULL,
  `FK_idAdresse` int NOT NULL,
  PRIMARY KEY (`FK_idPerson`,`FK_idAdresse`),
  KEY `FK_idAdresse` (`FK_idAdresse`),
  CONSTRAINT `wohnt_in_ibfk_1` FOREIGN KEY (`FK_idPerson`) REFERENCES `Person` (`idPerson`) ON DELETE CASCADE,
  CONSTRAINT `wohnt_in_ibfk_2` FOREIGN KEY (`FK_idAdresse`) REFERENCES `Adresse` (`idAdresse`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wohnt_in`
--

LOCK TABLES `wohnt_in` WRITE;
/*!40000 ALTER TABLE `wohnt_in` DISABLE KEYS */;
INSERT INTO `wohnt_in` VALUES ('Ja','2020-01-01','2100-12-31',1,1),('Nein','2023-02-01','2093-12-31',1,3),('Nein','2021-03-15','2080-11-01',2,2),('Ja','2019-06-10','2065-02-15',3,3),('Nein','2022-07-01','2043-08-01',4,1);
/*!40000 ALTER TABLE `wohnt_in` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-23  0:39:43
