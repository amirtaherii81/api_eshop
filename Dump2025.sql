-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: db_api_eshop
-- ------------------------------------------------------
-- Server version	8.0.35

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add user',4,'add_customuser'),(14,'Can change user',4,'change_customuser'),(15,'Can delete user',4,'delete_customuser'),(16,'Can view user',4,'view_customuser'),(17,'Can add log entry',5,'add_logentry'),(18,'Can change log entry',5,'change_logentry'),(19,'Can delete log entry',5,'delete_logentry'),(20,'Can view log entry',5,'view_logentry'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add brand',7,'add_brand'),(26,'Can change brand',7,'change_brand'),(27,'Can delete brand',7,'delete_brand'),(28,'Can view brand',7,'view_brand'),(29,'Can add product group',8,'add_productgroup'),(30,'Can change product group',8,'change_productgroup'),(31,'Can delete product group',8,'delete_productgroup'),(32,'Can view product group',8,'view_productgroup'),(33,'Can add feature',9,'add_feature'),(34,'Can change feature',9,'change_feature'),(35,'Can delete feature',9,'delete_feature'),(36,'Can view feature',9,'view_feature'),(37,'Can add feature value',10,'add_featurevalue'),(38,'Can change feature value',10,'change_featurevalue'),(39,'Can delete feature value',10,'delete_featurevalue'),(40,'Can view feature value',10,'view_featurevalue'),(41,'Can add product',11,'add_product'),(42,'Can change product',11,'change_product'),(43,'Can delete product',11,'delete_product'),(44,'Can view product',11,'view_product'),(45,'Can add product feature',12,'add_productfeature'),(46,'Can change product feature',12,'change_productfeature'),(47,'Can delete product feature',12,'delete_productfeature'),(48,'Can view product feature',12,'view_productfeature'),(49,'Can add images product',13,'add_productgallery'),(50,'Can change images product',13,'change_productgallery'),(51,'Can delete images product',13,'delete_productgallery'),(52,'Can view images product',13,'view_productgallery');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user`
--

DROP TABLE IF EXISTS `custom_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `register_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `active_code` varchar(100) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile_number` (`mobile_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user`
--

LOCK TABLES `custom_user` WRITE;
/*!40000 ALTER TABLE `custom_user` DISABLE KEYS */;
INSERT INTO `custom_user` VALUES (1,'pbkdf2_sha256$600000$dmKrhwEFd5TsmogAOCqQVI$q1oJ7Sn1ThZJXS/aMBuUnWDEt3jZxIsNQcWEIFlrQYw=','2025-01-07 11:46:23.049614','0990','','','',NULL,'2024-12-29 11:54:06.827352',1,1,NULL,1),(9,'pbkdf2_sha256$600000$NzHf5Ue23syaAaV0vVpA1R$vwDQV/c7NiImntYhovMGNhI8Bzak6tOWXNLnBax7Nhk=',NULL,'0917','','','',NULL,'2025-01-05 20:53:19.416457',0,0,'7825',0),(10,'pbkdf2_sha256$600000$Nd4pRNPzeollXA0kTwfUj9$uNIh6qMTEe0qtlNUeNzL3Ao34d/licZH83UFUTI9vjE=',NULL,'0918','','','',NULL,'2025-01-05 21:01:33.622391',1,0,'7732',0);
/*!40000 ALTER TABLE `custom_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_groups`
--

DROP TABLE IF EXISTS `custom_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_groups_customuser_id_group_id_ea14f886_uniq` (`customuser_id`,`group_id`),
  KEY `custom_user_groups_group_id_02874f21_fk_auth_group_id` (`group_id`),
  CONSTRAINT `custom_user_groups_customuser_id_8e3d0338_fk_custom_user_id` FOREIGN KEY (`customuser_id`) REFERENCES `custom_user` (`id`),
  CONSTRAINT `custom_user_groups_group_id_02874f21_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_groups`
--

LOCK TABLES `custom_user_groups` WRITE;
/*!40000 ALTER TABLE `custom_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_user_permissions`
--

DROP TABLE IF EXISTS `custom_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_user_permiss_customuser_id_permission_f9232336_uniq` (`customuser_id`,`permission_id`),
  KEY `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `custom_user_user_per_customuser_id_ec2da4cb_fk_custom_us` FOREIGN KEY (`customuser_id`) REFERENCES `custom_user` (`id`),
  CONSTRAINT `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_user_permissions`
--

LOCK TABLES `custom_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `custom_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_user_permissions` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_custom_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-01-07 12:01:02.369830','10','برنج ستایش - 9کیلوگرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(2,'2025-01-07 12:01:02.369830','5','برنج طارم شمال - 10کیلوگرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(3,'2025-01-07 12:01:02.380338','12','دوغ کاله - 1.5لیتر',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(4,'2025-01-07 12:01:02.385592','14','دوغ کوچیک آبعلی',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(5,'2025-01-07 12:01:02.387598','3','شیر پر چرب - 1 لیتر',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(6,'2025-01-07 12:01:02.389597','2','شیر کم چرب - 1 لیتری',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(7,'2025-01-07 12:01:02.391600','16','ماست پر چرب کاله - 1کیلوگرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(8,'2025-01-07 12:01:02.393598','15','ماست پگاه کم چرب - 900گرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(9,'2025-01-07 12:01:02.395596','18','ماست سنتی کاله - 400گرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(10,'2025-01-07 12:01:02.397598','17','ماست کم چرب کاله - 600گرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(11,'2025-01-07 12:01:02.400597','20','ماکاراتی پیچ پیجی تک مقدار 500 گرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(12,'2025-01-07 12:01:02.402730','21','ماکارانی پیچ پیچی مانا مقدار 500گرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(13,'2025-01-07 12:01:02.402730','19','ماکارانی مانا 500گرم',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(14,'2025-01-07 12:01:02.402730','1','نوشابه پپسی - 1.5 لیتری',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(15,'2025-01-07 12:01:02.402730','24','نوشابه خانواده کوکاکولا - 1.5لیتر',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1),(16,'2025-01-07 12:01:02.402730','25','نوشابه قوطی کوکاکولا - 15 میلی لیتر',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (4,'accounts','customuser'),(5,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'contenttypes','contenttype'),(7,'products','brand'),(9,'products','feature'),(10,'products','featurevalue'),(11,'products','product'),(12,'products','productfeature'),(13,'products','productgallery'),(8,'products','productgroup'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-29 11:47:42.678647'),(2,'contenttypes','0002_remove_content_type_name','2024-12-29 11:47:42.722206'),(3,'auth','0001_initial','2024-12-29 11:47:42.893507'),(4,'auth','0002_alter_permission_name_max_length','2024-12-29 11:47:42.932447'),(5,'auth','0003_alter_user_email_max_length','2024-12-29 11:47:42.940124'),(6,'auth','0004_alter_user_username_opts','2024-12-29 11:47:42.947116'),(7,'auth','0005_alter_user_last_login_null','2024-12-29 11:47:42.956302'),(8,'auth','0006_require_contenttypes_0002','2024-12-29 11:47:42.961300'),(9,'auth','0007_alter_validators_add_error_messages','2024-12-29 11:47:42.968690'),(10,'auth','0008_alter_user_username_max_length','2024-12-29 11:47:42.976690'),(11,'auth','0009_alter_user_last_name_max_length','2024-12-29 11:47:42.983296'),(12,'auth','0010_alter_group_name_max_length','2024-12-29 11:47:42.999449'),(13,'auth','0011_update_proxy_permissions','2024-12-29 11:47:43.006529'),(14,'auth','0012_alter_user_first_name_max_length','2024-12-29 11:47:43.013986'),(15,'accounts','0001_initial','2024-12-29 11:47:43.037673'),(16,'accounts','0002_customuser_groups_customuser_is_superuser_and_more','2024-12-29 11:47:43.248954'),(17,'admin','0001_initial','2024-12-29 11:49:02.318809'),(18,'admin','0002_logentry_remove_auto_add','2024-12-29 11:49:02.327915'),(19,'admin','0003_logentry_add_action_flag_choices','2024-12-29 11:49:02.337329'),(20,'products','0001_initial','2024-12-29 11:49:02.369832'),(21,'sessions','0001_initial','2024-12-29 11:49:02.396646'),(22,'products','0002_alter_brand_image_name_productgroup','2024-12-29 11:49:33.703591'),(23,'products','0003_alter_brand_image_name_alter_productgroup_image_name_and_more','2024-12-29 11:49:58.651824'),(24,'products','0004_featurevalue_product_alter_brand_image_name_and_more','2024-12-29 19:11:18.858193'),(25,'products','0005_alter_brand_image_name_alter_product_image_name_and_more','2024-12-29 20:13:54.886540'),(26,'products','0006_alter_brand_image_name_alter_product_image_name_and_more','2024-12-29 20:22:40.041301'),(27,'products','0007_alter_brand_image_name_alter_product_image_name_and_more','2024-12-29 20:22:48.891701');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6our1fi9dbgd0xx9mtkxou7rzivf3dv8','eyJ1c2VyX3Nlc3Npb24iOnsibW9iaWxlX251bWJlciI6IjA5MTgiLCJhY3RpdmVfY29kZSI6MTIyOX19:1tUXkb:q2Xd-YpEAmByOb55iX-SuWYwKpx2rcyIKmxd_kwgrNU','2025-01-19 21:01:33.732112'),('dvtd23s23d8o2w9nwg2qxpzc0kxotvhl','.eJxVjEEOwiAQRe_C2pAOTWFw6d4zkGEYpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEOamzAnX63SLxQ-oO0p3qrWludV3mqHdFH7Tra0vyvBzu30GhXr61ZEaHKbIgop_8kCwSW-TohK2dDAwjI0VxFs2IxoPLLvsoGQCEjHp_APhvOCo:1tV81r:dnYRnoBpDKDL1WEg3VJoccF5Yi0fW0inWt4BMBx2ymc','2025-01-21 11:45:47.691432'),('eocqjrx5obqyhs9r7i01e7jhzxlb85bt','.eJxVjEEOwiAQRe_C2pAOTWFw6d4zkGEYpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEOamzAnX63SLxQ-oO0p3qrWludV3mqHdFH7Tra0vyvBzu30GhXr61ZEaHKbIgop_8kCwSW-TohK2dDAwjI0VxFs2IxoPLLvsoGQCEjHp_APhvOCo:1tRrsH:ImOZjba4GmqQFBH8-RP3RNQPCuQk8w8oZXwqWAxPsto','2025-01-12 11:54:25.401798'),('tkg4cyqp29y0zy5u1mbehliqjuci8399','.eJxVjEEOwiAQRe_C2pAOTWFw6d4zkGEYpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEOamzAnX63SLxQ-oO0p3qrWludV3mqHdFH7Tra0vyvBzu30GhXr61ZEaHKbIgop_8kCwSW-TohK2dDAwjI0VxFs2IxoPLLvsoGQCEjHp_APhvOCo:1tV82R:vF8fqf0Smg1nFuV6FkLX66qbRPvNQZXeUr61YfQntsg','2025-01-21 11:46:23.056799');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_brand`
--

DROP TABLE IF EXISTS `products_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand_title` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_brand_slug_925fd11b` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_brand`
--

LOCK TABLES `products_brand` WRITE;
/*!40000 ALTER TABLE `products_brand` DISABLE KEYS */;
INSERT INTO `products_brand` VALUES (1,'پپسی','','pepsi'),(2,'کوکاکولا','','coca-cola'),(3,'ردبول','','red-bull'),(4,'کاله','','kaleh'),(5,'خاطره','','khatereh'),(6,'طارم','','taram'),(7,'احمد','','ahmad'),(8,'آرسیس','','arsis'),(9,'مژده','','mozhdeh'),(10,'دل بهار','','del-bahar'),(11,'ستایش','','setaysh'),(12,'صباح','','sabah'),(13,'کاله','','kaleh'),(14,'آبعلی','','abali'),(15,'پگاه','','pegah'),(16,'مانا','','mana'),(17,'تک','','tak'),(18,'ویلی','','wili');
/*!40000 ALTER TABLE `products_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_feature`
--

DROP TABLE IF EXISTS `products_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_feature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_feature`
--

LOCK TABLES `products_feature` WRITE;
/*!40000 ALTER TABLE `products_feature` DISABLE KEYS */;
INSERT INTO `products_feature` VALUES (10,'وزن');
/*!40000 ALTER TABLE `products_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_feature_product_group`
--

DROP TABLE IF EXISTS `products_feature_product_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_feature_product_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feature_id` bigint NOT NULL,
  `productgroup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_feature_product_feature_id_productgroup__d519fdd3_uniq` (`feature_id`,`productgroup_id`),
  KEY `products_feature_pro_productgroup_id_ee26510f_fk_products_` (`productgroup_id`),
  CONSTRAINT `products_feature_pro_feature_id_44520903_fk_products_` FOREIGN KEY (`feature_id`) REFERENCES `products_feature` (`id`),
  CONSTRAINT `products_feature_pro_productgroup_id_ee26510f_fk_products_` FOREIGN KEY (`productgroup_id`) REFERENCES `products_productgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_feature_product_group`
--

LOCK TABLES `products_feature_product_group` WRITE;
/*!40000 ALTER TABLE `products_feature_product_group` DISABLE KEYS */;
INSERT INTO `products_feature_product_group` VALUES (58,10,7),(56,10,11),(57,10,12);
/*!40000 ALTER TABLE `products_feature_product_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_featurevalue`
--

DROP TABLE IF EXISTS `products_featurevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_featurevalue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value_title` varchar(100) NOT NULL,
  `feature_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_featurevalue_feature_id_24a69ce2_fk_products_feature_id` (`feature_id`),
  CONSTRAINT `products_featurevalue_feature_id_24a69ce2_fk_products_feature_id` FOREIGN KEY (`feature_id`) REFERENCES `products_feature` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_featurevalue`
--

LOCK TABLES `products_featurevalue` WRITE;
/*!40000 ALTER TABLE `products_featurevalue` DISABLE KEYS */;
INSERT INTO `products_featurevalue` VALUES (11,'10 گیلوگرم',10);
/*!40000 ALTER TABLE `products_featurevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_name` varchar(500) NOT NULL,
  `description` longtext,
  `summary_description` longtext,
  `image_name` varchar(100) NOT NULL,
  `price` int unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `register_date` date DEFAULT NULL,
  `published_date` date NOT NULL,
  `update_date` date NOT NULL,
  `slug` varchar(200) NOT NULL,
  `brand_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_brand_id_3e2e8fd1_fk_products_brand_id` (`brand_id`),
  KEY `products_product_slug_70d3148d` (`slug`),
  CONSTRAINT `products_product_brand_id_3e2e8fd1_fk_products_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `products_brand` (`id`),
  CONSTRAINT `products_product_chk_1` CHECK ((`price` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (1,'نوشابه پپسی - 1.5 لیتری','AAAA','sxaacascaasascs','images/product/97efbe9a-970c-4cf7-b2fa-989cd9ee3352/.jpg',20000,0,'2024-10-08','2024-10-08','2025-01-07','15',1),(2,'شیر کم چرب - 1 لیتری','bbbbbb','sxcaascsacacs','images/product/baef8cf1-0a21-4fff-bace-37e2af71c76c/.jpg',160000,0,'2024-10-08','2024-10-08','2025-01-07','1',4),(3,'شیر پر چرب - 1 لیتر','ccccccc','ascsacacascscac','images/product/d927837e-7465-4727-809a-0452370f82c1/.jpg',23000,0,'2024-10-08','2024-10-08','2025-01-07','1',4),(4,'برنج ایرانی خاطره - 10کیلوگرم','<p>dddddd</p>','sacsacsasacsac','images/product/97183731-78a5-4551-9326-ed838642c735/.jpg',30000,1,'2024-10-09','2024-10-10','2024-10-09','khatere-iranian-rice-10kg',5),(5,'برنج طارم شمال - 10کیلوگرم','eeeeeee','scascdscdvfsddf','images/product/ace04527-41f1-47ba-962e-1bda9ac718a8/.jpg',500000,0,'2024-10-09','2024-10-08','2025-01-07','10',6),(6,'برنج هندی احمد - 9کیلوگرم','ffffffff','vsdvsdvdsvdsvv','images/product/c2ac810a-5ae7-4834-8d10-b88078c538e1/.jpg',300000,1,'2024-10-09','2024-10-08','2024-10-09','ahmed-indian-rice-9kg',7),(7,'برنج هندی دانه بلند - 10کیلوگرم','gggggggg','sdvdsvsvssd','images/product/cb53fdd5-ff20-4591-9ae9-d30c30dd3328/.jpg',400000,1,'2024-10-09','2024-10-08','2024-10-09','indian-long-grain-rice-10kg',8),(8,'برنج مژده - 9کیلوگرم','hhhhhh','sddscdscsdcdscsd','images/product/b4a0d12c-f7fb-4eec-a184-894ac305a935/.jpg',300000,1,'2024-10-09','2024-10-08','2024-10-09','mojdeh-rice-9kg',9),(9,'برنج دل بهار - 10 کیلوگرم','<p>kkkk</p>','dscdscdscdscdsds','images/product/0f3e62fa-e568-4c86-a254-80120e450618/.jpg',600000,1,'2024-10-09','2024-10-15','2024-10-09','del-bahar-rice-10kg',10),(10,'برنج ستایش - 9کیلوگرم','eeeeee','dscdscdscdsvdsvv','images/product/700bb3a3-f054-41a0-bcd8-60b5d55ebfa4/.jpg',500000,0,'2024-10-09','2024-10-08','2025-01-07','9',11),(11,'دوغ صباح - 1.5لیتر','eeeeeee','dcscsdcdscsdcsv','images/product/f63e0531-78d3-46ff-b1bb-6c4819e39344/.jpg',15000,1,'2024-10-09','2024-10-09','2024-10-09','sabah-buttermilk-1-5litr',12),(12,'دوغ کاله - 1.5لیتر','eeeeeeee','sdcdsccsdcsdcdsc','images/product/11e9d483-1f32-4508-ac50-8a48c80d77e9/.jpg',15000,0,'2024-10-09','2024-10-09','2025-01-07','15',13),(13,'دوغ بزرگ آبعلی','eeeeeeeeee','sdcdscdsdsds','images/product/4dbb6497-5300-4f44-b143-9d07c95b4e13/.jpg',20000,1,'2024-10-09','2024-10-09','2024-10-09','abali-big',14),(14,'دوغ کوچیک آبعلی','eeeeeeeeee','ddscdssdcscds','images/product/3ed670ce-4250-4ed2-b3d8-a66992df3810/.jpg',12000,0,'2024-10-09','2024-10-09','2025-01-07','',14),(15,'ماست پگاه کم چرب - 900گرم','eeeeeeeee','dscdsdscddssdds','images/product/8a7ea534-cffb-4b1e-8bca-608bc4cb3639/.jpg',14000,0,'2024-10-09','2024-10-09','2025-01-07','900',15),(16,'ماست پر چرب کاله - 1کیلوگرم','eeeeeeeee','dsdscsdcsdcsdcsdd','images/product/cbf71935-52b4-4c09-bca3-68d1768c34ff/.jpg',12000,0,'2024-10-09','2024-10-09','2025-01-07','1',4),(17,'ماست کم چرب کاله - 600گرم','eeeeeeeeee','sdcsdsdcsklcndsCKLsd','images/product/06b01c0c-228c-4262-bb86-8e7ce8c88605/.jpg',16000,0,'2024-10-09','2024-10-09','2025-01-07','600',4),(18,'ماست سنتی کاله - 400گرم','<p>eeeeeeeee</p>','sdcsdsdcsklcndsCKLsd','images/product/5cfddaf8-b0fa-4ba5-8c81-cd6ce3a09e69/.jpg',10000,0,'2024-10-09','2024-10-10','2025-01-07','400',4),(19,'ماکارانی مانا 500گرم','eeeeeeeeee','sdcsdsdcsklcndsCKLsd','images/product/be2b9463-35bc-4b01-81d3-7186ab3d5794/.jpg',20000,0,'2024-10-09','2024-10-09','2025-01-07','500',16),(20,'ماکاراتی پیچ پیجی تک مقدار 500 گرم','eeeeeeeee','sdcsdsdcsklcndsCKLsd','images/product/d73d2dde-cf0a-435f-8d67-8137826b2da8/.jpg',28000,0,'2024-10-09','2024-10-09','2025-01-07','500',17),(21,'ماکارانی پیچ پیچی مانا مقدار 500گرم','aaaaaaaaa','sdcsdsdcsklcndsCKLsd','images/product/9c79c334-366e-4be3-ba60-18d9e263b6ac.jpg',24000,0,'2024-10-09','2024-10-09','2025-01-07','500',16),(22,'پنیر خامه ای ویلی مقدار 350گرم','aaaaaaaaaa','sdcsdsdcsklcndsCKLsd','images/product/fc612774-76b0-42dd-982e-d917f147c7d7.jpg',30000,1,'2024-10-09','2024-10-09','2024-10-09','wili-cheese-350g',18),(23,'پنیر خامه ای کاله 300گرم','aaaaaaaaa','sdcsdsdcsklcndsCKLsd','images/product/45f59ff6-fddd-4626-ace0-05db07ae5f2a.jpg',34000,1,'2024-10-09','2024-10-09','2024-10-09','kaleh-cheese-300g',4),(24,'نوشابه خانواده کوکاکولا - 1.5لیتر','aaaaaaaa','sdcsdsdcsklcndsCKLsd','images/product/976c4be1-ff29-4d56-8eba-a28c46754fd3.jpg',33000,0,'2024-10-09','2024-10-09','2025-01-07','15',2),(25,'نوشابه قوطی کوکاکولا - 15 میلی لیتر','aaaaaaaaa','sdcsdsdcsklcndsCKLsd','images/product/e5561ef0-1710-4764-ba7e-b5e765d6463a.jpg',15000,0,'2024-10-09','2024-10-09','2025-01-07','15',2);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product_product_group`
--

DROP TABLE IF EXISTS `products_product_product_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product_product_group` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `productgroup_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_product_product_product_id_productgroup__bd54ad4e_uniq` (`product_id`,`productgroup_id`),
  KEY `products_product_pro_productgroup_id_7f52086a_fk_products_` (`productgroup_id`),
  CONSTRAINT `products_product_pro_product_id_ddcf34ff_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_product_pro_productgroup_id_7f52086a_fk_products_` FOREIGN KEY (`productgroup_id`) REFERENCES `products_productgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product_product_group`
--

LOCK TABLES `products_product_product_group` WRITE;
/*!40000 ALTER TABLE `products_product_product_group` DISABLE KEYS */;
INSERT INTO `products_product_product_group` VALUES (1,1,2),(2,2,6),(3,3,6),(4,4,11),(5,5,11),(6,6,11),(7,7,11),(8,8,11),(9,9,11),(10,10,11),(11,11,3),(12,12,3),(13,13,3),(14,14,3),(15,15,8),(16,16,8),(17,17,8),(18,18,8),(19,19,12),(20,20,12),(21,21,12),(22,22,7),(23,23,7),(24,24,2),(25,25,2);
/*!40000 ALTER TABLE `products_product_product_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productfeature`
--

DROP TABLE IF EXISTS `products_productfeature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_productfeature` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(100) NOT NULL,
  `feature_id` bigint NOT NULL,
  `filter_value_id` bigint DEFAULT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productfeat_feature_id_19139ad6_fk_products_` (`feature_id`),
  KEY `products_productfeat_filter_value_id_2074e371_fk_products_` (`filter_value_id`),
  KEY `products_productfeat_product_id_b0721d47_fk_products_` (`product_id`),
  CONSTRAINT `products_productfeat_feature_id_19139ad6_fk_products_` FOREIGN KEY (`feature_id`) REFERENCES `products_feature` (`id`),
  CONSTRAINT `products_productfeat_filter_value_id_2074e371_fk_products_` FOREIGN KEY (`filter_value_id`) REFERENCES `products_featurevalue` (`id`),
  CONSTRAINT `products_productfeat_product_id_b0721d47_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productfeature`
--

LOCK TABLES `products_productfeature` WRITE;
/*!40000 ALTER TABLE `products_productfeature` DISABLE KEYS */;
INSERT INTO `products_productfeature` VALUES (7,'10 کیلوگرم',10,11,11);
/*!40000 ALTER TABLE `products_productfeature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productgallery`
--

DROP TABLE IF EXISTS `products_productgallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_productgallery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productgall_product_id_da3ba7cd_fk_products_` (`product_id`),
  CONSTRAINT `products_productgall_product_id_da3ba7cd_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productgallery`
--

LOCK TABLES `products_productgallery` WRITE;
/*!40000 ALTER TABLE `products_productgallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_productgallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productgroup`
--

DROP TABLE IF EXISTS `products_productgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_productgroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_title` varchar(100) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `description` longtext,
  `is_active` tinyint(1) NOT NULL,
  `register_date` datetime(6) DEFAULT NULL,
  `published_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `group_parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productgrou_group_parent_id_bb49bc40_fk_products_` (`group_parent_id`),
  KEY `products_productgroup_slug_be40fe80` (`slug`),
  CONSTRAINT `products_productgrou_group_parent_id_bb49bc40_fk_products_` FOREIGN KEY (`group_parent_id`) REFERENCES `products_productgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productgroup`
--

LOCK TABLES `products_productgroup` WRITE;
/*!40000 ALTER TABLE `products_productgroup` DISABLE KEYS */;
INSERT INTO `products_productgroup` VALUES (1,'نوشیدنی ها','','',1,'2024-10-08 00:02:54.210016','2024-10-07 23:56:45.000000','2024-10-08 00:02:54.210016','drinks',NULL),(2,'نوشابه','','',1,'2024-10-08 00:02:54.210951','2024-10-07 23:56:45.000000','2024-10-08 00:02:54.210951','soda',1),(3,'دوغ','','',1,'2024-10-08 00:02:54.211946','2024-10-07 23:56:45.000000','2024-10-08 00:02:54.211946','buttermilk',1),(4,'آبمیوه','','',1,'2024-10-08 00:02:54.212941','2024-10-07 23:56:45.000000','2024-10-08 00:02:54.212941','fruit-juice',1),(5,'لبنیات','','',1,'2024-10-08 00:11:10.618426','2024-10-08 00:06:36.000000','2024-10-08 00:11:10.618426','dairy',NULL),(6,'شیر','','',1,'2024-10-08 00:11:10.619536','2024-10-08 00:06:36.000000','2024-10-08 00:11:10.619536','milk',5),(7,'پنیر','','',1,'2024-10-08 00:11:10.620532','2024-10-08 00:06:36.000000','2024-10-08 00:11:10.620532','cheese',5),(8,'ماست','','',1,'2024-10-08 00:11:10.621530','2024-10-08 00:06:36.000000','2024-10-08 00:11:10.621530','yogurt',5),(9,'نان و غلات','','',1,'2024-10-08 00:19:43.470481','2024-10-08 00:13:36.000000','2024-10-08 00:19:43.470481','bread-cereals',NULL),(10,'نان','','',1,'2024-10-08 00:19:43.472525','2024-10-08 00:13:36.000000','2024-10-08 00:19:43.472525','bread',9),(11,'برنج','','',1,'2024-10-08 00:19:43.473480','2024-10-08 00:13:36.000000','2024-10-09 14:21:50.315618','rice',9),(12,'ماکارانی','','',1,'2024-10-08 00:19:43.474482','2024-10-08 00:13:36.000000','2024-10-08 00:19:43.474482','macarani',9),(13,'محصولات پروتئینی','images/product_group/9217b95b-f090-400b-b546-b7a76bbb805b/.jpg','توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی توضیحات محصولات پروتئینی',1,'2024-10-09 14:05:45.733293','2024-10-09 13:57:17.000000','2024-10-09 14:05:45.733293','protein-products',NULL),(14,'صبحانه','','توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه توضیحات صبحانه',1,'2024-10-09 14:07:10.977403','2024-10-09 14:06:28.000000','2024-10-09 14:07:10.977403','breakfast',NULL);
/*!40000 ALTER TABLE `products_productgroup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-08 10:52:30
