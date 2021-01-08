-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: office_hours
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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageID` int NOT NULL AUTO_INCREMENT,
  `fromUserID` int NOT NULL,
  `toUserID` int NOT NULL,
  `actualMassage` varchar(200) NOT NULL,
  `date` varchar(45) NOT NULL,
  PRIMARY KEY (`messageID`),
  UNIQUE KEY `messageID_UNIQUE` (`messageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_hours`
--

DROP TABLE IF EXISTS `office_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_hours` (
  `officeHoursID` int NOT NULL AUTO_INCREMENT,
  `fromTime` varchar(45) NOT NULL,
  `toTime` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `userID` int NOT NULL,
  PRIMARY KEY (`officeHoursID`),
  UNIQUE KEY `officeHoursID_UNIQUE` (`officeHoursID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_hours`
--

LOCK TABLES `office_hours` WRITE;
/*!40000 ALTER TABLE `office_hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `office_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservationID` int NOT NULL AUTO_INCREMENT,
  `officeHoursID` int NOT NULL,
  `fromUserID` int NOT NULL,
  `toUserID` int NOT NULL,
  PRIMARY KEY (`reservationID`),
  UNIQUE KEY `reservationID_UNIQUE` (`reservationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subjectID` int NOT NULL AUTO_INCREMENT,
  `sujectName` varchar(45) NOT NULL,
  PRIMARY KEY (`subjectID`),
  UNIQUE KEY `subjectID_UNIQUE` (`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) NOT NULL,
  `displayName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `subjectName` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mariam nasser','Mariooma','mariamnasser979@gmail.com','Dr','qnsCrI9V1IAclhdnT8np','CS',NULL),(2,'mariam nasser','Mariooma','mariamnasser979@gmail.com','Dr','ywj5NFggnI1mBkD0kYOP','CS',NULL),(3,'mariam nasser','Mariooma','mariamnasser979@gmail.com','Dr','KtnihqzL3UcWweyaOvFk','CS',NULL),(4,'mariam nasser','Mariooma','mariamnasser979@gmail.com','Dr','EHbkOCVWFjCBqN9DKvKI','CS',NULL),(5,'mariam nasser','Mariooma','mariamnasser979@gmail.com','Dr','CRrzD6f9rCol54HdKSgQ','CS',NULL),(6,'jiokml','njimkl','100bt@gmail.com','student','AZlWdBH7YnqDu7gRuzWe',NULL,'null'),(7,'Maram','Rama','maram@gmail.com','student','zvML4tZcfRlsIDbgexmv',NULL,'null'),(8,'Maram','Rama','maram@gmail.com','student','7kkYiV5nJudaPlwrSCze',NULL,'null'),(9,'kml','okml','nomkl@gmail.com','student','IbqlfJUcuySSKWoBfjqp',NULL,'null'),(10,'kml','okml','nomkl@gmail.com','student','gnouP1JDZNNkgiqHodhM',NULL,'null'),(11,'','bjn,m','bijkm@gmail.com','student','rFRQBuvQ7TmBxldblmfP',NULL,'null'),(12,'','bjn,m','bijkm@gmail.com','student','8Nqx1AhFXRCHNOmiMy8m',NULL,'null'),(13,'','bjn,m','bijkm@gmail.com','student','OYRVKZ7tmvAM6RzCYogx',NULL,'null'),(14,'','bjn,m','bijkm@gmail.com','student','l5acp5XNsiIwyD7zuxYR',NULL,'null'),(15,'','bjn,m','bijkm@gmail.com','student','L3mYvJfNGv7iy5C743vO',NULL,'null'),(16,'','bjn,m','bijkm@gmail.com','student','l46pI4qGo8vPZMZRr80B',NULL,'null'),(17,'','bjn,m','bijkm@gmail.com','student','A7K4S4f1bXyRv02DsAzp',NULL,'null'),(18,'','bjn,m','bijkm@gmail.com','student','zqsfQjOchYpkUf3g3LDV',NULL,'null'),(19,'null','yaso','mariamnasser979@gmail.com','Dr','GQKLVcc5dCZjZ9hsgU15','CS',NULL),(20,'null','yaso','mariamnasser979@gmail.com','Dr','Z5f6bQEZF3AdSknxGUYW','CS',NULL),(21,'null','g','mariamnasser979@gmail.com','TA','ZnDlvMp1ZNkxrvVItdVn','vf',NULL),(22,'yasmeen','gggg','mariamnasser979@gmail.com','student','dNnt9KFmkOEwbZ7kzrWH',NULL,'null'),(23,'','','','student','H6PfoLfInSLHgrDxv4kv',NULL,'null'),(24,'','','','student','JI7g9mlkQssoUi3n9fKg',NULL,'null'),(25,'','','','student','ud4ZJdYijyul9mUqVAzd',NULL,'null'),(26,'','','mlk','student','U9sfL5zF1GpaIjuei3lZ',NULL,'null'),(27,'',' ','','student','qmgMLqJYVraSSeq2GLpV',NULL,'null'),(28,'','rg','mariamnasser979@gmail.com','student','J1grx9acHdKFz9bpWK4O',NULL,'null'),(29,'','','','student','WxSOjYli5BFMh2Op4p4M',NULL,'null'),(30,'','','','student','B99gu6Btn3CXdcq6c6pP',NULL,'null'),(31,'','','','student','EzfjBsaxtdJQhuOYanhv',NULL,'null'),(32,'','','','student','jgm6U3fBu7YdOKofbexI',NULL,'null');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_subject`
--

DROP TABLE IF EXISTS `user_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_subject` (
  `staffMemberID` int NOT NULL,
  `subjectID` int NOT NULL,
  KEY `staffMemberID_idx` (`staffMemberID`),
  KEY `subjectID_idx` (`subjectID`),
  CONSTRAINT `staffMemberID` FOREIGN KEY (`staffMemberID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `subjectID` FOREIGN KEY (`subjectID`) REFERENCES `subject` (`subjectID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_subject`
--

LOCK TABLES `user_subject` WRITE;
/*!40000 ALTER TABLE `user_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_subject` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-31  0:28:05
