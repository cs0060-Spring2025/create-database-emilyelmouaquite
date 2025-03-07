-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (x86_64)
--
-- Host: localhost    Database: unitedhelpers
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime NOT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `taskCode` (`taskCode`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerID`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,1,'2025-03-07 09:00:00','2025-03-07 17:00:00'),(1,2,'2025-03-08 09:00:00','2025-03-08 17:00:00'),(1,4,'2025-03-10 09:00:00','2025-03-10 17:00:00'),(2,1,'2025-03-07 09:00:00','2025-03-07 17:00:00'),(2,2,'2025-03-08 09:00:00','2025-03-08 17:00:00'),(2,4,'2025-03-10 09:00:00','2025-03-10 17:00:00'),(3,3,'2025-03-09 09:00:00','2025-03-09 17:00:00'),(4,3,'2025-03-09 09:00:00','2025-03-09 17:00:00'),(5,5,'2025-03-11 09:00:00','2025-03-11 17:00:00'),(6,5,'2025-03-11 09:00:00','2025-03-11 17:00:00');
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` text NOT NULL,
  `itemValue` decimal(10,2) NOT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'First-Aid Kit',15.00,1000),(2,'Bandages',1.00,5000),(3,'Pain Relief Tablets',2.00,2000),(4,'Rice',10.00,5000),(5,'Canned Beans',3.00,4000),(6,'Canned Tuna',5.00,3000),(7,'Diapers',6.00,2000),(8,'Baby Formula',10.00,1500),(9,'Toys',7.00,1000),(10,'Clothes',8.00,2500);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` decimal(10,2) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `taskCode` (`taskCode`),
  KEY `packageTypeId` (`packageTypeId`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `package_ibfk_2` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,1,'2025-03-07',50.00),(2,1,1,'2025-03-07',45.00),(3,2,2,'2025-03-07',20.00),(4,2,2,'2025-03-07',18.00),(5,3,3,'2025-03-07',15.00),(6,3,3,'2025-03-07',12.00),(7,4,1,'2025-03-07',30.00),(8,5,2,'2025-03-07',25.00),(9,6,3,'2025-03-07',18.00),(10,7,1,'2025-03-07',35.00);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `packageId` (`packageId`),
  CONSTRAINT `package_contents_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `package_contents_ibfk_2` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,100),(2,1,200),(3,1,150),(4,2,500),(5,2,300),(6,2,1000),(7,3,300),(8,3,500),(9,3,100),(10,3,150);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'Basic Medical'),(2,'Child-care'),(3,'Food');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(255) NOT NULL,
  `packingListDescription` text NOT NULL,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Medical Supplies for Emergency Relief','Includes 2,000 medical kits, first aid items, pain relief tablets, bandages, and medication for emergency relief operations.'),(2,'Food Supplies for Disaster Relief','Includes 2,000 food packages with non-perishable items: rice, canned beans, canned tuna, pasta, and other necessary items.'),(3,'Child-care Supplies for Refugee Centers','Includes 1,000 packages with diapers, baby formula, toys, clothing, and other essential supplies for children in refugee centers.');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` text NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `packingListId` (`packingListId`),
  KEY `taskTypeId` (`taskTypeId`),
  KEY `taskStatusId` (`taskStatusId`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,1,1,'Prepare 2,000 medical supply kits for disaster relief'),(2,2,2,1,'Prepare 2,000 food packages for disaster relief'),(3,3,3,1,'Prepare 1,000 child-care kits for refugee centers'),(4,1,1,2,'Complete medical supply kit preparation'),(5,2,2,2,'Complete food package preparation'),(6,3,3,2,'Complete child-care kit preparation'),(7,1,1,1,'Start preparing medical supply kits'),(8,2,2,1,'Start preparing food packages'),(9,3,3,1,'Start preparing child-care kits'),(10,1,1,1,'Continue with medical supply kit preparation');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(255) NOT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'Pending'),(2,'Completed');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(255) NOT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'Packing Medical Supplies'),(2,'Packing Food Supplies'),(3,'Packing Child-care Supplies');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerID` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(255) NOT NULL,
  `volunteerAddress` text NOT NULL,
  `volunteerTelephone` char(9) NOT NULL,
  PRIMARY KEY (`volunteerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Liam Carter','123 Broadway, Brooklyn, NY','718123456'),(2,'Sophia Evans','456 5th Ave, Queens, NY','718234567'),(3,'Mason Wright','789 Bay St, Staten Island, NY','718345678'),(4,'Olivia Harris','159 Grand Concourse, Bronx, NY','718456789'),(5,'Noah Lewis','753 Bedford Ave, Brooklyn, NY','718567890'),(6,'Emma Walker','951 Jackson Ave, Queens, NY','718678901'),(7,'James Allen','852 Hylan Blvd, Staten Island, NY','718789012'),(8,'Ava Scott','357 Fordham Rd, Bronx, NY','718890123'),(9,'Benjamin Young','654 Flatbush Ave, Brooklyn, NY','718901234'),(10,'Charlotte King','258 Steinway St, Queens, NY','718012345');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 17:02:36
