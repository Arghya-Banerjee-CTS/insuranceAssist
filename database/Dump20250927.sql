CREATE DATABASE  IF NOT EXISTS `insurancedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `insurancedb`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: insurancedb
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `authorization`
--

DROP TABLE IF EXISTS `authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization` (
  `id` binary(16) NOT NULL,
  `closing_date` datetime(6) DEFAULT NULL,
  `open_date` datetime(6) NOT NULL,
  `procedure_notes` varchar(400) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `agent_id` binary(16) DEFAULT NULL,
  `claim_type_id` bigint NOT NULL,
  `client_id` binary(16) NOT NULL,
  `policy_id` binary(16) NOT NULL,
  `status` bigint NOT NULL,
  `claim_amount` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1hlj51rv09cmfpmcmbj57o3vi` (`agent_id`),
  KEY `FK25e0cehfli60prm24pn5qxxia` (`claim_type_id`),
  KEY `FKbm5vj82n5ikiud9r1q392xxu8` (`client_id`),
  KEY `FKil6vdpnnsq8vy57r1qhjpafvb` (`policy_id`),
  KEY `FK1jlgq887bat24uxtpuiqxl8ms` (`status`),
  CONSTRAINT `FK1hlj51rv09cmfpmcmbj57o3vi` FOREIGN KEY (`agent_id`) REFERENCES `user_master` (`id`),
  CONSTRAINT `FK1jlgq887bat24uxtpuiqxl8ms` FOREIGN KEY (`status`) REFERENCES `status_type_master` (`id`),
  CONSTRAINT `FK25e0cehfli60prm24pn5qxxia` FOREIGN KEY (`claim_type_id`) REFERENCES `claim_type_master` (`id`),
  CONSTRAINT `FKbm5vj82n5ikiud9r1q392xxu8` FOREIGN KEY (`client_id`) REFERENCES `user_master` (`id`),
  CONSTRAINT `FKil6vdpnnsq8vy57r1qhjpafvb` FOREIGN KEY (`policy_id`) REFERENCES `policy_master` (`policy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization`
--

LOCK TABLES `authorization` WRITE;
/*!40000 ALTER TABLE `authorization` DISABLE KEYS */;
INSERT INTO `authorization` VALUES (_binary '\Æ·˜N#²I.’²:œ™',NULL,'2025-09-23 14:22:01.778876','Follow-up visit for a skin condition.','2025-09-23 14:22:01.779876',_binary '‡Ğ’Ê­AÕˆ\Ì,¶\Ì\×0',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,100),(_binary 'i\\B¦²:e\æ )',NULL,'2025-09-19 15:29:03.602523','Physical therapy for back injury','2025-09-26 16:13:13.716052',_binary '2¥±AHO¥YüH2T‘\Ô',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',4,9000),(_binary '\Z>3¬/D’˜§Ê N',NULL,'2025-09-19 15:26:28.674188','Routine check-up and blood test','2025-09-26 14:13:33.818256',_binary '2¥±AHO¥YüH2T‘\Ô',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',3,1500),(_binary ' ß±hZ)D]©=ü*ó¢\Ö',NULL,'2025-09-22 17:55:56.561573','Cardiac stress test','2025-09-22 17:55:56.563604',_binary '‡Ğ’Ê­AÕˆ\Ì,¶\Ì\×0',1,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',1,10),(_binary ')\n$›U\ÈJ\ê·N²\Äıe‹',NULL,'2025-09-22 17:00:48.149935','Patient complained of severe headaches and blurry vision. Administered a series of diagnostic tests. Treatment plan involves a new medication regimen and follow-up in two weeks.','2025-09-22 17:00:48.177293',_binary '2¥±AHO¥YüH2T‘\Ô',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,10000),(_binary '1’²9[C9¼32~SŠ',NULL,'2025-09-19 15:27:21.448704','X-ray and cast for fractured wrist','2025-09-19 15:27:21.451768',_binary ']\Ô&,oK>“ÿ	y\"\Ú',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,8500),(_binary '1\ê›j@¶¦ß¯F„¿u',NULL,'2025-09-23 14:22:41.532948','Emergency room visit for a minor cut.','2025-09-26 14:15:02.994678',_binary '2¥±AHO¥YüH2T‘\Ô',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',2,350),(_binary '2\Ã\Öh\îMÂ¾Ÿ\0j2ğ=',NULL,'2025-09-23 14:22:49.510211','Consultation with a specialist.','2025-09-23 14:22:49.513090',_binary ']\Ô&,oK>“ÿ	y\"\Ú',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,220),(_binary '=2\Şó)\ìG£›XÊ‹S=',NULL,'2025-09-22 17:56:11.420865','Cardiac stress test','2025-09-22 17:56:11.423867',_binary ']\Ô&,oK>“ÿ	y\"\Ú',1,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',2,30),(_binary 'E\ænógNL¹§\é°Q<ˆ',NULL,'2025-09-19 15:29:31.836484','Cardiac stress test','2025-09-19 15:29:31.837992',_binary '‡Ğ’Ê­AÕˆ\Ì,¶\Ì\×0',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,7800),(_binary 'H”WÙGj†²D…]À¨\Ğ',NULL,'2025-09-19 15:28:42.742581','Prescription for new medication','2025-09-19 15:28:42.744587',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,850),(_binary 'K)N<x\ÔGú‡{öyA2',NULL,'2025-09-19 15:28:56.336169','Annual gynecological exam','2025-09-19 15:28:56.338169',_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,1800),(_binary 'P\ëNo¦\ëG©F?ò¨}-',NULL,'2025-09-23 14:23:00.345186','Orthodontic retainer.','2025-09-23 14:23:00.347182',_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,280),(_binary 'SZ![õN7¢\êş³¡R%¾',NULL,'2025-09-22 17:56:04.015957','Cardiac stress test','2025-09-22 17:56:04.018951',_binary '2¥±AHO¥YüH2T‘\Ô',1,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',1,110),(_binary ']]@´¶O ¸ ­Mq|\ç',NULL,'2025-09-23 14:22:45.193362','Teeth whitening treatment.','2025-09-23 14:22:45.195382',_binary 'P^[^O²¢€¼f€Œ?',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,300),(_binary '`F\å×–Cš‰¯\æÀˆ¶:',NULL,'2025-09-19 15:29:10.873006','Mental health counseling session','2025-09-19 15:29:10.877540',_binary 'P^[^O²¢€¼f€Œ?',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,1000),(_binary 'g…²ù›\àD0x,”ã™˜',NULL,'2025-09-22 17:55:53.371089','Cardiac stress test','2025-09-22 17:55:53.373602',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',1,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',2,30),(_binary '€”ZMHµT¨\Ä#d\Ì',NULL,'2025-09-22 17:55:48.202245','Cardiac stress test','2025-09-22 17:55:48.204123',_binary ']\Ô&,oK>“ÿ	y\"\Ú',2,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',4,20),(_binary 'ˆ\Ø·[_@O¤—\î¾\Ñ<­',NULL,'2025-09-23 14:22:37.542179','Braces adjustment.','2025-09-23 14:22:37.543179',_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,120),(_binary 'ˆğ,›2OŒD\Íd%š',NULL,'2025-09-19 15:29:25.268767','Child\'s wellness check-up','2025-09-19 15:29:25.270768',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,450),(_binary 'ˆñ…‹²hMğ‰˜wqˆ\ê\Ü',NULL,'2025-09-19 15:27:41.302152','Emergency room visit for chest pain','2025-09-19 15:27:41.303130',_binary '‡Ğ’Ê­AÕˆ\Ì,¶\Ì\×0',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,12000),(_binary '‘‡ç¤ƒMR”–µ¼{¬',NULL,'2025-09-23 14:21:49.572693','Routine dental check-up and cleaning.','2025-09-23 14:21:49.574576',_binary 'P^[^O²¢€¼f€Œ?',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,150),(_binary '’²\Ñn^B*–:\ÈJ¸\Å;',NULL,'2025-09-19 15:27:57.513512','Minor surgery to remove a cyst','2025-09-26 14:13:43.892916',_binary '2¥±AHO¥YüH2T‘\Ô',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',4,6500),(_binary '”×³l\ÙMĞ²[\î	5|\Z',NULL,'2025-09-19 15:27:49.751748','Follow-up consultation with specialist','2025-09-19 15:27:49.756781',_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,2500),(_binary '—7\Å\Ó@˜‡óôXˆ\æ',NULL,'2025-09-23 14:22:30.277888','Dental crown.','2025-09-23 14:22:30.280361',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,475),(_binary '¤Y‘EwNª¤–2¢\à¶Ò«',NULL,'2025-09-26 16:06:16.822354','lulu mall me ahil gaya muskaan k saath aur uska hua dimag kharab aab mentally ill ho gya','2025-09-26 16:16:22.916355',_binary '2¥±AHO¥YüH2T‘\Ô',2,_binary 'e¨\njK-‰Å…};o’',_binary ']—\Å\Ç2¨N½«\ï¨k',3,10000000),(_binary '§Q\å+\ZQC\à¿b wÂ–E',NULL,'2025-09-23 14:21:30.623459','Initial consultation for minor illness.','2025-09-23 14:21:30.671925',_binary '2¥±AHO¥YüH2T‘\Ô',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,250),(_binary '®@£\Ñf9E§ºy!\ï-I«x',NULL,'2025-09-22 17:55:44.382762','Cardiac stress test','2025-09-22 17:55:44.391140',_binary 'P^[^O²¢€¼f€Œ?',1,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',2,10),(_binary '¯«ø˜ÀC{—fl}\î€\È=',NULL,'2025-09-22 17:56:08.001377','Cardiac stress test','2025-09-22 17:56:08.004652',_binary 'P^[^O²¢€¼f€Œ?',2,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',1,70),(_binary '·‚R¬üFó¥¿S7²[',NULL,'2025-09-23 14:21:58.221427','Filling for a small cavity.','2025-09-23 14:21:58.223418',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,200),(_binary '·Ì·\Ë=.H¹‰\ìÏ€0Ó°U',NULL,'2025-09-19 15:28:21.864340','Regular blood pressure check','2025-09-19 15:28:21.867611',_binary 'P^[^O²¢€¼f€Œ?',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,300),(_binary '¾?\\†\Z˜@€\Òrc”¹H\Ú',NULL,'2025-09-22 17:56:16.736331','Cardiac stress test','2025-09-22 17:56:16.737329',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',2,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',3,10),(_binary '\Æ\Â.\ÖøHøœ§‹-¯Y¾',NULL,'2025-09-23 14:22:05.676264','Tooth extraction.','2025-09-23 14:22:05.677262',_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,450),(_binary '\ÇJ•£ApF4š¸­Oöf',NULL,'2025-09-23 14:22:22.838446','Root canal procedure.','2025-09-23 14:22:22.840444',_binary 'P^[^O²¢€¼f€Œ?',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,490),(_binary '\ÍÅŒd(L(¤®¨qy\Ü\Ù',NULL,'2025-09-23 14:22:56.430816','X-ray for a potential fracture.','2025-09-23 14:22:56.432723',_binary '‡Ğ’Ê­AÕˆ\Ì,¶\Ì\×0',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,95),(_binary '\Í×­ÁS@S‡\É\Â\äò(t$',NULL,'2025-09-19 15:27:30.827879','Flu shot and annual physical','2025-09-19 15:27:30.831444',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,1500),(_binary '\ÕL4I\ÎmH@“\Æ¢.q',NULL,'2025-09-19 15:29:18.431776','Endoscopy for stomach issues','2025-09-19 15:29:18.437319',_binary ']\Ô&,oK>“ÿ	y\"\Ú',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,11000),(_binary '\Ø\Ç\Ó\Ù\æ™GÉ¨\Æ\ŞL˜‡­',NULL,'2025-09-23 14:22:52.839771','Gum disease treatment.','2025-09-23 14:22:52.841753',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',2,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,400),(_binary 'Ûº6xŸ$G,±\Ä\Å\Ã8\âô\r',NULL,'2025-09-22 17:56:00.979520','Cardiac stress test','2025-09-22 17:56:00.981535',_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',1,_binary 'Œœ»)…JÛ´” ö\Ï\\',_binary 'Q\ÛL)A¸”Ş—W»\Ö',3,100),(_binary '\â¯\ãÿAcDf¢­€`w{',NULL,'2025-09-23 14:22:27.014023','Diagnostic blood test.','2025-09-23 14:22:27.016042',_binary ']\Ô&,oK>“ÿ	y\"\Ú',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,80),(_binary '\ãAE~L>{)\ŞĞ¸',NULL,'2025-09-19 15:28:49.816554','Allergy testing and treatment','2025-09-19 15:28:49.817540',_binary '‡Ğ’Ê­AÕˆ\Ì,¶\Ì\×0',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,5500),(_binary '\éE)WøŒDl–öù£\ãL\ÙH',NULL,'2025-09-23 14:22:33.611049','Vaccination.','2025-09-23 14:22:33.612023',_binary '‡Ğ’Ê­AÕˆ\Ì,¶\Ì\×0',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,50),(_binary 'ôŸ°\ÊH‰‡y\ï{O\Ã',NULL,'2025-09-19 15:28:31.436390','Hospital stay for pneumonia','2025-09-19 15:28:31.437394',_binary ']\Ô&,oK>“ÿ	y\"\Ú',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,14000),(_binary 'ùPM#’•K\r©BgE\Õ\à[0',NULL,'2025-09-23 14:22:19.312518','Physical therapy session.','2025-09-23 14:22:19.313514',_binary '2¥±AHO¥YüH2T‘\Ô',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,300),(_binary 'û­œù~\ÜM•µ\ì\ËJ¼Á>‘',NULL,'2025-09-23 14:21:53.559601','Prescription medication for allergy relief.','2025-09-23 14:21:53.561600',_binary ']\Ô&,oK>“ÿ	y\"\Ú',1,_binary 'aÓ¼N\Ó@•›\ç|o\Ük',_binary '½¾O,òTG+€5¨q”\nŸ\×',1,75);
/*!40000 ALTER TABLE `authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorization_log`
--

DROP TABLE IF EXISTS `authorization_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization_log` (
  `id` binary(16) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `curr_status` bigint DEFAULT NULL,
  `prev_status` bigint DEFAULT NULL,
  `claim_id` binary(16) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKncka8upcn62bm6kujjdw29w5u` (`curr_status`),
  KEY `FKrj5aentp264eowu0dw0hh56vi` (`prev_status`),
  KEY `FK1c2yp1v4r5l0ye7qunue6q6vn` (`claim_id`),
  CONSTRAINT `FK1c2yp1v4r5l0ye7qunue6q6vn` FOREIGN KEY (`claim_id`) REFERENCES `authorization` (`id`),
  CONSTRAINT `FKncka8upcn62bm6kujjdw29w5u` FOREIGN KEY (`curr_status`) REFERENCES `status_type_master` (`id`),
  CONSTRAINT `FKrj5aentp264eowu0dw0hh56vi` FOREIGN KEY (`prev_status`) REFERENCES `status_type_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization_log`
--

LOCK TABLES `authorization_log` WRITE;
/*!40000 ALTER TABLE `authorization_log` DISABLE KEYS */;
INSERT INTO `authorization_log` VALUES (_binary '¦$ EC¶¸ú¤®”\Öõ@','2025-09-23 14:22:41.562954',1,NULL,_binary '1\ê›j@¶¦ß¯F„¿u'),(_binary '\Úr¡Ì€I\êº\âñ:÷¡G','2025-09-19 15:28:49.823057',1,NULL,_binary '\ãAE~L>{)\ŞĞ¸'),(_binary 'œ\îPN$,œ1+.','2025-09-23 14:22:52.850755',1,NULL,_binary '\Ø\Ç\Ó\Ù\æ™GÉ¨\Æ\ŞL˜‡­'),(_binary '	ş¡…}N~ˆòI9€ÀF','2025-09-23 14:23:00.356181',1,NULL,_binary 'P\ëNo¦\ëG©F?ò¨}-'),(_binary 'ù\Ï\éLy¿\Z23\â@ü1','2025-09-26 16:16:22.961079',3,2,_binary '¤Y‘EwNª¤–2¢\à¶Ò«'),(_binary ':	=sFÃ›A«\Ùğ\Ò\Ü','2025-09-19 15:28:31.443797',1,NULL,_binary 'ôŸ°\ÊH‰‡y\ï{O\Ã'),(_binary '±\Èyh0M%ŸA\ç\ê´\à{\Ï','2025-09-26 14:13:33.947875',3,1,_binary '\Z>3¬/D’˜§Ê N'),(_binary '#\é{`N¼¦}Ğª©º','2025-09-23 14:22:33.618035',1,NULL,_binary '\éE)WøŒDl–öù£\ãL\ÙH'),(_binary '\"(‡©qBˆ\é:\Úz','2025-09-19 15:29:25.276281',1,NULL,_binary 'ˆğ,›2OŒD\Íd%š'),(_binary '$\ê\æMò²&b¨¥2ùW','2025-09-23 14:22:19.323518',1,NULL,_binary 'ùPM#’•K\r©BgE\Õ\à[0'),(_binary '\'°¼¹{O.»Gs¢\ÃFı‡','2025-09-19 15:29:03.621060',1,NULL,_binary 'i\\B¦²:e\æ )'),(_binary ')üa6\í\ÜOµª±‚ûEa­','2025-09-23 14:22:27.024023',1,NULL,_binary '\â¯\ãÿAcDf¢­€`w{'),(_binary '+<l¥—÷@›&¸\Ï\Ç\Ã\0¾','2025-09-26 16:13:10.903937',3,3,_binary 'i\\B¦²:e\æ )'),(_binary '+]ÿ©eL\â¢öx:šôi','2025-09-19 15:26:28.684210',1,NULL,_binary '\Z>3¬/D’˜§Ê N'),(_binary '9ğöe–ªE8@…O‘','2025-09-22 17:56:04.030579',1,NULL,_binary 'SZ![õN7¢\êş³¡R%¾'),(_binary ';UQDMg›¥fµÁ<\Zñ','2025-09-23 14:22:49.564721',1,NULL,_binary '2\Ã\Öh\îMÂ¾Ÿ\0j2ğ='),(_binary '>}ESMH»œd\Ûó\n›»\Ì','2025-09-23 14:21:30.708205',1,NULL,_binary '§Q\å+\ZQC\à¿b wÂ–E'),(_binary '>\Å³©hOöBIbõ\Ú','2025-09-26 16:13:52.793194',2,1,_binary '¤Y‘EwNª¤–2¢\à¶Ò«'),(_binary 'K\Õ\ê\åZyKxˆ\Ù\"\àğ\\ù¥','2025-09-26 16:12:55.872525',3,1,_binary 'i\\B¦²:e\æ )'),(_binary 'P-mûM·½\á‘{”c‡	','2025-09-22 17:55:56.576586',1,NULL,_binary ' ß±hZ)D]©=ü*ó¢\Ö'),(_binary 'T\\z\ï‡Cª¾\Ã_T\rQ','2025-09-22 17:56:08.013118',1,NULL,_binary '¯«ø˜ÀC{—fl}\î€\È='),(_binary 'X\0¹¢`&GÓ¸P®\Ó\ì','2025-09-22 17:00:48.202562',1,NULL,_binary ')\n$›U\ÈJ\ê·N²\Äıe‹'),(_binary 'Zs+ò6K«J‚\ã\Ñ\ê‰ı','2025-09-23 14:21:49.583078',1,NULL,_binary '‘‡ç¤ƒMR”–µ¼{¬'),(_binary ']gJÛ¿iM=Sş~w=','2025-09-19 15:27:21.466833',1,NULL,_binary '1’²9[C9¼32~SŠ'),(_binary 'r\Ö\İ<=7D£´\r5+L80·','2025-09-19 15:29:18.455548',1,NULL,_binary '\ÕL4I\ÎmH@“\Æ¢.q'),(_binary 's©\ËMr¼®‹Á\ë\î¯ö','2025-09-19 15:29:31.848403',1,NULL,_binary 'E\ænógNL¹§\é°Q<ˆ'),(_binary '{\äwf¼şFªr3e!¡\àv','2025-09-23 14:22:22.849445',1,NULL,_binary '\ÇJ•£ApF4š¸­Oöf'),(_binary '~h0¡I3œ>Šw\ÆÕ³','2025-09-26 16:06:16.838792',1,NULL,_binary '¤Y‘EwNª¤–2¢\à¶Ò«'),(_binary '~\Ø2ŒC´\è\Ó+/\Ø','2025-09-23 14:22:01.788859',1,NULL,_binary '\Æ·˜N#²I.’²:œ™'),(_binary 'x<\0ğWDÏ›†Fµò7y\Ï','2025-09-19 15:27:49.776008',1,NULL,_binary '”×³l\ÙMĞ²[\î	5|\Z'),(_binary '‚©­.Á—FGŒõP0\ç§','2025-09-26 16:13:13.746091',4,3,_binary 'i\\B¦²:e\æ )'),(_binary '‚\â@\È\'¨OŸEVc\àt\Ù','2025-09-22 17:56:16.744349',1,NULL,_binary '¾?\\†\Z˜@€\Òrc”¹H\Ú'),(_binary '‡tø†FMÿ€Ÿ¸ n0','2025-09-23 14:21:53.567603',1,NULL,_binary 'û­œù~\ÜM•µ\ì\ËJ¼Á>‘'),(_binary 'ˆ!œõ\æHÂ±ÉŠşŒ˜w','2025-09-23 14:22:30.289982',1,NULL,_binary '—7\Å\Ó@˜‡óôXˆ\æ'),(_binary '‹Â‡­»N„†[›^1\Â','2025-09-22 17:56:11.433245',1,NULL,_binary '=2\Şó)\ìG£›XÊ‹S='),(_binary '•5u\ÑXK|±Ô§»\Âb›','2025-09-26 14:15:03.031301',2,1,_binary '1\ê›j@¶¦ß¯F„¿u'),(_binary '–f\ãg\ÌEK¬bÿ­\Û%°P','2025-09-22 17:56:00.991038',1,NULL,_binary 'Ûº6xŸ$G,±\Ä\Å\Ã8\âô\r'),(_binary '˜\ã¸+©\ÙK7·\âK¦o','2025-09-19 15:28:21.877684',1,NULL,_binary '·Ì·\Ë=.H¹‰\ìÏ€0Ó°U'),(_binary 'œ`¤E›†‹7^«ú','2025-09-23 14:22:56.440829',1,NULL,_binary '\ÍÅŒd(L(¤®¨qy\Ü\Ù'),(_binary 'ÀG·¦\Ó@=™I/€^”j','2025-09-19 15:27:41.307728',1,NULL,_binary 'ˆñ…‹²hMğ‰˜wqˆ\ê\Ü'),(_binary '¡.\è\ïDı\á{\Ï7\\','2025-09-23 14:22:05.693136',1,NULL,_binary '\Æ\Â.\ÖøHøœ§‹-¯Y¾'),(_binary '¢óZ­‚C\è°ß¹\0,\rv','2025-09-23 14:22:45.202382',1,NULL,_binary ']]@´¶O ¸ ­Mq|\ç'),(_binary '£Jg\ßD\è€1I·\î','2025-09-23 14:21:58.229418',1,NULL,_binary '·‚R¬üFó¥¿S7²['),(_binary 'ª…”j\Å@Â»¦;\ãUº“','2025-09-19 15:27:57.521114',1,NULL,_binary '’²\Ñn^B*–:\ÈJ¸\Å;'),(_binary '®­^\å\Ä\ĞLd®Cy\ê š','2025-09-19 15:29:10.894462',1,NULL,_binary '`F\å×–Cš‰¯\æÀˆ¶:'),(_binary '²jF’ó\ÏGœŸ\0˜Ë³„','2025-09-22 17:55:48.214242',1,NULL,_binary '€”ZMHµT¨\Ä#d\Ì'),(_binary 'º¡šo·DŠ‚08·*VÔ®','2025-09-19 15:28:56.351132',1,NULL,_binary 'K)N<x\ÔGú‡{öyA2'),(_binary 'ËE™\éE+™\Äõ‚\îJ9','2025-09-22 17:55:44.403442',1,NULL,_binary '®@£\Ñf9E§ºy!\ï-I«x'),(_binary '×½³TpJÖ±\ä\Öå¤°Ş¬','2025-09-22 17:55:53.387013',1,NULL,_binary 'g…²ù›\àD0x,”ã™˜'),(_binary '\áû¥\ÈúNÏ©y½t\'L¸','2025-09-26 14:13:43.929182',4,1,_binary '’²\Ñn^B*–:\ÈJ¸\Å;'),(_binary '\ìşô·Î€O:\í^öO','2025-09-19 15:27:30.840989',1,NULL,_binary '\Í×­ÁS@S‡\É\Â\äò(t$'),(_binary '÷§ß&\ÅLªt90øŒA','2025-09-19 15:28:42.758411',1,NULL,_binary 'H”WÙGj†²D…]À¨\Ğ'),(_binary 'şj—6e¹CwšZ\0O§o\Æ','2025-09-23 14:22:37.548173',1,NULL,_binary 'ˆ\Ø·[_@O¤—\î¾\Ñ<­');
/*!40000 ALTER TABLE `authorization_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `claim_type_master`
--

DROP TABLE IF EXISTS `claim_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim_type_master` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `claim_type` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKh7b8oxa6d52nuiu6gw5j1427x` (`claim_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `claim_type_master`
--

LOCK TABLES `claim_type_master` WRITE;
/*!40000 ALTER TABLE `claim_type_master` DISABLE KEYS */;
INSERT INTO `claim_type_master` VALUES (2,'POST'),(1,'PRE');
/*!40000 ALTER TABLE `claim_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent_master`
--

DROP TABLE IF EXISTS `dependent_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent_master` (
  `id` binary(16) NOT NULL,
  `address` varchar(400) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `name` varchar(120) NOT NULL,
  `phone` bigint DEFAULT NULL,
  `client_id` binary(16) NOT NULL,
  `relation_type_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmvy83ql6auug242r5urrkc65k` (`client_id`),
  KEY `FK3qnmc4t72su5qik93hdlmn3e7` (`relation_type_id`),
  CONSTRAINT `FK3qnmc4t72su5qik93hdlmn3e7` FOREIGN KEY (`relation_type_id`) REFERENCES `relation_type_master` (`id`),
  CONSTRAINT `FKmvy83ql6auug242r5urrkc65k` FOREIGN KEY (`client_id`) REFERENCES `user_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent_master`
--

LOCK TABLES `dependent_master` WRITE;
/*!40000 ALTER TABLE `dependent_master` DISABLE KEYS */;
INSERT INTO `dependent_master` VALUES (_binary '{{H8º\"E\\¶½\ì\İÆ“gi','Earth','2003-11-15','vedant@s.com','F','2025-09-24 14:57:32.432004','Vedant Sinha',101010101,_binary 'Œœ»)…JÛ´” ö\Ï\\',5),(_binary 'ƒ \ê\×ÎˆBÈ«ù\"_8€\Ş','Earth','2000-11-11','vedant@s10.com','M','2025-09-24 17:32:37.416967','Test',1111111111,_binary 'Œœ»)…JÛ´” ö\Ï\\',9),(_binary 'Šj\æ\îºA,µ-D#­\è„','456 Oak Avenue, Metropolis, USA','1988-05-21','jane.doe@example.com','F','2025-09-09 00:00:00.000000','Jane Doe',9876543210,_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',5),(_binary '©‚\ÔN@¿6N\Ó\Ñ;AA','@$%^','2026-06-09','re@gmail.com','','2025-09-26 16:02:50.178503','+_)(*&^%$#@',0,_binary 'e¨\njK-‰Å…};o’',9),(_binary '¶ c\è\ã€Kšƒñ­\Èô\ÅM','789 Pine Street, Smallville, USA','2000-01-15','alex.j@example.com','M','2025-09-09 00:00:00.000000','Alex Johnson',5551234567,_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',3),(_binary '¿3\èó\ÅMv¡6G7nN»¤','Earth','2002-12-20','vedant@s10.com','M','2025-09-24 15:59:06.577514','Vedant Sinha',1111111111,_binary 'Œœ»)…JÛ´” ö\Ï\\',3),(_binary '\É«\ï\êN(‹b±,‚\æu\É','Earth','2000-11-11','vedant@s10.com','M','2025-09-24 17:34:57.947363','Test1',1111111111,_binary '®¼öøÁCk’²Uúz\r\Ï',9),(_binary '\ßP9ioGN›‰\'1\Êşre','456 Oak Avenue, Springfield','1998-05-15','alex.johnson@example.com','M','2025-09-24 17:42:50.489492','Alex Johnson',9876543210,_binary '±˜t\ê®O\ì„z5¢D…	²',2);
/*!40000 ALTER TABLE `dependent_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital_master`
--

DROP TABLE IF EXISTS `hospital_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital_master` (
  `id` binary(16) NOT NULL,
  `address` varchar(400) DEFAULT NULL,
  `client_contact_email` varchar(120) DEFAULT NULL,
  `client_contact_number` bigint DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `name` varchar(160) NOT NULL,
  `rating` float DEFAULT NULL,
  `network` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK7tmh70iibf3e3bsjavjjdo4ik` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital_master`
--

LOCK TABLES `hospital_master` WRITE;
/*!40000 ALTER TABLE `hospital_master` DISABLE KEYS */;
INSERT INTO `hospital_master` VALUES (_binary '\0;G\Í\ÒE1ˆÛ²º¹‰“','10 Ocean Drive, Seaside, FL 33101','sarah.wilson@buildit.org',5557778888,'projects@coastalbuild.com','Coastal Construction',4.3,1),(_binary 'hsUšE©X€HŠ\ê','45 Technology Blvd, Tech City, TX 77001','jane.smith@partnercorp.net',5559876543,'support@globaltech.net','Global Tech Services',3.8,0),(_binary 'F÷	gF“ƒ\r)R#\ã','90 Commerce Way, Suburbia, IL 60601','david.lee@marketingsuccess.net',5555556666,'hello@alphamarketing.com','Alpha Marketing Group',3.5,0),(_binary 'Y\ßüi|¢N\"¡\r\ÈZ\Ğ','202 Birch Lane, Northwood, USA','info@northwoodfamily.com',5556667777,'contact@northwoodfamily.com','Northwood Family Clinic',4.7,1),(_binary '}k¾¹ @>¹TFŒ\é^[','33 Solar Pkwy, Eco Village, OR 97204','lisa.martin@cleanpower.com',5553030303,'info@greenearth.org','Green Earth Energy',4.6,0),(_binary 'ˆsAM.L•v´›:$‘\Ç','55 High Tower, Sky City, WA 98101','mike.jones@topclients.com',5559990000,'reachout@zenithconsult.com','Zenith Consulting',5,1),(_binary '­ú%6œLHYµ€€<`–v\Æ','88 Bank Plaza, Finance District, CA 94105','chris.evans@moneywise.co',5552020202,'accounts@quantumfinancial.com','Quantum Financial',4.7,1),(_binary 'µ\ï7MñO€üEµ>X','789 Pine Street, Springfield, USA','appointments@cityhealth.com',5554443333,'contact@cityhealth.com','City Health Medical Center',4.6,1),(_binary '\Ğ9Œ’\íD¿ q²°Gó\Ô','456 Oak Avenue, Metropolis, USA','admissions@generalhospital.org',5559876543,'info@generalhospital.org','General Hospital',4.8,0),(_binary 'Ö¢¤E\íƒO‘¯\êô‘­a.','123 Main St, Anytown, CA 90210','john.doe@clientco.com',5551234567,'info@acmesolutions.com','Acme Solutions Inc.',4.5,1),(_binary '\Ø\Û+oŠ\àGC”\Óê·‡À^','22 Business Park, Metro City, NY 10001','maria.rodriguez@dataco.com',5553334444,'sales@dataflow.co','DataFlow Analytics',4.1,1),(_binary '\é\ÏO»B\ë¬\ï¯üû\á¬p','78 Research Ave, Science Valley, MA 02139','alex.chen@futurebiz.com',5551112222,'contact@innovatelabs.org','Innovate Labs',4.9,1),(_binary 'ı=ü\ÃI*ª\ìrR5•\"','1 Warehouse Rd, Industrial Area, NJ 08817','emily.brown@shippingfast.net',5550101010,'dispatch@pioneerlogistics.net','Pioneer Logistics',3.2,0);
/*!40000 ALTER TABLE `hospital_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_master`
--

DROP TABLE IF EXISTS `policy_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_master` (
  `policy_id` binary(16) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `end_date` date NOT NULL,
  `premium` bigint NOT NULL,
  `start_date` date NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `client_id` binary(16) NOT NULL,
  `dependents` int NOT NULL,
  `policy_type_id` bigint NOT NULL,
  `remaining_coverage` bigint DEFAULT NULL,
  PRIMARY KEY (`policy_id`),
  KEY `FKjxe0cu8deiy15ltvaa1pbf834` (`client_id`),
  KEY `FKe8fkbmk2rab5tf3t62li5y8qj` (`policy_type_id`),
  CONSTRAINT `FKe8fkbmk2rab5tf3t62li5y8qj` FOREIGN KEY (`policy_type_id`) REFERENCES `policy_type_master` (`id`),
  CONSTRAINT `FKjxe0cu8deiy15ltvaa1pbf834` FOREIGN KEY (`client_id`) REFERENCES `user_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_master`
--

LOCK TABLES `policy_master` WRITE;
/*!40000 ALTER TABLE `policy_master` DISABLE KEYS */;
INSERT INTO `policy_master` VALUES (_binary '\0»üµ\âN@„I˜O\ï\í','2025-09-24 14:57:32.347939','2026-09-23',17700,'2025-09-24','2025-09-24 14:57:32.347939',_binary 'Œœ»)…JÛ´” ö\Ï\\',1,5,50000),(_binary '\í÷±aLj˜›2Ì“§w\Ò','2025-09-24 15:59:06.291210','2026-09-23',17700,'2025-09-24','2025-09-24 15:59:06.291210',_binary 'Œœ»)…JÛ´” ö\Ï\\',1,5,50000),(_binary '[d\Ø7Hq•lI¿','2025-09-19 15:23:20.474245','2025-01-14',11500,'2024-01-15','2025-09-19 15:23:20.474245',_binary '³\Ü`T\äºE‘}J\ã(\'¡',1,2,15000),(_binary 'E™ ›¶G¢À\Ç=«nr','2025-09-24 17:34:57.762149','2026-09-23',9400,'2025-09-24','2025-09-24 17:34:57.762149',_binary '®¼öøÁCk’²Uúz\r\Ï',1,3,50000),(_binary 'Q\ÛL)A¸”Ş—W»\Ö','2025-09-22 17:55:37.085662','2025-04-19',28800,'2024-04-20','2025-09-22 17:55:37.085662',_binary 'Œœ»)…JÛ´” ö\Ï\\',4,5,200000),(_binary ']—\Å\Ç2¨N½«\ï¨k','2025-09-26 15:58:47.513106','2026-09-25',17700,'2025-09-26','2025-09-26 16:16:22.951756',_binary 'e¨\njK-‰Å…};o’',1,5,-19000000),(_binary '¡½\Ù6¡Gc\î\Ã\Ğ\à\ÈE','2025-09-19 15:23:34.089711','2024-10-31',13200,'2023-11-01','2025-09-19 15:23:34.089711',_binary '³\Ü`T\äºE‘}J\ã(\'¡',3,3,50000),(_binary '©G!DúC¥30¾\è‘p','2025-09-10 12:20:46.249894','2025-05-19',15600,'2024-05-20','2025-09-10 12:20:46.249894',_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4',1,1,5000),(_binary '¶Ñ„Mz¨@’\×oô\Û\ã¬','2025-09-24 17:32:37.307655','2026-09-23',17700,'2025-09-24','2025-09-24 17:32:37.307984',_binary 'Œœ»)…JÛ´” ö\Ï\\',1,5,50000),(_binary '½¾O,òTG+€5¨q”\nŸ\×','2025-09-10 12:19:35.463917','2025-04-19',13200,'2023-01-15','2025-09-26 16:13:13.734472',_binary 'aÓ¼N\Ó@•›\ç|o\Ük',3,3,14650),(_binary 'ı\'z\àœ\ÆEÍˆò“*gjÆ®','2025-09-24 17:44:41.262827','2026-09-30',11500,'2025-10-01','2025-09-24 17:44:41.262827',_binary '±˜t\ê®O\ì„z5¢D…	²',1,2,50000);
/*!40000 ALTER TABLE `policy_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_type_master`
--

DROP TABLE IF EXISTS `policy_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_type_master` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deductible` int NOT NULL,
  `insurer_pay_percentage` int DEFAULT NULL,
  `notes` varchar(128) DEFAULT NULL,
  `premium_base` int DEFAULT NULL,
  `premium_per_dependent` int DEFAULT NULL,
  `tier` varchar(16) DEFAULT NULL,
  `coverage` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_type_master`
--

LOCK TABLES `policy_type_master` WRITE;
/*!40000 ALTER TABLE `policy_type_master` DISABLE KEYS */;
INSERT INTO `policy_type_master` VALUES (1,4000,80,'Regular healthcare users',12500,3100,'Gold',500000),(2,6000,70,'Families with occasional care',9200,2300,'Silver',250000),(3,8000,60,'Young, healthy individuals',7500,1900,'Bronze',100000),(4,10000,50,'General Consultation',6800,1700,'Basic',50000),(5,2000,90,'Chronic conditions, seniors',14000,3700,'Platinum',1000000);
/*!40000 ALTER TABLE `policy_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_type_master`
--

DROP TABLE IF EXISTS `relation_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relation_type_master` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `relation_name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKsvn1qlhxycppiupg1ij0w9ihy` (`relation_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_type_master`
--

LOCK TABLES `relation_type_master` WRITE;
/*!40000 ALTER TABLE `relation_type_master` DISABLE KEYS */;
INSERT INTO `relation_type_master` VALUES (3,'BROTHER'),(8,'DAUGHTER'),(1,'FATHER'),(9,'GUARDIAN'),(6,'HUSBAND'),(2,'MOTHER'),(4,'SISTER'),(7,'SON'),(5,'WIFE');
/*!40000 ALTER TABLE `relation_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_master`
--

DROP TABLE IF EXISTS `role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_master` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKpb4hcqci8mfd5ixfmlc5lgqfy` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_master`
--

LOCK TABLES `role_master` WRITE;
/*!40000 ALTER TABLE `role_master` DISABLE KEYS */;
INSERT INTO `role_master` VALUES (1,'AGENT'),(2,'CLIENT');
/*!40000 ALTER TABLE `role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_type_master`
--

DROP TABLE IF EXISTS `status_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_type_master` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status_type` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6s5degvwo51vfxthl5xkxprnl` (`status_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_type_master`
--

LOCK TABLES `status_type_master` WRITE;
/*!40000 ALTER TABLE `status_type_master` DISABLE KEYS */;
INSERT INTO `status_type_master` VALUES (3,'APPROVED'),(1,'CREATED'),(2,'IN REVIEW'),(4,'REJECTED');
/*!40000 ALTER TABLE `status_type_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_master` (
  `id` binary(16) NOT NULL,
  `address` varchar(400) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `name` varchar(120) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` bigint DEFAULT NULL,
  `username` varchar(80) NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKaup32aiegpsvdq249ed35pfvm` (`username`),
  UNIQUE KEY `UK9byi2yd5e68hr1x8ou18fj55c` (`email`),
  KEY `FK1x293n7g7893ckodvych27egl` (`role_id`),
  CONSTRAINT `FK1x293n7g7893ckodvych27egl` FOREIGN KEY (`role_id`) REFERENCES `role_master` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES (_binary '2¥±AHO¥YüH2T‘\Ô','456 Pine Lane, Lakeside, CA 90210','1992-11-05','maria@abc.com','F','Maria Garcia','$2a$12$mR.pN0ETESDChKNNxy.Bvu2w/UAaWKIiqkKmVUWukcLcStd7rkf6y',8765432109,'mariaabc',1),(_binary '5Ÿõš\â@D™+O9\"\Ó\Å\ä','Earth','2003-11-23','tanmay@s.com','F','Tanmay Sable','$2a$12$9yu1VYl8jPpt.SjlLF/CSuoSuQkCi0ix9Z9ioOFIS4ZnJlBi07AIe',1010101010,'tanmays',2),(_binary 'P^[^O²¢€¼f€Œ?','123 Main St, Anytown, USA','1990-05-15','alex.smith@example.com','M','Alex Smith','strong_password123',1234567890,'alex.smithexample',1),(_binary ']\Ô&,oK>“ÿ	y\"\Ú','101 Birch Road, Hilltop, GA 30303','1985-01-30','mikeb@def.com','M','Michael Brown','$2a$12$JtAPhALa8qlj9vRJSgN78OrSquyqTlHZYQKC09fs3AsCZqGZ6qQ/K',6543210987,'mikebdef',1),(_binary 'aÓ¼N\Ó@•›\ç|o\Ük','123 Main St, Anytown, USA','1990-05-15','alex@example.com','M','Alex','$2a$12$8T641BPCIgxLX1J10d0GIu11kh8zgPQO2T.LGa11mS2QxBrZ8eDDO',1234567890,'alexexample',1),(_binary 'cfşQIC«\ÙJ–\ì\Ôx5','999 Forest Drive, Green Valley, WA 98001','1991-04-18','alex.r@mno.com','M','Alex Rodriguez','$2a$12$ZO35SVk0wA4X3C6RQMrFu.CAU1J.gjEbPGEGN0VNaUGY6ny2p1Wc6',8765432101,'alex.rmno',2),(_binary 'e¨\njK-‰Å…};o’','@$%^','2025-09-30','re@gmail.com','M','!@#','$2a$12$mzrr7OlMiVAi9w8RoKYTK..hT5oNa/8TRKdG3nxb9PfxWZPEt2AxO',0,'regmail',2),(_binary 'ƒÉ”)Æ‚EÆš`D\"\ä\Ä','456 Pine Lane, Lakeside, CA 90210','1992-11-05','arghya17@b.com','M','Arghya banerjee','$2a$12$Oe3cvthKKRBtovJRaOv0eOgkq7koeUm3xxk8d4M.F6yF8iCDnK.Ta',8765432109,'arghya17b',2),(_binary '‡Ğ’Ê­AÕˆ\Ì,¶\Ì\×0','123 Main Street, Anytown, USA 12345','1990-05-20','alex.johnson@example.com','M','Alex Johnson','$2a$12$whTc2xUm61gT9fIt48ENcOubWgsyMzGFxBa9MMmYLjsawFlfSBwFi',9876543210,'alex.johnsonexample',1),(_binary 'Œœ»)…JÛ´” ö\Ï\\','456 Pine Lane, Lakeside, CA 90210','1992-11-05','arghya@b.com','F','Arghya','$2a$12$Mpqztv.h/0ehSnGS55HttuwXpRrNIt5t8W/OT1lPGyZk1mUOwx8wG',8765432109,'arghyab',2),(_binary '–¶\î\Ò9\åDø‘Ÿ6ş!§Ny','Earth','2003-11-23','test1@test.com','M','Test2','$2a$12$IEc6aGu5tSFDpp5hBYubiOKfMqFuG9Mvdzvz1kh2DtFKdpN/DwCQq',1010101010,'test1test',2),(_binary '®¼öøÁCk’²Uúz\r\Ï','Earth','2003-11-23','test@test.com','M','Test1','$2a$12$mI7C/FXldqV2cztRzVABZOYSQdRnL.c4t6BaIuLDP2kuAFXHAihTS',1010101010,'testtest',2),(_binary '±˜t\ê®O\ì„z5¢D…	²','456 Pine Lane, Lakeside, CA 90210','1992-11-05','test2@test.com','M','Test 2','$2a$12$/xMNlX2llNLVlaUOwQt5XugxiDMexYSIyAyfpLvI.3.I/NI7cwIwW',8765432109,'test2test',2),(_binary '³\Ü`T\äºE‘}J\ã(\'¡','789 Maple Avenue, Riverdale, NY 10001','1995-07-14','emily.chen@pqr.com','F','Emily Chen','$2a$12$HLN8ZMjwvtMR8TIOwjPduOlGTh5QZp9ZlagudW06D7oZVw3nB4ZUC',7654321098,'emily.chenpqr',2),(_binary '\Ô\ÈBlI’‡;\ÕVõ\Z4','Kalyani','2002-11-17','a@b.com','M','Arghya','1234',1234567890,'arghya17',1),(_binary '\Ük¿\ÛDP¹»v™GÖ®','333 Spruce Lane, Bay City, FL 33101','1990-12-25','daniel.w@jkl.com','M','Daniel Wilson','$2a$12$FdV6YRBN2EpxdmxVgheCqeffYJBo5W9Z2bl0BXIVCZFedUx5Ss40q',4321098765,'daniel.wjkl',2),(_binary '\ì\âY\à\ÄO§a©‡+I\Øü','222 Cedar Drive, Valley View, TX 75001','1998-09-02','sophia.l@ghi.com','F','Sophia Lee','$2a$12$Ey1pdXaPd.I3ucl2ZBD1hunnmh9FCUDUBxOOhbkO9bUTtHRcH035e',5432109876,'sophia.lghi',2),(_binary '\ì\å\åŒ%M¿¶’ºÁy¢_›','Earth','2003-11-23','arghya1711@b.com','M','Arghya Banerjee','$2a$12$2nk5kH8V1PCLHEaMLIocZOBLhPHfK7RgUqa70yRWOfAQKx4MSbVU6',1010101010,'arghya1711b',2);
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'insurancedb'
--

--
-- Dumping routines for database 'insurancedb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-27 11:42:07
