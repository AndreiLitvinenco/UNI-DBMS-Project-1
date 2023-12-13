-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: EventCompanyDB
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `ClientID` int NOT NULL,
  `FIrstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Phone` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventExpenses`
--

DROP TABLE IF EXISTS `EventExpenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventExpenses` (
  `ExpenseID` int NOT NULL,
  `EventID` int NOT NULL,
  `Description` varchar(45) NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`ExpenseID`,`EventID`),
  KEY `fk_Expenses_1_EventID_idx` (`EventID`),
  CONSTRAINT `fk_Expenses_1_EventID` FOREIGN KEY (`EventID`) REFERENCES `Events` (`EventID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventExpenses`
--

LOCK TABLES `EventExpenses` WRITE;
/*!40000 ALTER TABLE `EventExpenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventExpenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventStaff`
--

DROP TABLE IF EXISTS `EventStaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventStaff` (
  `EventID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`EventID`,`StaffID`),
  KEY `fk_EventStaff_1_StaffID_idx` (`StaffID`),
  CONSTRAINT `fk_EventStaff_1_StaffID` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`CNP`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EventStaff_EventID` FOREIGN KEY (`EventID`) REFERENCES `Events` (`EventID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventStaff`
--

LOCK TABLES `EventStaff` WRITE;
/*!40000 ALTER TABLE `EventStaff` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventStaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventSuppliers`
--

DROP TABLE IF EXISTS `EventSuppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EventSuppliers` (
  `EventSupplierID` int NOT NULL,
  `EventID` int NOT NULL,
  `SupplierID` int NOT NULL,
  PRIMARY KEY (`EventSupplierID`,`EventID`,`SupplierID`),
  KEY `fk_EventSuppliers_1_SupplierID_idx` (`SupplierID`),
  KEY `fk_EventSuppliers_1_EventID_idx` (`EventID`),
  CONSTRAINT `fk_EventSuppliers_1_EventID` FOREIGN KEY (`EventID`) REFERENCES `Events` (`EventID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_EventSuppliers_1_SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `Suppliers` (`SupplierID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventSuppliers`
--

LOCK TABLES `EventSuppliers` WRITE;
/*!40000 ALTER TABLE `EventSuppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventSuppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
  `EventID` int NOT NULL,
  `EventType` enum('TeamBuilding','Wedding','BachelorParty','Conference') NOT NULL DEFAULT 'Wedding',
  `EventDate` date NOT NULL,
  `Location` varchar(45) NOT NULL,
  `ClientID` int NOT NULL,
  PRIMARY KEY (`EventID`,`ClientID`),
  KEY `fk_Events_1_ClientID_idx` (`ClientID`),
  CONSTRAINT `fk_Events_1_ClientID` FOREIGN KEY (`ClientID`) REFERENCES `Clients` (`ClientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payments`
--

DROP TABLE IF EXISTS `Payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Payments` (
  `PaymentID` int NOT NULL,
  `EventID` int NOT NULL,
  `Amount` double NOT NULL,
  `PaymentDate` datetime NOT NULL,
  PRIMARY KEY (`PaymentID`,`EventID`),
  KEY `fk_Payments_1_EventID_idx` (`EventID`),
  CONSTRAINT `fk_Payments_1_EventID` FOREIGN KEY (`EventID`) REFERENCES `Events` (`EventID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payments`
--

LOCK TABLES `Payments` WRITE;
/*!40000 ALTER TABLE `Payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `CNP` int NOT NULL,
  `FIrstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Phone` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`CNP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suppliers` (
  `SupplierID` int NOT NULL,
  `SupplierName` varchar(45) NOT NULL,
  `ServiceType` enum('Catering','Filmography','DJ','Logistics','Decorations','Entertainment') NOT NULL DEFAULT 'Catering',
  `Phone` int NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-13 20:50:21
