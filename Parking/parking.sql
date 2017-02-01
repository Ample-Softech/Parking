-- MySQL dump 10.13  Distrib 5.1.73, for Win32 (ia32)
--
-- Host: localhost    Database: parking
-- ------------------------------------------------------
-- Server version	5.1.73-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `areamaster`
--

DROP TABLE IF EXISTS `areamaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areamaster` (
  `AreaId` int(11) NOT NULL AUTO_INCREMENT,
  `AreaName` varchar(55) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`AreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areamaster`
--

LOCK TABLES `areamaster` WRITE;
/*!40000 ALTER TABLE `areamaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `areamaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookingtypemaster`
--

DROP TABLE IF EXISTS `bookingtypemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookingtypemaster` (
  `BookingTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `BookingType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BookingTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookingtypemaster`
--

LOCK TABLES `bookingtypemaster` WRITE;
/*!40000 ALTER TABLE `bookingtypemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookingtypemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citymaster`
--

DROP TABLE IF EXISTS `citymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citymaster` (
  `CityId` int(11) NOT NULL AUTO_INCREMENT,
  `StateId` int(11) DEFAULT NULL,
  `CityName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CityId`),
  KEY `cityfk_idx` (`StateId`),
  CONSTRAINT `cityfk` FOREIGN KEY (`StateId`) REFERENCES `statemaster` (`StateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citymaster`
--

LOCK TABLES `citymaster` WRITE;
/*!40000 ALTER TABLE `citymaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `citymaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countrymaster`
--

DROP TABLE IF EXISTS `countrymaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countrymaster` (
  `CountryId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countrymaster`
--

LOCK TABLES `countrymaster` WRITE;
/*!40000 ALTER TABLE `countrymaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `countrymaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustId` varchar(45) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` varchar(45) DEFAULT NULL,
  `EmailId` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  `CountryId` int(11) DEFAULT NULL,
  `AreaId` int(11) DEFAULT NULL,
  `Latitude` decimal(20,15) DEFAULT NULL,
  `Longitude` decimal(20,15) DEFAULT NULL,
  `DelFlag` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`CustId`),
  KEY `countryCustfk_idx` (`CountryId`),
  KEY `citycustfk_idx` (`CityId`),
  KEY `statecustfk_idx` (`StateId`),
  KEY `areacustfk_idx` (`AreaId`),
  CONSTRAINT `areacustfk` FOREIGN KEY (`AreaId`) REFERENCES `areamaster` (`AreaId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `citycustfk` FOREIGN KEY (`CityId`) REFERENCES `citymaster` (`CityId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `countryCustfk` FOREIGN KEY (`CountryId`) REFERENCES `countrymaster` (`CountryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `statecustfk` FOREIGN KEY (`StateId`) REFERENCES `statemaster` (`StateId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parkspace`
--

DROP TABLE IF EXISTS `parkspace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parkspace` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(245) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `pincode` varchar(45) DEFAULT NULL,
  `lat` varchar(45) NOT NULL,
  `lng` varchar(45) NOT NULL,
  `delflag` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parkspace`
--

LOCK TABLES `parkspace` WRITE;
/*!40000 ALTER TABLE `parkspace` DISABLE KEYS */;
INSERT INTO `parkspace` VALUES (1,'Chinchwad, Maharashtra','pune','MH','India','411010','18.6297811','73.79970939999998','123','images/parkinks/cycle.jpeg');
/*!40000 ALTER TABLE `parkspace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statemaster`
--

DROP TABLE IF EXISTS `statemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statemaster` (
  `StateId` int(11) NOT NULL AUTO_INCREMENT,
  `CountryId` int(11) DEFAULT NULL,
  `StateName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`StateId`),
  KEY `statefk_idx` (`CountryId`),
  CONSTRAINT `statefk` FOREIGN KEY (`CountryId`) REFERENCES `countrymaster` (`CountryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statemaster`
--

LOCK TABLES `statemaster` WRITE;
/*!40000 ALTER TABLE `statemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `statemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` varchar(45) NOT NULL,
  `UserTypeId` int(11) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `MiddleName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` varchar(45) DEFAULT NULL,
  `EmailId` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `CityId` int(11) DEFAULT NULL,
  `StateId` int(11) DEFAULT NULL,
  `CountryId` int(11) DEFAULT NULL,
  `AreaId` int(11) DEFAULT NULL,
  `Latitude` decimal(20,15) DEFAULT NULL,
  `Longitude` decimal(20,15) DEFAULT NULL,
  `DelFlag` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`UserId`),
  KEY `countryuserfk_idx` (`CountryId`),
  KEY `stateuserfk_idx` (`StateId`),
  KEY `cityuserfk_idx` (`CityId`),
  KEY `areauserfk_idx` (`AreaId`),
  KEY `usertypeidfk_idx` (`UserTypeId`),
  CONSTRAINT `areauserfk` FOREIGN KEY (`AreaId`) REFERENCES `areamaster` (`AreaId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cityuserfk` FOREIGN KEY (`CityId`) REFERENCES `citymaster` (`CityId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `countryuserfk` FOREIGN KEY (`CountryId`) REFERENCES `countrymaster` (`CountryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `stateuserfk` FOREIGN KEY (`StateId`) REFERENCES `statemaster` (`StateId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usertypeidfk` FOREIGN KEY (`UserTypeId`) REFERENCES `usertype` (`UserTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `logitude` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `usertype` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `UserTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `UserType` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`UserTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-01 12:32:02
