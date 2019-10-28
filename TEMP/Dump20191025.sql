-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ideaboxdb
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_icelandic_ci DEFAULT NULL,
  `categoriecol` varchar(45) COLLATE utf8_icelandic_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentaire_id` int(11) DEFAULT NULL COMMENT 'commentaire parent',
  `membre_id` int(11) NOT NULL,
  `idee_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commentaire_commentaire_idx` (`commentaire_id`),
  KEY `fk_commentaire_membre1_idx` (`membre_id`),
  KEY `fk_commentaire_idee1_idx` (`idee_id`),
  CONSTRAINT `fk_commentaire_commentaire` FOREIGN KEY (`commentaire_id`) REFERENCES `commentaire` (`id`),
  CONSTRAINT `fk_commentaire_idee1` FOREIGN KEY (`idee_id`) REFERENCES `idee` (`id`),
  CONSTRAINT `fk_commentaire_membre1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaire`
--

LOCK TABLES `commentaire` WRITE;
/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichier`
--

DROP TABLE IF EXISTS `fichier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(800) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  `titre` varchar(255) CHARACTER SET utf8 COLLATE utf8_icelandic_ci DEFAULT NULL,
  `commentaire` varchar(500) CHARACTER SET utf8 COLLATE utf8_icelandic_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commentaire_id` int(11) DEFAULT NULL,
  `idee_id` int(11) DEFAULT NULL,
  `membre_id` int(11) NOT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_icelandic_ci DEFAULT 'image',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom_UNIQUE` (`nom`),
  KEY `fk_fichier_commentaire1_idx` (`commentaire_id`),
  KEY `fk_fichier_idee1_idx` (`idee_id`),
  KEY `fk_fichier_membre1_idx` (`membre_id`),
  CONSTRAINT `fk_fichier_commentaire1` FOREIGN KEY (`commentaire_id`) REFERENCES `commentaire` (`id`),
  CONSTRAINT `fk_fichier_idee1` FOREIGN KEY (`idee_id`) REFERENCES `idee` (`id`),
  CONSTRAINT `fk_fichier_membre1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichier`
--

LOCK TABLES `fichier` WRITE;
/*!40000 ALTER TABLE `fichier` DISABLE KEYS */;
/*!40000 ALTER TABLE `fichier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idee`
--

DROP TABLE IF EXISTS `idee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(500) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_at` datetime DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idee_type1_idx` (`type_id`),
  CONSTRAINT `fk_idee_type1` FOREIGN KEY (`type_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idee`
--

LOCK TABLES `idee` WRITE;
/*!40000 ALTER TABLE `idee` DISABLE KEYS */;
/*!40000 ALTER TABLE `idee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marquer`
--

DROP TABLE IF EXISTS `marquer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marquer` (
  `tag_id` int(11) NOT NULL,
  `idee_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`idee_id`),
  KEY `fk_tag_has_idee_idee1_idx` (`idee_id`),
  KEY `fk_tag_has_idee_tag1_idx` (`tag_id`),
  CONSTRAINT `fk_tag_has_idee_idee1` FOREIGN KEY (`idee_id`) REFERENCES `idee` (`id`),
  CONSTRAINT `fk_tag_has_idee_tag1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marquer`
--

LOCK TABLES `marquer` WRITE;
/*!40000 ALTER TABLE `marquer` DISABLE KEYS */;
/*!40000 ALTER TABLE `marquer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fichier_id` int(11) NOT NULL COMMENT 'photo de profil',
  `membre_id` int(11) NOT NULL,
  `login` varchar(200) COLLATE utf8_icelandic_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_icelandic_ci NOT NULL,
  `nom` varchar(200) COLLATE utf8_icelandic_ci DEFAULT NULL,
  `prenom` varchar(200) COLLATE utf8_icelandic_ci DEFAULT NULL,
  `ceated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_profil_fichier1_idx` (`fichier_id`),
  KEY `fk_profil_membre1_idx` (`membre_id`),
  CONSTRAINT `fk_profil_fichier1` FOREIGN KEY (`fichier_id`) REFERENCES `fichier` (`id`),
  CONSTRAINT `fk_profil_membre1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `idrole` int(11) NOT NULL,
  `membre_id` int(11) NOT NULL,
  `idee_id` int(11) NOT NULL,
  `porteur_projet` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idrole`),
  KEY `fk_role_membre_idx` (`membre_id`),
  KEY `fk_role_idee1_idx` (`idee_id`),
  CONSTRAINT `fk_role_idee1` FOREIGN KEY (`idee_id`) REFERENCES `idee` (`id`),
  CONSTRAINT `fk_role_membre` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `positif` tinyint(4) DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `membre_id` int(11) NOT NULL,
  `commentaire_id` int(11) DEFAULT NULL,
  `idee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vote_membre1_idx` (`membre_id`),
  KEY `fk_vote_commentaire1_idx` (`commentaire_id`),
  KEY `fk_vote_idee1_idx` (`idee_id`),
  CONSTRAINT `fk_vote_commentaire1` FOREIGN KEY (`commentaire_id`) REFERENCES `commentaire` (`id`),
  CONSTRAINT `fk_vote_idee1` FOREIGN KEY (`idee_id`) REFERENCES `idee` (`id`),
  CONSTRAINT `fk_vote_membre1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-25 19:48:38
