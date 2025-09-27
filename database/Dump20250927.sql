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
INSERT INTO `authorization` VALUES (_binary '\���N#�I.��:��',NULL,'2025-09-23 14:22:01.778876','Follow-up visit for a skin condition.','2025-09-23 14:22:01.779876',_binary '�ВʭAՈ\�,�\�\�0',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,100),(_binary 'i\\�B���:e\� )',NULL,'2025-09-19 15:29:03.602523','Physical therapy for back injury','2025-09-26 16:13:13.716052',_binary '2��AHO�Y�H2T�\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',4,9000),(_binary '\Z>3��/D���ʠN',NULL,'2025-09-19 15:26:28.674188','Routine check-up and blood test','2025-09-26 14:13:33.818256',_binary '2��AHO�Y�H2T�\�',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',3,1500),(_binary ' ߱hZ)D]�=�*�\�',NULL,'2025-09-22 17:55:56.561573','Cardiac stress test','2025-09-22 17:55:56.563604',_binary '�ВʭAՈ\�,�\�\�0',1,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',1,10),(_binary ')\n$�U\�J\�N�\��e�',NULL,'2025-09-22 17:00:48.149935','Patient complained of severe headaches and blurry vision. Administered a series of diagnostic tests. Treatment plan involves a new medication regimen and follow-up in two weeks.','2025-09-22 17:00:48.177293',_binary '2��AHO�Y�H2T�\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,10000),(_binary '1��9[�C9�32�~S�',NULL,'2025-09-19 15:27:21.448704','X-ray and cast for fractured wrist','2025-09-19 15:27:21.451768',_binary ']\�&,oK>��	y\"\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,8500),(_binary '1\�j�@��߯F��u',NULL,'2025-09-23 14:22:41.532948','Emergency room visit for a minor cut.','2025-09-26 14:15:02.994678',_binary '2��AHO�Y�H2T�\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',2,350),(_binary '2\�\�h�\�M¾�\0j2��=',NULL,'2025-09-23 14:22:49.510211','Consultation with a specialist.','2025-09-23 14:22:49.513090',_binary ']\�&,oK>��	y\"\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,220),(_binary '=2\��)\�G���XʋS=',NULL,'2025-09-22 17:56:11.420865','Cardiac stress test','2025-09-22 17:56:11.423867',_binary ']\�&,oK>��	y\"\�',1,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',2,30),(_binary 'E\�n�gNL���\�Q<�',NULL,'2025-09-19 15:29:31.836484','Cardiac stress test','2025-09-19 15:29:31.837992',_binary '�ВʭAՈ\�,�\�\�0',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,7800),(_binary 'H�WٞGj��D�]��\�',NULL,'2025-09-19 15:28:42.742581','Prescription for new medication','2025-09-19 15:28:42.744587',_binary 'aӼN\�@��\�|o\�k',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,850),(_binary 'K)N<x\�G��{�y�A2',NULL,'2025-09-19 15:28:56.336169','Annual gynecological exam','2025-09-19 15:28:56.338169',_binary '\�\�BlI��;�\�V�\Z4',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,1800),(_binary 'P\�No�\�G�F?�}-',NULL,'2025-09-23 14:23:00.345186','Orthodontic retainer.','2025-09-23 14:23:00.347182',_binary '\�\�BlI��;�\�V�\Z4',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,280),(_binary 'SZ![�N7�\����R%�',NULL,'2025-09-22 17:56:04.015957','Cardiac stress test','2025-09-22 17:56:04.018951',_binary '2��AHO�Y�H2T�\�',1,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',1,110),(_binary ']]@���O � �Mq|\�',NULL,'2025-09-23 14:22:45.193362','Teeth whitening treatment.','2025-09-23 14:22:45.195382',_binary 'P^[^O����f��?',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,300),(_binary '`F\�זC���\����:',NULL,'2025-09-19 15:29:10.873006','Mental health counseling session','2025-09-19 15:29:10.877540',_binary 'P^[^O����f��?',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,1000),(_binary 'g����\�D0�x,�㙘',NULL,'2025-09-22 17:55:53.371089','Cardiac stress test','2025-09-22 17:55:53.373602',_binary 'aӼN\�@��\�|o\�k',1,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',2,30),(_binary '��ZMH�T�\�#d\�',NULL,'2025-09-22 17:55:48.202245','Cardiac stress test','2025-09-22 17:55:48.204123',_binary ']\�&,oK>��	y\"\�',2,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',4,20),(_binary '�\��[_@O��\��\�<�',NULL,'2025-09-23 14:22:37.542179','Braces adjustment.','2025-09-23 14:22:37.543179',_binary '\�\�BlI��;�\�V�\Z4',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,120),(_binary '��,�2O�D\�d%�',NULL,'2025-09-19 15:29:25.268767','Child\'s wellness check-up','2025-09-19 15:29:25.270768',_binary 'aӼN\�@��\�|o\�k',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,450),(_binary '�񅋲hM���wq�\�\�',NULL,'2025-09-19 15:27:41.302152','Emergency room visit for chest pain','2025-09-19 15:27:41.303130',_binary '�ВʭAՈ\�,�\�\�0',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,12000),(_binary '��礃MR����{�',NULL,'2025-09-23 14:21:49.572693','Routine dental check-up and cleaning.','2025-09-23 14:21:49.574576',_binary 'P^[^O����f��?',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,150),(_binary '��\�n�^B*�:\�J�\�;',NULL,'2025-09-19 15:27:57.513512','Minor surgery to remove a cyst','2025-09-26 14:13:43.892916',_binary '2��AHO�Y�H2T�\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',4,6500),(_binary '�׳l\�Mв[\�	5|\Z',NULL,'2025-09-19 15:27:49.751748','Follow-up consultation with specialist','2025-09-19 15:27:49.756781',_binary '\�\�BlI��;�\�V�\Z4',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,2500),(_binary '�7�\�\�@����X�\�',NULL,'2025-09-23 14:22:30.277888','Dental crown.','2025-09-23 14:22:30.280361',_binary 'aӼN\�@��\�|o\�k',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,475),(_binary '�Y�E�wN���2�\�ҫ',NULL,'2025-09-26 16:06:16.822354','lulu mall me ahil gaya muskaan k saath aur uska hua dimag kharab aab mentally ill ho gya','2025-09-26 16:16:22.916355',_binary '2��AHO�Y�H2T�\�',2,_binary 'e�\njK-�Ņ};o�',_binary ']�\�\�2�N���\�k',3,10000000),(_binary '�Q\�+\ZQC\�b wE',NULL,'2025-09-23 14:21:30.623459','Initial consultation for minor illness.','2025-09-23 14:21:30.671925',_binary '2��AHO�Y�H2T�\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,250),(_binary '�@�\�f9E��y!\�-I�x',NULL,'2025-09-22 17:55:44.382762','Cardiac stress test','2025-09-22 17:55:44.391140',_binary 'P^[^O����f��?',1,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',2,10),(_binary '�����C{�fl}\�\�=',NULL,'2025-09-22 17:56:08.001377','Cardiac stress test','2025-09-22 17:56:08.004652',_binary 'P^[^O����f��?',2,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',1,70),(_binary '��R��F�S7�[',NULL,'2025-09-23 14:21:58.221427','Filling for a small cavity.','2025-09-23 14:21:58.223418',_binary 'aӼN\�@��\�|o\�k',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,200),(_binary '�̷\�=.H��\�π0ӰU',NULL,'2025-09-19 15:28:21.864340','Regular blood pressure check','2025-09-19 15:28:21.867611',_binary 'P^[^O����f��?',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,300),(_binary '�?\\�\Z�@�\�rc��H\�',NULL,'2025-09-22 17:56:16.736331','Cardiac stress test','2025-09-22 17:56:16.737329',_binary 'aӼN\�@��\�|o\�k',2,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',3,10),(_binary '\�\�.\��H����-�Y�',NULL,'2025-09-23 14:22:05.676264','Tooth extraction.','2025-09-23 14:22:05.677262',_binary '\�\�BlI��;�\�V�\Z4',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,450),(_binary '\�J��ApF4���O�f',NULL,'2025-09-23 14:22:22.838446','Root canal procedure.','2025-09-23 14:22:22.840444',_binary 'P^[^O����f��?',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,490),(_binary '\�Ōd(L(���qy�\�\�',NULL,'2025-09-23 14:22:56.430816','X-ray for a potential fracture.','2025-09-23 14:22:56.432723',_binary '�ВʭAՈ\�,�\�\�0',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,95),(_binary '\�׭�S@S�\�\�\��(t$',NULL,'2025-09-19 15:27:30.827879','Flu shot and annual physical','2025-09-19 15:27:30.831444',_binary 'aӼN\�@��\�|o\�k',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,1500),(_binary '\�L4I\�mH�@�\��.q',NULL,'2025-09-19 15:29:18.431776','Endoscopy for stomach issues','2025-09-19 15:29:18.437319',_binary ']\�&,oK>��	y\"\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,11000),(_binary '\�\�\�\�\�Gɨ\�\�L���',NULL,'2025-09-23 14:22:52.839771','Gum disease treatment.','2025-09-23 14:22:52.841753',_binary 'aӼN\�@��\�|o\�k',2,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,400),(_binary 'ۺ6x�$G,�\�\�\�8\��\r',NULL,'2025-09-22 17:56:00.979520','Cardiac stress test','2025-09-22 17:56:00.981535',_binary '\�\�BlI��;�\�V�\Z4',1,_binary '���)�J۴���\�\\',_binary 'Q\�L)A��ޗW�\�',3,100),(_binary '\�\��AcDf���`�w{',NULL,'2025-09-23 14:22:27.014023','Diagnostic blood test.','2025-09-23 14:22:27.016042',_binary ']\�&,oK>��	y\"\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,80),(_binary '\�AE~L>�{)\�и',NULL,'2025-09-19 15:28:49.816554','Allergy testing and treatment','2025-09-19 15:28:49.817540',_binary '�ВʭAՈ\�,�\�\�0',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,5500),(_binary '\�E)W��Dl����\�L\�H',NULL,'2025-09-23 14:22:33.611049','Vaccination.','2025-09-23 14:22:33.612023',_binary '�ВʭAՈ\�,�\�\�0',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,50),(_binary '���\�H��y�\�{�O\�',NULL,'2025-09-19 15:28:31.436390','Hospital stay for pneumonia','2025-09-19 15:28:31.437394',_binary ']\�&,oK>��	y\"\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,14000),(_binary '�PM#��K\r�BgE\�\�[0',NULL,'2025-09-23 14:22:19.312518','Physical therapy session.','2025-09-23 14:22:19.313514',_binary '2��AHO�Y�H2T�\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,300),(_binary '����~\�M��\�\�J��>�',NULL,'2025-09-23 14:21:53.559601','Prescription medication for allergy relief.','2025-09-23 14:21:53.561600',_binary ']\�&,oK>��	y\"\�',1,_binary 'aӼN\�@��\�|o\�k',_binary '��O,�TG+�5�q�\n�\�',1,75);
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
INSERT INTO `authorization_log` VALUES (_binary '�$ EC������\��@','2025-09-23 14:22:41.562954',1,NULL,_binary '1\�j�@��߯F��u'),(_binary '\�r�̀I\�\��:��G','2025-09-19 15:28:49.823057',1,NULL,_binary '\�AE~L>�{)\�и'),(_binary '�\�PN$�,�1+.','2025-09-23 14:22:52.850755',1,NULL,_binary '\�\�\�\�\�Gɨ\�\�L���'),(_binary '	���}N~��I9��F','2025-09-23 14:23:00.356181',1,NULL,_binary 'P\�No�\�G�F?�}-'),(_binary '�\�\�Ly�\Z23\�@�1','2025-09-26 16:16:22.961079',3,2,_binary '�Y�E�wN���2�\�ҫ'),(_binary ':	=sFÛA�\��\�\�','2025-09-19 15:28:31.443797',1,NULL,_binary '���\�H��y�\�{�O\�'),(_binary '�\�yh0M%�A\�\�\�{\�','2025-09-26 14:13:33.947875',3,1,_binary '\Z>3��/D���ʠN'),(_binary '#\�{`N��}Ъ���','2025-09-23 14:22:33.618035',1,NULL,_binary '\�E)W��Dl����\�L\�H'),(_binary '\"(��qB��\�:\�z','2025-09-19 15:29:25.276281',1,NULL,_binary '��,�2O�D\�d%�'),(_binary '$�\�\�M�&b��2�W','2025-09-23 14:22:19.323518',1,NULL,_binary '�PM#��K\r�BgE\�\�[0'),(_binary '\'���{O.�Gs�\�F��','2025-09-19 15:29:03.621060',1,NULL,_binary 'i\\�B���:e\� )'),(_binary ')�a6\�\�O�����Ea�','2025-09-23 14:22:27.024023',1,NULL,_binary '\�\��AcDf���`�w{'),(_binary '+<l���@�&�\�\�\�\0�','2025-09-26 16:13:10.903937',3,3,_binary 'i\\�B���:e\� )'),(_binary '+]��eL\��x:��i','2025-09-19 15:26:28.684210',1,NULL,_binary '\Z>3��/D���ʠN'),(_binary '9��e��E�8@�O�','2025-09-22 17:56:04.030579',1,NULL,_binary 'SZ![�N7�\����R%�'),(_binary ';UQDMg��f��<\Z�','2025-09-23 14:22:49.564721',1,NULL,_binary '2\�\�h�\�M¾�\0j2��='),(_binary '>}ESMH��d\��\n��\�','2025-09-23 14:21:30.708205',1,NULL,_binary '�Q\�+\ZQC\�b wE'),(_binary '>\���hO��BIb�\�','2025-09-26 16:13:52.793194',2,1,_binary '�Y�E�wN���2�\�ҫ'),(_binary 'K\�\�\�ZyKx�\�\"\��\\��','2025-09-26 16:12:55.872525',3,1,_binary 'i\\�B���:e\� )'),(_binary 'P-m��M��\�{�c�	','2025-09-22 17:55:56.576586',1,NULL,_binary ' ߱hZ)D]�=�*�\�'),(_binary 'T�\\z\�C��\�_T\rQ','2025-09-22 17:56:08.013118',1,NULL,_binary '�����C{�fl}\�\�='),(_binary 'X\0��`&GӸP�\�\�','2025-09-22 17:00:48.202562',1,NULL,_binary ')\n$�U\�J\�N�\��e�'),(_binary 'Zs+�6K��J�\�\�\��','2025-09-23 14:21:49.583078',1,NULL,_binary '��礃MR����{�'),(_binary ']gJۿiM=�S�~w=','2025-09-19 15:27:21.466833',1,NULL,_binary '1��9[�C9�32�~S�'),(_binary 'r\�\�<=7D��\r5+L80�','2025-09-19 15:29:18.455548',1,NULL,_binary '\�L4I\�mH�@�\��.q'),(_binary 's�\�Mr����\�\��','2025-09-19 15:29:31.848403',1,NULL,_binary 'E\�n�gNL���\�Q<�'),(_binary '{\�wf��F�r3e!�\�v','2025-09-23 14:22:22.849445',1,NULL,_binary '\�J��ApF4���O�f'),(_binary '~h0��I3�>�w\�ճ','2025-09-26 16:06:16.838792',1,NULL,_binary '�Y�E�wN���2�\�ҫ'),(_binary '~\�2�C��\�\�+/\�','2025-09-23 14:22:01.788859',1,NULL,_binary '\���N#�I.��:��'),(_binary 'x<\0�WDϛ�F��7y\�','2025-09-19 15:27:49.776008',1,NULL,_binary '�׳l\�Mв[\�	5|\Z'),(_binary '���.��FG��P0\�','2025-09-26 16:13:13.746091',4,3,_binary 'i\\�B���:e\� )'),(_binary '�\�@\�\'�O��EVc\�t\�','2025-09-22 17:56:16.744349',1,NULL,_binary '�?\\�\Z�@�\�rc��H\�'),(_binary '�t��FM�����n0','2025-09-23 14:21:53.567603',1,NULL,_binary '����~\�M��\�\�J��>�'),(_binary '�!��\�H±Ɋ����w','2025-09-23 14:22:30.289982',1,NULL,_binary '�7�\�\�@����X�\�'),(_binary '����N��[�^1\�','2025-09-22 17:56:11.433245',1,NULL,_binary '=2\��)\�G���XʋS='),(_binary '�5u\�XK|�ԧ�\�b�','2025-09-26 14:15:03.031301',2,1,_binary '1\�j�@��߯F��u'),(_binary '�f\�g\�EK�b��\�%�P','2025-09-22 17:56:00.991038',1,NULL,_binary 'ۺ6x�$G,�\�\�\�8\��\r'),(_binary '�\�+�\�K7�\�K��o','2025-09-19 15:28:21.877684',1,NULL,_binary '�̷\�=.H��\�π0ӰU'),(_binary '�`��E���7^��','2025-09-23 14:22:56.440829',1,NULL,_binary '\�Ōd(L(���qy�\�\�'),(_binary '��G��\�@=�I/�^�j','2025-09-19 15:27:41.307728',1,NULL,_binary '�񅋲hM���wq�\�\�'),(_binary '��.\�\�D��\�{\�7\\','2025-09-23 14:22:05.693136',1,NULL,_binary '\�\�.\��H����-�Y�'),(_binary '��Z��C\�߹\0,\rv','2025-09-23 14:22:45.202382',1,NULL,_binary ']]@���O � �Mq|\�'),(_binary '�Jg\�D\�1I�\�','2025-09-23 14:21:58.229418',1,NULL,_binary '��R��F�S7�['),(_binary '����j\�@»�;\�U��','2025-09-19 15:27:57.521114',1,NULL,_binary '��\�n�^B*�:\�J�\�;'),(_binary '��^\�\�\�Ld�Cy�\� �','2025-09-19 15:29:10.894462',1,NULL,_binary '`F\�זC���\����:'),(_binary '�jF��\�G��\0�˳�','2025-09-22 17:55:48.214242',1,NULL,_binary '��ZMH�T�\�#d\�'),(_binary '���o�D��08�*VԮ','2025-09-19 15:28:56.351132',1,NULL,_binary 'K)N<x\�G��{�y�A2'),(_binary 'ˏE�\�E+�\���\�J9','2025-09-22 17:55:44.403442',1,NULL,_binary '�@�\�f9E��y!\�-I�x'),(_binary '׽�TpJֱ\�\�夰ެ','2025-09-22 17:55:53.387013',1,NULL,_binary 'g����\�D0�x,�㙘'),(_binary '\���\��Nϩy�t\'L�','2025-09-26 14:13:43.929182',4,1,_binary '��\�n�^B*�:\�J�\�;'),(_binary '\����΀O�:\�^�O','2025-09-19 15:27:30.840989',1,NULL,_binary '\�׭�S@S�\�\�\��(t$'),(_binary '��ߏ&\�L��t90��A','2025-09-19 15:28:42.758411',1,NULL,_binary 'H�WٞGj��D�]��\�'),(_binary '�j�6e�Cw�Z\0O�o\�','2025-09-23 14:22:37.548173',1,NULL,_binary '�\��[_@O��\��\�<�');
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
INSERT INTO `dependent_master` VALUES (_binary '{{H8�\"E\\��\�\�Ɠgi','Earth','2003-11-15','vedant@s.com','F','2025-09-24 14:57:32.432004','Vedant Sinha',101010101,_binary '���)�J۴���\�\\',5),(_binary '� \�\�ΈBȫ�\"_8�\�','Earth','2000-11-11','vedant@s10.com','M','2025-09-24 17:32:37.416967','Test',1111111111,_binary '���)�J۴���\�\\',9),(_binary '�j\�\��A,�-D#�\�','456 Oak Avenue, Metropolis, USA','1988-05-21','jane.doe@example.com','F','2025-09-09 00:00:00.000000','Jane Doe',9876543210,_binary '\�\�BlI��;�\�V�\Z4',5),(_binary '��\�N@�6N\�\�;AA','@$%^','2026-06-09','re@gmail.com','','2025-09-26 16:02:50.178503','+_)(*&^%$#@',0,_binary 'e�\njK-�Ņ};o�',9),(_binary '��c\�\�K����\��\�M','789 Pine Street, Smallville, USA','2000-01-15','alex.j@example.com','M','2025-09-09 00:00:00.000000','Alex Johnson',5551234567,_binary '\�\�BlI��;�\�V�\Z4',3),(_binary '�3\��\�Mv�6G7nN��','Earth','2002-12-20','vedant@s10.com','M','2025-09-24 15:59:06.577514','Vedant Sinha',1111111111,_binary '���)�J۴���\�\\',3),(_binary '\��\�\�N(�b�,�\�u\�','Earth','2000-11-11','vedant@s10.com','M','2025-09-24 17:34:57.947363','Test1',1111111111,_binary '�����Ck���U�z\r\�',9),(_binary '\�P9ioGN��\'1\��re','456 Oak Avenue, Springfield','1998-05-15','alex.johnson@example.com','M','2025-09-24 17:42:50.489492','Alex Johnson',9876543210,_binary '��t\��O\�z5�D�	�',2);
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
INSERT INTO `hospital_master` VALUES (_binary '\0;G\�\�E1�۲�����','10 Ocean Drive, Seaside, FL 33101','sarah.wilson@buildit.org',5557778888,'projects@coastalbuild.com','Coastal Construction',4.3,1),(_binary 'hs�U�E�X�H�\�','45 Technology Blvd, Tech City, TX 77001','jane.smith@partnercorp.net',5559876543,'support@globaltech.net','Global Tech Services',3.8,0),(_binary 'F�	�gF��\r)R#\�','90 Commerce Way, Suburbia, IL 60601','david.lee@marketingsuccess.net',5555556666,'hello@alphamarketing.com','Alpha Marketing Group',3.5,0),(_binary 'Y\��i|�N\"���\r\�Z\�','202 Birch Lane, Northwood, USA','info@northwoodfamily.com',5556667777,'contact@northwoodfamily.com','Northwood Family Clinic',4.7,1),(_binary '}k�� @>�TF�\�^[','33 Solar Pkwy, Eco Village, OR 97204','lisa.martin@cleanpower.com',5553030303,'info@greenearth.org','Green Earth Energy',4.6,0),(_binary '�sAM.L�v��:$�\�','55 High Tower, Sky City, WA 98101','mike.jones@topclients.com',5559990000,'reachout@zenithconsult.com','Zenith Consulting',5,1),(_binary '��%6�LHY���<`�v\�','88 Bank Plaza, Finance District, CA 94105','chris.evans@moneywise.co',5552020202,'accounts@quantumfinancial.com','Quantum Financial',4.7,1),(_binary '�\�7M��O��E�>X','789 Pine Street, Springfield, USA','appointments@cityhealth.com',5554443333,'contact@cityhealth.com','City Health Medical Center',4.6,1),(_binary '\�9��\�D���q��G�\�','456 Oak Avenue, Metropolis, USA','admissions@generalhospital.org',5559876543,'info@generalhospital.org','General Hospital',4.8,0),(_binary '֢�E\�O��\����a.','123 Main St, Anytown, CA 90210','john.doe@clientco.com',5551234567,'info@acmesolutions.com','Acme Solutions Inc.',4.5,1),(_binary '\�\�+o�\�GC�\�귇�^�','22 Business Park, Metro City, NY 10001','maria.rodriguez@dataco.com',5553334444,'sales@dataflow.co','DataFlow Analytics',4.1,1),(_binary '\��\�O�B\�\���\�p','78 Research Ave, Science Valley, MA 02139','alex.chen@futurebiz.com',5551112222,'contact@innovatelabs.org','Innovate Labs',4.9,1),(_binary '�=�\�I*�\�rR5�\"','1 Warehouse Rd, Industrial Area, NJ 08817','emily.brown@shippingfast.net',5550101010,'dispatch@pioneerlogistics.net','Pioneer Logistics',3.2,0);
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
INSERT INTO `policy_master` VALUES (_binary '\0���\�N@�I�O\�\�','2025-09-24 14:57:32.347939','2026-09-23',17700,'2025-09-24','2025-09-24 14:57:32.347939',_binary '���)�J۴���\�\\',1,5,50000),(_binary '\���aLj��2̓�w\�','2025-09-24 15:59:06.291210','2026-09-23',17700,'2025-09-24','2025-09-24 15:59:06.291210',_binary '���)�J۴���\�\\',1,5,50000),(_binary '[d\�7Hq��lI�','2025-09-19 15:23:20.474245','2025-01-14',11500,'2024-01-15','2025-09-19 15:23:20.474245',_binary '�\�`T\�E�}J\�(\'�',1,2,15000),(_binary 'E� ��G��\�=�nr','2025-09-24 17:34:57.762149','2026-09-23',9400,'2025-09-24','2025-09-24 17:34:57.762149',_binary '�����Ck���U�z\r\�',1,3,50000),(_binary 'Q\�L)A��ޗW�\�','2025-09-22 17:55:37.085662','2025-04-19',28800,'2024-04-20','2025-09-22 17:55:37.085662',_binary '���)�J۴���\�\\',4,5,200000),(_binary ']�\�\�2�N���\�k','2025-09-26 15:58:47.513106','2026-09-25',17700,'2025-09-26','2025-09-26 16:16:22.951756',_binary 'e�\njK-�Ņ};o�',1,5,-19000000),(_binary '��\�6�Gc�\�\�\�\�\�E�','2025-09-19 15:23:34.089711','2024-10-31',13200,'2023-11-01','2025-09-19 15:23:34.089711',_binary '�\�`T\�E�}J\�(\'�',3,3,50000),(_binary '��G!D�C�30�\�p','2025-09-10 12:20:46.249894','2025-05-19',15600,'2024-05-20','2025-09-10 12:20:46.249894',_binary '\�\�BlI��;�\�V�\Z4',1,1,5000),(_binary '�фMz�@��\�o�\�\�','2025-09-24 17:32:37.307655','2026-09-23',17700,'2025-09-24','2025-09-24 17:32:37.307984',_binary '���)�J۴���\�\\',1,5,50000),(_binary '��O,�TG+�5�q�\n�\�','2025-09-10 12:19:35.463917','2025-04-19',13200,'2023-01-15','2025-09-26 16:13:13.734472',_binary 'aӼN\�@��\�|o\�k',3,3,14650),(_binary '�\'z\��\�E͈�*gjƮ','2025-09-24 17:44:41.262827','2026-09-30',11500,'2025-10-01','2025-09-24 17:44:41.262827',_binary '��t\��O\�z5�D�	�',1,2,50000);
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
INSERT INTO `user_master` VALUES (_binary '2��AHO�Y�H2T�\�','456 Pine Lane, Lakeside, CA 90210','1992-11-05','maria@abc.com','F','Maria Garcia','$2a$12$mR.pN0ETESDChKNNxy.Bvu2w/UAaWKIiqkKmVUWukcLcStd7rkf6y',8765432109,'mariaabc',1),(_binary '5���\�@D�+O9\"\�\�\�','Earth','2003-11-23','tanmay@s.com','F','Tanmay Sable','$2a$12$9yu1VYl8jPpt.SjlLF/CSuoSuQkCi0ix9Z9ioOFIS4ZnJlBi07AIe',1010101010,'tanmays',2),(_binary 'P^[^O����f��?','123 Main St, Anytown, USA','1990-05-15','alex.smith@example.com','M','Alex Smith','strong_password123',1234567890,'alex.smithexample',1),(_binary ']\�&,oK>��	y\"\�','101 Birch Road, Hilltop, GA 30303','1985-01-30','mikeb@def.com','M','Michael Brown','$2a$12$JtAPhALa8qlj9vRJSgN78OrSquyqTlHZYQKC09fs3AsCZqGZ6qQ/K',6543210987,'mikebdef',1),(_binary 'aӼN\�@��\�|o\�k','123 Main St, Anytown, USA','1990-05-15','alex@example.com','M','Alex','$2a$12$8T641BPCIgxLX1J10d0GIu11kh8zgPQO2T.LGa11mS2QxBrZ8eDDO',1234567890,'alexexample',1),(_binary 'cf�QIC�\�J�\�\�x5','999 Forest Drive, Green Valley, WA 98001','1991-04-18','alex.r@mno.com','M','Alex Rodriguez','$2a$12$ZO35SVk0wA4X3C6RQMrFu.CAU1J.gjEbPGEGN0VNaUGY6ny2p1Wc6',8765432101,'alex.rmno',2),(_binary 'e�\njK-�Ņ};o�','@$%^','2025-09-30','re@gmail.com','M','!@#','$2a$12$mzrr7OlMiVAi9w8RoKYTK..hT5oNa/8TRKdG3nxb9PfxWZPEt2AxO',0,'regmail',2),(_binary '�ɔ)ƂEƚ`D\"\�\�','456 Pine Lane, Lakeside, CA 90210','1992-11-05','arghya17@b.com','M','Arghya banerjee','$2a$12$Oe3cvthKKRBtovJRaOv0eOgkq7koeUm3xxk8d4M.F6yF8iCDnK.Ta',8765432109,'arghya17b',2),(_binary '�ВʭAՈ\�,�\�\�0','123 Main Street, Anytown, USA 12345','1990-05-20','alex.johnson@example.com','M','Alex Johnson','$2a$12$whTc2xUm61gT9fIt48ENcOubWgsyMzGFxBa9MMmYLjsawFlfSBwFi',9876543210,'alex.johnsonexample',1),(_binary '���)�J۴���\�\\','456 Pine Lane, Lakeside, CA 90210','1992-11-05','arghya@b.com','F','Arghya','$2a$12$Mpqztv.h/0ehSnGS55HttuwXpRrNIt5t8W/OT1lPGyZk1mUOwx8wG',8765432109,'arghyab',2),(_binary '��\�\�9\�D���6�!�Ny','Earth','2003-11-23','test1@test.com','M','Test2','$2a$12$IEc6aGu5tSFDpp5hBYubiOKfMqFuG9Mvdzvz1kh2DtFKdpN/DwCQq',1010101010,'test1test',2),(_binary '�����Ck���U�z\r\�','Earth','2003-11-23','test@test.com','M','Test1','$2a$12$mI7C/FXldqV2cztRzVABZOYSQdRnL.c4t6BaIuLDP2kuAFXHAihTS',1010101010,'testtest',2),(_binary '��t\��O\�z5�D�	�','456 Pine Lane, Lakeside, CA 90210','1992-11-05','test2@test.com','M','Test 2','$2a$12$/xMNlX2llNLVlaUOwQt5XugxiDMexYSIyAyfpLvI.3.I/NI7cwIwW',8765432109,'test2test',2),(_binary '�\�`T\�E�}J\�(\'�','789 Maple Avenue, Riverdale, NY 10001','1995-07-14','emily.chen@pqr.com','F','Emily Chen','$2a$12$HLN8ZMjwvtMR8TIOwjPduOlGTh5QZp9ZlagudW06D7oZVw3nB4ZUC',7654321098,'emily.chenpqr',2),(_binary '\�\�BlI��;�\�V�\Z4','Kalyani','2002-11-17','a@b.com','M','Arghya','1234',1234567890,'arghya17',1),(_binary '\�k�\�DP��v�G֮','333 Spruce Lane, Bay City, FL 33101','1990-12-25','daniel.w@jkl.com','M','Daniel Wilson','$2a$12$FdV6YRBN2EpxdmxVgheCqeffYJBo5W9Z2bl0BXIVCZFedUx5Ss40q',4321098765,'daniel.wjkl',2),(_binary '\�\�Y\�\�O�a��+I\��','222 Cedar Drive, Valley View, TX 75001','1998-09-02','sophia.l@ghi.com','F','Sophia Lee','$2a$12$Ey1pdXaPd.I3ucl2ZBD1hunnmh9FCUDUBxOOhbkO9bUTtHRcH035e',5432109876,'sophia.lghi',2),(_binary '\�\�\�%M�����y�_�','Earth','2003-11-23','arghya1711@b.com','M','Arghya Banerjee','$2a$12$2nk5kH8V1PCLHEaMLIocZOBLhPHfK7RgUqa70yRWOfAQKx4MSbVU6',1010101010,'arghya1711b',2);
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
