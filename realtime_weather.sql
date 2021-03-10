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
  `height` decimal(6,2) NOT NULL,
  `wind_direction` int(11) NOT NULL,
  `wind_speed` decimal(4,2) NOT NULL,
  `temp` decimal(3,1) NOT NULL,
  `humidity` decimal(3,2) NOT NULL,
  `pressure` decimal(7,2) NOT NULL,
  `daily_rain` decimal(7,2) NOT NULL,
  `wind_speed_max` decimal(4,2) NOT NULL,
  `wind_direction_max` int(11) NOT NULL,
  `max_wind_time` varchar(5) NOT NULL,
  `wind_speed_max_10` decimal(4,2) NOT NULL,
  `wind_direction_max_10` int(11) NOT NULL,
  `max_wind_time_10` varchar(5) NOT NULL,
  `UV_index` decimal(4,2) NOT NULL,
  `max_temp` decimal(3,1) NOT NULL,
  `max_temp_time` varchar(5) NOT NULL,
  `min_temp` decimal(3,1) NOT NULL,
  `min_temp_time` varchar(5) NOT NULL,
  `total_sun_time` decimal(4,2) NOT NULL,
  `visible_distance` varchar(10) NOT NULL,
  `weather` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather`
--

LOCK TABLES `weather` WRITE;
/*!40000 ALTER TABLE `weather` DISABLE KEYS */;
INSERT INTO `weather` VALUES (1,'466880',11.00,70,3.70,18.8,0.84,1019.90,0.00,14.50,70,'1744',5.40,80,'1730',-99.00,21.8,'1022',17.9,'0605',0.90,'21-30','晴'),(2,'466920',6.26,110,3.40,18.4,0.89,1018.00,0.00,11.30,110,'1723',5.00,110,'1743',0.01,21.3,'1319',17.5,'0620',0.20,'16-20','多雲'),(3,'467050',20.60,50,8.90,17.7,0.88,1017.50,0.00,17.00,40,'1711',11.30,50,'1701',0.01,20.8,'1045',17.0,'0509',8.90,'無觀測','晴'),(4,'466900',19.00,170,1.30,18.7,0.82,1018.90,0.00,3.60,290,'1749',1.20,280,'1756',0.01,22.9,'1146',17.5,'0349',2.80,'>30','多雲'),(5,'466910',832.60,170,6.30,12.4,1.00,-99.00,5.00,14.10,140,'1725',5.80,170,'1730',0.00,13.2,'1311',11.0,'0615',0.00,'<1','有霧'),(6,'466930',607.10,30,4.90,14.0,0.98,951.40,1.50,10.20,360,'1730',4.70,40,'1736',0.00,17.5,'1230',12.6,'0616',3.80,'>30','多雲');
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

-- Dump completed on 2021-03-10 19:11:42
