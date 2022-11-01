-- MySQL dump 10.13  Distrib 8.0.29, for macos12.2 (arm64)
--
-- Host: localhost    Database: noffeine
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add address',7,'add_address'),(26,'Can change address',7,'change_address'),(27,'Can delete address',7,'delete_address'),(28,'Can view address',7,'view_address'),(29,'Can add menu',8,'add_menu'),(30,'Can change menu',8,'change_menu'),(31,'Can delete menu',8,'delete_menu'),(32,'Can view menu',8,'view_menu'),(33,'Can add menu_detail',9,'add_menu_detail'),(34,'Can change menu_detail',9,'change_menu_detail'),(35,'Can delete menu_detail',9,'delete_menu_detail'),(36,'Can view menu_detail',9,'view_menu_detail'),(37,'Can add cafe',10,'add_cafe'),(38,'Can change cafe',10,'change_cafe'),(39,'Can delete cafe',10,'delete_cafe'),(40,'Can view cafe',10,'view_cafe'),(41,'Can add menu image',11,'add_menuimage'),(42,'Can change menu image',11,'change_menuimage'),(43,'Can delete menu image',11,'delete_menuimage'),(44,'Can view menu image',11,'view_menuimage'),(45,'Can add franchise',12,'add_franchise'),(46,'Can change franchise',12,'change_franchise'),(47,'Can delete franchise',12,'delete_franchise'),(48,'Can view franchise',12,'view_franchise'),(49,'Can add cafe sub name',13,'add_cafesubname'),(50,'Can change cafe sub name',13,'change_cafesubname'),(51,'Can delete cafe sub name',13,'delete_cafesubname'),(52,'Can view cafe sub name',13,'view_cafesubname');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_address`
--

DROP TABLE IF EXISTS `cafe_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_address` (
  `cafe_id` bigint unsigned NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longtitude` decimal(9,6) NOT NULL,
  `sido` varchar(40) NOT NULL,
  `sigungu` varchar(40) NOT NULL,
  `doro` varchar(40) NOT NULL,
  `doro_code` varchar(10) NOT NULL,
  `sangse` varchar(165) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`cafe_id`),
  UNIQUE KEY `unique_latitude_longtitude` (`latitude`,`longtitude`),
  CONSTRAINT `cafe_address_cafe_id_2dcde7c0_fk` FOREIGN KEY (`cafe_id`) REFERENCES `cafe_cafe` (`cafe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_address`
--

LOCK TABLES `cafe_address` WRITE;
/*!40000 ALTER TABLE `cafe_address` DISABLE KEYS */;
INSERT INTO `cafe_address` VALUES (1,1.111000,8.012200,'가','다','나','12345',NULL,'2022-09-29 13:54:19.511767','2022-09-29 13:54:19.511789'),(2,1.111000,1.012200,'가','다','나','12345',NULL,'2022-09-29 13:55:05.480086','2022-09-29 13:55:05.480116'),(3,2.111000,2.012200,'가','다','나','12345',NULL,'2022-09-29 14:22:46.598768','2022-09-29 14:22:46.598806'),(4,3.111000,2.012200,'가','다','나','12345',NULL,'2022-09-29 14:23:44.997258','2022-09-29 14:23:44.997302'),(5,3.111000,2.021220,'가','다','나','12345',NULL,'2022-10-13 12:07:09.238649','2022-10-13 12:07:09.238662'),(7,3.111000,1.021220,'가','다','나','12345',NULL,'2022-10-17 14:15:29.681734','2022-10-17 14:15:29.681753'),(10,3.111000,30.021220,'가','다','나','12345',NULL,'2022-11-01 13:32:25.096318','2022-11-01 13:32:25.096342');
/*!40000 ALTER TABLE `cafe_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_cafe`
--

DROP TABLE IF EXISTS `cafe_cafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_cafe` (
  `cafe_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `main_name` varchar(165) NOT NULL,
  `is_operated` smallint NOT NULL,
  `is_franchise` tinyint(1) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `hours` json DEFAULT NULL,
  `sns` json DEFAULT NULL,
  `registrant` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`cafe_id`),
  UNIQUE KEY `unique_main_name` (`main_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_cafe`
--

LOCK TABLES `cafe_cafe` WRITE;
/*!40000 ALTER TABLE `cafe_cafe` DISABLE KEYS */;
INSERT INTO `cafe_cafe` VALUES (1,'카페8',1,0,NULL,'{}','{}','','2022-09-29 13:54:19.509893','2022-09-29 13:54:19.510015'),(2,'스타벅스',1,0,NULL,'{}','{}','','2022-09-29 13:55:05.479116','2022-09-29 13:55:05.479155'),(3,'커피빈',1,0,NULL,'{}','{}','','2022-09-29 14:22:46.587909','2022-09-29 14:22:46.588098'),(4,'개인카페',1,0,NULL,'{}','{}','','2022-09-29 14:23:44.992931','2022-09-29 14:23:44.993018'),(5,'개인카페2',1,0,NULL,'{}','{}','','2022-10-13 12:07:09.233085','2022-10-13 12:07:09.233132'),(7,'@@@@@',1,0,NULL,'{}','{}','','2022-10-17 14:15:29.681014','2022-10-17 14:15:29.681047'),(10,'테스트카페2',1,0,NULL,'{}','{}','','2022-11-01 13:32:25.095482','2022-11-01 13:32:25.095516');
/*!40000 ALTER TABLE `cafe_cafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_franchise`
--

DROP TABLE IF EXISTS `cafe_franchise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_franchise` (
  `cafe_id` bigint unsigned NOT NULL,
  `branch_name` varchar(40) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`cafe_id`),
  UNIQUE KEY `unique_branch_name_cafe` (`branch_name`,`cafe_id`),
  CONSTRAINT `cafe_franchise_cafe_id_5f0e5f76_fk` FOREIGN KEY (`cafe_id`) REFERENCES `cafe_cafe` (`cafe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_franchise`
--

LOCK TABLES `cafe_franchise` WRITE;
/*!40000 ALTER TABLE `cafe_franchise` DISABLE KEYS */;
INSERT INTO `cafe_franchise` VALUES (1,'뚝섬역점','2022-09-29 13:54:19.512514','2022-09-29 13:54:19.512526'),(2,'뚝섬역점','2022-09-29 13:55:05.481197','2022-09-29 13:55:05.481235'),(3,'뚝섬역점','2022-09-29 14:22:46.600051','2022-09-29 14:22:46.600078');
/*!40000 ALTER TABLE `cafe_franchise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_menu`
--

DROP TABLE IF EXISTS `cafe_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_menu` (
  `menu_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `price` int unsigned NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cafe_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `unique_name_cafe` (`name`,`cafe_id`),
  KEY `cafe_menu_cafe_id_41905e6f_fk` (`cafe_id`),
  CONSTRAINT `cafe_menu_cafe_id_41905e6f_fk` FOREIGN KEY (`cafe_id`) REFERENCES `cafe_cafe` (`cafe_id`),
  CONSTRAINT `cafe_menu_price_0e250444_check` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_menu`
--

LOCK TABLES `cafe_menu` WRITE;
/*!40000 ALTER TABLE `cafe_menu` DISABLE KEYS */;
INSERT INTO `cafe_menu` VALUES (1,'아메리카노',5000,'2022-09-29 13:54:19.516290','2022-09-29 13:54:19.516300',1),(2,'라떼',5000,'2022-09-29 13:54:19.516701','2022-09-29 13:54:19.516708',1),(3,'아메리카노',5000,'2022-09-29 13:55:05.482799','2022-09-29 13:55:05.482817',2),(4,'라떼',5000,'2022-09-29 13:55:05.483282','2022-09-29 13:55:05.483300',2),(5,'아메리카노',5000,'2022-09-29 14:22:46.601289','2022-09-29 14:22:46.601327',3),(6,'라떼',5000,'2022-09-29 14:22:46.601912','2022-09-29 14:22:46.601947',3),(7,'아메리카노',5000,'2022-09-29 14:23:45.000876','2022-09-29 14:23:45.000906',4),(8,'라떼',5000,'2022-09-29 14:23:45.001673','2022-09-29 14:23:45.001696',4),(9,'아메리카노',5000,'2022-10-13 12:07:09.240027','2022-10-13 12:07:09.240033',5),(10,'라떼',5000,'2022-10-13 12:07:09.240418','2022-10-13 12:07:09.240425',5),(11,'아메리카노',5000,'2022-10-17 14:15:29.683201','2022-10-17 14:15:29.683221',7),(12,'라떼',5000,'2022-10-17 14:15:29.684176','2022-10-17 14:15:29.684201',7),(15,'아메리카노',6000,'2022-11-01 13:32:25.100030','2022-11-01 13:32:25.100057',10),(16,'라떼',7000,'2022-11-01 13:32:25.100555','2022-11-01 13:32:25.100574',10);
/*!40000 ALTER TABLE `cafe_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_menu_image`
--

DROP TABLE IF EXISTS `cafe_menu_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_menu_image` (
  `manu_image_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image_url` varchar(2000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cafe_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`manu_image_id`),
  KEY `cafe_menu_image_cafe_id_78bbfee0_fk` (`cafe_id`),
  CONSTRAINT `cafe_menu_image_cafe_id_78bbfee0_fk` FOREIGN KEY (`cafe_id`) REFERENCES `cafe_cafe` (`cafe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_menu_image`
--

LOCK TABLES `cafe_menu_image` WRITE;
/*!40000 ALTER TABLE `cafe_menu_image` DISABLE KEYS */;
INSERT INTO `cafe_menu_image` VALUES (1,'http://test.com','2022-09-29 13:54:19.517575','2022-09-29 13:54:19.517616',1),(2,'http://test.com','2022-09-29 13:55:05.483775','2022-09-29 13:55:05.483799',2),(3,'http://test.com','2022-09-29 14:22:46.602331','2022-09-29 14:22:46.602346',3),(4,'http://test.com','2022-09-29 14:23:45.002159','2022-09-29 14:23:45.002178',4),(5,'http://test.com','2022-10-13 12:07:09.240631','2022-10-13 12:07:09.240637',5),(6,'http://test.com','2022-10-17 14:15:29.684791','2022-10-17 14:15:29.684815',7),(8,'http://test.com','2022-11-01 13:32:25.100975','2022-11-01 13:32:25.100999',10);
/*!40000 ALTER TABLE `cafe_menu_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafe_sub_name`
--

DROP TABLE IF EXISTS `cafe_sub_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe_sub_name` (
  `sub_name_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `cafe_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`sub_name_id`),
  UNIQUE KEY `unique_sub_name_cafe` (`sub_name`,`cafe_id`),
  KEY `cafe_sub_name_cafe_id_1f490d5e_fk` (`cafe_id`),
  CONSTRAINT `cafe_sub_name_cafe_id_1f490d5e_fk` FOREIGN KEY (`cafe_id`) REFERENCES `cafe_cafe` (`cafe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe_sub_name`
--

LOCK TABLES `cafe_sub_name` WRITE;
/*!40000 ALTER TABLE `cafe_sub_name` DISABLE KEYS */;
INSERT INTO `cafe_sub_name` VALUES (1,'카페팔','2022-09-29 13:54:19.512835','2022-09-29 13:54:19.512844',1),(2,'스벅','2022-09-29 13:55:05.482121','2022-09-29 13:55:05.482156',2),(3,'커피빈빈','2022-09-29 14:22:46.600544','2022-09-29 14:22:46.600564',3),(4,'개인카펭','2022-09-29 14:23:44.999707','2022-09-29 14:23:44.999744',4),(5,'개인카펭','2022-10-13 12:07:09.239538','2022-10-13 12:07:09.239546',5),(6,'개인카펭','2022-10-17 14:15:29.682298','2022-10-17 14:15:29.682316',7),(11,'개인카펭1','2022-11-01 13:32:25.097022','2022-11-01 13:32:25.097053',10),(12,'개인카펭2','2022-11-01 13:32:25.098272','2022-11-01 13:32:25.098344',10),(13,'개인카펭3','2022-11-01 13:32:25.099305','2022-11-01 13:32:25.099338',10);
/*!40000 ALTER TABLE `cafe_sub_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'cafe','address'),(10,'cafe','cafe'),(13,'cafe','cafesubname'),(12,'cafe','franchise'),(8,'cafe','menu'),(11,'cafe','menuimage'),(9,'cafe','menu_detail'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-07-18 22:14:27.744160'),(2,'auth','0001_initial','2022-07-18 22:14:27.816524'),(3,'admin','0001_initial','2022-07-18 22:14:27.836412'),(4,'admin','0002_logentry_remove_auto_add','2022-07-18 22:14:27.839269'),(5,'admin','0003_logentry_add_action_flag_choices','2022-07-18 22:14:27.842069'),(6,'contenttypes','0002_remove_content_type_name','2022-07-18 22:14:27.856033'),(7,'auth','0002_alter_permission_name_max_length','2022-07-18 22:14:27.865586'),(8,'auth','0003_alter_user_email_max_length','2022-07-18 22:14:27.877363'),(9,'auth','0004_alter_user_username_opts','2022-07-18 22:14:27.880193'),(10,'auth','0005_alter_user_last_login_null','2022-07-18 22:14:27.889685'),(11,'auth','0006_require_contenttypes_0002','2022-07-18 22:14:27.890305'),(12,'auth','0007_alter_validators_add_error_messages','2022-07-18 22:14:27.893046'),(13,'auth','0008_alter_user_username_max_length','2022-07-18 22:14:27.903670'),(14,'auth','0009_alter_user_last_name_max_length','2022-07-18 22:14:27.913641'),(15,'auth','0010_alter_group_name_max_length','2022-07-18 22:14:27.922059'),(16,'auth','0011_update_proxy_permissions','2022-07-18 22:14:27.924708'),(17,'auth','0012_alter_user_first_name_max_length','2022-07-18 22:14:27.936806'),(18,'sessions','0001_initial','2022-07-18 22:14:27.942417'),(44,'cafe','0001_initial','2022-09-29 13:43:57.238050'),(45,'cafe','0002_alter_address_cafe','2022-09-29 13:53:51.290466'),(46,'cafe','0003_alter_franchise_cafe','2022-09-29 13:54:14.785792'),(47,'cafe','0004_rename_is_franchising_cafe_is_franchise','2022-10-10 08:00:00.982706'),(48,'cafe','0005_alter_cafe_cafe_id','2022-10-10 08:00:01.122802'),(49,'cafe','0006_alter_cafesubname_sub_name_id_alter_menu_menu_id_and_more','2022-10-10 08:01:29.881985'),(50,'cafe','0005_alter_cafe_cafe_id_alter_cafesubname_sub_name_id_and_more','2022-10-10 08:06:00.524744'),(51,'cafe','0006_alter_cafesubname_cafe_alter_menu_price','2022-10-13 11:36:45.995081'),(52,'cafe','0007_alter_cafe_main_name_alter_menu_price','2022-11-01 12:06:06.074724');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-01 22:52:05
