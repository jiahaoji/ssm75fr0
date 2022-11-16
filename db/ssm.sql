/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028 (8.0.28)
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 80028 (8.0.28)
 File Encoding         : 65001

 Date: 14/11/2022 21:25:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (2, 'picture2', '');
INSERT INTO `config` VALUES (3, 'picture3', '');
INSERT INTO `config` VALUES (6, 'homepage', NULL);

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `time` int NOT NULL COMMENT '考试时长(分钟)',
  `status` int NOT NULL DEFAULT 0 COMMENT '试卷状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613743396556 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试卷表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES (1613743396555, '2021-02-19 22:03:16', '计算机考试', 60, 1);

-- ----------------------------
-- Table structure for examquestion
-- ----------------------------
DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE `examquestion`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题名称',
  `options` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项，json字符串',
  `score` bigint NULL DEFAULT 0 COMMENT '分值',
  `answer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案解析',
  `type` bigint NULL DEFAULT 0 COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint NULL DEFAULT 100 COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613743507512 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examquestion
-- ----------------------------
INSERT INTO `examquestion` VALUES (1613743433141, '2021-02-19 22:03:52', 1613743396555, '计算机考试', '1+1=', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]', 25, 'B', '测试', 0, 1);
INSERT INTO `examquestion` VALUES (1613743467677, '2021-02-19 22:04:27', 1613743396555, '计算机考试', '1+1=', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]', 25, 'B,C', '测试', 1, 2);
INSERT INTO `examquestion` VALUES (1613743489411, '2021-02-19 22:04:48', 1613743396555, '计算机考试', '1+1=', '[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]', 25, 'A', '测试', 2, 3);
INSERT INTO `examquestion` VALUES (1613743507511, '2021-02-19 22:05:06', 1613743396555, '计算机考试', '1+1=', '[]', 25, '2', '测试', 3, 4);

-- ----------------------------
-- Table structure for examrecord
-- ----------------------------
DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE `examrecord`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `paperid` bigint NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名称',
  `questionid` bigint NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试题名称',
  `options` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '选项，json字符串',
  `score` bigint NULL DEFAULT 0 COMMENT '分值',
  `answer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '答案解析',
  `myscore` bigint NOT NULL DEFAULT 0 COMMENT '试题得分',
  `myanswer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613743860823 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '考试记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examrecord
-- ----------------------------
INSERT INTO `examrecord` VALUES (1613743852661, '2021-02-19 22:10:51', 1613743552155, NULL, 1613743396555, '计算机考试', 1613743433141, '1+1=', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]', 25, 'B', '测试', 25, 'B');
INSERT INTO `examrecord` VALUES (1613743855403, '2021-02-19 22:10:54', 1613743552155, NULL, 1613743396555, '计算机考试', 1613743467677, '1+1=', '[{\"text\":\"A.1\",\"code\":\"A\"},{\"text\":\"B.2\",\"code\":\"B\"},{\"text\":\"C.3\",\"code\":\"C\"}]', 25, 'B,C', '测试', 0, 'B');
INSERT INTO `examrecord` VALUES (1613743857746, '2021-02-19 22:10:57', 1613743552155, NULL, 1613743396555, '计算机考试', 1613743489411, '1+1=2', '[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]', 25, 'A', '测试', 25, 'A');
INSERT INTO `examrecord` VALUES (1613743860822, '2021-02-19 22:11:00', 1613743552155, NULL, 1613743396555, '计算机考试', 1613743507511, '1+1=', '[]', 25, '2', '测试', 25, '2');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子内容',
  `parentid` bigint NULL DEFAULT NULL COMMENT '父节点id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613743910509 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学习论坛' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (81, '2021-02-19 21:44:26', '帖子标题1', '帖子内容1', 1, 1, '1001', '开放');

-- ----------------------------
-- Table structure for jiaoshi
-- ----------------------------
DROP TABLE IF EXISTS `jiaoshi`;
CREATE TABLE `jiaoshi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaogonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教工号',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `yuanxi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `suojiaokemu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所教科目',
  `shouji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `dianziyouxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `jiaogonghao`(`jiaogonghao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613743212211 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教师' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiaoshi
-- ----------------------------
INSERT INTO `jiaoshi` VALUES (11, '2021-02-19 21:44:26', '101', '123456', '张老师', '男', '计算机学院', '1', '算法设计', '13811111111', '773890001@qq.com', '');
INSERT INTO `jiaoshi` VALUES (12, '2021-02-19 21:44:26', '102', '123456', '李老师', '男', '计算机学院', '2', '人工智能', '13811111112', '773890002@qq.com', '');
INSERT INTO `jiaoshi` VALUES (13, '2021-02-19 21:44:26', '103', '123456', '王老师', '男', '计算机学院', '3', '机器学习', '13811111113', '773890003@qq.com', '');
INSERT INTO `jiaoshi` VALUES (14, '2021-02-19 21:44:26', '104', '123456', '刘老师', '男', '数学学院', '1', '工程数学', '13811111114', '773890004@qq.com', '');
INSERT INTO `jiaoshi` VALUES (15, '2021-02-19 21:44:26', '105', '123456', '赵老师', '男', '马克思学院', '1', '政治', '13811111115', '773890005@qq.com', '');
INSERT INTO `jiaoshi` VALUES (16, '2021-02-19 21:44:26', '106', '123456', '郑老师', '男', '物理学院', '1', '工程伦理', '13811111116', '773890006@qq.com', '');

-- ----------------------------
-- Table structure for jiaoxuexinxi
-- ----------------------------
DROP TABLE IF EXISTS `jiaoxuexinxi`;
CREATE TABLE `jiaoxuexinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `jiaogonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教工号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `yuanxi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `jiaoxueshipin` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教学视频',
  `zuoye` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1668409600707 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教学信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jiaoxuexinxi
-- ----------------------------
INSERT INTO `jiaoxuexinxi` VALUES (41, '2021-02-19 21:44:26', '算法设计', '101', '张老师', '计算机学院', '1', '', '');
INSERT INTO `jiaoxuexinxi` VALUES (42, '2021-02-19 21:44:26', '机器学习', '102', '王老师', '计算机学院', '2', '', '');
INSERT INTO `jiaoxuexinxi` VALUES (43, '2021-02-19 21:44:26', '人工智能', '103', '李老师', '计算机学院', '3', '', '');
INSERT INTO `jiaoxuexinxi` VALUES (44, '2021-02-19 21:44:26', '工程数学', '104', '刘老师', '数学学院', '1', '', '');
INSERT INTO `jiaoxuexinxi` VALUES (45, '2021-02-19 21:44:26', '政治', '105', '赵老师', '马克思学院', '1', '', '');
INSERT INTO `jiaoxuexinxi` VALUES (46, '2021-02-19 21:44:26', '工程伦理', '106', '郑老师', '物理学院', '1', '', '');

-- ----------------------------
-- Table structure for kechengxinxi
-- ----------------------------
DROP TABLE IF EXISTS `kechengxinxi`;
CREATE TABLE `kechengxinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `yuanxi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `kaishishijian` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `jieshushijian` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `shoukejiaoshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授课教师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1668416276033 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kechengxinxi
-- ----------------------------
INSERT INTO `kechengxinxi` VALUES (31, '2021-02-19 21:44:26', '算法设计', '计算机学院', '1', '2021-02-19 21:44:26', '2021-02-19 21:44:26', '张老师');
INSERT INTO `kechengxinxi` VALUES (32, '2021-02-19 21:44:26', '人工智能', '计算机学院', '2', '2021-02-19 21:44:26', '2021-02-19 21:44:26', '李老师');
INSERT INTO `kechengxinxi` VALUES (33, '2021-02-19 21:44:26', '机器学习', '计算机学院', '3', '2021-02-19 21:44:26', '2021-02-19 21:44:26', '王老师');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (122, '2021-02-19 21:44:26', '标题1', '简介1', 'http://localhost:8080/ssm/upload/news_picture2.jpg', '<p>内容1</p>');
INSERT INTO `news` VALUES (125, '2021-02-19 21:44:26', '标题2', '简介2', 'http://localhost:8080/ssm/upload/news_picture5.jpg', '<p>内容2</p>');
INSERT INTO `news` VALUES (126, '2021-02-19 21:44:26', '标题3', '简介3', 'http://localhost:8080/ssm/upload/news_picture6.jpg', '<p>内容3</p>');

-- ----------------------------
-- Table structure for shishengjiaoliu
-- ----------------------------
DROP TABLE IF EXISTS `shishengjiaoliu`;
CREATE TABLE `shishengjiaoliu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `yuanxi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `tiwen` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提问',
  `shijian` datetime NULL DEFAULT NULL COMMENT '时间',
  `sfsh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613743648373 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '师生交流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shishengjiaoliu
-- ----------------------------
INSERT INTO `shishengjiaoliu` VALUES (71, '2021-02-19 21:44:26', '1001', '张同学', '计算机学硕', '1', '提问1', '2021-02-19 21:44:26', '是', '测试');
INSERT INTO `shishengjiaoliu` VALUES (72, '2021-02-19 21:44:26', '1002', '王同学', '计算机专硕', '2', '提问2', '2021-02-19 21:44:26', '是', '');
INSERT INTO `shishengjiaoliu` VALUES (73, '2021-02-19 21:44:26', '1003', '李同学', '王安', '3', '提问3', '2021-02-19 21:44:26', '是', '');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 21, '学生1', 'xuesheng', '学生', 'onswm5xc3c3fx4tn6tcig42zwe3bricl', '2021-02-19 21:59:02', '2022-11-14 21:28:12');
INSERT INTO `token` VALUES (2, 1613743212210, '001', 'jiaoshi', '教师', 'howkq5k3klr6jvoaeu0n2l94134h8472', '2021-02-19 22:00:24', '2021-02-19 23:14:08');
INSERT INTO `token` VALUES (3, 1613743552155, '01', 'xuesheng', '学生', 'ul25n299ogjnx9iv9k4tgu6ugzuhfjtz', '2021-02-19 22:06:06', '2021-02-19 23:14:39');
INSERT INTO `token` VALUES (4, 1, 'abo', 'users', '管理员', '7pfcy2kylzv90ao5saef8sg6xj31fpz0', '2021-02-19 22:07:59', '2022-11-14 22:09:13');
INSERT INTO `token` VALUES (5, 11, '教师1', 'jiaoshi', '教师', 'mf1rwq8m0dj85tnm43p77jd5esea8xef', '2022-11-14 14:52:23', '2022-11-14 22:08:19');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', '123', '管理员', '2021-02-19 21:44:26');

-- ----------------------------
-- Table structure for xuesheng
-- ----------------------------
DROP TABLE IF EXISTS `xuesheng`;
CREATE TABLE `xuesheng`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `yuanxi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `shouji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `dianziyouxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `zhaopian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xuehao`(`xuehao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613743552156 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xuesheng
-- ----------------------------
INSERT INTO `xuesheng` VALUES (21, '2021-02-19 21:44:26', '1001', '123456', '张同学', '男', '计算机学硕', '1', '13711111111', '773890001@qq.com', '');
INSERT INTO `xuesheng` VALUES (22, '2021-02-19 21:44:26', '1002', '123456', '李同学', '男', '计算机专硕', '2', '13711111112', '773890002@qq.com', '');
INSERT INTO `xuesheng` VALUES (23, '2021-02-19 21:44:26', '1003', '123456', '王同学', '男', '网安', '3', '13711111113', '773890003@qq.com', '');

-- ----------------------------
-- Table structure for zuoyepingfen
-- ----------------------------
DROP TABLE IF EXISTS `zuoyepingfen`;
CREATE TABLE `zuoyepingfen`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `xuehao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `yuanxi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `zuoyechengji` int NULL DEFAULT NULL COMMENT '作业成绩',
  `zuoyezhuangtai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613744066824 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业评分' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zuoyepingfen
-- ----------------------------
INSERT INTO `zuoyepingfen` VALUES (61, '2021-02-19 21:44:26', '算法设计', '101', '张同学', '计算机学硕', '1', 100, '及格');
INSERT INTO `zuoyepingfen` VALUES (62, '2021-02-19 21:44:26', '人工智能', '102', '李同学', '计算机专硕', '2', 100, '及格');
INSERT INTO `zuoyepingfen` VALUES (63, '2021-02-19 21:44:26', '机器学习', '103', '王同学', '王安', '3', 100, '及格');

-- ----------------------------
-- Table structure for zuoyexinxi
-- ----------------------------
DROP TABLE IF EXISTS `zuoyexinxi`;
CREATE TABLE `zuoyexinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `xuehao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `yuanxi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '院系',
  `banji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级',
  `zuoye` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1613743632032 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zuoyexinxi
-- ----------------------------
INSERT INTO `zuoyexinxi` VALUES (51, '2021-02-19 21:44:26', '标题1', '学号1', '姓名1', '院系1', '班级1', '');
INSERT INTO `zuoyexinxi` VALUES (52, '2021-02-19 21:44:26', '标题2', '学号2', '姓名2', '院系2', '班级2', '');
INSERT INTO `zuoyexinxi` VALUES (53, '2021-02-19 21:44:26', '标题3', '学号3', '姓名3', '院系3', '班级3', '');

SET FOREIGN_KEY_CHECKS = 1;
