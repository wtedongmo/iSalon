-- MySQL dump 10.13  Distrib 5.6.10, for Win32 (x86)
--
-- Host: localhost    Database: gestcommtn2
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `comptepersonne`
--

DROP TABLE IF EXISTS `comptepersonne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comptepersonne` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) DEFAULT NULL,
  `code_personne` int(11) DEFAULT NULL,
  `type_compte` varchar(50) DEFAULT NULL,
  `categorie_personne` varchar(50) DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_eqwc3up4p29u3hv9hudxl2kjr` (`code_personne`),
  CONSTRAINT `FK_eqwc3up4p29u3hv9hudxl2kjr` FOREIGN KEY (`code_personne`) REFERENCES `personne` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comptepersonne`
--

LOCK TABLES `comptepersonne` WRITE;
/*!40000 ALTER TABLE `comptepersonne` DISABLE KEYS */;
INSERT INTO `comptepersonne` VALUES (1,'Tedongmo Wilfried',1,'PINCIAPAL','DISTRIBUTOR',0,0,'Cotton','20/07/2015 23:14:29',NULL,NULL,NULL),(2,'Fournisseur Distributeur Principal',2,'PINCIAPAL','DISTRIBUTOR',43200,34500,'Cotton','20/07/2015 23:23:01',NULL,'Cotton','24/07/2015 13:45:25'),(3,'Delegue 1',3,'PINCIAPAL','DELEGATE',15800,43200,'Cotton','20/07/2015 23:24:31',NULL,'Cotton','24/07/2015 13:45:25'),(4,'Delegue 1 CP Auxiliaire',3,'AUXILIAIRE','DELEGATE',2678500,0,'Cotton','20/07/2015 23:24:31',NULL,'Cotton','25/07/2015 21:31:19'),(5,'Delegue 2',4,'PINCIAPAL','DELEGATE',15500,0,'Cotton','20/07/2015 23:25:23',NULL,'Cotton','21/07/2015 22:07:33'),(6,'Delegue 2 CP Auxiliaire',4,'AUXILIAIRE','DELEGATE',1843750,0,'Cotton','20/07/2015 23:25:23',NULL,'Cotton','25/07/2015 21:37:21'),(7,'Delegue 3',5,'PINCIAPAL','DELEGATE',0,0,'Cotton','20/07/2015 23:26:07',NULL,NULL,NULL),(8,'Delegue 3 CP Auxiliaire',5,'AUXILIAIRE','DELEGATE',825750,0,'Cotton','20/07/2015 23:26:07',NULL,'Cotton','25/07/2015 21:37:38'),(9,'Vendeur 1',6,'PINCIAPAL','VENDOR',86250,150000,'Cotton','20/07/2015 23:32:28',NULL,'Cotton','25/07/2015 21:39:32'),(10,'Vendeur 2',7,'PINCIAPAL','VENDOR',72850,72000,'Cotton','20/07/2015 23:33:14',NULL,'Cotton','25/07/2015 21:38:34'),(11,'Default Cleint',8,'PINCIAPAL','CLIENT',0,0,'Cotton','20/07/2015 23:37:17',NULL,NULL,NULL),(12,'Default Person',9,'PINCIAPAL','CLIENT',0,5329150,'Cotton','20/07/2015 23:38:22',NULL,'Cotton','25/07/2015 21:39:32');
/*!40000 ALTER TABLE `comptepersonne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `droit`
--

DROP TABLE IF EXISTS `droit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `droit` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `code_profil` int(11) NOT NULL,
  `code_rubrique` int(11) NOT NULL,
  `isenabled` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_n6vtej6pirtyi8mx5dijj2xav` (`code_profil`),
  KEY `FK_56xhiux27xw2abg9xmujhgpgm` (`code_rubrique`),
  CONSTRAINT `FK_56xhiux27xw2abg9xmujhgpgm` FOREIGN KEY (`code_rubrique`) REFERENCES `rubrique` (`code`),
  CONSTRAINT `FK_n6vtej6pirtyi8mx5dijj2xav` FOREIGN KEY (`code_profil`) REFERENCES `profil` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `droit`
--

LOCK TABLES `droit` WRITE;
/*!40000 ALTER TABLE `droit` DISABLE KEYS */;
/*!40000 ALTER TABLE `droit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `isenabled` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_oytepumsam0jvxieqkuti3ihu` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,NULL,NULL,'ACTIF',NULL,NULL,'Menu',NULL),(2,'Cotton','17/07/2015 13:13:46','ACTIF','','','Securite',NULL),(3,'Cotton','17/07/2015 13:14:40','ACTIF','','','Gestion Puces',NULL),(4,'Cotton','17/07/2015 13:15:15','ACTIF','','','Paiement',NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mouvementpuce`
--


--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiement` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `compte_client` int(11) DEFAULT NULL,
  `compte_fournisseur` int(11) DEFAULT NULL,
  `datepaiement` datetime DEFAULT NULL,
  `sens` varchar(255) DEFAULT NULL,
  `montant` double DEFAULT NULL,
  `objet` varchar(100) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_87d1j278w62t9x5ckifj8inbv` (`compte_client`),
  KEY `FK_s8mn64p6nyuurgcr2jeu08wyw` (`compte_fournisseur`),
  CONSTRAINT `FK_s8mn64p6nyuurgcr2jeu08wyw` FOREIGN KEY (`compte_fournisseur`) REFERENCES `comptepersonne` (`code`),
  CONSTRAINT `FK_87d1j278w62t9x5ckifj8inbv` FOREIGN KEY (`compte_client`) REFERENCES `comptepersonne` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
INSERT INTO `paiement` VALUES (1,5,2,'2015-07-21 22:07:33','ENTREE',15500,'Paiement transfert','1/2015/07/21','Cotton','21/07/2015 22:07:33','ACTIF','Cotton','21/07/2015 22:07:33'),(2,9,2,'2015-07-22 20:41:29','ENTREE',3200,'Reglement vendeur','2/2015/07/22','Cotton','22/07/2015 20:41:28','ACTIF','Cotton','22/07/2015 20:41:30');
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametre`
--

DROP TABLE IF EXISTS `parametre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametre` (
  `codeparams` varchar(50) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `valeur` varchar(100) DEFAULT NULL,
  `description` text,
  `code` int(11) NOT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codeparams`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametre`
--

LOCK TABLES `parametre` WRITE;
/*!40000 ALTER TABLE `parametre` DISABLE KEYS */;
INSERT INTO `parametre` VALUES ('mtn.chemin.image.entete','Image Entete','localhost:8082/entete.png',NULL,0,NULL,NULL,NULL,NULL,NULL),('mtn.default.compte','Compte Compte personne par défaut','12',NULL,0,NULL,NULL,NULL,NULL,NULL),('mtn.default.compte.cleint','Compte client par défaut','11',NULL,0,NULL,NULL,NULL,NULL,NULL),('mtn.default.compte.fournisseur','Compte fournisseur par défaut','2',NULL,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `parametre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personne` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `nom_prenom` varchar(255) NOT NULL,
  `numeroCNI` varchar(100) DEFAULT NULL,
  `telephone_mobile` varchar(100) DEFAULT NULL,
  `categorie_personne` varchar(255) DEFAULT NULL,
  `date_naissance` varchar(100) DEFAULT NULL,
  `email_adresse` varchar(100) DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne`
--

LOCK TABLES `personne` WRITE;
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
INSERT INTO `personne` VALUES (1,'Tedongmo Wilfried','','237679644901','DISTRIBUTOR','','','','Cotton','20/07/2015 23:14:29','ACTIF','Cotton','20/07/2015 23:29:48'),(2,'Fournisseur Distributeur Principal','','237677251749','DISTRIBUTOR','','','','Cotton','20/07/2015 23:23:01','ACTIF','',''),(3,'Delegue 1','','237670005708','DELEGATE','','','','Cotton','20/07/2015 23:24:31','ACTIF','',''),(4,'Delegue 2','','237674223211','DELEGATE','','','','Cotton','20/07/2015 23:25:23','ACTIF','',''),(5,'Delegue 3','','237670410734','DELEGATE','','','','Cotton','20/07/2015 23:26:07',NULL,'',''),(6,'Vendeur 1','','237670410575','VENDOR','','','','Cotton','20/07/2015 23:32:28','ACTIF','',''),(7,'Vendeur 2','','237675365597','VENDOR','','','','Cotton','20/07/2015 23:33:14',NULL,'',''),(8,'Default Cleint','','237670856388','CLIENT','','','','Cotton','20/07/2015 23:37:17','ACTIF','',''),(9,'Default Person','','237677202874','CLIENT','','','','Cotton','20/07/2015 23:38:22','ACTIF','','');
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  `libelle` varchar(100) NOT NULL,
  `isenabled` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
INSERT INTO `profil` VALUES (1,NULL,NULL,'ACTIF',NULL,NULL,'ADMIN',NULL);
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubrique` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  `entite` varchar(3) DEFAULT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `code_menu` int(11) NOT NULL,
  `isenabled` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_iq9gkoroq3dd39wu3etcwyteu` (`libelle`),
  KEY `FK_f4dxpxlidlvajy7gy6ylh6qgu` (`code_menu`),
  CONSTRAINT `FK_f4dxpxlidlvajy7gy6ylh6qgu` FOREIGN KEY (`code_menu`) REFERENCES `menu` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrique`
--

LOCK TABLES `rubrique` WRITE;
/*!40000 ALTER TABLE `rubrique` DISABLE KEYS */;
INSERT INTO `rubrique` VALUES (3,'','01/03/2015 08:48:46','ACTIF','Cotton','17/07/2015 13:18:40','OUI','Paiement','Paiement',4,NULL),(4,NULL,'01/03/2015 08:48:47','ACTIF',NULL,NULL,'OUI','Personne','Personne',1,NULL),(5,'','01/03/2015 08:48:47','ACTIF','Cotton','17/07/2015 13:18:28','OUI','Droit','Droit',2,NULL),(6,'','01/03/2015 08:48:47','ACTIF','Cotton','17/07/2015 13:18:23','OUI','MouvementPuce','MouvementPuce',3,NULL),(7,'','01/03/2015 08:48:47','ACTIF','Cotton','17/07/2015 13:18:17','OUI','Puce','Puce',3,NULL),(8,'','01/03/2015 08:48:47','ACTIF','Cotton','17/07/2015 13:18:12','OUI','Userprofil','Userprofil',2,NULL),(9,'','01/03/2015 08:48:47','ACTIF','Cotton','17/07/2015 13:18:06','OUI','Rubrique','Rubrique',2,NULL),(10,'','01/03/2015 08:48:47','ACTIF','Cotton','17/07/2015 13:18:01','OUI','User','User',2,NULL),(11,'','01/03/2015 08:48:47','ACTIF','Cotton','17/07/2015 13:17:53','OUI','Menu','Menu',2,NULL),(12,NULL,'01/03/2015 08:48:47','ACTIF',NULL,NULL,'OUI','ComptePersonne','ComptePersonne',1,NULL),(13,'','01/03/2015 08:48:47','ACTIF','Cotton','17/07/2015 13:17:30','OUI','Profil','Profil',2,NULL),(14,'Cotton','14/03/2015 00:46:08','ACTIF','Cotton','17/07/2015 13:17:15','NON','Chargement loader','mouvementPuceLoader',3,NULL),(15,'Cotton','04/06/2015 00:29:53','ACTIF','Cotton','17/07/2015 13:16:33','NON','Chargement fichier vendeur','mouvementPuceVendeurLoader',3,NULL),(16,'Cotton','04/06/2015 00:31:01','ACTIF','Cotton','17/07/2015 13:19:35','NON','Chargement Fichier Delegue','mouvementPuceDelegueLoader',3,NULL),(17,'Cotton','07/06/2015 21:50:51','ACTIF','Cotton','17/07/2015 13:16:10','NON','Mouvement Puce Periode','puceMvtPeriode',3,NULL),(18,'Cotton','11/06/2015 02:21:07','ACTIF','Cotton','17/07/2015 13:15:58','NON','Liste des transferts d\'une periode','puceMvtPeriodeReport',3,NULL),(19,'Cotton','14/06/2015 21:50:29','ACTIF','Cotton','17/07/2015 13:15:48','NON','Transfert par  Revendeur','cumulRevendeurMvtPuceReport',3,NULL),(20,'Cotton','20/07/2015 23:39:03','ACTIF','','','OUI','parametre','parametre',2,NULL);
/*!40000 ALTER TABLE `rubrique` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  `date_naissance` varchar(100) DEFAULT NULL,
  `email_adresse` varchar(100) DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `nom_prenom` varchar(255) NOT NULL,
  `numeroCNI` varchar(100) DEFAULT NULL,
  `telephone_mobile` varchar(100) DEFAULT NULL,
  `isaccountNonExpired` varchar(3) DEFAULT NULL,
  `isaccountNonLocked` varchar(3) DEFAULT NULL,
  `iscredentialsNonExpired` varchar(3) DEFAULT NULL,
  `lastaccessdate` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `isenabled` varchar(3) DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `UK_jreodf78a7pl5qidfh43axdfb` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,'01/03/2015 08:45:36','ACTIF','Cotton','25/07/2015 22:11:11','28/03/2015','jweiss43@yah00.biz','Barney','Noah Cannon',NULL,'237628131166','OUI','OUI','OUI','25/07/2015 22:11:11','6e7f4c6b99bfd07f34928d4325175ac99dfa6844','Cotton',NULL,'',''),(2,NULL,'01/03/2015 08:45:38','ACTIF',NULL,NULL,'19/06/2015','jolsen@gma1l.biz','Woodbine','Wayne Guerrero',NULL,'237651235392','OUI','OUI','OUI',NULL,'17eef239de2847a2c648ffaf63e2891611ae71be','Avery',NULL,'',''),(3,NULL,'01/03/2015 08:45:38','ACTIF',NULL,NULL,'24/09/2015','jburks@everyma1l.co.uk','Hazlehurst','Sher Mayo',NULL,'237657336119','OUI','OUI','OUI',NULL,'b406fb57b29fc76f71864fbb37f0238045f84d9d','Black',NULL,'',''),(4,NULL,'01/03/2015 08:45:39','ACTIF',NULL,NULL,'21/05/2015','tomagnetic@ma1l2u.us','Bemiss','Rocky Kirkland',NULL,'237670058795','OUI','OUI','OUI',NULL,'ddb92dc301e38e17b945f045e033c28816669f5e','Sweeney',NULL,'',''),(5,NULL,'01/03/2015 08:45:39','ACTIF',NULL,NULL,'01/02/2015','theyin@everyma1l.org','Clyatteville','Clint Hernandez',NULL,'237622948640','OUI','OUI','OUI',NULL,'bdafdce95a37fe35f5ce69b10391be2c2bb68c5c','Nieves',NULL,'',''),(6,NULL,'01/03/2015 08:45:40','ACTIF',NULL,NULL,'04/06/2015','jblackwell@yah00.net','Kings Bay Base','Vernon Holman',NULL,'237631350057','OUI','OUI','OUI',NULL,'f9c13f6929c4b5555e90f52d0c2dc0fed760e9b2','Hendricks',NULL,'',''),(7,NULL,'01/03/2015 08:45:40','ACTIF',NULL,NULL,'13/02/2015','tois@b1zmail.net','Sandy Springs','Alyssa William',NULL,'237693085045','OUI','OUI','OUI',NULL,'e22f82653e0825d4ace37f5563b2dd10ea88d035','Watts',NULL,'',''),(8,NULL,'01/03/2015 08:45:41','ACTIF',NULL,NULL,'24/09/2015','camedied@everyma1l.us','Offerman','Martha Combs',NULL,'237615188340','OUI','OUI','OUI',NULL,'7da240ad5f55280b4c300231d6d9f6d4b913328f','Odom',NULL,'',''),(9,NULL,'01/03/2015 08:45:42','ACTIF',NULL,NULL,'19/03/2015','solsen@everyma1l.co.uk','Harrietts Bluff','Darla Horn',NULL,'237659317475','OUI','OUI','OUI',NULL,'f8a9289d923cd8638595b9a07da25f33cbf2e7d4','Tanner',NULL,'',''),(10,NULL,'01/03/2015 08:45:43','ACTIF',NULL,NULL,'12/06/2015','mdavid@hotma1l.net','Springfield','Randy McIntosh',NULL,'237688946189','OUI','OUI','OUI',NULL,'2352a22b9f352bd6116f3a24ade7af373ad079fa','Knight',NULL,'','');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofil`
--

DROP TABLE IF EXISTS `userprofil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprofil` (
  `code` int(11) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createddate` varchar(255) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `updatedby` varchar(255) DEFAULT NULL,
  `updateddate` varchar(255) DEFAULT NULL,
  `code_profil` int(11) DEFAULT NULL,
  `code_user` int(11) DEFAULT NULL,
  `isenabled` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `FK_7s4y9nsrgxjwt51o619g9q2mj` (`code_profil`),
  KEY `FK_kkwcka6bp0vf55luat6udthde` (`code_user`),
  CONSTRAINT `FK_kkwcka6bp0vf55luat6udthde` FOREIGN KEY (`code_user`) REFERENCES `user` (`code`),
  CONSTRAINT `FK_7s4y9nsrgxjwt51o619g9q2mj` FOREIGN KEY (`code_profil`) REFERENCES `profil` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofil`
--

LOCK TABLES `userprofil` WRITE;
/*!40000 ALTER TABLE `userprofil` DISABLE KEYS */;
INSERT INTO `userprofil` VALUES (1,NULL,NULL,'ACTIF',NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `userprofil` ENABLE KEYS */;
UNLOCK TABLES;

