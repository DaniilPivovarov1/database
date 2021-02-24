-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `admin_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_community_user1_idx` (`admin_id`),
  CONSTRAINT `fk_community_user1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_request` (
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 - отказ\n0 - запрос\n1 - дружба',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_request_user1_idx` (`from_user_id`),
  KEY `fk_friend_request_user2_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_request_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_friend_request_user2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_to_media`
--

DROP TABLE IF EXISTS `like_to_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_to_media` (
  `id` int NOT NULL,
  `from_user_id` int unsigned NOT NULL,
  `media_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_to_media_user1_idx` (`from_user_id`),
  KEY `fk_likes_to_media_media1_idx` (`media_id`),
  CONSTRAINT `fk_likes_to_media_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_to_media_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_to_media`
--

LOCK TABLES `like_to_media` WRITE;
/*!40000 ALTER TABLE `like_to_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_to_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_to_post`
--

DROP TABLE IF EXISTS `like_to_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_to_post` (
  `id` int NOT NULL,
  `from_user_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_like_to_post_user1_idx` (`from_user_id`),
  KEY `fk_like_to_post_post1_idx` (`post_id`),
  CONSTRAINT `fk_like_to_post_post1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_like_to_post_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_to_post`
--

LOCK TABLES `like_to_post` WRITE;
/*!40000 ALTER TABLE `like_to_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_to_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blob` blob,
  `metadata` json DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_type1_idx` (`media_type_id`),
  KEY `fk_media_user1_idx` (`user_id`),
  CONSTRAINT `fk_media_media_type1` FOREIGN KEY (`media_type_id`) REFERENCES `media_type` (`id`),
  CONSTRAINT `fk_media_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_type`
--

LOCK TABLES `media_type` WRITE;
/*!40000 ALTER TABLE `media_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int unsigned NOT NULL,
  `to_user_id` int unsigned NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `media_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_message_user1_idx` (`from_user_id`),
  KEY `fk_message_user2_idx` (`to_user_id`),
  KEY `fk_message_media1_idx` (`media_id`),
  CONSTRAINT `fk_message_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_message_user1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_message_user2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `community_id` int unsigned DEFAULT NULL,
  `post_id` int unsigned DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `media_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_post_user1_idx` (`user_id`),
  KEY `fk_post_community1_idx` (`community_id`),
  KEY `fk_post_media1_idx` (`media_id`),
  KEY `fk_post_post1_idx` (`post_id`),
  CONSTRAINT `fk_post_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_post_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_post_post1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_post_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `user_id` int unsigned NOT NULL,
  `firstname` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` set('m','f','x') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_id` int unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_profile_media1_idx` (`photo_id`),
  CONSTRAINT `fk_profile_media1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint NOT NULL,
  `password_hash` char(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_community`
--

DROP TABLE IF EXISTS `user_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_community` (
  `community_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `fk_user_community_community1_idx` (`community_id`),
  KEY `fk_user_community_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_community_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_user_community_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_community`
--

LOCK TABLES `user_community` WRITE;
/*!40000 ALTER TABLE `user_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_community` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24 15:28:24
