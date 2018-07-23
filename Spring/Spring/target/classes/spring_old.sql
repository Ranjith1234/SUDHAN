-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: spring
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1-log

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
-- Table structure for table `country_master`
--

DROP TABLE IF EXISTS `country_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country_master` (
  `CID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CDate` datetime DEFAULT NULL,
  `CountryCode` varchar(255) DEFAULT NULL,
  `CountryName` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDateTime` datetime DEFAULT NULL,
  `RecordStatus` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_master`
--

LOCK TABLES `country_master` WRITE;
/*!40000 ALTER TABLE `country_master` DISABLE KEYS */;
INSERT INTO `country_master` VALUES (1,NULL,'IN','India',NULL,NULL,'Active');
/*!40000 ALTER TABLE `country_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermaster`
--

DROP TABLE IF EXISTS `customermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customermaster` (
  `CID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CSTDate` datetime DEFAULT NULL,
  `CSTNo` varchar(255) DEFAULT NULL,
  `TIN` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `CDate` date DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `ContactPhoneNo` varchar(255) DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDateTime` datetime DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `PostalCode` varchar(255) DEFAULT NULL,
  `RecordStatus` varchar(30) DEFAULT 'Active',
  `Website` varchar(255) DEFAULT NULL,
  `CountryId` bigint(20) DEFAULT NULL,
  `StateId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CID`),
  KEY `FK_cxiemftni6k2eo3h02kk8a0v7` (`CountryId`),
  KEY `FK_pmpg2vn37sisj5moyial5n6u3` (`StateId`),
  CONSTRAINT `FK_cxiemftni6k2eo3h02kk8a0v7` FOREIGN KEY (`CountryId`) REFERENCES `country_master` (`CID`),
  CONSTRAINT `FK_pmpg2vn37sisj5moyial5n6u3` FOREIGN KEY (`StateId`) REFERENCES `state_master` (`SID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermaster`
--

LOCK TABLES `customermaster` WRITE;
/*!40000 ALTER TABLE `customermaster` DISABLE KEYS */;
INSERT INTO `customermaster` VALUES (1,'2017-02-13 00:00:00','321321','123123','address','2017-02-13','city','contact name','1231231230','admin',NULL,'Rajkumar','test@gmail.com','fax123','1234567890','123456','Active','www.test.com',1,1),(2,NULL,NULL,'123','my address','2017-02-13','city',NULL,NULL,'admin',NULL,'test user name',NULL,NULL,NULL,'123','Active',NULL,1,1),(3,NULL,'cst','12312','address','2017-02-13','city',NULL,NULL,'admin',NULL,'New customer',NULL,NULL,NULL,'123123','Active',NULL,1,1);
/*!40000 ALTER TABLE `customermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `mod_modulecode` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT b'1',
  `mod_moduleicon` varchar(255) DEFAULT NULL,
  `mod_modulename` varchar(255) DEFAULT NULL,
  `mod_moduleorder` int(11) DEFAULT NULL,
  `mod_modulepagename` varchar(255) DEFAULT NULL,
  `mod_parent` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`mod_modulecode`),
  KEY `FK_32i0otovys7tr97hs2al2xuu1` (`mod_parent`),
  CONSTRAINT `FK_32i0otovys7tr97hs2al2xuu1` FOREIGN KEY (`mod_parent`) REFERENCES `module` (`mod_modulecode`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'','fa fa-th','Dashboard',1,'#home.do',NULL),(2,'','fa fa-users','Customer',2,'#',NULL),(3,'',NULL,'New Customer',1,'#newcustomer.do',2),(4,'','fa fa-user-circle-o','User Management',3,'#',NULL),(5,'',NULL,'New User',3,'#newuser.do',4),(6,'',NULL,'Multi Menu Test',1,'#',5),(7,'','fa fa-car','Test Sub-Menu',2,'#',2);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_rolecode` int(11) NOT NULL AUTO_INCREMENT,
  `role_rolename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`role_rolecode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER'),(3,'DBA');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_rights`
--

DROP TABLE IF EXISTS `role_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_rights` (
  `RRID` bigint(20) NOT NULL AUTO_INCREMENT,
  `rr_create` tinyint(1) DEFAULT NULL,
  `rr_delete` tinyint(1) DEFAULT NULL,
  `rr_edit` tinyint(1) DEFAULT NULL,
  `rr_view` tinyint(1) DEFAULT NULL,
  `rr_modulecode` bigint(20) DEFAULT NULL,
  `rr_rolecode` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`RRID`),
  KEY `FK_a9d052n7le22kl0ai7iqdctdb` (`rr_modulecode`),
  CONSTRAINT `FK_a9d052n7le22kl0ai7iqdctdb` FOREIGN KEY (`rr_modulecode`) REFERENCES `module` (`mod_modulecode`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_rights`
--

LOCK TABLES `role_rights` WRITE;
/*!40000 ALTER TABLE `role_rights` DISABLE KEYS */;
INSERT INTO `role_rights` VALUES (1,1,1,1,1,1,1),(2,1,1,1,1,2,1),(3,1,1,1,1,3,1),(4,1,1,1,1,4,1),(5,1,1,1,1,5,1),(6,1,1,1,1,6,1),(7,1,0,0,1,1,2),(8,1,0,0,1,2,2),(9,1,0,0,1,3,2),(10,1,0,0,1,4,2),(11,0,0,0,0,5,2),(12,0,0,0,1,6,2),(13,1,1,1,1,1,3),(14,1,1,1,1,2,3),(15,1,1,1,1,3,3),(16,1,1,1,1,4,3),(17,1,1,1,1,5,3),(18,1,1,1,1,6,3);
/*!40000 ALTER TABLE `role_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_master`
--

DROP TABLE IF EXISTS `state_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_master` (
  `SID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CDate` datetime DEFAULT NULL,
  `CreatedBy` varchar(255) DEFAULT NULL,
  `CreatedDateTime` datetime DEFAULT NULL,
  `RecordStatus` varchar(255) DEFAULT NULL,
  `StateName` varchar(255) DEFAULT NULL,
  `CID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SID`),
  KEY `FK_fsrjw4asymwpnmcxki2e7atb4` (`CID`),
  CONSTRAINT `FK_fsrjw4asymwpnmcxki2e7atb4` FOREIGN KEY (`CID`) REFERENCES `country_master` (`CID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_master`
--

LOCK TABLES `state_master` WRITE;
/*!40000 ALTER TABLE `state_master` DISABLE KEYS */;
INSERT INTO `state_master` VALUES (1,NULL,NULL,NULL,'Active','TamilNadu',1);
/*!40000 ALTER TABLE `state_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_users`
--

DROP TABLE IF EXISTS `system_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_users` (
  `u_userid` int(11) NOT NULL AUTO_INCREMENT,
  `u_username` varchar(20) DEFAULT NULL,
  `u_password` varchar(20) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`u_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_users`
--

LOCK TABLES `system_users` WRITE;
/*!40000 ALTER TABLE `system_users` DISABLE KEYS */;
INSERT INTO `system_users` VALUES (1,'admin','admin',1);
/*!40000 ALTER TABLE `system_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `ur_id` int(11) NOT NULL AUTO_INCREMENT,
  `ur_userid` int(11) DEFAULT NULL,
  `ur_rolecode` int(11) DEFAULT NULL,
  PRIMARY KEY (`ur_id`),
  KEY `fk_userid` (`ur_userid`),
  KEY `fk_rolecode` (`ur_rolecode`),
  CONSTRAINT `fk_rolecode` FOREIGN KEY (`ur_rolecode`) REFERENCES `role` (`role_rolecode`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`ur_userid`) REFERENCES `system_users` (`u_userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1,1),(2,1,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_test`
--

DROP TABLE IF EXISTS `user_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_test`
--

LOCK TABLES `user_test` WRITE;
/*!40000 ALTER TABLE `user_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25 15:18:07
