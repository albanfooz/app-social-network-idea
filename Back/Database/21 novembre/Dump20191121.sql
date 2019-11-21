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
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Technologie','Projets Technologique',NULL),(2,'Jardinage','Projets de Jardinage',NULL),(3,'Mecanique','Projets de Mecanique',NULL);
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `collaborateur`
--

LOCK TABLES `collaborateur` WRITE;
/*!40000 ALTER TABLE `collaborateur` DISABLE KEYS */;
INSERT INTO `collaborateur` VALUES (1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `collaborateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `commentaire`
--

LOCK TABLES `commentaire` WRITE;
/*!40000 ALTER TABLE `commentaire` DISABLE KEYS */;
INSERT INTO `commentaire` VALUES (1,NULL,'Frumenti plerosque lactisque vini universis capi et et et possint lactisque et plerosque qua est et et usum plerosque per usum et et herbae vini et copia penitus mos aucupium.',1,1,'2019-11-21 16:47:08',NULL),(2,NULL,'Si portarum quis quis promptu persuasione portarum portarum multitudine obseratis.',2,1,'2019-11-21 16:47:08',NULL),(3,1,'Ea praefectum adseverantes questi palaestrita.',3,1,'2019-11-21 16:47:08',NULL),(4,NULL,'Evitandum ferociens leo non multa huius nihilo nihilo me evitandum lenius pastus pastus lenius scrutabatur.',4,1,'2019-11-21 16:47:08',NULL);
/*!40000 ALTER TABLE `commentaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fichier`
--

LOCK TABLES `fichier` WRITE;
/*!40000 ALTER TABLE `fichier` DISABLE KEYS */;
/*!40000 ALTER TABLE `fichier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `idee`
--

LOCK TABLES `idee` WRITE;
/*!40000 ALTER TABLE `idee` DISABLE KEYS */;
INSERT INTO `idee` VALUES (1,1,'Idee1','Ille florem causa liberis causa erubesceret adultae virginis Reguli uxor patris alitur uxor filia patris dotatur florem absentia causa nobilitas inops virginis erubesceret et florem ex Scipionis patris inops uxor stipe cum aerario virginis erubesceret uxor causa adultae et dotatur dotatur ille uxor dotatur amicorum inops uxor subsidiis Reguli conlaticia patris virginis florem adultae inops aerario cum dotatur cum filia Publicola nobilitas liberis ille et mariti absentia humatur pauperis humatur et nobilitas Publicola uxor ex cum absentia inops virginis erubesceret cum liberis stipe cum Valerius aerario florem nobilitas stipe virginis adultae aerario filia humatur pauperis alitur mariti Reguli mariti subsidiis.','2019-11-21 16:32:57',NULL,1),(2,2,'Idee2','Nam pervenire consulatu ante sine Martiis sine fuerit Martiis Februario cui pervenire Kalendis repente designatus sis sine cui antequam decreta habebit repente Quo ianuario licebit Februario sortiri et cui provincia consulatu paludatus paludatus habere fuerit fuerit non habebit an Quo certam et certam cui in paludatus ei ei non est et fuerit habebit antequam quod diem cui nascetur certam Kalendis Martiis sortiri et est provincia nascetur nascetur absurdum toto toto Nam provinciam provincia quod non designatus Martiis Nam decreta paludatus sortitus fuerit cui provinciam an Martiis repente toto decreta diem quod designatus sis est cui ante sortiri quod consulatu licebit.','2019-11-21 16:32:57',NULL,1),(3,3,'Idee3','Validum torpescit remedium lavacro percontatum domum amicum celsius apud est quoniam omnis quos morborum in quoniam additumque remedium satis medendi quos oculis etiam recipiant alienis valeant in remedium vel famulos modum celsius hac etiam perferentem colligati visa morborum videat aliud valeant ita in missos ut sedandos aegritudine valeant corpus lavacro ut eos corpus paucis ita torpescit eos missos nequi sedandos corpus similia lavacro quoniam capite professio acerbitates omnis percontatum noti ita vel quos paucis quos torpescit vel professio excogitatum recipiant additumque purgaverint aliud omnis colligati purgaverint aliud torpescit videat aliud etiam est in domum torpescit colligati apud satis etiam torpescit.','2019-11-21 16:32:57',NULL,2),(4,4,'Idee3','Et pecuniae contentione vel optimis et in et incidissent et maximas inter perduxissent labefactari vel condicionis cupiditatem longius inimicitias Quod pestem certamen exstitisse labefactari honoris optimis quo optimis honoris uxoriae maximas quibusque alicuius vel in contentionem in ad si perduxissent vel in honoris honoris vel commodi tamen posset honoris pecuniae contentione uxoriae cupiditatem uterque quod adulescentiam autem optimis si pecuniae ad pecuniae interdum pestem Quod inter quo adipisci quam longius adipisci posset maximas dirimi honoris saepe commodi in commodi quibusque quam certamen maximas amicissimos perduxissent quam non amicissimos et vel certamen in idem contentione perduxissent quam commodi et perduxissent nullam.','2019-11-21 16:32:57',NULL,3),(5,1,'Idee4','Ut nihilo modi ferociens quod ut ut ferociens multa ut me modi modi evitandum ferociens necem modum nihilo scrutabatur professione Gallus quae quorum excedamus quorum pastus non refert huius excedamus refert refert quae quae pastus leo modi leo narrare scrutabatur multa singula cadaveribus refert modum non est scrutabatur quae refert excedamus lenius modi est singula modi quae singula est excedamus Gallus quod professione necem cadaveribus Gallus multa quorum narrare ferociens cadaveribus Gallus singula leo modi pastus cadaveribus evitandum nihilo quae non multa multa nihilo nihilo necem multa excedamus narrare ut excedamus nihilo modi refert necem pastus est modum non non.','2019-11-21 16:32:57',NULL,2),(6,1,'Idee5','Castra est ne acueret consenuit per mota diligens exitiosa est Eusebius consenuit cubiculi praedicto tumor occultius periret genere sunt salus consenuit acueret ut deinde militum dilato missus occultius cubiculi et turbulentos praefecti praedicto praefecti castra consenuit opera consulta coeptantem distributo navata dilato ut tuto consulta ut praefecti genere salus insidiarum Galli consulta Galli insidiarum verum perferens avunculus astute concitores ne avunculus aurum opera seditionum deinde diligens insidiarum navata consulta praepotens distributo aurum genere est astute distributo perlato per perferens missus ut eum salus acueret consenuit hocque ne cogitabatur ne salus opera secum genere insidiarum per cogitabatur mota ut mota mota.','2019-11-21 16:32:57',NULL,1);
/*!40000 ALTER TABLE `idee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `marquer`
--

LOCK TABLES `marquer` WRITE;
/*!40000 ALTER TABLE `marquer` DISABLE KEYS */;
/*!40000 ALTER TABLE `marquer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` VALUES (1),(2),(3),(4);
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
INSERT INTO `profil` VALUES (2,NULL,1,'SorbetCitron','root','mail@mail.fr',0,'2019-11-21 16:23:14',NULL),(3,NULL,2,'Paul','root','mail.mail.com',0,'2019-11-21 16:23:48',NULL),(4,NULL,3,'Alban','root','mail@mail.nz',0,'2019-11-21 16:24:55',NULL),(5,NULL,4,'Luc','root','mail@mail.org',0,'2019-11-21 16:24:55',NULL);
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,'2019-11-21 16:57:07',1,NULL,1),(2,1,'2019-11-21 16:57:07',2,NULL,1),(3,1,'2019-11-21 16:57:07',3,NULL,1),(4,0,'2019-11-21 16:57:07',4,NULL,1),(5,1,'2019-11-21 16:57:07',1,2,NULL),(6,0,'2019-11-21 16:57:07',2,2,NULL),(7,0,'2019-11-21 16:57:07',3,2,NULL),(8,0,'2019-11-21 16:57:07',4,2,NULL);
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

-- Dump completed on 2019-11-21 16:59:03
