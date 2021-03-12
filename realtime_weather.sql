-- MySQL dump 10.13  Distrib 5.7.31, for macos10.14 (x86_64)
--
-- Host: localhost    Database: realtime_weather
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(45) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` VALUES (1,'LRWI-1615369249594-JFO98',1);
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `station_id` varchar(10) NOT NULL,
  `location_name` varchar(20) NOT NULL,
  `city` varchar(15) NOT NULL,
  `dist` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'466880','板橋','新北市','板橋區'),(2,'466920','臺北','臺北市','中正區'),(3,'467050','新屋','桃園市','新屋區'),(4,'466900','淡水','新北市','淡水區'),(5,'466910','鞍部','臺北市','北投區'),(6,'466930','竹子湖','臺北市','北投區');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather`
--

DROP TABLE IF EXISTS `weather`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `station_id` varchar(10) NOT NULL,
  `ELEV` decimal(6,2) NOT NULL,
  `WDIR` int(11) NOT NULL,
  `WDSD` decimal(4,2) NOT NULL,
  `TEMP` decimal(3,1) NOT NULL,
  `HUMD` decimal(3,2) NOT NULL,
  `PRES` decimal(7,2) NOT NULL,
  `24R` decimal(7,2) NOT NULL,
  `H_FX` decimal(4,2) NOT NULL,
  `H_XD` int(11) NOT NULL,
  `H_FXT` varchar(5) NOT NULL,
  `H_F10` decimal(4,2) NOT NULL,
  `H_10D` int(11) NOT NULL,
  `H_F10T` varchar(5) NOT NULL,
  `H_UVI` decimal(4,2) NOT NULL,
  `D_TX` decimal(3,1) NOT NULL,
  `D_TXT` varchar(5) NOT NULL,
  `D_TN` decimal(3,1) NOT NULL,
  `D_TNT` varchar(5) NOT NULL,
  `D_TS` decimal(4,2) NOT NULL,
  `VIS` varchar(10) NOT NULL,
  `Weather` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (1,'466880',11.00,70,2.70,19.4,0.79,1018.50,0.00,11.40,70,'1617',5.90,70,'1618',-99.00,24.3,'1033',17.9,'0532',2.50,'16-20','多雲'),(2,'466920',6.26,100,4.00,18.9,0.86,1016.40,0.00,11.50,140,'1609',4.80,110,'1657',0.18,23.5,'1158',18.5,'0647',1.90,'16-20','陰'),(3,'467050',20.60,50,8.10,18.6,0.81,1016.30,0.00,17.00,40,'1639',11.50,50,'1642',0.18,21.8,'1357',15.5,'0100',4.50,'無觀測','多雲'),(4,'466900',19.00,20,1.30,19.3,0.77,1017.40,0.00,9.20,10,'1628',3.60,30,'1608',0.16,23.5,'1229',15.9,'0043',1.90,'21-30','陰'),(5,'466910',832.60,80,2.60,12.3,1.00,-99.00,0.00,9.70,100,'1614',3.40,70,'1635',0.07,19.7,'1130',12.2,'1730',3.70,'<1','有霧'),(6,'466930',607.10,30,5.70,14.0,0.97,949.70,0.00,14.10,40,'1636',6.20,30,'1621',0.11,19.5,'0924',14.0,'1742',2.90,'>30','陰');
/*!40000 ALTER TABLE `weather` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-12 18:17:49
