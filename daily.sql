/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : daily

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 23/02/2020 11:12:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `difficulty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '困难',
  `way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解决办法',
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '心得',
  `plan` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划',
  `type` int(255) NULL DEFAULT NULL COMMENT '1日报2周报',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (7, '2020-02-22 16:39:14', '第一组', NULL, '1', '1', '', '', '', 1);
INSERT INTO `message` VALUES (8, '2020-02-22 17:16:44', '第一组', NULL, 'wasdasdad', 'asdasdasd', 'saasfas', 'sadasd', 'sadasd', 1);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permissionName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '删除', '删除');
INSERT INTO `permission` VALUES (3, '3', '3');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `roleDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'CTO', 'CTO');
INSERT INTO `role` VALUES (2, '第一组组长', '第一组组长');
INSERT INTO `role` VALUES (3, '第二组组长', '第二组组长');
INSERT INTO `role` VALUES (4, '第三组组长', '第三组组长');
INSERT INTO `role` VALUES (5, '第四组组长', '第四组组长');
INSERT INTO `role` VALUES (6, '第五组组长', '第五组组长');
INSERT INTO `role` VALUES (7, '学员', '学员');
INSERT INTO `role` VALUES (8, '23', '23');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `permissionId` int(11) NULL DEFAULT NULL COMMENT '资源id',
  `roleId` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (1, 1, 1);
INSERT INTO `role_permission` VALUES (3, 1, 2);
INSERT INTO `role_permission` VALUES (4, 1, 8);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `visitTime` timestamp(0) NULL DEFAULT NULL COMMENT '访问时间',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问ip',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问资源Url',
  `executionTime` int(255) NULL DEFAULT NULL COMMENT '执行时长',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 696 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (477, '2020-02-22 14:48:47', '2', '127.0.0.1', '/message/findByPageAndGroup', 25484, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (478, '2020-02-22 14:52:19', '2', '127.0.0.1', '/message/findByPageAndGroup', 6866, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (479, '2020-02-22 14:57:59', '2', '127.0.0.1', '/user/login', 681, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (480, '2020-02-22 14:58:05', '2', '127.0.0.1', '/message/findByPageAndGroup', 114, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (481, '2020-02-22 14:59:05', '2', '127.0.0.1', '/message/deletById', 20, '类名com.fei.daily.controller.MessageController方法名deletById');
INSERT INTO `syslog` VALUES (482, '2020-02-22 14:59:06', '2', '127.0.0.1', '/message/findByPageAndGroup', 33, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (483, '2020-02-22 15:09:20', '2', '127.0.0.1', '/user/login', 625, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (484, '2020-02-22 15:09:26', '2', '127.0.0.1', '/message/findByPageAndGroup', 116, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (485, '2020-02-22 15:09:34', '2', '127.0.0.1', '/message/findByPageAndGroup', 29, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (486, '2020-02-22 15:10:15', '2', '127.0.0.1', '/message/findByPageAndGroup', 35, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (487, '2020-02-22 15:10:36', '2', '127.0.0.1', '/message/findByPageAndGroup', 34, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (488, '2020-02-22 15:10:45', '2', '127.0.0.1', '/message/findByPageAndGroup', 25, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (489, '2020-02-22 15:12:02', '2', '127.0.0.1', '/message/findByPageAndGroup', 35, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (490, '2020-02-22 15:13:45', '2', '127.0.0.1', '/user/login', 656, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (491, '2020-02-22 15:13:52', '2', '127.0.0.1', '/message/findByPageAndGroup', 105, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (492, '2020-02-22 15:14:13', '2', '127.0.0.1', '/message/findByPageAndGroup', 20, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (493, '2020-02-22 15:14:26', '2', '127.0.0.1', '/message/findByPageAndGroup', 17, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (494, '2020-02-22 15:14:29', '2', '127.0.0.1', '/message/findByPageAndGroup', 20, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (495, '2020-02-22 15:14:34', '2', '127.0.0.1', '/message/findByPageAndGroup', 24, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (496, '2020-02-22 15:14:36', '2', '127.0.0.1', '/message/findByPageAndGroup', 25, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (497, '2020-02-22 15:14:43', '2', '127.0.0.1', '/message/findByPageAndGroup', 114, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (498, '2020-02-22 15:14:45', '2', '127.0.0.1', '/message/findByPageAndGroup', 26, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (499, '2020-02-22 15:19:06', '2', '127.0.0.1', '/user/login', 610, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (500, '2020-02-22 15:20:18', '2', '127.0.0.1', '/user/login', 680, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (501, '2020-02-22 15:20:49', '2', '127.0.0.1', '/message/findByPageAndGroup', 97, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (502, '2020-02-22 15:23:21', '2', '127.0.0.1', '/user/login', 837, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (503, '2020-02-22 15:23:27', '2', '127.0.0.1', '/message/findByPageAndGroup', 75531, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (504, '2020-02-22 15:24:46', '2', '127.0.0.1', '/message/findByPageAndGroup', 116427, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (505, '2020-02-22 15:27:31', '2', '127.0.0.1', '/user/login', 685, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (506, '2020-02-22 15:27:35', '2', '127.0.0.1', '/message/findByPageAndGroup', 12006, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (507, '2020-02-22 15:27:55', '2', '127.0.0.1', '/message/findByPageAndGroup', 5475, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (508, '2020-02-22 15:28:13', '2', '127.0.0.1', '/message/findByPageAndGroup', 5066, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (509, '2020-02-22 15:30:02', '2', '127.0.0.1', '/message/findByPageAndGroup', 31303, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (510, '2020-02-22 15:36:15', '2', '127.0.0.1', '/user/login', 750, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (511, '2020-02-22 15:36:18', '2', '127.0.0.1', '/message/findByPageAndGroup', 6731, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (512, '2020-02-22 15:36:32', '2', '127.0.0.1', '/message/findByPageAndGroup', 71064, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (513, '2020-02-22 15:38:15', '2', '127.0.0.1', '/user/login', 768, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (514, '2020-02-22 15:38:18', '2', '127.0.0.1', '/message/findByPageAndGroup', 9199, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (515, '2020-02-22 15:39:01', '2', '127.0.0.1', '/message/findByPageAndGroup', 18540, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (516, '2020-02-22 15:42:42', '2', '127.0.0.1', '/user/login', 738, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (517, '2020-02-22 15:42:46', '2', '127.0.0.1', '/message/findByPageAndGroup', 15607, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (518, '2020-02-22 15:43:10', '2', '127.0.0.1', '/message/findByPageAndGroup', 16833, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (519, '2020-02-22 15:43:59', '2', '127.0.0.1', '/message/findByPageAndGroup', 191068, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (520, '2020-02-22 15:47:39', '2', '127.0.0.1', '/user/login', 733, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (521, '2020-02-22 15:47:42', '2', '127.0.0.1', '/message/findByPageAndGroup', 5350, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (522, '2020-02-22 15:47:53', '2', '127.0.0.1', '/message/findByPageAndGroup', 19309, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (523, '2020-02-22 15:50:38', '2', '127.0.0.1', '/user/login', 593, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (524, '2020-02-22 15:50:41', '2', '127.0.0.1', '/message/findByPageAndGroup', 90, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (525, '2020-02-22 15:50:58', '2', '127.0.0.1', '/message/findByPageAndGroup', 27, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (526, '2020-02-22 15:51:03', '2', '127.0.0.1', '/message/findByPageAndGroup', 22, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (527, '2020-02-22 15:55:00', '2', '127.0.0.1', '/user/login', 791, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (528, '2020-02-22 15:55:32', '2', '127.0.0.1', '/user/all', 75, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (529, '2020-02-22 15:55:35', '2', '127.0.0.1', '/user/user', 16, '类名com.fei.daily.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (530, '2020-02-22 15:55:54', '2', '127.0.0.1', '/message/findByPageAndGroup', 6615, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (531, '2020-02-22 15:56:09', '2', '127.0.0.1', '/message/findByPageAndGroup', 4256, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (532, '2020-02-22 15:56:24', '2', '127.0.0.1', '/message/findByPageAndGroup', 199, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (533, '2020-02-22 15:56:24', '2', '127.0.0.1', '/message/findByPageAndGroup', 212, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (534, '2020-02-22 15:56:30', '2', '127.0.0.1', '/message/findByPageAndGroup', 2196, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (535, '2020-02-22 15:56:51', '2', '127.0.0.1', '/message/findByPageAndGroup', 7, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (536, '2020-02-22 15:56:51', '2', '127.0.0.1', '/message/findByPageAndGroup', 199, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (537, '2020-02-22 15:56:55', '2', '127.0.0.1', '/message/findByPageAndGroup', 12639, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (538, '2020-02-22 16:23:59', '2', '127.0.0.1', '/user/login', 744, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (539, '2020-02-22 16:24:02', '2', '127.0.0.1', '/message/findByPageAndGroup', 3406, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (540, '2020-02-22 16:28:23', '2', '127.0.0.1', '/user/login', 662, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (541, '2020-02-22 16:28:30', '2', '127.0.0.1', '/message/findByPageAndGroup', 80, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (542, '2020-02-22 16:29:28', '2', '127.0.0.1', '/user/login', 619, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (543, '2020-02-22 16:29:31', '2', '127.0.0.1', '/message/findByPageAndGroup', 72, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (544, '2020-02-22 16:31:12', '2', '127.0.0.1', '/user/login', 599, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (545, '2020-02-22 16:31:14', '2', '127.0.0.1', '/message/findByPageAndGroup', 80, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (547, '2020-02-22 16:34:20', '2', '127.0.0.1', '/user/login', 631, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (548, '2020-02-22 16:34:23', '2', '127.0.0.1', '/message/findByPageAndGroup', 74, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (549, '2020-02-22 16:34:36', '2', '127.0.0.1', '/message/save', 26, '类名com.fei.daily.controller.MessageController方法名save');
INSERT INTO `syslog` VALUES (550, '2020-02-22 16:34:36', '2', '127.0.0.1', '/message/findByPageAndGroup', 14, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (551, '2020-02-22 16:34:41', '2', '127.0.0.1', '/message/deletById', 14, '类名com.fei.daily.controller.MessageController方法名deletById');
INSERT INTO `syslog` VALUES (552, '2020-02-22 16:34:41', '2', '127.0.0.1', '/message/findByPageAndGroup', 7, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (553, '2020-02-22 16:34:48', '2', '127.0.0.1', 'logfindAllByPage', 23, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (554, '2020-02-22 16:38:21', '2', '127.0.0.1', '/user/login', 625, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (555, '2020-02-22 16:38:24', '2', '127.0.0.1', '/message/findByPageAndGroup', 75, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (556, '2020-02-22 16:38:32', '2', '127.0.0.1', '/message/save', 24, '类名com.fei.daily.controller.MessageController方法名save');
INSERT INTO `syslog` VALUES (557, '2020-02-22 16:38:32', '2', '127.0.0.1', '/message/findByPageAndGroup', 14, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (558, '2020-02-22 16:38:37', '2', '127.0.0.1', '/message/deletById', 13, '类名com.fei.daily.controller.MessageController方法名deletById');
INSERT INTO `syslog` VALUES (559, '2020-02-22 16:38:37', '2', '127.0.0.1', '/message/findByPageAndGroup', 8, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (560, '2020-02-22 16:39:06', '邓腾飞', '127.0.0.1', '/user/login', 18, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (561, '2020-02-22 16:39:09', '邓腾飞', '127.0.0.1', '/message/findByPageAndGroup', 7, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (562, '2020-02-22 16:39:14', '邓腾飞', '127.0.0.1', '/message/save', 21, '类名com.fei.daily.controller.MessageController方法名save');
INSERT INTO `syslog` VALUES (563, '2020-02-22 16:39:14', '邓腾飞', '127.0.0.1', '/message/findByPageAndGroup', 17, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (564, '2020-02-22 16:42:49', '2', '127.0.0.1', '/user/login', 699, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (565, '2020-02-22 16:43:16', '2', '127.0.0.1', '/user/login', 15, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (566, '2020-02-22 16:43:27', '2', '127.0.0.1', '/user/login', 22, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (567, '2020-02-22 16:43:37', '邓腾飞', '127.0.0.1', '/user/login', 18, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (568, '2020-02-22 16:43:40', '邓腾飞', '127.0.0.1', '/message/findByPageAndGroup', 76, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (569, '2020-02-22 16:44:48', '2', '127.0.0.1', '/user/login', 31, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (570, '2020-02-22 16:44:50', '2', '127.0.0.1', '/user/all', 23, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (571, '2020-02-22 16:45:03', '2', '127.0.0.1', '/user/user', 12, '类名com.fei.daily.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (572, '2020-02-22 16:45:15', '2', '127.0.0.1', '/user/all', 7, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (573, '2020-02-22 16:45:20', '2', '127.0.0.1', '/useruserAddRole', 11, '类名com.fei.daily.controller.UserController方法名findUserByidxAndRole');
INSERT INTO `syslog` VALUES (574, '2020-02-22 16:45:46', '2', '127.0.0.1', '/user/addRoleToUser', 22, '类名com.fei.daily.controller.UserController方法名addRoleToUser');
INSERT INTO `syslog` VALUES (575, '2020-02-22 16:45:46', '2', '127.0.0.1', '/user/all', 6, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (576, '2020-02-22 16:45:50', '2', '127.0.0.1', '/user/user', 8, '类名com.fei.daily.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (577, '2020-02-22 17:04:04', '2', '127.0.0.1', '/user/login', 596, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (578, '2020-02-22 17:04:07', '2', '127.0.0.1', '/user/all', 72, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (579, '2020-02-22 17:04:28', '2', '127.0.0.1', 'logfindAllByPage', 29, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (580, '2020-02-22 17:04:42', '2', '127.0.0.1', '/user/all', 12, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (581, '2020-02-22 17:04:46', '2', '127.0.0.1', '/user/user', 18, '类名com.fei.daily.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (582, '2020-02-22 17:04:51', '2', '127.0.0.1', '/user/all', 14, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (583, '2020-02-22 17:04:52', '2', '127.0.0.1', '/user/user', 6, '类名com.fei.daily.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (584, '2020-02-22 17:04:59', '2', '127.0.0.1', '/user/all', 12, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (585, '2020-02-22 17:05:14', '2', '127.0.0.1', '/user/all', 10, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (586, '2020-02-22 17:07:48', '2', '127.0.0.1', '/user/login', 570, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (587, '2020-02-22 17:07:50', '2', '127.0.0.1', '/user/all', 63, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (588, '2020-02-22 17:08:05', '2', '127.0.0.1', '/role/all', 21, '类名com.fei.daily.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (589, '2020-02-22 17:08:11', '2', '127.0.0.1', '/role/save', 18, '类名com.fei.daily.controller.RoleController方法名save');
INSERT INTO `syslog` VALUES (590, '2020-02-22 17:08:11', '2', '127.0.0.1', '/role/all', 7, '类名com.fei.daily.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (591, '2020-02-22 17:08:14', '2', '127.0.0.1', '/permission/all', 19, '类名com.fei.daily.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (592, '2020-02-22 17:08:20', '2', '127.0.0.1', '/message/findByPageAndGroup', 42, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (593, '2020-02-22 17:08:23', '2', '127.0.0.1', 'logfindAllByPage', 21, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (594, '2020-02-22 17:09:12', '2', '127.0.0.1', '/user/all', 19, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (595, '2020-02-22 17:09:18', '2', '127.0.0.1', '/user/all', 23, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (596, '2020-02-22 17:09:21', '2', '127.0.0.1', '/user/all', 10, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (597, '2020-02-22 17:09:57', '2', '127.0.0.1', '/user/save', 18, '类名com.fei.daily.controller.UserController方法名save');
INSERT INTO `syslog` VALUES (598, '2020-02-22 17:09:57', '2', '127.0.0.1', '/user/all', 17, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (599, '2020-02-22 17:10:07', '2', '127.0.0.1', 'logfindAllByPage', 12, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (600, '2020-02-22 17:10:14', '2', '127.0.0.1', 'logfindAllByPage', 25, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (601, '2020-02-22 17:10:44', '1', '127.0.0.1', '/user/login', 13, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (602, '2020-02-22 17:10:52', '1', '127.0.0.1', '/message/findByPageAndGroup', 21, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (603, '2020-02-22 17:11:15', '1', '127.0.0.1', '/message/findByPageAndGroup', 22, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (604, '2020-02-22 17:11:23', '1', '127.0.0.1', '/message/findByPageAndGroup', 14, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (605, '2020-02-22 17:11:32', '1', '127.0.0.1', '/message/findByPageAndGroup', 142, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (606, '2020-02-22 17:11:40', '1', '127.0.0.1', '/message/findByPageAndGroup', 10, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (607, '2020-02-22 17:13:50', '1', '127.0.0.1', '/user/login', 1091, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (608, '2020-02-22 17:13:55', '1', '127.0.0.1', '/message/findByPageAndGroup', 6317, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (609, '2020-02-22 17:14:06', '1', '127.0.0.1', '/message/findByPageAndGroup', 53998, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (610, '2020-02-22 17:15:37', '1', '127.0.0.1', '/user/login', 825, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (611, '2020-02-22 17:15:40', '1', '127.0.0.1', '/message/findByPageAndGroup', 112, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (612, '2020-02-22 17:15:46', '1', '127.0.0.1', '/message/findByPageAndGroup', 168, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (613, '2020-02-22 17:16:44', '1', '127.0.0.1', '/message/save', 28, '类名com.fei.daily.controller.MessageController方法名save');
INSERT INTO `syslog` VALUES (614, '2020-02-22 17:16:44', '1', '127.0.0.1', '/message/findByPageAndGroup', 24, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (615, '2020-02-22 17:18:00', '1', '127.0.0.1', '/message/findByPageAndGroup', 15, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (616, '2020-02-22 17:18:05', '1', '127.0.0.1', '/message/findByPageAndGroup', 30, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (617, '2020-02-22 17:18:07', '1', '127.0.0.1', '/message/findByPageAndGroup', 22, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (618, '2020-02-22 17:18:28', '1', '127.0.0.1', '/message/findByPageAndGroup', 11, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (619, '2020-02-22 17:18:35', '1', '127.0.0.1', '/message/findByPageAndGroup', 33, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (620, '2020-02-22 17:18:41', '1', '127.0.0.1', '/message/findByPageAndGroup', 30, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (621, '2020-02-22 17:18:52', '1', '127.0.0.1', '/message/findByPageAndGroup', 45, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (622, '2020-02-22 17:19:47', '邓腾飞', '127.0.0.1', '/user/login', 43, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (623, '2020-02-22 17:19:51', '邓腾飞', '127.0.0.1', '/user/all', 23, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (624, '2020-02-22 17:19:59', '邓腾飞', '127.0.0.1', '/user/all', 15, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (625, '2020-02-22 17:20:00', '邓腾飞', '127.0.0.1', '/user/all', 14, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (626, '2020-02-22 17:20:01', '邓腾飞', '127.0.0.1', '/user/all', 7, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (627, '2020-02-22 17:20:02', '邓腾飞', '127.0.0.1', '/user/all', 13, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (628, '2020-02-22 17:20:24', '邓腾飞', '127.0.0.1', '/user/user', 11, '类名com.fei.daily.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (629, '2020-02-22 17:20:43', '邓腾飞', '127.0.0.1', '/user/user', 15, '类名com.fei.daily.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (630, '2020-02-22 17:20:51', '邓腾飞', '127.0.0.1', '/user/all', 26, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (631, '2020-02-22 17:20:56', '邓腾飞', '127.0.0.1', '/useruserAddRole', 16, '类名com.fei.daily.controller.UserController方法名findUserByidxAndRole');
INSERT INTO `syslog` VALUES (632, '2020-02-22 17:21:09', '邓腾飞', '127.0.0.1', '/user/addRoleToUser', 24, '类名com.fei.daily.controller.UserController方法名addRoleToUser');
INSERT INTO `syslog` VALUES (633, '2020-02-22 17:21:09', '邓腾飞', '127.0.0.1', '/user/all', 7, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (634, '2020-02-22 17:21:11', '邓腾飞', '127.0.0.1', '/user/user', 7, '类名com.fei.daily.controller.UserController方法名findById');
INSERT INTO `syslog` VALUES (635, '2020-02-22 17:21:17', '邓腾飞', '127.0.0.1', '/role/all', 29, '类名com.fei.daily.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (636, '2020-02-22 17:21:35', '邓腾飞', '127.0.0.1', '/rolefindRole', 16, '类名com.fei.daily.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (637, '2020-02-22 17:21:41', '邓腾飞', '127.0.0.1', '/rolefindRole', 10, '类名com.fei.daily.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (638, '2020-02-22 17:21:54', '邓腾飞', '127.0.0.1', '/rolefindRole', 13, '类名com.fei.daily.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (639, '2020-02-22 17:22:00', '邓腾飞', '127.0.0.1', '/rolefindRole', 12, '类名com.fei.daily.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (640, '2020-02-22 17:22:11', '邓腾飞', '127.0.0.1', '/rolefindRole', 16, '类名com.fei.daily.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (641, '2020-02-22 17:22:15', '邓腾飞', '127.0.0.1', '/role/roleAddPermission', 18, '类名com.fei.daily.controller.RoleController方法名findRoleByIdAndAllPermission');
INSERT INTO `syslog` VALUES (642, '2020-02-22 17:22:22', '邓腾飞', '127.0.0.1', '/role/addPermissionToRole', 24, '类名com.fei.daily.controller.RoleController方法名addPermissionToRole');
INSERT INTO `syslog` VALUES (643, '2020-02-22 17:22:22', '邓腾飞', '127.0.0.1', '/role/all', 11, '类名com.fei.daily.controller.RoleController方法名findAll');
INSERT INTO `syslog` VALUES (644, '2020-02-22 17:22:25', '邓腾飞', '127.0.0.1', '/rolefindRole', 21, '类名com.fei.daily.controller.RoleController方法名findById');
INSERT INTO `syslog` VALUES (645, '2020-02-22 17:22:33', '邓腾飞', '127.0.0.1', '/permission/all', 24, '类名com.fei.daily.controller.PermissionController方法名findAll');
INSERT INTO `syslog` VALUES (646, '2020-02-22 17:22:54', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 23, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (647, '2020-02-22 17:23:26', '邓腾飞', '127.0.0.1', '/message/findByPageAndGroup', 24, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (648, '2020-02-22 17:23:30', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 19, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (649, '2020-02-22 17:23:37', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 21, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (650, '2020-02-22 17:23:38', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 22, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (651, '2020-02-22 17:23:40', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 10, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (652, '2020-02-22 17:23:41', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 14, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (653, '2020-02-22 17:23:42', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 11, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (654, '2020-02-22 17:23:44', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 13, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (655, '2020-02-22 17:23:48', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 24, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (656, '2020-02-22 17:23:56', '邓腾飞', '127.0.0.1', 'logdeletById', 14, '类名com.fei.daily.controller.LogController方法名deletById');
INSERT INTO `syslog` VALUES (657, '2020-02-22 17:23:56', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 15, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (658, '2020-02-22 17:24:00', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 17, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (659, '2020-02-22 17:24:07', '邓腾飞', '127.0.0.1', 'logdeletById', 11, '类名com.fei.daily.controller.LogController方法名deletById');
INSERT INTO `syslog` VALUES (660, '2020-02-22 17:24:07', '邓腾飞', '127.0.0.1', 'logfindAllByPage', 23, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (661, '2020-02-22 17:24:25', '邓腾飞', '127.0.0.1', '/message/findByPageAndGroup', 19, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (662, '2020-02-22 17:24:30', '邓腾飞', '127.0.0.1', '/message/findByPageAndGroup', 19, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (663, '2020-02-22 17:24:52', '邓腾飞', '127.0.0.1', '/message/findByPageAndGroup', 14, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (664, '2020-02-22 17:27:01', '邓腾飞', '127.0.0.1', '/message/findByPageAndGroup', 13, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (665, '2020-02-22 17:32:23', '2', '127.0.0.1', '/user/login', 709, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (666, '2020-02-22 17:32:26', '2', '127.0.0.1', '/message/findByPageAndGroup', 3846, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (667, '2020-02-22 17:32:35', '2', '127.0.0.1', '/message/findByPageAndGroup', 137685, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (668, '2020-02-22 17:35:40', '2', '127.0.0.1', '/message/findByPageAndGroup', 2972, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (669, '2020-02-22 17:35:48', '2', '127.0.0.1', '/message/findByPageAndGroup', 152067, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (670, '2020-02-22 17:38:52', '2', '127.0.0.1', '/user/login', 620, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (671, '2020-02-22 17:38:58', '2', '127.0.0.1', '/message/findByPageAndGroup', 80, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (672, '2020-02-22 17:39:02', '2', '127.0.0.1', '/message/findByPageAndGroup', 124, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (673, '2020-02-22 17:40:05', '2', '127.0.0.1', '/user/login', 736, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (674, '2020-02-22 17:40:13', '2', '127.0.0.1', '/message/findByPageAndGroup', 2861, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (675, '2020-02-22 17:40:19', '2', '127.0.0.1', '/message/findByPageAndGroup', 2827, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (676, '2020-02-22 17:40:25', '2', '127.0.0.1', '/message/findByPageAndGroup', 107594, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (677, '2020-02-22 17:42:35', '2', '127.0.0.1', '/user/login', 666, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (678, '2020-02-22 17:42:38', '2', '127.0.0.1', '/message/findByPageAndGroup', 2137, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (679, '2020-02-22 17:42:44', '2', '127.0.0.1', '/message/findByPageAndGroup', 7856, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (680, '2020-02-22 17:44:43', '2', '127.0.0.1', '/user/login', 631, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (681, '2020-02-22 17:44:46', '2', '127.0.0.1', '/message/findByPageAndGroup', 77, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (682, '2020-02-22 17:44:52', '2', '127.0.0.1', '/message/findByPageAndGroup', 27, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (683, '2020-02-22 17:44:54', '2', '127.0.0.1', '/message/findByPageAndGroup', 20, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (684, '2020-02-22 17:44:57', '2', '127.0.0.1', '/message/findByPageAndGroup', 14, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (685, '2020-02-22 22:17:00', '2', '127.0.0.1', '/user/login', 825, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (686, '2020-02-22 22:17:04', '2', '127.0.0.1', '/user/all', 80, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (687, '2020-02-22 22:17:09', '2', '127.0.0.1', 'logfindAllByPage', 37, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (688, '2020-02-22 22:17:12', '2', '127.0.0.1', '/message/findByPageAndGroup', 45, '类名com.fei.daily.controller.MessageController方法名findAllByPageAndGroup');
INSERT INTO `syslog` VALUES (689, '2020-02-22 22:32:07', '2', '127.0.0.1', 'logfindAllByPage', 36, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (690, '2020-02-22 22:33:02', '2', '127.0.0.1', '/user/login', 31, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (691, '2020-02-22 22:34:36', '2', '127.0.0.1', 'logfindAllByPage', 19, '类名com.fei.daily.controller.LogController方法名findAllByPage');
INSERT INTO `syslog` VALUES (692, '2020-02-22 22:35:57', '2', '127.0.0.1', '/user/all', 18, '类名com.fei.daily.controller.UserController方法名findAll');
INSERT INTO `syslog` VALUES (693, '2020-02-22 22:49:44', '2', '127.0.0.1', '/user/login', 31, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (694, '2020-02-23 11:02:48', '2', '127.0.0.1', '/user/login', 40, '类名com.fei.daily.controller.UserController方法名login');
INSERT INTO `syslog` VALUES (695, '2020-02-23 11:02:52', '2', '127.0.0.1', 'logfindAllByPage', 88, '类名com.fei.daily.controller.LogController方法名findAllByPage');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册手机号',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(255) NULL DEFAULT NULL COMMENT '0未开启1开启',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '组id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (3, '2', 'f583440f619fb1211e31d9fb53383274', NULL, '2020-02-18 16:47:18', 1, 0);
INSERT INTO `user` VALUES (7, '邓腾飞', 'f60ac7dc5e3345665b344039d8ea9226', '1', '2020-02-21 23:45:28', 1, 1);
INSERT INTO `user` VALUES (8, '1', 'a38b872c85e9096dd2d97b5dbe482861', '1', '2020-02-22 17:09:57', 1, 4);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NULL DEFAULT NULL COMMENT '用户Id',
  `roleId` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 3, 1);
INSERT INTO `user_role` VALUES (3, 7, 1);
INSERT INTO `user_role` VALUES (4, 8, 1);

SET FOREIGN_KEY_CHECKS = 1;
