-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: bartosz-lauks-projekt-indywidualny_dev
-- ------------------------------------------------------
-- Server version	5.7.42

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `place_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Czenstochowa','12-123','ul. empty','123','2024-01-20 20:25:19','2024-01-20 20:25:19','Company');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departament`
--

DROP TABLE IF EXISTS `departament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departament` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_34F6FDA3979B1AD6` (`company_id`),
  CONSTRAINT `FK_34F6FDA3979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departament`
--

LOCK TABLES `departament` WRITE;
/*!40000 ALTER TABLE `departament` DISABLE KEYS */;
INSERT INTO `departament` VALUES (1,1,'Management','2024-01-20 20:48:40','2024-01-20 20:48:50'),(2,1,'Production','2024-01-21 15:55:17','2024-01-21 15:55:17');
/*!40000 ALTER TABLE `departament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20240120170259','2024-01-20 18:34:08',33),('DoctrineMigrations\\Version20240120194554','2024-01-20 19:47:04',149),('DoctrineMigrations\\Version20240120204403','2024-01-20 20:44:54',41),('DoctrineMigrations\\Version20240120220201','2024-01-20 22:02:31',61),('DoctrineMigrations\\Version20240121121623','2024-01-21 12:17:22',52),('DoctrineMigrations\\Version20240121122028','2024-01-21 12:21:01',49);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Man','2024-01-20 20:01:58','2024-01-20 20:01:59'),(2,'Female','2024-01-20 20:02:24','2024-01-20 20:02:26'),(3,'Boeing AH-64 Apache','2024-01-20 20:02:45','2024-01-20 20:02:46');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `priority` int(11) NOT NULL,
  `deadline` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `done` tinyint(1) NOT NULL,
  `finish_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_527EDB25A76ED395` (`user_id`),
  CONSTRAINT `FK_527EDB25A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,'Skończ ten projekt !','2024-01-20 22:11:58','2024-01-21 12:21:43',100,'2024-01-21 23:11:00',0,NULL,'End this'),(2,1,'qwe','2024-01-21 12:55:23','2024-01-21 14:40:14',1,'2024-01-22 13:55:00',1,'2024-01-21 14:40:14','End this 2'),(3,1,'<ol><li>1</li><li>2</li><li>3</li><li><h1>dsfds</h1></li><li><blockquote>dfdfddfdf<br>fddf</blockquote></li><li><blockquote><pre>print(test)</pre></blockquote></li><li><a href=\"https://www.facebook.com/\">https://www.facebook.com/</a></li><li>test</li></ol','2024-01-21 14:36:29','2024-01-21 14:38:41',4,'2024-01-31 15:36:00',0,NULL,'test'),(4,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:03:15',2,'2024-01-22 17:00:00',1,'2024-01-21 16:03:15','test'),(5,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(6,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(7,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(8,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(9,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(10,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(11,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(12,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(13,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(14,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(15,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(16,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test'),(17,2,'<ol><li>1</li><li>2</li><li>3</li><li><br></li></ol>','2024-01-21 16:01:06','2024-01-21 16:01:06',2,'2024-01-22 17:00:00',0,NULL,'test');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departament_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_C4E0A61F48B3EEE4` (`departament_id`),
  CONSTRAINT `FK_C4E0A61F48B3EEE4` FOREIGN KEY (`departament_id`) REFERENCES `departament` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1,'Main management board','2024-01-20 20:49:26','2024-01-20 20:49:27'),(2,2,'Workers','2024-01-21 15:55:31','2024-01-21 15:55:31');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_id` int(11) DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `house_and_apartment_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `team_id` int(11) DEFAULT NULL,
  `is_blocked` tinyint(1) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  KEY `IDX_8D93D649708A0E0` (`gender_id`),
  KEY `IDX_8D93D649296CD8AE` (`team_id`),
  CONSTRAINT `FK_8D93D649296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_8D93D649708A0E0` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'bartosz.lauks@interia.pl','[\"ROLE_ADMIN\"]','$2y$13$HZvK7Bxl3HXV7t05wzffTuFo6.bMuB5m6k/Ld.kUa7gUdRInUPLn2','Bartosz','Lauks','1998-07-27','Czestochowa','12-123','up. empty','69/2137','2024-01-20 21:43:03','2024-01-21 15:49:50',1,0,'Working'),(2,1,'bartosz.lauksstu@interia.pl','[]','$2y$13$yHsxUUQGMAB2bSFxde.v2uEpFRhc7LNDt0N93BhUTd6Z4qV0oIGnG','bar','lau','2024-01-24','Wola','97-123','Wyg','1/1','2024-01-21 15:54:45','2024-01-21 15:58:11',2,0,'Working');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-21 16:09:16
