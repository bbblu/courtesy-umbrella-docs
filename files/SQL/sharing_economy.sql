-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: sharing_economy
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `device` (
  `id` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '裝置編號',
  `address_id` int(11) DEFAULT NULL,
  `provider` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '提供者',
  `create_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '建立者',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  PRIMARY KEY (`id`),
  KEY `fk_device_create_id` (`create_id`),
  KEY `fk_device_address_id_idx` (`address_id`),
  CONSTRAINT `fk_device_address_id` FOREIGN KEY (`address_id`) REFERENCES `station_address` (`id`),
  CONSTRAINT `fk_device_create_id` FOREIGN KEY (`create_id`) REFERENCES `user` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='裝置資訊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_record_id` int(11) DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '狀態(0: 待處理/ 1: 處理中/ 2: 已完成)',
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '回報者信箱',
  `content_message` varchar(3000) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '訊息內容',
  `handler` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT '處理人帳號',
  `handle_date` datetime DEFAULT NULL COMMENT '處理日期',
  `complete_date` datetime DEFAULT NULL COMMENT '完成日期',
  `modify_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '最後修改者帳號',
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最後修改時間',
  PRIMARY KEY (`id`),
  KEY `fk_feedback_repair_record_id_idx` (`repair_record_id`),
  KEY `fk_feedback_modify_id` (`modify_id`),
  KEY `fk_feedback_handler` (`handler`),
  CONSTRAINT `fk_feedback_handler` FOREIGN KEY (`handler`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_feedback_modify_id` FOREIGN KEY (`modify_id`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_feedback_repair_record_id` FOREIGN KEY (`repair_record_id`) REFERENCES `repair_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='回饋意見';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_attachment`
--

DROP TABLE IF EXISTS `feedback_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_id` int(11) NOT NULL,
  `type` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '附件類型(0: 照片/ 1: 影片)',
  `url` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '附件網址',
  PRIMARY KEY (`id`),
  KEY `fk_feedback_attachment_feedback_id_idx` (`feedback_id`),
  CONSTRAINT `fk_feedback_attachment_feedback_id` FOREIGN KEY (`feedback_id`) REFERENCES `feedback` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='回饋意見附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_attachment`
--

LOCK TABLES `feedback_attachment` WRITE;
/*!40000 ALTER TABLE `feedback_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_type`
--

DROP TABLE IF EXISTS `item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `name` varchar(70) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '物品名稱',
  `enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否啟用(1: 啟用/ 2:不啟用)',
  `create_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '建立者',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `modify_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '修改者',
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `fk_item_type_executor` (`create_id`),
  KEY `fk_item_type_modify_id` (`modify_id`),
  CONSTRAINT `fk_item_type_executor` FOREIGN KEY (`create_id`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_item_type_modify_id` FOREIGN KEY (`modify_id`) REFERENCES `user` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='租借物品種類';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_type`
--

LOCK TABLES `item_type` WRITE;
/*!40000 ALTER TABLE `item_type` DISABLE KEYS */;
INSERT INTO `item_type` VALUES (1,'雨傘',1,'admin','2020-03-28 11:34:10','admin','2020-03-28 11:36:52'),(2,'陽傘',1,'admin','2020-03-28 11:34:10','admin','2020-03-28 11:36:52');
/*!40000 ALTER TABLE `item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_record`
--

DROP TABLE IF EXISTS `log_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `log_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(500) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '網址',
  `ip` varchar(19) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '使用者IP',
  `executor` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '使用者帳號',
  `execute_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作日期',
  `device` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '使用設備(0: 瀏覽器/ 1: App)',
  `device_type` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '設備類型(0: IE/ 1: Edge/ 2: Chrome/ 3:FireFox/ 4: Safari/ 5: Android/ 6: iOS)',
  PRIMARY KEY (`id`),
  KEY `fk_log_record_executor` (`executor`),
  CONSTRAINT `fk_log_record_executor` FOREIGN KEY (`executor`) REFERENCES `user` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='使用者操作紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_record`
--

LOCK TABLES `log_record` WRITE;
/*!40000 ALTER TABLE `log_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental_record`
--

DROP TABLE IF EXISTS `rental_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rental_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type_id` int(11) NOT NULL COMMENT '租借物品類型',
  `address_id` int(11) NOT NULL COMMENT '租借地點',
  `type` int(11) NOT NULL COMMENT '租借方式',
  `renter` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '租借者帳號',
  `recipient` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '接收者帳號',
  `third_party` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT '第三方中間者',
  `restoration_address_id` int(11) DEFAULT NULL COMMENT '歸還地點',
  `expected_date` datetime NOT NULL COMMENT '預計歸還時間',
  `actual_date` datetime DEFAULT NULL COMMENT '實際歸還時間',
  `status` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '0' COMMENT '物品狀態(0: 出借中/ 1:已歸還/ 2:損壞/ 3: 遺失/ 4:被搶)',
  `enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否啟用(1: 啟用/ 2:不啟用)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_rental_record_item_type_idx` (`item_type_id`),
  KEY `fk_rental_record_renter` (`renter`),
  KEY `fk_rental_record_recipient` (`recipient`),
  KEY `fk_rental_record_third_party` (`third_party`),
  KEY `fk_rental_record_type_idx` (`type`),
  KEY `fk_rental_record_address_id_idx` (`address_id`),
  KEY `fk_rental_record_restoration_address_id_idx` (`restoration_address_id`),
  CONSTRAINT `fk_rental_record_address_id` FOREIGN KEY (`address_id`) REFERENCES `station_address` (`id`),
  CONSTRAINT `fk_rental_record_item_type_id` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`id`),
  CONSTRAINT `fk_rental_record_recipient` FOREIGN KEY (`recipient`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_rental_record_renter` FOREIGN KEY (`renter`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_rental_record_restoration_address_id` FOREIGN KEY (`restoration_address_id`) REFERENCES `station_address` (`id`),
  CONSTRAINT `fk_rental_record_third_party` FOREIGN KEY (`third_party`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_rental_record_type` FOREIGN KEY (`type`) REFERENCES `rental_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='租借紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental_record`
--

LOCK TABLES `rental_record` WRITE;
/*!40000 ALTER TABLE `rental_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `rental_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental_type`
--

DROP TABLE IF EXISTS `rental_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rental_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '租借方式名稱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='租借方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental_type`
--

LOCK TABLES `rental_type` WRITE;
/*!40000 ALTER TABLE `rental_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `rental_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_attachment`
--

DROP TABLE IF EXISTS `repair_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `repair_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL COMMENT '修繕記錄編號',
  `type` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '附件類型(0: 照片/ 1: 影片)',
  `url` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '附件網址',
  PRIMARY KEY (`id`),
  KEY `fk_repair_attachment_repair_record_id_idx` (`record_id`),
  CONSTRAINT `fk_repair_attachment_record_id` FOREIGN KEY (`record_id`) REFERENCES `repair_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='修繕附件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_attachment`
--

LOCK TABLES `repair_attachment` WRITE;
/*!40000 ALTER TABLE `repair_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_record`
--

DROP TABLE IF EXISTS `repair_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `repair_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` char(1) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '修繕狀態(0: 待處理/ 1: 處理中/ 2: 已完成)',
  `reporter` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '回報者帳號',
  `report_date` datetime NOT NULL COMMENT '回報時間',
  `repairer` varchar(100) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL COMMENT '修繕者帳號',
  `order_date` datetime DEFAULT NULL COMMENT '修繕者接單時間',
  `complete_date` datetime DEFAULT NULL COMMENT '完成時間',
  `modify_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_repair_record_reporter` (`reporter`),
  KEY `fk_repair_record_repairer` (`repairer`),
  KEY `fk_repair_record_modify_id` (`modify_id`),
  CONSTRAINT `fk_repair_record_modify_id` FOREIGN KEY (`modify_id`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_repair_record_repairer` FOREIGN KEY (`repairer`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_repair_record_reporter` FOREIGN KEY (`reporter`) REFERENCES `user` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='修繕紀錄';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_record`
--

LOCK TABLES `repair_record` WRITE;
/*!40000 ALTER TABLE `repair_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_address`
--

DROP TABLE IF EXISTS `station_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `station_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `longitude` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '經度',
  `latitude` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '緯度',
  `address` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '詳細地址',
  `enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否啟用(1: 啟用/ 0: 不啟用)',
  `item_type_id` int(11) NOT NULL COMMENT '租借物品類型',
  `total_count` int(11) NOT NULL COMMENT '可租借數量',
  `create_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '建立者',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `modify_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '最後修改者',
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最後修改時間',
  PRIMARY KEY (`id`),
  KEY `fk_rental_address_item_type_id_idx` (`item_type_id`),
  KEY `fk_station_address_create_id` (`create_id`),
  KEY `fk_station_address_modify_id` (`modify_id`),
  CONSTRAINT `fk_station_address_create_id` FOREIGN KEY (`create_id`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_station_address_item_type_id` FOREIGN KEY (`item_type_id`) REFERENCES `item_type` (`id`),
  CONSTRAINT `fk_station_address_modify_id` FOREIGN KEY (`modify_id`) REFERENCES `user` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='站點位置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_address`
--

LOCK TABLES `station_address` WRITE;
/*!40000 ALTER TABLE `station_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `station_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `account` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '使用者帳號',
  `password` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '使用者密碼',
  `role_id` int(11) NOT NULL DEFAULT '3' COMMENT '使用者權限(3為一般使用者)',
  `enable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否啟用',
  `email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '電子信箱',
  `birthday` date NOT NULL COMMENT '生日',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立時間',
  `modify_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '最後修改者',
  `modify_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最後修改時間',
  PRIMARY KEY (`account`),
  KEY `fk_user_role_id_idx` (`role_id`),
  KEY `fk_user_modify_id` (`modify_id`),
  CONSTRAINT `fk_user_modify_id` FOREIGN KEY (`modify_id`) REFERENCES `user` (`account`),
  CONSTRAINT `fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='使用者';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','$2a$10$hagQjQFpQTlChHKHzKpLT.0eabhsQNOOnJ/VJkH/e4PPRqoG55nsK',1,1,'10646007@ntub.edu.tw','2020-03-28','2020-03-28 11:35:33','admin','2020-04-05 13:07:19'),('anonymous','123',3,0,'ignore','2020-03-15','2020-03-15 20:14:27','admin','2020-04-05 13:07:19'),('test','$2a$10$MfHsTXOCyKHW9wvu/eCaK.K/7IYoCj1Ja.sApWcxNPptPVbyI5LSi',3,1,'email@ntub.edu.tw','2020-04-28','2020-04-28 10:21:31','test','2020-04-28 10:21:31');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水編號',
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL COMMENT '權限名稱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci COMMENT='使用者權限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin'),(2,'manager'),(3,'normal'),(4,'repairer');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-19 16:43:04
