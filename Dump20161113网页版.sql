-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: web
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `postId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `createdTime` bigint(20) NOT NULL,
  `content` varchar(300) DEFAULT NULL,
  `upCount` bigint(20) DEFAULT '0',
  `downCount` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `postId` (`postId`),
  KEY `userId` (`userId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash`
--

DROP TABLE IF EXISTS `flash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topicId` bigint(20) NOT NULL,
  `imagePath` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topicId` (`topicId`),
  CONSTRAINT `flash_ibfk_1` FOREIGN KEY (`topicId`) REFERENCES `topic` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash`
--

LOCK TABLES `flash` WRITE;
/*!40000 ALTER TABLE `flash` DISABLE KEYS */;
INSERT INTO `flash` VALUES (1,9,'0.png'),(2,10,'1.png'),(3,11,'2.png');
/*!40000 ALTER TABLE `flash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forward`
--

DROP TABLE IF EXISTS `forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forward` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `postId` bigint(20) NOT NULL,
  `lastUserId` bigint(20) DEFAULT NULL,
  `createdTime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  KEY `lastUserId` (`lastUserId`),
  CONSTRAINT `forward_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forward_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `forward_ibfk_3` FOREIGN KEY (`lastUserId`) REFERENCES `user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forward`
--

LOCK TABLES `forward` WRITE;
/*!40000 ALTER TABLE `forward` DISABLE KEYS */;
/*!40000 ALTER TABLE `forward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(300) DEFAULT NULL,
  `createdTime` bigint(20) NOT NULL,
  `srcUserId` bigint(20) DEFAULT NULL,
  `desUserId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `topicId` bigint(20) NOT NULL,
  `createdTime` bigint(20) NOT NULL,
  `mediaPath` varchar(50) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `topicId` (`topicId`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`topicId`) REFERENCES `topic` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `post_view`
--

DROP TABLE IF EXISTS `post_view`;
/*!50001 DROP VIEW IF EXISTS `post_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `post_view` AS SELECT 
 1 AS `id`,
 1 AS `userId`,
 1 AS `topicId`,
 1 AS `createdTime`,
 1 AS `mediaPath`,
 1 AS `content`,
 1 AS `praiseCount`,
 1 AS `forwardCount`,
 1 AS `commentCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `praise`
--

DROP TABLE IF EXISTS `praise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `praise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `postId` bigint(20) NOT NULL,
  `createdTime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `postId` (`postId`),
  CONSTRAINT `praise_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `praise_ibfk_2` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praise`
--

LOCK TABLES `praise` WRITE;
/*!40000 ALTER TABLE `praise` DISABLE KEYS */;
/*!40000 ALTER TABLE `praise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommend_topic`
--

DROP TABLE IF EXISTS `recommend_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommend_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topicId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topicId` (`topicId`),
  CONSTRAINT `recommend_topic_ibfk_1` FOREIGN KEY (`topicId`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommend_topic`
--

LOCK TABLES `recommend_topic` WRITE;
/*!40000 ALTER TABLE `recommend_topic` DISABLE KEYS */;
INSERT INTO `recommend_topic` VALUES (1,9),(2,10),(3,11),(4,12),(5,13);
/*!40000 ALTER TABLE `recommend_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic`
--

DROP TABLE IF EXISTS `topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdTime` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `iconPath` varchar(50) DEFAULT 'default.png',
  `form` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `topic_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic`
--

LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;
INSERT INTO `topic` VALUES (9,23323,2,'雁过也','滟滟随波千万里','8.png',0),(10,232323,2,'正伤心','何处春江无月明','9.png',0),(11,23323,2,'却是旧时相识','越人语天姆','10.png',0),(12,233234,2,'满地黄花堆积','烟波微茫信难求','11.png',0),(13,2332232,2,'憔悴损','海客谈瀛洲','12.png',0),(14,2323223,2,'如今有谁堪摘','怎一个愁字了得','13.png',0);
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topic_care`
--

DROP TABLE IF EXISTS `topic_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topic_care` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `topicId` bigint(20) NOT NULL,
  `createdTime` bigint(20) NOT NULL,
  `lastAccessTime` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `topicId` (`topicId`),
  CONSTRAINT `topic_care_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `topic_care_ibfk_2` FOREIGN KEY (`topicId`) REFERENCES `topic` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_care`
--

LOCK TABLES `topic_care` WRITE;
/*!40000 ALTER TABLE `topic_care` DISABLE KEYS */;
/*!40000 ALTER TABLE `topic_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `topic_view`
--

DROP TABLE IF EXISTS `topic_view`;
/*!50001 DROP VIEW IF EXISTS `topic_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `topic_view` AS SELECT 
 1 AS `id`,
 1 AS `createdTime`,
 1 AS `userId`,
 1 AS `title`,
 1 AS `content`,
 1 AS `iconPath`,
 1 AS `form`,
 1 AS `postCount`,
 1 AS `fansCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `school` varchar(20) DEFAULT '',
  `major` varchar(20) DEFAULT '',
  `sex` int(11) DEFAULT '2' COMMENT '0=girl;1=boy;2=unsure',
  `age` int(11) DEFAULT NULL,
  `name` varchar(20) NOT NULL DEFAULT '无名',
  `mail` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `registerTime` bigint(20) NOT NULL,
  `headImage` varchar(50) DEFAULT 'default.jpg',
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'千里冰封','略输文采',1,32,'李周五',NULL,NULL,12,'1.png',NULL),(3,'万里雪飘','唐宗宋祖',0,12,'冯陈楚',NULL,NULL,23,'2.png',NULL),(4,'望长城内外','稍逊风骚',1,32,'吴正王',NULL,NULL,23,'3.png',NULL),(5,'惟余莽莽','一代天骄',1,12,'周五正',NULL,NULL,34,'4.png',NULL),(6,'大河上下','成吉思汗',0,23,'陈处',NULL,NULL,34,'5.png',NULL),(7,'顿失滔滔','只识弯弓射大雕',1,23,'卫金威',NULL,NULL,23,'6.png',NULL),(8,'山舞银蛇','俱往矣',1,21,'蒋神汉',NULL,NULL,12,'7.png',NULL),(25,'','',2,NULL,'无名','weidiao',NULL,1479010194506,'default.jpg','haha');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_care`
--

DROP TABLE IF EXISTS `user_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_care` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `caredUserId` bigint(20) NOT NULL,
  `createdTime` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `caredUserId` (`caredUserId`),
  CONSTRAINT `user_care_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_care_ibfk_2` FOREIGN KEY (`caredUserId`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_care`
--

LOCK TABLES `user_care` WRITE;
/*!40000 ALTER TABLE `user_care` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!50001 DROP VIEW IF EXISTS `user_post`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_post` AS SELECT 
 1 AS `postId`,
 1 AS `userId`,
 1 AS `lastUserId`,
 1 AS `lastUserName`,
 1 AS `forwardTime`,
 1 AS `realTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_view`
--

DROP TABLE IF EXISTS `user_view`;
/*!50001 DROP VIEW IF EXISTS `user_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_view` AS SELECT 
 1 AS `id`,
 1 AS `school`,
 1 AS `major`,
 1 AS `sex`,
 1 AS `age`,
 1 AS `name`,
 1 AS `password`,
 1 AS `mail`,
 1 AS `mobile`,
 1 AS `registerTime`,
 1 AS `headImage`,
 1 AS `topicCount`,
 1 AS `postCount`,
 1 AS `caredUserCount`,
 1 AS `fansCount`,
 1 AS `caredTopicCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'web'
--

--
-- Final view structure for view `post_view`
--

/*!50001 DROP VIEW IF EXISTS `post_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `post_view` AS select `post`.`id` AS `id`,`post`.`userId` AS `userId`,`post`.`topicId` AS `topicId`,`post`.`createdTime` AS `createdTime`,`post`.`mediaPath` AS `mediaPath`,`post`.`content` AS `content`,(select count(0) from `praise` where (`praise`.`postId` = `post`.`id`)) AS `praiseCount`,(select count(0) from `forward` where (`forward`.`postId` = `post`.`id`)) AS `forwardCount`,(select count(0) from `comment` where (`comment`.`postId` = `post`.`id`)) AS `commentCount` from `post` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `topic_view`
--

/*!50001 DROP VIEW IF EXISTS `topic_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `topic_view` AS select `topic`.`id` AS `id`,`topic`.`createdTime` AS `createdTime`,`topic`.`userId` AS `userId`,`topic`.`title` AS `title`,`topic`.`content` AS `content`,`topic`.`iconPath` AS `iconPath`,`topic`.`form` AS `form`,(select count(`post`.`id`) from `post` where (`post`.`topicId` = `topic`.`id`)) AS `postCount`,(select count(`topic_care`.`userId`) from `topic_care` where (`topic_care`.`topicId` = `topic`.`id`)) AS `fansCount` from `topic` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_post`
--

/*!50001 DROP VIEW IF EXISTS `user_post`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_post` AS select `post`.`id` AS `postId`,`post`.`userId` AS `userId`,NULL AS `lastUserId`,NULL AS `lastUserName`,NULL AS `forwardTime`,`post`.`createdTime` AS `realTime` from `post` union select `forward`.`postId` AS `postId`,`forward`.`userId` AS `userId`,`forward`.`lastUserId` AS `lastUserId`,(select `user`.`name` from `user` where (`user`.`id` = `forward`.`lastUserId`)) AS `lastUserName`,`forward`.`createdTime` AS `forwardTime`,`forward`.`createdTime` AS `realTime` from `forward` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_view`
--

/*!50001 DROP VIEW IF EXISTS `user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_view` AS select `user`.`id` AS `id`,`user`.`school` AS `school`,`user`.`major` AS `major`,`user`.`sex` AS `sex`,`user`.`age` AS `age`,`user`.`name` AS `name`,`user`.`password` AS `password`,`user`.`mail` AS `mail`,`user`.`mobile` AS `mobile`,`user`.`registerTime` AS `registerTime`,`user`.`headImage` AS `headImage`,(select count(0) from `topic` where (`topic`.`userId` = `user`.`id`)) AS `topicCount`,((select count(0) from `post` where (`post`.`userId` = `user`.`id`)) + (select count(0) from `forward` where (`forward`.`userId` = `user`.`id`))) AS `postCount`,(select count(0) AS `weidiao` from `user_care` where (`user_care`.`userId` = `user`.`id`)) AS `caredUserCount`,(select count(0) from `user_care` where (`user_care`.`caredUserId` = `user`.`id`)) AS `fansCount`,(select count(0) from `topic_care` where (`topic_care`.`userId` = `user`.`id`)) AS `caredTopicCount` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-13 13:48:11
