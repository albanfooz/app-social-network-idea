CREATE DATABASE  IF NOT EXISTS `ideabox` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ideabox`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ideabox
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
  `categoriecol` varchar(45) CHARACTER SET utf8 COLLATE utf8_icelandic_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Technologie','Projets Technologique',NULL),(2,'Jardinage','Projets de Jardinage',NULL),(3,'Mecanique','Projets de Mecanique',NULL);
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collaborateur`
--

DROP TABLE IF EXISTS `collaborateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collaborateur` (
  `idee_id` int(11) NOT NULL,
  `membre_id` int(11) NOT NULL,
  PRIMARY KEY (`idee_id`,`membre_id`),
  KEY `fk_idee_has_membre_membre1_idx` (`membre_id`),
  KEY `fk_idee_has_membre_idee1_idx` (`idee_id`),
  CONSTRAINT `fk_idee_has_membre_idee1` FOREIGN KEY (`idee_id`) REFERENCES `idee` (`id`),
  CONSTRAINT `fk_idee_has_membre_membre1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collaborateur`
--

LOCK TABLES `collaborateur` WRITE;
/*!40000 ALTER TABLE `collaborateur` DISABLE KEYS */;
INSERT INTO `collaborateur` VALUES (1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `collaborateur` ENABLE KEYS */;
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
  `contenu` varchar(500) COLLATE utf8_icelandic_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaire`
--

LOCK TABLES `commentaire` WRITE;
/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */;
INSERT INTO `commentaire` VALUES (1,NULL,'Frumenti plerosque lactisque vini universis capi et et et possint lactisque et plerosque qua est et et usum plerosque per usum et et herbae vini et copia penitus mos aucupium.',1,1,'2019-11-21 16:47:08',NULL),(2,NULL,'Si portarum quis quis promptu persuasione portarum portarum multitudine obseratis.',2,1,'2019-11-21 16:47:08',NULL),(3,1,'Ea praefectum adseverantes questi palaestrita.',3,1,'2019-11-21 16:47:08',NULL),(4,NULL,'Evitandum ferociens leo non multa huius nihilo nihilo me evitandum lenius pastus pastus lenius scrutabatur.',4,1,'2019-11-21 16:47:08',NULL),(6,NULL,'Test1',1,1,'2019-11-27 13:31:20',NULL),(7,NULL,'Test2',3,3,'2019-11-27 13:39:00',NULL),(8,NULL,'Test3',2,2,'2019-11-27 13:44:24',NULL),(9,NULL,'Test3',2,2,'2019-11-27 13:47:41',NULL),(10,NULL,'Test3',2,2,'2019-11-27 13:49:05',NULL),(11,NULL,'Test3',2,2,'2019-11-27 13:49:23',NULL),(12,NULL,'Test3',2,2,'2019-11-27 13:59:26',NULL),(14,1,'Test3',2,2,'2019-11-27 14:01:51',NULL);
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
  `deleted_at` datetime DEFAULT NULL,
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
  `membre_id` int(11) NOT NULL,
  `titre` varchar(500) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_at` datetime DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idee_type1_idx` (`type_id`),
  KEY `fk_idee_membre1_idx` (`membre_id`),
  CONSTRAINT `fk_idee_membre1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`),
  CONSTRAINT `fk_idee_type1` FOREIGN KEY (`type_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idee`
--

LOCK TABLES `idee` WRITE;
/*!40000 ALTER TABLE `idee` DISABLE KEYS */;
INSERT INTO `idee` VALUES (1,1,'Suspendisse ullamcorper purus vel ','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-21 16:32:57',NULL,1),(2,2,'Fusce iaculis vulputate quam','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-21 16:32:57',NULL,1),(3,3,'Praesent iaculis sem eu ligula hendrerit','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-21 16:32:57',NULL,2),(4,4,'Nunc orci tortor, laoreet quis diam vitae','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-21 16:32:57',NULL,3),(5,1,'Donec quis velit quis nisl','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-21 16:32:57',NULL,2),(6,1,'Duis sit amet sodales massa','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-21 16:32:57',NULL,1),(7,2,'Proin quis arcu eget ligula venenatis','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,2),(8,3,'Nullam quis maximus, a pellentesque lacus','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,2),(9,4,'Promiscuae fortunae mercatoribus priscorum ','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,3),(10,4,'Dignus dignus non isdem','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,1),(11,2,'Gravitatem quidem severitas ','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,2),(12,2,'Euphratensis amplis descriptione nunc ','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,3),(13,1,'Replicando nullus tenus per sed ut ','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,2),(14,2,'Rebus: coloratis quaeritat amicti nec','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,2),(15,2,'Etenim si attendere diligenter','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed arcu suscipit, commodo nisi in, bibendum diam. Phasellus aliquet erat at purus efficitur, vitae lobortis sem suscipit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus posuere diam vel tincidunt blandit. Duis mi mauris, iaculis ac ipsum nec, mollis pretium odio. Vivamus non mauris magna. Quisque mattis sem id pulvinar tincidunt. In quis aliquet ante. Sed blandit justo sed quam consectetur aliquam. Fusce viverra posuere aliquam. Nunc tincidunt augue posuere tempus lacinia. Nunc posuere nec nulla quis mollis. In hac habitasse platea dictumst. Duis sollicitudin mauris eu velit gravida aliquet. Mauris id diam sed felis euismod dignissim. Proin sed sapien molestie, convallis est sit amet, dignissim diam.</p><p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce nec odio efficitur ligula faucibus sollicitudin. Etiam tincidunt blandit lacus id pharetra. Sed ut odio erat. Morbi faucibus, mauris ut vulputate lobortis, elit justo sagittis turpis, quis aliquet metus quam sollicitudin dolor. Nullam faucibus, sapien vitae tristique bibendum, urna lectus lobortis lectus, ullamcorper efficitur lacus quam non ipsum. Ut luctus pharetra lectus bibendum volutpat.</p><p>Duis at sapien sed libero consequat vestibulum ut vitae lectus. Nam pellentesque ac neque ut lacinia. Vestibulum lacinia a dui sed convallis. Sed orci massa, sagittis at purus vitae, accumsan pulvinar nunc. Nulla fermentum pharetra mattis. Ut tempor mauris nec enim tincidunt imperdiet. Nam nec accumsan libero. Mauris efficitur pretium purus, at rutrum eros pulvinar ac. Cras tincidunt aliquet sagittis. Donec ac dolor elementum, luctus lectus non, cursus elit. Phasellus a nunc a felis hendrerit porttitor. Aliquam erat volutpat. In laoreet nibh ligula, et sollicitudin risus ultrices a.</p><p>Phasellus non pulvinar nisi. Suspendisse molestie elit ac eleifend rhoncus. Vestibulum molestie lacus iaculis orci venenatis efficitur. Morbi a augue tortor. Morbi bibendum nibh et diam ullamcorper, id aliquam risus elementum. Vivamus lobortis neque eget sollicitudin molestie. Maecenas leo diam, congue eu venenatis eget, viverra vel lectus. Donec commodo sit amet arcu sed porta. Morbi ac scelerisque dolor. Donec sodales in dolor quis condimentum. Nam volutpat nec erat sed molestie. Aenean tristique laoreet porttitor. Nullam eu consequat libero. Ut imperdiet, ante at consectetur imperdiet, nunc lacus condimentum ex, nec euismod dui orci in metus. Vivamus at urna augue. Suspendisse aliquam posuere tincidunt.</p><p>Donec sed tincidunt nulla, at dignissim ligula. Sed ut pulvinar eros, ac laoreet felis. In in volutpat quam. Quisque lobortis, enim id faucibus molestie, dolor nibh volutpat augue, non dictum libero est eu lorem. Praesent non condimentum orci. Sed consequat et sapien ullamcorper posuere. Donec auctor ante ut sagittis eleifend. Mauris efficitur id ante ac bibendum. Proin ornare at enim sit amet mattis.</p></div>','2019-11-28 16:08:31',NULL,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` VALUES (1),(2),(3),(4),(5);
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
  `fichier_id` int(11) DEFAULT NULL COMMENT 'photo de profil',
  `membre_id` int(11) NOT NULL,
  `login` varchar(200) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_icelandic_ci NOT NULL,
  `e-mail` varchar(100) COLLATE utf8_icelandic_ci DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_profil_fichier1_idx` (`fichier_id`),
  KEY `fk_profil_membre1_idx` (`membre_id`),
  CONSTRAINT `fk_profil_fichier1` FOREIGN KEY (`fichier_id`) REFERENCES `fichier` (`id`),
  CONSTRAINT `fk_profil_membre1` FOREIGN KEY (`membre_id`) REFERENCES `membre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
INSERT INTO `profil` VALUES (2,NULL,1,'SorbetCitron','root','mail@mail.fr',0,'2019-11-21 16:23:14',NULL),(3,NULL,2,'Paul','root','mail.mail.com',0,'2019-11-21 16:23:48',NULL),(4,NULL,3,'Alban','root','mail@mail.nz',0,'2019-11-21 16:24:55',NULL),(5,NULL,4,'Luc','root','mail@mail.org',0,'2019-11-21 16:24:55',NULL);
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8 COLLATE=utf8_icelandic_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (2,1,'2019-11-21 16:57:07',2,NULL,1),(3,1,'2019-11-21 16:57:07',3,NULL,1),(4,1,'2019-11-21 16:57:07',4,NULL,1),(5,1,'2019-11-21 16:57:07',1,2,NULL),(6,1,'2019-11-21 16:57:07',2,2,NULL),(7,1,'2019-11-21 16:57:07',3,2,NULL),(8,1,'2019-11-21 16:57:07',4,2,NULL),(13,1,'2019-11-28 16:11:07',3,NULL,14),(14,1,'2019-11-28 16:11:07',2,NULL,13),(15,1,'2019-11-28 16:11:07',4,NULL,12),(16,1,'2019-11-28 16:11:07',1,NULL,11),(17,1,'2019-11-28 16:11:07',3,NULL,10),(18,1,'2019-11-28 16:11:07',2,NULL,8),(19,1,'2019-11-28 16:11:07',4,NULL,7),(20,1,'2019-11-28 16:11:07',1,NULL,5),(21,1,'2019-11-28 16:11:07',3,NULL,4),(22,1,'2019-11-28 16:11:07',4,NULL,3),(23,1,'2019-11-28 16:11:07',3,NULL,2),(24,1,'2019-11-28 16:11:07',2,NULL,1),(25,1,'2019-11-28 16:11:07',1,NULL,5),(26,1,'2019-11-28 16:11:07',4,NULL,9),(27,1,'2019-11-28 16:11:07',4,NULL,7),(28,1,'2019-11-28 16:11:07',2,NULL,8),(29,1,'2019-11-28 16:11:07',4,NULL,8),(30,1,'2019-11-28 16:11:07',3,NULL,6),(31,1,'2019-11-28 16:11:07',1,NULL,5),(32,1,'2019-11-28 16:11:07',2,NULL,4),(33,1,'2019-11-28 16:11:07',1,NULL,4),(34,1,'2019-11-28 16:11:07',3,NULL,2),(35,1,'2019-11-28 16:11:07',2,NULL,3),(36,1,'2019-11-28 16:11:07',4,NULL,5),(37,1,'2019-11-28 16:11:07',3,NULL,8),(38,1,'2019-11-28 16:11:07',2,NULL,5),(39,1,'2019-11-28 16:11:07',1,NULL,6),(40,1,'2019-11-28 16:11:07',2,NULL,1),(41,1,'2019-11-28 16:11:07',3,NULL,3),(42,1,'2019-11-28 16:39:54',1,NULL,3),(319,1,'2019-11-28 16:39:54',1,NULL,4),(320,1,'2019-11-28 16:39:54',1,NULL,5),(321,1,'2019-11-28 16:39:54',1,NULL,6),(322,1,'2019-11-28 16:39:54',1,NULL,7),(323,1,'2019-11-28 16:39:54',1,NULL,8),(324,1,'2019-11-28 16:39:54',1,NULL,8),(325,1,'2019-11-28 16:39:54',1,NULL,8),(326,1,'2019-11-28 16:39:54',1,NULL,8),(327,1,'2019-11-28 16:39:54',1,NULL,9),(328,1,'2019-11-28 16:39:54',1,NULL,9),(329,1,'2019-11-28 16:39:54',1,NULL,9),(330,1,'2019-11-28 16:39:54',1,NULL,9),(331,1,'2019-11-28 16:39:54',1,NULL,9),(332,1,'2019-11-28 16:39:54',1,NULL,9),(333,1,'2019-11-28 16:39:54',1,NULL,9),(334,1,'2019-11-28 16:39:54',1,NULL,9),(335,1,'2019-11-28 16:39:54',1,NULL,9);
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

-- Dump completed on 2019-11-29 15:55:37
