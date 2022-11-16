-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: ssm1
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'测试','http://localhost:8080/ssm/upload/1613743809457.jpg'),(2,'picture2','http://localhost:8080/ssm/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssm/upload/picture3.jpg'),(6,'homepage',NULL),(7,'测试1','http://localhost:8080/ssm/upload/1613743823151.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exampaper`
--

DROP TABLE IF EXISTS `exampaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743396556 DEFAULT CHARSET=utf8 COMMENT='试卷表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exampaper`
--

LOCK TABLES `exampaper` WRITE;
/*!40000 ALTER TABLE `exampaper` DISABLE KEYS */;
INSERT INTO `exampaper` VALUES (1613743396555,'2021-02-19 14:03:16','计算机考试',60,1);
/*!40000 ALTER TABLE `exampaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examquestion`
--

DROP TABLE IF EXISTS `examquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743507512 DEFAULT CHARSET=utf8 COMMENT='试题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examquestion`
--

LOCK TABLES `examquestion` WRITE;
/*!40000 ALTER TABLE `examquestion` DISABLE KEYS */;
INSERT INTO `examquestion` VALUES (1613743433141,'2021-02-19 14:03:52',1613743396555,'计算机考试','1+1=','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]',25,'B','测试',0,1),(1613743467677,'2021-02-19 14:04:27',1613743396555,'计算机考试','1+1=','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]',25,'B,C','测试',1,2),(1613743489411,'2021-02-19 14:04:48',1613743396555,'计算机考试','1+1=2','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',25,'A','测试',2,3),(1613743507511,'2021-02-19 14:05:06',1613743396555,'计算机考试','1+1=','[]',25,'2','测试',3,4);
/*!40000 ALTER TABLE `examquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examrecord`
--

DROP TABLE IF EXISTS `examrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743860823 DEFAULT CHARSET=utf8 COMMENT='考试记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examrecord`
--

LOCK TABLES `examrecord` WRITE;
/*!40000 ALTER TABLE `examrecord` DISABLE KEYS */;
INSERT INTO `examrecord` VALUES (1613743852661,'2021-02-19 14:10:51',1613743552155,NULL,1613743396555,'计算机考试',1613743433141,'1+1=','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]',25,'B','测试',25,'B'),(1613743855403,'2021-02-19 14:10:54',1613743552155,NULL,1613743396555,'计算机考试',1613743467677,'1+1=','[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]',25,'B,C','测试',0,'B'),(1613743857746,'2021-02-19 14:10:57',1613743552155,NULL,1613743396555,'计算机考试',1613743489411,'1+1=2','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',25,'A','测试',25,'A'),(1613743860822,'2021-02-19 14:11:00',1613743552155,NULL,1613743396555,'计算机考试',1613743507511,'1+1=','[]',25,'2','测试',25,'2');
/*!40000 ALTER TABLE `examrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743910509 DEFAULT CHARSET=utf8 COMMENT='学习论坛';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (81,'2021-02-19 13:44:26','帖子标题1','帖子内容1',1,1,'用户名1','开放'),(82,'2021-02-19 13:44:26','帖子标题2','帖子内容2',2,2,'用户名2','开放'),(83,'2021-02-19 13:44:26','帖子标题3','帖子内容3',3,3,'用户名3','开放'),(84,'2021-02-19 13:44:26','帖子标题4','帖子内容4',4,4,'用户名4','开放'),(85,'2021-02-19 13:44:26','帖子标题5','帖子内容5',5,5,'用户名5','开放'),(86,'2021-02-19 13:44:26','帖子标题6','帖子内容6',6,6,'用户名6','开放'),(1613743771992,'2021-02-19 14:09:31','测试','<p>编辑器可上传图文<img src=\"http://localhost:8080/ssm/upload/1613743771347.jpg\"></p>',NULL,1,'',''),(1613743910508,'2021-02-19 14:11:49','测试','<p>测试</p>',0,1613743552155,'01','开放');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoshi`
--

DROP TABLE IF EXISTS `jiaoshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaogonghao` varchar(200) NOT NULL COMMENT '教工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `suojiaokemu` varchar(200) DEFAULT NULL COMMENT '所教科目',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `dianziyouxiang` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaogonghao` (`jiaogonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743212211 DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoshi`
--

LOCK TABLES `jiaoshi` WRITE;
/*!40000 ALTER TABLE `jiaoshi` DISABLE KEYS */;
INSERT INTO `jiaoshi` VALUES (11,'2021-02-19 13:44:26','教师1','123456','姓名1','男','院系1','班级1','所教科目1','13823888881','773890001@qq.com','http://localhost:8080/ssm/upload/jiaoshi_tupian1.jpg'),(12,'2021-02-19 13:44:26','教师2','123456','姓名2','男','院系2','班级2','所教科目2','13823888882','773890002@qq.com','http://localhost:8080/ssm/upload/jiaoshi_tupian2.jpg'),(13,'2021-02-19 13:44:26','教师3','123456','姓名3','男','院系3','班级3','所教科目3','13823888883','773890003@qq.com','http://localhost:8080/ssm/upload/jiaoshi_tupian3.jpg'),(14,'2021-02-19 13:44:26','教师4','123456','姓名4','男','院系4','班级4','所教科目4','13823888884','773890004@qq.com','http://localhost:8080/ssm/upload/jiaoshi_tupian4.jpg'),(15,'2021-02-19 13:44:26','教师5','123456','姓名5','男','院系5','班级5','所教科目5','13823888885','773890005@qq.com','http://localhost:8080/ssm/upload/jiaoshi_tupian5.jpg'),(16,'2021-02-19 13:44:26','教师6','123456','姓名6','男','院系6','班级6','所教科目6','13823888886','773890006@qq.com','http://localhost:8080/ssm/upload/jiaoshi_tupian6.jpg'),(1613743212210,'2021-02-19 14:00:12','001','001','李老师','女','计算机','计算机一班','计算机','12300000000','123@qq.com','http://localhost:8080/ssm/upload/1613743237081.jpg');
/*!40000 ALTER TABLE `jiaoshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jiaoxuexinxi`
--

DROP TABLE IF EXISTS `jiaoxuexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jiaoxuexinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `jiaogonghao` varchar(200) DEFAULT NULL COMMENT '教工号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `jiaoxueshipin` varchar(200) DEFAULT NULL COMMENT '教学视频',
  `zuoye` varchar(200) DEFAULT NULL COMMENT '作业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743327034 DEFAULT CHARSET=utf8 COMMENT='教学信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jiaoxuexinxi`
--

LOCK TABLES `jiaoxuexinxi` WRITE;
/*!40000 ALTER TABLE `jiaoxuexinxi` DISABLE KEYS */;
INSERT INTO `jiaoxuexinxi` VALUES (41,'2021-02-19 13:44:26','标题1','教工号1','姓名1','院系1','班级1','',''),(42,'2021-02-19 13:44:26','标题2','教工号2','姓名2','院系2','班级2','',''),(43,'2021-02-19 13:44:26','标题3','教工号3','姓名3','院系3','班级3','',''),(44,'2021-02-19 13:44:26','标题4','教工号4','姓名4','院系4','班级4','',''),(45,'2021-02-19 13:44:26','标题5','教工号5','姓名5','院系5','班级5','',''),(46,'2021-02-19 13:44:26','标题6','教工号6','姓名6','院系6','班级6','',''),(1613743327033,'2021-02-19 14:02:06','计算机课作业、教学视频','001','李老师','计算机','计算机一班','http://localhost:8080/ssm/upload/1613743715284.mp4','http://localhost:8080/ssm/upload/1613743721747.docx');
/*!40000 ALTER TABLE `jiaoxuexinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechengxinxi`
--

DROP TABLE IF EXISTS `kechengxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechengxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `kaishishijian` datetime DEFAULT NULL COMMENT '开始时间',
  `jieshushijian` datetime DEFAULT NULL COMMENT '结束时间',
  `shoukejiaoshi` varchar(200) DEFAULT NULL COMMENT '授课教师',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743281986 DEFAULT CHARSET=utf8 COMMENT='课程信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechengxinxi`
--

LOCK TABLES `kechengxinxi` WRITE;
/*!40000 ALTER TABLE `kechengxinxi` DISABLE KEYS */;
INSERT INTO `kechengxinxi` VALUES (31,'2021-02-19 13:44:26','课程名称1','院系1','班级1','2021-02-19 21:44:26','2021-02-19 21:44:26','测试老师'),(32,'2021-02-19 13:44:26','课程名称2','院系2','班级2','2021-02-19 21:44:26','2021-02-19 21:44:26','授课教师2'),(33,'2021-02-19 13:44:26','课程名称3','院系3','班级3','2021-02-19 21:44:26','2021-02-19 21:44:26','授课教师3'),(34,'2021-02-19 13:44:26','课程名称4','院系4','班级4','2021-02-19 21:44:26','2021-02-19 21:44:26','授课教师4'),(35,'2021-02-19 13:44:26','课程名称5','院系5','班级5','2021-02-19 21:44:26','2021-02-19 21:44:26','授课教师5'),(36,'2021-02-19 13:44:26','课程名称6','院系6','班级6','2021-02-19 21:44:26','2021-02-19 21:44:26','授课教师6'),(1613743281985,'2021-02-19 14:01:21','计算机课','计算机','计算机一班','2021-02-19 22:01:09','2021-02-19 22:01:13','李老师');
/*!40000 ALTER TABLE `kechengxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='网站公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (121,'2021-02-19 13:44:26','测试','测试','http://localhost:8080/ssm/upload/1613743786920.jpg','<p>测试</p>'),(122,'2021-02-19 13:44:26','标题2','简介2','http://localhost:8080/ssm/upload/news_picture2.jpg','内容2'),(123,'2021-02-19 13:44:26','标题3','简介3','http://localhost:8080/ssm/upload/news_picture3.jpg','内容3'),(124,'2021-02-19 13:44:26','标题4','简介4','http://localhost:8080/ssm/upload/news_picture4.jpg','内容4'),(125,'2021-02-19 13:44:26','标题5','简介5','http://localhost:8080/ssm/upload/news_picture5.jpg','内容5'),(126,'2021-02-19 13:44:26','标题6','简介6','http://localhost:8080/ssm/upload/news_picture6.jpg','内容6');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shishengjiaoliu`
--

DROP TABLE IF EXISTS `shishengjiaoliu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shishengjiaoliu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `tiwen` longtext COMMENT '提问',
  `shijian` datetime DEFAULT NULL COMMENT '时间',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743648373 DEFAULT CHARSET=utf8 COMMENT='师生交流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shishengjiaoliu`
--

LOCK TABLES `shishengjiaoliu` WRITE;
/*!40000 ALTER TABLE `shishengjiaoliu` DISABLE KEYS */;
INSERT INTO `shishengjiaoliu` VALUES (71,'2021-02-19 13:44:26','学号1','姓名1','院系1','班级1','提问1','2021-02-19 21:44:26','是','测试'),(72,'2021-02-19 13:44:26','学号2','姓名2','院系2','班级2','提问2','2021-02-19 21:44:26','是',''),(73,'2021-02-19 13:44:26','学号3','姓名3','院系3','班级3','提问3','2021-02-19 21:44:26','是',''),(74,'2021-02-19 13:44:26','学号4','姓名4','院系4','班级4','提问4','2021-02-19 21:44:26','是',''),(75,'2021-02-19 13:44:26','学号5','姓名5','院系5','班级5','提问5','2021-02-19 21:44:26','是',''),(76,'2021-02-19 13:44:26','学号6','姓名6','院系6','班级6','提问6','2021-02-19 21:44:26','是',''),(1613743648372,'2021-02-19 14:07:27','01','张三','计算机','计算机一班','测试','2021-02-19 22:07:24','否','');
/*!40000 ALTER TABLE `shishengjiaoliu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,21,'学生1','xuesheng','学生','v69b8lbft65auw0bqg9rjdgp6xzezntt','2021-02-19 13:59:02','2021-02-19 14:59:02'),(2,1613743212210,'001','jiaoshi','教师','howkq5k3klr6jvoaeu0n2l94134h8472','2021-02-19 14:00:24','2021-02-19 15:14:08'),(3,1613743552155,'01','xuesheng','学生','ul25n299ogjnx9iv9k4tgu6ugzuhfjtz','2021-02-19 14:06:06','2021-02-19 15:14:39'),(4,1,'abo','users','管理员','vdjzpe20fhzhwtc63mr726oeh60furqu','2021-02-19 14:07:59','2021-02-19 15:08:00');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2021-02-19 13:44:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xuesheng`
--

DROP TABLE IF EXISTS `xuesheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `dianziyouxiang` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743552156 DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xuesheng`
--

LOCK TABLES `xuesheng` WRITE;
/*!40000 ALTER TABLE `xuesheng` DISABLE KEYS */;
INSERT INTO `xuesheng` VALUES (21,'2021-02-19 13:44:26','学生1','123456','姓名1','男','院系1','班级1','13823888881','773890001@qq.com','http://localhost:8080/ssm/upload/xuesheng_zhaopian1.jpg'),(22,'2021-02-19 13:44:26','学生2','123456','姓名2','男','院系2','班级2','13823888882','773890002@qq.com','http://localhost:8080/ssm/upload/xuesheng_zhaopian2.jpg'),(23,'2021-02-19 13:44:26','学生3','123456','姓名3','男','院系3','班级3','13823888883','773890003@qq.com','http://localhost:8080/ssm/upload/xuesheng_zhaopian3.jpg'),(24,'2021-02-19 13:44:26','学生4','123456','姓名4','男','院系4','班级4','13823888884','773890004@qq.com','http://localhost:8080/ssm/upload/xuesheng_zhaopian4.jpg'),(25,'2021-02-19 13:44:26','学生5','123456','姓名5','男','院系5','班级5','13823888885','773890005@qq.com','http://localhost:8080/ssm/upload/xuesheng_zhaopian5.jpg'),(26,'2021-02-19 13:44:26','学生6','123456','姓名6','男','院系6','班级6','13823888886','773890006@qq.com','http://localhost:8080/ssm/upload/xuesheng_zhaopian6.jpg'),(1613743552155,'2021-02-19 14:05:52','01','01','张三','男','计算机','计算机一班','12222222222','122@qq.com','http://localhost:8080/ssm/upload/1613743578536.jpg');
/*!40000 ALTER TABLE `xuesheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zuoyepingfen`
--

DROP TABLE IF EXISTS `zuoyepingfen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zuoyepingfen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `zuoyechengji` int(11) DEFAULT NULL COMMENT '作业成绩',
  `zuoyezhuangtai` varchar(200) DEFAULT NULL COMMENT '作业状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613744066824 DEFAULT CHARSET=utf8 COMMENT='作业评分';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zuoyepingfen`
--

LOCK TABLES `zuoyepingfen` WRITE;
/*!40000 ALTER TABLE `zuoyepingfen` DISABLE KEYS */;
INSERT INTO `zuoyepingfen` VALUES (61,'2021-02-19 13:44:26','标题1','学号1','姓名1','院系1','班级1',1,'及格'),(62,'2021-02-19 13:44:26','标题2','学号2','姓名2','院系2','班级2',2,'及格'),(63,'2021-02-19 13:44:26','标题3','学号3','姓名3','院系3','班级3',3,'及格'),(64,'2021-02-19 13:44:26','标题4','学号4','姓名4','院系4','班级4',4,'及格'),(65,'2021-02-19 13:44:26','标题5','学号5','姓名5','院系5','班级5',5,'及格'),(66,'2021-02-19 13:44:26','标题6','学号6','姓名6','院系6','班级6',6,'及格'),(1613743361808,'2021-02-19 14:02:41','计算机作业成绩','学生1','姓名1','院系1','班级1',70,'及格'),(1613744066823,'2021-02-19 14:14:26','测试','01','张三','计算机','计算机一班',70,'及格');
/*!40000 ALTER TABLE `zuoyepingfen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zuoyexinxi`
--

DROP TABLE IF EXISTS `zuoyexinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zuoyexinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `yuanxi` varchar(200) DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `zuoye` varchar(200) DEFAULT NULL COMMENT '作业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1613743632032 DEFAULT CHARSET=utf8 COMMENT='作业信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zuoyexinxi`
--

LOCK TABLES `zuoyexinxi` WRITE;
/*!40000 ALTER TABLE `zuoyexinxi` DISABLE KEYS */;
INSERT INTO `zuoyexinxi` VALUES (51,'2021-02-19 13:44:26','标题1','学号1','姓名1','院系1','班级1',''),(52,'2021-02-19 13:44:26','标题2','学号2','姓名2','院系2','班级2',''),(53,'2021-02-19 13:44:26','标题3','学号3','姓名3','院系3','班级3',''),(54,'2021-02-19 13:44:26','标题4','学号4','姓名4','院系4','班级4',''),(55,'2021-02-19 13:44:26','标题5','学号5','姓名5','院系5','班级5',''),(56,'2021-02-19 13:44:26','标题6','学号6','姓名6','院系6','班级6',''),(1613743632031,'2021-02-19 14:07:11','计算机作业','01','张三','计算机','计算机一班','http://localhost:8080/ssm/upload/1613743630817.docx');
/*!40000 ALTER TABLE `zuoyexinxi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-19 23:00:55
