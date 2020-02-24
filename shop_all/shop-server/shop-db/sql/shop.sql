/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 14/01/2020 10:43:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for shop_ad
-- ----------------------------
DROP TABLE IF EXISTS `shop_ad`;
CREATE TABLE `shop_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告标题',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所广告的商品页面或者活动页面链接地址',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告宣传图片',
  `position` tinyint(3) DEFAULT '1' COMMENT '广告位置：1则是首页',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '活动内容',
  `start_time` datetime DEFAULT NULL COMMENT '广告开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '广告结束时间',
  `enabled` tinyint(1) DEFAULT '0' COMMENT '是否启动',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='广告表';

-- ----------------------------
-- Records of shop_ad
-- ----------------------------
BEGIN;
INSERT INTO `shop_ad` VALUES (5, '首页轮播图1', '', 'http://localhost:8080/client/storage/fetch/u4kbfavifvb7cyfiysut.jpeg', 1, '首页轮播图1', NULL, NULL, 1, '2019-10-31 11:56:14', '2019-10-31 11:56:14', 0);
INSERT INTO `shop_ad` VALUES (6, '首页轮播图2', '', 'http://localhost:8080/client/storage/fetch/1t3syk0gwhx9ziq0g8t4.jpeg', 1, '首页轮播图2', NULL, NULL, 1, '2019-10-31 11:56:29', '2019-10-31 11:56:29', 0);
INSERT INTO `shop_ad` VALUES (7, '首页轮播图3', '', 'http://localhost:8080/client/storage/fetch/gwkdbdt4f6cbrtusxi2p.jpeg', 1, '首页轮播图3', NULL, NULL, 1, '2019-10-31 11:56:42', '2019-10-31 11:56:42', 0);
INSERT INTO `shop_ad` VALUES (8, '首页轮播图4', '', 'http://localhost:8080/client/storage/fetch/jter8w35xag30656zki9.jpeg', 1, '首页轮播图4', NULL, NULL, 1, '2019-10-31 11:56:57', '2019-10-31 11:56:57', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_address
-- ----------------------------
DROP TABLE IF EXISTS `shop_address`;
CREATE TABLE `shop_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人名称',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `province` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政区域表的省ID',
  `city` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政区域表的市ID',
  `county` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政区域表的区县ID',
  `address_detail` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细收货地址',
  `area_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地区编码',
  `postal_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮政编码',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认地址',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='收货地址表';

-- ----------------------------
-- Records of shop_address
-- ----------------------------
BEGIN;
INSERT INTO `shop_address` VALUES (2, 'xiaowang', 3, '天津市', '天津城区', '东丽区', 'xxxxxx', '120110', NULL, '18871002288', 1, '2019-09-25 18:32:49', '2019-12-16 20:50:34', 0);
INSERT INTO `shop_address` VALUES (3, 'user123', 1, '天津市', '市辖区', '河东区', 'bbbb', '120102', '', '18875889988', 1, '2019-09-25 18:55:49', '2019-09-25 18:55:49', 0);
INSERT INTO `shop_address` VALUES (4, 'Kevin', 3, '江苏省', '南京市', '玄武区', 'ren ming road 403', '320102', NULL, '17732884455', 0, '2019-10-01 20:20:28', '2019-12-16 20:50:34', 0);
INSERT INTO `shop_address` VALUES (5, '玄微子', 4, '天津市', '市辖区', '河东区', '809号', '120102', NULL, '18872990033', 1, '2019-10-12 19:34:39', '2019-10-12 19:34:39', 0);
INSERT INTO `shop_address` VALUES (6, 'kkkk', 5, '北京市', '北京城区', '朝阳区', '909', '110105', NULL, '18871009922', 1, '2019-12-13 17:42:36', '2019-12-13 17:54:26', 0);
INSERT INTO `shop_address` VALUES (7, 'xuan', 6, '江苏省', '南京市', '玄武区', '555', '320102', NULL, '15555555555', 1, '2019-12-13 17:57:14', '2019-12-13 17:57:14', 0);
INSERT INTO `shop_address` VALUES (8, 'Jennifer', 3, '北京市', '北京城区', '东城区', '888', '110101', NULL, '18873009900', 0, '2019-12-16 15:44:45', '2019-12-16 20:50:34', 0);
INSERT INTO `shop_address` VALUES (9, 'tom', 8, '北京市', '北京城区', '东城区', '668', '110101', NULL, '19999999999', 1, '2019-12-16 16:16:24', '2019-12-16 16:16:24', 1);
COMMIT;

-- ----------------------------
-- Table structure for shop_admin
-- ----------------------------
DROP TABLE IF EXISTS `shop_admin`;
CREATE TABLE `shop_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员密码',
  `last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最近一次登录IP地址',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '''' COMMENT '头像图片',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  `role_ids` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '[]' COMMENT '角色列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='管理员表';

-- ----------------------------
-- Records of shop_admin
-- ----------------------------
BEGIN;
INSERT INTO `shop_admin` VALUES (1, 'admin001', '$2a$10$CDL7W.P1dVWstihqGDwRMuEE7tpNId7zMz15gTgD4qKRbk6RJuQ/u', '0:0:0:0:0:0:0:1', '2020-01-14 10:01:14', 'http://localhost:8080/client/storage/fetch/hgko4qlwv9oz9qk1jprg.jpeg', '2018-02-01 00:00:00', '2020-01-14 10:01:14', 0, '[1]');
INSERT INTO `shop_admin` VALUES (4, 'saler001', '$2a$10$wDZLOLLnzZ1EFZ3ldZ1XFOUWDEX6TnQCUFdJz4g.PoMaLTzS8TjWq', '0:0:0:0:0:0:0:1', '2019-12-13 14:29:31', 'http://localhost:8080/client/storage/fetch/ps08nyvet8l2f49x7kwp.jpeg', '2019-01-07 15:16:59', '2019-12-13 14:31:21', 0, '[3]');
INSERT INTO `shop_admin` VALUES (5, 'mall123', '$2a$10$aCtsc4rG6KmxQ59.IkYse.oRyKuwQoU2CPCmxSdB.d5nXq6aw/z4O', '', NULL, 'http://localhost:8080/client/storage/fetch/d6c3d1zem2hf7gfnist7.jpeg', '2019-01-07 15:17:25', '2019-11-01 11:22:08', 1, '[2]');
COMMIT;

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户表的用户ID',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品表的商品ID',
  `goods_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品编号',
  `goods_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `product_id` int(11) DEFAULT NULL COMMENT '商品货品表的货品ID',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '商品货品的价格',
  `number` smallint(5) DEFAULT '0' COMMENT '商品货品的数量',
  `specifications` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品规格值列表，采用JSON数组格式',
  `checked` tinyint(1) DEFAULT '1' COMMENT '购物车中商品是否选择状态',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品图片或者商品货品图片',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='购物车商品表';

-- ----------------------------
-- Records of shop_cart
-- ----------------------------
BEGIN;
INSERT INTO `shop_cart` VALUES (24, 3, 1181004, '100001', '印花连衣裙', 259, 88.00, 2, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-10-31 21:42:27', '2019-11-01 09:51:38', 1);
INSERT INTO `shop_cart` VALUES (25, 3, 1181005, '100002', '女短款白外套', 265, 288.00, 1, '[\"M\",\"S\"]', 1, 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', '2019-10-31 22:03:05', '2019-11-01 09:51:30', 1);
INSERT INTO `shop_cart` VALUES (26, 3, 1181006, '100003', '小西装女外套', 278, 99.00, 2, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-11-01 09:02:26', '2019-11-01 09:27:24', 1);
INSERT INTO `shop_cart` VALUES (27, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-11-01 09:10:56', '2019-11-01 09:10:56', 1);
INSERT INTO `shop_cart` VALUES (28, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 3, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-11-01 09:41:08', '2019-11-01 09:41:34', 1);
INSERT INTO `shop_cart` VALUES (29, 3, 1181005, '100002', '女短款白外套', 273, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', '2019-11-01 09:52:37', '2019-11-01 10:03:06', 1);
INSERT INTO `shop_cart` VALUES (30, 3, 1181006, '100003', '小西装女外套', 278, 99.00, 3, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-11-01 09:54:10', '2019-11-01 10:03:05', 1);
INSERT INTO `shop_cart` VALUES (31, 3, 1181004, '100001', '印花连衣裙', 259, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-11-01 10:01:16', '2019-11-01 10:02:40', 1);
INSERT INTO `shop_cart` VALUES (32, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-11-01 10:02:02', '2019-11-01 10:02:25', 1);
INSERT INTO `shop_cart` VALUES (33, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-11-01 10:03:40', '2019-11-01 10:03:40', 1);
INSERT INTO `shop_cart` VALUES (34, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 3, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-11-01 10:11:41', '2019-11-01 10:11:41', 1);
INSERT INTO `shop_cart` VALUES (35, 3, 1181006, '100003', '小西装女外套', 278, 99.00, 2, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-11-01 10:21:29', '2019-11-01 10:21:29', 1);
INSERT INTO `shop_cart` VALUES (36, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-12-13 11:08:56', '2019-12-13 11:56:29', 1);
INSERT INTO `shop_cart` VALUES (37, 3, 1181005, '100002', '女短款白外套', 273, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', '2019-12-13 12:08:07', '2019-12-13 12:08:07', 1);
INSERT INTO `shop_cart` VALUES (38, 3, 1181006, '100003', '小西装女外套', 278, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-13 12:14:12', '2019-12-13 12:14:12', 1);
INSERT INTO `shop_cart` VALUES (39, 5, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-12-13 17:41:39', '2019-12-13 17:41:39', 1);
INSERT INTO `shop_cart` VALUES (40, 6, 1181006, '100003', '小西装女外套', 280, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-13 17:56:27', '2019-12-13 17:57:20', 1);
INSERT INTO `shop_cart` VALUES (41, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-12-15 11:12:12', '2019-12-15 11:12:12', 1);
INSERT INTO `shop_cart` VALUES (42, 3, 1181006, '100003', '小西装女外套', 280, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-15 13:00:37', '2019-12-15 13:03:24', 1);
INSERT INTO `shop_cart` VALUES (43, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-12-15 18:56:23', '2019-12-15 18:56:23', 1);
INSERT INTO `shop_cart` VALUES (44, 5, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-12-15 23:13:11', '2019-12-15 23:13:11', 1);
INSERT INTO `shop_cart` VALUES (45, 7, 1181006, '100003', '小西装女外套', 280, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-16 10:12:37', '2019-12-16 10:12:37', 0);
INSERT INTO `shop_cart` VALUES (46, 3, 1181004, '100001', '印花连衣裙', 281, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-12-16 10:17:38', '2019-12-16 10:17:38', 1);
INSERT INTO `shop_cart` VALUES (47, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-12-16 10:19:05', '2019-12-17 17:48:50', 1);
INSERT INTO `shop_cart` VALUES (48, 3, 1181005, '100002', '女短款白外套', 273, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', '2019-12-16 10:41:42', '2019-12-17 08:57:23', 1);
INSERT INTO `shop_cart` VALUES (49, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-16 12:09:39', '2019-12-16 12:09:57', 1);
INSERT INTO `shop_cart` VALUES (50, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-16 15:18:50', '2019-12-17 08:59:20', 1);
INSERT INTO `shop_cart` VALUES (51, 6, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-12-16 16:14:33', '2019-12-16 16:14:33', 0);
INSERT INTO `shop_cart` VALUES (52, 8, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-16 16:15:51', '2019-12-16 17:26:39', 0);
INSERT INTO `shop_cart` VALUES (53, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-17 17:05:03', '2019-12-17 17:45:03', 1);
INSERT INTO `shop_cart` VALUES (54, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-17 17:46:04', '2019-12-17 17:48:38', 1);
INSERT INTO `shop_cart` VALUES (55, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-17 17:59:43', '2019-12-17 17:59:43', 1);
INSERT INTO `shop_cart` VALUES (56, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-17 22:37:02', '2019-12-17 22:37:02', 1);
INSERT INTO `shop_cart` VALUES (57, 3, 1181004, '100001', '印花连衣裙', 281, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-12-19 11:04:06', '2019-12-19 11:04:06', 1);
INSERT INTO `shop_cart` VALUES (58, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 3, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-19 14:32:17', '2019-12-20 18:22:51', 1);
INSERT INTO `shop_cart` VALUES (59, 3, 1181004, '100001', '印花连衣裙', 281, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-12-19 14:32:24', '2019-12-19 14:32:24', 1);
INSERT INTO `shop_cart` VALUES (60, 3, 1181007, '100004', '羊皮衣真皮外套', 279, 388.00, 1, '[\"标准\"]', 1, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-12-22 12:30:33', '2019-12-22 12:30:33', 1);
INSERT INTO `shop_cart` VALUES (61, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-22 23:05:36', '2019-12-23 10:21:42', 1);
INSERT INTO `shop_cart` VALUES (62, 3, 1181004, '100001', '印花连衣裙', 281, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-12-22 23:05:43', '2019-12-22 23:05:43', 1);
INSERT INTO `shop_cart` VALUES (63, 3, 1181005, '100002', '女短款白外套', 273, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', '2019-12-23 10:22:00', '2019-12-23 10:22:00', 1);
INSERT INTO `shop_cart` VALUES (64, 3, 1181004, '100001', '印花连衣裙', 281, 88.00, 2, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-12-23 11:03:50', '2019-12-23 11:33:37', 1);
INSERT INTO `shop_cart` VALUES (65, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-12-23 11:33:42', '2019-12-23 11:33:42', 1);
INSERT INTO `shop_cart` VALUES (66, 3, 1181004, '100001', '印花连衣裙', 281, 88.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-12-24 13:55:19', '2019-12-24 13:55:19', 1);
INSERT INTO `shop_cart` VALUES (67, 3, 1181006, '100003', '小西装女外套', 283, 99.00, 1, '[\"标准\",\"大码\"]', 1, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2020-01-14 09:53:02', '2020-01-14 09:53:02', 1);
COMMIT;

-- ----------------------------
-- Table structure for shop_category
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类目名称',
  `keywords` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类目关键字，以JSON数组格式',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '类目广告语介绍',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父类目ID',
  `icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '类目图标',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '类目图片',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'L1',
  `sort_order` tinyint(3) DEFAULT '50' COMMENT '排序',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1036032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='类目表';

-- ----------------------------
-- Records of shop_category
-- ----------------------------
BEGIN;
INSERT INTO `shop_category` VALUES (1036008, '服装', '服装', '服装', 0, 'http://localhost:8080/client/storage/fetch/yky3aox7jme0u2bjfbnz.png', 'http://localhost:8080/client/storage/fetch/wk46d6qbxbh3vhes421y.png', 'L1', 50, '2019-10-31 12:00:13', '2019-10-31 17:08:39', 0);
INSERT INTO `shop_category` VALUES (1036009, '包包', '包包', '包包', 0, 'http://localhost:8080/client/storage/fetch/v889mvcea20pz16z35q1.png', 'http://localhost:8080/client/storage/fetch/bd5vop1s6g6xiau7m3z0.png', 'L1', 50, '2019-10-31 12:00:36', '2019-10-31 16:59:55', 0);
INSERT INTO `shop_category` VALUES (1036010, '女装', '女装', '女装', 1036008, 'http://localhost:8080/client/storage/fetch/51uq8a5ib3ow36sbxuhj.png', 'http://localhost:8080/client/storage/fetch/hxzr4v4j41rair56pe6k.png', 'L2', 50, '2019-10-31 12:01:44', '2019-10-31 16:46:12', 0);
INSERT INTO `shop_category` VALUES (1036011, '男装', '男装', '男装', 1036008, 'http://localhost:8080/client/storage/fetch/yqi6bx6qfv6jfpu512x2.png', 'http://localhost:8080/client/storage/fetch/jii9zippsiv6et2nl2x6.png', 'L2', 50, '2019-10-31 12:02:10', '2019-10-31 16:46:33', 0);
INSERT INTO `shop_category` VALUES (1036012, '童装', '童装', '童装', 1036008, 'http://localhost:8080/client/storage/fetch/lbf9f7s3nm0z3ahsd39t.png', 'http://localhost:8080/client/storage/fetch/oanxx7h7c65g9dku1v60.png', 'L2', 50, '2019-10-31 12:02:34', '2019-10-31 16:46:59', 0);
INSERT INTO `shop_category` VALUES (1036013, '内衣', '内衣', '内衣', 1036008, 'http://localhost:8080/client/storage/fetch/t9ndmujiivhem20k10tu.png', 'http://localhost:8080/client/storage/fetch/qs914tdyx9akf8564ehh.png', 'L2', 50, '2019-10-31 12:02:53', '2019-10-31 16:47:18', 0);
INSERT INTO `shop_category` VALUES (1036014, '母婴', '母婴', '母婴', 0, 'http://localhost:8080/client/storage/fetch/sb6itrff7ivo6ofeopjf.png', 'http://localhost:8080/client/storage/fetch/1kvuygv5qa6drmxn269x.png', 'L1', 50, '2019-10-31 12:05:50', '2019-10-31 17:00:28', 0);
INSERT INTO `shop_category` VALUES (1036015, '洗护', '洗护', '洗护', 0, 'http://localhost:8080/client/storage/fetch/bz1l0lt3u2pqhu7ht8so.png', 'http://localhost:8080/client/storage/fetch/q1r3merns7p0qwgcg17j.png', 'L1', 50, '2019-10-31 12:06:28', '2019-10-31 17:01:28', 0);
INSERT INTO `shop_category` VALUES (1036016, '图书', '图书', '图书', 0, 'http://localhost:8080/client/storage/fetch/jbbjt85tpms7c9azfimq.png', 'http://localhost:8080/client/storage/fetch/p1cur5bqk3aivia1kskm.png', 'L1', 50, '2019-10-31 12:09:52', '2019-10-31 17:02:32', 0);
INSERT INTO `shop_category` VALUES (1036017, '办公', '办公', '办公', 0, 'http://localhost:8080/client/storage/fetch/xy3dbuxrkumopwx7qfap.png', 'http://localhost:8080/client/storage/fetch/qvnhq7bv2ul0xuthcxta.png', 'L1', 50, '2019-10-31 12:10:26', '2019-10-31 17:03:14', 0);
INSERT INTO `shop_category` VALUES (1036018, '食品', '食品', '短裙', 0, 'http://localhost:8080/client/storage/fetch/jxyykxq7nrbuxercssi6.png', 'http://localhost:8080/client/storage/fetch/d4dekn0k5fbnxsv6ituc.png', 'L1', 50, '2019-10-31 12:10:57', '2019-10-31 17:11:18', 0);
INSERT INTO `shop_category` VALUES (1036019, '电脑', '电脑', '电脑', 0, 'http://localhost:8080/client/storage/fetch/g8lxerc5ekxmje6dxihc.png', 'http://localhost:8080/client/storage/fetch/lcqgrfaba2am7xy6k6q7.png', 'L1', 50, '2019-10-31 12:11:22', '2019-10-31 17:07:07', 0);
INSERT INTO `shop_category` VALUES (1036020, '家具', '家具', '家具', 0, 'http://localhost:8080/client/storage/fetch/qya3qbbj7siorkhor05h.png', 'http://localhost:8080/client/storage/fetch/725wcwcn4rmjs09muhne.png', 'L1', 50, '2019-10-31 12:11:37', '2019-10-31 17:05:51', 0);
INSERT INTO `shop_category` VALUES (1036021, '皮包', '皮包', '皮包', 1036009, 'http://localhost:8080/client/storage/fetch/b9rbqwzc31o9tn9gwuf4.png', 'http://localhost:8080/client/storage/fetch/ff2xuzok3o1xn9y6fur6.png', 'L2', 50, '2019-12-13 17:13:20', '2019-12-13 17:16:50', 0);
INSERT INTO `shop_category` VALUES (1036022, '书包', '书包', '书包', 1036009, 'http://localhost:8080/client/storage/fetch/5v7vgeciib1pdpvmv4tw.png', 'http://localhost:8080/client/storage/fetch/fmc72lc6ek1vdynips9d.png', 'L2', 50, '2019-12-13 17:15:43', '2019-12-13 17:15:43', 0);
INSERT INTO `shop_category` VALUES (1036023, '电器', '电器', '电器', 0, 'http://localhost:8080/client/storage/fetch/xs1aifds8pbjzruodhau.png', 'http://localhost:8080/client/storage/fetch/44ic5cji8k63x61u14e8.png', 'L1', 50, '2019-12-13 17:18:47', '2019-12-13 17:28:51', 0);
INSERT INTO `shop_category` VALUES (1036024, '奶粉', '奶粉', '奶粉', 1036014, 'http://localhost:8080/client/storage/fetch/wo3mrr49kreeroa8rs2e.png', 'http://localhost:8080/client/storage/fetch/1lhc8yrn29w3sr9dzbqi.png', 'L2', 50, '2019-12-13 17:20:55', '2019-12-13 17:20:55', 0);
INSERT INTO `shop_category` VALUES (1036025, '洗发水', '洗发水', '洗发水', 1036015, 'http://localhost:8080/client/storage/fetch/zlyrt2au398o9oidmscy.png', 'http://localhost:8080/client/storage/fetch/17pz7vtsqnhwgfbh8q1v.png', 'L2', 50, '2019-12-13 17:22:16', '2019-12-13 17:22:16', 0);
INSERT INTO `shop_category` VALUES (1036026, '科技', '科技', '科技', 1036016, 'http://localhost:8080/client/storage/fetch/9bev79fmucofhpo90ltc.png', 'http://localhost:8080/client/storage/fetch/ym0d48b83e2s5g1bkrju.png', 'L2', 50, '2019-12-13 17:23:03', '2019-12-13 17:23:03', 0);
INSERT INTO `shop_category` VALUES (1036027, '钢笔', '钢笔', '钢笔', 1036017, 'http://localhost:8080/client/storage/fetch/sju1dwg7rk5vwqhkmuth.png', 'http://localhost:8080/client/storage/fetch/anprj66lqnep0d048ipo.png', 'L2', 50, '2019-12-13 17:23:47', '2019-12-13 17:23:47', 0);
INSERT INTO `shop_category` VALUES (1036028, '零食', '零食', '零食', 1036018, 'http://localhost:8080/client/storage/fetch/p3b8igazzuevyc82zj0l.png', 'http://localhost:8080/client/storage/fetch/e6dgwfua88aa0ojunr3i.png', 'L2', 50, '2019-12-13 17:24:28', '2019-12-13 17:24:28', 0);
INSERT INTO `shop_category` VALUES (1036029, '硬盘', '硬盘', '硬盘', 1036019, 'http://localhost:8080/client/storage/fetch/7se2l5uvwslpdm22xdsm.png', 'http://localhost:8080/client/storage/fetch/kv5mau128ynraf4bs43r.png', 'L2', 50, '2019-12-13 17:25:48', '2019-12-13 17:25:48', 0);
INSERT INTO `shop_category` VALUES (1036030, '沙发', '沙发', '沙发', 1036020, 'http://localhost:8080/client/storage/fetch/ogowjinejzwrau3t1rxk.png', 'http://localhost:8080/client/storage/fetch/j7qb0z1pv8wr60seaa4z.png', 'L2', 50, '2019-12-13 17:26:30', '2019-12-13 17:26:30', 0);
INSERT INTO `shop_category` VALUES (1036031, '冰箱', '冰箱', '冰箱', 1036023, 'http://localhost:8080/client/storage/fetch/qgm11dq9eyyqmoiqdol9.png', 'http://localhost:8080/client/storage/fetch/83ysjyu036ibl6bx68p9.png', 'L2', 50, '2019-12-13 17:27:10', '2019-12-13 17:27:10', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_collect
-- ----------------------------
DROP TABLE IF EXISTS `shop_collect`;
CREATE TABLE `shop_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户表的用户ID',
  `value_id` int(11) NOT NULL DEFAULT '0' COMMENT '如果type=0，则是商品ID；如果type=1，则是专题ID',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '收藏类型，如果type=0，则是商品ID；如果type=1，则是专题ID',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='收藏表';

-- ----------------------------
-- Records of shop_collect
-- ----------------------------
BEGIN;
INSERT INTO `shop_collect` VALUES (5, 3, 1181004, 0, '2019-10-31 12:51:57', '2019-10-31 12:51:57', 0);
INSERT INTO `shop_collect` VALUES (6, 3, 1181005, 0, '2019-10-31 22:50:28', '2019-10-31 22:50:28', 1);
INSERT INTO `shop_collect` VALUES (7, 3, 1181005, 0, '2019-12-16 10:46:43', '2019-12-16 10:46:43', 1);
INSERT INTO `shop_collect` VALUES (8, 3, 1181007, 0, '2019-12-16 10:50:17', '2019-12-16 10:50:17', 1);
INSERT INTO `shop_collect` VALUES (9, 3, 1181007, 0, '2019-12-16 10:50:21', '2019-12-16 10:50:21', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods`;
CREATE TABLE `shop_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(11) DEFAULT '0' COMMENT '商品所属类目ID',
  `gallery` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品宣传图片列表，采用JSON数组格式',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '商品关键字，采用逗号间隔',
  `brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '商品简介',
  `is_on_sale` tinyint(1) DEFAULT '1' COMMENT '是否上架',
  `sort_order` smallint(4) DEFAULT '100',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品页面商品图片',
  `share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品分享朋友圈图片',
  `is_new` tinyint(1) DEFAULT '0' COMMENT '是否新品首发，如果设置则可以在新品首发页面展示',
  `is_hot` tinyint(1) DEFAULT '0' COMMENT '是否人气推荐，如果设置则可以在人气推荐页面展示',
  `unit` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '’件‘' COMMENT '商品单位，例如件、盒',
  `counter_price` decimal(10,2) DEFAULT '0.00' COMMENT '专柜价格',
  `retail_price` decimal(10,2) DEFAULT '100000.00' COMMENT '零售价格',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '商品详细介绍，是富文本格式',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`category_id`),
  KEY `sort_order` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1181008 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品基本信息表';

-- ----------------------------
-- Records of shop_goods
-- ----------------------------
BEGIN;
INSERT INTO `shop_goods` VALUES (1181004, '100001', '印花连衣裙', 1036010, '[\"http://localhost:8080/client/storage/fetch/836btpjh72mo2znlh4tc.jpg\",\"http://localhost:8080/client/storage/fetch/sjvevpccayyl6hnk447z.jpg\"]', '衣服,裙子', '法国代购新款翻领修身中长裙春夏印花连衣裙', 1, 100, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '', 1, 1, '件', 88.00, 108.00, '<p><img src=\"http://localhost:8080/client/storage/fetch/0t7jtn6espxla8mrujoc.jpg\" alt=\"\" width=\"800\" height=\"800\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/8lu2kdicor5ki40151kg.jpg\" alt=\"\" width=\"800\" height=\"800\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/j4djwvxybdc0mwsdtouz.jpg\" alt=\"\" width=\"800\" height=\"800\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/k7ru69c1r2e5njmkqwmj.jpg\" alt=\"\" width=\"800\" height=\"800\" /></p>\n<p>&nbsp;</p>', '2019-10-31 12:49:51', '2019-12-13 15:34:30', 0);
INSERT INTO `shop_goods` VALUES (1181005, '100002', '女短款白外套', 1036010, '[\"http://localhost:8080/client/storage/fetch/iyoji1t8zjnxbbvh4ou2.jpg\",\"http://localhost:8080/client/storage/fetch/za5omf5vmndm967bf584.jpg\",\"http://localhost:8080/client/storage/fetch/i3t1wspe9yv7f093apv2.jpg\"]', '', '柔美而精致~高贵而优雅~圆领金银丝春季毛衣羊毛开衫女短款白外套', 1, 100, 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', '', 1, 1, '件', 88.00, 108.00, '<p><img src=\"http://localhost:8080/client/storage/fetch/fupc3stbu7km6w2izs8a.jpg\" alt=\"\" width=\"750\" height=\"1020\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/ydzuxlivp4e3iryrckx8.jpg\" alt=\"\" width=\"750\" height=\"1004\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/5fh3f4dpe3jp901p35b3.jpg\" alt=\"\" width=\"750\" height=\"1004\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/z4v8o9zv31qpo7f7n1g1.jpg\" alt=\"\" width=\"750\" height=\"1004\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/nuck8f3rctifuw7v2f5x.jpg\" alt=\"\" width=\"750\" height=\"826\" /></p>', '2019-10-31 21:35:34', '2019-10-31 23:01:18', 0);
INSERT INTO `shop_goods` VALUES (1181006, '100003', '小西装女外套', 1036010, '[\"http://localhost:8080/client/storage/fetch/uybep55ndb794c6aiih7.jpg\",\"http://localhost:8080/client/storage/fetch/q9pn64cjjorohljk5hsk.jpg\"]', '新款,便宜', '高端西服韩版英伦风短款格子小西装女外套潮', 1, 100, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '', 1, 1, '件', 99.00, 199.00, '<p><img src=\"http://localhost:8080/client/storage/fetch/hq54u85xyragihgw6dj3.jpg\" alt=\"\" width=\"750\" height=\"529\" /></p>', '2019-10-31 23:17:27', '2019-12-16 11:22:07', 0);
INSERT INTO `shop_goods` VALUES (1181007, '100004', '羊皮衣真皮外套', 1036010, '[\"http://localhost:8080/client/storage/fetch/hdxghza2fwbxdo7y860h.jpg\",\"http://localhost:8080/client/storage/fetch/0vopyzez1j3c2z4lae1c.jpg\",\"http://localhost:8080/client/storage/fetch/vdy95hscdq1mhzs8x0j7.jpg\"]', '', '复古廓形机车进口绵羊皮衣真皮外套女E142', 1, 100, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', NULL, 1, 1, '件', 588.00, 388.00, '<p><img src=\"http://localhost:8080/client/storage/fetch/91kfhogobjgnf268gt57.jpg\" alt=\"\" width=\"730\" height=\"883\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/xyw2y32h4gz2qwcc414b.jpg\" alt=\"\" width=\"750\" height=\"1581\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/l62qvcjl9j2vi3ge1izg.jpg\" alt=\"\" width=\"750\" height=\"1581\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/3k5rbqhnlvqhup7pbeji.jpg\" alt=\"\" width=\"750\" height=\"1581\" /></p>\n<p><img src=\"http://localhost:8080/client/storage/fetch/x0iqc99kfhumsefzlzqp.jpg\" alt=\"\" width=\"750\" height=\"1403\" /></p>', '2019-11-01 09:10:16', '2019-11-01 09:10:16', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_attribute`;
CREATE TABLE `shop_goods_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表的商品ID',
  `attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品参数名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品参数值',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=916 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品参数表';

-- ----------------------------
-- Records of shop_goods_attribute
-- ----------------------------
BEGIN;
INSERT INTO `shop_goods_attribute` VALUES (906, 1181005, '均码', 'M', '2019-10-31 21:35:34', '2019-10-31 21:35:34', 1);
INSERT INTO `shop_goods_attribute` VALUES (907, 1181006, '大码', '大码', '2019-10-31 23:24:34', '2019-10-31 23:24:34', 1);
INSERT INTO `shop_goods_attribute` VALUES (908, 1181006, '大码', '大码', '2019-10-31 23:33:16', '2019-10-31 23:33:16', 1);
INSERT INTO `shop_goods_attribute` VALUES (909, 1181006, '大码', '大码', '2019-12-13 15:34:09', '2019-12-13 15:34:09', 1);
INSERT INTO `shop_goods_attribute` VALUES (910, 1181006, '图案', '纯色', '2019-12-16 11:18:17', '2019-12-16 11:18:17', 1);
INSERT INTO `shop_goods_attribute` VALUES (911, 1181006, '领型', '圆领', '2019-12-16 11:18:17', '2019-12-16 11:18:17', 1);
INSERT INTO `shop_goods_attribute` VALUES (912, 1181006, '面料', '棉麻', '2019-12-16 11:18:17', '2019-12-16 11:18:17', 1);
INSERT INTO `shop_goods_attribute` VALUES (913, 1181006, '图案', '纯色', '2019-12-16 11:22:07', '2019-12-16 11:22:07', 0);
INSERT INTO `shop_goods_attribute` VALUES (914, 1181006, '领型', '圆领', '2019-12-16 11:22:07', '2019-12-16 11:22:07', 0);
INSERT INTO `shop_goods_attribute` VALUES (915, 1181006, '面料', '棉麻', '2019-12-16 11:22:07', '2019-12-16 11:22:07', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_goods_product
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_product`;
CREATE TABLE `shop_goods_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表的商品ID',
  `specifications` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品规格值列表，采用JSON数组格式',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品货品价格',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '商品货品数量',
  `url` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品货品图片',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品货品表';

-- ----------------------------
-- Records of shop_goods_product
-- ----------------------------
BEGIN;
INSERT INTO `shop_goods_product` VALUES (257, 1181004, '[\"标准\"]', 88.00, 998, 'http://localhost:8080/client/storage/fetch/w87zicvrqutux0pjgnvf.jpg', '2019-10-31 12:49:51', '2019-10-31 13:01:06', 1);
INSERT INTO `shop_goods_product` VALUES (258, 1181004, '[\"标准\",\"大码\"]', 88.00, 800, 'http://localhost:8080/client/storage/fetch/4jmqaabk2onlpmx7ztrh.jpg', '2019-10-31 12:59:56', '2019-10-31 12:59:56', 1);
INSERT INTO `shop_goods_product` VALUES (259, 1181004, '[\"标准\",\"大码\"]', 88.00, 797, 'http://localhost:8080/client/storage/fetch/4jmqaabk2onlpmx7ztrh.jpg', '2019-10-31 14:27:27', '2019-11-01 10:03:10', 1);
INSERT INTO `shop_goods_product` VALUES (260, 1181005, '[\"标准\"]', 268.00, 300, 'http://localhost:8080/client/storage/fetch/3bjy6ro3pupdq5ua08fx.jpg', '2019-10-31 21:35:34', '2019-10-31 21:35:34', 1);
INSERT INTO `shop_goods_product` VALUES (261, 1181005, '[\"标准\",\"M\",\"S\"]', 0.00, 0, '', '2019-10-31 21:37:59', '2019-10-31 21:37:59', 1);
INSERT INTO `shop_goods_product` VALUES (262, 1181005, '[\"M\",\"S\"]', 0.00, 0, '', '2019-10-31 21:44:01', '2019-10-31 21:44:01', 1);
INSERT INTO `shop_goods_product` VALUES (263, 1181005, '[\"M\",\"S\"]', 288.00, 300, '', '2019-10-31 21:45:18', '2019-10-31 21:45:18', 1);
INSERT INTO `shop_goods_product` VALUES (264, 1181005, '[\"M\",\"S\"]', 288.00, 300, 'http://localhost:8080/client/storage/fetch/rx9rmtkwtfi4g433sr7d.jpg', '2019-10-31 21:46:55', '2019-10-31 21:46:55', 1);
INSERT INTO `shop_goods_product` VALUES (265, 1181005, '[\"M\",\"S\"]', 288.00, 299, 'http://localhost:8080/client/storage/fetch/rx9rmtkwtfi4g433sr7d.jpg', '2019-10-31 21:50:58', '2019-11-01 09:51:57', 1);
INSERT INTO `shop_goods_product` VALUES (266, 1181005, '[\"M\"]', 268.00, 800, 'http://localhost:8080/client/storage/fetch/ccogy465kx2qq9v5yz7r.jpg', '2019-10-31 22:05:06', '2019-10-31 22:05:06', 1);
INSERT INTO `shop_goods_product` VALUES (267, 1181005, '[\"标准\"]', 288.00, 300, 'http://localhost:8080/client/storage/fetch/svzb9wc03m1stt0bql11.jpg', '2019-10-31 22:38:55', '2019-10-31 22:38:55', 1);
INSERT INTO `shop_goods_product` VALUES (268, 1181005, '[\"标准\"]', 288.00, 300, 'http://localhost:8080/client/storage/fetch/svzb9wc03m1stt0bql11.jpg', '2019-10-31 22:48:13', '2019-10-31 22:48:13', 1);
INSERT INTO `shop_goods_product` VALUES (269, 1181005, '[\"标准\",\"M\"]', 288.00, 500, 'http://localhost:8080/client/storage/fetch/t0ux3n0llxp7nomfyjj6.jpg', '2019-10-31 22:49:34', '2019-10-31 22:49:34', 1);
INSERT INTO `shop_goods_product` VALUES (270, 1181005, '[\"标准\",\"大码\"]', 288.00, 800, 'http://localhost:8080/client/storage/fetch/ycj8de6qdkfipw5sv6ut.jpg', '2019-10-31 22:53:21', '2019-10-31 22:53:21', 1);
INSERT INTO `shop_goods_product` VALUES (271, 1181005, '[\"标准\",\"大码\"]', 288.00, 800, 'http://localhost:8080/client/storage/fetch/ycj8de6qdkfipw5sv6ut.jpg', '2019-10-31 22:59:23', '2019-10-31 22:59:23', 1);
INSERT INTO `shop_goods_product` VALUES (272, 1181005, '[\"标准\",\"大码\"]', 288.00, 800, 'http://localhost:8080/client/storage/fetch/ycj8de6qdkfipw5sv6ut.jpg', '2019-10-31 23:00:50', '2019-10-31 23:00:50', 1);
INSERT INTO `shop_goods_product` VALUES (273, 1181005, '[\"标准\",\"大码\"]', 88.00, 796, 'http://localhost:8080/client/storage/fetch/ycj8de6qdkfipw5sv6ut.jpg', '2019-10-31 23:01:18', '2019-12-23 10:37:10', 0);
INSERT INTO `shop_goods_product` VALUES (274, 1181006, '[\"标准\"]', 199.00, 900, 'http://localhost:8080/client/storage/fetch/czbiys038fs6pyxzojzw.jpg', '2019-10-31 23:17:27', '2019-10-31 23:17:27', 1);
INSERT INTO `shop_goods_product` VALUES (275, 1181006, '[\"标准\"]', 99.00, 900, 'http://localhost:8080/client/storage/fetch/czbiys038fs6pyxzojzw.jpg', '2019-10-31 23:18:33', '2019-10-31 23:18:33', 1);
INSERT INTO `shop_goods_product` VALUES (276, 1181006, '[\"标准\",\"大码\"]', 99.00, 900, 'http://localhost:8080/client/storage/fetch/9kxagn7rkl0iqzppwxuz.jpg', '2019-10-31 23:19:35', '2019-10-31 23:19:35', 1);
INSERT INTO `shop_goods_product` VALUES (277, 1181006, '[\"标准\",\"大码\"]', 99.00, 900, 'http://localhost:8080/client/storage/fetch/9kxagn7rkl0iqzppwxuz.jpg', '2019-10-31 23:24:34', '2019-10-31 23:24:34', 1);
INSERT INTO `shop_goods_product` VALUES (278, 1181006, '[\"标准\",\"大码\"]', 99.00, 892, 'http://localhost:8080/client/storage/fetch/9kxagn7rkl0iqzppwxuz.jpg', '2019-10-31 23:33:16', '2019-12-13 12:14:14', 1);
INSERT INTO `shop_goods_product` VALUES (279, 1181007, '[\"标准\"]', 388.00, 787, 'http://localhost:8080/client/storage/fetch/waln4hxl83049etijs02.jpg', '2019-11-01 09:10:16', '2019-12-22 12:30:43', 0);
INSERT INTO `shop_goods_product` VALUES (280, 1181006, '[\"标准\",\"大码\"]', 99.00, 890, 'http://localhost:8080/client/storage/fetch/9kxagn7rkl0iqzppwxuz.jpg', '2019-12-13 15:34:09', '2019-12-15 13:03:26', 1);
INSERT INTO `shop_goods_product` VALUES (281, 1181004, '[\"标准\",\"大码\"]', 88.00, 793, 'http://localhost:8080/client/storage/fetch/4jmqaabk2onlpmx7ztrh.jpg', '2019-12-13 15:34:30', '2019-12-24 13:55:32', 0);
INSERT INTO `shop_goods_product` VALUES (282, 1181006, '[\"标准\",\"大码\"]', 99.00, 890, 'http://localhost:8080/client/storage/fetch/9kxagn7rkl0iqzppwxuz.jpg', '2019-12-16 11:18:17', '2019-12-16 11:18:17', 1);
INSERT INTO `shop_goods_product` VALUES (283, 1181006, '[\"标准\",\"大码\"]', 99.00, 880, 'http://localhost:8080/client/storage/fetch/9kxagn7rkl0iqzppwxuz.jpg', '2019-12-16 11:22:07', '2020-01-14 09:53:15', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `shop_goods_specification`;
CREATE TABLE `shop_goods_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表的商品ID',
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格值',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格图片',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='商品规格表';

-- ----------------------------
-- Records of shop_goods_specification
-- ----------------------------
BEGIN;
INSERT INTO `shop_goods_specification` VALUES (256, 1181004, '规格', '标准', '', '2019-10-31 12:49:51', '2019-10-31 12:49:51', 1);
INSERT INTO `shop_goods_specification` VALUES (257, 1181004, '规格', '标准', '', '2019-10-31 12:59:56', '2019-10-31 12:59:56', 1);
INSERT INTO `shop_goods_specification` VALUES (258, 1181004, '大码', '大码', '', '2019-10-31 12:59:56', '2019-10-31 12:59:56', 1);
INSERT INTO `shop_goods_specification` VALUES (259, 1181004, '规格', '标准', '', '2019-10-31 14:27:27', '2019-10-31 14:27:27', 1);
INSERT INTO `shop_goods_specification` VALUES (260, 1181004, '大码', '大码', '', '2019-10-31 14:27:27', '2019-10-31 14:27:27', 1);
INSERT INTO `shop_goods_specification` VALUES (261, 1181005, '规格', '标准', '', '2019-10-31 21:35:34', '2019-10-31 21:35:34', 1);
INSERT INTO `shop_goods_specification` VALUES (262, 1181005, '规格', '标准', '', '2019-10-31 21:37:59', '2019-10-31 21:37:59', 1);
INSERT INTO `shop_goods_specification` VALUES (263, 1181005, '均码', 'M', 'http://localhost:8080/client/storage/fetch/966m4tv21rxs4hku02kx.jpg', '2019-10-31 21:37:59', '2019-10-31 21:37:59', 1);
INSERT INTO `shop_goods_specification` VALUES (264, 1181005, '小码', 'S', 'http://localhost:8080/client/storage/fetch/n1jaer3571hav8s6z7b8.jpg', '2019-10-31 21:37:59', '2019-10-31 21:37:59', 1);
INSERT INTO `shop_goods_specification` VALUES (265, 1181005, '均码', 'M', 'http://localhost:8080/client/storage/fetch/966m4tv21rxs4hku02kx.jpg', '2019-10-31 21:44:01', '2019-10-31 21:44:01', 1);
INSERT INTO `shop_goods_specification` VALUES (266, 1181005, '小码', 'S', 'http://localhost:8080/client/storage/fetch/n1jaer3571hav8s6z7b8.jpg', '2019-10-31 21:44:01', '2019-10-31 21:44:01', 1);
INSERT INTO `shop_goods_specification` VALUES (267, 1181005, '均码', 'M', 'http://localhost:8080/client/storage/fetch/966m4tv21rxs4hku02kx.jpg', '2019-10-31 21:45:18', '2019-10-31 21:45:18', 1);
INSERT INTO `shop_goods_specification` VALUES (268, 1181005, '小码', 'S', 'http://localhost:8080/client/storage/fetch/n1jaer3571hav8s6z7b8.jpg', '2019-10-31 21:45:18', '2019-10-31 21:45:18', 1);
INSERT INTO `shop_goods_specification` VALUES (269, 1181005, '均码', 'M', 'http://localhost:8080/client/storage/fetch/966m4tv21rxs4hku02kx.jpg', '2019-10-31 21:46:55', '2019-10-31 21:46:55', 1);
INSERT INTO `shop_goods_specification` VALUES (270, 1181005, '小码', 'S', 'http://localhost:8080/client/storage/fetch/n1jaer3571hav8s6z7b8.jpg', '2019-10-31 21:46:55', '2019-10-31 21:46:55', 1);
INSERT INTO `shop_goods_specification` VALUES (271, 1181005, '均码', 'M', 'http://localhost:8080/client/storage/fetch/966m4tv21rxs4hku02kx.jpg', '2019-10-31 21:50:58', '2019-10-31 21:50:58', 1);
INSERT INTO `shop_goods_specification` VALUES (272, 1181005, '小码', 'S', 'http://localhost:8080/client/storage/fetch/n1jaer3571hav8s6z7b8.jpg', '2019-10-31 21:50:58', '2019-10-31 21:50:58', 1);
INSERT INTO `shop_goods_specification` VALUES (273, 1181005, '均码', 'M', 'http://localhost:8080/client/storage/fetch/966m4tv21rxs4hku02kx.jpg', '2019-10-31 22:05:06', '2019-10-31 22:05:06', 1);
INSERT INTO `shop_goods_specification` VALUES (274, 1181005, '标准', '标准', '', '2019-10-31 22:38:55', '2019-10-31 22:38:55', 1);
INSERT INTO `shop_goods_specification` VALUES (275, 1181005, '标准', '标准', '', '2019-10-31 22:48:13', '2019-10-31 22:48:13', 1);
INSERT INTO `shop_goods_specification` VALUES (276, 1181005, '规格', '标准', '', '2019-10-31 22:49:34', '2019-10-31 22:49:34', 1);
INSERT INTO `shop_goods_specification` VALUES (277, 1181005, '均码', 'M', '', '2019-10-31 22:49:34', '2019-10-31 22:49:34', 1);
INSERT INTO `shop_goods_specification` VALUES (278, 1181005, '规格', '标准', '', '2019-10-31 22:53:21', '2019-10-31 22:53:21', 1);
INSERT INTO `shop_goods_specification` VALUES (279, 1181005, '大码', '大码', '', '2019-10-31 22:53:21', '2019-10-31 22:53:21', 1);
INSERT INTO `shop_goods_specification` VALUES (280, 1181005, '规格', '标准', '', '2019-10-31 22:59:23', '2019-10-31 22:59:23', 1);
INSERT INTO `shop_goods_specification` VALUES (281, 1181005, '大码', '大码', '', '2019-10-31 22:59:23', '2019-10-31 22:59:23', 1);
INSERT INTO `shop_goods_specification` VALUES (282, 1181005, '规格', '标准', '', '2019-10-31 23:00:50', '2019-10-31 23:00:50', 1);
INSERT INTO `shop_goods_specification` VALUES (283, 1181005, '大码', '大码', '', '2019-10-31 23:00:50', '2019-10-31 23:00:50', 1);
INSERT INTO `shop_goods_specification` VALUES (284, 1181005, '规格', '标准', '', '2019-10-31 23:01:18', '2019-10-31 23:01:18', 0);
INSERT INTO `shop_goods_specification` VALUES (285, 1181005, '大码', '大码', '', '2019-10-31 23:01:18', '2019-10-31 23:01:18', 0);
INSERT INTO `shop_goods_specification` VALUES (286, 1181006, '规格', '标准', '', '2019-10-31 23:17:27', '2019-10-31 23:17:27', 1);
INSERT INTO `shop_goods_specification` VALUES (287, 1181006, '规格', '标准', '', '2019-10-31 23:18:33', '2019-10-31 23:18:33', 1);
INSERT INTO `shop_goods_specification` VALUES (288, 1181006, '规格', '标准', '', '2019-10-31 23:19:35', '2019-10-31 23:19:35', 1);
INSERT INTO `shop_goods_specification` VALUES (289, 1181006, '大码', '大码', '', '2019-10-31 23:19:35', '2019-10-31 23:19:35', 1);
INSERT INTO `shop_goods_specification` VALUES (290, 1181006, '规格', '标准', '', '2019-10-31 23:24:34', '2019-10-31 23:24:34', 1);
INSERT INTO `shop_goods_specification` VALUES (291, 1181006, '大码', '大码', '', '2019-10-31 23:24:34', '2019-10-31 23:24:34', 1);
INSERT INTO `shop_goods_specification` VALUES (292, 1181006, '规格', '标准', '', '2019-10-31 23:33:16', '2019-10-31 23:33:16', 1);
INSERT INTO `shop_goods_specification` VALUES (293, 1181006, '大码', '大码', '', '2019-10-31 23:33:16', '2019-10-31 23:33:16', 1);
INSERT INTO `shop_goods_specification` VALUES (294, 1181007, '规格', '标准', '', '2019-11-01 09:10:16', '2019-11-01 09:10:16', 0);
INSERT INTO `shop_goods_specification` VALUES (295, 1181006, '规格', '标准', '', '2019-12-13 15:34:09', '2019-12-13 15:34:09', 1);
INSERT INTO `shop_goods_specification` VALUES (296, 1181006, '大码', '大码', '', '2019-12-13 15:34:09', '2019-12-13 15:34:09', 1);
INSERT INTO `shop_goods_specification` VALUES (297, 1181004, '规格', '标准', '', '2019-12-13 15:34:30', '2019-12-13 15:34:30', 0);
INSERT INTO `shop_goods_specification` VALUES (298, 1181004, '大码', '大码', '', '2019-12-13 15:34:30', '2019-12-13 15:34:30', 0);
INSERT INTO `shop_goods_specification` VALUES (299, 1181006, '规格', '标准', '', '2019-12-16 11:18:17', '2019-12-16 11:18:17', 1);
INSERT INTO `shop_goods_specification` VALUES (300, 1181006, '大码', '大码', '', '2019-12-16 11:18:17', '2019-12-16 11:18:17', 1);
INSERT INTO `shop_goods_specification` VALUES (301, 1181006, '规格', '标准', '', '2019-12-16 11:22:07', '2019-12-16 11:22:07', 0);
INSERT INTO `shop_goods_specification` VALUES (302, 1181006, '大码', '大码', '', '2019-12-16 11:22:07', '2019-12-16 11:22:07', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_issue
-- ----------------------------
DROP TABLE IF EXISTS `shop_issue`;
CREATE TABLE `shop_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '问题标题',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '问题答案',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='常见问题表';

-- ----------------------------
-- Records of shop_issue
-- ----------------------------
BEGIN;
INSERT INTO `shop_issue` VALUES (1, '购买运费如何收取？', '单笔订单金额（不含运费）满88元免邮费；不满88元，每单收取10元运费。\n(港澳台地区需满', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `shop_issue` VALUES (2, '使用什么快递发货？', '严选默认使用顺丰快递发货（个别商品使用其他快递），配送范围覆盖全国大部分地区（港澳台地区除', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `shop_issue` VALUES (3, '如何申请退货？', '1.自收到商品之日起30日内，顾客可申请无忧退货，退款将原路返还，不同的银行处理时间不同，', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
INSERT INTO `shop_issue` VALUES (4, '如何开具发票？', '1.如需开具普通发票，请在下单时选择“我要开发票”并填写相关信息（APP仅限2.4.0及以', '2018-02-01 00:00:00', '2018-02-01 00:00:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_log
-- ----------------------------
DROP TABLE IF EXISTS `shop_log`;
CREATE TABLE `shop_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理员',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理员地址',
  `type` int(11) DEFAULT NULL COMMENT '操作分类',
  `action` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `status` tinyint(1) DEFAULT NULL COMMENT '操作状态',
  `result` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '操作结果，或者成功消息，或者失败消息',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '补充信息',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='操作日志表';

-- ----------------------------
-- Records of shop_log
-- ----------------------------
BEGIN;
INSERT INTO `shop_log` VALUES (1, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-25 10:35:16', '2019-09-25 10:35:16', 0);
INSERT INTO `shop_log` VALUES (2, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-25 16:42:45', '2019-09-25 16:42:45', 0);
INSERT INTO `shop_log` VALUES (3, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-25 18:15:51', '2019-09-25 18:15:51', 0);
INSERT INTO `shop_log` VALUES (4, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-25 18:33:42', '2019-09-25 18:33:42', 0);
INSERT INTO `shop_log` VALUES (5, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-25 20:55:23', '2019-09-25 20:55:23', 0);
INSERT INTO `shop_log` VALUES (6, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-25 21:18:49', '2019-09-25 21:18:49', 0);
INSERT INTO `shop_log` VALUES (7, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-25 22:36:32', '2019-09-25 22:36:32', 0);
INSERT INTO `shop_log` VALUES (8, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-26 17:14:17', '2019-09-26 17:14:17', 0);
INSERT INTO `shop_log` VALUES (9, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-26 17:15:59', '2019-09-26 17:15:59', 0);
INSERT INTO `shop_log` VALUES (10, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-26 17:22:25', '2019-09-26 17:22:25', 0);
INSERT INTO `shop_log` VALUES (11, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-26 18:24:23', '2019-09-26 18:24:23', 0);
INSERT INTO `shop_log` VALUES (12, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-26 18:27:21', '2019-09-26 18:27:21', 0);
INSERT INTO `shop_log` VALUES (13, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-26 19:14:57', '2019-09-26 19:14:57', 0);
INSERT INTO `shop_log` VALUES (14, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-26 19:35:22', '2019-09-26 19:35:22', 0);
INSERT INTO `shop_log` VALUES (15, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-26 22:49:35', '2019-09-26 22:49:35', 0);
INSERT INTO `shop_log` VALUES (16, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-27 23:07:16', '2019-09-27 23:07:16', 0);
INSERT INTO `shop_log` VALUES (17, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-27 23:19:47', '2019-09-27 23:19:47', 0);
INSERT INTO `shop_log` VALUES (18, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-27 23:46:21', '2019-09-27 23:46:21', 0);
INSERT INTO `shop_log` VALUES (19, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-27 23:50:37', '2019-09-27 23:50:37', 0);
INSERT INTO `shop_log` VALUES (20, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 06:16:34', '2019-09-28 06:16:34', 0);
INSERT INTO `shop_log` VALUES (21, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 07:03:23', '2019-09-28 07:03:23', 0);
INSERT INTO `shop_log` VALUES (22, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 07:05:45', '2019-09-28 07:05:45', 0);
INSERT INTO `shop_log` VALUES (23, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 08:43:58', '2019-09-28 08:43:58', 0);
INSERT INTO `shop_log` VALUES (24, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 15:08:36', '2019-09-28 15:08:36', 0);
INSERT INTO `shop_log` VALUES (25, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 15:19:46', '2019-09-28 15:19:46', 0);
INSERT INTO `shop_log` VALUES (26, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 15:38:29', '2019-09-28 15:38:29', 0);
INSERT INTO `shop_log` VALUES (27, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 15:51:33', '2019-09-28 15:51:33', 0);
INSERT INTO `shop_log` VALUES (28, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 16:09:09', '2019-09-28 16:09:09', 0);
INSERT INTO `shop_log` VALUES (29, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 16:55:45', '2019-09-28 16:55:45', 0);
INSERT INTO `shop_log` VALUES (30, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 17:27:43', '2019-09-28 17:27:43', 0);
INSERT INTO `shop_log` VALUES (31, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 18:37:23', '2019-09-28 18:37:23', 0);
INSERT INTO `shop_log` VALUES (32, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 20:36:11', '2019-09-28 20:36:11', 0);
INSERT INTO `shop_log` VALUES (33, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 21:24:15', '2019-09-28 21:24:15', 0);
INSERT INTO `shop_log` VALUES (34, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-28 22:12:33', '2019-09-28 22:12:33', 0);
INSERT INTO `shop_log` VALUES (35, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-29 14:46:33', '2019-09-29 14:46:33', 0);
INSERT INTO `shop_log` VALUES (36, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-29 19:12:26', '2019-09-29 19:12:26', 0);
INSERT INTO `shop_log` VALUES (37, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-29 19:44:54', '2019-09-29 19:44:54', 0);
INSERT INTO `shop_log` VALUES (38, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-30 21:15:51', '2019-09-30 21:15:51', 0);
INSERT INTO `shop_log` VALUES (39, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-30 21:32:31', '2019-09-30 21:32:31', 0);
INSERT INTO `shop_log` VALUES (40, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-30 21:39:40', '2019-09-30 21:39:40', 0);
INSERT INTO `shop_log` VALUES (41, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-30 21:56:55', '2019-09-30 21:56:55', 0);
INSERT INTO `shop_log` VALUES (42, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-09-30 22:35:33', '2019-09-30 22:35:33', 0);
INSERT INTO `shop_log` VALUES (43, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 08:03:20', '2019-10-01 08:03:20', 0);
INSERT INTO `shop_log` VALUES (44, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 08:18:50', '2019-10-01 08:18:50', 0);
INSERT INTO `shop_log` VALUES (45, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 08:22:58', '2019-10-01 08:22:58', 0);
INSERT INTO `shop_log` VALUES (46, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 09:10:54', '2019-10-01 09:10:54', 0);
INSERT INTO `shop_log` VALUES (47, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 09:24:02', '2019-10-01 09:24:02', 0);
INSERT INTO `shop_log` VALUES (48, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 09:29:39', '2019-10-01 09:29:39', 0);
INSERT INTO `shop_log` VALUES (49, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 09:48:04', '2019-10-01 09:48:04', 0);
INSERT INTO `shop_log` VALUES (50, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 10:08:04', '2019-10-01 10:08:04', 0);
INSERT INTO `shop_log` VALUES (51, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 14:00:44', '2019-10-01 14:00:44', 0);
INSERT INTO `shop_log` VALUES (52, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 15:33:19', '2019-10-01 15:33:19', 0);
INSERT INTO `shop_log` VALUES (53, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 15:50:00', '2019-10-01 15:50:00', 0);
INSERT INTO `shop_log` VALUES (54, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 15:59:38', '2019-10-01 15:59:38', 0);
INSERT INTO `shop_log` VALUES (55, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 16:07:41', '2019-10-01 16:07:41', 0);
INSERT INTO `shop_log` VALUES (56, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 16:37:35', '2019-10-01 16:37:35', 0);
INSERT INTO `shop_log` VALUES (57, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 16:41:05', '2019-10-01 16:41:05', 0);
INSERT INTO `shop_log` VALUES (58, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 17:05:46', '2019-10-01 17:05:46', 0);
INSERT INTO `shop_log` VALUES (59, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 17:54:13', '2019-10-01 17:54:13', 0);
INSERT INTO `shop_log` VALUES (60, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 19:27:59', '2019-10-01 19:27:59', 0);
INSERT INTO `shop_log` VALUES (61, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 20:16:54', '2019-10-01 20:16:54', 0);
INSERT INTO `shop_log` VALUES (62, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 20:27:54', '2019-10-01 20:27:54', 0);
INSERT INTO `shop_log` VALUES (63, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 20:39:09', '2019-10-01 20:39:09', 0);
INSERT INTO `shop_log` VALUES (64, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 20:48:32', '2019-10-01 20:48:32', 0);
INSERT INTO `shop_log` VALUES (65, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 21:10:39', '2019-10-01 21:10:39', 0);
INSERT INTO `shop_log` VALUES (66, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 21:17:05', '2019-10-01 21:17:05', 0);
INSERT INTO `shop_log` VALUES (67, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 21:29:49', '2019-10-01 21:29:49', 0);
INSERT INTO `shop_log` VALUES (68, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 22:21:06', '2019-10-01 22:21:06', 0);
INSERT INTO `shop_log` VALUES (69, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-01 23:12:41', '2019-10-01 23:12:41', 0);
INSERT INTO `shop_log` VALUES (70, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 18:12:17', '2019-10-02 18:12:17', 0);
INSERT INTO `shop_log` VALUES (71, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 18:21:56', '2019-10-02 18:21:56', 0);
INSERT INTO `shop_log` VALUES (72, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 18:33:04', '2019-10-02 18:33:04', 0);
INSERT INTO `shop_log` VALUES (73, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 19:24:47', '2019-10-02 19:24:47', 0);
INSERT INTO `shop_log` VALUES (74, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 19:33:33', '2019-10-02 19:33:33', 0);
INSERT INTO `shop_log` VALUES (75, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 21:55:38', '2019-10-02 21:55:38', 0);
INSERT INTO `shop_log` VALUES (76, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 22:09:35', '2019-10-02 22:09:35', 0);
INSERT INTO `shop_log` VALUES (77, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 22:39:05', '2019-10-02 22:39:05', 0);
INSERT INTO `shop_log` VALUES (78, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-02 22:58:09', '2019-10-02 22:58:09', 0);
INSERT INTO `shop_log` VALUES (79, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-03 21:23:09', '2019-10-03 21:23:09', 0);
INSERT INTO `shop_log` VALUES (80, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-03 21:26:15', '2019-10-03 21:26:15', 0);
INSERT INTO `shop_log` VALUES (81, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-03 22:23:58', '2019-10-03 22:23:58', 0);
INSERT INTO `shop_log` VALUES (82, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-03 22:53:20', '2019-10-03 22:53:20', 0);
INSERT INTO `shop_log` VALUES (83, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-04 08:10:07', '2019-10-04 08:10:07', 0);
INSERT INTO `shop_log` VALUES (84, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-04 08:18:13', '2019-10-04 08:18:13', 0);
INSERT INTO `shop_log` VALUES (85, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-09 21:21:11', '2019-10-09 21:21:11', 0);
INSERT INTO `shop_log` VALUES (86, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-09 22:25:23', '2019-10-09 22:25:23', 0);
INSERT INTO `shop_log` VALUES (87, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-11 11:08:30', '2019-10-11 11:08:30', 0);
INSERT INTO `shop_log` VALUES (88, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-11 23:16:02', '2019-10-11 23:16:02', 0);
INSERT INTO `shop_log` VALUES (89, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 11:09:39', '2019-10-12 11:09:39', 0);
INSERT INTO `shop_log` VALUES (90, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 11:43:05', '2019-10-12 11:43:05', 0);
INSERT INTO `shop_log` VALUES (91, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 12:03:35', '2019-10-12 12:03:35', 0);
INSERT INTO `shop_log` VALUES (92, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 14:16:30', '2019-10-12 14:16:30', 0);
INSERT INTO `shop_log` VALUES (93, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 14:33:11', '2019-10-12 14:33:11', 0);
INSERT INTO `shop_log` VALUES (94, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 14:44:04', '2019-10-12 14:44:04', 0);
INSERT INTO `shop_log` VALUES (95, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 19:31:41', '2019-10-12 19:31:41', 0);
INSERT INTO `shop_log` VALUES (96, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:14:22', '2019-10-12 21:14:22', 0);
INSERT INTO `shop_log` VALUES (97, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:18:50', '2019-10-12 21:18:50', 0);
INSERT INTO `shop_log` VALUES (98, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:23:53', '2019-10-12 21:23:53', 0);
INSERT INTO `shop_log` VALUES (99, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:29:18', '2019-10-12 21:29:18', 0);
INSERT INTO `shop_log` VALUES (100, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:32:52', '2019-10-12 21:32:52', 0);
INSERT INTO `shop_log` VALUES (101, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:36:55', '2019-10-12 21:36:55', 0);
INSERT INTO `shop_log` VALUES (102, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:41:10', '2019-10-12 21:41:10', 0);
INSERT INTO `shop_log` VALUES (103, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:52:55', '2019-10-12 21:52:55', 0);
INSERT INTO `shop_log` VALUES (104, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:56:18', '2019-10-12 21:56:18', 0);
INSERT INTO `shop_log` VALUES (105, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 21:58:37', '2019-10-12 21:58:37', 0);
INSERT INTO `shop_log` VALUES (106, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 22:02:36', '2019-10-12 22:02:36', 0);
INSERT INTO `shop_log` VALUES (107, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 22:09:21', '2019-10-12 22:09:21', 0);
INSERT INTO `shop_log` VALUES (108, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 22:36:10', '2019-10-12 22:36:10', 0);
INSERT INTO `shop_log` VALUES (109, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 22:44:12', '2019-10-12 22:44:12', 0);
INSERT INTO `shop_log` VALUES (110, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 22:50:05', '2019-10-12 22:50:05', 0);
INSERT INTO `shop_log` VALUES (111, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 22:57:53', '2019-10-12 22:57:53', 0);
INSERT INTO `shop_log` VALUES (112, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-12 23:37:30', '2019-10-12 23:37:30', 0);
INSERT INTO `shop_log` VALUES (113, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 09:07:06', '2019-10-13 09:07:06', 0);
INSERT INTO `shop_log` VALUES (114, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 10:40:43', '2019-10-13 10:40:43', 0);
INSERT INTO `shop_log` VALUES (115, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 11:22:06', '2019-10-13 11:22:06', 0);
INSERT INTO `shop_log` VALUES (116, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 11:37:56', '2019-10-13 11:37:56', 0);
INSERT INTO `shop_log` VALUES (117, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 12:36:27', '2019-10-13 12:36:27', 0);
INSERT INTO `shop_log` VALUES (118, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 12:47:45', '2019-10-13 12:47:45', 0);
INSERT INTO `shop_log` VALUES (119, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 12:54:46', '2019-10-13 12:54:46', 0);
INSERT INTO `shop_log` VALUES (120, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 13:05:35', '2019-10-13 13:05:35', 0);
INSERT INTO `shop_log` VALUES (121, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 13:26:10', '2019-10-13 13:26:10', 0);
INSERT INTO `shop_log` VALUES (122, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 15:01:40', '2019-10-13 15:01:40', 0);
INSERT INTO `shop_log` VALUES (123, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-13 18:43:05', '2019-10-13 18:43:05', 0);
INSERT INTO `shop_log` VALUES (124, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-31 11:52:37', '2019-10-31 11:52:37', 0);
INSERT INTO `shop_log` VALUES (125, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-31 12:45:10', '2019-10-31 12:45:10', 0);
INSERT INTO `shop_log` VALUES (126, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-31 14:25:08', '2019-10-31 14:25:08', 0);
INSERT INTO `shop_log` VALUES (127, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-31 15:43:42', '2019-10-31 15:43:42', 0);
INSERT INTO `shop_log` VALUES (128, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-31 16:45:49', '2019-10-31 16:45:49', 0);
INSERT INTO `shop_log` VALUES (129, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-31 21:30:33', '2019-10-31 21:30:33', 0);
INSERT INTO `shop_log` VALUES (130, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-10-31 23:23:44', '2019-10-31 23:23:44', 0);
INSERT INTO `shop_log` VALUES (131, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-11-01 09:05:17', '2019-11-01 09:05:17', 0);
INSERT INTO `shop_log` VALUES (132, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-11-01 09:50:45', '2019-11-01 09:50:45', 0);
INSERT INTO `shop_log` VALUES (133, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-11-01 11:20:30', '2019-11-01 11:20:30', 0);
INSERT INTO `shop_log` VALUES (134, 'admin123', '0:0:0:0:0:0:0:1', 1, '编辑管理员', 1, 'mall123', '', '2019-11-01 11:22:08', '2019-11-01 11:22:08', 0);
INSERT INTO `shop_log` VALUES (135, 'admin123', '0:0:0:0:0:0:0:1', 1, '编辑管理员', 1, 'promotion123', '', '2019-11-01 11:22:22', '2019-11-01 11:22:22', 0);
INSERT INTO `shop_log` VALUES (136, 'admin123', '0:0:0:0:0:0:0:1', 1, '编辑管理员', 1, 'admin123', '', '2019-11-01 11:22:32', '2019-11-01 11:22:32', 0);
INSERT INTO `shop_log` VALUES (137, 'admin123', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-11-01 11:22:39', '2019-11-01 11:22:39', 0);
INSERT INTO `shop_log` VALUES (138, '匿名用户', '0:0:0:0:0:0:0:1', 1, '登录', 0, '用户帐号或密码不正确', '', '2019-11-01 11:22:41', '2019-11-01 11:22:41', 0);
INSERT INTO `shop_log` VALUES (139, '匿名用户', '0:0:0:0:0:0:0:1', 1, '登录', 0, '用户帐号或密码不正确', '', '2019-11-01 11:22:49', '2019-11-01 11:22:49', 0);
INSERT INTO `shop_log` VALUES (140, '匿名用户', '0:0:0:0:0:0:0:1', 1, '登录', 0, '用户帐号或密码不正确', '', '2019-11-01 11:22:57', '2019-11-01 11:22:57', 0);
INSERT INTO `shop_log` VALUES (141, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-11-01 11:23:06', '2019-11-01 11:23:06', 0);
INSERT INTO `shop_log` VALUES (142, 'admin123', '0:0:0:0:0:0:0:1', 1, '编辑管理员', 1, 'admin123', '', '2019-11-01 11:39:51', '2019-11-01 11:39:51', 0);
INSERT INTO `shop_log` VALUES (143, 'admin123', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-11-01 11:39:56', '2019-11-01 11:39:56', 0);
INSERT INTO `shop_log` VALUES (144, '匿名用户', '0:0:0:0:0:0:0:1', 1, '登录', 0, '用户帐号或密码不正确', '', '2019-11-01 11:40:04', '2019-11-01 11:40:04', 0);
INSERT INTO `shop_log` VALUES (145, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-11-01 11:40:11', '2019-11-01 11:40:11', 0);
INSERT INTO `shop_log` VALUES (146, 'admin123', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-11-01 11:40:35', '2019-11-01 11:40:35', 0);
INSERT INTO `shop_log` VALUES (147, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-11-01 11:40:41', '2019-11-01 11:40:41', 0);
INSERT INTO `shop_log` VALUES (148, '匿名用户', '0:0:0:0:0:0:0:1', 1, '登录', 0, '用户帐号或密码不正确', '', '2019-11-20 11:18:15', '2019-11-20 11:18:15', 0);
INSERT INTO `shop_log` VALUES (149, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-11-20 11:18:24', '2019-11-20 11:18:24', 0);
INSERT INTO `shop_log` VALUES (150, '匿名用户', '0:0:0:0:0:0:0:1', 1, '登录', 0, '用户帐号或密码不正确', '', '2019-11-20 13:48:07', '2019-11-20 13:48:07', 0);
INSERT INTO `shop_log` VALUES (151, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-11-20 13:48:11', '2019-11-20 13:48:11', 0);
INSERT INTO `shop_log` VALUES (152, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-12 15:21:10', '2019-12-12 15:21:10', 0);
INSERT INTO `shop_log` VALUES (153, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-12 15:25:57', '2019-12-12 15:25:57', 0);
INSERT INTO `shop_log` VALUES (154, '匿名用户', '0:0:0:0:0:0:0:1', 1, '登录', 0, '用户帐号或密码不正确', '', '2019-12-13 14:20:25', '2019-12-13 14:20:25', 0);
INSERT INTO `shop_log` VALUES (155, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 14:20:31', '2019-12-13 14:20:31', 0);
INSERT INTO `shop_log` VALUES (156, 'admin123', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-12-13 14:29:05', '2019-12-13 14:29:05', 0);
INSERT INTO `shop_log` VALUES (157, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 14:29:07', '2019-12-13 14:29:07', 0);
INSERT INTO `shop_log` VALUES (158, 'admin123', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-12-13 14:29:22', '2019-12-13 14:29:22', 0);
INSERT INTO `shop_log` VALUES (159, 'promotion123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 14:29:31', '2019-12-13 14:29:31', 0);
INSERT INTO `shop_log` VALUES (160, 'promotion123', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-12-13 14:29:49', '2019-12-13 14:29:49', 0);
INSERT INTO `shop_log` VALUES (161, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 14:30:00', '2019-12-13 14:30:00', 0);
INSERT INTO `shop_log` VALUES (162, 'admin123', '0:0:0:0:0:0:0:1', 1, '编辑管理员', 1, 'saler001', '', '2019-12-13 14:31:21', '2019-12-13 14:31:21', 0);
INSERT INTO `shop_log` VALUES (163, 'admin123', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-12-13 14:33:10', '2019-12-13 14:33:10', 0);
INSERT INTO `shop_log` VALUES (164, 'admin123', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 14:33:16', '2019-12-13 14:33:16', 0);
INSERT INTO `shop_log` VALUES (165, 'admin123', '0:0:0:0:0:0:0:1', 1, '删除管理员', 1, 'mall123', '', '2019-12-13 14:33:26', '2019-12-13 14:33:26', 0);
INSERT INTO `shop_log` VALUES (166, 'admin123', '0:0:0:0:0:0:0:1', 1, '编辑管理员', 1, 'admin001', '', '2019-12-13 14:33:50', '2019-12-13 14:33:50', 0);
INSERT INTO `shop_log` VALUES (167, 'admin123', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-12-13 14:33:57', '2019-12-13 14:33:57', 0);
INSERT INTO `shop_log` VALUES (168, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 14:34:08', '2019-12-13 14:34:08', 0);
INSERT INTO `shop_log` VALUES (169, 'admin001', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-12-13 14:34:41', '2019-12-13 14:34:41', 0);
INSERT INTO `shop_log` VALUES (170, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 14:35:08', '2019-12-13 14:35:08', 0);
INSERT INTO `shop_log` VALUES (171, 'admin001', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2019-12-13 14:36:15', '2019-12-13 14:36:15', 0);
INSERT INTO `shop_log` VALUES (172, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 14:36:57', '2019-12-13 14:36:57', 0);
INSERT INTO `shop_log` VALUES (173, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 15:32:11', '2019-12-13 15:32:11', 0);
INSERT INTO `shop_log` VALUES (174, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 16:08:18', '2019-12-13 16:08:18', 0);
INSERT INTO `shop_log` VALUES (175, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 16:51:20', '2019-12-13 16:51:20', 0);
INSERT INTO `shop_log` VALUES (176, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 16:53:26', '2019-12-13 16:53:26', 0);
INSERT INTO `shop_log` VALUES (177, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 17:12:26', '2019-12-13 17:12:26', 0);
INSERT INTO `shop_log` VALUES (178, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 18:37:43', '2019-12-13 18:37:43', 0);
INSERT INTO `shop_log` VALUES (179, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-13 21:35:47', '2019-12-13 21:35:47', 0);
INSERT INTO `shop_log` VALUES (180, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-15 10:26:18', '2019-12-15 10:26:18', 0);
INSERT INTO `shop_log` VALUES (181, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-15 18:56:44', '2019-12-15 18:56:44', 0);
INSERT INTO `shop_log` VALUES (182, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-15 23:15:01', '2019-12-15 23:15:01', 0);
INSERT INTO `shop_log` VALUES (183, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-16 11:05:50', '2019-12-16 11:05:50', 0);
INSERT INTO `shop_log` VALUES (184, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-16 14:34:56', '2019-12-16 14:34:56', 0);
INSERT INTO `shop_log` VALUES (185, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-16 17:51:54', '2019-12-16 17:51:54', 0);
INSERT INTO `shop_log` VALUES (186, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-16 21:39:11', '2019-12-16 21:39:11', 0);
INSERT INTO `shop_log` VALUES (187, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-17 10:21:00', '2019-12-17 10:21:00', 0);
INSERT INTO `shop_log` VALUES (188, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-17 12:03:48', '2019-12-17 12:03:48', 0);
INSERT INTO `shop_log` VALUES (189, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-17 12:11:17', '2019-12-17 12:11:17', 0);
INSERT INTO `shop_log` VALUES (190, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-17 13:28:33', '2019-12-17 13:28:33', 0);
INSERT INTO `shop_log` VALUES (191, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-17 19:02:36', '2019-12-17 19:02:36', 0);
INSERT INTO `shop_log` VALUES (192, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2019-12-17 22:43:58', '2019-12-17 22:43:58', 0);
INSERT INTO `shop_log` VALUES (193, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2020-01-14 09:45:37', '2020-01-14 09:45:37', 0);
INSERT INTO `shop_log` VALUES (194, 'admin001', '0:0:0:0:0:0:0:1', 1, '退出', 1, '', '', '2020-01-14 10:01:08', '2020-01-14 10:01:08', 0);
INSERT INTO `shop_log` VALUES (195, 'admin001', '0:0:0:0:0:0:0:1', 1, '登录', 1, '', '', '2020-01-14 10:01:14', '2020-01-14 10:01:14', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
  `order_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `order_status` smallint(6) NOT NULL COMMENT '订单状态',
  `consignee` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人名称',
  `mobile` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货人手机号',
  `address` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收货具体地址',
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户订单留言',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品总费用',
  `freight_price` decimal(10,2) NOT NULL COMMENT '配送费用',
  `integral_price` decimal(10,2) NOT NULL COMMENT '用户积分减免',
  `order_price` decimal(10,2) NOT NULL COMMENT '订单费用， = goods_price + freight_price - coupon_price',
  `actual_price` decimal(10,2) NOT NULL COMMENT '实付费用， = order_price - integral_price',
  `pay_id` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信付款编号',
  `pay_time` datetime DEFAULT NULL COMMENT '微信付款时间',
  `ship_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发货编号',
  `ship_channel` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发货快递公司',
  `ship_time` datetime DEFAULT NULL COMMENT '发货开始时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '用户确认收货时间',
  `comments` smallint(6) DEFAULT '0' COMMENT '待评价订单商品数量',
  `end_time` datetime DEFAULT NULL COMMENT '订单关闭时间',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单表';

-- ----------------------------
-- Records of shop_order
-- ----------------------------
BEGIN;
INSERT INTO `shop_order` VALUES (18, 3, '20191031488104', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 88.00, 0.00, 0.00, 88.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-10-31 13:01:06', '2019-10-31 13:01:06', 0);
INSERT INTO `shop_order` VALUES (19, 3, '20191101407208', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-11-01 09:18:35', '2019-11-01 09:18:35', 0);
INSERT INTO `shop_order` VALUES (20, 3, '20191101316085', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', 'test test test order', 198.00, 0.00, 0.00, 198.00, 198.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-11-01 09:40:25', '2019-11-01 09:40:25', 0);
INSERT INTO `shop_order` VALUES (21, 3, '20191101811262', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 1164.00, 0.00, 0.00, 1164.00, 1164.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-11-01 09:41:54', '2019-11-01 09:41:54', 0);
INSERT INTO `shop_order` VALUES (22, 3, '20191101912514', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 464.00, 0.00, 0.00, 464.00, 464.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-11-01 09:51:58', '2019-11-01 09:51:58', 0);
INSERT INTO `shop_order` VALUES (23, 3, '20191101134616', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-11-01 10:02:34', '2019-11-01 10:02:34', 0);
INSERT INTO `shop_order` VALUES (24, 3, '20191101322091', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 473.00, 0.00, 0.00, 473.00, 473.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-11-01 10:03:10', '2019-11-01 10:03:10', 0);
INSERT INTO `shop_order` VALUES (25, 3, '20191101492633', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-11-01 10:04:27', '2019-11-01 10:04:27', 0);
INSERT INTO `shop_order` VALUES (26, 3, '20191101468648', 102, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 1164.00, 0.00, 0.00, 1164.00, 1164.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-12-12 17:40:40', '2019-11-01 10:11:56', '2019-12-12 17:40:40', 0);
INSERT INTO `shop_order` VALUES (27, 3, '20191101041098', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 198.00, 0.00, 0.00, 198.00, 198.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-11-01 10:21:41', '2019-11-01 10:21:41', 0);
INSERT INTO `shop_order` VALUES (28, 3, '20191213350122', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-13 11:56:35', '2019-12-13 11:56:35', 0);
INSERT INTO `shop_order` VALUES (29, 3, '20191213466490', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 88.00, 0.00, 0.00, 88.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-13 12:08:13', '2019-12-13 12:08:13', 0);
INSERT INTO `shop_order` VALUES (30, 3, '20191213925386', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 99.00, 0.00, 0.00, 99.00, 99.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-13 12:14:14', '2019-12-13 12:14:14', 0);
INSERT INTO `shop_order` VALUES (31, 5, '20191213681580', 101, 'kkkk', '18871009922', '北京市北京城区朝阳区 909', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-13 17:54:43', '2019-12-13 17:54:43', 0);
INSERT INTO `shop_order` VALUES (32, 6, '20191213153296', 101, 'xuan', '15555555555', '江苏省南京市玄武区 555', '', 99.00, 0.00, 0.00, 99.00, 99.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-13 17:57:25', '2019-12-13 17:57:25', 0);
INSERT INTO `shop_order` VALUES (33, 3, '20191215341588', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-15 11:12:18', '2019-12-15 11:12:18', 0);
INSERT INTO `shop_order` VALUES (34, 3, '20191215961988', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 99.00, 0.00, 0.00, 99.00, 99.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-15 13:03:26', '2019-12-15 13:03:26', 0);
INSERT INTO `shop_order` VALUES (35, 3, '20191215887354', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-15 18:56:27', '2019-12-15 18:56:27', 0);
INSERT INTO `shop_order` VALUES (36, 5, '20191215570240', 101, 'kkkk', '18871009922', '北京市北京城区朝阳区 909', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-15 23:13:15', '2019-12-15 23:13:15', 0);
INSERT INTO `shop_order` VALUES (37, 3, '20191216809773', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 88.00, 0.00, 0.00, 88.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-16 10:17:41', '2019-12-16 10:17:41', 0);
INSERT INTO `shop_order` VALUES (38, 3, '20191216007758', 101, 'ssss', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 99.00, 0.00, 0.00, 99.00, 99.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-16 12:10:02', '2019-12-16 12:10:02', 0);
INSERT INTO `shop_order` VALUES (39, 3, '20191217993371', 101, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 187.00, 0.00, 0.00, 187.00, 187.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-17 08:59:30', '2019-12-17 08:59:30', 0);
INSERT INTO `shop_order` VALUES (40, 3, '20191217276059', 101, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 99.00, 0.00, 0.00, 99.00, 99.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-17 17:45:05', '2019-12-17 17:45:05', 0);
INSERT INTO `shop_order` VALUES (41, 3, '20191217089575', 101, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 487.00, 0.00, 0.00, 487.00, 487.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-17 17:49:02', '2019-12-17 17:49:02', 0);
INSERT INTO `shop_order` VALUES (42, 3, '20191217137371', 101, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 99.00, 0.00, 0.00, 99.00, 99.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-17 22:37:13', '2019-12-17 22:37:13', 0);
INSERT INTO `shop_order` VALUES (43, 3, '20191220629866', 101, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 385.00, 0.00, 0.00, 385.00, 385.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-20 18:23:01', '2019-12-20 18:23:01', 0);
INSERT INTO `shop_order` VALUES (44, 3, '20191222209521', 101, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 388.00, 0.00, 0.00, 388.00, 388.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-22 12:30:44', '2019-12-22 12:30:44', 0);
INSERT INTO `shop_order` VALUES (45, 3, '20191223964838', 101, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', 'good', 88.00, 0.00, 0.00, 88.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-23 10:37:11', '2019-12-23 10:37:11', 0);
INSERT INTO `shop_order` VALUES (46, 3, '20191223765045', 101, 'Jennifer', '18873009900', '北京市北京城区东城区 888', '', 275.00, 0.00, 0.00, 275.00, 275.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-12-23 11:50:27', '2019-12-23 11:50:27', 0);
INSERT INTO `shop_order` VALUES (47, 3, '20191224282457', 102, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 88.00, 0.00, 0.00, 88.00, 88.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-12-24 13:55:32', '2019-12-24 13:55:26', '2019-12-24 13:55:32', 0);
INSERT INTO `shop_order` VALUES (48, 3, '20200114466408', 101, 'xiaowang', '18871002288', '天津市天津城区东丽区 xxxxxx', '', 99.00, 0.00, 0.00, 99.00, 99.00, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2020-01-14 09:53:15', '2020-01-14 09:53:15', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `shop_order_goods`;
CREATE TABLE `shop_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单表的订单ID',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品表的商品ID',
  `goods_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品货品表的货品ID',
  `number` smallint(5) NOT NULL DEFAULT '0' COMMENT '商品货品的购买数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品货品的售价',
  `specifications` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品货品的规格列表',
  `pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品货品图片或者商品图片',
  `comment` int(11) DEFAULT '0' COMMENT '订单商品评论，如果是-1，则超期不能评价；如果是0，则可以评价；如果其他值，则是comment表里面的评论ID。',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='订单商品表';

-- ----------------------------
-- Records of shop_order_goods
-- ----------------------------
BEGIN;
INSERT INTO `shop_order_goods` VALUES (22, 18, 1181004, '印花连衣裙', '100001', 257, 1, 88.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', 0, '2019-10-31 13:01:06', '2019-10-31 13:01:06', 0);
INSERT INTO `shop_order_goods` VALUES (23, 19, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-11-01 09:18:35', '2019-11-01 09:18:35', 0);
INSERT INTO `shop_order_goods` VALUES (24, 20, 1181006, '小西装女外套', '100003', 278, 2, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-11-01 09:40:25', '2019-11-01 09:40:25', 0);
INSERT INTO `shop_order_goods` VALUES (25, 21, 1181007, '羊皮衣真皮外套', '100004', 279, 3, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-11-01 09:41:54', '2019-11-01 09:41:54', 0);
INSERT INTO `shop_order_goods` VALUES (26, 22, 1181004, '印花连衣裙', '100001', 259, 2, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', 0, '2019-11-01 09:51:58', '2019-11-01 09:51:58', 0);
INSERT INTO `shop_order_goods` VALUES (27, 22, 1181005, '女短款白外套', '100002', 265, 1, 288.00, '[\"M\",\"S\"]', 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', 0, '2019-11-01 09:51:58', '2019-11-01 09:51:58', 0);
INSERT INTO `shop_order_goods` VALUES (28, 23, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-11-01 10:02:34', '2019-11-01 10:02:34', 0);
INSERT INTO `shop_order_goods` VALUES (29, 24, 1181005, '女短款白外套', '100002', 273, 1, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', 0, '2019-11-01 10:03:10', '2019-11-01 10:03:10', 0);
INSERT INTO `shop_order_goods` VALUES (30, 24, 1181006, '小西装女外套', '100003', 278, 3, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-11-01 10:03:10', '2019-11-01 10:03:10', 0);
INSERT INTO `shop_order_goods` VALUES (31, 24, 1181004, '印花连衣裙', '100001', 259, 1, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', 0, '2019-11-01 10:03:10', '2019-11-01 10:03:10', 0);
INSERT INTO `shop_order_goods` VALUES (32, 25, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-11-01 10:04:27', '2019-11-01 10:04:27', 0);
INSERT INTO `shop_order_goods` VALUES (33, 26, 1181007, '羊皮衣真皮外套', '100004', 279, 3, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-11-01 10:11:56', '2019-11-01 10:11:56', 0);
INSERT INTO `shop_order_goods` VALUES (34, 27, 1181006, '小西装女外套', '100003', 278, 2, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-11-01 10:21:41', '2019-11-01 10:21:41', 0);
INSERT INTO `shop_order_goods` VALUES (35, 28, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-12-13 11:56:35', '2019-12-13 11:56:35', 0);
INSERT INTO `shop_order_goods` VALUES (36, 29, 1181005, '女短款白外套', '100002', 273, 1, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', 0, '2019-12-13 12:08:13', '2019-12-13 12:08:13', 0);
INSERT INTO `shop_order_goods` VALUES (37, 30, 1181006, '小西装女外套', '100003', 278, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-13 12:14:14', '2019-12-13 12:14:14', 0);
INSERT INTO `shop_order_goods` VALUES (38, 31, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-12-13 17:54:43', '2019-12-13 17:54:43', 0);
INSERT INTO `shop_order_goods` VALUES (39, 32, 1181006, '小西装女外套', '100003', 280, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-13 17:57:25', '2019-12-13 17:57:25', 0);
INSERT INTO `shop_order_goods` VALUES (40, 33, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-12-15 11:12:18', '2019-12-15 11:12:18', 0);
INSERT INTO `shop_order_goods` VALUES (41, 34, 1181006, '小西装女外套', '100003', 280, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-15 13:03:26', '2019-12-15 13:03:26', 0);
INSERT INTO `shop_order_goods` VALUES (42, 35, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-12-15 18:56:27', '2019-12-15 18:56:27', 0);
INSERT INTO `shop_order_goods` VALUES (43, 36, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-12-15 23:13:15', '2019-12-15 23:13:15', 0);
INSERT INTO `shop_order_goods` VALUES (44, 37, 1181004, '印花连衣裙', '100001', 281, 1, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', 0, '2019-12-16 10:17:41', '2019-12-16 10:17:41', 0);
INSERT INTO `shop_order_goods` VALUES (45, 38, 1181006, '小西装女外套', '100003', 283, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-16 12:10:02', '2019-12-16 12:10:02', 0);
INSERT INTO `shop_order_goods` VALUES (46, 39, 1181005, '女短款白外套', '100002', 273, 1, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', 0, '2019-12-17 08:59:30', '2019-12-17 08:59:30', 0);
INSERT INTO `shop_order_goods` VALUES (47, 39, 1181006, '小西装女外套', '100003', 283, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-17 08:59:30', '2019-12-17 08:59:30', 0);
INSERT INTO `shop_order_goods` VALUES (48, 40, 1181006, '小西装女外套', '100003', 283, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-17 17:45:05', '2019-12-17 17:45:05', 0);
INSERT INTO `shop_order_goods` VALUES (49, 41, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-12-17 17:49:02', '2019-12-17 17:49:02', 0);
INSERT INTO `shop_order_goods` VALUES (50, 41, 1181006, '小西装女外套', '100003', 283, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-17 17:49:02', '2019-12-17 17:49:02', 0);
INSERT INTO `shop_order_goods` VALUES (51, 42, 1181006, '小西装女外套', '100003', 283, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-17 22:37:13', '2019-12-17 22:37:13', 0);
INSERT INTO `shop_order_goods` VALUES (52, 43, 1181006, '小西装女外套', '100003', 283, 3, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-20 18:23:01', '2019-12-20 18:23:01', 0);
INSERT INTO `shop_order_goods` VALUES (53, 43, 1181004, '印花连衣裙', '100001', 281, 1, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', 0, '2019-12-20 18:23:01', '2019-12-20 18:23:01', 0);
INSERT INTO `shop_order_goods` VALUES (54, 44, 1181007, '羊皮衣真皮外套', '100004', 279, 1, 388.00, '[\"标准\"]', 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', 0, '2019-12-22 12:30:44', '2019-12-22 12:30:44', 0);
INSERT INTO `shop_order_goods` VALUES (55, 45, 1181005, '女短款白外套', '100002', 273, 1, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', 0, '2019-12-23 10:37:11', '2019-12-23 10:37:11', 0);
INSERT INTO `shop_order_goods` VALUES (56, 46, 1181004, '印花连衣裙', '100001', 281, 2, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', 0, '2019-12-23 11:50:27', '2019-12-23 11:50:27', 0);
INSERT INTO `shop_order_goods` VALUES (57, 46, 1181006, '小西装女外套', '100003', 283, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2019-12-23 11:50:27', '2019-12-23 11:50:27', 0);
INSERT INTO `shop_order_goods` VALUES (58, 47, 1181004, '印花连衣裙', '100001', 281, 1, 88.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', 0, '2019-12-24 13:55:26', '2019-12-24 13:55:26', 0);
INSERT INTO `shop_order_goods` VALUES (59, 48, 1181006, '小西装女外套', '100003', 283, 1, 99.00, '[\"标准\",\"大码\"]', 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', 0, '2020-01-14 09:53:15', '2020-01-14 09:53:15', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_permission
-- ----------------------------
DROP TABLE IF EXISTS `shop_permission`;
CREATE TABLE `shop_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `permission` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='权限表';

-- ----------------------------
-- Records of shop_permission
-- ----------------------------
BEGIN;
INSERT INTO `shop_permission` VALUES (1, 1, '*', '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0);
INSERT INTO `shop_permission` VALUES (2, 2, 'admin:category:read', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (3, 2, 'admin:category:update', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (4, 2, 'admin:category:delete', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (5, 2, 'admin:category:create', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (6, 2, 'admin:category:list', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (7, 2, 'admin:brand:create', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (8, 2, 'admin:brand:list', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (9, 2, 'admin:brand:delete', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (10, 2, 'admin:brand:read', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (11, 2, 'admin:brand:update', '2019-01-07 15:18:53', '2019-01-07 15:18:53', 0);
INSERT INTO `shop_permission` VALUES (12, 3, 'admin:ad:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (13, 3, 'admin:ad:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (14, 3, 'admin:ad:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (15, 3, 'admin:ad:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (16, 3, 'admin:ad:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (17, 3, 'admin:groupon:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (18, 3, 'admin:groupon:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (19, 3, 'admin:groupon:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (20, 3, 'admin:groupon:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (21, 3, 'admin:groupon:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (22, 3, 'admin:topic:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (23, 3, 'admin:topic:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (24, 3, 'admin:topic:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (25, 3, 'admin:topic:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (26, 3, 'admin:topic:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (27, 3, 'admin:coupon:list', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (28, 3, 'admin:coupon:delete', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (29, 3, 'admin:coupon:read', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (30, 3, 'admin:coupon:create', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (31, 3, 'admin:coupon:update', '2019-01-07 15:18:57', '2019-01-07 15:18:57', 1);
INSERT INTO `shop_permission` VALUES (32, 10, 'admin:config:wx:updateConfigs', '2019-10-02 22:40:29', '2019-10-02 22:40:29', 0);
INSERT INTO `shop_permission` VALUES (33, 10, 'admin:config:wx:list', '2019-10-02 22:40:29', '2019-10-02 22:40:29', 0);
INSERT INTO `shop_permission` VALUES (34, 10, 'admin:config:mall:list', '2019-10-02 22:40:29', '2019-10-02 22:40:29', 0);
INSERT INTO `shop_permission` VALUES (35, 10, 'admin:config:mall:updateConfigs', '2019-10-02 22:40:29', '2019-10-02 22:40:29', 0);
INSERT INTO `shop_permission` VALUES (36, 10, 'admin:config:order:list', '2019-10-02 22:40:29', '2019-10-02 22:40:29', 0);
INSERT INTO `shop_permission` VALUES (37, 10, 'admin:config:order:updateConfigs', '2019-10-02 22:40:29', '2019-10-02 22:40:29', 0);
INSERT INTO `shop_permission` VALUES (38, 10, 'admin:config:express:list', '2019-10-02 22:40:29', '2019-10-02 22:40:29', 0);
INSERT INTO `shop_permission` VALUES (39, 10, 'admin:config:express:updateConfigs', '2019-10-02 22:40:29', '2019-10-02 22:40:29', 0);
INSERT INTO `shop_permission` VALUES (40, 3, 'admin:ad:update', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (41, 3, 'admin:ad:read', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (42, 3, 'admin:ad:delete', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (43, 3, 'admin:ad:create', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (44, 3, 'admin:ad:list', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (45, 3, 'admin:goods:update', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (46, 3, 'admin:goods:delete', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (47, 3, 'admin:goods:create', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (48, 3, 'admin:goods:list', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
INSERT INTO `shop_permission` VALUES (49, 3, 'admin:goods:read', '2019-12-13 14:35:53', '2019-12-13 14:35:53', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_region
-- ----------------------------
DROP TABLE IF EXISTS `shop_region`;
CREATE TABLE `shop_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域父ID，例如区县的pid指向市，市的pid指向省，省的pid则是0',
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '行政区域名称',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '行政区域类型，如如1则是省， 如果是2则是市，如果是3则是区县',
  `code` int(11) NOT NULL DEFAULT '0' COMMENT '行政区域编码',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`),
  KEY `region_type` (`type`),
  KEY `agency_id` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='行政区域表';

-- ----------------------------
-- Records of shop_region
-- ----------------------------
BEGIN;
INSERT INTO `shop_region` VALUES (1, 0, '北京市', 1, 110000);
INSERT INTO `shop_region` VALUES (2, 0, '天津市', 1, 120000);
INSERT INTO `shop_region` VALUES (3, 0, '河北省', 1, 130000);
INSERT INTO `shop_region` VALUES (4, 0, '山西省', 1, 140000);
INSERT INTO `shop_region` VALUES (5, 0, '内蒙古自治区', 1, 150000);
INSERT INTO `shop_region` VALUES (6, 0, '辽宁省', 1, 210000);
INSERT INTO `shop_region` VALUES (7, 0, '吉林省', 1, 220000);
INSERT INTO `shop_region` VALUES (8, 0, '黑龙江省', 1, 230000);
INSERT INTO `shop_region` VALUES (9, 0, '上海市', 1, 310000);
INSERT INTO `shop_region` VALUES (10, 0, '江苏省', 1, 320000);
INSERT INTO `shop_region` VALUES (11, 0, '浙江省', 1, 330000);
INSERT INTO `shop_region` VALUES (12, 0, '安徽省', 1, 340000);
INSERT INTO `shop_region` VALUES (13, 0, '福建省', 1, 350000);
INSERT INTO `shop_region` VALUES (14, 0, '江西省', 1, 360000);
INSERT INTO `shop_region` VALUES (15, 0, '山东省', 1, 370000);
INSERT INTO `shop_region` VALUES (16, 0, '河南省', 1, 410000);
INSERT INTO `shop_region` VALUES (17, 0, '湖北省', 1, 420000);
INSERT INTO `shop_region` VALUES (18, 0, '湖南省', 1, 430000);
INSERT INTO `shop_region` VALUES (19, 0, '广东省', 1, 440000);
INSERT INTO `shop_region` VALUES (20, 0, '广西壮族自治区', 1, 450000);
INSERT INTO `shop_region` VALUES (21, 0, '海南省', 1, 460000);
INSERT INTO `shop_region` VALUES (22, 0, '重庆市', 1, 500000);
INSERT INTO `shop_region` VALUES (23, 0, '四川省', 1, 510000);
INSERT INTO `shop_region` VALUES (24, 0, '贵州省', 1, 520000);
INSERT INTO `shop_region` VALUES (25, 0, '云南省', 1, 530000);
INSERT INTO `shop_region` VALUES (26, 0, '西藏自治区', 1, 540000);
INSERT INTO `shop_region` VALUES (27, 0, '陕西省', 1, 610000);
INSERT INTO `shop_region` VALUES (28, 0, '甘肃省', 1, 620000);
INSERT INTO `shop_region` VALUES (29, 0, '青海省', 1, 630000);
INSERT INTO `shop_region` VALUES (30, 0, '宁夏回族自治区', 1, 640000);
INSERT INTO `shop_region` VALUES (31, 0, '新疆维吾尔自治区', 1, 650000);
INSERT INTO `shop_region` VALUES (32, 1, '市辖区', 2, 110100);
INSERT INTO `shop_region` VALUES (33, 2, '市辖区', 2, 120100);
INSERT INTO `shop_region` VALUES (34, 3, '石家庄市', 2, 130100);
INSERT INTO `shop_region` VALUES (35, 3, '唐山市', 2, 130200);
INSERT INTO `shop_region` VALUES (36, 3, '秦皇岛市', 2, 130300);
INSERT INTO `shop_region` VALUES (37, 3, '邯郸市', 2, 130400);
INSERT INTO `shop_region` VALUES (38, 3, '邢台市', 2, 130500);
INSERT INTO `shop_region` VALUES (39, 3, '保定市', 2, 130600);
INSERT INTO `shop_region` VALUES (40, 3, '张家口市', 2, 130700);
INSERT INTO `shop_region` VALUES (41, 3, '承德市', 2, 130800);
INSERT INTO `shop_region` VALUES (42, 3, '沧州市', 2, 130900);
INSERT INTO `shop_region` VALUES (43, 3, '廊坊市', 2, 131000);
INSERT INTO `shop_region` VALUES (44, 3, '衡水市', 2, 131100);
INSERT INTO `shop_region` VALUES (45, 3, '省直辖县级行政区划', 2, 139000);
INSERT INTO `shop_region` VALUES (46, 4, '太原市', 2, 140100);
INSERT INTO `shop_region` VALUES (47, 4, '大同市', 2, 140200);
INSERT INTO `shop_region` VALUES (48, 4, '阳泉市', 2, 140300);
INSERT INTO `shop_region` VALUES (49, 4, '长治市', 2, 140400);
INSERT INTO `shop_region` VALUES (50, 4, '晋城市', 2, 140500);
INSERT INTO `shop_region` VALUES (51, 4, '朔州市', 2, 140600);
INSERT INTO `shop_region` VALUES (52, 4, '晋中市', 2, 140700);
INSERT INTO `shop_region` VALUES (53, 4, '运城市', 2, 140800);
INSERT INTO `shop_region` VALUES (54, 4, '忻州市', 2, 140900);
INSERT INTO `shop_region` VALUES (55, 4, '临汾市', 2, 141000);
INSERT INTO `shop_region` VALUES (56, 4, '吕梁市', 2, 141100);
INSERT INTO `shop_region` VALUES (57, 5, '呼和浩特市', 2, 150100);
INSERT INTO `shop_region` VALUES (58, 5, '包头市', 2, 150200);
INSERT INTO `shop_region` VALUES (59, 5, '乌海市', 2, 150300);
INSERT INTO `shop_region` VALUES (60, 5, '赤峰市', 2, 150400);
INSERT INTO `shop_region` VALUES (61, 5, '通辽市', 2, 150500);
INSERT INTO `shop_region` VALUES (62, 5, '鄂尔多斯市', 2, 150600);
INSERT INTO `shop_region` VALUES (63, 5, '呼伦贝尔市', 2, 150700);
INSERT INTO `shop_region` VALUES (64, 5, '巴彦淖尔市', 2, 150800);
INSERT INTO `shop_region` VALUES (65, 5, '乌兰察布市', 2, 150900);
INSERT INTO `shop_region` VALUES (66, 5, '兴安盟', 2, 152200);
INSERT INTO `shop_region` VALUES (67, 5, '锡林郭勒盟', 2, 152500);
INSERT INTO `shop_region` VALUES (68, 5, '阿拉善盟', 2, 152900);
INSERT INTO `shop_region` VALUES (69, 6, '沈阳市', 2, 210100);
INSERT INTO `shop_region` VALUES (70, 6, '大连市', 2, 210200);
INSERT INTO `shop_region` VALUES (71, 6, '鞍山市', 2, 210300);
INSERT INTO `shop_region` VALUES (72, 6, '抚顺市', 2, 210400);
INSERT INTO `shop_region` VALUES (73, 6, '本溪市', 2, 210500);
INSERT INTO `shop_region` VALUES (74, 6, '丹东市', 2, 210600);
INSERT INTO `shop_region` VALUES (75, 6, '锦州市', 2, 210700);
INSERT INTO `shop_region` VALUES (76, 6, '营口市', 2, 210800);
INSERT INTO `shop_region` VALUES (77, 6, '阜新市', 2, 210900);
INSERT INTO `shop_region` VALUES (78, 6, '辽阳市', 2, 211000);
INSERT INTO `shop_region` VALUES (79, 6, '盘锦市', 2, 211100);
INSERT INTO `shop_region` VALUES (80, 6, '铁岭市', 2, 211200);
INSERT INTO `shop_region` VALUES (81, 6, '朝阳市', 2, 211300);
INSERT INTO `shop_region` VALUES (82, 6, '葫芦岛市', 2, 211400);
INSERT INTO `shop_region` VALUES (83, 7, '长春市', 2, 220100);
INSERT INTO `shop_region` VALUES (84, 7, '吉林市', 2, 220200);
INSERT INTO `shop_region` VALUES (85, 7, '四平市', 2, 220300);
INSERT INTO `shop_region` VALUES (86, 7, '辽源市', 2, 220400);
INSERT INTO `shop_region` VALUES (87, 7, '通化市', 2, 220500);
INSERT INTO `shop_region` VALUES (88, 7, '白山市', 2, 220600);
INSERT INTO `shop_region` VALUES (89, 7, '松原市', 2, 220700);
INSERT INTO `shop_region` VALUES (90, 7, '白城市', 2, 220800);
INSERT INTO `shop_region` VALUES (91, 7, '延边朝鲜族自治州', 2, 222400);
INSERT INTO `shop_region` VALUES (92, 8, '哈尔滨市', 2, 230100);
INSERT INTO `shop_region` VALUES (93, 8, '齐齐哈尔市', 2, 230200);
INSERT INTO `shop_region` VALUES (94, 8, '鸡西市', 2, 230300);
INSERT INTO `shop_region` VALUES (95, 8, '鹤岗市', 2, 230400);
INSERT INTO `shop_region` VALUES (96, 8, '双鸭山市', 2, 230500);
INSERT INTO `shop_region` VALUES (97, 8, '大庆市', 2, 230600);
INSERT INTO `shop_region` VALUES (98, 8, '伊春市', 2, 230700);
INSERT INTO `shop_region` VALUES (99, 8, '佳木斯市', 2, 230800);
INSERT INTO `shop_region` VALUES (100, 8, '七台河市', 2, 230900);
INSERT INTO `shop_region` VALUES (101, 8, '牡丹江市', 2, 231000);
INSERT INTO `shop_region` VALUES (102, 8, '黑河市', 2, 231100);
INSERT INTO `shop_region` VALUES (103, 8, '绥化市', 2, 231200);
INSERT INTO `shop_region` VALUES (104, 8, '大兴安岭地区', 2, 232700);
INSERT INTO `shop_region` VALUES (105, 9, '市辖区', 2, 310100);
INSERT INTO `shop_region` VALUES (106, 10, '南京市', 2, 320100);
INSERT INTO `shop_region` VALUES (107, 10, '无锡市', 2, 320200);
INSERT INTO `shop_region` VALUES (108, 10, '徐州市', 2, 320300);
INSERT INTO `shop_region` VALUES (109, 10, '常州市', 2, 320400);
INSERT INTO `shop_region` VALUES (110, 10, '苏州市', 2, 320500);
INSERT INTO `shop_region` VALUES (111, 10, '南通市', 2, 320600);
INSERT INTO `shop_region` VALUES (112, 10, '连云港市', 2, 320700);
INSERT INTO `shop_region` VALUES (113, 10, '淮安市', 2, 320800);
INSERT INTO `shop_region` VALUES (114, 10, '盐城市', 2, 320900);
INSERT INTO `shop_region` VALUES (115, 10, '扬州市', 2, 321000);
INSERT INTO `shop_region` VALUES (116, 10, '镇江市', 2, 321100);
INSERT INTO `shop_region` VALUES (117, 10, '泰州市', 2, 321200);
INSERT INTO `shop_region` VALUES (118, 10, '宿迁市', 2, 321300);
INSERT INTO `shop_region` VALUES (119, 11, '杭州市', 2, 330100);
INSERT INTO `shop_region` VALUES (120, 11, '宁波市', 2, 330200);
INSERT INTO `shop_region` VALUES (121, 11, '温州市', 2, 330300);
INSERT INTO `shop_region` VALUES (122, 11, '嘉兴市', 2, 330400);
INSERT INTO `shop_region` VALUES (123, 11, '湖州市', 2, 330500);
INSERT INTO `shop_region` VALUES (124, 11, '绍兴市', 2, 330600);
INSERT INTO `shop_region` VALUES (125, 11, '金华市', 2, 330700);
INSERT INTO `shop_region` VALUES (126, 11, '衢州市', 2, 330800);
INSERT INTO `shop_region` VALUES (127, 11, '舟山市', 2, 330900);
INSERT INTO `shop_region` VALUES (128, 11, '台州市', 2, 331000);
INSERT INTO `shop_region` VALUES (129, 11, '丽水市', 2, 331100);
INSERT INTO `shop_region` VALUES (130, 12, '合肥市', 2, 340100);
INSERT INTO `shop_region` VALUES (131, 12, '芜湖市', 2, 340200);
INSERT INTO `shop_region` VALUES (132, 12, '蚌埠市', 2, 340300);
INSERT INTO `shop_region` VALUES (133, 12, '淮南市', 2, 340400);
INSERT INTO `shop_region` VALUES (134, 12, '马鞍山市', 2, 340500);
INSERT INTO `shop_region` VALUES (135, 12, '淮北市', 2, 340600);
INSERT INTO `shop_region` VALUES (136, 12, '铜陵市', 2, 340700);
INSERT INTO `shop_region` VALUES (137, 12, '安庆市', 2, 340800);
INSERT INTO `shop_region` VALUES (138, 12, '黄山市', 2, 341000);
INSERT INTO `shop_region` VALUES (139, 12, '滁州市', 2, 341100);
INSERT INTO `shop_region` VALUES (140, 12, '阜阳市', 2, 341200);
INSERT INTO `shop_region` VALUES (141, 12, '宿州市', 2, 341300);
INSERT INTO `shop_region` VALUES (142, 12, '六安市', 2, 341500);
INSERT INTO `shop_region` VALUES (143, 12, '亳州市', 2, 341600);
INSERT INTO `shop_region` VALUES (144, 12, '池州市', 2, 341700);
INSERT INTO `shop_region` VALUES (145, 12, '宣城市', 2, 341800);
INSERT INTO `shop_region` VALUES (146, 13, '福州市', 2, 350100);
INSERT INTO `shop_region` VALUES (147, 13, '厦门市', 2, 350200);
INSERT INTO `shop_region` VALUES (148, 13, '莆田市', 2, 350300);
INSERT INTO `shop_region` VALUES (149, 13, '三明市', 2, 350400);
INSERT INTO `shop_region` VALUES (150, 13, '泉州市', 2, 350500);
INSERT INTO `shop_region` VALUES (151, 13, '漳州市', 2, 350600);
INSERT INTO `shop_region` VALUES (152, 13, '南平市', 2, 350700);
INSERT INTO `shop_region` VALUES (153, 13, '龙岩市', 2, 350800);
INSERT INTO `shop_region` VALUES (154, 13, '宁德市', 2, 350900);
INSERT INTO `shop_region` VALUES (155, 14, '南昌市', 2, 360100);
INSERT INTO `shop_region` VALUES (156, 14, '景德镇市', 2, 360200);
INSERT INTO `shop_region` VALUES (157, 14, '萍乡市', 2, 360300);
INSERT INTO `shop_region` VALUES (158, 14, '九江市', 2, 360400);
INSERT INTO `shop_region` VALUES (159, 14, '新余市', 2, 360500);
INSERT INTO `shop_region` VALUES (160, 14, '鹰潭市', 2, 360600);
INSERT INTO `shop_region` VALUES (161, 14, '赣州市', 2, 360700);
INSERT INTO `shop_region` VALUES (162, 14, '吉安市', 2, 360800);
INSERT INTO `shop_region` VALUES (163, 14, '宜春市', 2, 360900);
INSERT INTO `shop_region` VALUES (164, 14, '抚州市', 2, 361000);
INSERT INTO `shop_region` VALUES (165, 14, '上饶市', 2, 361100);
INSERT INTO `shop_region` VALUES (166, 15, '济南市', 2, 370100);
INSERT INTO `shop_region` VALUES (167, 15, '青岛市', 2, 370200);
INSERT INTO `shop_region` VALUES (168, 15, '淄博市', 2, 370300);
INSERT INTO `shop_region` VALUES (169, 15, '枣庄市', 2, 370400);
INSERT INTO `shop_region` VALUES (170, 15, '东营市', 2, 370500);
INSERT INTO `shop_region` VALUES (171, 15, '烟台市', 2, 370600);
INSERT INTO `shop_region` VALUES (172, 15, '潍坊市', 2, 370700);
INSERT INTO `shop_region` VALUES (173, 15, '济宁市', 2, 370800);
INSERT INTO `shop_region` VALUES (174, 15, '泰安市', 2, 370900);
INSERT INTO `shop_region` VALUES (175, 15, '威海市', 2, 371000);
INSERT INTO `shop_region` VALUES (176, 15, '日照市', 2, 371100);
INSERT INTO `shop_region` VALUES (177, 15, '莱芜市', 2, 371200);
INSERT INTO `shop_region` VALUES (178, 15, '临沂市', 2, 371300);
INSERT INTO `shop_region` VALUES (179, 15, '德州市', 2, 371400);
INSERT INTO `shop_region` VALUES (180, 15, '聊城市', 2, 371500);
INSERT INTO `shop_region` VALUES (181, 15, '滨州市', 2, 371600);
INSERT INTO `shop_region` VALUES (182, 15, '菏泽市', 2, 371700);
INSERT INTO `shop_region` VALUES (183, 16, '郑州市', 2, 410100);
INSERT INTO `shop_region` VALUES (184, 16, '开封市', 2, 410200);
INSERT INTO `shop_region` VALUES (185, 16, '洛阳市', 2, 410300);
INSERT INTO `shop_region` VALUES (186, 16, '平顶山市', 2, 410400);
INSERT INTO `shop_region` VALUES (187, 16, '安阳市', 2, 410500);
INSERT INTO `shop_region` VALUES (188, 16, '鹤壁市', 2, 410600);
INSERT INTO `shop_region` VALUES (189, 16, '新乡市', 2, 410700);
INSERT INTO `shop_region` VALUES (190, 16, '焦作市', 2, 410800);
INSERT INTO `shop_region` VALUES (191, 16, '濮阳市', 2, 410900);
INSERT INTO `shop_region` VALUES (192, 16, '许昌市', 2, 411000);
INSERT INTO `shop_region` VALUES (193, 16, '漯河市', 2, 411100);
INSERT INTO `shop_region` VALUES (194, 16, '三门峡市', 2, 411200);
INSERT INTO `shop_region` VALUES (195, 16, '南阳市', 2, 411300);
INSERT INTO `shop_region` VALUES (196, 16, '商丘市', 2, 411400);
INSERT INTO `shop_region` VALUES (197, 16, '信阳市', 2, 411500);
INSERT INTO `shop_region` VALUES (198, 16, '周口市', 2, 411600);
INSERT INTO `shop_region` VALUES (199, 16, '驻马店市', 2, 411700);
INSERT INTO `shop_region` VALUES (200, 16, '省直辖县级行政区划', 2, 419000);
INSERT INTO `shop_region` VALUES (201, 17, '武汉市', 2, 420100);
INSERT INTO `shop_region` VALUES (202, 17, '黄石市', 2, 420200);
INSERT INTO `shop_region` VALUES (203, 17, '十堰市', 2, 420300);
INSERT INTO `shop_region` VALUES (204, 17, '宜昌市', 2, 420500);
INSERT INTO `shop_region` VALUES (205, 17, '襄阳市', 2, 420600);
INSERT INTO `shop_region` VALUES (206, 17, '鄂州市', 2, 420700);
INSERT INTO `shop_region` VALUES (207, 17, '荆门市', 2, 420800);
INSERT INTO `shop_region` VALUES (208, 17, '孝感市', 2, 420900);
INSERT INTO `shop_region` VALUES (209, 17, '荆州市', 2, 421000);
INSERT INTO `shop_region` VALUES (210, 17, '黄冈市', 2, 421100);
INSERT INTO `shop_region` VALUES (211, 17, '咸宁市', 2, 421200);
INSERT INTO `shop_region` VALUES (212, 17, '随州市', 2, 421300);
INSERT INTO `shop_region` VALUES (213, 17, '恩施土家族苗族自治州', 2, 422800);
INSERT INTO `shop_region` VALUES (214, 17, '省直辖县级行政区划', 2, 429000);
INSERT INTO `shop_region` VALUES (215, 18, '长沙市', 2, 430100);
INSERT INTO `shop_region` VALUES (216, 18, '株洲市', 2, 430200);
INSERT INTO `shop_region` VALUES (217, 18, '湘潭市', 2, 430300);
INSERT INTO `shop_region` VALUES (218, 18, '衡阳市', 2, 430400);
INSERT INTO `shop_region` VALUES (219, 18, '邵阳市', 2, 430500);
INSERT INTO `shop_region` VALUES (220, 18, '岳阳市', 2, 430600);
INSERT INTO `shop_region` VALUES (221, 18, '常德市', 2, 430700);
INSERT INTO `shop_region` VALUES (222, 18, '张家界市', 2, 430800);
INSERT INTO `shop_region` VALUES (223, 18, '益阳市', 2, 430900);
INSERT INTO `shop_region` VALUES (224, 18, '郴州市', 2, 431000);
INSERT INTO `shop_region` VALUES (225, 18, '永州市', 2, 431100);
INSERT INTO `shop_region` VALUES (226, 18, '怀化市', 2, 431200);
INSERT INTO `shop_region` VALUES (227, 18, '娄底市', 2, 431300);
INSERT INTO `shop_region` VALUES (228, 18, '湘西土家族苗族自治州', 2, 433100);
INSERT INTO `shop_region` VALUES (229, 19, '广州市', 2, 440100);
INSERT INTO `shop_region` VALUES (230, 19, '韶关市', 2, 440200);
INSERT INTO `shop_region` VALUES (231, 19, '深圳市', 2, 440300);
INSERT INTO `shop_region` VALUES (232, 19, '珠海市', 2, 440400);
INSERT INTO `shop_region` VALUES (233, 19, '汕头市', 2, 440500);
INSERT INTO `shop_region` VALUES (234, 19, '佛山市', 2, 440600);
INSERT INTO `shop_region` VALUES (235, 19, '江门市', 2, 440700);
INSERT INTO `shop_region` VALUES (236, 19, '湛江市', 2, 440800);
INSERT INTO `shop_region` VALUES (237, 19, '茂名市', 2, 440900);
INSERT INTO `shop_region` VALUES (238, 19, '肇庆市', 2, 441200);
INSERT INTO `shop_region` VALUES (239, 19, '惠州市', 2, 441300);
INSERT INTO `shop_region` VALUES (240, 19, '梅州市', 2, 441400);
INSERT INTO `shop_region` VALUES (241, 19, '汕尾市', 2, 441500);
INSERT INTO `shop_region` VALUES (242, 19, '河源市', 2, 441600);
INSERT INTO `shop_region` VALUES (243, 19, '阳江市', 2, 441700);
INSERT INTO `shop_region` VALUES (244, 19, '清远市', 2, 441800);
INSERT INTO `shop_region` VALUES (245, 19, '东莞市', 2, 441900);
INSERT INTO `shop_region` VALUES (246, 19, '中山市', 2, 442000);
INSERT INTO `shop_region` VALUES (247, 19, '潮州市', 2, 445100);
INSERT INTO `shop_region` VALUES (248, 19, '揭阳市', 2, 445200);
INSERT INTO `shop_region` VALUES (249, 19, '云浮市', 2, 445300);
INSERT INTO `shop_region` VALUES (250, 20, '南宁市', 2, 450100);
INSERT INTO `shop_region` VALUES (251, 20, '柳州市', 2, 450200);
INSERT INTO `shop_region` VALUES (252, 20, '桂林市', 2, 450300);
INSERT INTO `shop_region` VALUES (253, 20, '梧州市', 2, 450400);
INSERT INTO `shop_region` VALUES (254, 20, '北海市', 2, 450500);
INSERT INTO `shop_region` VALUES (255, 20, '防城港市', 2, 450600);
INSERT INTO `shop_region` VALUES (256, 20, '钦州市', 2, 450700);
INSERT INTO `shop_region` VALUES (257, 20, '贵港市', 2, 450800);
INSERT INTO `shop_region` VALUES (258, 20, '玉林市', 2, 450900);
INSERT INTO `shop_region` VALUES (259, 20, '百色市', 2, 451000);
INSERT INTO `shop_region` VALUES (260, 20, '贺州市', 2, 451100);
INSERT INTO `shop_region` VALUES (261, 20, '河池市', 2, 451200);
INSERT INTO `shop_region` VALUES (262, 20, '来宾市', 2, 451300);
INSERT INTO `shop_region` VALUES (263, 20, '崇左市', 2, 451400);
INSERT INTO `shop_region` VALUES (264, 21, '海口市', 2, 460100);
INSERT INTO `shop_region` VALUES (265, 21, '三亚市', 2, 460200);
INSERT INTO `shop_region` VALUES (266, 21, '三沙市', 2, 460300);
INSERT INTO `shop_region` VALUES (267, 21, '儋州市', 2, 460400);
INSERT INTO `shop_region` VALUES (268, 21, '省直辖县级行政区划', 2, 469000);
INSERT INTO `shop_region` VALUES (269, 22, '市辖区', 2, 500100);
INSERT INTO `shop_region` VALUES (270, 22, '县', 2, 500200);
INSERT INTO `shop_region` VALUES (271, 23, '成都市', 2, 510100);
INSERT INTO `shop_region` VALUES (272, 23, '自贡市', 2, 510300);
INSERT INTO `shop_region` VALUES (273, 23, '攀枝花市', 2, 510400);
INSERT INTO `shop_region` VALUES (274, 23, '泸州市', 2, 510500);
INSERT INTO `shop_region` VALUES (275, 23, '德阳市', 2, 510600);
INSERT INTO `shop_region` VALUES (276, 23, '绵阳市', 2, 510700);
INSERT INTO `shop_region` VALUES (277, 23, '广元市', 2, 510800);
INSERT INTO `shop_region` VALUES (278, 23, '遂宁市', 2, 510900);
INSERT INTO `shop_region` VALUES (279, 23, '内江市', 2, 511000);
INSERT INTO `shop_region` VALUES (280, 23, '乐山市', 2, 511100);
INSERT INTO `shop_region` VALUES (281, 23, '南充市', 2, 511300);
INSERT INTO `shop_region` VALUES (282, 23, '眉山市', 2, 511400);
INSERT INTO `shop_region` VALUES (283, 23, '宜宾市', 2, 511500);
INSERT INTO `shop_region` VALUES (284, 23, '广安市', 2, 511600);
INSERT INTO `shop_region` VALUES (285, 23, '达州市', 2, 511700);
INSERT INTO `shop_region` VALUES (286, 23, '雅安市', 2, 511800);
INSERT INTO `shop_region` VALUES (287, 23, '巴中市', 2, 511900);
INSERT INTO `shop_region` VALUES (288, 23, '资阳市', 2, 512000);
INSERT INTO `shop_region` VALUES (289, 23, '阿坝藏族羌族自治州', 2, 513200);
INSERT INTO `shop_region` VALUES (290, 23, '甘孜藏族自治州', 2, 513300);
INSERT INTO `shop_region` VALUES (291, 23, '凉山彝族自治州', 2, 513400);
INSERT INTO `shop_region` VALUES (292, 24, '贵阳市', 2, 520100);
INSERT INTO `shop_region` VALUES (293, 24, '六盘水市', 2, 520200);
INSERT INTO `shop_region` VALUES (294, 24, '遵义市', 2, 520300);
INSERT INTO `shop_region` VALUES (295, 24, '安顺市', 2, 520400);
INSERT INTO `shop_region` VALUES (296, 24, '毕节市', 2, 520500);
INSERT INTO `shop_region` VALUES (297, 24, '铜仁市', 2, 520600);
INSERT INTO `shop_region` VALUES (298, 24, '黔西南布依族苗族自治州', 2, 522300);
INSERT INTO `shop_region` VALUES (299, 24, '黔东南苗族侗族自治州', 2, 522600);
INSERT INTO `shop_region` VALUES (300, 24, '黔南布依族苗族自治州', 2, 522700);
INSERT INTO `shop_region` VALUES (301, 25, '昆明市', 2, 530100);
INSERT INTO `shop_region` VALUES (302, 25, '曲靖市', 2, 530300);
INSERT INTO `shop_region` VALUES (303, 25, '玉溪市', 2, 530400);
INSERT INTO `shop_region` VALUES (304, 25, '保山市', 2, 530500);
INSERT INTO `shop_region` VALUES (305, 25, '昭通市', 2, 530600);
INSERT INTO `shop_region` VALUES (306, 25, '丽江市', 2, 530700);
INSERT INTO `shop_region` VALUES (307, 25, '普洱市', 2, 530800);
INSERT INTO `shop_region` VALUES (308, 25, '临沧市', 2, 530900);
INSERT INTO `shop_region` VALUES (309, 25, '楚雄彝族自治州', 2, 532300);
INSERT INTO `shop_region` VALUES (310, 25, '红河哈尼族彝族自治州', 2, 532500);
INSERT INTO `shop_region` VALUES (311, 25, '文山壮族苗族自治州', 2, 532600);
INSERT INTO `shop_region` VALUES (312, 25, '西双版纳傣族自治州', 2, 532800);
INSERT INTO `shop_region` VALUES (313, 25, '大理白族自治州', 2, 532900);
INSERT INTO `shop_region` VALUES (314, 25, '德宏傣族景颇族自治州', 2, 533100);
INSERT INTO `shop_region` VALUES (315, 25, '怒江傈僳族自治州', 2, 533300);
INSERT INTO `shop_region` VALUES (316, 25, '迪庆藏族自治州', 2, 533400);
INSERT INTO `shop_region` VALUES (317, 26, '拉萨市', 2, 540100);
INSERT INTO `shop_region` VALUES (318, 26, '日喀则市', 2, 540200);
INSERT INTO `shop_region` VALUES (319, 26, '昌都市', 2, 540300);
INSERT INTO `shop_region` VALUES (320, 26, '林芝市', 2, 540400);
INSERT INTO `shop_region` VALUES (321, 26, '山南市', 2, 540500);
INSERT INTO `shop_region` VALUES (322, 26, '那曲地区', 2, 542400);
INSERT INTO `shop_region` VALUES (323, 26, '阿里地区', 2, 542500);
INSERT INTO `shop_region` VALUES (324, 27, '西安市', 2, 610100);
INSERT INTO `shop_region` VALUES (325, 27, '铜川市', 2, 610200);
INSERT INTO `shop_region` VALUES (326, 27, '宝鸡市', 2, 610300);
INSERT INTO `shop_region` VALUES (327, 27, '咸阳市', 2, 610400);
INSERT INTO `shop_region` VALUES (328, 27, '渭南市', 2, 610500);
INSERT INTO `shop_region` VALUES (329, 27, '延安市', 2, 610600);
INSERT INTO `shop_region` VALUES (330, 27, '汉中市', 2, 610700);
INSERT INTO `shop_region` VALUES (331, 27, '榆林市', 2, 610800);
INSERT INTO `shop_region` VALUES (332, 27, '安康市', 2, 610900);
INSERT INTO `shop_region` VALUES (333, 27, '商洛市', 2, 611000);
INSERT INTO `shop_region` VALUES (334, 28, '兰州市', 2, 620100);
INSERT INTO `shop_region` VALUES (335, 28, '嘉峪关市', 2, 620200);
INSERT INTO `shop_region` VALUES (336, 28, '金昌市', 2, 620300);
INSERT INTO `shop_region` VALUES (337, 28, '白银市', 2, 620400);
INSERT INTO `shop_region` VALUES (338, 28, '天水市', 2, 620500);
INSERT INTO `shop_region` VALUES (339, 28, '武威市', 2, 620600);
INSERT INTO `shop_region` VALUES (340, 28, '张掖市', 2, 620700);
INSERT INTO `shop_region` VALUES (341, 28, '平凉市', 2, 620800);
INSERT INTO `shop_region` VALUES (342, 28, '酒泉市', 2, 620900);
INSERT INTO `shop_region` VALUES (343, 28, '庆阳市', 2, 621000);
INSERT INTO `shop_region` VALUES (344, 28, '定西市', 2, 621100);
INSERT INTO `shop_region` VALUES (345, 28, '陇南市', 2, 621200);
INSERT INTO `shop_region` VALUES (346, 28, '临夏回族自治州', 2, 622900);
INSERT INTO `shop_region` VALUES (347, 28, '甘南藏族自治州', 2, 623000);
INSERT INTO `shop_region` VALUES (348, 29, '西宁市', 2, 630100);
INSERT INTO `shop_region` VALUES (349, 29, '海东市', 2, 630200);
INSERT INTO `shop_region` VALUES (350, 29, '海北藏族自治州', 2, 632200);
INSERT INTO `shop_region` VALUES (351, 29, '黄南藏族自治州', 2, 632300);
INSERT INTO `shop_region` VALUES (352, 29, '海南藏族自治州', 2, 632500);
INSERT INTO `shop_region` VALUES (353, 29, '果洛藏族自治州', 2, 632600);
INSERT INTO `shop_region` VALUES (354, 29, '玉树藏族自治州', 2, 632700);
INSERT INTO `shop_region` VALUES (355, 29, '海西蒙古族藏族自治州', 2, 632800);
INSERT INTO `shop_region` VALUES (356, 30, '银川市', 2, 640100);
INSERT INTO `shop_region` VALUES (357, 30, '石嘴山市', 2, 640200);
INSERT INTO `shop_region` VALUES (358, 30, '吴忠市', 2, 640300);
INSERT INTO `shop_region` VALUES (359, 30, '固原市', 2, 640400);
INSERT INTO `shop_region` VALUES (360, 30, '中卫市', 2, 640500);
INSERT INTO `shop_region` VALUES (361, 31, '乌鲁木齐市', 2, 650100);
INSERT INTO `shop_region` VALUES (362, 31, '克拉玛依市', 2, 650200);
INSERT INTO `shop_region` VALUES (363, 31, '吐鲁番市', 2, 650400);
INSERT INTO `shop_region` VALUES (364, 31, '哈密市', 2, 650500);
INSERT INTO `shop_region` VALUES (365, 31, '昌吉回族自治州', 2, 652300);
INSERT INTO `shop_region` VALUES (366, 31, '博尔塔拉蒙古自治州', 2, 652700);
INSERT INTO `shop_region` VALUES (367, 31, '巴音郭楞蒙古自治州', 2, 652800);
INSERT INTO `shop_region` VALUES (368, 31, '阿克苏地区', 2, 652900);
INSERT INTO `shop_region` VALUES (369, 31, '克孜勒苏柯尔克孜自治州', 2, 653000);
INSERT INTO `shop_region` VALUES (370, 31, '喀什地区', 2, 653100);
INSERT INTO `shop_region` VALUES (371, 31, '和田地区', 2, 653200);
INSERT INTO `shop_region` VALUES (372, 31, '伊犁哈萨克自治州', 2, 654000);
INSERT INTO `shop_region` VALUES (373, 31, '塔城地区', 2, 654200);
INSERT INTO `shop_region` VALUES (374, 31, '阿勒泰地区', 2, 654300);
INSERT INTO `shop_region` VALUES (375, 31, '自治区直辖县级行政区划', 2, 659000);
INSERT INTO `shop_region` VALUES (376, 32, '东城区', 3, 110101);
INSERT INTO `shop_region` VALUES (377, 32, '西城区', 3, 110102);
INSERT INTO `shop_region` VALUES (378, 32, '朝阳区', 3, 110105);
INSERT INTO `shop_region` VALUES (379, 32, '丰台区', 3, 110106);
INSERT INTO `shop_region` VALUES (380, 32, '石景山区', 3, 110107);
INSERT INTO `shop_region` VALUES (381, 32, '海淀区', 3, 110108);
INSERT INTO `shop_region` VALUES (382, 32, '门头沟区', 3, 110109);
INSERT INTO `shop_region` VALUES (383, 32, '房山区', 3, 110111);
INSERT INTO `shop_region` VALUES (384, 32, '通州区', 3, 110112);
INSERT INTO `shop_region` VALUES (385, 32, '顺义区', 3, 110113);
INSERT INTO `shop_region` VALUES (386, 32, '昌平区', 3, 110114);
INSERT INTO `shop_region` VALUES (387, 32, '大兴区', 3, 110115);
INSERT INTO `shop_region` VALUES (388, 32, '怀柔区', 3, 110116);
INSERT INTO `shop_region` VALUES (389, 32, '平谷区', 3, 110117);
INSERT INTO `shop_region` VALUES (390, 32, '密云区', 3, 110118);
INSERT INTO `shop_region` VALUES (391, 32, '延庆区', 3, 110119);
INSERT INTO `shop_region` VALUES (392, 33, '和平区', 3, 120101);
INSERT INTO `shop_region` VALUES (393, 33, '河东区', 3, 120102);
INSERT INTO `shop_region` VALUES (394, 33, '河西区', 3, 120103);
INSERT INTO `shop_region` VALUES (395, 33, '南开区', 3, 120104);
INSERT INTO `shop_region` VALUES (396, 33, '河北区', 3, 120105);
INSERT INTO `shop_region` VALUES (397, 33, '红桥区', 3, 120106);
INSERT INTO `shop_region` VALUES (398, 33, '东丽区', 3, 120110);
INSERT INTO `shop_region` VALUES (399, 33, '西青区', 3, 120111);
INSERT INTO `shop_region` VALUES (400, 33, '津南区', 3, 120112);
INSERT INTO `shop_region` VALUES (401, 33, '北辰区', 3, 120113);
INSERT INTO `shop_region` VALUES (402, 33, '武清区', 3, 120114);
INSERT INTO `shop_region` VALUES (403, 33, '宝坻区', 3, 120115);
INSERT INTO `shop_region` VALUES (404, 33, '滨海新区', 3, 120116);
INSERT INTO `shop_region` VALUES (405, 33, '宁河区', 3, 120117);
INSERT INTO `shop_region` VALUES (406, 33, '静海区', 3, 120118);
INSERT INTO `shop_region` VALUES (407, 33, '蓟州区', 3, 120119);
INSERT INTO `shop_region` VALUES (408, 34, '长安区', 3, 130102);
INSERT INTO `shop_region` VALUES (409, 34, '桥西区', 3, 130104);
INSERT INTO `shop_region` VALUES (410, 34, '新华区', 3, 130105);
INSERT INTO `shop_region` VALUES (411, 34, '井陉矿区', 3, 130107);
INSERT INTO `shop_region` VALUES (412, 34, '裕华区', 3, 130108);
INSERT INTO `shop_region` VALUES (413, 34, '藁城区', 3, 130109);
INSERT INTO `shop_region` VALUES (414, 34, '鹿泉区', 3, 130110);
INSERT INTO `shop_region` VALUES (415, 34, '栾城区', 3, 130111);
INSERT INTO `shop_region` VALUES (416, 34, '井陉县', 3, 130121);
INSERT INTO `shop_region` VALUES (417, 34, '正定县', 3, 130123);
INSERT INTO `shop_region` VALUES (418, 34, '行唐县', 3, 130125);
INSERT INTO `shop_region` VALUES (419, 34, '灵寿县', 3, 130126);
INSERT INTO `shop_region` VALUES (420, 34, '高邑县', 3, 130127);
INSERT INTO `shop_region` VALUES (421, 34, '深泽县', 3, 130128);
INSERT INTO `shop_region` VALUES (422, 34, '赞皇县', 3, 130129);
INSERT INTO `shop_region` VALUES (423, 34, '无极县', 3, 130130);
INSERT INTO `shop_region` VALUES (424, 34, '平山县', 3, 130131);
INSERT INTO `shop_region` VALUES (425, 34, '元氏县', 3, 130132);
INSERT INTO `shop_region` VALUES (426, 34, '赵县', 3, 130133);
INSERT INTO `shop_region` VALUES (427, 34, '晋州市', 3, 130183);
INSERT INTO `shop_region` VALUES (428, 34, '新乐市', 3, 130184);
INSERT INTO `shop_region` VALUES (429, 35, '路南区', 3, 130202);
INSERT INTO `shop_region` VALUES (430, 35, '路北区', 3, 130203);
INSERT INTO `shop_region` VALUES (431, 35, '古冶区', 3, 130204);
INSERT INTO `shop_region` VALUES (432, 35, '开平区', 3, 130205);
INSERT INTO `shop_region` VALUES (433, 35, '丰南区', 3, 130207);
INSERT INTO `shop_region` VALUES (434, 35, '丰润区', 3, 130208);
INSERT INTO `shop_region` VALUES (435, 35, '曹妃甸区', 3, 130209);
INSERT INTO `shop_region` VALUES (436, 35, '滦县', 3, 130223);
INSERT INTO `shop_region` VALUES (437, 35, '滦南县', 3, 130224);
INSERT INTO `shop_region` VALUES (438, 35, '乐亭县', 3, 130225);
INSERT INTO `shop_region` VALUES (439, 35, '迁西县', 3, 130227);
INSERT INTO `shop_region` VALUES (440, 35, '玉田县', 3, 130229);
INSERT INTO `shop_region` VALUES (441, 35, '遵化市', 3, 130281);
INSERT INTO `shop_region` VALUES (442, 35, '迁安市', 3, 130283);
INSERT INTO `shop_region` VALUES (443, 36, '海港区', 3, 130302);
INSERT INTO `shop_region` VALUES (444, 36, '山海关区', 3, 130303);
INSERT INTO `shop_region` VALUES (445, 36, '北戴河区', 3, 130304);
INSERT INTO `shop_region` VALUES (446, 36, '抚宁区', 3, 130306);
INSERT INTO `shop_region` VALUES (447, 36, '青龙满族自治县', 3, 130321);
INSERT INTO `shop_region` VALUES (448, 36, '昌黎县', 3, 130322);
INSERT INTO `shop_region` VALUES (449, 36, '卢龙县', 3, 130324);
INSERT INTO `shop_region` VALUES (450, 37, '邯山区', 3, 130402);
INSERT INTO `shop_region` VALUES (451, 37, '丛台区', 3, 130403);
INSERT INTO `shop_region` VALUES (452, 37, '复兴区', 3, 130404);
INSERT INTO `shop_region` VALUES (453, 37, '峰峰矿区', 3, 130406);
INSERT INTO `shop_region` VALUES (454, 37, '邯郸县', 3, 130421);
INSERT INTO `shop_region` VALUES (455, 37, '临漳县', 3, 130423);
INSERT INTO `shop_region` VALUES (456, 37, '成安县', 3, 130424);
INSERT INTO `shop_region` VALUES (457, 37, '大名县', 3, 130425);
INSERT INTO `shop_region` VALUES (458, 37, '涉县', 3, 130426);
INSERT INTO `shop_region` VALUES (459, 37, '磁县', 3, 130427);
INSERT INTO `shop_region` VALUES (460, 37, '肥乡县', 3, 130428);
INSERT INTO `shop_region` VALUES (461, 37, '永年县', 3, 130429);
INSERT INTO `shop_region` VALUES (462, 37, '邱县', 3, 130430);
INSERT INTO `shop_region` VALUES (463, 37, '鸡泽县', 3, 130431);
INSERT INTO `shop_region` VALUES (464, 37, '广平县', 3, 130432);
INSERT INTO `shop_region` VALUES (465, 37, '馆陶县', 3, 130433);
INSERT INTO `shop_region` VALUES (466, 37, '魏县', 3, 130434);
INSERT INTO `shop_region` VALUES (467, 37, '曲周县', 3, 130435);
INSERT INTO `shop_region` VALUES (468, 37, '武安市', 3, 130481);
INSERT INTO `shop_region` VALUES (469, 38, '桥东区', 3, 130502);
INSERT INTO `shop_region` VALUES (470, 38, '桥西区', 3, 130503);
INSERT INTO `shop_region` VALUES (471, 38, '邢台县', 3, 130521);
INSERT INTO `shop_region` VALUES (472, 38, '临城县', 3, 130522);
INSERT INTO `shop_region` VALUES (473, 38, '内丘县', 3, 130523);
INSERT INTO `shop_region` VALUES (474, 38, '柏乡县', 3, 130524);
INSERT INTO `shop_region` VALUES (475, 38, '隆尧县', 3, 130525);
INSERT INTO `shop_region` VALUES (476, 38, '任县', 3, 130526);
INSERT INTO `shop_region` VALUES (477, 38, '南和县', 3, 130527);
INSERT INTO `shop_region` VALUES (478, 38, '宁晋县', 3, 130528);
INSERT INTO `shop_region` VALUES (479, 38, '巨鹿县', 3, 130529);
INSERT INTO `shop_region` VALUES (480, 38, '新河县', 3, 130530);
INSERT INTO `shop_region` VALUES (481, 38, '广宗县', 3, 130531);
INSERT INTO `shop_region` VALUES (482, 38, '平乡县', 3, 130532);
INSERT INTO `shop_region` VALUES (483, 38, '威县', 3, 130533);
INSERT INTO `shop_region` VALUES (484, 38, '清河县', 3, 130534);
INSERT INTO `shop_region` VALUES (485, 38, '临西县', 3, 130535);
INSERT INTO `shop_region` VALUES (486, 38, '南宫市', 3, 130581);
INSERT INTO `shop_region` VALUES (487, 38, '沙河市', 3, 130582);
INSERT INTO `shop_region` VALUES (488, 39, '竞秀区', 3, 130602);
INSERT INTO `shop_region` VALUES (489, 39, '莲池区', 3, 130606);
INSERT INTO `shop_region` VALUES (490, 39, '满城区', 3, 130607);
INSERT INTO `shop_region` VALUES (491, 39, '清苑区', 3, 130608);
INSERT INTO `shop_region` VALUES (492, 39, '徐水区', 3, 130609);
INSERT INTO `shop_region` VALUES (493, 39, '涞水县', 3, 130623);
INSERT INTO `shop_region` VALUES (494, 39, '阜平县', 3, 130624);
INSERT INTO `shop_region` VALUES (495, 39, '定兴县', 3, 130626);
INSERT INTO `shop_region` VALUES (496, 39, '唐县', 3, 130627);
INSERT INTO `shop_region` VALUES (497, 39, '高阳县', 3, 130628);
INSERT INTO `shop_region` VALUES (498, 39, '容城县', 3, 130629);
INSERT INTO `shop_region` VALUES (499, 39, '涞源县', 3, 130630);
INSERT INTO `shop_region` VALUES (500, 39, '望都县', 3, 130631);
INSERT INTO `shop_region` VALUES (501, 39, '安新县', 3, 130632);
INSERT INTO `shop_region` VALUES (502, 39, '易县', 3, 130633);
INSERT INTO `shop_region` VALUES (503, 39, '曲阳县', 3, 130634);
INSERT INTO `shop_region` VALUES (504, 39, '蠡县', 3, 130635);
INSERT INTO `shop_region` VALUES (505, 39, '顺平县', 3, 130636);
INSERT INTO `shop_region` VALUES (506, 39, '博野县', 3, 130637);
INSERT INTO `shop_region` VALUES (507, 39, '雄县', 3, 130638);
INSERT INTO `shop_region` VALUES (508, 39, '涿州市', 3, 130681);
INSERT INTO `shop_region` VALUES (509, 39, '安国市', 3, 130683);
INSERT INTO `shop_region` VALUES (510, 39, '高碑店市', 3, 130684);
INSERT INTO `shop_region` VALUES (511, 40, '桥东区', 3, 130702);
INSERT INTO `shop_region` VALUES (512, 40, '桥西区', 3, 130703);
INSERT INTO `shop_region` VALUES (513, 40, '宣化区', 3, 130705);
INSERT INTO `shop_region` VALUES (514, 40, '下花园区', 3, 130706);
INSERT INTO `shop_region` VALUES (515, 40, '万全区', 3, 130708);
INSERT INTO `shop_region` VALUES (516, 40, '崇礼区', 3, 130709);
INSERT INTO `shop_region` VALUES (517, 40, '张北县', 3, 130722);
INSERT INTO `shop_region` VALUES (518, 40, '康保县', 3, 130723);
INSERT INTO `shop_region` VALUES (519, 40, '沽源县', 3, 130724);
INSERT INTO `shop_region` VALUES (520, 40, '尚义县', 3, 130725);
INSERT INTO `shop_region` VALUES (521, 40, '蔚县', 3, 130726);
INSERT INTO `shop_region` VALUES (522, 40, '阳原县', 3, 130727);
INSERT INTO `shop_region` VALUES (523, 40, '怀安县', 3, 130728);
INSERT INTO `shop_region` VALUES (524, 40, '怀来县', 3, 130730);
INSERT INTO `shop_region` VALUES (525, 40, '涿鹿县', 3, 130731);
INSERT INTO `shop_region` VALUES (526, 40, '赤城县', 3, 130732);
INSERT INTO `shop_region` VALUES (527, 41, '双桥区', 3, 130802);
INSERT INTO `shop_region` VALUES (528, 41, '双滦区', 3, 130803);
INSERT INTO `shop_region` VALUES (529, 41, '鹰手营子矿区', 3, 130804);
INSERT INTO `shop_region` VALUES (530, 41, '承德县', 3, 130821);
INSERT INTO `shop_region` VALUES (531, 41, '兴隆县', 3, 130822);
INSERT INTO `shop_region` VALUES (532, 41, '平泉县', 3, 130823);
INSERT INTO `shop_region` VALUES (533, 41, '滦平县', 3, 130824);
INSERT INTO `shop_region` VALUES (534, 41, '隆化县', 3, 130825);
INSERT INTO `shop_region` VALUES (535, 41, '丰宁满族自治县', 3, 130826);
INSERT INTO `shop_region` VALUES (536, 41, '宽城满族自治县', 3, 130827);
INSERT INTO `shop_region` VALUES (537, 41, '围场满族蒙古族自治县', 3, 130828);
INSERT INTO `shop_region` VALUES (538, 42, '新华区', 3, 130902);
INSERT INTO `shop_region` VALUES (539, 42, '运河区', 3, 130903);
INSERT INTO `shop_region` VALUES (540, 42, '沧县', 3, 130921);
INSERT INTO `shop_region` VALUES (541, 42, '青县', 3, 130922);
INSERT INTO `shop_region` VALUES (542, 42, '东光县', 3, 130923);
INSERT INTO `shop_region` VALUES (543, 42, '海兴县', 3, 130924);
INSERT INTO `shop_region` VALUES (544, 42, '盐山县', 3, 130925);
INSERT INTO `shop_region` VALUES (545, 42, '肃宁县', 3, 130926);
INSERT INTO `shop_region` VALUES (546, 42, '南皮县', 3, 130927);
INSERT INTO `shop_region` VALUES (547, 42, '吴桥县', 3, 130928);
INSERT INTO `shop_region` VALUES (548, 42, '献县', 3, 130929);
INSERT INTO `shop_region` VALUES (549, 42, '孟村回族自治县', 3, 130930);
INSERT INTO `shop_region` VALUES (550, 42, '泊头市', 3, 130981);
INSERT INTO `shop_region` VALUES (551, 42, '任丘市', 3, 130982);
INSERT INTO `shop_region` VALUES (552, 42, '黄骅市', 3, 130983);
INSERT INTO `shop_region` VALUES (553, 42, '河间市', 3, 130984);
INSERT INTO `shop_region` VALUES (554, 43, '安次区', 3, 131002);
INSERT INTO `shop_region` VALUES (555, 43, '广阳区', 3, 131003);
INSERT INTO `shop_region` VALUES (556, 43, '固安县', 3, 131022);
INSERT INTO `shop_region` VALUES (557, 43, '永清县', 3, 131023);
INSERT INTO `shop_region` VALUES (558, 43, '香河县', 3, 131024);
INSERT INTO `shop_region` VALUES (559, 43, '大城县', 3, 131025);
INSERT INTO `shop_region` VALUES (560, 43, '文安县', 3, 131026);
INSERT INTO `shop_region` VALUES (561, 43, '大厂回族自治县', 3, 131028);
INSERT INTO `shop_region` VALUES (562, 43, '霸州市', 3, 131081);
INSERT INTO `shop_region` VALUES (563, 43, '三河市', 3, 131082);
INSERT INTO `shop_region` VALUES (564, 44, '桃城区', 3, 131102);
INSERT INTO `shop_region` VALUES (565, 44, '冀州区', 3, 131103);
INSERT INTO `shop_region` VALUES (566, 44, '枣强县', 3, 131121);
INSERT INTO `shop_region` VALUES (567, 44, '武邑县', 3, 131122);
INSERT INTO `shop_region` VALUES (568, 44, '武强县', 3, 131123);
INSERT INTO `shop_region` VALUES (569, 44, '饶阳县', 3, 131124);
INSERT INTO `shop_region` VALUES (570, 44, '安平县', 3, 131125);
INSERT INTO `shop_region` VALUES (571, 44, '故城县', 3, 131126);
INSERT INTO `shop_region` VALUES (572, 44, '景县', 3, 131127);
INSERT INTO `shop_region` VALUES (573, 44, '阜城县', 3, 131128);
INSERT INTO `shop_region` VALUES (574, 44, '深州市', 3, 131182);
INSERT INTO `shop_region` VALUES (575, 45, '定州市', 3, 139001);
INSERT INTO `shop_region` VALUES (576, 45, '辛集市', 3, 139002);
INSERT INTO `shop_region` VALUES (577, 46, '小店区', 3, 140105);
INSERT INTO `shop_region` VALUES (578, 46, '迎泽区', 3, 140106);
INSERT INTO `shop_region` VALUES (579, 46, '杏花岭区', 3, 140107);
INSERT INTO `shop_region` VALUES (580, 46, '尖草坪区', 3, 140108);
INSERT INTO `shop_region` VALUES (581, 46, '万柏林区', 3, 140109);
INSERT INTO `shop_region` VALUES (582, 46, '晋源区', 3, 140110);
INSERT INTO `shop_region` VALUES (583, 46, '清徐县', 3, 140121);
INSERT INTO `shop_region` VALUES (584, 46, '阳曲县', 3, 140122);
INSERT INTO `shop_region` VALUES (585, 46, '娄烦县', 3, 140123);
INSERT INTO `shop_region` VALUES (586, 46, '古交市', 3, 140181);
INSERT INTO `shop_region` VALUES (587, 47, '城区', 3, 140202);
INSERT INTO `shop_region` VALUES (588, 47, '矿区', 3, 140203);
INSERT INTO `shop_region` VALUES (589, 47, '南郊区', 3, 140211);
INSERT INTO `shop_region` VALUES (590, 47, '新荣区', 3, 140212);
INSERT INTO `shop_region` VALUES (591, 47, '阳高县', 3, 140221);
INSERT INTO `shop_region` VALUES (592, 47, '天镇县', 3, 140222);
INSERT INTO `shop_region` VALUES (593, 47, '广灵县', 3, 140223);
INSERT INTO `shop_region` VALUES (594, 47, '灵丘县', 3, 140224);
INSERT INTO `shop_region` VALUES (595, 47, '浑源县', 3, 140225);
INSERT INTO `shop_region` VALUES (596, 47, '左云县', 3, 140226);
INSERT INTO `shop_region` VALUES (597, 47, '大同县', 3, 140227);
INSERT INTO `shop_region` VALUES (598, 48, '城区', 3, 140302);
INSERT INTO `shop_region` VALUES (599, 48, '矿区', 3, 140303);
INSERT INTO `shop_region` VALUES (600, 48, '郊区', 3, 140311);
INSERT INTO `shop_region` VALUES (601, 48, '平定县', 3, 140321);
INSERT INTO `shop_region` VALUES (602, 48, '盂县', 3, 140322);
INSERT INTO `shop_region` VALUES (603, 49, '城区', 3, 140402);
INSERT INTO `shop_region` VALUES (604, 49, '郊区', 3, 140411);
INSERT INTO `shop_region` VALUES (605, 49, '长治县', 3, 140421);
INSERT INTO `shop_region` VALUES (606, 49, '襄垣县', 3, 140423);
INSERT INTO `shop_region` VALUES (607, 49, '屯留县', 3, 140424);
INSERT INTO `shop_region` VALUES (608, 49, '平顺县', 3, 140425);
INSERT INTO `shop_region` VALUES (609, 49, '黎城县', 3, 140426);
INSERT INTO `shop_region` VALUES (610, 49, '壶关县', 3, 140427);
INSERT INTO `shop_region` VALUES (611, 49, '长子县', 3, 140428);
INSERT INTO `shop_region` VALUES (612, 49, '武乡县', 3, 140429);
INSERT INTO `shop_region` VALUES (613, 49, '沁县', 3, 140430);
INSERT INTO `shop_region` VALUES (614, 49, '沁源县', 3, 140431);
INSERT INTO `shop_region` VALUES (615, 49, '潞城市', 3, 140481);
INSERT INTO `shop_region` VALUES (616, 50, '城区', 3, 140502);
INSERT INTO `shop_region` VALUES (617, 50, '沁水县', 3, 140521);
INSERT INTO `shop_region` VALUES (618, 50, '阳城县', 3, 140522);
INSERT INTO `shop_region` VALUES (619, 50, '陵川县', 3, 140524);
INSERT INTO `shop_region` VALUES (620, 50, '泽州县', 3, 140525);
INSERT INTO `shop_region` VALUES (621, 50, '高平市', 3, 140581);
INSERT INTO `shop_region` VALUES (622, 51, '朔城区', 3, 140602);
INSERT INTO `shop_region` VALUES (623, 51, '平鲁区', 3, 140603);
INSERT INTO `shop_region` VALUES (624, 51, '山阴县', 3, 140621);
INSERT INTO `shop_region` VALUES (625, 51, '应县', 3, 140622);
INSERT INTO `shop_region` VALUES (626, 51, '右玉县', 3, 140623);
INSERT INTO `shop_region` VALUES (627, 51, '怀仁县', 3, 140624);
INSERT INTO `shop_region` VALUES (628, 52, '榆次区', 3, 140702);
INSERT INTO `shop_region` VALUES (629, 52, '榆社县', 3, 140721);
INSERT INTO `shop_region` VALUES (630, 52, '左权县', 3, 140722);
INSERT INTO `shop_region` VALUES (631, 52, '和顺县', 3, 140723);
INSERT INTO `shop_region` VALUES (632, 52, '昔阳县', 3, 140724);
INSERT INTO `shop_region` VALUES (633, 52, '寿阳县', 3, 140725);
INSERT INTO `shop_region` VALUES (634, 52, '太谷县', 3, 140726);
INSERT INTO `shop_region` VALUES (635, 52, '祁县', 3, 140727);
INSERT INTO `shop_region` VALUES (636, 52, '平遥县', 3, 140728);
INSERT INTO `shop_region` VALUES (637, 52, '灵石县', 3, 140729);
INSERT INTO `shop_region` VALUES (638, 52, '介休市', 3, 140781);
INSERT INTO `shop_region` VALUES (639, 53, '盐湖区', 3, 140802);
INSERT INTO `shop_region` VALUES (640, 53, '临猗县', 3, 140821);
INSERT INTO `shop_region` VALUES (641, 53, '万荣县', 3, 140822);
INSERT INTO `shop_region` VALUES (642, 53, '闻喜县', 3, 140823);
INSERT INTO `shop_region` VALUES (643, 53, '稷山县', 3, 140824);
INSERT INTO `shop_region` VALUES (644, 53, '新绛县', 3, 140825);
INSERT INTO `shop_region` VALUES (645, 53, '绛县', 3, 140826);
INSERT INTO `shop_region` VALUES (646, 53, '垣曲县', 3, 140827);
INSERT INTO `shop_region` VALUES (647, 53, '夏县', 3, 140828);
INSERT INTO `shop_region` VALUES (648, 53, '平陆县', 3, 140829);
INSERT INTO `shop_region` VALUES (649, 53, '芮城县', 3, 140830);
INSERT INTO `shop_region` VALUES (650, 53, '永济市', 3, 140881);
INSERT INTO `shop_region` VALUES (651, 53, '河津市', 3, 140882);
INSERT INTO `shop_region` VALUES (652, 54, '忻府区', 3, 140902);
INSERT INTO `shop_region` VALUES (653, 54, '定襄县', 3, 140921);
INSERT INTO `shop_region` VALUES (654, 54, '五台县', 3, 140922);
INSERT INTO `shop_region` VALUES (655, 54, '代县', 3, 140923);
INSERT INTO `shop_region` VALUES (656, 54, '繁峙县', 3, 140924);
INSERT INTO `shop_region` VALUES (657, 54, '宁武县', 3, 140925);
INSERT INTO `shop_region` VALUES (658, 54, '静乐县', 3, 140926);
INSERT INTO `shop_region` VALUES (659, 54, '神池县', 3, 140927);
INSERT INTO `shop_region` VALUES (660, 54, '五寨县', 3, 140928);
INSERT INTO `shop_region` VALUES (661, 54, '岢岚县', 3, 140929);
INSERT INTO `shop_region` VALUES (662, 54, '河曲县', 3, 140930);
INSERT INTO `shop_region` VALUES (663, 54, '保德县', 3, 140931);
INSERT INTO `shop_region` VALUES (664, 54, '偏关县', 3, 140932);
INSERT INTO `shop_region` VALUES (665, 54, '原平市', 3, 140981);
INSERT INTO `shop_region` VALUES (666, 55, '尧都区', 3, 141002);
INSERT INTO `shop_region` VALUES (667, 55, '曲沃县', 3, 141021);
INSERT INTO `shop_region` VALUES (668, 55, '翼城县', 3, 141022);
INSERT INTO `shop_region` VALUES (669, 55, '襄汾县', 3, 141023);
INSERT INTO `shop_region` VALUES (670, 55, '洪洞县', 3, 141024);
INSERT INTO `shop_region` VALUES (671, 55, '古县', 3, 141025);
INSERT INTO `shop_region` VALUES (672, 55, '安泽县', 3, 141026);
INSERT INTO `shop_region` VALUES (673, 55, '浮山县', 3, 141027);
INSERT INTO `shop_region` VALUES (674, 55, '吉县', 3, 141028);
INSERT INTO `shop_region` VALUES (675, 55, '乡宁县', 3, 141029);
INSERT INTO `shop_region` VALUES (676, 55, '大宁县', 3, 141030);
INSERT INTO `shop_region` VALUES (677, 55, '隰县', 3, 141031);
INSERT INTO `shop_region` VALUES (678, 55, '永和县', 3, 141032);
INSERT INTO `shop_region` VALUES (679, 55, '蒲县', 3, 141033);
INSERT INTO `shop_region` VALUES (680, 55, '汾西县', 3, 141034);
INSERT INTO `shop_region` VALUES (681, 55, '侯马市', 3, 141081);
INSERT INTO `shop_region` VALUES (682, 55, '霍州市', 3, 141082);
INSERT INTO `shop_region` VALUES (683, 56, '离石区', 3, 141102);
INSERT INTO `shop_region` VALUES (684, 56, '文水县', 3, 141121);
INSERT INTO `shop_region` VALUES (685, 56, '交城县', 3, 141122);
INSERT INTO `shop_region` VALUES (686, 56, '兴县', 3, 141123);
INSERT INTO `shop_region` VALUES (687, 56, '临县', 3, 141124);
INSERT INTO `shop_region` VALUES (688, 56, '柳林县', 3, 141125);
INSERT INTO `shop_region` VALUES (689, 56, '石楼县', 3, 141126);
INSERT INTO `shop_region` VALUES (690, 56, '岚县', 3, 141127);
INSERT INTO `shop_region` VALUES (691, 56, '方山县', 3, 141128);
INSERT INTO `shop_region` VALUES (692, 56, '中阳县', 3, 141129);
INSERT INTO `shop_region` VALUES (693, 56, '交口县', 3, 141130);
INSERT INTO `shop_region` VALUES (694, 56, '孝义市', 3, 141181);
INSERT INTO `shop_region` VALUES (695, 56, '汾阳市', 3, 141182);
INSERT INTO `shop_region` VALUES (696, 57, '新城区', 3, 150102);
INSERT INTO `shop_region` VALUES (697, 57, '回民区', 3, 150103);
INSERT INTO `shop_region` VALUES (698, 57, '玉泉区', 3, 150104);
INSERT INTO `shop_region` VALUES (699, 57, '赛罕区', 3, 150105);
INSERT INTO `shop_region` VALUES (700, 57, '土默特左旗', 3, 150121);
INSERT INTO `shop_region` VALUES (701, 57, '托克托县', 3, 150122);
INSERT INTO `shop_region` VALUES (702, 57, '和林格尔县', 3, 150123);
INSERT INTO `shop_region` VALUES (703, 57, '清水河县', 3, 150124);
INSERT INTO `shop_region` VALUES (704, 57, '武川县', 3, 150125);
INSERT INTO `shop_region` VALUES (705, 58, '东河区', 3, 150202);
INSERT INTO `shop_region` VALUES (706, 58, '昆都仑区', 3, 150203);
INSERT INTO `shop_region` VALUES (707, 58, '青山区', 3, 150204);
INSERT INTO `shop_region` VALUES (708, 58, '石拐区', 3, 150205);
INSERT INTO `shop_region` VALUES (709, 58, '白云鄂博矿区', 3, 150206);
INSERT INTO `shop_region` VALUES (710, 58, '九原区', 3, 150207);
INSERT INTO `shop_region` VALUES (711, 58, '土默特右旗', 3, 150221);
INSERT INTO `shop_region` VALUES (712, 58, '固阳县', 3, 150222);
INSERT INTO `shop_region` VALUES (713, 58, '达尔罕茂明安联合旗', 3, 150223);
INSERT INTO `shop_region` VALUES (714, 59, '海勃湾区', 3, 150302);
INSERT INTO `shop_region` VALUES (715, 59, '海南区', 3, 150303);
INSERT INTO `shop_region` VALUES (716, 59, '乌达区', 3, 150304);
INSERT INTO `shop_region` VALUES (717, 60, '红山区', 3, 150402);
INSERT INTO `shop_region` VALUES (718, 60, '元宝山区', 3, 150403);
INSERT INTO `shop_region` VALUES (719, 60, '松山区', 3, 150404);
INSERT INTO `shop_region` VALUES (720, 60, '阿鲁科尔沁旗', 3, 150421);
INSERT INTO `shop_region` VALUES (721, 60, '巴林左旗', 3, 150422);
INSERT INTO `shop_region` VALUES (722, 60, '巴林右旗', 3, 150423);
INSERT INTO `shop_region` VALUES (723, 60, '林西县', 3, 150424);
INSERT INTO `shop_region` VALUES (724, 60, '克什克腾旗', 3, 150425);
INSERT INTO `shop_region` VALUES (725, 60, '翁牛特旗', 3, 150426);
INSERT INTO `shop_region` VALUES (726, 60, '喀喇沁旗', 3, 150428);
INSERT INTO `shop_region` VALUES (727, 60, '宁城县', 3, 150429);
INSERT INTO `shop_region` VALUES (728, 60, '敖汉旗', 3, 150430);
INSERT INTO `shop_region` VALUES (729, 61, '科尔沁区', 3, 150502);
INSERT INTO `shop_region` VALUES (730, 61, '科尔沁左翼中旗', 3, 150521);
INSERT INTO `shop_region` VALUES (731, 61, '科尔沁左翼后旗', 3, 150522);
INSERT INTO `shop_region` VALUES (732, 61, '开鲁县', 3, 150523);
INSERT INTO `shop_region` VALUES (733, 61, '库伦旗', 3, 150524);
INSERT INTO `shop_region` VALUES (734, 61, '奈曼旗', 3, 150525);
INSERT INTO `shop_region` VALUES (735, 61, '扎鲁特旗', 3, 150526);
INSERT INTO `shop_region` VALUES (736, 61, '霍林郭勒市', 3, 150581);
INSERT INTO `shop_region` VALUES (737, 62, '东胜区', 3, 150602);
INSERT INTO `shop_region` VALUES (738, 62, '康巴什区', 3, 150603);
INSERT INTO `shop_region` VALUES (739, 62, '达拉特旗', 3, 150621);
INSERT INTO `shop_region` VALUES (740, 62, '准格尔旗', 3, 150622);
INSERT INTO `shop_region` VALUES (741, 62, '鄂托克前旗', 3, 150623);
INSERT INTO `shop_region` VALUES (742, 62, '鄂托克旗', 3, 150624);
INSERT INTO `shop_region` VALUES (743, 62, '杭锦旗', 3, 150625);
INSERT INTO `shop_region` VALUES (744, 62, '乌审旗', 3, 150626);
INSERT INTO `shop_region` VALUES (745, 62, '伊金霍洛旗', 3, 150627);
INSERT INTO `shop_region` VALUES (746, 63, '海拉尔区', 3, 150702);
INSERT INTO `shop_region` VALUES (747, 63, '扎赉诺尔区', 3, 150703);
INSERT INTO `shop_region` VALUES (748, 63, '阿荣旗', 3, 150721);
INSERT INTO `shop_region` VALUES (749, 63, '莫力达瓦达斡尔族自治旗', 3, 150722);
INSERT INTO `shop_region` VALUES (750, 63, '鄂伦春自治旗', 3, 150723);
INSERT INTO `shop_region` VALUES (751, 63, '鄂温克族自治旗', 3, 150724);
INSERT INTO `shop_region` VALUES (752, 63, '陈巴尔虎旗', 3, 150725);
INSERT INTO `shop_region` VALUES (753, 63, '新巴尔虎左旗', 3, 150726);
INSERT INTO `shop_region` VALUES (754, 63, '新巴尔虎右旗', 3, 150727);
INSERT INTO `shop_region` VALUES (755, 63, '满洲里市', 3, 150781);
INSERT INTO `shop_region` VALUES (756, 63, '牙克石市', 3, 150782);
INSERT INTO `shop_region` VALUES (757, 63, '扎兰屯市', 3, 150783);
INSERT INTO `shop_region` VALUES (758, 63, '额尔古纳市', 3, 150784);
INSERT INTO `shop_region` VALUES (759, 63, '根河市', 3, 150785);
INSERT INTO `shop_region` VALUES (760, 64, '临河区', 3, 150802);
INSERT INTO `shop_region` VALUES (761, 64, '五原县', 3, 150821);
INSERT INTO `shop_region` VALUES (762, 64, '磴口县', 3, 150822);
INSERT INTO `shop_region` VALUES (763, 64, '乌拉特前旗', 3, 150823);
INSERT INTO `shop_region` VALUES (764, 64, '乌拉特中旗', 3, 150824);
INSERT INTO `shop_region` VALUES (765, 64, '乌拉特后旗', 3, 150825);
INSERT INTO `shop_region` VALUES (766, 64, '杭锦后旗', 3, 150826);
INSERT INTO `shop_region` VALUES (767, 65, '集宁区', 3, 150902);
INSERT INTO `shop_region` VALUES (768, 65, '卓资县', 3, 150921);
INSERT INTO `shop_region` VALUES (769, 65, '化德县', 3, 150922);
INSERT INTO `shop_region` VALUES (770, 65, '商都县', 3, 150923);
INSERT INTO `shop_region` VALUES (771, 65, '兴和县', 3, 150924);
INSERT INTO `shop_region` VALUES (772, 65, '凉城县', 3, 150925);
INSERT INTO `shop_region` VALUES (773, 65, '察哈尔右翼前旗', 3, 150926);
INSERT INTO `shop_region` VALUES (774, 65, '察哈尔右翼中旗', 3, 150927);
INSERT INTO `shop_region` VALUES (775, 65, '察哈尔右翼后旗', 3, 150928);
INSERT INTO `shop_region` VALUES (776, 65, '四子王旗', 3, 150929);
INSERT INTO `shop_region` VALUES (777, 65, '丰镇市', 3, 150981);
INSERT INTO `shop_region` VALUES (778, 66, '乌兰浩特市', 3, 152201);
INSERT INTO `shop_region` VALUES (779, 66, '阿尔山市', 3, 152202);
INSERT INTO `shop_region` VALUES (780, 66, '科尔沁右翼前旗', 3, 152221);
INSERT INTO `shop_region` VALUES (781, 66, '科尔沁右翼中旗', 3, 152222);
INSERT INTO `shop_region` VALUES (782, 66, '扎赉特旗', 3, 152223);
INSERT INTO `shop_region` VALUES (783, 66, '突泉县', 3, 152224);
INSERT INTO `shop_region` VALUES (784, 67, '二连浩特市', 3, 152501);
INSERT INTO `shop_region` VALUES (785, 67, '锡林浩特市', 3, 152502);
INSERT INTO `shop_region` VALUES (786, 67, '阿巴嘎旗', 3, 152522);
INSERT INTO `shop_region` VALUES (787, 67, '苏尼特左旗', 3, 152523);
INSERT INTO `shop_region` VALUES (788, 67, '苏尼特右旗', 3, 152524);
INSERT INTO `shop_region` VALUES (789, 67, '东乌珠穆沁旗', 3, 152525);
INSERT INTO `shop_region` VALUES (790, 67, '西乌珠穆沁旗', 3, 152526);
INSERT INTO `shop_region` VALUES (791, 67, '太仆寺旗', 3, 152527);
INSERT INTO `shop_region` VALUES (792, 67, '镶黄旗', 3, 152528);
INSERT INTO `shop_region` VALUES (793, 67, '正镶白旗', 3, 152529);
INSERT INTO `shop_region` VALUES (794, 67, '正蓝旗', 3, 152530);
INSERT INTO `shop_region` VALUES (795, 67, '多伦县', 3, 152531);
INSERT INTO `shop_region` VALUES (796, 68, '阿拉善左旗', 3, 152921);
INSERT INTO `shop_region` VALUES (797, 68, '阿拉善右旗', 3, 152922);
INSERT INTO `shop_region` VALUES (798, 68, '额济纳旗', 3, 152923);
INSERT INTO `shop_region` VALUES (799, 69, '和平区', 3, 210102);
INSERT INTO `shop_region` VALUES (800, 69, '沈河区', 3, 210103);
INSERT INTO `shop_region` VALUES (801, 69, '大东区', 3, 210104);
INSERT INTO `shop_region` VALUES (802, 69, '皇姑区', 3, 210105);
INSERT INTO `shop_region` VALUES (803, 69, '铁西区', 3, 210106);
INSERT INTO `shop_region` VALUES (804, 69, '苏家屯区', 3, 210111);
INSERT INTO `shop_region` VALUES (805, 69, '浑南区', 3, 210112);
INSERT INTO `shop_region` VALUES (806, 69, '沈北新区', 3, 210113);
INSERT INTO `shop_region` VALUES (807, 69, '于洪区', 3, 210114);
INSERT INTO `shop_region` VALUES (808, 69, '辽中区', 3, 210115);
INSERT INTO `shop_region` VALUES (809, 69, '康平县', 3, 210123);
INSERT INTO `shop_region` VALUES (810, 69, '法库县', 3, 210124);
INSERT INTO `shop_region` VALUES (811, 69, '新民市', 3, 210181);
INSERT INTO `shop_region` VALUES (812, 70, '中山区', 3, 210202);
INSERT INTO `shop_region` VALUES (813, 70, '西岗区', 3, 210203);
INSERT INTO `shop_region` VALUES (814, 70, '沙河口区', 3, 210204);
INSERT INTO `shop_region` VALUES (815, 70, '甘井子区', 3, 210211);
INSERT INTO `shop_region` VALUES (816, 70, '旅顺口区', 3, 210212);
INSERT INTO `shop_region` VALUES (817, 70, '金州区', 3, 210213);
INSERT INTO `shop_region` VALUES (818, 70, '普兰店区', 3, 210214);
INSERT INTO `shop_region` VALUES (819, 70, '长海县', 3, 210224);
INSERT INTO `shop_region` VALUES (820, 70, '瓦房店市', 3, 210281);
INSERT INTO `shop_region` VALUES (821, 70, '庄河市', 3, 210283);
INSERT INTO `shop_region` VALUES (822, 71, '铁东区', 3, 210302);
INSERT INTO `shop_region` VALUES (823, 71, '铁西区', 3, 210303);
INSERT INTO `shop_region` VALUES (824, 71, '立山区', 3, 210304);
INSERT INTO `shop_region` VALUES (825, 71, '千山区', 3, 210311);
INSERT INTO `shop_region` VALUES (826, 71, '台安县', 3, 210321);
INSERT INTO `shop_region` VALUES (827, 71, '岫岩满族自治县', 3, 210323);
INSERT INTO `shop_region` VALUES (828, 71, '海城市', 3, 210381);
INSERT INTO `shop_region` VALUES (829, 72, '新抚区', 3, 210402);
INSERT INTO `shop_region` VALUES (830, 72, '东洲区', 3, 210403);
INSERT INTO `shop_region` VALUES (831, 72, '望花区', 3, 210404);
INSERT INTO `shop_region` VALUES (832, 72, '顺城区', 3, 210411);
INSERT INTO `shop_region` VALUES (833, 72, '抚顺县', 3, 210421);
INSERT INTO `shop_region` VALUES (834, 72, '新宾满族自治县', 3, 210422);
INSERT INTO `shop_region` VALUES (835, 72, '清原满族自治县', 3, 210423);
INSERT INTO `shop_region` VALUES (836, 73, '平山区', 3, 210502);
INSERT INTO `shop_region` VALUES (837, 73, '溪湖区', 3, 210503);
INSERT INTO `shop_region` VALUES (838, 73, '明山区', 3, 210504);
INSERT INTO `shop_region` VALUES (839, 73, '南芬区', 3, 210505);
INSERT INTO `shop_region` VALUES (840, 73, '本溪满族自治县', 3, 210521);
INSERT INTO `shop_region` VALUES (841, 73, '桓仁满族自治县', 3, 210522);
INSERT INTO `shop_region` VALUES (842, 74, '元宝区', 3, 210602);
INSERT INTO `shop_region` VALUES (843, 74, '振兴区', 3, 210603);
INSERT INTO `shop_region` VALUES (844, 74, '振安区', 3, 210604);
INSERT INTO `shop_region` VALUES (845, 74, '宽甸满族自治县', 3, 210624);
INSERT INTO `shop_region` VALUES (846, 74, '东港市', 3, 210681);
INSERT INTO `shop_region` VALUES (847, 74, '凤城市', 3, 210682);
INSERT INTO `shop_region` VALUES (848, 75, '古塔区', 3, 210702);
INSERT INTO `shop_region` VALUES (849, 75, '凌河区', 3, 210703);
INSERT INTO `shop_region` VALUES (850, 75, '太和区', 3, 210711);
INSERT INTO `shop_region` VALUES (851, 75, '黑山县', 3, 210726);
INSERT INTO `shop_region` VALUES (852, 75, '义县', 3, 210727);
INSERT INTO `shop_region` VALUES (853, 75, '凌海市', 3, 210781);
INSERT INTO `shop_region` VALUES (854, 75, '北镇市', 3, 210782);
INSERT INTO `shop_region` VALUES (855, 76, '站前区', 3, 210802);
INSERT INTO `shop_region` VALUES (856, 76, '西市区', 3, 210803);
INSERT INTO `shop_region` VALUES (857, 76, '鲅鱼圈区', 3, 210804);
INSERT INTO `shop_region` VALUES (858, 76, '老边区', 3, 210811);
INSERT INTO `shop_region` VALUES (859, 76, '盖州市', 3, 210881);
INSERT INTO `shop_region` VALUES (860, 76, '大石桥市', 3, 210882);
INSERT INTO `shop_region` VALUES (861, 77, '海州区', 3, 210902);
INSERT INTO `shop_region` VALUES (862, 77, '新邱区', 3, 210903);
INSERT INTO `shop_region` VALUES (863, 77, '太平区', 3, 210904);
INSERT INTO `shop_region` VALUES (864, 77, '清河门区', 3, 210905);
INSERT INTO `shop_region` VALUES (865, 77, '细河区', 3, 210911);
INSERT INTO `shop_region` VALUES (866, 77, '阜新蒙古族自治县', 3, 210921);
INSERT INTO `shop_region` VALUES (867, 77, '彰武县', 3, 210922);
INSERT INTO `shop_region` VALUES (868, 78, '白塔区', 3, 211002);
INSERT INTO `shop_region` VALUES (869, 78, '文圣区', 3, 211003);
INSERT INTO `shop_region` VALUES (870, 78, '宏伟区', 3, 211004);
INSERT INTO `shop_region` VALUES (871, 78, '弓长岭区', 3, 211005);
INSERT INTO `shop_region` VALUES (872, 78, '太子河区', 3, 211011);
INSERT INTO `shop_region` VALUES (873, 78, '辽阳县', 3, 211021);
INSERT INTO `shop_region` VALUES (874, 78, '灯塔市', 3, 211081);
INSERT INTO `shop_region` VALUES (875, 79, '双台子区', 3, 211102);
INSERT INTO `shop_region` VALUES (876, 79, '兴隆台区', 3, 211103);
INSERT INTO `shop_region` VALUES (877, 79, '大洼区', 3, 211104);
INSERT INTO `shop_region` VALUES (878, 79, '盘山县', 3, 211122);
INSERT INTO `shop_region` VALUES (879, 80, '银州区', 3, 211202);
INSERT INTO `shop_region` VALUES (880, 80, '清河区', 3, 211204);
INSERT INTO `shop_region` VALUES (881, 80, '铁岭县', 3, 211221);
INSERT INTO `shop_region` VALUES (882, 80, '西丰县', 3, 211223);
INSERT INTO `shop_region` VALUES (883, 80, '昌图县', 3, 211224);
INSERT INTO `shop_region` VALUES (884, 80, '调兵山市', 3, 211281);
INSERT INTO `shop_region` VALUES (885, 80, '开原市', 3, 211282);
INSERT INTO `shop_region` VALUES (886, 81, '双塔区', 3, 211302);
INSERT INTO `shop_region` VALUES (887, 81, '龙城区', 3, 211303);
INSERT INTO `shop_region` VALUES (888, 81, '朝阳县', 3, 211321);
INSERT INTO `shop_region` VALUES (889, 81, '建平县', 3, 211322);
INSERT INTO `shop_region` VALUES (890, 81, '喀喇沁左翼蒙古族自治县', 3, 211324);
INSERT INTO `shop_region` VALUES (891, 81, '北票市', 3, 211381);
INSERT INTO `shop_region` VALUES (892, 81, '凌源市', 3, 211382);
INSERT INTO `shop_region` VALUES (893, 82, '连山区', 3, 211402);
INSERT INTO `shop_region` VALUES (894, 82, '龙港区', 3, 211403);
INSERT INTO `shop_region` VALUES (895, 82, '南票区', 3, 211404);
INSERT INTO `shop_region` VALUES (896, 82, '绥中县', 3, 211421);
INSERT INTO `shop_region` VALUES (897, 82, '建昌县', 3, 211422);
INSERT INTO `shop_region` VALUES (898, 82, '兴城市', 3, 211481);
INSERT INTO `shop_region` VALUES (899, 83, '南关区', 3, 220102);
INSERT INTO `shop_region` VALUES (900, 83, '宽城区', 3, 220103);
INSERT INTO `shop_region` VALUES (901, 83, '朝阳区', 3, 220104);
INSERT INTO `shop_region` VALUES (902, 83, '二道区', 3, 220105);
INSERT INTO `shop_region` VALUES (903, 83, '绿园区', 3, 220106);
INSERT INTO `shop_region` VALUES (904, 83, '双阳区', 3, 220112);
INSERT INTO `shop_region` VALUES (905, 83, '九台区', 3, 220113);
INSERT INTO `shop_region` VALUES (906, 83, '农安县', 3, 220122);
INSERT INTO `shop_region` VALUES (907, 83, '榆树市', 3, 220182);
INSERT INTO `shop_region` VALUES (908, 83, '德惠市', 3, 220183);
INSERT INTO `shop_region` VALUES (909, 84, '昌邑区', 3, 220202);
INSERT INTO `shop_region` VALUES (910, 84, '龙潭区', 3, 220203);
INSERT INTO `shop_region` VALUES (911, 84, '船营区', 3, 220204);
INSERT INTO `shop_region` VALUES (912, 84, '丰满区', 3, 220211);
INSERT INTO `shop_region` VALUES (913, 84, '永吉县', 3, 220221);
INSERT INTO `shop_region` VALUES (914, 84, '蛟河市', 3, 220281);
INSERT INTO `shop_region` VALUES (915, 84, '桦甸市', 3, 220282);
INSERT INTO `shop_region` VALUES (916, 84, '舒兰市', 3, 220283);
INSERT INTO `shop_region` VALUES (917, 84, '磐石市', 3, 220284);
INSERT INTO `shop_region` VALUES (918, 85, '铁西区', 3, 220302);
INSERT INTO `shop_region` VALUES (919, 85, '铁东区', 3, 220303);
INSERT INTO `shop_region` VALUES (920, 85, '梨树县', 3, 220322);
INSERT INTO `shop_region` VALUES (921, 85, '伊通满族自治县', 3, 220323);
INSERT INTO `shop_region` VALUES (922, 85, '公主岭市', 3, 220381);
INSERT INTO `shop_region` VALUES (923, 85, '双辽市', 3, 220382);
INSERT INTO `shop_region` VALUES (924, 86, '龙山区', 3, 220402);
INSERT INTO `shop_region` VALUES (925, 86, '西安区', 3, 220403);
INSERT INTO `shop_region` VALUES (926, 86, '东丰县', 3, 220421);
INSERT INTO `shop_region` VALUES (927, 86, '东辽县', 3, 220422);
INSERT INTO `shop_region` VALUES (928, 87, '东昌区', 3, 220502);
INSERT INTO `shop_region` VALUES (929, 87, '二道江区', 3, 220503);
INSERT INTO `shop_region` VALUES (930, 87, '通化县', 3, 220521);
INSERT INTO `shop_region` VALUES (931, 87, '辉南县', 3, 220523);
INSERT INTO `shop_region` VALUES (932, 87, '柳河县', 3, 220524);
INSERT INTO `shop_region` VALUES (933, 87, '梅河口市', 3, 220581);
INSERT INTO `shop_region` VALUES (934, 87, '集安市', 3, 220582);
INSERT INTO `shop_region` VALUES (935, 88, '浑江区', 3, 220602);
INSERT INTO `shop_region` VALUES (936, 88, '江源区', 3, 220605);
INSERT INTO `shop_region` VALUES (937, 88, '抚松县', 3, 220621);
INSERT INTO `shop_region` VALUES (938, 88, '靖宇县', 3, 220622);
INSERT INTO `shop_region` VALUES (939, 88, '长白朝鲜族自治县', 3, 220623);
INSERT INTO `shop_region` VALUES (940, 88, '临江市', 3, 220681);
INSERT INTO `shop_region` VALUES (941, 89, '宁江区', 3, 220702);
INSERT INTO `shop_region` VALUES (942, 89, '前郭尔罗斯蒙古族自治县', 3, 220721);
INSERT INTO `shop_region` VALUES (943, 89, '长岭县', 3, 220722);
INSERT INTO `shop_region` VALUES (944, 89, '乾安县', 3, 220723);
INSERT INTO `shop_region` VALUES (945, 89, '扶余市', 3, 220781);
INSERT INTO `shop_region` VALUES (946, 90, '洮北区', 3, 220802);
INSERT INTO `shop_region` VALUES (947, 90, '镇赉县', 3, 220821);
INSERT INTO `shop_region` VALUES (948, 90, '通榆县', 3, 220822);
INSERT INTO `shop_region` VALUES (949, 90, '洮南市', 3, 220881);
INSERT INTO `shop_region` VALUES (950, 90, '大安市', 3, 220882);
INSERT INTO `shop_region` VALUES (951, 91, '延吉市', 3, 222401);
INSERT INTO `shop_region` VALUES (952, 91, '图们市', 3, 222402);
INSERT INTO `shop_region` VALUES (953, 91, '敦化市', 3, 222403);
INSERT INTO `shop_region` VALUES (954, 91, '珲春市', 3, 222404);
INSERT INTO `shop_region` VALUES (955, 91, '龙井市', 3, 222405);
INSERT INTO `shop_region` VALUES (956, 91, '和龙市', 3, 222406);
INSERT INTO `shop_region` VALUES (957, 91, '汪清县', 3, 222424);
INSERT INTO `shop_region` VALUES (958, 91, '安图县', 3, 222426);
INSERT INTO `shop_region` VALUES (959, 92, '道里区', 3, 230102);
INSERT INTO `shop_region` VALUES (960, 92, '南岗区', 3, 230103);
INSERT INTO `shop_region` VALUES (961, 92, '道外区', 3, 230104);
INSERT INTO `shop_region` VALUES (962, 92, '平房区', 3, 230108);
INSERT INTO `shop_region` VALUES (963, 92, '松北区', 3, 230109);
INSERT INTO `shop_region` VALUES (964, 92, '香坊区', 3, 230110);
INSERT INTO `shop_region` VALUES (965, 92, '呼兰区', 3, 230111);
INSERT INTO `shop_region` VALUES (966, 92, '阿城区', 3, 230112);
INSERT INTO `shop_region` VALUES (967, 92, '双城区', 3, 230113);
INSERT INTO `shop_region` VALUES (968, 92, '依兰县', 3, 230123);
INSERT INTO `shop_region` VALUES (969, 92, '方正县', 3, 230124);
INSERT INTO `shop_region` VALUES (970, 92, '宾县', 3, 230125);
INSERT INTO `shop_region` VALUES (971, 92, '巴彦县', 3, 230126);
INSERT INTO `shop_region` VALUES (972, 92, '木兰县', 3, 230127);
INSERT INTO `shop_region` VALUES (973, 92, '通河县', 3, 230128);
INSERT INTO `shop_region` VALUES (974, 92, '延寿县', 3, 230129);
INSERT INTO `shop_region` VALUES (975, 92, '尚志市', 3, 230183);
INSERT INTO `shop_region` VALUES (976, 92, '五常市', 3, 230184);
INSERT INTO `shop_region` VALUES (977, 93, '龙沙区', 3, 230202);
INSERT INTO `shop_region` VALUES (978, 93, '建华区', 3, 230203);
INSERT INTO `shop_region` VALUES (979, 93, '铁锋区', 3, 230204);
INSERT INTO `shop_region` VALUES (980, 93, '昂昂溪区', 3, 230205);
INSERT INTO `shop_region` VALUES (981, 93, '富拉尔基区', 3, 230206);
INSERT INTO `shop_region` VALUES (982, 93, '碾子山区', 3, 230207);
INSERT INTO `shop_region` VALUES (983, 93, '梅里斯达斡尔族区', 3, 230208);
INSERT INTO `shop_region` VALUES (984, 93, '龙江县', 3, 230221);
INSERT INTO `shop_region` VALUES (985, 93, '依安县', 3, 230223);
INSERT INTO `shop_region` VALUES (986, 93, '泰来县', 3, 230224);
INSERT INTO `shop_region` VALUES (987, 93, '甘南县', 3, 230225);
INSERT INTO `shop_region` VALUES (988, 93, '富裕县', 3, 230227);
INSERT INTO `shop_region` VALUES (989, 93, '克山县', 3, 230229);
INSERT INTO `shop_region` VALUES (990, 93, '克东县', 3, 230230);
INSERT INTO `shop_region` VALUES (991, 93, '拜泉县', 3, 230231);
INSERT INTO `shop_region` VALUES (992, 93, '讷河市', 3, 230281);
INSERT INTO `shop_region` VALUES (993, 94, '鸡冠区', 3, 230302);
INSERT INTO `shop_region` VALUES (994, 94, '恒山区', 3, 230303);
INSERT INTO `shop_region` VALUES (995, 94, '滴道区', 3, 230304);
INSERT INTO `shop_region` VALUES (996, 94, '梨树区', 3, 230305);
INSERT INTO `shop_region` VALUES (997, 94, '城子河区', 3, 230306);
INSERT INTO `shop_region` VALUES (998, 94, '麻山区', 3, 230307);
INSERT INTO `shop_region` VALUES (999, 94, '鸡东县', 3, 230321);
INSERT INTO `shop_region` VALUES (1000, 94, '虎林市', 3, 230381);
INSERT INTO `shop_region` VALUES (1001, 94, '密山市', 3, 230382);
INSERT INTO `shop_region` VALUES (1002, 95, '向阳区', 3, 230402);
INSERT INTO `shop_region` VALUES (1003, 95, '工农区', 3, 230403);
INSERT INTO `shop_region` VALUES (1004, 95, '南山区', 3, 230404);
INSERT INTO `shop_region` VALUES (1005, 95, '兴安区', 3, 230405);
INSERT INTO `shop_region` VALUES (1006, 95, '东山区', 3, 230406);
INSERT INTO `shop_region` VALUES (1007, 95, '兴山区', 3, 230407);
INSERT INTO `shop_region` VALUES (1008, 95, '萝北县', 3, 230421);
INSERT INTO `shop_region` VALUES (1009, 95, '绥滨县', 3, 230422);
INSERT INTO `shop_region` VALUES (1010, 96, '尖山区', 3, 230502);
INSERT INTO `shop_region` VALUES (1011, 96, '岭东区', 3, 230503);
INSERT INTO `shop_region` VALUES (1012, 96, '四方台区', 3, 230505);
INSERT INTO `shop_region` VALUES (1013, 96, '宝山区', 3, 230506);
INSERT INTO `shop_region` VALUES (1014, 96, '集贤县', 3, 230521);
INSERT INTO `shop_region` VALUES (1015, 96, '友谊县', 3, 230522);
INSERT INTO `shop_region` VALUES (1016, 96, '宝清县', 3, 230523);
INSERT INTO `shop_region` VALUES (1017, 96, '饶河县', 3, 230524);
INSERT INTO `shop_region` VALUES (1018, 97, '萨尔图区', 3, 230602);
INSERT INTO `shop_region` VALUES (1019, 97, '龙凤区', 3, 230603);
INSERT INTO `shop_region` VALUES (1020, 97, '让胡路区', 3, 230604);
INSERT INTO `shop_region` VALUES (1021, 97, '红岗区', 3, 230605);
INSERT INTO `shop_region` VALUES (1022, 97, '大同区', 3, 230606);
INSERT INTO `shop_region` VALUES (1023, 97, '肇州县', 3, 230621);
INSERT INTO `shop_region` VALUES (1024, 97, '肇源县', 3, 230622);
INSERT INTO `shop_region` VALUES (1025, 97, '林甸县', 3, 230623);
INSERT INTO `shop_region` VALUES (1026, 97, '杜尔伯特蒙古族自治县', 3, 230624);
INSERT INTO `shop_region` VALUES (1027, 98, '伊春区', 3, 230702);
INSERT INTO `shop_region` VALUES (1028, 98, '南岔区', 3, 230703);
INSERT INTO `shop_region` VALUES (1029, 98, '友好区', 3, 230704);
INSERT INTO `shop_region` VALUES (1030, 98, '西林区', 3, 230705);
INSERT INTO `shop_region` VALUES (1031, 98, '翠峦区', 3, 230706);
INSERT INTO `shop_region` VALUES (1032, 98, '新青区', 3, 230707);
INSERT INTO `shop_region` VALUES (1033, 98, '美溪区', 3, 230708);
INSERT INTO `shop_region` VALUES (1034, 98, '金山屯区', 3, 230709);
INSERT INTO `shop_region` VALUES (1035, 98, '五营区', 3, 230710);
INSERT INTO `shop_region` VALUES (1036, 98, '乌马河区', 3, 230711);
INSERT INTO `shop_region` VALUES (1037, 98, '汤旺河区', 3, 230712);
INSERT INTO `shop_region` VALUES (1038, 98, '带岭区', 3, 230713);
INSERT INTO `shop_region` VALUES (1039, 98, '乌伊岭区', 3, 230714);
INSERT INTO `shop_region` VALUES (1040, 98, '红星区', 3, 230715);
INSERT INTO `shop_region` VALUES (1041, 98, '上甘岭区', 3, 230716);
INSERT INTO `shop_region` VALUES (1042, 98, '嘉荫县', 3, 230722);
INSERT INTO `shop_region` VALUES (1043, 98, '铁力市', 3, 230781);
INSERT INTO `shop_region` VALUES (1044, 99, '向阳区', 3, 230803);
INSERT INTO `shop_region` VALUES (1045, 99, '前进区', 3, 230804);
INSERT INTO `shop_region` VALUES (1046, 99, '东风区', 3, 230805);
INSERT INTO `shop_region` VALUES (1047, 99, '郊区', 3, 230811);
INSERT INTO `shop_region` VALUES (1048, 99, '桦南县', 3, 230822);
INSERT INTO `shop_region` VALUES (1049, 99, '桦川县', 3, 230826);
INSERT INTO `shop_region` VALUES (1050, 99, '汤原县', 3, 230828);
INSERT INTO `shop_region` VALUES (1051, 99, '同江市', 3, 230881);
INSERT INTO `shop_region` VALUES (1052, 99, '富锦市', 3, 230882);
INSERT INTO `shop_region` VALUES (1053, 99, '抚远市', 3, 230883);
INSERT INTO `shop_region` VALUES (1054, 100, '新兴区', 3, 230902);
INSERT INTO `shop_region` VALUES (1055, 100, '桃山区', 3, 230903);
INSERT INTO `shop_region` VALUES (1056, 100, '茄子河区', 3, 230904);
INSERT INTO `shop_region` VALUES (1057, 100, '勃利县', 3, 230921);
INSERT INTO `shop_region` VALUES (1058, 101, '东安区', 3, 231002);
INSERT INTO `shop_region` VALUES (1059, 101, '阳明区', 3, 231003);
INSERT INTO `shop_region` VALUES (1060, 101, '爱民区', 3, 231004);
INSERT INTO `shop_region` VALUES (1061, 101, '西安区', 3, 231005);
INSERT INTO `shop_region` VALUES (1062, 101, '林口县', 3, 231025);
INSERT INTO `shop_region` VALUES (1063, 101, '绥芬河市', 3, 231081);
INSERT INTO `shop_region` VALUES (1064, 101, '海林市', 3, 231083);
INSERT INTO `shop_region` VALUES (1065, 101, '宁安市', 3, 231084);
INSERT INTO `shop_region` VALUES (1066, 101, '穆棱市', 3, 231085);
INSERT INTO `shop_region` VALUES (1067, 101, '东宁市', 3, 231086);
INSERT INTO `shop_region` VALUES (1068, 102, '爱辉区', 3, 231102);
INSERT INTO `shop_region` VALUES (1069, 102, '嫩江县', 3, 231121);
INSERT INTO `shop_region` VALUES (1070, 102, '逊克县', 3, 231123);
INSERT INTO `shop_region` VALUES (1071, 102, '孙吴县', 3, 231124);
INSERT INTO `shop_region` VALUES (1072, 102, '北安市', 3, 231181);
INSERT INTO `shop_region` VALUES (1073, 102, '五大连池市', 3, 231182);
INSERT INTO `shop_region` VALUES (1074, 103, '北林区', 3, 231202);
INSERT INTO `shop_region` VALUES (1075, 103, '望奎县', 3, 231221);
INSERT INTO `shop_region` VALUES (1076, 103, '兰西县', 3, 231222);
INSERT INTO `shop_region` VALUES (1077, 103, '青冈县', 3, 231223);
INSERT INTO `shop_region` VALUES (1078, 103, '庆安县', 3, 231224);
INSERT INTO `shop_region` VALUES (1079, 103, '明水县', 3, 231225);
INSERT INTO `shop_region` VALUES (1080, 103, '绥棱县', 3, 231226);
INSERT INTO `shop_region` VALUES (1081, 103, '安达市', 3, 231281);
INSERT INTO `shop_region` VALUES (1082, 103, '肇东市', 3, 231282);
INSERT INTO `shop_region` VALUES (1083, 103, '海伦市', 3, 231283);
INSERT INTO `shop_region` VALUES (1084, 104, '呼玛县', 3, 232721);
INSERT INTO `shop_region` VALUES (1085, 104, '塔河县', 3, 232722);
INSERT INTO `shop_region` VALUES (1086, 104, '漠河县', 3, 232723);
INSERT INTO `shop_region` VALUES (1087, 105, '黄浦区', 3, 310101);
INSERT INTO `shop_region` VALUES (1088, 105, '徐汇区', 3, 310104);
INSERT INTO `shop_region` VALUES (1089, 105, '长宁区', 3, 310105);
INSERT INTO `shop_region` VALUES (1090, 105, '静安区', 3, 310106);
INSERT INTO `shop_region` VALUES (1091, 105, '普陀区', 3, 310107);
INSERT INTO `shop_region` VALUES (1092, 105, '虹口区', 3, 310109);
INSERT INTO `shop_region` VALUES (1093, 105, '杨浦区', 3, 310110);
INSERT INTO `shop_region` VALUES (1094, 105, '闵行区', 3, 310112);
INSERT INTO `shop_region` VALUES (1095, 105, '宝山区', 3, 310113);
INSERT INTO `shop_region` VALUES (1096, 105, '嘉定区', 3, 310114);
INSERT INTO `shop_region` VALUES (1097, 105, '浦东新区', 3, 310115);
INSERT INTO `shop_region` VALUES (1098, 105, '金山区', 3, 310116);
INSERT INTO `shop_region` VALUES (1099, 105, '松江区', 3, 310117);
INSERT INTO `shop_region` VALUES (1100, 105, '青浦区', 3, 310118);
INSERT INTO `shop_region` VALUES (1101, 105, '奉贤区', 3, 310120);
INSERT INTO `shop_region` VALUES (1102, 105, '崇明区', 3, 310151);
INSERT INTO `shop_region` VALUES (1103, 106, '玄武区', 3, 320102);
INSERT INTO `shop_region` VALUES (1104, 106, '秦淮区', 3, 320104);
INSERT INTO `shop_region` VALUES (1105, 106, '建邺区', 3, 320105);
INSERT INTO `shop_region` VALUES (1106, 106, '鼓楼区', 3, 320106);
INSERT INTO `shop_region` VALUES (1107, 106, '浦口区', 3, 320111);
INSERT INTO `shop_region` VALUES (1108, 106, '栖霞区', 3, 320113);
INSERT INTO `shop_region` VALUES (1109, 106, '雨花台区', 3, 320114);
INSERT INTO `shop_region` VALUES (1110, 106, '江宁区', 3, 320115);
INSERT INTO `shop_region` VALUES (1111, 106, '六合区', 3, 320116);
INSERT INTO `shop_region` VALUES (1112, 106, '溧水区', 3, 320117);
INSERT INTO `shop_region` VALUES (1113, 106, '高淳区', 3, 320118);
INSERT INTO `shop_region` VALUES (1114, 107, '锡山区', 3, 320205);
INSERT INTO `shop_region` VALUES (1115, 107, '惠山区', 3, 320206);
INSERT INTO `shop_region` VALUES (1116, 107, '滨湖区', 3, 320211);
INSERT INTO `shop_region` VALUES (1117, 107, '梁溪区', 3, 320213);
INSERT INTO `shop_region` VALUES (1118, 107, '新吴区', 3, 320214);
INSERT INTO `shop_region` VALUES (1119, 107, '江阴市', 3, 320281);
INSERT INTO `shop_region` VALUES (1120, 107, '宜兴市', 3, 320282);
INSERT INTO `shop_region` VALUES (1121, 108, '鼓楼区', 3, 320302);
INSERT INTO `shop_region` VALUES (1122, 108, '云龙区', 3, 320303);
INSERT INTO `shop_region` VALUES (1123, 108, '贾汪区', 3, 320305);
INSERT INTO `shop_region` VALUES (1124, 108, '泉山区', 3, 320311);
INSERT INTO `shop_region` VALUES (1125, 108, '铜山区', 3, 320312);
INSERT INTO `shop_region` VALUES (1126, 108, '丰县', 3, 320321);
INSERT INTO `shop_region` VALUES (1127, 108, '沛县', 3, 320322);
INSERT INTO `shop_region` VALUES (1128, 108, '睢宁县', 3, 320324);
INSERT INTO `shop_region` VALUES (1129, 108, '新沂市', 3, 320381);
INSERT INTO `shop_region` VALUES (1130, 108, '邳州市', 3, 320382);
INSERT INTO `shop_region` VALUES (1131, 109, '天宁区', 3, 320402);
INSERT INTO `shop_region` VALUES (1132, 109, '钟楼区', 3, 320404);
INSERT INTO `shop_region` VALUES (1133, 109, '新北区', 3, 320411);
INSERT INTO `shop_region` VALUES (1134, 109, '武进区', 3, 320412);
INSERT INTO `shop_region` VALUES (1135, 109, '金坛区', 3, 320413);
INSERT INTO `shop_region` VALUES (1136, 109, '溧阳市', 3, 320481);
INSERT INTO `shop_region` VALUES (1137, 110, '虎丘区', 3, 320505);
INSERT INTO `shop_region` VALUES (1138, 110, '吴中区', 3, 320506);
INSERT INTO `shop_region` VALUES (1139, 110, '相城区', 3, 320507);
INSERT INTO `shop_region` VALUES (1140, 110, '姑苏区', 3, 320508);
INSERT INTO `shop_region` VALUES (1141, 110, '吴江区', 3, 320509);
INSERT INTO `shop_region` VALUES (1142, 110, '常熟市', 3, 320581);
INSERT INTO `shop_region` VALUES (1143, 110, '张家港市', 3, 320582);
INSERT INTO `shop_region` VALUES (1144, 110, '昆山市', 3, 320583);
INSERT INTO `shop_region` VALUES (1145, 110, '太仓市', 3, 320585);
INSERT INTO `shop_region` VALUES (1146, 111, '崇川区', 3, 320602);
INSERT INTO `shop_region` VALUES (1147, 111, '港闸区', 3, 320611);
INSERT INTO `shop_region` VALUES (1148, 111, '通州区', 3, 320612);
INSERT INTO `shop_region` VALUES (1149, 111, '海安县', 3, 320621);
INSERT INTO `shop_region` VALUES (1150, 111, '如东县', 3, 320623);
INSERT INTO `shop_region` VALUES (1151, 111, '启东市', 3, 320681);
INSERT INTO `shop_region` VALUES (1152, 111, '如皋市', 3, 320682);
INSERT INTO `shop_region` VALUES (1153, 111, '海门市', 3, 320684);
INSERT INTO `shop_region` VALUES (1154, 112, '连云区', 3, 320703);
INSERT INTO `shop_region` VALUES (1155, 112, '海州区', 3, 320706);
INSERT INTO `shop_region` VALUES (1156, 112, '赣榆区', 3, 320707);
INSERT INTO `shop_region` VALUES (1157, 112, '东海县', 3, 320722);
INSERT INTO `shop_region` VALUES (1158, 112, '灌云县', 3, 320723);
INSERT INTO `shop_region` VALUES (1159, 112, '灌南县', 3, 320724);
INSERT INTO `shop_region` VALUES (1160, 113, '淮安区', 3, 320803);
INSERT INTO `shop_region` VALUES (1161, 113, '淮阴区', 3, 320804);
INSERT INTO `shop_region` VALUES (1162, 113, '清江浦区', 3, 320812);
INSERT INTO `shop_region` VALUES (1163, 113, '洪泽区', 3, 320813);
INSERT INTO `shop_region` VALUES (1164, 113, '涟水县', 3, 320826);
INSERT INTO `shop_region` VALUES (1165, 113, '盱眙县', 3, 320830);
INSERT INTO `shop_region` VALUES (1166, 113, '金湖县', 3, 320831);
INSERT INTO `shop_region` VALUES (1167, 114, '亭湖区', 3, 320902);
INSERT INTO `shop_region` VALUES (1168, 114, '盐都区', 3, 320903);
INSERT INTO `shop_region` VALUES (1169, 114, '大丰区', 3, 320904);
INSERT INTO `shop_region` VALUES (1170, 114, '响水县', 3, 320921);
INSERT INTO `shop_region` VALUES (1171, 114, '滨海县', 3, 320922);
INSERT INTO `shop_region` VALUES (1172, 114, '阜宁县', 3, 320923);
INSERT INTO `shop_region` VALUES (1173, 114, '射阳县', 3, 320924);
INSERT INTO `shop_region` VALUES (1174, 114, '建湖县', 3, 320925);
INSERT INTO `shop_region` VALUES (1175, 114, '东台市', 3, 320981);
INSERT INTO `shop_region` VALUES (1176, 115, '广陵区', 3, 321002);
INSERT INTO `shop_region` VALUES (1177, 115, '邗江区', 3, 321003);
INSERT INTO `shop_region` VALUES (1178, 115, '江都区', 3, 321012);
INSERT INTO `shop_region` VALUES (1179, 115, '宝应县', 3, 321023);
INSERT INTO `shop_region` VALUES (1180, 115, '仪征市', 3, 321081);
INSERT INTO `shop_region` VALUES (1181, 115, '高邮市', 3, 321084);
INSERT INTO `shop_region` VALUES (1182, 116, '京口区', 3, 321102);
INSERT INTO `shop_region` VALUES (1183, 116, '润州区', 3, 321111);
INSERT INTO `shop_region` VALUES (1184, 116, '丹徒区', 3, 321112);
INSERT INTO `shop_region` VALUES (1185, 116, '丹阳市', 3, 321181);
INSERT INTO `shop_region` VALUES (1186, 116, '扬中市', 3, 321182);
INSERT INTO `shop_region` VALUES (1187, 116, '句容市', 3, 321183);
INSERT INTO `shop_region` VALUES (1188, 117, '海陵区', 3, 321202);
INSERT INTO `shop_region` VALUES (1189, 117, '高港区', 3, 321203);
INSERT INTO `shop_region` VALUES (1190, 117, '姜堰区', 3, 321204);
INSERT INTO `shop_region` VALUES (1191, 117, '兴化市', 3, 321281);
INSERT INTO `shop_region` VALUES (1192, 117, '靖江市', 3, 321282);
INSERT INTO `shop_region` VALUES (1193, 117, '泰兴市', 3, 321283);
INSERT INTO `shop_region` VALUES (1194, 118, '宿城区', 3, 321302);
INSERT INTO `shop_region` VALUES (1195, 118, '宿豫区', 3, 321311);
INSERT INTO `shop_region` VALUES (1196, 118, '沭阳县', 3, 321322);
INSERT INTO `shop_region` VALUES (1197, 118, '泗阳县', 3, 321323);
INSERT INTO `shop_region` VALUES (1198, 118, '泗洪县', 3, 321324);
INSERT INTO `shop_region` VALUES (1199, 119, '上城区', 3, 330102);
INSERT INTO `shop_region` VALUES (1200, 119, '下城区', 3, 330103);
INSERT INTO `shop_region` VALUES (1201, 119, '江干区', 3, 330104);
INSERT INTO `shop_region` VALUES (1202, 119, '拱墅区', 3, 330105);
INSERT INTO `shop_region` VALUES (1203, 119, '西湖区', 3, 330106);
INSERT INTO `shop_region` VALUES (1204, 119, '滨江区', 3, 330108);
INSERT INTO `shop_region` VALUES (1205, 119, '萧山区', 3, 330109);
INSERT INTO `shop_region` VALUES (1206, 119, '余杭区', 3, 330110);
INSERT INTO `shop_region` VALUES (1207, 119, '富阳区', 3, 330111);
INSERT INTO `shop_region` VALUES (1208, 119, '桐庐县', 3, 330122);
INSERT INTO `shop_region` VALUES (1209, 119, '淳安县', 3, 330127);
INSERT INTO `shop_region` VALUES (1210, 119, '建德市', 3, 330182);
INSERT INTO `shop_region` VALUES (1211, 119, '临安市', 3, 330185);
INSERT INTO `shop_region` VALUES (1212, 120, '海曙区', 3, 330203);
INSERT INTO `shop_region` VALUES (1213, 120, '江东区', 3, 330204);
INSERT INTO `shop_region` VALUES (1214, 120, '江北区', 3, 330205);
INSERT INTO `shop_region` VALUES (1215, 120, '北仑区', 3, 330206);
INSERT INTO `shop_region` VALUES (1216, 120, '镇海区', 3, 330211);
INSERT INTO `shop_region` VALUES (1217, 120, '鄞州区', 3, 330212);
INSERT INTO `shop_region` VALUES (1218, 120, '象山县', 3, 330225);
INSERT INTO `shop_region` VALUES (1219, 120, '宁海县', 3, 330226);
INSERT INTO `shop_region` VALUES (1220, 120, '余姚市', 3, 330281);
INSERT INTO `shop_region` VALUES (1221, 120, '慈溪市', 3, 330282);
INSERT INTO `shop_region` VALUES (1222, 120, '奉化市', 3, 330283);
INSERT INTO `shop_region` VALUES (1223, 121, '鹿城区', 3, 330302);
INSERT INTO `shop_region` VALUES (1224, 121, '龙湾区', 3, 330303);
INSERT INTO `shop_region` VALUES (1225, 121, '瓯海区', 3, 330304);
INSERT INTO `shop_region` VALUES (1226, 121, '洞头区', 3, 330305);
INSERT INTO `shop_region` VALUES (1227, 121, '永嘉县', 3, 330324);
INSERT INTO `shop_region` VALUES (1228, 121, '平阳县', 3, 330326);
INSERT INTO `shop_region` VALUES (1229, 121, '苍南县', 3, 330327);
INSERT INTO `shop_region` VALUES (1230, 121, '文成县', 3, 330328);
INSERT INTO `shop_region` VALUES (1231, 121, '泰顺县', 3, 330329);
INSERT INTO `shop_region` VALUES (1232, 121, '瑞安市', 3, 330381);
INSERT INTO `shop_region` VALUES (1233, 121, '乐清市', 3, 330382);
INSERT INTO `shop_region` VALUES (1234, 122, '南湖区', 3, 330402);
INSERT INTO `shop_region` VALUES (1235, 122, '秀洲区', 3, 330411);
INSERT INTO `shop_region` VALUES (1236, 122, '嘉善县', 3, 330421);
INSERT INTO `shop_region` VALUES (1237, 122, '海盐县', 3, 330424);
INSERT INTO `shop_region` VALUES (1238, 122, '海宁市', 3, 330481);
INSERT INTO `shop_region` VALUES (1239, 122, '平湖市', 3, 330482);
INSERT INTO `shop_region` VALUES (1240, 122, '桐乡市', 3, 330483);
INSERT INTO `shop_region` VALUES (1241, 123, '吴兴区', 3, 330502);
INSERT INTO `shop_region` VALUES (1242, 123, '南浔区', 3, 330503);
INSERT INTO `shop_region` VALUES (1243, 123, '德清县', 3, 330521);
INSERT INTO `shop_region` VALUES (1244, 123, '长兴县', 3, 330522);
INSERT INTO `shop_region` VALUES (1245, 123, '安吉县', 3, 330523);
INSERT INTO `shop_region` VALUES (1246, 124, '越城区', 3, 330602);
INSERT INTO `shop_region` VALUES (1247, 124, '柯桥区', 3, 330603);
INSERT INTO `shop_region` VALUES (1248, 124, '上虞区', 3, 330604);
INSERT INTO `shop_region` VALUES (1249, 124, '新昌县', 3, 330624);
INSERT INTO `shop_region` VALUES (1250, 124, '诸暨市', 3, 330681);
INSERT INTO `shop_region` VALUES (1251, 124, '嵊州市', 3, 330683);
INSERT INTO `shop_region` VALUES (1252, 125, '婺城区', 3, 330702);
INSERT INTO `shop_region` VALUES (1253, 125, '金东区', 3, 330703);
INSERT INTO `shop_region` VALUES (1254, 125, '武义县', 3, 330723);
INSERT INTO `shop_region` VALUES (1255, 125, '浦江县', 3, 330726);
INSERT INTO `shop_region` VALUES (1256, 125, '磐安县', 3, 330727);
INSERT INTO `shop_region` VALUES (1257, 125, '兰溪市', 3, 330781);
INSERT INTO `shop_region` VALUES (1258, 125, '义乌市', 3, 330782);
INSERT INTO `shop_region` VALUES (1259, 125, '东阳市', 3, 330783);
INSERT INTO `shop_region` VALUES (1260, 125, '永康市', 3, 330784);
INSERT INTO `shop_region` VALUES (1261, 126, '柯城区', 3, 330802);
INSERT INTO `shop_region` VALUES (1262, 126, '衢江区', 3, 330803);
INSERT INTO `shop_region` VALUES (1263, 126, '常山县', 3, 330822);
INSERT INTO `shop_region` VALUES (1264, 126, '开化县', 3, 330824);
INSERT INTO `shop_region` VALUES (1265, 126, '龙游县', 3, 330825);
INSERT INTO `shop_region` VALUES (1266, 126, '江山市', 3, 330881);
INSERT INTO `shop_region` VALUES (1267, 127, '定海区', 3, 330902);
INSERT INTO `shop_region` VALUES (1268, 127, '普陀区', 3, 330903);
INSERT INTO `shop_region` VALUES (1269, 127, '岱山县', 3, 330921);
INSERT INTO `shop_region` VALUES (1270, 127, '嵊泗县', 3, 330922);
INSERT INTO `shop_region` VALUES (1271, 128, '椒江区', 3, 331002);
INSERT INTO `shop_region` VALUES (1272, 128, '黄岩区', 3, 331003);
INSERT INTO `shop_region` VALUES (1273, 128, '路桥区', 3, 331004);
INSERT INTO `shop_region` VALUES (1274, 128, '玉环县', 3, 331021);
INSERT INTO `shop_region` VALUES (1275, 128, '三门县', 3, 331022);
INSERT INTO `shop_region` VALUES (1276, 128, '天台县', 3, 331023);
INSERT INTO `shop_region` VALUES (1277, 128, '仙居县', 3, 331024);
INSERT INTO `shop_region` VALUES (1278, 128, '温岭市', 3, 331081);
INSERT INTO `shop_region` VALUES (1279, 128, '临海市', 3, 331082);
INSERT INTO `shop_region` VALUES (1280, 129, '莲都区', 3, 331102);
INSERT INTO `shop_region` VALUES (1281, 129, '青田县', 3, 331121);
INSERT INTO `shop_region` VALUES (1282, 129, '缙云县', 3, 331122);
INSERT INTO `shop_region` VALUES (1283, 129, '遂昌县', 3, 331123);
INSERT INTO `shop_region` VALUES (1284, 129, '松阳县', 3, 331124);
INSERT INTO `shop_region` VALUES (1285, 129, '云和县', 3, 331125);
INSERT INTO `shop_region` VALUES (1286, 129, '庆元县', 3, 331126);
INSERT INTO `shop_region` VALUES (1287, 129, '景宁畲族自治县', 3, 331127);
INSERT INTO `shop_region` VALUES (1288, 129, '龙泉市', 3, 331181);
INSERT INTO `shop_region` VALUES (1289, 130, '瑶海区', 3, 340102);
INSERT INTO `shop_region` VALUES (1290, 130, '庐阳区', 3, 340103);
INSERT INTO `shop_region` VALUES (1291, 130, '蜀山区', 3, 340104);
INSERT INTO `shop_region` VALUES (1292, 130, '包河区', 3, 340111);
INSERT INTO `shop_region` VALUES (1293, 130, '长丰县', 3, 340121);
INSERT INTO `shop_region` VALUES (1294, 130, '肥东县', 3, 340122);
INSERT INTO `shop_region` VALUES (1295, 130, '肥西县', 3, 340123);
INSERT INTO `shop_region` VALUES (1296, 130, '庐江县', 3, 340124);
INSERT INTO `shop_region` VALUES (1297, 130, '巢湖市', 3, 340181);
INSERT INTO `shop_region` VALUES (1298, 131, '镜湖区', 3, 340202);
INSERT INTO `shop_region` VALUES (1299, 131, '弋江区', 3, 340203);
INSERT INTO `shop_region` VALUES (1300, 131, '鸠江区', 3, 340207);
INSERT INTO `shop_region` VALUES (1301, 131, '三山区', 3, 340208);
INSERT INTO `shop_region` VALUES (1302, 131, '芜湖县', 3, 340221);
INSERT INTO `shop_region` VALUES (1303, 131, '繁昌县', 3, 340222);
INSERT INTO `shop_region` VALUES (1304, 131, '南陵县', 3, 340223);
INSERT INTO `shop_region` VALUES (1305, 131, '无为县', 3, 340225);
INSERT INTO `shop_region` VALUES (1306, 132, '龙子湖区', 3, 340302);
INSERT INTO `shop_region` VALUES (1307, 132, '蚌山区', 3, 340303);
INSERT INTO `shop_region` VALUES (1308, 132, '禹会区', 3, 340304);
INSERT INTO `shop_region` VALUES (1309, 132, '淮上区', 3, 340311);
INSERT INTO `shop_region` VALUES (1310, 132, '怀远县', 3, 340321);
INSERT INTO `shop_region` VALUES (1311, 132, '五河县', 3, 340322);
INSERT INTO `shop_region` VALUES (1312, 132, '固镇县', 3, 340323);
INSERT INTO `shop_region` VALUES (1313, 133, '大通区', 3, 340402);
INSERT INTO `shop_region` VALUES (1314, 133, '田家庵区', 3, 340403);
INSERT INTO `shop_region` VALUES (1315, 133, '谢家集区', 3, 340404);
INSERT INTO `shop_region` VALUES (1316, 133, '八公山区', 3, 340405);
INSERT INTO `shop_region` VALUES (1317, 133, '潘集区', 3, 340406);
INSERT INTO `shop_region` VALUES (1318, 133, '凤台县', 3, 340421);
INSERT INTO `shop_region` VALUES (1319, 133, '寿县', 3, 340422);
INSERT INTO `shop_region` VALUES (1320, 134, '花山区', 3, 340503);
INSERT INTO `shop_region` VALUES (1321, 134, '雨山区', 3, 340504);
INSERT INTO `shop_region` VALUES (1322, 134, '博望区', 3, 340506);
INSERT INTO `shop_region` VALUES (1323, 134, '当涂县', 3, 340521);
INSERT INTO `shop_region` VALUES (1324, 134, '含山县', 3, 340522);
INSERT INTO `shop_region` VALUES (1325, 134, '和县', 3, 340523);
INSERT INTO `shop_region` VALUES (1326, 135, '杜集区', 3, 340602);
INSERT INTO `shop_region` VALUES (1327, 135, '相山区', 3, 340603);
INSERT INTO `shop_region` VALUES (1328, 135, '烈山区', 3, 340604);
INSERT INTO `shop_region` VALUES (1329, 135, '濉溪县', 3, 340621);
INSERT INTO `shop_region` VALUES (1330, 136, '铜官区', 3, 340705);
INSERT INTO `shop_region` VALUES (1331, 136, '义安区', 3, 340706);
INSERT INTO `shop_region` VALUES (1332, 136, '郊区', 3, 340711);
INSERT INTO `shop_region` VALUES (1333, 136, '枞阳县', 3, 340722);
INSERT INTO `shop_region` VALUES (1334, 137, '迎江区', 3, 340802);
INSERT INTO `shop_region` VALUES (1335, 137, '大观区', 3, 340803);
INSERT INTO `shop_region` VALUES (1336, 137, '宜秀区', 3, 340811);
INSERT INTO `shop_region` VALUES (1337, 137, '怀宁县', 3, 340822);
INSERT INTO `shop_region` VALUES (1338, 137, '潜山县', 3, 340824);
INSERT INTO `shop_region` VALUES (1339, 137, '太湖县', 3, 340825);
INSERT INTO `shop_region` VALUES (1340, 137, '宿松县', 3, 340826);
INSERT INTO `shop_region` VALUES (1341, 137, '望江县', 3, 340827);
INSERT INTO `shop_region` VALUES (1342, 137, '岳西县', 3, 340828);
INSERT INTO `shop_region` VALUES (1343, 137, '桐城市', 3, 340881);
INSERT INTO `shop_region` VALUES (1344, 138, '屯溪区', 3, 341002);
INSERT INTO `shop_region` VALUES (1345, 138, '黄山区', 3, 341003);
INSERT INTO `shop_region` VALUES (1346, 138, '徽州区', 3, 341004);
INSERT INTO `shop_region` VALUES (1347, 138, '歙县', 3, 341021);
INSERT INTO `shop_region` VALUES (1348, 138, '休宁县', 3, 341022);
INSERT INTO `shop_region` VALUES (1349, 138, '黟县', 3, 341023);
INSERT INTO `shop_region` VALUES (1350, 138, '祁门县', 3, 341024);
INSERT INTO `shop_region` VALUES (1351, 139, '琅琊区', 3, 341102);
INSERT INTO `shop_region` VALUES (1352, 139, '南谯区', 3, 341103);
INSERT INTO `shop_region` VALUES (1353, 139, '来安县', 3, 341122);
INSERT INTO `shop_region` VALUES (1354, 139, '全椒县', 3, 341124);
INSERT INTO `shop_region` VALUES (1355, 139, '定远县', 3, 341125);
INSERT INTO `shop_region` VALUES (1356, 139, '凤阳县', 3, 341126);
INSERT INTO `shop_region` VALUES (1357, 139, '天长市', 3, 341181);
INSERT INTO `shop_region` VALUES (1358, 139, '明光市', 3, 341182);
INSERT INTO `shop_region` VALUES (1359, 140, '颍州区', 3, 341202);
INSERT INTO `shop_region` VALUES (1360, 140, '颍东区', 3, 341203);
INSERT INTO `shop_region` VALUES (1361, 140, '颍泉区', 3, 341204);
INSERT INTO `shop_region` VALUES (1362, 140, '临泉县', 3, 341221);
INSERT INTO `shop_region` VALUES (1363, 140, '太和县', 3, 341222);
INSERT INTO `shop_region` VALUES (1364, 140, '阜南县', 3, 341225);
INSERT INTO `shop_region` VALUES (1365, 140, '颍上县', 3, 341226);
INSERT INTO `shop_region` VALUES (1366, 140, '界首市', 3, 341282);
INSERT INTO `shop_region` VALUES (1367, 141, '埇桥区', 3, 341302);
INSERT INTO `shop_region` VALUES (1368, 141, '砀山县', 3, 341321);
INSERT INTO `shop_region` VALUES (1369, 141, '萧县', 3, 341322);
INSERT INTO `shop_region` VALUES (1370, 141, '灵璧县', 3, 341323);
INSERT INTO `shop_region` VALUES (1371, 141, '泗县', 3, 341324);
INSERT INTO `shop_region` VALUES (1372, 142, '金安区', 3, 341502);
INSERT INTO `shop_region` VALUES (1373, 142, '裕安区', 3, 341503);
INSERT INTO `shop_region` VALUES (1374, 142, '叶集区', 3, 341504);
INSERT INTO `shop_region` VALUES (1375, 142, '霍邱县', 3, 341522);
INSERT INTO `shop_region` VALUES (1376, 142, '舒城县', 3, 341523);
INSERT INTO `shop_region` VALUES (1377, 142, '金寨县', 3, 341524);
INSERT INTO `shop_region` VALUES (1378, 142, '霍山县', 3, 341525);
INSERT INTO `shop_region` VALUES (1379, 143, '谯城区', 3, 341602);
INSERT INTO `shop_region` VALUES (1380, 143, '涡阳县', 3, 341621);
INSERT INTO `shop_region` VALUES (1381, 143, '蒙城县', 3, 341622);
INSERT INTO `shop_region` VALUES (1382, 143, '利辛县', 3, 341623);
INSERT INTO `shop_region` VALUES (1383, 144, '贵池区', 3, 341702);
INSERT INTO `shop_region` VALUES (1384, 144, '东至县', 3, 341721);
INSERT INTO `shop_region` VALUES (1385, 144, '石台县', 3, 341722);
INSERT INTO `shop_region` VALUES (1386, 144, '青阳县', 3, 341723);
INSERT INTO `shop_region` VALUES (1387, 145, '宣州区', 3, 341802);
INSERT INTO `shop_region` VALUES (1388, 145, '郎溪县', 3, 341821);
INSERT INTO `shop_region` VALUES (1389, 145, '广德县', 3, 341822);
INSERT INTO `shop_region` VALUES (1390, 145, '泾县', 3, 341823);
INSERT INTO `shop_region` VALUES (1391, 145, '绩溪县', 3, 341824);
INSERT INTO `shop_region` VALUES (1392, 145, '旌德县', 3, 341825);
INSERT INTO `shop_region` VALUES (1393, 145, '宁国市', 3, 341881);
INSERT INTO `shop_region` VALUES (1394, 146, '鼓楼区', 3, 350102);
INSERT INTO `shop_region` VALUES (1395, 146, '台江区', 3, 350103);
INSERT INTO `shop_region` VALUES (1396, 146, '仓山区', 3, 350104);
INSERT INTO `shop_region` VALUES (1397, 146, '马尾区', 3, 350105);
INSERT INTO `shop_region` VALUES (1398, 146, '晋安区', 3, 350111);
INSERT INTO `shop_region` VALUES (1399, 146, '闽侯县', 3, 350121);
INSERT INTO `shop_region` VALUES (1400, 146, '连江县', 3, 350122);
INSERT INTO `shop_region` VALUES (1401, 146, '罗源县', 3, 350123);
INSERT INTO `shop_region` VALUES (1402, 146, '闽清县', 3, 350124);
INSERT INTO `shop_region` VALUES (1403, 146, '永泰县', 3, 350125);
INSERT INTO `shop_region` VALUES (1404, 146, '平潭县', 3, 350128);
INSERT INTO `shop_region` VALUES (1405, 146, '福清市', 3, 350181);
INSERT INTO `shop_region` VALUES (1406, 146, '长乐市', 3, 350182);
INSERT INTO `shop_region` VALUES (1407, 147, '思明区', 3, 350203);
INSERT INTO `shop_region` VALUES (1408, 147, '海沧区', 3, 350205);
INSERT INTO `shop_region` VALUES (1409, 147, '湖里区', 3, 350206);
INSERT INTO `shop_region` VALUES (1410, 147, '集美区', 3, 350211);
INSERT INTO `shop_region` VALUES (1411, 147, '同安区', 3, 350212);
INSERT INTO `shop_region` VALUES (1412, 147, '翔安区', 3, 350213);
INSERT INTO `shop_region` VALUES (1413, 148, '城厢区', 3, 350302);
INSERT INTO `shop_region` VALUES (1414, 148, '涵江区', 3, 350303);
INSERT INTO `shop_region` VALUES (1415, 148, '荔城区', 3, 350304);
INSERT INTO `shop_region` VALUES (1416, 148, '秀屿区', 3, 350305);
INSERT INTO `shop_region` VALUES (1417, 148, '仙游县', 3, 350322);
INSERT INTO `shop_region` VALUES (1418, 149, '梅列区', 3, 350402);
INSERT INTO `shop_region` VALUES (1419, 149, '三元区', 3, 350403);
INSERT INTO `shop_region` VALUES (1420, 149, '明溪县', 3, 350421);
INSERT INTO `shop_region` VALUES (1421, 149, '清流县', 3, 350423);
INSERT INTO `shop_region` VALUES (1422, 149, '宁化县', 3, 350424);
INSERT INTO `shop_region` VALUES (1423, 149, '大田县', 3, 350425);
INSERT INTO `shop_region` VALUES (1424, 149, '尤溪县', 3, 350426);
INSERT INTO `shop_region` VALUES (1425, 149, '沙县', 3, 350427);
INSERT INTO `shop_region` VALUES (1426, 149, '将乐县', 3, 350428);
INSERT INTO `shop_region` VALUES (1427, 149, '泰宁县', 3, 350429);
INSERT INTO `shop_region` VALUES (1428, 149, '建宁县', 3, 350430);
INSERT INTO `shop_region` VALUES (1429, 149, '永安市', 3, 350481);
INSERT INTO `shop_region` VALUES (1430, 150, '鲤城区', 3, 350502);
INSERT INTO `shop_region` VALUES (1431, 150, '丰泽区', 3, 350503);
INSERT INTO `shop_region` VALUES (1432, 150, '洛江区', 3, 350504);
INSERT INTO `shop_region` VALUES (1433, 150, '泉港区', 3, 350505);
INSERT INTO `shop_region` VALUES (1434, 150, '惠安县', 3, 350521);
INSERT INTO `shop_region` VALUES (1435, 150, '安溪县', 3, 350524);
INSERT INTO `shop_region` VALUES (1436, 150, '永春县', 3, 350525);
INSERT INTO `shop_region` VALUES (1437, 150, '德化县', 3, 350526);
INSERT INTO `shop_region` VALUES (1438, 150, '金门县', 3, 350527);
INSERT INTO `shop_region` VALUES (1439, 150, '石狮市', 3, 350581);
INSERT INTO `shop_region` VALUES (1440, 150, '晋江市', 3, 350582);
INSERT INTO `shop_region` VALUES (1441, 150, '南安市', 3, 350583);
INSERT INTO `shop_region` VALUES (1442, 151, '芗城区', 3, 350602);
INSERT INTO `shop_region` VALUES (1443, 151, '龙文区', 3, 350603);
INSERT INTO `shop_region` VALUES (1444, 151, '云霄县', 3, 350622);
INSERT INTO `shop_region` VALUES (1445, 151, '漳浦县', 3, 350623);
INSERT INTO `shop_region` VALUES (1446, 151, '诏安县', 3, 350624);
INSERT INTO `shop_region` VALUES (1447, 151, '长泰县', 3, 350625);
INSERT INTO `shop_region` VALUES (1448, 151, '东山县', 3, 350626);
INSERT INTO `shop_region` VALUES (1449, 151, '南靖县', 3, 350627);
INSERT INTO `shop_region` VALUES (1450, 151, '平和县', 3, 350628);
INSERT INTO `shop_region` VALUES (1451, 151, '华安县', 3, 350629);
INSERT INTO `shop_region` VALUES (1452, 151, '龙海市', 3, 350681);
INSERT INTO `shop_region` VALUES (1453, 152, '延平区', 3, 350702);
INSERT INTO `shop_region` VALUES (1454, 152, '建阳区', 3, 350703);
INSERT INTO `shop_region` VALUES (1455, 152, '顺昌县', 3, 350721);
INSERT INTO `shop_region` VALUES (1456, 152, '浦城县', 3, 350722);
INSERT INTO `shop_region` VALUES (1457, 152, '光泽县', 3, 350723);
INSERT INTO `shop_region` VALUES (1458, 152, '松溪县', 3, 350724);
INSERT INTO `shop_region` VALUES (1459, 152, '政和县', 3, 350725);
INSERT INTO `shop_region` VALUES (1460, 152, '邵武市', 3, 350781);
INSERT INTO `shop_region` VALUES (1461, 152, '武夷山市', 3, 350782);
INSERT INTO `shop_region` VALUES (1462, 152, '建瓯市', 3, 350783);
INSERT INTO `shop_region` VALUES (1463, 153, '新罗区', 3, 350802);
INSERT INTO `shop_region` VALUES (1464, 153, '永定区', 3, 350803);
INSERT INTO `shop_region` VALUES (1465, 153, '长汀县', 3, 350821);
INSERT INTO `shop_region` VALUES (1466, 153, '上杭县', 3, 350823);
INSERT INTO `shop_region` VALUES (1467, 153, '武平县', 3, 350824);
INSERT INTO `shop_region` VALUES (1468, 153, '连城县', 3, 350825);
INSERT INTO `shop_region` VALUES (1469, 153, '漳平市', 3, 350881);
INSERT INTO `shop_region` VALUES (1470, 154, '蕉城区', 3, 350902);
INSERT INTO `shop_region` VALUES (1471, 154, '霞浦县', 3, 350921);
INSERT INTO `shop_region` VALUES (1472, 154, '古田县', 3, 350922);
INSERT INTO `shop_region` VALUES (1473, 154, '屏南县', 3, 350923);
INSERT INTO `shop_region` VALUES (1474, 154, '寿宁县', 3, 350924);
INSERT INTO `shop_region` VALUES (1475, 154, '周宁县', 3, 350925);
INSERT INTO `shop_region` VALUES (1476, 154, '柘荣县', 3, 350926);
INSERT INTO `shop_region` VALUES (1477, 154, '福安市', 3, 350981);
INSERT INTO `shop_region` VALUES (1478, 154, '福鼎市', 3, 350982);
INSERT INTO `shop_region` VALUES (1479, 155, '东湖区', 3, 360102);
INSERT INTO `shop_region` VALUES (1480, 155, '西湖区', 3, 360103);
INSERT INTO `shop_region` VALUES (1481, 155, '青云谱区', 3, 360104);
INSERT INTO `shop_region` VALUES (1482, 155, '湾里区', 3, 360105);
INSERT INTO `shop_region` VALUES (1483, 155, '青山湖区', 3, 360111);
INSERT INTO `shop_region` VALUES (1484, 155, '新建区', 3, 360112);
INSERT INTO `shop_region` VALUES (1485, 155, '南昌县', 3, 360121);
INSERT INTO `shop_region` VALUES (1486, 155, '安义县', 3, 360123);
INSERT INTO `shop_region` VALUES (1487, 155, '进贤县', 3, 360124);
INSERT INTO `shop_region` VALUES (1488, 156, '昌江区', 3, 360202);
INSERT INTO `shop_region` VALUES (1489, 156, '珠山区', 3, 360203);
INSERT INTO `shop_region` VALUES (1490, 156, '浮梁县', 3, 360222);
INSERT INTO `shop_region` VALUES (1491, 156, '乐平市', 3, 360281);
INSERT INTO `shop_region` VALUES (1492, 157, '安源区', 3, 360302);
INSERT INTO `shop_region` VALUES (1493, 157, '湘东区', 3, 360313);
INSERT INTO `shop_region` VALUES (1494, 157, '莲花县', 3, 360321);
INSERT INTO `shop_region` VALUES (1495, 157, '上栗县', 3, 360322);
INSERT INTO `shop_region` VALUES (1496, 157, '芦溪县', 3, 360323);
INSERT INTO `shop_region` VALUES (1497, 158, '濂溪区', 3, 360402);
INSERT INTO `shop_region` VALUES (1498, 158, '浔阳区', 3, 360403);
INSERT INTO `shop_region` VALUES (1499, 158, '九江县', 3, 360421);
INSERT INTO `shop_region` VALUES (1500, 158, '武宁县', 3, 360423);
INSERT INTO `shop_region` VALUES (1501, 158, '修水县', 3, 360424);
INSERT INTO `shop_region` VALUES (1502, 158, '永修县', 3, 360425);
INSERT INTO `shop_region` VALUES (1503, 158, '德安县', 3, 360426);
INSERT INTO `shop_region` VALUES (1504, 158, '都昌县', 3, 360428);
INSERT INTO `shop_region` VALUES (1505, 158, '湖口县', 3, 360429);
INSERT INTO `shop_region` VALUES (1506, 158, '彭泽县', 3, 360430);
INSERT INTO `shop_region` VALUES (1507, 158, '瑞昌市', 3, 360481);
INSERT INTO `shop_region` VALUES (1508, 158, '共青城市', 3, 360482);
INSERT INTO `shop_region` VALUES (1509, 158, '庐山市', 3, 360483);
INSERT INTO `shop_region` VALUES (1510, 159, '渝水区', 3, 360502);
INSERT INTO `shop_region` VALUES (1511, 159, '分宜县', 3, 360521);
INSERT INTO `shop_region` VALUES (1512, 160, '月湖区', 3, 360602);
INSERT INTO `shop_region` VALUES (1513, 160, '余江县', 3, 360622);
INSERT INTO `shop_region` VALUES (1514, 160, '贵溪市', 3, 360681);
INSERT INTO `shop_region` VALUES (1515, 161, '章贡区', 3, 360702);
INSERT INTO `shop_region` VALUES (1516, 161, '南康区', 3, 360703);
INSERT INTO `shop_region` VALUES (1517, 161, '赣县', 3, 360721);
INSERT INTO `shop_region` VALUES (1518, 161, '信丰县', 3, 360722);
INSERT INTO `shop_region` VALUES (1519, 161, '大余县', 3, 360723);
INSERT INTO `shop_region` VALUES (1520, 161, '上犹县', 3, 360724);
INSERT INTO `shop_region` VALUES (1521, 161, '崇义县', 3, 360725);
INSERT INTO `shop_region` VALUES (1522, 161, '安远县', 3, 360726);
INSERT INTO `shop_region` VALUES (1523, 161, '龙南县', 3, 360727);
INSERT INTO `shop_region` VALUES (1524, 161, '定南县', 3, 360728);
INSERT INTO `shop_region` VALUES (1525, 161, '全南县', 3, 360729);
INSERT INTO `shop_region` VALUES (1526, 161, '宁都县', 3, 360730);
INSERT INTO `shop_region` VALUES (1527, 161, '于都县', 3, 360731);
INSERT INTO `shop_region` VALUES (1528, 161, '兴国县', 3, 360732);
INSERT INTO `shop_region` VALUES (1529, 161, '会昌县', 3, 360733);
INSERT INTO `shop_region` VALUES (1530, 161, '寻乌县', 3, 360734);
INSERT INTO `shop_region` VALUES (1531, 161, '石城县', 3, 360735);
INSERT INTO `shop_region` VALUES (1532, 161, '瑞金市', 3, 360781);
INSERT INTO `shop_region` VALUES (1533, 162, '吉州区', 3, 360802);
INSERT INTO `shop_region` VALUES (1534, 162, '青原区', 3, 360803);
INSERT INTO `shop_region` VALUES (1535, 162, '吉安县', 3, 360821);
INSERT INTO `shop_region` VALUES (1536, 162, '吉水县', 3, 360822);
INSERT INTO `shop_region` VALUES (1537, 162, '峡江县', 3, 360823);
INSERT INTO `shop_region` VALUES (1538, 162, '新干县', 3, 360824);
INSERT INTO `shop_region` VALUES (1539, 162, '永丰县', 3, 360825);
INSERT INTO `shop_region` VALUES (1540, 162, '泰和县', 3, 360826);
INSERT INTO `shop_region` VALUES (1541, 162, '遂川县', 3, 360827);
INSERT INTO `shop_region` VALUES (1542, 162, '万安县', 3, 360828);
INSERT INTO `shop_region` VALUES (1543, 162, '安福县', 3, 360829);
INSERT INTO `shop_region` VALUES (1544, 162, '永新县', 3, 360830);
INSERT INTO `shop_region` VALUES (1545, 162, '井冈山市', 3, 360881);
INSERT INTO `shop_region` VALUES (1546, 163, '袁州区', 3, 360902);
INSERT INTO `shop_region` VALUES (1547, 163, '奉新县', 3, 360921);
INSERT INTO `shop_region` VALUES (1548, 163, '万载县', 3, 360922);
INSERT INTO `shop_region` VALUES (1549, 163, '上高县', 3, 360923);
INSERT INTO `shop_region` VALUES (1550, 163, '宜丰县', 3, 360924);
INSERT INTO `shop_region` VALUES (1551, 163, '靖安县', 3, 360925);
INSERT INTO `shop_region` VALUES (1552, 163, '铜鼓县', 3, 360926);
INSERT INTO `shop_region` VALUES (1553, 163, '丰城市', 3, 360981);
INSERT INTO `shop_region` VALUES (1554, 163, '樟树市', 3, 360982);
INSERT INTO `shop_region` VALUES (1555, 163, '高安市', 3, 360983);
INSERT INTO `shop_region` VALUES (1556, 164, '临川区', 3, 361002);
INSERT INTO `shop_region` VALUES (1557, 164, '南城县', 3, 361021);
INSERT INTO `shop_region` VALUES (1558, 164, '黎川县', 3, 361022);
INSERT INTO `shop_region` VALUES (1559, 164, '南丰县', 3, 361023);
INSERT INTO `shop_region` VALUES (1560, 164, '崇仁县', 3, 361024);
INSERT INTO `shop_region` VALUES (1561, 164, '乐安县', 3, 361025);
INSERT INTO `shop_region` VALUES (1562, 164, '宜黄县', 3, 361026);
INSERT INTO `shop_region` VALUES (1563, 164, '金溪县', 3, 361027);
INSERT INTO `shop_region` VALUES (1564, 164, '资溪县', 3, 361028);
INSERT INTO `shop_region` VALUES (1565, 164, '东乡县', 3, 361029);
INSERT INTO `shop_region` VALUES (1566, 164, '广昌县', 3, 361030);
INSERT INTO `shop_region` VALUES (1567, 165, '信州区', 3, 361102);
INSERT INTO `shop_region` VALUES (1568, 165, '广丰区', 3, 361103);
INSERT INTO `shop_region` VALUES (1569, 165, '上饶县', 3, 361121);
INSERT INTO `shop_region` VALUES (1570, 165, '玉山县', 3, 361123);
INSERT INTO `shop_region` VALUES (1571, 165, '铅山县', 3, 361124);
INSERT INTO `shop_region` VALUES (1572, 165, '横峰县', 3, 361125);
INSERT INTO `shop_region` VALUES (1573, 165, '弋阳县', 3, 361126);
INSERT INTO `shop_region` VALUES (1574, 165, '余干县', 3, 361127);
INSERT INTO `shop_region` VALUES (1575, 165, '鄱阳县', 3, 361128);
INSERT INTO `shop_region` VALUES (1576, 165, '万年县', 3, 361129);
INSERT INTO `shop_region` VALUES (1577, 165, '婺源县', 3, 361130);
INSERT INTO `shop_region` VALUES (1578, 165, '德兴市', 3, 361181);
INSERT INTO `shop_region` VALUES (1579, 166, '历下区', 3, 370102);
INSERT INTO `shop_region` VALUES (1580, 166, '市中区', 3, 370103);
INSERT INTO `shop_region` VALUES (1581, 166, '槐荫区', 3, 370104);
INSERT INTO `shop_region` VALUES (1582, 166, '天桥区', 3, 370105);
INSERT INTO `shop_region` VALUES (1583, 166, '历城区', 3, 370112);
INSERT INTO `shop_region` VALUES (1584, 166, '长清区', 3, 370113);
INSERT INTO `shop_region` VALUES (1585, 166, '平阴县', 3, 370124);
INSERT INTO `shop_region` VALUES (1586, 166, '济阳县', 3, 370125);
INSERT INTO `shop_region` VALUES (1587, 166, '商河县', 3, 370126);
INSERT INTO `shop_region` VALUES (1588, 166, '章丘市', 3, 370181);
INSERT INTO `shop_region` VALUES (1589, 167, '市南区', 3, 370202);
INSERT INTO `shop_region` VALUES (1590, 167, '市北区', 3, 370203);
INSERT INTO `shop_region` VALUES (1591, 167, '黄岛区', 3, 370211);
INSERT INTO `shop_region` VALUES (1592, 167, '崂山区', 3, 370212);
INSERT INTO `shop_region` VALUES (1593, 167, '李沧区', 3, 370213);
INSERT INTO `shop_region` VALUES (1594, 167, '城阳区', 3, 370214);
INSERT INTO `shop_region` VALUES (1595, 167, '胶州市', 3, 370281);
INSERT INTO `shop_region` VALUES (1596, 167, '即墨市', 3, 370282);
INSERT INTO `shop_region` VALUES (1597, 167, '平度市', 3, 370283);
INSERT INTO `shop_region` VALUES (1598, 167, '莱西市', 3, 370285);
INSERT INTO `shop_region` VALUES (1599, 168, '淄川区', 3, 370302);
INSERT INTO `shop_region` VALUES (1600, 168, '张店区', 3, 370303);
INSERT INTO `shop_region` VALUES (1601, 168, '博山区', 3, 370304);
INSERT INTO `shop_region` VALUES (1602, 168, '临淄区', 3, 370305);
INSERT INTO `shop_region` VALUES (1603, 168, '周村区', 3, 370306);
INSERT INTO `shop_region` VALUES (1604, 168, '桓台县', 3, 370321);
INSERT INTO `shop_region` VALUES (1605, 168, '高青县', 3, 370322);
INSERT INTO `shop_region` VALUES (1606, 168, '沂源县', 3, 370323);
INSERT INTO `shop_region` VALUES (1607, 169, '市中区', 3, 370402);
INSERT INTO `shop_region` VALUES (1608, 169, '薛城区', 3, 370403);
INSERT INTO `shop_region` VALUES (1609, 169, '峄城区', 3, 370404);
INSERT INTO `shop_region` VALUES (1610, 169, '台儿庄区', 3, 370405);
INSERT INTO `shop_region` VALUES (1611, 169, '山亭区', 3, 370406);
INSERT INTO `shop_region` VALUES (1612, 169, '滕州市', 3, 370481);
INSERT INTO `shop_region` VALUES (1613, 170, '东营区', 3, 370502);
INSERT INTO `shop_region` VALUES (1614, 170, '河口区', 3, 370503);
INSERT INTO `shop_region` VALUES (1615, 170, '垦利区', 3, 370505);
INSERT INTO `shop_region` VALUES (1616, 170, '利津县', 3, 370522);
INSERT INTO `shop_region` VALUES (1617, 170, '广饶县', 3, 370523);
INSERT INTO `shop_region` VALUES (1618, 171, '芝罘区', 3, 370602);
INSERT INTO `shop_region` VALUES (1619, 171, '福山区', 3, 370611);
INSERT INTO `shop_region` VALUES (1620, 171, '牟平区', 3, 370612);
INSERT INTO `shop_region` VALUES (1621, 171, '莱山区', 3, 370613);
INSERT INTO `shop_region` VALUES (1622, 171, '长岛县', 3, 370634);
INSERT INTO `shop_region` VALUES (1623, 171, '龙口市', 3, 370681);
INSERT INTO `shop_region` VALUES (1624, 171, '莱阳市', 3, 370682);
INSERT INTO `shop_region` VALUES (1625, 171, '莱州市', 3, 370683);
INSERT INTO `shop_region` VALUES (1626, 171, '蓬莱市', 3, 370684);
INSERT INTO `shop_region` VALUES (1627, 171, '招远市', 3, 370685);
INSERT INTO `shop_region` VALUES (1628, 171, '栖霞市', 3, 370686);
INSERT INTO `shop_region` VALUES (1629, 171, '海阳市', 3, 370687);
INSERT INTO `shop_region` VALUES (1630, 172, '潍城区', 3, 370702);
INSERT INTO `shop_region` VALUES (1631, 172, '寒亭区', 3, 370703);
INSERT INTO `shop_region` VALUES (1632, 172, '坊子区', 3, 370704);
INSERT INTO `shop_region` VALUES (1633, 172, '奎文区', 3, 370705);
INSERT INTO `shop_region` VALUES (1634, 172, '临朐县', 3, 370724);
INSERT INTO `shop_region` VALUES (1635, 172, '昌乐县', 3, 370725);
INSERT INTO `shop_region` VALUES (1636, 172, '青州市', 3, 370781);
INSERT INTO `shop_region` VALUES (1637, 172, '诸城市', 3, 370782);
INSERT INTO `shop_region` VALUES (1638, 172, '寿光市', 3, 370783);
INSERT INTO `shop_region` VALUES (1639, 172, '安丘市', 3, 370784);
INSERT INTO `shop_region` VALUES (1640, 172, '高密市', 3, 370785);
INSERT INTO `shop_region` VALUES (1641, 172, '昌邑市', 3, 370786);
INSERT INTO `shop_region` VALUES (1642, 173, '任城区', 3, 370811);
INSERT INTO `shop_region` VALUES (1643, 173, '兖州区', 3, 370812);
INSERT INTO `shop_region` VALUES (1644, 173, '微山县', 3, 370826);
INSERT INTO `shop_region` VALUES (1645, 173, '鱼台县', 3, 370827);
INSERT INTO `shop_region` VALUES (1646, 173, '金乡县', 3, 370828);
INSERT INTO `shop_region` VALUES (1647, 173, '嘉祥县', 3, 370829);
INSERT INTO `shop_region` VALUES (1648, 173, '汶上县', 3, 370830);
INSERT INTO `shop_region` VALUES (1649, 173, '泗水县', 3, 370831);
INSERT INTO `shop_region` VALUES (1650, 173, '梁山县', 3, 370832);
INSERT INTO `shop_region` VALUES (1651, 173, '曲阜市', 3, 370881);
INSERT INTO `shop_region` VALUES (1652, 173, '邹城市', 3, 370883);
INSERT INTO `shop_region` VALUES (1653, 174, '泰山区', 3, 370902);
INSERT INTO `shop_region` VALUES (1654, 174, '岱岳区', 3, 370911);
INSERT INTO `shop_region` VALUES (1655, 174, '宁阳县', 3, 370921);
INSERT INTO `shop_region` VALUES (1656, 174, '东平县', 3, 370923);
INSERT INTO `shop_region` VALUES (1657, 174, '新泰市', 3, 370982);
INSERT INTO `shop_region` VALUES (1658, 174, '肥城市', 3, 370983);
INSERT INTO `shop_region` VALUES (1659, 175, '环翠区', 3, 371002);
INSERT INTO `shop_region` VALUES (1660, 175, '文登区', 3, 371003);
INSERT INTO `shop_region` VALUES (1661, 175, '荣成市', 3, 371082);
INSERT INTO `shop_region` VALUES (1662, 175, '乳山市', 3, 371083);
INSERT INTO `shop_region` VALUES (1663, 176, '东港区', 3, 371102);
INSERT INTO `shop_region` VALUES (1664, 176, '岚山区', 3, 371103);
INSERT INTO `shop_region` VALUES (1665, 176, '五莲县', 3, 371121);
INSERT INTO `shop_region` VALUES (1666, 176, '莒县', 3, 371122);
INSERT INTO `shop_region` VALUES (1667, 177, '莱城区', 3, 371202);
INSERT INTO `shop_region` VALUES (1668, 177, '钢城区', 3, 371203);
INSERT INTO `shop_region` VALUES (1669, 178, '兰山区', 3, 371302);
INSERT INTO `shop_region` VALUES (1670, 178, '罗庄区', 3, 371311);
INSERT INTO `shop_region` VALUES (1671, 178, '河东区', 3, 371312);
INSERT INTO `shop_region` VALUES (1672, 178, '沂南县', 3, 371321);
INSERT INTO `shop_region` VALUES (1673, 178, '郯城县', 3, 371322);
INSERT INTO `shop_region` VALUES (1674, 178, '沂水县', 3, 371323);
INSERT INTO `shop_region` VALUES (1675, 178, '兰陵县', 3, 371324);
INSERT INTO `shop_region` VALUES (1676, 178, '费县', 3, 371325);
INSERT INTO `shop_region` VALUES (1677, 178, '平邑县', 3, 371326);
INSERT INTO `shop_region` VALUES (1678, 178, '莒南县', 3, 371327);
INSERT INTO `shop_region` VALUES (1679, 178, '蒙阴县', 3, 371328);
INSERT INTO `shop_region` VALUES (1680, 178, '临沭县', 3, 371329);
INSERT INTO `shop_region` VALUES (1681, 179, '德城区', 3, 371402);
INSERT INTO `shop_region` VALUES (1682, 179, '陵城区', 3, 371403);
INSERT INTO `shop_region` VALUES (1683, 179, '宁津县', 3, 371422);
INSERT INTO `shop_region` VALUES (1684, 179, '庆云县', 3, 371423);
INSERT INTO `shop_region` VALUES (1685, 179, '临邑县', 3, 371424);
INSERT INTO `shop_region` VALUES (1686, 179, '齐河县', 3, 371425);
INSERT INTO `shop_region` VALUES (1687, 179, '平原县', 3, 371426);
INSERT INTO `shop_region` VALUES (1688, 179, '夏津县', 3, 371427);
INSERT INTO `shop_region` VALUES (1689, 179, '武城县', 3, 371428);
INSERT INTO `shop_region` VALUES (1690, 179, '乐陵市', 3, 371481);
INSERT INTO `shop_region` VALUES (1691, 179, '禹城市', 3, 371482);
INSERT INTO `shop_region` VALUES (1692, 180, '东昌府区', 3, 371502);
INSERT INTO `shop_region` VALUES (1693, 180, '阳谷县', 3, 371521);
INSERT INTO `shop_region` VALUES (1694, 180, '莘县', 3, 371522);
INSERT INTO `shop_region` VALUES (1695, 180, '茌平县', 3, 371523);
INSERT INTO `shop_region` VALUES (1696, 180, '东阿县', 3, 371524);
INSERT INTO `shop_region` VALUES (1697, 180, '冠县', 3, 371525);
INSERT INTO `shop_region` VALUES (1698, 180, '高唐县', 3, 371526);
INSERT INTO `shop_region` VALUES (1699, 180, '临清市', 3, 371581);
INSERT INTO `shop_region` VALUES (1700, 181, '滨城区', 3, 371602);
INSERT INTO `shop_region` VALUES (1701, 181, '沾化区', 3, 371603);
INSERT INTO `shop_region` VALUES (1702, 181, '惠民县', 3, 371621);
INSERT INTO `shop_region` VALUES (1703, 181, '阳信县', 3, 371622);
INSERT INTO `shop_region` VALUES (1704, 181, '无棣县', 3, 371623);
INSERT INTO `shop_region` VALUES (1705, 181, '博兴县', 3, 371625);
INSERT INTO `shop_region` VALUES (1706, 181, '邹平县', 3, 371626);
INSERT INTO `shop_region` VALUES (1707, 182, '牡丹区', 3, 371702);
INSERT INTO `shop_region` VALUES (1708, 182, '定陶区', 3, 371703);
INSERT INTO `shop_region` VALUES (1709, 182, '曹县', 3, 371721);
INSERT INTO `shop_region` VALUES (1710, 182, '单县', 3, 371722);
INSERT INTO `shop_region` VALUES (1711, 182, '成武县', 3, 371723);
INSERT INTO `shop_region` VALUES (1712, 182, '巨野县', 3, 371724);
INSERT INTO `shop_region` VALUES (1713, 182, '郓城县', 3, 371725);
INSERT INTO `shop_region` VALUES (1714, 182, '鄄城县', 3, 371726);
INSERT INTO `shop_region` VALUES (1715, 182, '东明县', 3, 371728);
INSERT INTO `shop_region` VALUES (1716, 183, '中原区', 3, 410102);
INSERT INTO `shop_region` VALUES (1717, 183, '二七区', 3, 410103);
INSERT INTO `shop_region` VALUES (1718, 183, '管城回族区', 3, 410104);
INSERT INTO `shop_region` VALUES (1719, 183, '金水区', 3, 410105);
INSERT INTO `shop_region` VALUES (1720, 183, '上街区', 3, 410106);
INSERT INTO `shop_region` VALUES (1721, 183, '惠济区', 3, 410108);
INSERT INTO `shop_region` VALUES (1722, 183, '中牟县', 3, 410122);
INSERT INTO `shop_region` VALUES (1723, 183, '巩义市', 3, 410181);
INSERT INTO `shop_region` VALUES (1724, 183, '荥阳市', 3, 410182);
INSERT INTO `shop_region` VALUES (1725, 183, '新密市', 3, 410183);
INSERT INTO `shop_region` VALUES (1726, 183, '新郑市', 3, 410184);
INSERT INTO `shop_region` VALUES (1727, 183, '登封市', 3, 410185);
INSERT INTO `shop_region` VALUES (1728, 184, '龙亭区', 3, 410202);
INSERT INTO `shop_region` VALUES (1729, 184, '顺河回族区', 3, 410203);
INSERT INTO `shop_region` VALUES (1730, 184, '鼓楼区', 3, 410204);
INSERT INTO `shop_region` VALUES (1731, 184, '禹王台区', 3, 410205);
INSERT INTO `shop_region` VALUES (1732, 184, '金明区', 3, 410211);
INSERT INTO `shop_region` VALUES (1733, 184, '祥符区', 3, 410212);
INSERT INTO `shop_region` VALUES (1734, 184, '杞县', 3, 410221);
INSERT INTO `shop_region` VALUES (1735, 184, '通许县', 3, 410222);
INSERT INTO `shop_region` VALUES (1736, 184, '尉氏县', 3, 410223);
INSERT INTO `shop_region` VALUES (1737, 184, '兰考县', 3, 410225);
INSERT INTO `shop_region` VALUES (1738, 185, '老城区', 3, 410302);
INSERT INTO `shop_region` VALUES (1739, 185, '西工区', 3, 410303);
INSERT INTO `shop_region` VALUES (1740, 185, '瀍河回族区', 3, 410304);
INSERT INTO `shop_region` VALUES (1741, 185, '涧西区', 3, 410305);
INSERT INTO `shop_region` VALUES (1742, 185, '吉利区', 3, 410306);
INSERT INTO `shop_region` VALUES (1743, 185, '洛龙区', 3, 410311);
INSERT INTO `shop_region` VALUES (1744, 185, '孟津县', 3, 410322);
INSERT INTO `shop_region` VALUES (1745, 185, '新安县', 3, 410323);
INSERT INTO `shop_region` VALUES (1746, 185, '栾川县', 3, 410324);
INSERT INTO `shop_region` VALUES (1747, 185, '嵩县', 3, 410325);
INSERT INTO `shop_region` VALUES (1748, 185, '汝阳县', 3, 410326);
INSERT INTO `shop_region` VALUES (1749, 185, '宜阳县', 3, 410327);
INSERT INTO `shop_region` VALUES (1750, 185, '洛宁县', 3, 410328);
INSERT INTO `shop_region` VALUES (1751, 185, '伊川县', 3, 410329);
INSERT INTO `shop_region` VALUES (1752, 185, '偃师市', 3, 410381);
INSERT INTO `shop_region` VALUES (1753, 186, '新华区', 3, 410402);
INSERT INTO `shop_region` VALUES (1754, 186, '卫东区', 3, 410403);
INSERT INTO `shop_region` VALUES (1755, 186, '石龙区', 3, 410404);
INSERT INTO `shop_region` VALUES (1756, 186, '湛河区', 3, 410411);
INSERT INTO `shop_region` VALUES (1757, 186, '宝丰县', 3, 410421);
INSERT INTO `shop_region` VALUES (1758, 186, '叶县', 3, 410422);
INSERT INTO `shop_region` VALUES (1759, 186, '鲁山县', 3, 410423);
INSERT INTO `shop_region` VALUES (1760, 186, '郏县', 3, 410425);
INSERT INTO `shop_region` VALUES (1761, 186, '舞钢市', 3, 410481);
INSERT INTO `shop_region` VALUES (1762, 186, '汝州市', 3, 410482);
INSERT INTO `shop_region` VALUES (1763, 187, '文峰区', 3, 410502);
INSERT INTO `shop_region` VALUES (1764, 187, '北关区', 3, 410503);
INSERT INTO `shop_region` VALUES (1765, 187, '殷都区', 3, 410505);
INSERT INTO `shop_region` VALUES (1766, 187, '龙安区', 3, 410506);
INSERT INTO `shop_region` VALUES (1767, 187, '安阳县', 3, 410522);
INSERT INTO `shop_region` VALUES (1768, 187, '汤阴县', 3, 410523);
INSERT INTO `shop_region` VALUES (1769, 187, '滑县', 3, 410526);
INSERT INTO `shop_region` VALUES (1770, 187, '内黄县', 3, 410527);
INSERT INTO `shop_region` VALUES (1771, 187, '林州市', 3, 410581);
INSERT INTO `shop_region` VALUES (1772, 188, '鹤山区', 3, 410602);
INSERT INTO `shop_region` VALUES (1773, 188, '山城区', 3, 410603);
INSERT INTO `shop_region` VALUES (1774, 188, '淇滨区', 3, 410611);
INSERT INTO `shop_region` VALUES (1775, 188, '浚县', 3, 410621);
INSERT INTO `shop_region` VALUES (1776, 188, '淇县', 3, 410622);
INSERT INTO `shop_region` VALUES (1777, 189, '红旗区', 3, 410702);
INSERT INTO `shop_region` VALUES (1778, 189, '卫滨区', 3, 410703);
INSERT INTO `shop_region` VALUES (1779, 189, '凤泉区', 3, 410704);
INSERT INTO `shop_region` VALUES (1780, 189, '牧野区', 3, 410711);
INSERT INTO `shop_region` VALUES (1781, 189, '新乡县', 3, 410721);
INSERT INTO `shop_region` VALUES (1782, 189, '获嘉县', 3, 410724);
INSERT INTO `shop_region` VALUES (1783, 189, '原阳县', 3, 410725);
INSERT INTO `shop_region` VALUES (1784, 189, '延津县', 3, 410726);
INSERT INTO `shop_region` VALUES (1785, 189, '封丘县', 3, 410727);
INSERT INTO `shop_region` VALUES (1786, 189, '长垣县', 3, 410728);
INSERT INTO `shop_region` VALUES (1787, 189, '卫辉市', 3, 410781);
INSERT INTO `shop_region` VALUES (1788, 189, '辉县市', 3, 410782);
INSERT INTO `shop_region` VALUES (1789, 190, '解放区', 3, 410802);
INSERT INTO `shop_region` VALUES (1790, 190, '中站区', 3, 410803);
INSERT INTO `shop_region` VALUES (1791, 190, '马村区', 3, 410804);
INSERT INTO `shop_region` VALUES (1792, 190, '山阳区', 3, 410811);
INSERT INTO `shop_region` VALUES (1793, 190, '修武县', 3, 410821);
INSERT INTO `shop_region` VALUES (1794, 190, '博爱县', 3, 410822);
INSERT INTO `shop_region` VALUES (1795, 190, '武陟县', 3, 410823);
INSERT INTO `shop_region` VALUES (1796, 190, '温县', 3, 410825);
INSERT INTO `shop_region` VALUES (1797, 190, '沁阳市', 3, 410882);
INSERT INTO `shop_region` VALUES (1798, 190, '孟州市', 3, 410883);
INSERT INTO `shop_region` VALUES (1799, 191, '华龙区', 3, 410902);
INSERT INTO `shop_region` VALUES (1800, 191, '清丰县', 3, 410922);
INSERT INTO `shop_region` VALUES (1801, 191, '南乐县', 3, 410923);
INSERT INTO `shop_region` VALUES (1802, 191, '范县', 3, 410926);
INSERT INTO `shop_region` VALUES (1803, 191, '台前县', 3, 410927);
INSERT INTO `shop_region` VALUES (1804, 191, '濮阳县', 3, 410928);
INSERT INTO `shop_region` VALUES (1805, 192, '魏都区', 3, 411002);
INSERT INTO `shop_region` VALUES (1806, 192, '许昌县', 3, 411023);
INSERT INTO `shop_region` VALUES (1807, 192, '鄢陵县', 3, 411024);
INSERT INTO `shop_region` VALUES (1808, 192, '襄城县', 3, 411025);
INSERT INTO `shop_region` VALUES (1809, 192, '禹州市', 3, 411081);
INSERT INTO `shop_region` VALUES (1810, 192, '长葛市', 3, 411082);
INSERT INTO `shop_region` VALUES (1811, 193, '源汇区', 3, 411102);
INSERT INTO `shop_region` VALUES (1812, 193, '郾城区', 3, 411103);
INSERT INTO `shop_region` VALUES (1813, 193, '召陵区', 3, 411104);
INSERT INTO `shop_region` VALUES (1814, 193, '舞阳县', 3, 411121);
INSERT INTO `shop_region` VALUES (1815, 193, '临颍县', 3, 411122);
INSERT INTO `shop_region` VALUES (1816, 194, '湖滨区', 3, 411202);
INSERT INTO `shop_region` VALUES (1817, 194, '陕州区', 3, 411203);
INSERT INTO `shop_region` VALUES (1818, 194, '渑池县', 3, 411221);
INSERT INTO `shop_region` VALUES (1819, 194, '卢氏县', 3, 411224);
INSERT INTO `shop_region` VALUES (1820, 194, '义马市', 3, 411281);
INSERT INTO `shop_region` VALUES (1821, 194, '灵宝市', 3, 411282);
INSERT INTO `shop_region` VALUES (1822, 195, '宛城区', 3, 411302);
INSERT INTO `shop_region` VALUES (1823, 195, '卧龙区', 3, 411303);
INSERT INTO `shop_region` VALUES (1824, 195, '南召县', 3, 411321);
INSERT INTO `shop_region` VALUES (1825, 195, '方城县', 3, 411322);
INSERT INTO `shop_region` VALUES (1826, 195, '西峡县', 3, 411323);
INSERT INTO `shop_region` VALUES (1827, 195, '镇平县', 3, 411324);
INSERT INTO `shop_region` VALUES (1828, 195, '内乡县', 3, 411325);
INSERT INTO `shop_region` VALUES (1829, 195, '淅川县', 3, 411326);
INSERT INTO `shop_region` VALUES (1830, 195, '社旗县', 3, 411327);
INSERT INTO `shop_region` VALUES (1831, 195, '唐河县', 3, 411328);
INSERT INTO `shop_region` VALUES (1832, 195, '新野县', 3, 411329);
INSERT INTO `shop_region` VALUES (1833, 195, '桐柏县', 3, 411330);
INSERT INTO `shop_region` VALUES (1834, 195, '邓州市', 3, 411381);
INSERT INTO `shop_region` VALUES (1835, 196, '梁园区', 3, 411402);
INSERT INTO `shop_region` VALUES (1836, 196, '睢阳区', 3, 411403);
INSERT INTO `shop_region` VALUES (1837, 196, '民权县', 3, 411421);
INSERT INTO `shop_region` VALUES (1838, 196, '睢县', 3, 411422);
INSERT INTO `shop_region` VALUES (1839, 196, '宁陵县', 3, 411423);
INSERT INTO `shop_region` VALUES (1840, 196, '柘城县', 3, 411424);
INSERT INTO `shop_region` VALUES (1841, 196, '虞城县', 3, 411425);
INSERT INTO `shop_region` VALUES (1842, 196, '夏邑县', 3, 411426);
INSERT INTO `shop_region` VALUES (1843, 196, '永城市', 3, 411481);
INSERT INTO `shop_region` VALUES (1844, 197, '浉河区', 3, 411502);
INSERT INTO `shop_region` VALUES (1845, 197, '平桥区', 3, 411503);
INSERT INTO `shop_region` VALUES (1846, 197, '罗山县', 3, 411521);
INSERT INTO `shop_region` VALUES (1847, 197, '光山县', 3, 411522);
INSERT INTO `shop_region` VALUES (1848, 197, '新县', 3, 411523);
INSERT INTO `shop_region` VALUES (1849, 197, '商城县', 3, 411524);
INSERT INTO `shop_region` VALUES (1850, 197, '固始县', 3, 411525);
INSERT INTO `shop_region` VALUES (1851, 197, '潢川县', 3, 411526);
INSERT INTO `shop_region` VALUES (1852, 197, '淮滨县', 3, 411527);
INSERT INTO `shop_region` VALUES (1853, 197, '息县', 3, 411528);
INSERT INTO `shop_region` VALUES (1854, 198, '川汇区', 3, 411602);
INSERT INTO `shop_region` VALUES (1855, 198, '扶沟县', 3, 411621);
INSERT INTO `shop_region` VALUES (1856, 198, '西华县', 3, 411622);
INSERT INTO `shop_region` VALUES (1857, 198, '商水县', 3, 411623);
INSERT INTO `shop_region` VALUES (1858, 198, '沈丘县', 3, 411624);
INSERT INTO `shop_region` VALUES (1859, 198, '郸城县', 3, 411625);
INSERT INTO `shop_region` VALUES (1860, 198, '淮阳县', 3, 411626);
INSERT INTO `shop_region` VALUES (1861, 198, '太康县', 3, 411627);
INSERT INTO `shop_region` VALUES (1862, 198, '鹿邑县', 3, 411628);
INSERT INTO `shop_region` VALUES (1863, 198, '项城市', 3, 411681);
INSERT INTO `shop_region` VALUES (1864, 199, '驿城区', 3, 411702);
INSERT INTO `shop_region` VALUES (1865, 199, '西平县', 3, 411721);
INSERT INTO `shop_region` VALUES (1866, 199, '上蔡县', 3, 411722);
INSERT INTO `shop_region` VALUES (1867, 199, '平舆县', 3, 411723);
INSERT INTO `shop_region` VALUES (1868, 199, '正阳县', 3, 411724);
INSERT INTO `shop_region` VALUES (1869, 199, '确山县', 3, 411725);
INSERT INTO `shop_region` VALUES (1870, 199, '泌阳县', 3, 411726);
INSERT INTO `shop_region` VALUES (1871, 199, '汝南县', 3, 411727);
INSERT INTO `shop_region` VALUES (1872, 199, '遂平县', 3, 411728);
INSERT INTO `shop_region` VALUES (1873, 199, '新蔡县', 3, 411729);
INSERT INTO `shop_region` VALUES (1874, 200, '济源市', 3, 419001);
INSERT INTO `shop_region` VALUES (1875, 201, '江岸区', 3, 420102);
INSERT INTO `shop_region` VALUES (1876, 201, '江汉区', 3, 420103);
INSERT INTO `shop_region` VALUES (1877, 201, '硚口区', 3, 420104);
INSERT INTO `shop_region` VALUES (1878, 201, '汉阳区', 3, 420105);
INSERT INTO `shop_region` VALUES (1879, 201, '武昌区', 3, 420106);
INSERT INTO `shop_region` VALUES (1880, 201, '青山区', 3, 420107);
INSERT INTO `shop_region` VALUES (1881, 201, '洪山区', 3, 420111);
INSERT INTO `shop_region` VALUES (1882, 201, '东西湖区', 3, 420112);
INSERT INTO `shop_region` VALUES (1883, 201, '汉南区', 3, 420113);
INSERT INTO `shop_region` VALUES (1884, 201, '蔡甸区', 3, 420114);
INSERT INTO `shop_region` VALUES (1885, 201, '江夏区', 3, 420115);
INSERT INTO `shop_region` VALUES (1886, 201, '黄陂区', 3, 420116);
INSERT INTO `shop_region` VALUES (1887, 201, '新洲区', 3, 420117);
INSERT INTO `shop_region` VALUES (1888, 202, '黄石港区', 3, 420202);
INSERT INTO `shop_region` VALUES (1889, 202, '西塞山区', 3, 420203);
INSERT INTO `shop_region` VALUES (1890, 202, '下陆区', 3, 420204);
INSERT INTO `shop_region` VALUES (1891, 202, '铁山区', 3, 420205);
INSERT INTO `shop_region` VALUES (1892, 202, '阳新县', 3, 420222);
INSERT INTO `shop_region` VALUES (1893, 202, '大冶市', 3, 420281);
INSERT INTO `shop_region` VALUES (1894, 203, '茅箭区', 3, 420302);
INSERT INTO `shop_region` VALUES (1895, 203, '张湾区', 3, 420303);
INSERT INTO `shop_region` VALUES (1896, 203, '郧阳区', 3, 420304);
INSERT INTO `shop_region` VALUES (1897, 203, '郧西县', 3, 420322);
INSERT INTO `shop_region` VALUES (1898, 203, '竹山县', 3, 420323);
INSERT INTO `shop_region` VALUES (1899, 203, '竹溪县', 3, 420324);
INSERT INTO `shop_region` VALUES (1900, 203, '房县', 3, 420325);
INSERT INTO `shop_region` VALUES (1901, 203, '丹江口市', 3, 420381);
INSERT INTO `shop_region` VALUES (1902, 204, '西陵区', 3, 420502);
INSERT INTO `shop_region` VALUES (1903, 204, '伍家岗区', 3, 420503);
INSERT INTO `shop_region` VALUES (1904, 204, '点军区', 3, 420504);
INSERT INTO `shop_region` VALUES (1905, 204, '猇亭区', 3, 420505);
INSERT INTO `shop_region` VALUES (1906, 204, '夷陵区', 3, 420506);
INSERT INTO `shop_region` VALUES (1907, 204, '远安县', 3, 420525);
INSERT INTO `shop_region` VALUES (1908, 204, '兴山县', 3, 420526);
INSERT INTO `shop_region` VALUES (1909, 204, '秭归县', 3, 420527);
INSERT INTO `shop_region` VALUES (1910, 204, '长阳土家族自治县', 3, 420528);
INSERT INTO `shop_region` VALUES (1911, 204, '五峰土家族自治县', 3, 420529);
INSERT INTO `shop_region` VALUES (1912, 204, '宜都市', 3, 420581);
INSERT INTO `shop_region` VALUES (1913, 204, '当阳市', 3, 420582);
INSERT INTO `shop_region` VALUES (1914, 204, '枝江市', 3, 420583);
INSERT INTO `shop_region` VALUES (1915, 205, '襄城区', 3, 420602);
INSERT INTO `shop_region` VALUES (1916, 205, '樊城区', 3, 420606);
INSERT INTO `shop_region` VALUES (1917, 205, '襄州区', 3, 420607);
INSERT INTO `shop_region` VALUES (1918, 205, '南漳县', 3, 420624);
INSERT INTO `shop_region` VALUES (1919, 205, '谷城县', 3, 420625);
INSERT INTO `shop_region` VALUES (1920, 205, '保康县', 3, 420626);
INSERT INTO `shop_region` VALUES (1921, 205, '老河口市', 3, 420682);
INSERT INTO `shop_region` VALUES (1922, 205, '枣阳市', 3, 420683);
INSERT INTO `shop_region` VALUES (1923, 205, '宜城市', 3, 420684);
INSERT INTO `shop_region` VALUES (1924, 206, '梁子湖区', 3, 420702);
INSERT INTO `shop_region` VALUES (1925, 206, '华容区', 3, 420703);
INSERT INTO `shop_region` VALUES (1926, 206, '鄂城区', 3, 420704);
INSERT INTO `shop_region` VALUES (1927, 207, '东宝区', 3, 420802);
INSERT INTO `shop_region` VALUES (1928, 207, '掇刀区', 3, 420804);
INSERT INTO `shop_region` VALUES (1929, 207, '京山县', 3, 420821);
INSERT INTO `shop_region` VALUES (1930, 207, '沙洋县', 3, 420822);
INSERT INTO `shop_region` VALUES (1931, 207, '钟祥市', 3, 420881);
INSERT INTO `shop_region` VALUES (1932, 208, '孝南区', 3, 420902);
INSERT INTO `shop_region` VALUES (1933, 208, '孝昌县', 3, 420921);
INSERT INTO `shop_region` VALUES (1934, 208, '大悟县', 3, 420922);
INSERT INTO `shop_region` VALUES (1935, 208, '云梦县', 3, 420923);
INSERT INTO `shop_region` VALUES (1936, 208, '应城市', 3, 420981);
INSERT INTO `shop_region` VALUES (1937, 208, '安陆市', 3, 420982);
INSERT INTO `shop_region` VALUES (1938, 208, '汉川市', 3, 420984);
INSERT INTO `shop_region` VALUES (1939, 209, '沙市区', 3, 421002);
INSERT INTO `shop_region` VALUES (1940, 209, '荆州区', 3, 421003);
INSERT INTO `shop_region` VALUES (1941, 209, '公安县', 3, 421022);
INSERT INTO `shop_region` VALUES (1942, 209, '监利县', 3, 421023);
INSERT INTO `shop_region` VALUES (1943, 209, '江陵县', 3, 421024);
INSERT INTO `shop_region` VALUES (1944, 209, '石首市', 3, 421081);
INSERT INTO `shop_region` VALUES (1945, 209, '洪湖市', 3, 421083);
INSERT INTO `shop_region` VALUES (1946, 209, '松滋市', 3, 421087);
INSERT INTO `shop_region` VALUES (1947, 210, '黄州区', 3, 421102);
INSERT INTO `shop_region` VALUES (1948, 210, '团风县', 3, 421121);
INSERT INTO `shop_region` VALUES (1949, 210, '红安县', 3, 421122);
INSERT INTO `shop_region` VALUES (1950, 210, '罗田县', 3, 421123);
INSERT INTO `shop_region` VALUES (1951, 210, '英山县', 3, 421124);
INSERT INTO `shop_region` VALUES (1952, 210, '浠水县', 3, 421125);
INSERT INTO `shop_region` VALUES (1953, 210, '蕲春县', 3, 421126);
INSERT INTO `shop_region` VALUES (1954, 210, '黄梅县', 3, 421127);
INSERT INTO `shop_region` VALUES (1955, 210, '麻城市', 3, 421181);
INSERT INTO `shop_region` VALUES (1956, 210, '武穴市', 3, 421182);
INSERT INTO `shop_region` VALUES (1957, 211, '咸安区', 3, 421202);
INSERT INTO `shop_region` VALUES (1958, 211, '嘉鱼县', 3, 421221);
INSERT INTO `shop_region` VALUES (1959, 211, '通城县', 3, 421222);
INSERT INTO `shop_region` VALUES (1960, 211, '崇阳县', 3, 421223);
INSERT INTO `shop_region` VALUES (1961, 211, '通山县', 3, 421224);
INSERT INTO `shop_region` VALUES (1962, 211, '赤壁市', 3, 421281);
INSERT INTO `shop_region` VALUES (1963, 212, '曾都区', 3, 421303);
INSERT INTO `shop_region` VALUES (1964, 212, '随县', 3, 421321);
INSERT INTO `shop_region` VALUES (1965, 212, '广水市', 3, 421381);
INSERT INTO `shop_region` VALUES (1966, 213, '恩施市', 3, 422801);
INSERT INTO `shop_region` VALUES (1967, 213, '利川市', 3, 422802);
INSERT INTO `shop_region` VALUES (1968, 213, '建始县', 3, 422822);
INSERT INTO `shop_region` VALUES (1969, 213, '巴东县', 3, 422823);
INSERT INTO `shop_region` VALUES (1970, 213, '宣恩县', 3, 422825);
INSERT INTO `shop_region` VALUES (1971, 213, '咸丰县', 3, 422826);
INSERT INTO `shop_region` VALUES (1972, 213, '来凤县', 3, 422827);
INSERT INTO `shop_region` VALUES (1973, 213, '鹤峰县', 3, 422828);
INSERT INTO `shop_region` VALUES (1974, 214, '仙桃市', 3, 429004);
INSERT INTO `shop_region` VALUES (1975, 214, '潜江市', 3, 429005);
INSERT INTO `shop_region` VALUES (1976, 214, '天门市', 3, 429006);
INSERT INTO `shop_region` VALUES (1977, 214, '神农架林区', 3, 429021);
INSERT INTO `shop_region` VALUES (1978, 215, '芙蓉区', 3, 430102);
INSERT INTO `shop_region` VALUES (1979, 215, '天心区', 3, 430103);
INSERT INTO `shop_region` VALUES (1980, 215, '岳麓区', 3, 430104);
INSERT INTO `shop_region` VALUES (1981, 215, '开福区', 3, 430105);
INSERT INTO `shop_region` VALUES (1982, 215, '雨花区', 3, 430111);
INSERT INTO `shop_region` VALUES (1983, 215, '望城区', 3, 430112);
INSERT INTO `shop_region` VALUES (1984, 215, '长沙县', 3, 430121);
INSERT INTO `shop_region` VALUES (1985, 215, '宁乡县', 3, 430124);
INSERT INTO `shop_region` VALUES (1986, 215, '浏阳市', 3, 430181);
INSERT INTO `shop_region` VALUES (1987, 216, '荷塘区', 3, 430202);
INSERT INTO `shop_region` VALUES (1988, 216, '芦淞区', 3, 430203);
INSERT INTO `shop_region` VALUES (1989, 216, '石峰区', 3, 430204);
INSERT INTO `shop_region` VALUES (1990, 216, '天元区', 3, 430211);
INSERT INTO `shop_region` VALUES (1991, 216, '株洲县', 3, 430221);
INSERT INTO `shop_region` VALUES (1992, 216, '攸县', 3, 430223);
INSERT INTO `shop_region` VALUES (1993, 216, '茶陵县', 3, 430224);
INSERT INTO `shop_region` VALUES (1994, 216, '炎陵县', 3, 430225);
INSERT INTO `shop_region` VALUES (1995, 216, '醴陵市', 3, 430281);
INSERT INTO `shop_region` VALUES (1996, 217, '雨湖区', 3, 430302);
INSERT INTO `shop_region` VALUES (1997, 217, '岳塘区', 3, 430304);
INSERT INTO `shop_region` VALUES (1998, 217, '湘潭县', 3, 430321);
INSERT INTO `shop_region` VALUES (1999, 217, '湘乡市', 3, 430381);
INSERT INTO `shop_region` VALUES (2000, 217, '韶山市', 3, 430382);
INSERT INTO `shop_region` VALUES (2001, 218, '珠晖区', 3, 430405);
INSERT INTO `shop_region` VALUES (2002, 218, '雁峰区', 3, 430406);
INSERT INTO `shop_region` VALUES (2003, 218, '石鼓区', 3, 430407);
INSERT INTO `shop_region` VALUES (2004, 218, '蒸湘区', 3, 430408);
INSERT INTO `shop_region` VALUES (2005, 218, '南岳区', 3, 430412);
INSERT INTO `shop_region` VALUES (2006, 218, '衡阳县', 3, 430421);
INSERT INTO `shop_region` VALUES (2007, 218, '衡南县', 3, 430422);
INSERT INTO `shop_region` VALUES (2008, 218, '衡山县', 3, 430423);
INSERT INTO `shop_region` VALUES (2009, 218, '衡东县', 3, 430424);
INSERT INTO `shop_region` VALUES (2010, 218, '祁东县', 3, 430426);
INSERT INTO `shop_region` VALUES (2011, 218, '耒阳市', 3, 430481);
INSERT INTO `shop_region` VALUES (2012, 218, '常宁市', 3, 430482);
INSERT INTO `shop_region` VALUES (2013, 219, '双清区', 3, 430502);
INSERT INTO `shop_region` VALUES (2014, 219, '大祥区', 3, 430503);
INSERT INTO `shop_region` VALUES (2015, 219, '北塔区', 3, 430511);
INSERT INTO `shop_region` VALUES (2016, 219, '邵东县', 3, 430521);
INSERT INTO `shop_region` VALUES (2017, 219, '新邵县', 3, 430522);
INSERT INTO `shop_region` VALUES (2018, 219, '邵阳县', 3, 430523);
INSERT INTO `shop_region` VALUES (2019, 219, '隆回县', 3, 430524);
INSERT INTO `shop_region` VALUES (2020, 219, '洞口县', 3, 430525);
INSERT INTO `shop_region` VALUES (2021, 219, '绥宁县', 3, 430527);
INSERT INTO `shop_region` VALUES (2022, 219, '新宁县', 3, 430528);
INSERT INTO `shop_region` VALUES (2023, 219, '城步苗族自治县', 3, 430529);
INSERT INTO `shop_region` VALUES (2024, 219, '武冈市', 3, 430581);
INSERT INTO `shop_region` VALUES (2025, 220, '岳阳楼区', 3, 430602);
INSERT INTO `shop_region` VALUES (2026, 220, '云溪区', 3, 430603);
INSERT INTO `shop_region` VALUES (2027, 220, '君山区', 3, 430611);
INSERT INTO `shop_region` VALUES (2028, 220, '岳阳县', 3, 430621);
INSERT INTO `shop_region` VALUES (2029, 220, '华容县', 3, 430623);
INSERT INTO `shop_region` VALUES (2030, 220, '湘阴县', 3, 430624);
INSERT INTO `shop_region` VALUES (2031, 220, '平江县', 3, 430626);
INSERT INTO `shop_region` VALUES (2032, 220, '汨罗市', 3, 430681);
INSERT INTO `shop_region` VALUES (2033, 220, '临湘市', 3, 430682);
INSERT INTO `shop_region` VALUES (2034, 221, '武陵区', 3, 430702);
INSERT INTO `shop_region` VALUES (2035, 221, '鼎城区', 3, 430703);
INSERT INTO `shop_region` VALUES (2036, 221, '安乡县', 3, 430721);
INSERT INTO `shop_region` VALUES (2037, 221, '汉寿县', 3, 430722);
INSERT INTO `shop_region` VALUES (2038, 221, '澧县', 3, 430723);
INSERT INTO `shop_region` VALUES (2039, 221, '临澧县', 3, 430724);
INSERT INTO `shop_region` VALUES (2040, 221, '桃源县', 3, 430725);
INSERT INTO `shop_region` VALUES (2041, 221, '石门县', 3, 430726);
INSERT INTO `shop_region` VALUES (2042, 221, '津市市', 3, 430781);
INSERT INTO `shop_region` VALUES (2043, 222, '永定区', 3, 430802);
INSERT INTO `shop_region` VALUES (2044, 222, '武陵源区', 3, 430811);
INSERT INTO `shop_region` VALUES (2045, 222, '慈利县', 3, 430821);
INSERT INTO `shop_region` VALUES (2046, 222, '桑植县', 3, 430822);
INSERT INTO `shop_region` VALUES (2047, 223, '资阳区', 3, 430902);
INSERT INTO `shop_region` VALUES (2048, 223, '赫山区', 3, 430903);
INSERT INTO `shop_region` VALUES (2049, 223, '南县', 3, 430921);
INSERT INTO `shop_region` VALUES (2050, 223, '桃江县', 3, 430922);
INSERT INTO `shop_region` VALUES (2051, 223, '安化县', 3, 430923);
INSERT INTO `shop_region` VALUES (2052, 223, '沅江市', 3, 430981);
INSERT INTO `shop_region` VALUES (2053, 224, '北湖区', 3, 431002);
INSERT INTO `shop_region` VALUES (2054, 224, '苏仙区', 3, 431003);
INSERT INTO `shop_region` VALUES (2055, 224, '桂阳县', 3, 431021);
INSERT INTO `shop_region` VALUES (2056, 224, '宜章县', 3, 431022);
INSERT INTO `shop_region` VALUES (2057, 224, '永兴县', 3, 431023);
INSERT INTO `shop_region` VALUES (2058, 224, '嘉禾县', 3, 431024);
INSERT INTO `shop_region` VALUES (2059, 224, '临武县', 3, 431025);
INSERT INTO `shop_region` VALUES (2060, 224, '汝城县', 3, 431026);
INSERT INTO `shop_region` VALUES (2061, 224, '桂东县', 3, 431027);
INSERT INTO `shop_region` VALUES (2062, 224, '安仁县', 3, 431028);
INSERT INTO `shop_region` VALUES (2063, 224, '资兴市', 3, 431081);
INSERT INTO `shop_region` VALUES (2064, 225, '零陵区', 3, 431102);
INSERT INTO `shop_region` VALUES (2065, 225, '冷水滩区', 3, 431103);
INSERT INTO `shop_region` VALUES (2066, 225, '祁阳县', 3, 431121);
INSERT INTO `shop_region` VALUES (2067, 225, '东安县', 3, 431122);
INSERT INTO `shop_region` VALUES (2068, 225, '双牌县', 3, 431123);
INSERT INTO `shop_region` VALUES (2069, 225, '道县', 3, 431124);
INSERT INTO `shop_region` VALUES (2070, 225, '江永县', 3, 431125);
INSERT INTO `shop_region` VALUES (2071, 225, '宁远县', 3, 431126);
INSERT INTO `shop_region` VALUES (2072, 225, '蓝山县', 3, 431127);
INSERT INTO `shop_region` VALUES (2073, 225, '新田县', 3, 431128);
INSERT INTO `shop_region` VALUES (2074, 225, '江华瑶族自治县', 3, 431129);
INSERT INTO `shop_region` VALUES (2075, 226, '鹤城区', 3, 431202);
INSERT INTO `shop_region` VALUES (2076, 226, '中方县', 3, 431221);
INSERT INTO `shop_region` VALUES (2077, 226, '沅陵县', 3, 431222);
INSERT INTO `shop_region` VALUES (2078, 226, '辰溪县', 3, 431223);
INSERT INTO `shop_region` VALUES (2079, 226, '溆浦县', 3, 431224);
INSERT INTO `shop_region` VALUES (2080, 226, '会同县', 3, 431225);
INSERT INTO `shop_region` VALUES (2081, 226, '麻阳苗族自治县', 3, 431226);
INSERT INTO `shop_region` VALUES (2082, 226, '新晃侗族自治县', 3, 431227);
INSERT INTO `shop_region` VALUES (2083, 226, '芷江侗族自治县', 3, 431228);
INSERT INTO `shop_region` VALUES (2084, 226, '靖州苗族侗族自治县', 3, 431229);
INSERT INTO `shop_region` VALUES (2085, 226, '通道侗族自治县', 3, 431230);
INSERT INTO `shop_region` VALUES (2086, 226, '洪江市', 3, 431281);
INSERT INTO `shop_region` VALUES (2087, 227, '娄星区', 3, 431302);
INSERT INTO `shop_region` VALUES (2088, 227, '双峰县', 3, 431321);
INSERT INTO `shop_region` VALUES (2089, 227, '新化县', 3, 431322);
INSERT INTO `shop_region` VALUES (2090, 227, '冷水江市', 3, 431381);
INSERT INTO `shop_region` VALUES (2091, 227, '涟源市', 3, 431382);
INSERT INTO `shop_region` VALUES (2092, 228, '吉首市', 3, 433101);
INSERT INTO `shop_region` VALUES (2093, 228, '泸溪县', 3, 433122);
INSERT INTO `shop_region` VALUES (2094, 228, '凤凰县', 3, 433123);
INSERT INTO `shop_region` VALUES (2095, 228, '花垣县', 3, 433124);
INSERT INTO `shop_region` VALUES (2096, 228, '保靖县', 3, 433125);
INSERT INTO `shop_region` VALUES (2097, 228, '古丈县', 3, 433126);
INSERT INTO `shop_region` VALUES (2098, 228, '永顺县', 3, 433127);
INSERT INTO `shop_region` VALUES (2099, 228, '龙山县', 3, 433130);
INSERT INTO `shop_region` VALUES (2100, 229, '荔湾区', 3, 440103);
INSERT INTO `shop_region` VALUES (2101, 229, '越秀区', 3, 440104);
INSERT INTO `shop_region` VALUES (2102, 229, '海珠区', 3, 440105);
INSERT INTO `shop_region` VALUES (2103, 229, '天河区', 3, 440106);
INSERT INTO `shop_region` VALUES (2104, 229, '白云区', 3, 440111);
INSERT INTO `shop_region` VALUES (2105, 229, '黄埔区', 3, 440112);
INSERT INTO `shop_region` VALUES (2106, 229, '番禺区', 3, 440113);
INSERT INTO `shop_region` VALUES (2107, 229, '花都区', 3, 440114);
INSERT INTO `shop_region` VALUES (2108, 229, '南沙区', 3, 440115);
INSERT INTO `shop_region` VALUES (2109, 229, '从化区', 3, 440117);
INSERT INTO `shop_region` VALUES (2110, 229, '增城区', 3, 440118);
INSERT INTO `shop_region` VALUES (2111, 230, '武江区', 3, 440203);
INSERT INTO `shop_region` VALUES (2112, 230, '浈江区', 3, 440204);
INSERT INTO `shop_region` VALUES (2113, 230, '曲江区', 3, 440205);
INSERT INTO `shop_region` VALUES (2114, 230, '始兴县', 3, 440222);
INSERT INTO `shop_region` VALUES (2115, 230, '仁化县', 3, 440224);
INSERT INTO `shop_region` VALUES (2116, 230, '翁源县', 3, 440229);
INSERT INTO `shop_region` VALUES (2117, 230, '乳源瑶族自治县', 3, 440232);
INSERT INTO `shop_region` VALUES (2118, 230, '新丰县', 3, 440233);
INSERT INTO `shop_region` VALUES (2119, 230, '乐昌市', 3, 440281);
INSERT INTO `shop_region` VALUES (2120, 230, '南雄市', 3, 440282);
INSERT INTO `shop_region` VALUES (2121, 231, '罗湖区', 3, 440303);
INSERT INTO `shop_region` VALUES (2122, 231, '福田区', 3, 440304);
INSERT INTO `shop_region` VALUES (2123, 231, '南山区', 3, 440305);
INSERT INTO `shop_region` VALUES (2124, 231, '宝安区', 3, 440306);
INSERT INTO `shop_region` VALUES (2125, 231, '龙岗区', 3, 440307);
INSERT INTO `shop_region` VALUES (2126, 231, '盐田区', 3, 440308);
INSERT INTO `shop_region` VALUES (2127, 232, '香洲区', 3, 440402);
INSERT INTO `shop_region` VALUES (2128, 232, '斗门区', 3, 440403);
INSERT INTO `shop_region` VALUES (2129, 232, '金湾区', 3, 440404);
INSERT INTO `shop_region` VALUES (2130, 233, '龙湖区', 3, 440507);
INSERT INTO `shop_region` VALUES (2131, 233, '金平区', 3, 440511);
INSERT INTO `shop_region` VALUES (2132, 233, '濠江区', 3, 440512);
INSERT INTO `shop_region` VALUES (2133, 233, '潮阳区', 3, 440513);
INSERT INTO `shop_region` VALUES (2134, 233, '潮南区', 3, 440514);
INSERT INTO `shop_region` VALUES (2135, 233, '澄海区', 3, 440515);
INSERT INTO `shop_region` VALUES (2136, 233, '南澳县', 3, 440523);
INSERT INTO `shop_region` VALUES (2137, 234, '禅城区', 3, 440604);
INSERT INTO `shop_region` VALUES (2138, 234, '南海区', 3, 440605);
INSERT INTO `shop_region` VALUES (2139, 234, '顺德区', 3, 440606);
INSERT INTO `shop_region` VALUES (2140, 234, '三水区', 3, 440607);
INSERT INTO `shop_region` VALUES (2141, 234, '高明区', 3, 440608);
INSERT INTO `shop_region` VALUES (2142, 235, '蓬江区', 3, 440703);
INSERT INTO `shop_region` VALUES (2143, 235, '江海区', 3, 440704);
INSERT INTO `shop_region` VALUES (2144, 235, '新会区', 3, 440705);
INSERT INTO `shop_region` VALUES (2145, 235, '台山市', 3, 440781);
INSERT INTO `shop_region` VALUES (2146, 235, '开平市', 3, 440783);
INSERT INTO `shop_region` VALUES (2147, 235, '鹤山市', 3, 440784);
INSERT INTO `shop_region` VALUES (2148, 235, '恩平市', 3, 440785);
INSERT INTO `shop_region` VALUES (2149, 236, '赤坎区', 3, 440802);
INSERT INTO `shop_region` VALUES (2150, 236, '霞山区', 3, 440803);
INSERT INTO `shop_region` VALUES (2151, 236, '坡头区', 3, 440804);
INSERT INTO `shop_region` VALUES (2152, 236, '麻章区', 3, 440811);
INSERT INTO `shop_region` VALUES (2153, 236, '遂溪县', 3, 440823);
INSERT INTO `shop_region` VALUES (2154, 236, '徐闻县', 3, 440825);
INSERT INTO `shop_region` VALUES (2155, 236, '廉江市', 3, 440881);
INSERT INTO `shop_region` VALUES (2156, 236, '雷州市', 3, 440882);
INSERT INTO `shop_region` VALUES (2157, 236, '吴川市', 3, 440883);
INSERT INTO `shop_region` VALUES (2158, 237, '茂南区', 3, 440902);
INSERT INTO `shop_region` VALUES (2159, 237, '电白区', 3, 440904);
INSERT INTO `shop_region` VALUES (2160, 237, '高州市', 3, 440981);
INSERT INTO `shop_region` VALUES (2161, 237, '化州市', 3, 440982);
INSERT INTO `shop_region` VALUES (2162, 237, '信宜市', 3, 440983);
INSERT INTO `shop_region` VALUES (2163, 238, '端州区', 3, 441202);
INSERT INTO `shop_region` VALUES (2164, 238, '鼎湖区', 3, 441203);
INSERT INTO `shop_region` VALUES (2165, 238, '高要区', 3, 441204);
INSERT INTO `shop_region` VALUES (2166, 238, '广宁县', 3, 441223);
INSERT INTO `shop_region` VALUES (2167, 238, '怀集县', 3, 441224);
INSERT INTO `shop_region` VALUES (2168, 238, '封开县', 3, 441225);
INSERT INTO `shop_region` VALUES (2169, 238, '德庆县', 3, 441226);
INSERT INTO `shop_region` VALUES (2170, 238, '四会市', 3, 441284);
INSERT INTO `shop_region` VALUES (2171, 239, '惠城区', 3, 441302);
INSERT INTO `shop_region` VALUES (2172, 239, '惠阳区', 3, 441303);
INSERT INTO `shop_region` VALUES (2173, 239, '博罗县', 3, 441322);
INSERT INTO `shop_region` VALUES (2174, 239, '惠东县', 3, 441323);
INSERT INTO `shop_region` VALUES (2175, 239, '龙门县', 3, 441324);
INSERT INTO `shop_region` VALUES (2176, 240, '梅江区', 3, 441402);
INSERT INTO `shop_region` VALUES (2177, 240, '梅县区', 3, 441403);
INSERT INTO `shop_region` VALUES (2178, 240, '大埔县', 3, 441422);
INSERT INTO `shop_region` VALUES (2179, 240, '丰顺县', 3, 441423);
INSERT INTO `shop_region` VALUES (2180, 240, '五华县', 3, 441424);
INSERT INTO `shop_region` VALUES (2181, 240, '平远县', 3, 441426);
INSERT INTO `shop_region` VALUES (2182, 240, '蕉岭县', 3, 441427);
INSERT INTO `shop_region` VALUES (2183, 240, '兴宁市', 3, 441481);
INSERT INTO `shop_region` VALUES (2184, 241, '城区', 3, 441502);
INSERT INTO `shop_region` VALUES (2185, 241, '海丰县', 3, 441521);
INSERT INTO `shop_region` VALUES (2186, 241, '陆河县', 3, 441523);
INSERT INTO `shop_region` VALUES (2187, 241, '陆丰市', 3, 441581);
INSERT INTO `shop_region` VALUES (2188, 242, '源城区', 3, 441602);
INSERT INTO `shop_region` VALUES (2189, 242, '紫金县', 3, 441621);
INSERT INTO `shop_region` VALUES (2190, 242, '龙川县', 3, 441622);
INSERT INTO `shop_region` VALUES (2191, 242, '连平县', 3, 441623);
INSERT INTO `shop_region` VALUES (2192, 242, '和平县', 3, 441624);
INSERT INTO `shop_region` VALUES (2193, 242, '东源县', 3, 441625);
INSERT INTO `shop_region` VALUES (2194, 243, '江城区', 3, 441702);
INSERT INTO `shop_region` VALUES (2195, 243, '阳东区', 3, 441704);
INSERT INTO `shop_region` VALUES (2196, 243, '阳西县', 3, 441721);
INSERT INTO `shop_region` VALUES (2197, 243, '阳春市', 3, 441781);
INSERT INTO `shop_region` VALUES (2198, 244, '清城区', 3, 441802);
INSERT INTO `shop_region` VALUES (2199, 244, '清新区', 3, 441803);
INSERT INTO `shop_region` VALUES (2200, 244, '佛冈县', 3, 441821);
INSERT INTO `shop_region` VALUES (2201, 244, '阳山县', 3, 441823);
INSERT INTO `shop_region` VALUES (2202, 244, '连山壮族瑶族自治县', 3, 441825);
INSERT INTO `shop_region` VALUES (2203, 244, '连南瑶族自治县', 3, 441826);
INSERT INTO `shop_region` VALUES (2204, 244, '英德市', 3, 441881);
INSERT INTO `shop_region` VALUES (2205, 244, '连州市', 3, 441882);
INSERT INTO `shop_region` VALUES (2206, 245, '东莞市', 3, 441900);
INSERT INTO `shop_region` VALUES (2207, 246, '中山市', 3, 442000);
INSERT INTO `shop_region` VALUES (2208, 247, '湘桥区', 3, 445102);
INSERT INTO `shop_region` VALUES (2209, 247, '潮安区', 3, 445103);
INSERT INTO `shop_region` VALUES (2210, 247, '饶平县', 3, 445122);
INSERT INTO `shop_region` VALUES (2211, 248, '榕城区', 3, 445202);
INSERT INTO `shop_region` VALUES (2212, 248, '揭东区', 3, 445203);
INSERT INTO `shop_region` VALUES (2213, 248, '揭西县', 3, 445222);
INSERT INTO `shop_region` VALUES (2214, 248, '惠来县', 3, 445224);
INSERT INTO `shop_region` VALUES (2215, 248, '普宁市', 3, 445281);
INSERT INTO `shop_region` VALUES (2216, 249, '云城区', 3, 445302);
INSERT INTO `shop_region` VALUES (2217, 249, '云安区', 3, 445303);
INSERT INTO `shop_region` VALUES (2218, 249, '新兴县', 3, 445321);
INSERT INTO `shop_region` VALUES (2219, 249, '郁南县', 3, 445322);
INSERT INTO `shop_region` VALUES (2220, 249, '罗定市', 3, 445381);
INSERT INTO `shop_region` VALUES (2221, 250, '兴宁区', 3, 450102);
INSERT INTO `shop_region` VALUES (2222, 250, '青秀区', 3, 450103);
INSERT INTO `shop_region` VALUES (2223, 250, '江南区', 3, 450105);
INSERT INTO `shop_region` VALUES (2224, 250, '西乡塘区', 3, 450107);
INSERT INTO `shop_region` VALUES (2225, 250, '良庆区', 3, 450108);
INSERT INTO `shop_region` VALUES (2226, 250, '邕宁区', 3, 450109);
INSERT INTO `shop_region` VALUES (2227, 250, '武鸣区', 3, 450110);
INSERT INTO `shop_region` VALUES (2228, 250, '隆安县', 3, 450123);
INSERT INTO `shop_region` VALUES (2229, 250, '马山县', 3, 450124);
INSERT INTO `shop_region` VALUES (2230, 250, '上林县', 3, 450125);
INSERT INTO `shop_region` VALUES (2231, 250, '宾阳县', 3, 450126);
INSERT INTO `shop_region` VALUES (2232, 250, '横县', 3, 450127);
INSERT INTO `shop_region` VALUES (2233, 251, '城中区', 3, 450202);
INSERT INTO `shop_region` VALUES (2234, 251, '鱼峰区', 3, 450203);
INSERT INTO `shop_region` VALUES (2235, 251, '柳南区', 3, 450204);
INSERT INTO `shop_region` VALUES (2236, 251, '柳北区', 3, 450205);
INSERT INTO `shop_region` VALUES (2237, 251, '柳江区', 3, 450206);
INSERT INTO `shop_region` VALUES (2238, 251, '柳城县', 3, 450222);
INSERT INTO `shop_region` VALUES (2239, 251, '鹿寨县', 3, 450223);
INSERT INTO `shop_region` VALUES (2240, 251, '融安县', 3, 450224);
INSERT INTO `shop_region` VALUES (2241, 251, '融水苗族自治县', 3, 450225);
INSERT INTO `shop_region` VALUES (2242, 251, '三江侗族自治县', 3, 450226);
INSERT INTO `shop_region` VALUES (2243, 252, '秀峰区', 3, 450302);
INSERT INTO `shop_region` VALUES (2244, 252, '叠彩区', 3, 450303);
INSERT INTO `shop_region` VALUES (2245, 252, '象山区', 3, 450304);
INSERT INTO `shop_region` VALUES (2246, 252, '七星区', 3, 450305);
INSERT INTO `shop_region` VALUES (2247, 252, '雁山区', 3, 450311);
INSERT INTO `shop_region` VALUES (2248, 252, '临桂区', 3, 450312);
INSERT INTO `shop_region` VALUES (2249, 252, '阳朔县', 3, 450321);
INSERT INTO `shop_region` VALUES (2250, 252, '灵川县', 3, 450323);
INSERT INTO `shop_region` VALUES (2251, 252, '全州县', 3, 450324);
INSERT INTO `shop_region` VALUES (2252, 252, '兴安县', 3, 450325);
INSERT INTO `shop_region` VALUES (2253, 252, '永福县', 3, 450326);
INSERT INTO `shop_region` VALUES (2254, 252, '灌阳县', 3, 450327);
INSERT INTO `shop_region` VALUES (2255, 252, '龙胜各族自治县', 3, 450328);
INSERT INTO `shop_region` VALUES (2256, 252, '资源县', 3, 450329);
INSERT INTO `shop_region` VALUES (2257, 252, '平乐县', 3, 450330);
INSERT INTO `shop_region` VALUES (2258, 252, '荔浦县', 3, 450331);
INSERT INTO `shop_region` VALUES (2259, 252, '恭城瑶族自治县', 3, 450332);
INSERT INTO `shop_region` VALUES (2260, 253, '万秀区', 3, 450403);
INSERT INTO `shop_region` VALUES (2261, 253, '长洲区', 3, 450405);
INSERT INTO `shop_region` VALUES (2262, 253, '龙圩区', 3, 450406);
INSERT INTO `shop_region` VALUES (2263, 253, '苍梧县', 3, 450421);
INSERT INTO `shop_region` VALUES (2264, 253, '藤县', 3, 450422);
INSERT INTO `shop_region` VALUES (2265, 253, '蒙山县', 3, 450423);
INSERT INTO `shop_region` VALUES (2266, 253, '岑溪市', 3, 450481);
INSERT INTO `shop_region` VALUES (2267, 254, '海城区', 3, 450502);
INSERT INTO `shop_region` VALUES (2268, 254, '银海区', 3, 450503);
INSERT INTO `shop_region` VALUES (2269, 254, '铁山港区', 3, 450512);
INSERT INTO `shop_region` VALUES (2270, 254, '合浦县', 3, 450521);
INSERT INTO `shop_region` VALUES (2271, 255, '港口区', 3, 450602);
INSERT INTO `shop_region` VALUES (2272, 255, '防城区', 3, 450603);
INSERT INTO `shop_region` VALUES (2273, 255, '上思县', 3, 450621);
INSERT INTO `shop_region` VALUES (2274, 255, '东兴市', 3, 450681);
INSERT INTO `shop_region` VALUES (2275, 256, '钦南区', 3, 450702);
INSERT INTO `shop_region` VALUES (2276, 256, '钦北区', 3, 450703);
INSERT INTO `shop_region` VALUES (2277, 256, '灵山县', 3, 450721);
INSERT INTO `shop_region` VALUES (2278, 256, '浦北县', 3, 450722);
INSERT INTO `shop_region` VALUES (2279, 257, '港北区', 3, 450802);
INSERT INTO `shop_region` VALUES (2280, 257, '港南区', 3, 450803);
INSERT INTO `shop_region` VALUES (2281, 257, '覃塘区', 3, 450804);
INSERT INTO `shop_region` VALUES (2282, 257, '平南县', 3, 450821);
INSERT INTO `shop_region` VALUES (2283, 257, '桂平市', 3, 450881);
INSERT INTO `shop_region` VALUES (2284, 258, '玉州区', 3, 450902);
INSERT INTO `shop_region` VALUES (2285, 258, '福绵区', 3, 450903);
INSERT INTO `shop_region` VALUES (2286, 258, '容县', 3, 450921);
INSERT INTO `shop_region` VALUES (2287, 258, '陆川县', 3, 450922);
INSERT INTO `shop_region` VALUES (2288, 258, '博白县', 3, 450923);
INSERT INTO `shop_region` VALUES (2289, 258, '兴业县', 3, 450924);
INSERT INTO `shop_region` VALUES (2290, 258, '北流市', 3, 450981);
INSERT INTO `shop_region` VALUES (2291, 259, '右江区', 3, 451002);
INSERT INTO `shop_region` VALUES (2292, 259, '田阳县', 3, 451021);
INSERT INTO `shop_region` VALUES (2293, 259, '田东县', 3, 451022);
INSERT INTO `shop_region` VALUES (2294, 259, '平果县', 3, 451023);
INSERT INTO `shop_region` VALUES (2295, 259, '德保县', 3, 451024);
INSERT INTO `shop_region` VALUES (2296, 259, '那坡县', 3, 451026);
INSERT INTO `shop_region` VALUES (2297, 259, '凌云县', 3, 451027);
INSERT INTO `shop_region` VALUES (2298, 259, '乐业县', 3, 451028);
INSERT INTO `shop_region` VALUES (2299, 259, '田林县', 3, 451029);
INSERT INTO `shop_region` VALUES (2300, 259, '西林县', 3, 451030);
INSERT INTO `shop_region` VALUES (2301, 259, '隆林各族自治县', 3, 451031);
INSERT INTO `shop_region` VALUES (2302, 259, '靖西市', 3, 451081);
INSERT INTO `shop_region` VALUES (2303, 260, '八步区', 3, 451102);
INSERT INTO `shop_region` VALUES (2304, 260, '平桂区', 3, 451103);
INSERT INTO `shop_region` VALUES (2305, 260, '昭平县', 3, 451121);
INSERT INTO `shop_region` VALUES (2306, 260, '钟山县', 3, 451122);
INSERT INTO `shop_region` VALUES (2307, 260, '富川瑶族自治县', 3, 451123);
INSERT INTO `shop_region` VALUES (2308, 261, '金城江区', 3, 451202);
INSERT INTO `shop_region` VALUES (2309, 261, '南丹县', 3, 451221);
INSERT INTO `shop_region` VALUES (2310, 261, '天峨县', 3, 451222);
INSERT INTO `shop_region` VALUES (2311, 261, '凤山县', 3, 451223);
INSERT INTO `shop_region` VALUES (2312, 261, '东兰县', 3, 451224);
INSERT INTO `shop_region` VALUES (2313, 261, '罗城仫佬族自治县', 3, 451225);
INSERT INTO `shop_region` VALUES (2314, 261, '环江毛南族自治县', 3, 451226);
INSERT INTO `shop_region` VALUES (2315, 261, '巴马瑶族自治县', 3, 451227);
INSERT INTO `shop_region` VALUES (2316, 261, '都安瑶族自治县', 3, 451228);
INSERT INTO `shop_region` VALUES (2317, 261, '大化瑶族自治县', 3, 451229);
INSERT INTO `shop_region` VALUES (2318, 261, '宜州市', 3, 451281);
INSERT INTO `shop_region` VALUES (2319, 262, '兴宾区', 3, 451302);
INSERT INTO `shop_region` VALUES (2320, 262, '忻城县', 3, 451321);
INSERT INTO `shop_region` VALUES (2321, 262, '象州县', 3, 451322);
INSERT INTO `shop_region` VALUES (2322, 262, '武宣县', 3, 451323);
INSERT INTO `shop_region` VALUES (2323, 262, '金秀瑶族自治县', 3, 451324);
INSERT INTO `shop_region` VALUES (2324, 262, '合山市', 3, 451381);
INSERT INTO `shop_region` VALUES (2325, 263, '江州区', 3, 451402);
INSERT INTO `shop_region` VALUES (2326, 263, '扶绥县', 3, 451421);
INSERT INTO `shop_region` VALUES (2327, 263, '宁明县', 3, 451422);
INSERT INTO `shop_region` VALUES (2328, 263, '龙州县', 3, 451423);
INSERT INTO `shop_region` VALUES (2329, 263, '大新县', 3, 451424);
INSERT INTO `shop_region` VALUES (2330, 263, '天等县', 3, 451425);
INSERT INTO `shop_region` VALUES (2331, 263, '凭祥市', 3, 451481);
INSERT INTO `shop_region` VALUES (2332, 264, '秀英区', 3, 460105);
INSERT INTO `shop_region` VALUES (2333, 264, '龙华区', 3, 460106);
INSERT INTO `shop_region` VALUES (2334, 264, '琼山区', 3, 460107);
INSERT INTO `shop_region` VALUES (2335, 264, '美兰区', 3, 460108);
INSERT INTO `shop_region` VALUES (2336, 265, '市辖区', 3, 460201);
INSERT INTO `shop_region` VALUES (2337, 265, '海棠区', 3, 460202);
INSERT INTO `shop_region` VALUES (2338, 265, '吉阳区', 3, 460203);
INSERT INTO `shop_region` VALUES (2339, 265, '天涯区', 3, 460204);
INSERT INTO `shop_region` VALUES (2340, 265, '崖州区', 3, 460205);
INSERT INTO `shop_region` VALUES (2341, 266, '西沙群岛', 3, 460321);
INSERT INTO `shop_region` VALUES (2342, 266, '南沙群岛', 3, 460322);
INSERT INTO `shop_region` VALUES (2343, 266, '中沙群岛的岛礁及其海域', 3, 460323);
INSERT INTO `shop_region` VALUES (2344, 267, '儋州市', 3, 460400);
INSERT INTO `shop_region` VALUES (2345, 268, '五指山市', 3, 469001);
INSERT INTO `shop_region` VALUES (2346, 268, '琼海市', 3, 469002);
INSERT INTO `shop_region` VALUES (2347, 268, '文昌市', 3, 469005);
INSERT INTO `shop_region` VALUES (2348, 268, '万宁市', 3, 469006);
INSERT INTO `shop_region` VALUES (2349, 268, '东方市', 3, 469007);
INSERT INTO `shop_region` VALUES (2350, 268, '定安县', 3, 469021);
INSERT INTO `shop_region` VALUES (2351, 268, '屯昌县', 3, 469022);
INSERT INTO `shop_region` VALUES (2352, 268, '澄迈县', 3, 469023);
INSERT INTO `shop_region` VALUES (2353, 268, '临高县', 3, 469024);
INSERT INTO `shop_region` VALUES (2354, 268, '白沙黎族自治县', 3, 469025);
INSERT INTO `shop_region` VALUES (2355, 268, '昌江黎族自治县', 3, 469026);
INSERT INTO `shop_region` VALUES (2356, 268, '乐东黎族自治县', 3, 469027);
INSERT INTO `shop_region` VALUES (2357, 268, '陵水黎族自治县', 3, 469028);
INSERT INTO `shop_region` VALUES (2358, 268, '保亭黎族苗族自治县', 3, 469029);
INSERT INTO `shop_region` VALUES (2359, 268, '琼中黎族苗族自治县', 3, 469030);
INSERT INTO `shop_region` VALUES (2360, 269, '万州区', 3, 500101);
INSERT INTO `shop_region` VALUES (2361, 269, '涪陵区', 3, 500102);
INSERT INTO `shop_region` VALUES (2362, 269, '渝中区', 3, 500103);
INSERT INTO `shop_region` VALUES (2363, 269, '大渡口区', 3, 500104);
INSERT INTO `shop_region` VALUES (2364, 269, '江北区', 3, 500105);
INSERT INTO `shop_region` VALUES (2365, 269, '沙坪坝区', 3, 500106);
INSERT INTO `shop_region` VALUES (2366, 269, '九龙坡区', 3, 500107);
INSERT INTO `shop_region` VALUES (2367, 269, '南岸区', 3, 500108);
INSERT INTO `shop_region` VALUES (2368, 269, '北碚区', 3, 500109);
INSERT INTO `shop_region` VALUES (2369, 269, '綦江区', 3, 500110);
INSERT INTO `shop_region` VALUES (2370, 269, '大足区', 3, 500111);
INSERT INTO `shop_region` VALUES (2371, 269, '渝北区', 3, 500112);
INSERT INTO `shop_region` VALUES (2372, 269, '巴南区', 3, 500113);
INSERT INTO `shop_region` VALUES (2373, 269, '黔江区', 3, 500114);
INSERT INTO `shop_region` VALUES (2374, 269, '长寿区', 3, 500115);
INSERT INTO `shop_region` VALUES (2375, 269, '江津区', 3, 500116);
INSERT INTO `shop_region` VALUES (2376, 269, '合川区', 3, 500117);
INSERT INTO `shop_region` VALUES (2377, 269, '永川区', 3, 500118);
INSERT INTO `shop_region` VALUES (2378, 269, '南川区', 3, 500119);
INSERT INTO `shop_region` VALUES (2379, 269, '璧山区', 3, 500120);
INSERT INTO `shop_region` VALUES (2380, 269, '铜梁区', 3, 500151);
INSERT INTO `shop_region` VALUES (2381, 269, '潼南区', 3, 500152);
INSERT INTO `shop_region` VALUES (2382, 269, '荣昌区', 3, 500153);
INSERT INTO `shop_region` VALUES (2383, 269, '开州区', 3, 500154);
INSERT INTO `shop_region` VALUES (2384, 270, '梁平县', 3, 500228);
INSERT INTO `shop_region` VALUES (2385, 270, '城口县', 3, 500229);
INSERT INTO `shop_region` VALUES (2386, 270, '丰都县', 3, 500230);
INSERT INTO `shop_region` VALUES (2387, 270, '垫江县', 3, 500231);
INSERT INTO `shop_region` VALUES (2388, 270, '武隆县', 3, 500232);
INSERT INTO `shop_region` VALUES (2389, 270, '忠县', 3, 500233);
INSERT INTO `shop_region` VALUES (2390, 270, '云阳县', 3, 500235);
INSERT INTO `shop_region` VALUES (2391, 270, '奉节县', 3, 500236);
INSERT INTO `shop_region` VALUES (2392, 270, '巫山县', 3, 500237);
INSERT INTO `shop_region` VALUES (2393, 270, '巫溪县', 3, 500238);
INSERT INTO `shop_region` VALUES (2394, 270, '石柱土家族自治县', 3, 500240);
INSERT INTO `shop_region` VALUES (2395, 270, '秀山土家族苗族自治县', 3, 500241);
INSERT INTO `shop_region` VALUES (2396, 270, '酉阳土家族苗族自治县', 3, 500242);
INSERT INTO `shop_region` VALUES (2397, 270, '彭水苗族土家族自治县', 3, 500243);
INSERT INTO `shop_region` VALUES (2398, 271, '锦江区', 3, 510104);
INSERT INTO `shop_region` VALUES (2399, 271, '青羊区', 3, 510105);
INSERT INTO `shop_region` VALUES (2400, 271, '金牛区', 3, 510106);
INSERT INTO `shop_region` VALUES (2401, 271, '武侯区', 3, 510107);
INSERT INTO `shop_region` VALUES (2402, 271, '成华区', 3, 510108);
INSERT INTO `shop_region` VALUES (2403, 271, '龙泉驿区', 3, 510112);
INSERT INTO `shop_region` VALUES (2404, 271, '青白江区', 3, 510113);
INSERT INTO `shop_region` VALUES (2405, 271, '新都区', 3, 510114);
INSERT INTO `shop_region` VALUES (2406, 271, '温江区', 3, 510115);
INSERT INTO `shop_region` VALUES (2407, 271, '双流区', 3, 510116);
INSERT INTO `shop_region` VALUES (2408, 271, '金堂县', 3, 510121);
INSERT INTO `shop_region` VALUES (2409, 271, '郫县', 3, 510124);
INSERT INTO `shop_region` VALUES (2410, 271, '大邑县', 3, 510129);
INSERT INTO `shop_region` VALUES (2411, 271, '蒲江县', 3, 510131);
INSERT INTO `shop_region` VALUES (2412, 271, '新津县', 3, 510132);
INSERT INTO `shop_region` VALUES (2413, 271, '都江堰市', 3, 510181);
INSERT INTO `shop_region` VALUES (2414, 271, '彭州市', 3, 510182);
INSERT INTO `shop_region` VALUES (2415, 271, '邛崃市', 3, 510183);
INSERT INTO `shop_region` VALUES (2416, 271, '崇州市', 3, 510184);
INSERT INTO `shop_region` VALUES (2417, 271, '简阳市', 3, 510185);
INSERT INTO `shop_region` VALUES (2418, 272, '自流井区', 3, 510302);
INSERT INTO `shop_region` VALUES (2419, 272, '贡井区', 3, 510303);
INSERT INTO `shop_region` VALUES (2420, 272, '大安区', 3, 510304);
INSERT INTO `shop_region` VALUES (2421, 272, '沿滩区', 3, 510311);
INSERT INTO `shop_region` VALUES (2422, 272, '荣县', 3, 510321);
INSERT INTO `shop_region` VALUES (2423, 272, '富顺县', 3, 510322);
INSERT INTO `shop_region` VALUES (2424, 273, '东区', 3, 510402);
INSERT INTO `shop_region` VALUES (2425, 273, '西区', 3, 510403);
INSERT INTO `shop_region` VALUES (2426, 273, '仁和区', 3, 510411);
INSERT INTO `shop_region` VALUES (2427, 273, '米易县', 3, 510421);
INSERT INTO `shop_region` VALUES (2428, 273, '盐边县', 3, 510422);
INSERT INTO `shop_region` VALUES (2429, 274, '江阳区', 3, 510502);
INSERT INTO `shop_region` VALUES (2430, 274, '纳溪区', 3, 510503);
INSERT INTO `shop_region` VALUES (2431, 274, '龙马潭区', 3, 510504);
INSERT INTO `shop_region` VALUES (2432, 274, '泸县', 3, 510521);
INSERT INTO `shop_region` VALUES (2433, 274, '合江县', 3, 510522);
INSERT INTO `shop_region` VALUES (2434, 274, '叙永县', 3, 510524);
INSERT INTO `shop_region` VALUES (2435, 274, '古蔺县', 3, 510525);
INSERT INTO `shop_region` VALUES (2436, 275, '旌阳区', 3, 510603);
INSERT INTO `shop_region` VALUES (2437, 275, '中江县', 3, 510623);
INSERT INTO `shop_region` VALUES (2438, 275, '罗江县', 3, 510626);
INSERT INTO `shop_region` VALUES (2439, 275, '广汉市', 3, 510681);
INSERT INTO `shop_region` VALUES (2440, 275, '什邡市', 3, 510682);
INSERT INTO `shop_region` VALUES (2441, 275, '绵竹市', 3, 510683);
INSERT INTO `shop_region` VALUES (2442, 276, '涪城区', 3, 510703);
INSERT INTO `shop_region` VALUES (2443, 276, '游仙区', 3, 510704);
INSERT INTO `shop_region` VALUES (2444, 276, '安州区', 3, 510705);
INSERT INTO `shop_region` VALUES (2445, 276, '三台县', 3, 510722);
INSERT INTO `shop_region` VALUES (2446, 276, '盐亭县', 3, 510723);
INSERT INTO `shop_region` VALUES (2447, 276, '梓潼县', 3, 510725);
INSERT INTO `shop_region` VALUES (2448, 276, '北川羌族自治县', 3, 510726);
INSERT INTO `shop_region` VALUES (2449, 276, '平武县', 3, 510727);
INSERT INTO `shop_region` VALUES (2450, 276, '江油市', 3, 510781);
INSERT INTO `shop_region` VALUES (2451, 277, '利州区', 3, 510802);
INSERT INTO `shop_region` VALUES (2452, 277, '昭化区', 3, 510811);
INSERT INTO `shop_region` VALUES (2453, 277, '朝天区', 3, 510812);
INSERT INTO `shop_region` VALUES (2454, 277, '旺苍县', 3, 510821);
INSERT INTO `shop_region` VALUES (2455, 277, '青川县', 3, 510822);
INSERT INTO `shop_region` VALUES (2456, 277, '剑阁县', 3, 510823);
INSERT INTO `shop_region` VALUES (2457, 277, '苍溪县', 3, 510824);
INSERT INTO `shop_region` VALUES (2458, 278, '船山区', 3, 510903);
INSERT INTO `shop_region` VALUES (2459, 278, '安居区', 3, 510904);
INSERT INTO `shop_region` VALUES (2460, 278, '蓬溪县', 3, 510921);
INSERT INTO `shop_region` VALUES (2461, 278, '射洪县', 3, 510922);
INSERT INTO `shop_region` VALUES (2462, 278, '大英县', 3, 510923);
INSERT INTO `shop_region` VALUES (2463, 279, '市中区', 3, 511002);
INSERT INTO `shop_region` VALUES (2464, 279, '东兴区', 3, 511011);
INSERT INTO `shop_region` VALUES (2465, 279, '威远县', 3, 511024);
INSERT INTO `shop_region` VALUES (2466, 279, '资中县', 3, 511025);
INSERT INTO `shop_region` VALUES (2467, 279, '隆昌县', 3, 511028);
INSERT INTO `shop_region` VALUES (2468, 280, '市中区', 3, 511102);
INSERT INTO `shop_region` VALUES (2469, 280, '沙湾区', 3, 511111);
INSERT INTO `shop_region` VALUES (2470, 280, '五通桥区', 3, 511112);
INSERT INTO `shop_region` VALUES (2471, 280, '金口河区', 3, 511113);
INSERT INTO `shop_region` VALUES (2472, 280, '犍为县', 3, 511123);
INSERT INTO `shop_region` VALUES (2473, 280, '井研县', 3, 511124);
INSERT INTO `shop_region` VALUES (2474, 280, '夹江县', 3, 511126);
INSERT INTO `shop_region` VALUES (2475, 280, '沐川县', 3, 511129);
INSERT INTO `shop_region` VALUES (2476, 280, '峨边彝族自治县', 3, 511132);
INSERT INTO `shop_region` VALUES (2477, 280, '马边彝族自治县', 3, 511133);
INSERT INTO `shop_region` VALUES (2478, 280, '峨眉山市', 3, 511181);
INSERT INTO `shop_region` VALUES (2479, 281, '顺庆区', 3, 511302);
INSERT INTO `shop_region` VALUES (2480, 281, '高坪区', 3, 511303);
INSERT INTO `shop_region` VALUES (2481, 281, '嘉陵区', 3, 511304);
INSERT INTO `shop_region` VALUES (2482, 281, '南部县', 3, 511321);
INSERT INTO `shop_region` VALUES (2483, 281, '营山县', 3, 511322);
INSERT INTO `shop_region` VALUES (2484, 281, '蓬安县', 3, 511323);
INSERT INTO `shop_region` VALUES (2485, 281, '仪陇县', 3, 511324);
INSERT INTO `shop_region` VALUES (2486, 281, '西充县', 3, 511325);
INSERT INTO `shop_region` VALUES (2487, 281, '阆中市', 3, 511381);
INSERT INTO `shop_region` VALUES (2488, 282, '东坡区', 3, 511402);
INSERT INTO `shop_region` VALUES (2489, 282, '彭山区', 3, 511403);
INSERT INTO `shop_region` VALUES (2490, 282, '仁寿县', 3, 511421);
INSERT INTO `shop_region` VALUES (2491, 282, '洪雅县', 3, 511423);
INSERT INTO `shop_region` VALUES (2492, 282, '丹棱县', 3, 511424);
INSERT INTO `shop_region` VALUES (2493, 282, '青神县', 3, 511425);
INSERT INTO `shop_region` VALUES (2494, 283, '翠屏区', 3, 511502);
INSERT INTO `shop_region` VALUES (2495, 283, '南溪区', 3, 511503);
INSERT INTO `shop_region` VALUES (2496, 283, '宜宾县', 3, 511521);
INSERT INTO `shop_region` VALUES (2497, 283, '江安县', 3, 511523);
INSERT INTO `shop_region` VALUES (2498, 283, '长宁县', 3, 511524);
INSERT INTO `shop_region` VALUES (2499, 283, '高县', 3, 511525);
INSERT INTO `shop_region` VALUES (2500, 283, '珙县', 3, 511526);
INSERT INTO `shop_region` VALUES (2501, 283, '筠连县', 3, 511527);
INSERT INTO `shop_region` VALUES (2502, 283, '兴文县', 3, 511528);
INSERT INTO `shop_region` VALUES (2503, 283, '屏山县', 3, 511529);
INSERT INTO `shop_region` VALUES (2504, 284, '广安区', 3, 511602);
INSERT INTO `shop_region` VALUES (2505, 284, '前锋区', 3, 511603);
INSERT INTO `shop_region` VALUES (2506, 284, '岳池县', 3, 511621);
INSERT INTO `shop_region` VALUES (2507, 284, '武胜县', 3, 511622);
INSERT INTO `shop_region` VALUES (2508, 284, '邻水县', 3, 511623);
INSERT INTO `shop_region` VALUES (2509, 284, '华蓥市', 3, 511681);
INSERT INTO `shop_region` VALUES (2510, 285, '通川区', 3, 511702);
INSERT INTO `shop_region` VALUES (2511, 285, '达川区', 3, 511703);
INSERT INTO `shop_region` VALUES (2512, 285, '宣汉县', 3, 511722);
INSERT INTO `shop_region` VALUES (2513, 285, '开江县', 3, 511723);
INSERT INTO `shop_region` VALUES (2514, 285, '大竹县', 3, 511724);
INSERT INTO `shop_region` VALUES (2515, 285, '渠县', 3, 511725);
INSERT INTO `shop_region` VALUES (2516, 285, '万源市', 3, 511781);
INSERT INTO `shop_region` VALUES (2517, 286, '雨城区', 3, 511802);
INSERT INTO `shop_region` VALUES (2518, 286, '名山区', 3, 511803);
INSERT INTO `shop_region` VALUES (2519, 286, '荥经县', 3, 511822);
INSERT INTO `shop_region` VALUES (2520, 286, '汉源县', 3, 511823);
INSERT INTO `shop_region` VALUES (2521, 286, '石棉县', 3, 511824);
INSERT INTO `shop_region` VALUES (2522, 286, '天全县', 3, 511825);
INSERT INTO `shop_region` VALUES (2523, 286, '芦山县', 3, 511826);
INSERT INTO `shop_region` VALUES (2524, 286, '宝兴县', 3, 511827);
INSERT INTO `shop_region` VALUES (2525, 287, '巴州区', 3, 511902);
INSERT INTO `shop_region` VALUES (2526, 287, '恩阳区', 3, 511903);
INSERT INTO `shop_region` VALUES (2527, 287, '通江县', 3, 511921);
INSERT INTO `shop_region` VALUES (2528, 287, '南江县', 3, 511922);
INSERT INTO `shop_region` VALUES (2529, 287, '平昌县', 3, 511923);
INSERT INTO `shop_region` VALUES (2530, 288, '雁江区', 3, 512002);
INSERT INTO `shop_region` VALUES (2531, 288, '安岳县', 3, 512021);
INSERT INTO `shop_region` VALUES (2532, 288, '乐至县', 3, 512022);
INSERT INTO `shop_region` VALUES (2533, 289, '马尔康市', 3, 513201);
INSERT INTO `shop_region` VALUES (2534, 289, '汶川县', 3, 513221);
INSERT INTO `shop_region` VALUES (2535, 289, '理县', 3, 513222);
INSERT INTO `shop_region` VALUES (2536, 289, '茂县', 3, 513223);
INSERT INTO `shop_region` VALUES (2537, 289, '松潘县', 3, 513224);
INSERT INTO `shop_region` VALUES (2538, 289, '九寨沟县', 3, 513225);
INSERT INTO `shop_region` VALUES (2539, 289, '金川县', 3, 513226);
INSERT INTO `shop_region` VALUES (2540, 289, '小金县', 3, 513227);
INSERT INTO `shop_region` VALUES (2541, 289, '黑水县', 3, 513228);
INSERT INTO `shop_region` VALUES (2542, 289, '壤塘县', 3, 513230);
INSERT INTO `shop_region` VALUES (2543, 289, '阿坝县', 3, 513231);
INSERT INTO `shop_region` VALUES (2544, 289, '若尔盖县', 3, 513232);
INSERT INTO `shop_region` VALUES (2545, 289, '红原县', 3, 513233);
INSERT INTO `shop_region` VALUES (2546, 290, '康定市', 3, 513301);
INSERT INTO `shop_region` VALUES (2547, 290, '泸定县', 3, 513322);
INSERT INTO `shop_region` VALUES (2548, 290, '丹巴县', 3, 513323);
INSERT INTO `shop_region` VALUES (2549, 290, '九龙县', 3, 513324);
INSERT INTO `shop_region` VALUES (2550, 290, '雅江县', 3, 513325);
INSERT INTO `shop_region` VALUES (2551, 290, '道孚县', 3, 513326);
INSERT INTO `shop_region` VALUES (2552, 290, '炉霍县', 3, 513327);
INSERT INTO `shop_region` VALUES (2553, 290, '甘孜县', 3, 513328);
INSERT INTO `shop_region` VALUES (2554, 290, '新龙县', 3, 513329);
INSERT INTO `shop_region` VALUES (2555, 290, '德格县', 3, 513330);
INSERT INTO `shop_region` VALUES (2556, 290, '白玉县', 3, 513331);
INSERT INTO `shop_region` VALUES (2557, 290, '石渠县', 3, 513332);
INSERT INTO `shop_region` VALUES (2558, 290, '色达县', 3, 513333);
INSERT INTO `shop_region` VALUES (2559, 290, '理塘县', 3, 513334);
INSERT INTO `shop_region` VALUES (2560, 290, '巴塘县', 3, 513335);
INSERT INTO `shop_region` VALUES (2561, 290, '乡城县', 3, 513336);
INSERT INTO `shop_region` VALUES (2562, 290, '稻城县', 3, 513337);
INSERT INTO `shop_region` VALUES (2563, 290, '得荣县', 3, 513338);
INSERT INTO `shop_region` VALUES (2564, 291, '西昌市', 3, 513401);
INSERT INTO `shop_region` VALUES (2565, 291, '木里藏族自治县', 3, 513422);
INSERT INTO `shop_region` VALUES (2566, 291, '盐源县', 3, 513423);
INSERT INTO `shop_region` VALUES (2567, 291, '德昌县', 3, 513424);
INSERT INTO `shop_region` VALUES (2568, 291, '会理县', 3, 513425);
INSERT INTO `shop_region` VALUES (2569, 291, '会东县', 3, 513426);
INSERT INTO `shop_region` VALUES (2570, 291, '宁南县', 3, 513427);
INSERT INTO `shop_region` VALUES (2571, 291, '普格县', 3, 513428);
INSERT INTO `shop_region` VALUES (2572, 291, '布拖县', 3, 513429);
INSERT INTO `shop_region` VALUES (2573, 291, '金阳县', 3, 513430);
INSERT INTO `shop_region` VALUES (2574, 291, '昭觉县', 3, 513431);
INSERT INTO `shop_region` VALUES (2575, 291, '喜德县', 3, 513432);
INSERT INTO `shop_region` VALUES (2576, 291, '冕宁县', 3, 513433);
INSERT INTO `shop_region` VALUES (2577, 291, '越西县', 3, 513434);
INSERT INTO `shop_region` VALUES (2578, 291, '甘洛县', 3, 513435);
INSERT INTO `shop_region` VALUES (2579, 291, '美姑县', 3, 513436);
INSERT INTO `shop_region` VALUES (2580, 291, '雷波县', 3, 513437);
INSERT INTO `shop_region` VALUES (2581, 292, '南明区', 3, 520102);
INSERT INTO `shop_region` VALUES (2582, 292, '云岩区', 3, 520103);
INSERT INTO `shop_region` VALUES (2583, 292, '花溪区', 3, 520111);
INSERT INTO `shop_region` VALUES (2584, 292, '乌当区', 3, 520112);
INSERT INTO `shop_region` VALUES (2585, 292, '白云区', 3, 520113);
INSERT INTO `shop_region` VALUES (2586, 292, '观山湖区', 3, 520115);
INSERT INTO `shop_region` VALUES (2587, 292, '开阳县', 3, 520121);
INSERT INTO `shop_region` VALUES (2588, 292, '息烽县', 3, 520122);
INSERT INTO `shop_region` VALUES (2589, 292, '修文县', 3, 520123);
INSERT INTO `shop_region` VALUES (2590, 292, '清镇市', 3, 520181);
INSERT INTO `shop_region` VALUES (2591, 293, '钟山区', 3, 520201);
INSERT INTO `shop_region` VALUES (2592, 293, '六枝特区', 3, 520203);
INSERT INTO `shop_region` VALUES (2593, 293, '水城县', 3, 520221);
INSERT INTO `shop_region` VALUES (2594, 293, '盘县', 3, 520222);
INSERT INTO `shop_region` VALUES (2595, 294, '红花岗区', 3, 520302);
INSERT INTO `shop_region` VALUES (2596, 294, '汇川区', 3, 520303);
INSERT INTO `shop_region` VALUES (2597, 294, '播州区', 3, 520304);
INSERT INTO `shop_region` VALUES (2598, 294, '桐梓县', 3, 520322);
INSERT INTO `shop_region` VALUES (2599, 294, '绥阳县', 3, 520323);
INSERT INTO `shop_region` VALUES (2600, 294, '正安县', 3, 520324);
INSERT INTO `shop_region` VALUES (2601, 294, '道真仡佬族苗族自治县', 3, 520325);
INSERT INTO `shop_region` VALUES (2602, 294, '务川仡佬族苗族自治县', 3, 520326);
INSERT INTO `shop_region` VALUES (2603, 294, '凤冈县', 3, 520327);
INSERT INTO `shop_region` VALUES (2604, 294, '湄潭县', 3, 520328);
INSERT INTO `shop_region` VALUES (2605, 294, '余庆县', 3, 520329);
INSERT INTO `shop_region` VALUES (2606, 294, '习水县', 3, 520330);
INSERT INTO `shop_region` VALUES (2607, 294, '赤水市', 3, 520381);
INSERT INTO `shop_region` VALUES (2608, 294, '仁怀市', 3, 520382);
INSERT INTO `shop_region` VALUES (2609, 295, '西秀区', 3, 520402);
INSERT INTO `shop_region` VALUES (2610, 295, '平坝区', 3, 520403);
INSERT INTO `shop_region` VALUES (2611, 295, '普定县', 3, 520422);
INSERT INTO `shop_region` VALUES (2612, 295, '镇宁布依族苗族自治县', 3, 520423);
INSERT INTO `shop_region` VALUES (2613, 295, '关岭布依族苗族自治县', 3, 520424);
INSERT INTO `shop_region` VALUES (2614, 295, '紫云苗族布依族自治县', 3, 520425);
INSERT INTO `shop_region` VALUES (2615, 296, '七星关区', 3, 520502);
INSERT INTO `shop_region` VALUES (2616, 296, '大方县', 3, 520521);
INSERT INTO `shop_region` VALUES (2617, 296, '黔西县', 3, 520522);
INSERT INTO `shop_region` VALUES (2618, 296, '金沙县', 3, 520523);
INSERT INTO `shop_region` VALUES (2619, 296, '织金县', 3, 520524);
INSERT INTO `shop_region` VALUES (2620, 296, '纳雍县', 3, 520525);
INSERT INTO `shop_region` VALUES (2621, 296, '威宁彝族回族苗族自治县', 3, 520526);
INSERT INTO `shop_region` VALUES (2622, 296, '赫章县', 3, 520527);
INSERT INTO `shop_region` VALUES (2623, 297, '碧江区', 3, 520602);
INSERT INTO `shop_region` VALUES (2624, 297, '万山区', 3, 520603);
INSERT INTO `shop_region` VALUES (2625, 297, '江口县', 3, 520621);
INSERT INTO `shop_region` VALUES (2626, 297, '玉屏侗族自治县', 3, 520622);
INSERT INTO `shop_region` VALUES (2627, 297, '石阡县', 3, 520623);
INSERT INTO `shop_region` VALUES (2628, 297, '思南县', 3, 520624);
INSERT INTO `shop_region` VALUES (2629, 297, '印江土家族苗族自治县', 3, 520625);
INSERT INTO `shop_region` VALUES (2630, 297, '德江县', 3, 520626);
INSERT INTO `shop_region` VALUES (2631, 297, '沿河土家族自治县', 3, 520627);
INSERT INTO `shop_region` VALUES (2632, 297, '松桃苗族自治县', 3, 520628);
INSERT INTO `shop_region` VALUES (2633, 298, '兴义市', 3, 522301);
INSERT INTO `shop_region` VALUES (2634, 298, '兴仁县', 3, 522322);
INSERT INTO `shop_region` VALUES (2635, 298, '普安县', 3, 522323);
INSERT INTO `shop_region` VALUES (2636, 298, '晴隆县', 3, 522324);
INSERT INTO `shop_region` VALUES (2637, 298, '贞丰县', 3, 522325);
INSERT INTO `shop_region` VALUES (2638, 298, '望谟县', 3, 522326);
INSERT INTO `shop_region` VALUES (2639, 298, '册亨县', 3, 522327);
INSERT INTO `shop_region` VALUES (2640, 298, '安龙县', 3, 522328);
INSERT INTO `shop_region` VALUES (2641, 299, '凯里市', 3, 522601);
INSERT INTO `shop_region` VALUES (2642, 299, '黄平县', 3, 522622);
INSERT INTO `shop_region` VALUES (2643, 299, '施秉县', 3, 522623);
INSERT INTO `shop_region` VALUES (2644, 299, '三穗县', 3, 522624);
INSERT INTO `shop_region` VALUES (2645, 299, '镇远县', 3, 522625);
INSERT INTO `shop_region` VALUES (2646, 299, '岑巩县', 3, 522626);
INSERT INTO `shop_region` VALUES (2647, 299, '天柱县', 3, 522627);
INSERT INTO `shop_region` VALUES (2648, 299, '锦屏县', 3, 522628);
INSERT INTO `shop_region` VALUES (2649, 299, '剑河县', 3, 522629);
INSERT INTO `shop_region` VALUES (2650, 299, '台江县', 3, 522630);
INSERT INTO `shop_region` VALUES (2651, 299, '黎平县', 3, 522631);
INSERT INTO `shop_region` VALUES (2652, 299, '榕江县', 3, 522632);
INSERT INTO `shop_region` VALUES (2653, 299, '从江县', 3, 522633);
INSERT INTO `shop_region` VALUES (2654, 299, '雷山县', 3, 522634);
INSERT INTO `shop_region` VALUES (2655, 299, '麻江县', 3, 522635);
INSERT INTO `shop_region` VALUES (2656, 299, '丹寨县', 3, 522636);
INSERT INTO `shop_region` VALUES (2657, 300, '都匀市', 3, 522701);
INSERT INTO `shop_region` VALUES (2658, 300, '福泉市', 3, 522702);
INSERT INTO `shop_region` VALUES (2659, 300, '荔波县', 3, 522722);
INSERT INTO `shop_region` VALUES (2660, 300, '贵定县', 3, 522723);
INSERT INTO `shop_region` VALUES (2661, 300, '瓮安县', 3, 522725);
INSERT INTO `shop_region` VALUES (2662, 300, '独山县', 3, 522726);
INSERT INTO `shop_region` VALUES (2663, 300, '平塘县', 3, 522727);
INSERT INTO `shop_region` VALUES (2664, 300, '罗甸县', 3, 522728);
INSERT INTO `shop_region` VALUES (2665, 300, '长顺县', 3, 522729);
INSERT INTO `shop_region` VALUES (2666, 300, '龙里县', 3, 522730);
INSERT INTO `shop_region` VALUES (2667, 300, '惠水县', 3, 522731);
INSERT INTO `shop_region` VALUES (2668, 300, '三都水族自治县', 3, 522732);
INSERT INTO `shop_region` VALUES (2669, 301, '五华区', 3, 530102);
INSERT INTO `shop_region` VALUES (2670, 301, '盘龙区', 3, 530103);
INSERT INTO `shop_region` VALUES (2671, 301, '官渡区', 3, 530111);
INSERT INTO `shop_region` VALUES (2672, 301, '西山区', 3, 530112);
INSERT INTO `shop_region` VALUES (2673, 301, '东川区', 3, 530113);
INSERT INTO `shop_region` VALUES (2674, 301, '呈贡区', 3, 530114);
INSERT INTO `shop_region` VALUES (2675, 301, '晋宁县', 3, 530122);
INSERT INTO `shop_region` VALUES (2676, 301, '富民县', 3, 530124);
INSERT INTO `shop_region` VALUES (2677, 301, '宜良县', 3, 530125);
INSERT INTO `shop_region` VALUES (2678, 301, '石林彝族自治县', 3, 530126);
INSERT INTO `shop_region` VALUES (2679, 301, '嵩明县', 3, 530127);
INSERT INTO `shop_region` VALUES (2680, 301, '禄劝彝族苗族自治县', 3, 530128);
INSERT INTO `shop_region` VALUES (2681, 301, '寻甸回族彝族自治县', 3, 530129);
INSERT INTO `shop_region` VALUES (2682, 301, '安宁市', 3, 530181);
INSERT INTO `shop_region` VALUES (2683, 302, '麒麟区', 3, 530302);
INSERT INTO `shop_region` VALUES (2684, 302, '沾益区', 3, 530303);
INSERT INTO `shop_region` VALUES (2685, 302, '马龙县', 3, 530321);
INSERT INTO `shop_region` VALUES (2686, 302, '陆良县', 3, 530322);
INSERT INTO `shop_region` VALUES (2687, 302, '师宗县', 3, 530323);
INSERT INTO `shop_region` VALUES (2688, 302, '罗平县', 3, 530324);
INSERT INTO `shop_region` VALUES (2689, 302, '富源县', 3, 530325);
INSERT INTO `shop_region` VALUES (2690, 302, '会泽县', 3, 530326);
INSERT INTO `shop_region` VALUES (2691, 302, '宣威市', 3, 530381);
INSERT INTO `shop_region` VALUES (2692, 303, '红塔区', 3, 530402);
INSERT INTO `shop_region` VALUES (2693, 303, '江川区', 3, 530403);
INSERT INTO `shop_region` VALUES (2694, 303, '澄江县', 3, 530422);
INSERT INTO `shop_region` VALUES (2695, 303, '通海县', 3, 530423);
INSERT INTO `shop_region` VALUES (2696, 303, '华宁县', 3, 530424);
INSERT INTO `shop_region` VALUES (2697, 303, '易门县', 3, 530425);
INSERT INTO `shop_region` VALUES (2698, 303, '峨山彝族自治县', 3, 530426);
INSERT INTO `shop_region` VALUES (2699, 303, '新平彝族傣族自治县', 3, 530427);
INSERT INTO `shop_region` VALUES (2700, 303, '元江哈尼族彝族傣族自治县', 3, 530428);
INSERT INTO `shop_region` VALUES (2701, 304, '隆阳区', 3, 530502);
INSERT INTO `shop_region` VALUES (2702, 304, '施甸县', 3, 530521);
INSERT INTO `shop_region` VALUES (2703, 304, '龙陵县', 3, 530523);
INSERT INTO `shop_region` VALUES (2704, 304, '昌宁县', 3, 530524);
INSERT INTO `shop_region` VALUES (2705, 304, '腾冲市', 3, 530581);
INSERT INTO `shop_region` VALUES (2706, 305, '昭阳区', 3, 530602);
INSERT INTO `shop_region` VALUES (2707, 305, '鲁甸县', 3, 530621);
INSERT INTO `shop_region` VALUES (2708, 305, '巧家县', 3, 530622);
INSERT INTO `shop_region` VALUES (2709, 305, '盐津县', 3, 530623);
INSERT INTO `shop_region` VALUES (2710, 305, '大关县', 3, 530624);
INSERT INTO `shop_region` VALUES (2711, 305, '永善县', 3, 530625);
INSERT INTO `shop_region` VALUES (2712, 305, '绥江县', 3, 530626);
INSERT INTO `shop_region` VALUES (2713, 305, '镇雄县', 3, 530627);
INSERT INTO `shop_region` VALUES (2714, 305, '彝良县', 3, 530628);
INSERT INTO `shop_region` VALUES (2715, 305, '威信县', 3, 530629);
INSERT INTO `shop_region` VALUES (2716, 305, '水富县', 3, 530630);
INSERT INTO `shop_region` VALUES (2717, 306, '古城区', 3, 530702);
INSERT INTO `shop_region` VALUES (2718, 306, '玉龙纳西族自治县', 3, 530721);
INSERT INTO `shop_region` VALUES (2719, 306, '永胜县', 3, 530722);
INSERT INTO `shop_region` VALUES (2720, 306, '华坪县', 3, 530723);
INSERT INTO `shop_region` VALUES (2721, 306, '宁蒗彝族自治县', 3, 530724);
INSERT INTO `shop_region` VALUES (2722, 307, '思茅区', 3, 530802);
INSERT INTO `shop_region` VALUES (2723, 307, '宁洱哈尼族彝族自治县', 3, 530821);
INSERT INTO `shop_region` VALUES (2724, 307, '墨江哈尼族自治县', 3, 530822);
INSERT INTO `shop_region` VALUES (2725, 307, '景东彝族自治县', 3, 530823);
INSERT INTO `shop_region` VALUES (2726, 307, '景谷傣族彝族自治县', 3, 530824);
INSERT INTO `shop_region` VALUES (2727, 307, '镇沅彝族哈尼族拉祜族自治县', 3, 530825);
INSERT INTO `shop_region` VALUES (2728, 307, '江城哈尼族彝族自治县', 3, 530826);
INSERT INTO `shop_region` VALUES (2729, 307, '孟连傣族拉祜族佤族自治县', 3, 530827);
INSERT INTO `shop_region` VALUES (2730, 307, '澜沧拉祜族自治县', 3, 530828);
INSERT INTO `shop_region` VALUES (2731, 307, '西盟佤族自治县', 3, 530829);
INSERT INTO `shop_region` VALUES (2732, 308, '临翔区', 3, 530902);
INSERT INTO `shop_region` VALUES (2733, 308, '凤庆县', 3, 530921);
INSERT INTO `shop_region` VALUES (2734, 308, '云县', 3, 530922);
INSERT INTO `shop_region` VALUES (2735, 308, '永德县', 3, 530923);
INSERT INTO `shop_region` VALUES (2736, 308, '镇康县', 3, 530924);
INSERT INTO `shop_region` VALUES (2737, 308, '双江拉祜族佤族布朗族傣族自治县', 3, 530925);
INSERT INTO `shop_region` VALUES (2738, 308, '耿马傣族佤族自治县', 3, 530926);
INSERT INTO `shop_region` VALUES (2739, 308, '沧源佤族自治县', 3, 530927);
INSERT INTO `shop_region` VALUES (2740, 309, '楚雄市', 3, 532301);
INSERT INTO `shop_region` VALUES (2741, 309, '双柏县', 3, 532322);
INSERT INTO `shop_region` VALUES (2742, 309, '牟定县', 3, 532323);
INSERT INTO `shop_region` VALUES (2743, 309, '南华县', 3, 532324);
INSERT INTO `shop_region` VALUES (2744, 309, '姚安县', 3, 532325);
INSERT INTO `shop_region` VALUES (2745, 309, '大姚县', 3, 532326);
INSERT INTO `shop_region` VALUES (2746, 309, '永仁县', 3, 532327);
INSERT INTO `shop_region` VALUES (2747, 309, '元谋县', 3, 532328);
INSERT INTO `shop_region` VALUES (2748, 309, '武定县', 3, 532329);
INSERT INTO `shop_region` VALUES (2749, 309, '禄丰县', 3, 532331);
INSERT INTO `shop_region` VALUES (2750, 310, '个旧市', 3, 532501);
INSERT INTO `shop_region` VALUES (2751, 310, '开远市', 3, 532502);
INSERT INTO `shop_region` VALUES (2752, 310, '蒙自市', 3, 532503);
INSERT INTO `shop_region` VALUES (2753, 310, '弥勒市', 3, 532504);
INSERT INTO `shop_region` VALUES (2754, 310, '屏边苗族自治县', 3, 532523);
INSERT INTO `shop_region` VALUES (2755, 310, '建水县', 3, 532524);
INSERT INTO `shop_region` VALUES (2756, 310, '石屏县', 3, 532525);
INSERT INTO `shop_region` VALUES (2757, 310, '泸西县', 3, 532527);
INSERT INTO `shop_region` VALUES (2758, 310, '元阳县', 3, 532528);
INSERT INTO `shop_region` VALUES (2759, 310, '红河县', 3, 532529);
INSERT INTO `shop_region` VALUES (2760, 310, '金平苗族瑶族傣族自治县', 3, 532530);
INSERT INTO `shop_region` VALUES (2761, 310, '绿春县', 3, 532531);
INSERT INTO `shop_region` VALUES (2762, 310, '河口瑶族自治县', 3, 532532);
INSERT INTO `shop_region` VALUES (2763, 311, '文山市', 3, 532601);
INSERT INTO `shop_region` VALUES (2764, 311, '砚山县', 3, 532622);
INSERT INTO `shop_region` VALUES (2765, 311, '西畴县', 3, 532623);
INSERT INTO `shop_region` VALUES (2766, 311, '麻栗坡县', 3, 532624);
INSERT INTO `shop_region` VALUES (2767, 311, '马关县', 3, 532625);
INSERT INTO `shop_region` VALUES (2768, 311, '丘北县', 3, 532626);
INSERT INTO `shop_region` VALUES (2769, 311, '广南县', 3, 532627);
INSERT INTO `shop_region` VALUES (2770, 311, '富宁县', 3, 532628);
INSERT INTO `shop_region` VALUES (2771, 312, '景洪市', 3, 532801);
INSERT INTO `shop_region` VALUES (2772, 312, '勐海县', 3, 532822);
INSERT INTO `shop_region` VALUES (2773, 312, '勐腊县', 3, 532823);
INSERT INTO `shop_region` VALUES (2774, 313, '大理市', 3, 532901);
INSERT INTO `shop_region` VALUES (2775, 313, '漾濞彝族自治县', 3, 532922);
INSERT INTO `shop_region` VALUES (2776, 313, '祥云县', 3, 532923);
INSERT INTO `shop_region` VALUES (2777, 313, '宾川县', 3, 532924);
INSERT INTO `shop_region` VALUES (2778, 313, '弥渡县', 3, 532925);
INSERT INTO `shop_region` VALUES (2779, 313, '南涧彝族自治县', 3, 532926);
INSERT INTO `shop_region` VALUES (2780, 313, '巍山彝族回族自治县', 3, 532927);
INSERT INTO `shop_region` VALUES (2781, 313, '永平县', 3, 532928);
INSERT INTO `shop_region` VALUES (2782, 313, '云龙县', 3, 532929);
INSERT INTO `shop_region` VALUES (2783, 313, '洱源县', 3, 532930);
INSERT INTO `shop_region` VALUES (2784, 313, '剑川县', 3, 532931);
INSERT INTO `shop_region` VALUES (2785, 313, '鹤庆县', 3, 532932);
INSERT INTO `shop_region` VALUES (2786, 314, '瑞丽市', 3, 533102);
INSERT INTO `shop_region` VALUES (2787, 314, '芒市', 3, 533103);
INSERT INTO `shop_region` VALUES (2788, 314, '梁河县', 3, 533122);
INSERT INTO `shop_region` VALUES (2789, 314, '盈江县', 3, 533123);
INSERT INTO `shop_region` VALUES (2790, 314, '陇川县', 3, 533124);
INSERT INTO `shop_region` VALUES (2791, 315, '泸水市', 3, 533301);
INSERT INTO `shop_region` VALUES (2792, 315, '福贡县', 3, 533323);
INSERT INTO `shop_region` VALUES (2793, 315, '贡山独龙族怒族自治县', 3, 533324);
INSERT INTO `shop_region` VALUES (2794, 315, '兰坪白族普米族自治县', 3, 533325);
INSERT INTO `shop_region` VALUES (2795, 316, '香格里拉市', 3, 533401);
INSERT INTO `shop_region` VALUES (2796, 316, '德钦县', 3, 533422);
INSERT INTO `shop_region` VALUES (2797, 316, '维西傈僳族自治县', 3, 533423);
INSERT INTO `shop_region` VALUES (2798, 317, '城关区', 3, 540102);
INSERT INTO `shop_region` VALUES (2799, 317, '堆龙德庆区', 3, 540103);
INSERT INTO `shop_region` VALUES (2800, 317, '林周县', 3, 540121);
INSERT INTO `shop_region` VALUES (2801, 317, '当雄县', 3, 540122);
INSERT INTO `shop_region` VALUES (2802, 317, '尼木县', 3, 540123);
INSERT INTO `shop_region` VALUES (2803, 317, '曲水县', 3, 540124);
INSERT INTO `shop_region` VALUES (2804, 317, '达孜县', 3, 540126);
INSERT INTO `shop_region` VALUES (2805, 317, '墨竹工卡县', 3, 540127);
INSERT INTO `shop_region` VALUES (2806, 318, '桑珠孜区', 3, 540202);
INSERT INTO `shop_region` VALUES (2807, 318, '南木林县', 3, 540221);
INSERT INTO `shop_region` VALUES (2808, 318, '江孜县', 3, 540222);
INSERT INTO `shop_region` VALUES (2809, 318, '定日县', 3, 540223);
INSERT INTO `shop_region` VALUES (2810, 318, '萨迦县', 3, 540224);
INSERT INTO `shop_region` VALUES (2811, 318, '拉孜县', 3, 540225);
INSERT INTO `shop_region` VALUES (2812, 318, '昂仁县', 3, 540226);
INSERT INTO `shop_region` VALUES (2813, 318, '谢通门县', 3, 540227);
INSERT INTO `shop_region` VALUES (2814, 318, '白朗县', 3, 540228);
INSERT INTO `shop_region` VALUES (2815, 318, '仁布县', 3, 540229);
INSERT INTO `shop_region` VALUES (2816, 318, '康马县', 3, 540230);
INSERT INTO `shop_region` VALUES (2817, 318, '定结县', 3, 540231);
INSERT INTO `shop_region` VALUES (2818, 318, '仲巴县', 3, 540232);
INSERT INTO `shop_region` VALUES (2819, 318, '亚东县', 3, 540233);
INSERT INTO `shop_region` VALUES (2820, 318, '吉隆县', 3, 540234);
INSERT INTO `shop_region` VALUES (2821, 318, '聂拉木县', 3, 540235);
INSERT INTO `shop_region` VALUES (2822, 318, '萨嘎县', 3, 540236);
INSERT INTO `shop_region` VALUES (2823, 318, '岗巴县', 3, 540237);
INSERT INTO `shop_region` VALUES (2824, 319, '卡若区', 3, 540302);
INSERT INTO `shop_region` VALUES (2825, 319, '江达县', 3, 540321);
INSERT INTO `shop_region` VALUES (2826, 319, '贡觉县', 3, 540322);
INSERT INTO `shop_region` VALUES (2827, 319, '类乌齐县', 3, 540323);
INSERT INTO `shop_region` VALUES (2828, 319, '丁青县', 3, 540324);
INSERT INTO `shop_region` VALUES (2829, 319, '察雅县', 3, 540325);
INSERT INTO `shop_region` VALUES (2830, 319, '八宿县', 3, 540326);
INSERT INTO `shop_region` VALUES (2831, 319, '左贡县', 3, 540327);
INSERT INTO `shop_region` VALUES (2832, 319, '芒康县', 3, 540328);
INSERT INTO `shop_region` VALUES (2833, 319, '洛隆县', 3, 540329);
INSERT INTO `shop_region` VALUES (2834, 319, '边坝县', 3, 540330);
INSERT INTO `shop_region` VALUES (2835, 320, '巴宜区', 3, 540402);
INSERT INTO `shop_region` VALUES (2836, 320, '工布江达县', 3, 540421);
INSERT INTO `shop_region` VALUES (2837, 320, '米林县', 3, 540422);
INSERT INTO `shop_region` VALUES (2838, 320, '墨脱县', 3, 540423);
INSERT INTO `shop_region` VALUES (2839, 320, '波密县', 3, 540424);
INSERT INTO `shop_region` VALUES (2840, 320, '察隅县', 3, 540425);
INSERT INTO `shop_region` VALUES (2841, 320, '朗县', 3, 540426);
INSERT INTO `shop_region` VALUES (2842, 321, '乃东区', 3, 540502);
INSERT INTO `shop_region` VALUES (2843, 321, '扎囊县', 3, 540521);
INSERT INTO `shop_region` VALUES (2844, 321, '贡嘎县', 3, 540522);
INSERT INTO `shop_region` VALUES (2845, 321, '桑日县', 3, 540523);
INSERT INTO `shop_region` VALUES (2846, 321, '琼结县', 3, 540524);
INSERT INTO `shop_region` VALUES (2847, 321, '曲松县', 3, 540525);
INSERT INTO `shop_region` VALUES (2848, 321, '措美县', 3, 540526);
INSERT INTO `shop_region` VALUES (2849, 321, '洛扎县', 3, 540527);
INSERT INTO `shop_region` VALUES (2850, 321, '加查县', 3, 540528);
INSERT INTO `shop_region` VALUES (2851, 321, '隆子县', 3, 540529);
INSERT INTO `shop_region` VALUES (2852, 321, '错那县', 3, 540530);
INSERT INTO `shop_region` VALUES (2853, 321, '浪卡子县', 3, 540531);
INSERT INTO `shop_region` VALUES (2854, 322, '那曲县', 3, 542421);
INSERT INTO `shop_region` VALUES (2855, 322, '嘉黎县', 3, 542422);
INSERT INTO `shop_region` VALUES (2856, 322, '比如县', 3, 542423);
INSERT INTO `shop_region` VALUES (2857, 322, '聂荣县', 3, 542424);
INSERT INTO `shop_region` VALUES (2858, 322, '安多县', 3, 542425);
INSERT INTO `shop_region` VALUES (2859, 322, '申扎县', 3, 542426);
INSERT INTO `shop_region` VALUES (2860, 322, '索县', 3, 542427);
INSERT INTO `shop_region` VALUES (2861, 322, '班戈县', 3, 542428);
INSERT INTO `shop_region` VALUES (2862, 322, '巴青县', 3, 542429);
INSERT INTO `shop_region` VALUES (2863, 322, '尼玛县', 3, 542430);
INSERT INTO `shop_region` VALUES (2864, 322, '双湖县', 3, 542431);
INSERT INTO `shop_region` VALUES (2865, 323, '普兰县', 3, 542521);
INSERT INTO `shop_region` VALUES (2866, 323, '札达县', 3, 542522);
INSERT INTO `shop_region` VALUES (2867, 323, '噶尔县', 3, 542523);
INSERT INTO `shop_region` VALUES (2868, 323, '日土县', 3, 542524);
INSERT INTO `shop_region` VALUES (2869, 323, '革吉县', 3, 542525);
INSERT INTO `shop_region` VALUES (2870, 323, '改则县', 3, 542526);
INSERT INTO `shop_region` VALUES (2871, 323, '措勤县', 3, 542527);
INSERT INTO `shop_region` VALUES (2872, 324, '新城区', 3, 610102);
INSERT INTO `shop_region` VALUES (2873, 324, '碑林区', 3, 610103);
INSERT INTO `shop_region` VALUES (2874, 324, '莲湖区', 3, 610104);
INSERT INTO `shop_region` VALUES (2875, 324, '灞桥区', 3, 610111);
INSERT INTO `shop_region` VALUES (2876, 324, '未央区', 3, 610112);
INSERT INTO `shop_region` VALUES (2877, 324, '雁塔区', 3, 610113);
INSERT INTO `shop_region` VALUES (2878, 324, '阎良区', 3, 610114);
INSERT INTO `shop_region` VALUES (2879, 324, '临潼区', 3, 610115);
INSERT INTO `shop_region` VALUES (2880, 324, '长安区', 3, 610116);
INSERT INTO `shop_region` VALUES (2881, 324, '高陵区', 3, 610117);
INSERT INTO `shop_region` VALUES (2882, 324, '蓝田县', 3, 610122);
INSERT INTO `shop_region` VALUES (2883, 324, '周至县', 3, 610124);
INSERT INTO `shop_region` VALUES (2884, 324, '户县', 3, 610125);
INSERT INTO `shop_region` VALUES (2885, 325, '王益区', 3, 610202);
INSERT INTO `shop_region` VALUES (2886, 325, '印台区', 3, 610203);
INSERT INTO `shop_region` VALUES (2887, 325, '耀州区', 3, 610204);
INSERT INTO `shop_region` VALUES (2888, 325, '宜君县', 3, 610222);
INSERT INTO `shop_region` VALUES (2889, 326, '渭滨区', 3, 610302);
INSERT INTO `shop_region` VALUES (2890, 326, '金台区', 3, 610303);
INSERT INTO `shop_region` VALUES (2891, 326, '陈仓区', 3, 610304);
INSERT INTO `shop_region` VALUES (2892, 326, '凤翔县', 3, 610322);
INSERT INTO `shop_region` VALUES (2893, 326, '岐山县', 3, 610323);
INSERT INTO `shop_region` VALUES (2894, 326, '扶风县', 3, 610324);
INSERT INTO `shop_region` VALUES (2895, 326, '眉县', 3, 610326);
INSERT INTO `shop_region` VALUES (2896, 326, '陇县', 3, 610327);
INSERT INTO `shop_region` VALUES (2897, 326, '千阳县', 3, 610328);
INSERT INTO `shop_region` VALUES (2898, 326, '麟游县', 3, 610329);
INSERT INTO `shop_region` VALUES (2899, 326, '凤县', 3, 610330);
INSERT INTO `shop_region` VALUES (2900, 326, '太白县', 3, 610331);
INSERT INTO `shop_region` VALUES (2901, 327, '秦都区', 3, 610402);
INSERT INTO `shop_region` VALUES (2902, 327, '杨陵区', 3, 610403);
INSERT INTO `shop_region` VALUES (2903, 327, '渭城区', 3, 610404);
INSERT INTO `shop_region` VALUES (2904, 327, '三原县', 3, 610422);
INSERT INTO `shop_region` VALUES (2905, 327, '泾阳县', 3, 610423);
INSERT INTO `shop_region` VALUES (2906, 327, '乾县', 3, 610424);
INSERT INTO `shop_region` VALUES (2907, 327, '礼泉县', 3, 610425);
INSERT INTO `shop_region` VALUES (2908, 327, '永寿县', 3, 610426);
INSERT INTO `shop_region` VALUES (2909, 327, '彬县', 3, 610427);
INSERT INTO `shop_region` VALUES (2910, 327, '长武县', 3, 610428);
INSERT INTO `shop_region` VALUES (2911, 327, '旬邑县', 3, 610429);
INSERT INTO `shop_region` VALUES (2912, 327, '淳化县', 3, 610430);
INSERT INTO `shop_region` VALUES (2913, 327, '武功县', 3, 610431);
INSERT INTO `shop_region` VALUES (2914, 327, '兴平市', 3, 610481);
INSERT INTO `shop_region` VALUES (2915, 328, '临渭区', 3, 610502);
INSERT INTO `shop_region` VALUES (2916, 328, '华州区', 3, 610503);
INSERT INTO `shop_region` VALUES (2917, 328, '潼关县', 3, 610522);
INSERT INTO `shop_region` VALUES (2918, 328, '大荔县', 3, 610523);
INSERT INTO `shop_region` VALUES (2919, 328, '合阳县', 3, 610524);
INSERT INTO `shop_region` VALUES (2920, 328, '澄城县', 3, 610525);
INSERT INTO `shop_region` VALUES (2921, 328, '蒲城县', 3, 610526);
INSERT INTO `shop_region` VALUES (2922, 328, '白水县', 3, 610527);
INSERT INTO `shop_region` VALUES (2923, 328, '富平县', 3, 610528);
INSERT INTO `shop_region` VALUES (2924, 328, '韩城市', 3, 610581);
INSERT INTO `shop_region` VALUES (2925, 328, '华阴市', 3, 610582);
INSERT INTO `shop_region` VALUES (2926, 329, '宝塔区', 3, 610602);
INSERT INTO `shop_region` VALUES (2927, 329, '安塞区', 3, 610603);
INSERT INTO `shop_region` VALUES (2928, 329, '延长县', 3, 610621);
INSERT INTO `shop_region` VALUES (2929, 329, '延川县', 3, 610622);
INSERT INTO `shop_region` VALUES (2930, 329, '子长县', 3, 610623);
INSERT INTO `shop_region` VALUES (2931, 329, '志丹县', 3, 610625);
INSERT INTO `shop_region` VALUES (2932, 329, '吴起县', 3, 610626);
INSERT INTO `shop_region` VALUES (2933, 329, '甘泉县', 3, 610627);
INSERT INTO `shop_region` VALUES (2934, 329, '富县', 3, 610628);
INSERT INTO `shop_region` VALUES (2935, 329, '洛川县', 3, 610629);
INSERT INTO `shop_region` VALUES (2936, 329, '宜川县', 3, 610630);
INSERT INTO `shop_region` VALUES (2937, 329, '黄龙县', 3, 610631);
INSERT INTO `shop_region` VALUES (2938, 329, '黄陵县', 3, 610632);
INSERT INTO `shop_region` VALUES (2939, 330, '汉台区', 3, 610702);
INSERT INTO `shop_region` VALUES (2940, 330, '南郑县', 3, 610721);
INSERT INTO `shop_region` VALUES (2941, 330, '城固县', 3, 610722);
INSERT INTO `shop_region` VALUES (2942, 330, '洋县', 3, 610723);
INSERT INTO `shop_region` VALUES (2943, 330, '西乡县', 3, 610724);
INSERT INTO `shop_region` VALUES (2944, 330, '勉县', 3, 610725);
INSERT INTO `shop_region` VALUES (2945, 330, '宁强县', 3, 610726);
INSERT INTO `shop_region` VALUES (2946, 330, '略阳县', 3, 610727);
INSERT INTO `shop_region` VALUES (2947, 330, '镇巴县', 3, 610728);
INSERT INTO `shop_region` VALUES (2948, 330, '留坝县', 3, 610729);
INSERT INTO `shop_region` VALUES (2949, 330, '佛坪县', 3, 610730);
INSERT INTO `shop_region` VALUES (2950, 331, '榆阳区', 3, 610802);
INSERT INTO `shop_region` VALUES (2951, 331, '横山区', 3, 610803);
INSERT INTO `shop_region` VALUES (2952, 331, '神木县', 3, 610821);
INSERT INTO `shop_region` VALUES (2953, 331, '府谷县', 3, 610822);
INSERT INTO `shop_region` VALUES (2954, 331, '靖边县', 3, 610824);
INSERT INTO `shop_region` VALUES (2955, 331, '定边县', 3, 610825);
INSERT INTO `shop_region` VALUES (2956, 331, '绥德县', 3, 610826);
INSERT INTO `shop_region` VALUES (2957, 331, '米脂县', 3, 610827);
INSERT INTO `shop_region` VALUES (2958, 331, '佳县', 3, 610828);
INSERT INTO `shop_region` VALUES (2959, 331, '吴堡县', 3, 610829);
INSERT INTO `shop_region` VALUES (2960, 331, '清涧县', 3, 610830);
INSERT INTO `shop_region` VALUES (2961, 331, '子洲县', 3, 610831);
INSERT INTO `shop_region` VALUES (2962, 332, '汉滨区', 3, 610902);
INSERT INTO `shop_region` VALUES (2963, 332, '汉阴县', 3, 610921);
INSERT INTO `shop_region` VALUES (2964, 332, '石泉县', 3, 610922);
INSERT INTO `shop_region` VALUES (2965, 332, '宁陕县', 3, 610923);
INSERT INTO `shop_region` VALUES (2966, 332, '紫阳县', 3, 610924);
INSERT INTO `shop_region` VALUES (2967, 332, '岚皋县', 3, 610925);
INSERT INTO `shop_region` VALUES (2968, 332, '平利县', 3, 610926);
INSERT INTO `shop_region` VALUES (2969, 332, '镇坪县', 3, 610927);
INSERT INTO `shop_region` VALUES (2970, 332, '旬阳县', 3, 610928);
INSERT INTO `shop_region` VALUES (2971, 332, '白河县', 3, 610929);
INSERT INTO `shop_region` VALUES (2972, 333, '商州区', 3, 611002);
INSERT INTO `shop_region` VALUES (2973, 333, '洛南县', 3, 611021);
INSERT INTO `shop_region` VALUES (2974, 333, '丹凤县', 3, 611022);
INSERT INTO `shop_region` VALUES (2975, 333, '商南县', 3, 611023);
INSERT INTO `shop_region` VALUES (2976, 333, '山阳县', 3, 611024);
INSERT INTO `shop_region` VALUES (2977, 333, '镇安县', 3, 611025);
INSERT INTO `shop_region` VALUES (2978, 333, '柞水县', 3, 611026);
INSERT INTO `shop_region` VALUES (2979, 334, '城关区', 3, 620102);
INSERT INTO `shop_region` VALUES (2980, 334, '七里河区', 3, 620103);
INSERT INTO `shop_region` VALUES (2981, 334, '西固区', 3, 620104);
INSERT INTO `shop_region` VALUES (2982, 334, '安宁区', 3, 620105);
INSERT INTO `shop_region` VALUES (2983, 334, '红古区', 3, 620111);
INSERT INTO `shop_region` VALUES (2984, 334, '永登县', 3, 620121);
INSERT INTO `shop_region` VALUES (2985, 334, '皋兰县', 3, 620122);
INSERT INTO `shop_region` VALUES (2986, 334, '榆中县', 3, 620123);
INSERT INTO `shop_region` VALUES (2987, 335, '嘉峪关市', 3, 620201);
INSERT INTO `shop_region` VALUES (2988, 336, '金川区', 3, 620302);
INSERT INTO `shop_region` VALUES (2989, 336, '永昌县', 3, 620321);
INSERT INTO `shop_region` VALUES (2990, 337, '白银区', 3, 620402);
INSERT INTO `shop_region` VALUES (2991, 337, '平川区', 3, 620403);
INSERT INTO `shop_region` VALUES (2992, 337, '靖远县', 3, 620421);
INSERT INTO `shop_region` VALUES (2993, 337, '会宁县', 3, 620422);
INSERT INTO `shop_region` VALUES (2994, 337, '景泰县', 3, 620423);
INSERT INTO `shop_region` VALUES (2995, 338, '秦州区', 3, 620502);
INSERT INTO `shop_region` VALUES (2996, 338, '麦积区', 3, 620503);
INSERT INTO `shop_region` VALUES (2997, 338, '清水县', 3, 620521);
INSERT INTO `shop_region` VALUES (2998, 338, '秦安县', 3, 620522);
INSERT INTO `shop_region` VALUES (2999, 338, '甘谷县', 3, 620523);
INSERT INTO `shop_region` VALUES (3000, 338, '武山县', 3, 620524);
INSERT INTO `shop_region` VALUES (3001, 338, '张家川回族自治县', 3, 620525);
INSERT INTO `shop_region` VALUES (3002, 339, '凉州区', 3, 620602);
INSERT INTO `shop_region` VALUES (3003, 339, '民勤县', 3, 620621);
INSERT INTO `shop_region` VALUES (3004, 339, '古浪县', 3, 620622);
INSERT INTO `shop_region` VALUES (3005, 339, '天祝藏族自治县', 3, 620623);
INSERT INTO `shop_region` VALUES (3006, 340, '甘州区', 3, 620702);
INSERT INTO `shop_region` VALUES (3007, 340, '肃南裕固族自治县', 3, 620721);
INSERT INTO `shop_region` VALUES (3008, 340, '民乐县', 3, 620722);
INSERT INTO `shop_region` VALUES (3009, 340, '临泽县', 3, 620723);
INSERT INTO `shop_region` VALUES (3010, 340, '高台县', 3, 620724);
INSERT INTO `shop_region` VALUES (3011, 340, '山丹县', 3, 620725);
INSERT INTO `shop_region` VALUES (3012, 341, '崆峒区', 3, 620802);
INSERT INTO `shop_region` VALUES (3013, 341, '泾川县', 3, 620821);
INSERT INTO `shop_region` VALUES (3014, 341, '灵台县', 3, 620822);
INSERT INTO `shop_region` VALUES (3015, 341, '崇信县', 3, 620823);
INSERT INTO `shop_region` VALUES (3016, 341, '华亭县', 3, 620824);
INSERT INTO `shop_region` VALUES (3017, 341, '庄浪县', 3, 620825);
INSERT INTO `shop_region` VALUES (3018, 341, '静宁县', 3, 620826);
INSERT INTO `shop_region` VALUES (3019, 342, '肃州区', 3, 620902);
INSERT INTO `shop_region` VALUES (3020, 342, '金塔县', 3, 620921);
INSERT INTO `shop_region` VALUES (3021, 342, '瓜州县', 3, 620922);
INSERT INTO `shop_region` VALUES (3022, 342, '肃北蒙古族自治县', 3, 620923);
INSERT INTO `shop_region` VALUES (3023, 342, '阿克塞哈萨克族自治县', 3, 620924);
INSERT INTO `shop_region` VALUES (3024, 342, '玉门市', 3, 620981);
INSERT INTO `shop_region` VALUES (3025, 342, '敦煌市', 3, 620982);
INSERT INTO `shop_region` VALUES (3026, 343, '西峰区', 3, 621002);
INSERT INTO `shop_region` VALUES (3027, 343, '庆城县', 3, 621021);
INSERT INTO `shop_region` VALUES (3028, 343, '环县', 3, 621022);
INSERT INTO `shop_region` VALUES (3029, 343, '华池县', 3, 621023);
INSERT INTO `shop_region` VALUES (3030, 343, '合水县', 3, 621024);
INSERT INTO `shop_region` VALUES (3031, 343, '正宁县', 3, 621025);
INSERT INTO `shop_region` VALUES (3032, 343, '宁县', 3, 621026);
INSERT INTO `shop_region` VALUES (3033, 343, '镇原县', 3, 621027);
INSERT INTO `shop_region` VALUES (3034, 344, '安定区', 3, 621102);
INSERT INTO `shop_region` VALUES (3035, 344, '通渭县', 3, 621121);
INSERT INTO `shop_region` VALUES (3036, 344, '陇西县', 3, 621122);
INSERT INTO `shop_region` VALUES (3037, 344, '渭源县', 3, 621123);
INSERT INTO `shop_region` VALUES (3038, 344, '临洮县', 3, 621124);
INSERT INTO `shop_region` VALUES (3039, 344, '漳县', 3, 621125);
INSERT INTO `shop_region` VALUES (3040, 344, '岷县', 3, 621126);
INSERT INTO `shop_region` VALUES (3041, 345, '武都区', 3, 621202);
INSERT INTO `shop_region` VALUES (3042, 345, '成县', 3, 621221);
INSERT INTO `shop_region` VALUES (3043, 345, '文县', 3, 621222);
INSERT INTO `shop_region` VALUES (3044, 345, '宕昌县', 3, 621223);
INSERT INTO `shop_region` VALUES (3045, 345, '康县', 3, 621224);
INSERT INTO `shop_region` VALUES (3046, 345, '西和县', 3, 621225);
INSERT INTO `shop_region` VALUES (3047, 345, '礼县', 3, 621226);
INSERT INTO `shop_region` VALUES (3048, 345, '徽县', 3, 621227);
INSERT INTO `shop_region` VALUES (3049, 345, '两当县', 3, 621228);
INSERT INTO `shop_region` VALUES (3050, 346, '临夏市', 3, 622901);
INSERT INTO `shop_region` VALUES (3051, 346, '临夏县', 3, 622921);
INSERT INTO `shop_region` VALUES (3052, 346, '康乐县', 3, 622922);
INSERT INTO `shop_region` VALUES (3053, 346, '永靖县', 3, 622923);
INSERT INTO `shop_region` VALUES (3054, 346, '广河县', 3, 622924);
INSERT INTO `shop_region` VALUES (3055, 346, '和政县', 3, 622925);
INSERT INTO `shop_region` VALUES (3056, 346, '东乡族自治县', 3, 622926);
INSERT INTO `shop_region` VALUES (3057, 346, '积石山保安族东乡族撒拉族自治县', 3, 622927);
INSERT INTO `shop_region` VALUES (3058, 347, '合作市', 3, 623001);
INSERT INTO `shop_region` VALUES (3059, 347, '临潭县', 3, 623021);
INSERT INTO `shop_region` VALUES (3060, 347, '卓尼县', 3, 623022);
INSERT INTO `shop_region` VALUES (3061, 347, '舟曲县', 3, 623023);
INSERT INTO `shop_region` VALUES (3062, 347, '迭部县', 3, 623024);
INSERT INTO `shop_region` VALUES (3063, 347, '玛曲县', 3, 623025);
INSERT INTO `shop_region` VALUES (3064, 347, '碌曲县', 3, 623026);
INSERT INTO `shop_region` VALUES (3065, 347, '夏河县', 3, 623027);
INSERT INTO `shop_region` VALUES (3066, 348, '城东区', 3, 630102);
INSERT INTO `shop_region` VALUES (3067, 348, '城中区', 3, 630103);
INSERT INTO `shop_region` VALUES (3068, 348, '城西区', 3, 630104);
INSERT INTO `shop_region` VALUES (3069, 348, '城北区', 3, 630105);
INSERT INTO `shop_region` VALUES (3070, 348, '大通回族土族自治县', 3, 630121);
INSERT INTO `shop_region` VALUES (3071, 348, '湟中县', 3, 630122);
INSERT INTO `shop_region` VALUES (3072, 348, '湟源县', 3, 630123);
INSERT INTO `shop_region` VALUES (3073, 349, '乐都区', 3, 630202);
INSERT INTO `shop_region` VALUES (3074, 349, '平安区', 3, 630203);
INSERT INTO `shop_region` VALUES (3075, 349, '民和回族土族自治县', 3, 630222);
INSERT INTO `shop_region` VALUES (3076, 349, '互助土族自治县', 3, 630223);
INSERT INTO `shop_region` VALUES (3077, 349, '化隆回族自治县', 3, 630224);
INSERT INTO `shop_region` VALUES (3078, 349, '循化撒拉族自治县', 3, 630225);
INSERT INTO `shop_region` VALUES (3079, 350, '门源回族自治县', 3, 632221);
INSERT INTO `shop_region` VALUES (3080, 350, '祁连县', 3, 632222);
INSERT INTO `shop_region` VALUES (3081, 350, '海晏县', 3, 632223);
INSERT INTO `shop_region` VALUES (3082, 350, '刚察县', 3, 632224);
INSERT INTO `shop_region` VALUES (3083, 351, '同仁县', 3, 632321);
INSERT INTO `shop_region` VALUES (3084, 351, '尖扎县', 3, 632322);
INSERT INTO `shop_region` VALUES (3085, 351, '泽库县', 3, 632323);
INSERT INTO `shop_region` VALUES (3086, 351, '河南蒙古族自治县', 3, 632324);
INSERT INTO `shop_region` VALUES (3087, 352, '共和县', 3, 632521);
INSERT INTO `shop_region` VALUES (3088, 352, '同德县', 3, 632522);
INSERT INTO `shop_region` VALUES (3089, 352, '贵德县', 3, 632523);
INSERT INTO `shop_region` VALUES (3090, 352, '兴海县', 3, 632524);
INSERT INTO `shop_region` VALUES (3091, 352, '贵南县', 3, 632525);
INSERT INTO `shop_region` VALUES (3092, 353, '玛沁县', 3, 632621);
INSERT INTO `shop_region` VALUES (3093, 353, '班玛县', 3, 632622);
INSERT INTO `shop_region` VALUES (3094, 353, '甘德县', 3, 632623);
INSERT INTO `shop_region` VALUES (3095, 353, '达日县', 3, 632624);
INSERT INTO `shop_region` VALUES (3096, 353, '久治县', 3, 632625);
INSERT INTO `shop_region` VALUES (3097, 353, '玛多县', 3, 632626);
INSERT INTO `shop_region` VALUES (3098, 354, '玉树市', 3, 632701);
INSERT INTO `shop_region` VALUES (3099, 354, '杂多县', 3, 632722);
INSERT INTO `shop_region` VALUES (3100, 354, '称多县', 3, 632723);
INSERT INTO `shop_region` VALUES (3101, 354, '治多县', 3, 632724);
INSERT INTO `shop_region` VALUES (3102, 354, '囊谦县', 3, 632725);
INSERT INTO `shop_region` VALUES (3103, 354, '曲麻莱县', 3, 632726);
INSERT INTO `shop_region` VALUES (3104, 355, '格尔木市', 3, 632801);
INSERT INTO `shop_region` VALUES (3105, 355, '德令哈市', 3, 632802);
INSERT INTO `shop_region` VALUES (3106, 355, '乌兰县', 3, 632821);
INSERT INTO `shop_region` VALUES (3107, 355, '都兰县', 3, 632822);
INSERT INTO `shop_region` VALUES (3108, 355, '天峻县', 3, 632823);
INSERT INTO `shop_region` VALUES (3109, 356, '兴庆区', 3, 640104);
INSERT INTO `shop_region` VALUES (3110, 356, '西夏区', 3, 640105);
INSERT INTO `shop_region` VALUES (3111, 356, '金凤区', 3, 640106);
INSERT INTO `shop_region` VALUES (3112, 356, '永宁县', 3, 640121);
INSERT INTO `shop_region` VALUES (3113, 356, '贺兰县', 3, 640122);
INSERT INTO `shop_region` VALUES (3114, 356, '灵武市', 3, 640181);
INSERT INTO `shop_region` VALUES (3115, 357, '大武口区', 3, 640202);
INSERT INTO `shop_region` VALUES (3116, 357, '惠农区', 3, 640205);
INSERT INTO `shop_region` VALUES (3117, 357, '平罗县', 3, 640221);
INSERT INTO `shop_region` VALUES (3118, 358, '利通区', 3, 640302);
INSERT INTO `shop_region` VALUES (3119, 358, '红寺堡区', 3, 640303);
INSERT INTO `shop_region` VALUES (3120, 358, '盐池县', 3, 640323);
INSERT INTO `shop_region` VALUES (3121, 358, '同心县', 3, 640324);
INSERT INTO `shop_region` VALUES (3122, 358, '青铜峡市', 3, 640381);
INSERT INTO `shop_region` VALUES (3123, 359, '原州区', 3, 640402);
INSERT INTO `shop_region` VALUES (3124, 359, '西吉县', 3, 640422);
INSERT INTO `shop_region` VALUES (3125, 359, '隆德县', 3, 640423);
INSERT INTO `shop_region` VALUES (3126, 359, '泾源县', 3, 640424);
INSERT INTO `shop_region` VALUES (3127, 359, '彭阳县', 3, 640425);
INSERT INTO `shop_region` VALUES (3128, 360, '沙坡头区', 3, 640502);
INSERT INTO `shop_region` VALUES (3129, 360, '中宁县', 3, 640521);
INSERT INTO `shop_region` VALUES (3130, 360, '海原县', 3, 640522);
INSERT INTO `shop_region` VALUES (3131, 361, '天山区', 3, 650102);
INSERT INTO `shop_region` VALUES (3132, 361, '沙依巴克区', 3, 650103);
INSERT INTO `shop_region` VALUES (3133, 361, '新市区', 3, 650104);
INSERT INTO `shop_region` VALUES (3134, 361, '水磨沟区', 3, 650105);
INSERT INTO `shop_region` VALUES (3135, 361, '头屯河区', 3, 650106);
INSERT INTO `shop_region` VALUES (3136, 361, '达坂城区', 3, 650107);
INSERT INTO `shop_region` VALUES (3137, 361, '米东区', 3, 650109);
INSERT INTO `shop_region` VALUES (3138, 361, '乌鲁木齐县', 3, 650121);
INSERT INTO `shop_region` VALUES (3139, 362, '独山子区', 3, 650202);
INSERT INTO `shop_region` VALUES (3140, 362, '克拉玛依区', 3, 650203);
INSERT INTO `shop_region` VALUES (3141, 362, '白碱滩区', 3, 650204);
INSERT INTO `shop_region` VALUES (3142, 362, '乌尔禾区', 3, 650205);
INSERT INTO `shop_region` VALUES (3143, 363, '高昌区', 3, 650402);
INSERT INTO `shop_region` VALUES (3144, 363, '鄯善县', 3, 650421);
INSERT INTO `shop_region` VALUES (3145, 363, '托克逊县', 3, 650422);
INSERT INTO `shop_region` VALUES (3146, 364, '伊州区', 3, 650502);
INSERT INTO `shop_region` VALUES (3147, 364, '巴里坤哈萨克自治县', 3, 650521);
INSERT INTO `shop_region` VALUES (3148, 364, '伊吾县', 3, 650522);
INSERT INTO `shop_region` VALUES (3149, 365, '昌吉市', 3, 652301);
INSERT INTO `shop_region` VALUES (3150, 365, '阜康市', 3, 652302);
INSERT INTO `shop_region` VALUES (3151, 365, '呼图壁县', 3, 652323);
INSERT INTO `shop_region` VALUES (3152, 365, '玛纳斯县', 3, 652324);
INSERT INTO `shop_region` VALUES (3153, 365, '奇台县', 3, 652325);
INSERT INTO `shop_region` VALUES (3154, 365, '吉木萨尔县', 3, 652327);
INSERT INTO `shop_region` VALUES (3155, 365, '木垒哈萨克自治县', 3, 652328);
INSERT INTO `shop_region` VALUES (3156, 366, '博乐市', 3, 652701);
INSERT INTO `shop_region` VALUES (3157, 366, '阿拉山口市', 3, 652702);
INSERT INTO `shop_region` VALUES (3158, 366, '精河县', 3, 652722);
INSERT INTO `shop_region` VALUES (3159, 366, '温泉县', 3, 652723);
INSERT INTO `shop_region` VALUES (3160, 367, '库尔勒市', 3, 652801);
INSERT INTO `shop_region` VALUES (3161, 367, '轮台县', 3, 652822);
INSERT INTO `shop_region` VALUES (3162, 367, '尉犁县', 3, 652823);
INSERT INTO `shop_region` VALUES (3163, 367, '若羌县', 3, 652824);
INSERT INTO `shop_region` VALUES (3164, 367, '且末县', 3, 652825);
INSERT INTO `shop_region` VALUES (3165, 367, '焉耆回族自治县', 3, 652826);
INSERT INTO `shop_region` VALUES (3166, 367, '和静县', 3, 652827);
INSERT INTO `shop_region` VALUES (3167, 367, '和硕县', 3, 652828);
INSERT INTO `shop_region` VALUES (3168, 367, '博湖县', 3, 652829);
INSERT INTO `shop_region` VALUES (3169, 368, '阿克苏市', 3, 652901);
INSERT INTO `shop_region` VALUES (3170, 368, '温宿县', 3, 652922);
INSERT INTO `shop_region` VALUES (3171, 368, '库车县', 3, 652923);
INSERT INTO `shop_region` VALUES (3172, 368, '沙雅县', 3, 652924);
INSERT INTO `shop_region` VALUES (3173, 368, '新和县', 3, 652925);
INSERT INTO `shop_region` VALUES (3174, 368, '拜城县', 3, 652926);
INSERT INTO `shop_region` VALUES (3175, 368, '乌什县', 3, 652927);
INSERT INTO `shop_region` VALUES (3176, 368, '阿瓦提县', 3, 652928);
INSERT INTO `shop_region` VALUES (3177, 368, '柯坪县', 3, 652929);
INSERT INTO `shop_region` VALUES (3178, 369, '阿图什市', 3, 653001);
INSERT INTO `shop_region` VALUES (3179, 369, '阿克陶县', 3, 653022);
INSERT INTO `shop_region` VALUES (3180, 369, '阿合奇县', 3, 653023);
INSERT INTO `shop_region` VALUES (3181, 369, '乌恰县', 3, 653024);
INSERT INTO `shop_region` VALUES (3182, 370, '喀什市', 3, 653101);
INSERT INTO `shop_region` VALUES (3183, 370, '疏附县', 3, 653121);
INSERT INTO `shop_region` VALUES (3184, 370, '疏勒县', 3, 653122);
INSERT INTO `shop_region` VALUES (3185, 370, '英吉沙县', 3, 653123);
INSERT INTO `shop_region` VALUES (3186, 370, '泽普县', 3, 653124);
INSERT INTO `shop_region` VALUES (3187, 370, '莎车县', 3, 653125);
INSERT INTO `shop_region` VALUES (3188, 370, '叶城县', 3, 653126);
INSERT INTO `shop_region` VALUES (3189, 370, '麦盖提县', 3, 653127);
INSERT INTO `shop_region` VALUES (3190, 370, '岳普湖县', 3, 653128);
INSERT INTO `shop_region` VALUES (3191, 370, '伽师县', 3, 653129);
INSERT INTO `shop_region` VALUES (3192, 370, '巴楚县', 3, 653130);
INSERT INTO `shop_region` VALUES (3193, 370, '塔什库尔干塔吉克自治县', 3, 653131);
INSERT INTO `shop_region` VALUES (3194, 371, '和田市', 3, 653201);
INSERT INTO `shop_region` VALUES (3195, 371, '和田县', 3, 653221);
INSERT INTO `shop_region` VALUES (3196, 371, '墨玉县', 3, 653222);
INSERT INTO `shop_region` VALUES (3197, 371, '皮山县', 3, 653223);
INSERT INTO `shop_region` VALUES (3198, 371, '洛浦县', 3, 653224);
INSERT INTO `shop_region` VALUES (3199, 371, '策勒县', 3, 653225);
INSERT INTO `shop_region` VALUES (3200, 371, '于田县', 3, 653226);
INSERT INTO `shop_region` VALUES (3201, 371, '民丰县', 3, 653227);
INSERT INTO `shop_region` VALUES (3202, 372, '伊宁市', 3, 654002);
INSERT INTO `shop_region` VALUES (3203, 372, '奎屯市', 3, 654003);
INSERT INTO `shop_region` VALUES (3204, 372, '霍尔果斯市', 3, 654004);
INSERT INTO `shop_region` VALUES (3205, 372, '伊宁县', 3, 654021);
INSERT INTO `shop_region` VALUES (3206, 372, '察布查尔锡伯自治县', 3, 654022);
INSERT INTO `shop_region` VALUES (3207, 372, '霍城县', 3, 654023);
INSERT INTO `shop_region` VALUES (3208, 372, '巩留县', 3, 654024);
INSERT INTO `shop_region` VALUES (3209, 372, '新源县', 3, 654025);
INSERT INTO `shop_region` VALUES (3210, 372, '昭苏县', 3, 654026);
INSERT INTO `shop_region` VALUES (3211, 372, '特克斯县', 3, 654027);
INSERT INTO `shop_region` VALUES (3212, 372, '尼勒克县', 3, 654028);
INSERT INTO `shop_region` VALUES (3213, 373, '塔城市', 3, 654201);
INSERT INTO `shop_region` VALUES (3214, 373, '乌苏市', 3, 654202);
INSERT INTO `shop_region` VALUES (3215, 373, '额敏县', 3, 654221);
INSERT INTO `shop_region` VALUES (3216, 373, '沙湾县', 3, 654223);
INSERT INTO `shop_region` VALUES (3217, 373, '托里县', 3, 654224);
INSERT INTO `shop_region` VALUES (3218, 373, '裕民县', 3, 654225);
INSERT INTO `shop_region` VALUES (3219, 373, '和布克赛尔蒙古自治县', 3, 654226);
INSERT INTO `shop_region` VALUES (3220, 374, '阿勒泰市', 3, 654301);
INSERT INTO `shop_region` VALUES (3221, 374, '布尔津县', 3, 654321);
INSERT INTO `shop_region` VALUES (3222, 374, '富蕴县', 3, 654322);
INSERT INTO `shop_region` VALUES (3223, 374, '福海县', 3, 654323);
INSERT INTO `shop_region` VALUES (3224, 374, '哈巴河县', 3, 654324);
INSERT INTO `shop_region` VALUES (3225, 374, '青河县', 3, 654325);
INSERT INTO `shop_region` VALUES (3226, 374, '吉木乃县', 3, 654326);
INSERT INTO `shop_region` VALUES (3227, 375, '石河子市', 3, 659001);
INSERT INTO `shop_region` VALUES (3228, 375, '阿拉尔市', 3, 659002);
INSERT INTO `shop_region` VALUES (3229, 375, '图木舒克市', 3, 659003);
INSERT INTO `shop_region` VALUES (3230, 375, '五家渠市', 3, 659004);
INSERT INTO `shop_region` VALUES (3231, 375, '铁门关市', 3, 659006);
COMMIT;

-- ----------------------------
-- Table structure for shop_role
-- ----------------------------
DROP TABLE IF EXISTS `shop_role`;
CREATE TABLE `shop_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `desc` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色描述',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色表';

-- ----------------------------
-- Records of shop_role
-- ----------------------------
BEGIN;
INSERT INTO `shop_role` VALUES (1, '超级管理员', '所有模块的权限', 1, '2019-01-01 00:00:00', '2019-01-01 00:00:00', 0);
INSERT INTO `shop_role` VALUES (2, '商场管理员', '只有商场模块的操作权限', 1, '2019-01-01 00:00:00', '2019-01-07 15:15:12', 1);
INSERT INTO `shop_role` VALUES (3, '销售管理员', '只有销售操作权限', 1, '2019-01-01 00:00:00', '2019-12-13 14:35:37', 0);
INSERT INTO `shop_role` VALUES (10, '测试人员', '测试人员', 1, '2019-10-02 22:40:04', '2019-10-02 22:40:04', 1);
COMMIT;

-- ----------------------------
-- Table structure for shop_storage
-- ----------------------------
DROP TABLE IF EXISTS `shop_storage`;
CREATE TABLE `shop_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件的唯一索引',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '文件访问链接',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='文件存储表';

-- ----------------------------
-- Records of shop_storage
-- ----------------------------
BEGIN;
INSERT INTO `shop_storage` VALUES (25, 'u4kbfavifvb7cyfiysut.jpeg', '1.jpeg', 'image/jpeg', 42815, 'http://localhost:8080/client/storage/fetch/u4kbfavifvb7cyfiysut.jpeg', '2019-10-31 11:55:52', '2019-10-31 11:55:52', 0);
INSERT INTO `shop_storage` VALUES (26, '1t3syk0gwhx9ziq0g8t4.jpeg', '2.jpeg', 'image/jpeg', 92995, 'http://localhost:8080/client/storage/fetch/1t3syk0gwhx9ziq0g8t4.jpeg', '2019-10-31 11:56:21', '2019-10-31 11:56:21', 0);
INSERT INTO `shop_storage` VALUES (27, 'gwkdbdt4f6cbrtusxi2p.jpeg', '3.jpeg', 'image/jpeg', 124059, 'http://localhost:8080/client/storage/fetch/gwkdbdt4f6cbrtusxi2p.jpeg', '2019-10-31 11:56:37', '2019-10-31 11:56:37', 0);
INSERT INTO `shop_storage` VALUES (28, 'jter8w35xag30656zki9.jpeg', '4.jpeg', 'image/jpeg', 87445, 'http://localhost:8080/client/storage/fetch/jter8w35xag30656zki9.jpeg', '2019-10-31 11:56:54', '2019-10-31 11:56:54', 0);
INSERT INTO `shop_storage` VALUES (29, 'v2btdk66enmb6bl9ol1m.png', '1.png', 'image/png', 7942, 'http://localhost:8080/client/storage/fetch/v2btdk66enmb6bl9ol1m.png', '2019-10-31 11:59:30', '2019-10-31 11:59:30', 0);
INSERT INTO `shop_storage` VALUES (30, 'etyo9hdis2yidcijadhs.png', '3.png', 'image/png', 7215, 'http://localhost:8080/client/storage/fetch/etyo9hdis2yidcijadhs.png', '2019-10-31 11:59:38', '2019-10-31 11:59:38', 0);
INSERT INTO `shop_storage` VALUES (31, 'nkxz0d5bip9r9xpmjmd3.png', '1.png', 'image/png', 7942, 'http://localhost:8080/client/storage/fetch/nkxz0d5bip9r9xpmjmd3.png', '2019-10-31 11:59:44', '2019-10-31 11:59:44', 0);
INSERT INTO `shop_storage` VALUES (32, 'g8yivxklmat7ybfe7f3h.png', '1.png', 'image/png', 7942, 'http://localhost:8080/client/storage/fetch/g8yivxklmat7ybfe7f3h.png', '2019-10-31 12:00:07', '2019-10-31 12:00:07', 0);
INSERT INTO `shop_storage` VALUES (33, '4ep1sl1yt37hrtwxn2aa.png', '2.png', 'image/png', 5853, 'http://localhost:8080/client/storage/fetch/4ep1sl1yt37hrtwxn2aa.png', '2019-10-31 12:00:30', '2019-10-31 12:00:30', 0);
INSERT INTO `shop_storage` VALUES (34, 'a3m49u67ksiis70ucyuk.png', '2.png', 'image/png', 5853, 'http://localhost:8080/client/storage/fetch/a3m49u67ksiis70ucyuk.png', '2019-10-31 12:00:34', '2019-10-31 12:00:34', 0);
INSERT INTO `shop_storage` VALUES (35, 'iqpkecqeejg5h831fs0a.png', '衬衫.png', 'image/png', 1748, 'http://localhost:8080/client/storage/fetch/iqpkecqeejg5h831fs0a.png', '2019-10-31 12:01:21', '2019-10-31 12:01:21', 0);
INSERT INTO `shop_storage` VALUES (36, '138k33e3zpkky46rgwfw.png', '衬衫.png', 'image/png', 1748, 'http://localhost:8080/client/storage/fetch/138k33e3zpkky46rgwfw.png', '2019-10-31 12:01:41', '2019-10-31 12:01:41', 0);
INSERT INTO `shop_storage` VALUES (37, 'yuhlw8cv8h3mijk1cm2f.png', '裤装.png', 'image/png', 3122, 'http://localhost:8080/client/storage/fetch/yuhlw8cv8h3mijk1cm2f.png', '2019-10-31 12:02:05', '2019-10-31 12:02:05', 0);
INSERT INTO `shop_storage` VALUES (38, 'rqfynvrdsazparquhfm8.png', '裤装.png', 'image/png', 3122, 'http://localhost:8080/client/storage/fetch/rqfynvrdsazparquhfm8.png', '2019-10-31 12:02:08', '2019-10-31 12:02:08', 0);
INSERT INTO `shop_storage` VALUES (39, 'j8l229w215gwsgyl1sge.png', '外衣.png', 'image/png', 1774, 'http://localhost:8080/client/storage/fetch/j8l229w215gwsgyl1sge.png', '2019-10-31 12:02:28', '2019-10-31 12:02:28', 0);
INSERT INTO `shop_storage` VALUES (40, 'pfou5zwmnn1cb14t0m3c.png', '外衣.png', 'image/png', 1774, 'http://localhost:8080/client/storage/fetch/pfou5zwmnn1cb14t0m3c.png', '2019-10-31 12:02:31', '2019-10-31 12:02:31', 0);
INSERT INTO `shop_storage` VALUES (41, 'rxhtmvg8olixy4l4xk51.png', '卫衣.png', 'image/png', 3351, 'http://localhost:8080/client/storage/fetch/rxhtmvg8olixy4l4xk51.png', '2019-10-31 12:02:48', '2019-10-31 12:02:48', 0);
INSERT INTO `shop_storage` VALUES (42, 'htxkzjgzbv39ijzl7bny.png', '卫衣.png', 'image/png', 3351, 'http://localhost:8080/client/storage/fetch/htxkzjgzbv39ijzl7bny.png', '2019-10-31 12:02:51', '2019-10-31 12:02:51', 0);
INSERT INTO `shop_storage` VALUES (43, '2jvfjoq7sr72x9swztj7.png', '3.png', 'image/png', 7215, 'http://localhost:8080/client/storage/fetch/2jvfjoq7sr72x9swztj7.png', '2019-10-31 12:05:22', '2019-10-31 12:05:22', 0);
INSERT INTO `shop_storage` VALUES (44, '6rxt420946z2wwhlm63e.png', '3.png', 'image/png', 7215, 'http://localhost:8080/client/storage/fetch/6rxt420946z2wwhlm63e.png', '2019-10-31 12:05:47', '2019-10-31 12:05:47', 0);
INSERT INTO `shop_storage` VALUES (45, 'ono7odu01uj17i24l2r9.png', '4.png', 'image/png', 6638, 'http://localhost:8080/client/storage/fetch/ono7odu01uj17i24l2r9.png', '2019-10-31 12:06:15', '2019-10-31 12:06:15', 0);
INSERT INTO `shop_storage` VALUES (46, '59j99pop7na5p8fx6huz.png', '4.png', 'image/png', 6638, 'http://localhost:8080/client/storage/fetch/59j99pop7na5p8fx6huz.png', '2019-10-31 12:06:23', '2019-10-31 12:06:23', 0);
INSERT INTO `shop_storage` VALUES (47, 'yo4xvpa9sa3bud0xxd60.png', '5.png', 'image/png', 5870, 'http://localhost:8080/client/storage/fetch/yo4xvpa9sa3bud0xxd60.png', '2019-10-31 12:09:27', '2019-10-31 12:09:27', 0);
INSERT INTO `shop_storage` VALUES (48, 'e7zk663b66vs7shpa6ey.png', '5.png', 'image/png', 5870, 'http://localhost:8080/client/storage/fetch/e7zk663b66vs7shpa6ey.png', '2019-10-31 12:09:50', '2019-10-31 12:09:50', 0);
INSERT INTO `shop_storage` VALUES (49, 'gxfb2tv2iyhfokozz68i.png', '6.png', 'image/png', 3956, 'http://localhost:8080/client/storage/fetch/gxfb2tv2iyhfokozz68i.png', '2019-10-31 12:09:59', '2019-10-31 12:09:59', 0);
INSERT INTO `shop_storage` VALUES (50, 'u4look02agyoia263bqn.png', '6.png', 'image/png', 3956, 'http://localhost:8080/client/storage/fetch/u4look02agyoia263bqn.png', '2019-10-31 12:10:23', '2019-10-31 12:10:23', 0);
INSERT INTO `shop_storage` VALUES (51, '06o28ydms1lmq4ky1xfd.png', '7.png', 'image/png', 5016, 'http://localhost:8080/client/storage/fetch/06o28ydms1lmq4ky1xfd.png', '2019-10-31 12:10:51', '2019-10-31 12:10:51', 0);
INSERT INTO `shop_storage` VALUES (52, 'c2njgrn8k9ulwv8hcs0l.png', '7.png', 'image/png', 5016, 'http://localhost:8080/client/storage/fetch/c2njgrn8k9ulwv8hcs0l.png', '2019-10-31 12:10:54', '2019-10-31 12:10:54', 0);
INSERT INTO `shop_storage` VALUES (53, 'jckx5jw0shf8gqzm67cv.png', '8.png', 'image/png', 5016, 'http://localhost:8080/client/storage/fetch/jckx5jw0shf8gqzm67cv.png', '2019-10-31 12:11:05', '2019-10-31 12:11:05', 0);
INSERT INTO `shop_storage` VALUES (54, 'r25yrv86gdztod4szhd6.png', '8.png', 'image/png', 5016, 'http://localhost:8080/client/storage/fetch/r25yrv86gdztod4szhd6.png', '2019-10-31 12:11:20', '2019-10-31 12:11:20', 0);
INSERT INTO `shop_storage` VALUES (55, 'zwyeltcklrhe0vrx3dqi.png', '10.png', 'image/png', 4919, 'http://localhost:8080/client/storage/fetch/zwyeltcklrhe0vrx3dqi.png', '2019-10-31 12:11:32', '2019-10-31 12:11:32', 0);
INSERT INTO `shop_storage` VALUES (56, 'r1ek6f2vgrmg4r0mheah.png', '10.png', 'image/png', 4919, 'http://localhost:8080/client/storage/fetch/r1ek6f2vgrmg4r0mheah.png', '2019-10-31 12:11:34', '2019-10-31 12:11:34', 0);
INSERT INTO `shop_storage` VALUES (57, 'wk46d6qbxbh3vhes421y.png', '622c8d79292154017b0cbda97588a0d7.png', 'image/png', 222356, 'http://localhost:8080/client/storage/fetch/wk46d6qbxbh3vhes421y.png', '2019-10-31 12:14:00', '2019-10-31 12:14:00', 0);
INSERT INTO `shop_storage` VALUES (58, 'ssllhaqfvypwwawakna6.jpg', 'cover.jpg', 'image/jpeg', 66861, 'http://localhost:8080/client/storage/fetch/ssllhaqfvypwwawakna6.jpg', '2019-10-31 12:47:03', '2019-10-31 12:47:03', 0);
INSERT INTO `shop_storage` VALUES (59, '836btpjh72mo2znlh4tc.jpg', 'cover.jpg', 'image/jpeg', 66861, 'http://localhost:8080/client/storage/fetch/836btpjh72mo2znlh4tc.jpg', '2019-10-31 12:47:23', '2019-10-31 12:47:23', 0);
INSERT INTO `shop_storage` VALUES (60, '9swy2k4y1g0881my01ny.jpg', '2.jpg', 'image/jpeg', 206288, 'http://localhost:8080/client/storage/fetch/9swy2k4y1g0881my01ny.jpg', '2019-10-31 12:47:30', '2019-10-31 12:47:30', 0);
INSERT INTO `shop_storage` VALUES (61, 'sjvevpccayyl6hnk447z.jpg', '3.jpg', 'image/jpeg', 216019, 'http://localhost:8080/client/storage/fetch/sjvevpccayyl6hnk447z.jpg', '2019-10-31 12:47:36', '2019-10-31 12:47:36', 0);
INSERT INTO `shop_storage` VALUES (62, '0t7jtn6espxla8mrujoc.jpg', '1.jpg', 'image/jpeg', 201247, 'http://localhost:8080/client/storage/fetch/0t7jtn6espxla8mrujoc.jpg', '2019-10-31 12:48:19', '2019-10-31 12:48:19', 0);
INSERT INTO `shop_storage` VALUES (63, '8lu2kdicor5ki40151kg.jpg', '2.jpg', 'image/jpeg', 206288, 'http://localhost:8080/client/storage/fetch/8lu2kdicor5ki40151kg.jpg', '2019-10-31 12:48:30', '2019-10-31 12:48:30', 0);
INSERT INTO `shop_storage` VALUES (64, 'j4djwvxybdc0mwsdtouz.jpg', '3.jpg', 'image/jpeg', 216019, 'http://localhost:8080/client/storage/fetch/j4djwvxybdc0mwsdtouz.jpg', '2019-10-31 12:48:46', '2019-10-31 12:48:46', 0);
INSERT INTO `shop_storage` VALUES (65, '2sxztqxuuhkunnfqlawa.jpg', '4.jpg', 'image/jpeg', 266654, 'http://localhost:8080/client/storage/fetch/2sxztqxuuhkunnfqlawa.jpg', '2019-10-31 12:48:57', '2019-10-31 12:48:57', 0);
INSERT INTO `shop_storage` VALUES (66, 'k7ru69c1r2e5njmkqwmj.jpg', '5.jpg', 'image/jpeg', 134271, 'http://localhost:8080/client/storage/fetch/k7ru69c1r2e5njmkqwmj.jpg', '2019-10-31 12:49:07', '2019-10-31 12:49:07', 0);
INSERT INTO `shop_storage` VALUES (67, 'w87zicvrqutux0pjgnvf.jpg', '5.jpg', 'image/jpeg', 134271, 'http://localhost:8080/client/storage/fetch/w87zicvrqutux0pjgnvf.jpg', '2019-10-31 12:49:45', '2019-10-31 12:49:45', 0);
INSERT INTO `shop_storage` VALUES (68, '4jmqaabk2onlpmx7ztrh.jpg', '5.jpg', 'image/jpeg', 134271, 'http://localhost:8080/client/storage/fetch/4jmqaabk2onlpmx7ztrh.jpg', '2019-10-31 12:59:51', '2019-10-31 12:59:51', 0);
INSERT INTO `shop_storage` VALUES (69, 'd4dekn0k5fbnxsv6ituc.png', '622c8d79292154017b0cbda97588a0d7.png', 'image/png', 222356, 'http://localhost:8080/client/storage/fetch/d4dekn0k5fbnxsv6ituc.png', '2019-10-31 15:44:18', '2019-10-31 15:44:18', 0);
INSERT INTO `shop_storage` VALUES (70, 'grdezigxzbxcrd1b6beh.png', '11abb11c4cfdee59abfb6d16caca4c6a.png', 'image/png', 3519, 'http://localhost:8080/client/storage/fetch/grdezigxzbxcrd1b6beh.png', '2019-10-31 15:47:23', '2019-10-31 15:47:23', 0);
INSERT INTO `shop_storage` VALUES (71, 'bd5vop1s6g6xiau7m3z0.png', '02f9a44d05c05c0dd439a5eb674570a2.png', 'image/png', 192463, 'http://localhost:8080/client/storage/fetch/bd5vop1s6g6xiau7m3z0.png', '2019-10-31 15:48:09', '2019-10-31 15:48:09', 0);
INSERT INTO `shop_storage` VALUES (72, '1kvuygv5qa6drmxn269x.png', '9cc0b3e0d5a4f4a22134c170f10b70f2.png', 'image/png', 226416, 'http://localhost:8080/client/storage/fetch/1kvuygv5qa6drmxn269x.png', '2019-10-31 15:49:25', '2019-10-31 15:49:25', 0);
INSERT INTO `shop_storage` VALUES (73, 'q1r3merns7p0qwgcg17j.png', '1526ab0f5982722adbc8726f9f2a338c.png', 'image/png', 251610, 'http://localhost:8080/client/storage/fetch/q1r3merns7p0qwgcg17j.png', '2019-10-31 15:50:34', '2019-10-31 15:50:34', 0);
INSERT INTO `shop_storage` VALUES (74, 'p1cur5bqk3aivia1kskm.png', '1706e24a5e605870ba3b37ff5f49aa18.png', 'image/png', 102040, 'http://localhost:8080/client/storage/fetch/p1cur5bqk3aivia1kskm.png', '2019-10-31 15:52:16', '2019-10-31 15:52:16', 0);
INSERT INTO `shop_storage` VALUES (75, 'cbkngagvgyuhgt2ukedh.png', '1706e24a5e605870ba3b37ff5f49aa18.png', 'image/png', 102040, 'http://localhost:8080/client/storage/fetch/cbkngagvgyuhgt2ukedh.png', '2019-10-31 15:53:17', '2019-10-31 15:53:17', 0);
INSERT INTO `shop_storage` VALUES (76, 'qvnhq7bv2ul0xuthcxta.png', '547853361d29a37282f377b9a755dd37.png', 'image/png', 106701, 'http://localhost:8080/client/storage/fetch/qvnhq7bv2ul0xuthcxta.png', '2019-10-31 15:53:25', '2019-10-31 15:53:25', 0);
INSERT INTO `shop_storage` VALUES (77, 'lcqgrfaba2am7xy6k6q7.png', '547853361d29a37282f377b9a755dd37.png', 'image/png', 106701, 'http://localhost:8080/client/storage/fetch/lcqgrfaba2am7xy6k6q7.png', '2019-10-31 15:54:29', '2019-10-31 15:54:29', 0);
INSERT INTO `shop_storage` VALUES (78, '725wcwcn4rmjs09muhne.png', 'e8bf0cf08cf7eda21606ab191762e35c.png', 'image/png', 247165, 'http://localhost:8080/client/storage/fetch/725wcwcn4rmjs09muhne.png', '2019-10-31 15:55:55', '2019-10-31 15:55:55', 0);
INSERT INTO `shop_storage` VALUES (79, '51uq8a5ib3ow36sbxuhj.png', '女装.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/51uq8a5ib3ow36sbxuhj.png', '2019-10-31 16:46:05', '2019-10-31 16:46:05', 0);
INSERT INTO `shop_storage` VALUES (80, 'hxzr4v4j41rair56pe6k.png', '女装.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/hxzr4v4j41rair56pe6k.png', '2019-10-31 16:46:09', '2019-10-31 16:46:09', 0);
INSERT INTO `shop_storage` VALUES (81, 'yqi6bx6qfv6jfpu512x2.png', '男装.png', 'image/png', 10484, 'http://localhost:8080/client/storage/fetch/yqi6bx6qfv6jfpu512x2.png', '2019-10-31 16:46:26', '2019-10-31 16:46:26', 0);
INSERT INTO `shop_storage` VALUES (82, 'jii9zippsiv6et2nl2x6.png', '男装.png', 'image/png', 10484, 'http://localhost:8080/client/storage/fetch/jii9zippsiv6et2nl2x6.png', '2019-10-31 16:46:29', '2019-10-31 16:46:29', 0);
INSERT INTO `shop_storage` VALUES (83, 'lbf9f7s3nm0z3ahsd39t.png', '童装.png', 'image/png', 7958, 'http://localhost:8080/client/storage/fetch/lbf9f7s3nm0z3ahsd39t.png', '2019-10-31 16:46:43', '2019-10-31 16:46:43', 0);
INSERT INTO `shop_storage` VALUES (84, 'oanxx7h7c65g9dku1v60.png', '童装.png', 'image/png', 7958, 'http://localhost:8080/client/storage/fetch/oanxx7h7c65g9dku1v60.png', '2019-10-31 16:46:50', '2019-10-31 16:46:50', 0);
INSERT INTO `shop_storage` VALUES (85, 't9ndmujiivhem20k10tu.png', '内衣.png', 'image/png', 16015, 'http://localhost:8080/client/storage/fetch/t9ndmujiivhem20k10tu.png', '2019-10-31 16:47:10', '2019-10-31 16:47:10', 0);
INSERT INTO `shop_storage` VALUES (86, 'qs914tdyx9akf8564ehh.png', '内衣.png', 'image/png', 16015, 'http://localhost:8080/client/storage/fetch/qs914tdyx9akf8564ehh.png', '2019-10-31 16:47:14', '2019-10-31 16:47:14', 0);
INSERT INTO `shop_storage` VALUES (87, 'm9zegmfkzo7qw5bn4ezj.png', '衣服.png', 'image/png', 10682, 'http://localhost:8080/client/storage/fetch/m9zegmfkzo7qw5bn4ezj.png', '2019-10-31 16:57:53', '2019-10-31 16:57:53', 0);
INSERT INTO `shop_storage` VALUES (88, 'eb9sph45ns3mxtdlcchx.png', '包包.png', 'image/png', 6827, 'http://localhost:8080/client/storage/fetch/eb9sph45ns3mxtdlcchx.png', '2019-10-31 16:59:10', '2019-10-31 16:59:10', 0);
INSERT INTO `shop_storage` VALUES (89, 'v889mvcea20pz16z35q1.png', '包包 (1).png', 'image/png', 7151, 'http://localhost:8080/client/storage/fetch/v889mvcea20pz16z35q1.png', '2019-10-31 16:59:53', '2019-10-31 16:59:53', 0);
INSERT INTO `shop_storage` VALUES (90, 'sb6itrff7ivo6ofeopjf.png', '母婴.png', 'image/png', 5749, 'http://localhost:8080/client/storage/fetch/sb6itrff7ivo6ofeopjf.png', '2019-10-31 17:00:26', '2019-10-31 17:00:26', 0);
INSERT INTO `shop_storage` VALUES (91, 'bz1l0lt3u2pqhu7ht8so.png', '洗护用品.png', 'image/png', 9974, 'http://localhost:8080/client/storage/fetch/bz1l0lt3u2pqhu7ht8so.png', '2019-10-31 17:01:26', '2019-10-31 17:01:26', 0);
INSERT INTO `shop_storage` VALUES (92, 'jbbjt85tpms7c9azfimq.png', '图书馆.png', 'image/png', 3652, 'http://localhost:8080/client/storage/fetch/jbbjt85tpms7c9azfimq.png', '2019-10-31 17:02:24', '2019-10-31 17:02:24', 0);
INSERT INTO `shop_storage` VALUES (93, 'xy3dbuxrkumopwx7qfap.png', '办公.png', 'image/png', 3623, 'http://localhost:8080/client/storage/fetch/xy3dbuxrkumopwx7qfap.png', '2019-10-31 17:03:13', '2019-10-31 17:03:13', 0);
INSERT INTO `shop_storage` VALUES (94, 'ld0hwli611ldf5jyb05h.png', '食品_蔬菜.png', 'image/png', 12283, 'http://localhost:8080/client/storage/fetch/ld0hwli611ldf5jyb05h.png', '2019-10-31 17:04:40', '2019-10-31 17:04:40', 0);
INSERT INTO `shop_storage` VALUES (95, '8mc7vhkxs92momp8o72k.png', '电脑.png', 'image/png', 2874, 'http://localhost:8080/client/storage/fetch/8mc7vhkxs92momp8o72k.png', '2019-10-31 17:05:20', '2019-10-31 17:05:20', 0);
INSERT INTO `shop_storage` VALUES (96, 'qya3qbbj7siorkhor05h.png', '家具.png', 'image/png', 4038, 'http://localhost:8080/client/storage/fetch/qya3qbbj7siorkhor05h.png', '2019-10-31 17:05:50', '2019-10-31 17:05:50', 0);
INSERT INTO `shop_storage` VALUES (97, 'g8lxerc5ekxmje6dxihc.png', '电脑 (1).png', 'image/png', 10614, 'http://localhost:8080/client/storage/fetch/g8lxerc5ekxmje6dxihc.png', '2019-10-31 17:07:06', '2019-10-31 17:07:06', 0);
INSERT INTO `shop_storage` VALUES (98, 'yky3aox7jme0u2bjfbnz.png', '服装.png', 'image/png', 11033, 'http://localhost:8080/client/storage/fetch/yky3aox7jme0u2bjfbnz.png', '2019-10-31 17:08:38', '2019-10-31 17:08:38', 0);
INSERT INTO `shop_storage` VALUES (99, 'jxyykxq7nrbuxercssi6.png', '食物.png', 'image/png', 6012, 'http://localhost:8080/client/storage/fetch/jxyykxq7nrbuxercssi6.png', '2019-10-31 17:11:17', '2019-10-31 17:11:17', 0);
INSERT INTO `shop_storage` VALUES (100, 'g24i5xjfrzqc23nnzj11.jpg', 'cover.jpg', 'image/jpeg', 401392, 'http://localhost:8080/client/storage/fetch/g24i5xjfrzqc23nnzj11.jpg', '2019-10-31 21:33:15', '2019-10-31 21:33:15', 0);
INSERT INTO `shop_storage` VALUES (101, 'iyoji1t8zjnxbbvh4ou2.jpg', '1.jpg', 'image/jpeg', 403741, 'http://localhost:8080/client/storage/fetch/iyoji1t8zjnxbbvh4ou2.jpg', '2019-10-31 21:33:21', '2019-10-31 21:33:21', 0);
INSERT INTO `shop_storage` VALUES (102, 'za5omf5vmndm967bf584.jpg', '2.jpg', 'image/jpeg', 501153, 'http://localhost:8080/client/storage/fetch/za5omf5vmndm967bf584.jpg', '2019-10-31 21:33:24', '2019-10-31 21:33:24', 0);
INSERT INTO `shop_storage` VALUES (103, 'i3t1wspe9yv7f093apv2.jpg', '3.jpg', 'image/jpeg', 501153, 'http://localhost:8080/client/storage/fetch/i3t1wspe9yv7f093apv2.jpg', '2019-10-31 21:33:27', '2019-10-31 21:33:27', 0);
INSERT INTO `shop_storage` VALUES (104, 'fupc3stbu7km6w2izs8a.jpg', '1.jpg', 'image/jpeg', 403741, 'http://localhost:8080/client/storage/fetch/fupc3stbu7km6w2izs8a.jpg', '2019-10-31 21:33:48', '2019-10-31 21:33:48', 0);
INSERT INTO `shop_storage` VALUES (105, 'ydzuxlivp4e3iryrckx8.jpg', '2.jpg', 'image/jpeg', 501153, 'http://localhost:8080/client/storage/fetch/ydzuxlivp4e3iryrckx8.jpg', '2019-10-31 21:33:59', '2019-10-31 21:33:59', 0);
INSERT INTO `shop_storage` VALUES (106, '5fh3f4dpe3jp901p35b3.jpg', '3.jpg', 'image/jpeg', 501153, 'http://localhost:8080/client/storage/fetch/5fh3f4dpe3jp901p35b3.jpg', '2019-10-31 21:34:12', '2019-10-31 21:34:12', 0);
INSERT INTO `shop_storage` VALUES (107, 'z4v8o9zv31qpo7f7n1g1.jpg', '4.jpg', 'image/jpeg', 501153, 'http://localhost:8080/client/storage/fetch/z4v8o9zv31qpo7f7n1g1.jpg', '2019-10-31 21:34:23', '2019-10-31 21:34:23', 0);
INSERT INTO `shop_storage` VALUES (108, 'nuck8f3rctifuw7v2f5x.jpg', '5.jpg', 'image/jpeg', 418641, 'http://localhost:8080/client/storage/fetch/nuck8f3rctifuw7v2f5x.jpg', '2019-10-31 21:34:35', '2019-10-31 21:34:35', 0);
INSERT INTO `shop_storage` VALUES (109, '3bjy6ro3pupdq5ua08fx.jpg', 'cover.jpg', 'image/jpeg', 401392, 'http://localhost:8080/client/storage/fetch/3bjy6ro3pupdq5ua08fx.jpg', '2019-10-31 21:35:03', '2019-10-31 21:35:03', 0);
INSERT INTO `shop_storage` VALUES (110, '966m4tv21rxs4hku02kx.jpg', 'cover.jpg', 'image/jpeg', 401392, 'http://localhost:8080/client/storage/fetch/966m4tv21rxs4hku02kx.jpg', '2019-10-31 21:37:39', '2019-10-31 21:37:39', 0);
INSERT INTO `shop_storage` VALUES (111, 'n1jaer3571hav8s6z7b8.jpg', 'cover.jpg', 'image/jpeg', 401392, 'http://localhost:8080/client/storage/fetch/n1jaer3571hav8s6z7b8.jpg', '2019-10-31 21:37:53', '2019-10-31 21:37:53', 0);
INSERT INTO `shop_storage` VALUES (112, 'rx9rmtkwtfi4g433sr7d.jpg', 'cover.jpg', 'image/jpeg', 401392, 'http://localhost:8080/client/storage/fetch/rx9rmtkwtfi4g433sr7d.jpg', '2019-10-31 21:46:41', '2019-10-31 21:46:41', 0);
INSERT INTO `shop_storage` VALUES (113, 'ccogy465kx2qq9v5yz7r.jpg', 'cover.jpg', 'image/jpeg', 401392, 'http://localhost:8080/client/storage/fetch/ccogy465kx2qq9v5yz7r.jpg', '2019-10-31 22:04:49', '2019-10-31 22:04:49', 0);
INSERT INTO `shop_storage` VALUES (114, 'svzb9wc03m1stt0bql11.jpg', 'cover.jpg', 'image/jpeg', 401392, 'http://localhost:8080/client/storage/fetch/svzb9wc03m1stt0bql11.jpg', '2019-10-31 22:38:49', '2019-10-31 22:38:49', 0);
INSERT INTO `shop_storage` VALUES (115, 't0ux3n0llxp7nomfyjj6.jpg', 'cover.jpg', 'image/jpeg', 401392, 'http://localhost:8080/client/storage/fetch/t0ux3n0llxp7nomfyjj6.jpg', '2019-10-31 22:49:27', '2019-10-31 22:49:27', 0);
INSERT INTO `shop_storage` VALUES (116, 'ycj8de6qdkfipw5sv6ut.jpg', '5.jpg', 'image/jpeg', 418641, 'http://localhost:8080/client/storage/fetch/ycj8de6qdkfipw5sv6ut.jpg', '2019-10-31 22:53:15', '2019-10-31 22:53:15', 0);
INSERT INTO `shop_storage` VALUES (117, '3jcku0wp85g25zjll88e.jpg', 'cover.jpg', 'image/jpeg', 95996, 'http://localhost:8080/client/storage/fetch/3jcku0wp85g25zjll88e.jpg', '2019-10-31 23:16:18', '2019-10-31 23:16:18', 0);
INSERT INTO `shop_storage` VALUES (118, 'uybep55ndb794c6aiih7.jpg', '1.jpg', 'image/jpeg', 97482, 'http://localhost:8080/client/storage/fetch/uybep55ndb794c6aiih7.jpg', '2019-10-31 23:16:21', '2019-10-31 23:16:21', 0);
INSERT INTO `shop_storage` VALUES (119, 'q9pn64cjjorohljk5hsk.jpg', '2.jpg', 'image/jpeg', 171093, 'http://localhost:8080/client/storage/fetch/q9pn64cjjorohljk5hsk.jpg', '2019-10-31 23:16:24', '2019-10-31 23:16:24', 0);
INSERT INTO `shop_storage` VALUES (120, 'hq54u85xyragihgw6dj3.jpg', '1.jpg', 'image/jpeg', 97482, 'http://localhost:8080/client/storage/fetch/hq54u85xyragihgw6dj3.jpg', '2019-10-31 23:16:53', '2019-10-31 23:16:53', 0);
INSERT INTO `shop_storage` VALUES (121, 'czbiys038fs6pyxzojzw.jpg', 'cover.jpg', 'image/jpeg', 95996, 'http://localhost:8080/client/storage/fetch/czbiys038fs6pyxzojzw.jpg', '2019-10-31 23:17:23', '2019-10-31 23:17:23', 0);
INSERT INTO `shop_storage` VALUES (122, '9kxagn7rkl0iqzppwxuz.jpg', 'cover.jpg', 'image/jpeg', 95996, 'http://localhost:8080/client/storage/fetch/9kxagn7rkl0iqzppwxuz.jpg', '2019-10-31 23:19:32', '2019-10-31 23:19:32', 0);
INSERT INTO `shop_storage` VALUES (123, 'ln3n7j2ucxqn38m8elbd.jpg', 'cover.jpg', 'image/jpeg', 576883, 'http://localhost:8080/client/storage/fetch/ln3n7j2ucxqn38m8elbd.jpg', '2019-11-01 09:06:50', '2019-11-01 09:06:50', 0);
INSERT INTO `shop_storage` VALUES (124, 'hdxghza2fwbxdo7y860h.jpg', '1.jpg', 'image/jpeg', 208801, 'http://localhost:8080/client/storage/fetch/hdxghza2fwbxdo7y860h.jpg', '2019-11-01 09:06:53', '2019-11-01 09:06:53', 0);
INSERT INTO `shop_storage` VALUES (125, '0vopyzez1j3c2z4lae1c.jpg', '2.jpg', 'image/jpeg', 914687, 'http://localhost:8080/client/storage/fetch/0vopyzez1j3c2z4lae1c.jpg', '2019-11-01 09:06:56', '2019-11-01 09:06:56', 0);
INSERT INTO `shop_storage` VALUES (126, 'vdy95hscdq1mhzs8x0j7.jpg', '3.jpg', 'image/jpeg', 914687, 'http://localhost:8080/client/storage/fetch/vdy95hscdq1mhzs8x0j7.jpg', '2019-11-01 09:07:03', '2019-11-01 09:07:03', 0);
INSERT INTO `shop_storage` VALUES (127, '91kfhogobjgnf268gt57.jpg', '1.jpg', 'image/jpeg', 208801, 'http://localhost:8080/client/storage/fetch/91kfhogobjgnf268gt57.jpg', '2019-11-01 09:07:29', '2019-11-01 09:07:29', 0);
INSERT INTO `shop_storage` VALUES (128, 'xyw2y32h4gz2qwcc414b.jpg', '2.jpg', 'image/jpeg', 914687, 'http://localhost:8080/client/storage/fetch/xyw2y32h4gz2qwcc414b.jpg', '2019-11-01 09:07:39', '2019-11-01 09:07:39', 0);
INSERT INTO `shop_storage` VALUES (129, 'l62qvcjl9j2vi3ge1izg.jpg', '3.jpg', 'image/jpeg', 914687, 'http://localhost:8080/client/storage/fetch/l62qvcjl9j2vi3ge1izg.jpg', '2019-11-01 09:09:23', '2019-11-01 09:09:23', 0);
INSERT INTO `shop_storage` VALUES (130, '3k5rbqhnlvqhup7pbeji.jpg', '4.jpg', 'image/jpeg', 914687, 'http://localhost:8080/client/storage/fetch/3k5rbqhnlvqhup7pbeji.jpg', '2019-11-01 09:09:36', '2019-11-01 09:09:36', 0);
INSERT INTO `shop_storage` VALUES (131, 'x0iqc99kfhumsefzlzqp.jpg', '5.jpg', 'image/jpeg', 815610, 'http://localhost:8080/client/storage/fetch/x0iqc99kfhumsefzlzqp.jpg', '2019-11-01 09:09:45', '2019-11-01 09:09:45', 0);
INSERT INTO `shop_storage` VALUES (132, 'waln4hxl83049etijs02.jpg', 'cover.jpg', 'image/jpeg', 576883, 'http://localhost:8080/client/storage/fetch/waln4hxl83049etijs02.jpg', '2019-11-01 09:10:11', '2019-11-01 09:10:11', 0);
INSERT INTO `shop_storage` VALUES (133, 'd6c3d1zem2hf7gfnist7.jpeg', 'timg.jpeg', 'image/jpeg', 18728, 'http://localhost:8080/client/storage/fetch/d6c3d1zem2hf7gfnist7.jpeg', '2019-11-01 11:21:52', '2019-11-01 11:21:52', 0);
INSERT INTO `shop_storage` VALUES (134, 'ps08nyvet8l2f49x7kwp.jpeg', 'timg.jpeg', 'image/jpeg', 18728, 'http://localhost:8080/client/storage/fetch/ps08nyvet8l2f49x7kwp.jpeg', '2019-11-01 11:22:17', '2019-11-01 11:22:17', 0);
INSERT INTO `shop_storage` VALUES (135, 'hgko4qlwv9oz9qk1jprg.jpeg', 'timg.jpeg', 'image/jpeg', 18728, 'http://localhost:8080/client/storage/fetch/hgko4qlwv9oz9qk1jprg.jpeg', '2019-11-01 11:22:30', '2019-11-01 11:22:30', 0);
INSERT INTO `shop_storage` VALUES (136, 'u95ibty8nqc0bnagv4j9.png', '51uq8a5ib3ow36sbxuhj.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/u95ibty8nqc0bnagv4j9.png', '2019-12-13 16:51:43', '2019-12-13 16:51:43', 0);
INSERT INTO `shop_storage` VALUES (137, '1qxr9kourm9pgln0kwqt.png', '51uq8a5ib3ow36sbxuhj.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/1qxr9kourm9pgln0kwqt.png', '2019-12-13 16:51:49', '2019-12-13 16:51:49', 0);
INSERT INTO `shop_storage` VALUES (138, 'tab8f60xcabxcqobbuv8.png', '51uq8a5ib3ow36sbxuhj.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/tab8f60xcabxcqobbuv8.png', '2019-12-13 16:51:55', '2019-12-13 16:51:55', 0);
INSERT INTO `shop_storage` VALUES (139, '2fjw57cbqr6qe4dka1wy.png', '51uq8a5ib3ow36sbxuhj.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/2fjw57cbqr6qe4dka1wy.png', '2019-12-13 16:54:04', '2019-12-13 16:54:04', 0);
INSERT INTO `shop_storage` VALUES (140, '6puo4z372t4ea72afdi6.png', '1.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/6puo4z372t4ea72afdi6.png', '2019-12-13 16:55:09', '2019-12-13 16:56:16', 0);
INSERT INTO `shop_storage` VALUES (141, '04mx1q8vva88fd665pfs.png', '1.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/04mx1q8vva88fd665pfs.png', '2019-12-13 17:13:11', '2019-12-13 17:13:11', 0);
INSERT INTO `shop_storage` VALUES (142, 'l06gkmdxlxbm1rbm5frl.png', '1.png', 'image/png', 6671, 'http://localhost:8080/client/storage/fetch/l06gkmdxlxbm1rbm5frl.png', '2019-12-13 17:13:14', '2019-12-13 17:13:14', 0);
INSERT INTO `shop_storage` VALUES (143, '5v7vgeciib1pdpvmv4tw.png', '包包.png', 'image/png', 6827, 'http://localhost:8080/client/storage/fetch/5v7vgeciib1pdpvmv4tw.png', '2019-12-13 17:15:37', '2019-12-13 17:15:37', 0);
INSERT INTO `shop_storage` VALUES (144, 'fmc72lc6ek1vdynips9d.png', '包包.png', 'image/png', 6827, 'http://localhost:8080/client/storage/fetch/fmc72lc6ek1vdynips9d.png', '2019-12-13 17:15:40', '2019-12-13 17:15:40', 0);
INSERT INTO `shop_storage` VALUES (145, 'b9rbqwzc31o9tn9gwuf4.png', '包包 (1).png', 'image/png', 13594, 'http://localhost:8080/client/storage/fetch/b9rbqwzc31o9tn9gwuf4.png', '2019-12-13 17:16:39', '2019-12-13 17:16:39', 0);
INSERT INTO `shop_storage` VALUES (146, 'ff2xuzok3o1xn9y6fur6.png', '包包 (1).png', 'image/png', 13594, 'http://localhost:8080/client/storage/fetch/ff2xuzok3o1xn9y6fur6.png', '2019-12-13 17:16:42', '2019-12-13 17:16:42', 0);
INSERT INTO `shop_storage` VALUES (147, 'xs1aifds8pbjzruodhau.png', '小电器.png', 'image/png', 8595, 'http://localhost:8080/client/storage/fetch/xs1aifds8pbjzruodhau.png', '2019-12-13 17:18:41', '2019-12-13 17:18:41', 0);
INSERT INTO `shop_storage` VALUES (148, 'e8lllxku0s9q7qr0rjxe.png', '小电器.png', 'image/png', 8595, 'http://localhost:8080/client/storage/fetch/e8lllxku0s9q7qr0rjxe.png', '2019-12-13 17:18:44', '2019-12-13 17:18:44', 0);
INSERT INTO `shop_storage` VALUES (149, 'wo3mrr49kreeroa8rs2e.png', '奶粉.png', 'image/png', 9831, 'http://localhost:8080/client/storage/fetch/wo3mrr49kreeroa8rs2e.png', '2019-12-13 17:20:47', '2019-12-13 17:20:47', 0);
INSERT INTO `shop_storage` VALUES (150, '1lhc8yrn29w3sr9dzbqi.png', '奶粉.png', 'image/png', 9831, 'http://localhost:8080/client/storage/fetch/1lhc8yrn29w3sr9dzbqi.png', '2019-12-13 17:20:51', '2019-12-13 17:20:51', 0);
INSERT INTO `shop_storage` VALUES (151, 'zlyrt2au398o9oidmscy.png', '洗发水.png', 'image/png', 5991, 'http://localhost:8080/client/storage/fetch/zlyrt2au398o9oidmscy.png', '2019-12-13 17:22:10', '2019-12-13 17:22:10', 0);
INSERT INTO `shop_storage` VALUES (152, '17pz7vtsqnhwgfbh8q1v.png', '洗发水.png', 'image/png', 5991, 'http://localhost:8080/client/storage/fetch/17pz7vtsqnhwgfbh8q1v.png', '2019-12-13 17:22:14', '2019-12-13 17:22:14', 0);
INSERT INTO `shop_storage` VALUES (153, '9bev79fmucofhpo90ltc.png', '科技.png', 'image/png', 15613, 'http://localhost:8080/client/storage/fetch/9bev79fmucofhpo90ltc.png', '2019-12-13 17:22:58', '2019-12-13 17:22:58', 0);
INSERT INTO `shop_storage` VALUES (154, 'ym0d48b83e2s5g1bkrju.png', '科技.png', 'image/png', 15613, 'http://localhost:8080/client/storage/fetch/ym0d48b83e2s5g1bkrju.png', '2019-12-13 17:23:01', '2019-12-13 17:23:01', 0);
INSERT INTO `shop_storage` VALUES (155, 'sju1dwg7rk5vwqhkmuth.png', '钢笔.png', 'image/png', 6591, 'http://localhost:8080/client/storage/fetch/sju1dwg7rk5vwqhkmuth.png', '2019-12-13 17:23:40', '2019-12-13 17:23:40', 0);
INSERT INTO `shop_storage` VALUES (156, 'anprj66lqnep0d048ipo.png', '钢笔.png', 'image/png', 6591, 'http://localhost:8080/client/storage/fetch/anprj66lqnep0d048ipo.png', '2019-12-13 17:23:44', '2019-12-13 17:23:44', 0);
INSERT INTO `shop_storage` VALUES (157, 'p3b8igazzuevyc82zj0l.png', '零食.png', 'image/png', 12681, 'http://localhost:8080/client/storage/fetch/p3b8igazzuevyc82zj0l.png', '2019-12-13 17:24:21', '2019-12-13 17:24:21', 0);
INSERT INTO `shop_storage` VALUES (158, 'e6dgwfua88aa0ojunr3i.png', '零食.png', 'image/png', 12681, 'http://localhost:8080/client/storage/fetch/e6dgwfua88aa0ojunr3i.png', '2019-12-13 17:24:24', '2019-12-13 17:24:24', 0);
INSERT INTO `shop_storage` VALUES (159, '7se2l5uvwslpdm22xdsm.png', 'icon_硬盘.png', 'image/png', 7725, 'http://localhost:8080/client/storage/fetch/7se2l5uvwslpdm22xdsm.png', '2019-12-13 17:25:41', '2019-12-13 17:25:41', 0);
INSERT INTO `shop_storage` VALUES (160, 'kv5mau128ynraf4bs43r.png', 'icon_硬盘.png', 'image/png', 7725, 'http://localhost:8080/client/storage/fetch/kv5mau128ynraf4bs43r.png', '2019-12-13 17:25:45', '2019-12-13 17:25:45', 0);
INSERT INTO `shop_storage` VALUES (161, 'ogowjinejzwrau3t1rxk.png', '沙发.png', 'image/png', 2664, 'http://localhost:8080/client/storage/fetch/ogowjinejzwrau3t1rxk.png', '2019-12-13 17:26:23', '2019-12-13 17:26:23', 0);
INSERT INTO `shop_storage` VALUES (162, 'j7qb0z1pv8wr60seaa4z.png', '沙发.png', 'image/png', 2664, 'http://localhost:8080/client/storage/fetch/j7qb0z1pv8wr60seaa4z.png', '2019-12-13 17:26:26', '2019-12-13 17:26:26', 0);
INSERT INTO `shop_storage` VALUES (163, 'qgm11dq9eyyqmoiqdol9.png', '冰箱.png', 'image/png', 5111, 'http://localhost:8080/client/storage/fetch/qgm11dq9eyyqmoiqdol9.png', '2019-12-13 17:27:04', '2019-12-13 17:27:04', 0);
INSERT INTO `shop_storage` VALUES (164, '83ysjyu036ibl6bx68p9.png', '冰箱.png', 'image/png', 5111, 'http://localhost:8080/client/storage/fetch/83ysjyu036ibl6bx68p9.png', '2019-12-13 17:27:07', '2019-12-13 17:27:07', 0);
INSERT INTO `shop_storage` VALUES (165, '44ic5cji8k63x61u14e8.png', '725wcwcn4rmjs09muhne.png', 'image/png', 247165, 'http://localhost:8080/client/storage/fetch/44ic5cji8k63x61u14e8.png', '2019-12-13 17:28:49', '2019-12-13 17:28:49', 0);
INSERT INTO `shop_storage` VALUES (166, 'gw167npjcepqzz9bqli3.jpeg', 'avatar.jpeg', 'image/jpeg', 18728, 'http://localhost:8080/client/storage/fetch/gw167npjcepqzz9bqli3.jpeg', '2019-12-13 21:36:47', '2019-12-13 21:36:47', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_system
-- ----------------------------
DROP TABLE IF EXISTS `shop_system`;
CREATE TABLE `shop_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统配置名',
  `key_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统配置值',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of shop_system
-- ----------------------------
BEGIN;
INSERT INTO `shop_system` VALUES (33, 'shop_wx_index_topic', '4', '2019-10-12 21:40:57', '2019-10-12 21:42:54', 0);
INSERT INTO `shop_system` VALUES (34, 'shop_order_comment', '7', '2019-10-12 21:40:57', '2019-10-12 21:40:57', 0);
INSERT INTO `shop_system` VALUES (35, 'shop_wx_catlog_goods', '4', '2019-10-12 21:40:57', '2019-10-12 21:42:54', 0);
INSERT INTO `shop_system` VALUES (36, 'shop_wx_index_hot', '6', '2019-10-12 21:40:57', '2019-10-12 21:42:54', 0);
INSERT INTO `shop_system` VALUES (37, 'shop_mall_name', 'shop', '2019-10-12 21:40:57', '2019-10-12 21:41:29', 0);
INSERT INTO `shop_system` VALUES (38, 'shop_express_freight_value', '8', '2019-10-12 21:40:57', '2019-10-12 21:41:53', 0);
INSERT INTO `shop_system` VALUES (39, 'shop_wx_index_brand', '4', '2019-10-12 21:40:57', '2019-10-12 21:42:54', 0);
INSERT INTO `shop_system` VALUES (40, 'shop_order_unpaid', '30', '2019-10-12 21:40:57', '2019-10-12 21:40:57', 0);
INSERT INTO `shop_system` VALUES (41, 'shop_order_unconfirm', '7', '2019-10-12 21:40:57', '2019-10-12 21:40:57', 0);
INSERT INTO `shop_system` VALUES (42, 'shop_wx_catlog_list', '4', '2019-10-12 21:40:57', '2019-10-12 21:42:54', 0);
INSERT INTO `shop_system` VALUES (43, 'shop_mall_phone', '027-xxxx-xxxx', '2019-10-12 21:40:57', '2019-10-12 21:41:29', 0);
INSERT INTO `shop_system` VALUES (44, 'shop_wx_index_new', '6', '2019-10-12 21:40:57', '2019-10-12 21:42:54', 0);
INSERT INTO `shop_system` VALUES (45, 'shop_wx_share', 'false', '2019-10-12 21:40:57', '2019-10-12 21:42:54', 0);
INSERT INTO `shop_system` VALUES (46, 'shop_mall_address', '广州', '2019-10-12 21:40:57', '2019-10-12 21:41:29', 0);
INSERT INTO `shop_system` VALUES (47, 'shop_express_freight_min', '88', '2019-10-12 21:40:57', '2019-10-12 21:41:53', 0);
INSERT INTO `shop_system` VALUES (48, 'shop_mall_qq', '223333', '2019-10-12 21:40:57', '2019-10-12 21:41:29', 0);
INSERT INTO `shop_system` VALUES (49, 'shop_app_share', 'false', '2019-12-12 15:21:05', '2019-12-12 15:21:05', 0);
INSERT INTO `shop_system` VALUES (50, 'shop_app_index_new', '6', '2019-12-12 15:21:05', '2019-12-12 15:21:05', 0);
INSERT INTO `shop_system` VALUES (51, 'shop_app_index_brand', '4', '2019-12-12 15:21:05', '2019-12-12 15:21:05', 0);
INSERT INTO `shop_system` VALUES (52, 'shop_app_index_topic', '4', '2019-12-12 15:21:05', '2019-12-12 15:21:05', 0);
INSERT INTO `shop_system` VALUES (53, 'shop_app_catlog_goods', '4', '2019-12-12 15:21:05', '2019-12-12 15:21:05', 0);
INSERT INTO `shop_system` VALUES (54, 'shop_app_catlog_list', '4', '2019-12-12 15:21:06', '2019-12-12 15:21:06', 0);
INSERT INTO `shop_system` VALUES (55, 'shop_app_index_hot', '6', '2019-12-12 15:21:06', '2019-12-12 15:21:06', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_user
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `gender` tinyint(3) NOT NULL DEFAULT '0' COMMENT '性别：0 未知， 1男， 1 女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最近一次登录时间',
  `last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最近一次登录IP地址',
  `user_level` tinyint(3) DEFAULT '0' COMMENT '0 普通用户，1 VIP用户，2 高级VIP用户',
  `nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像图片',
  `weixin_openid` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信登录openid',
  `session_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信登录会话KEY',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 可用, 1 禁用, 2 注销',
  `add_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户表';

-- ----------------------------
-- Records of shop_user
-- ----------------------------
BEGIN;
INSERT INTO `shop_user` VALUES (1, 'user123', '$2a$10$lTu9qi0hr19OC800Db.eludFr0AXuJUSrMHi/iPYhKRlPFeqJxlye', 1, NULL, '2019-10-02 23:12:15', '0:0:0:0:0:0:0:1', 0, 'user123', '', 'http://localhost:8080/client/storage/fetch/gw167npjcepqzz9bqli3.jpeg', '', '', 0, '2019-04-20 22:17:43', '2019-10-02 23:12:15', 0);
INSERT INTO `shop_user` VALUES (3, '18871002288', '$2a$10$E2ANDTg.IhcE3e5iKvdABe7t7ejuS4D73uGs17tMIbl2gdkKWDfBi', 0, NULL, '2020-01-14 09:52:07', '0:0:0:0:0:0:0:1', 0, '18871002288', '18871002288', 'http://localhost:8080/client/storage/fetch/gw167npjcepqzz9bqli3.jpeg', '', '', 0, '2019-09-25 18:30:28', '2020-01-14 09:52:07', 0);
INSERT INTO `shop_user` VALUES (4, '18888888899', '$2a$10$UJk5rN1S8fPMKGuIGDOnRuUlDwQBjmfSfn6tzm2SbfWeNSZI840.K', 0, NULL, '2019-10-12 19:33:13', '0:0:0:0:0:0:0:1', 0, '18888888899', '18888888899', 'http://localhost:8080/client/storage/fetch/gw167npjcepqzz9bqli3.jpeg', '', '', 0, '2019-10-12 19:31:16', '2019-10-12 19:33:13', 0);
INSERT INTO `shop_user` VALUES (5, '16666666666', '$2a$10$rGQuXAmekd1fUqN4KgjU5.yOmJHl1GM.b/XBmgqG8uDWnV/zdcDaa', 0, NULL, '2019-12-24 09:29:35', '0:0:0:0:0:0:0:1', 0, '16666666666', '16666666666', 'http://localhost:8080/client/storage/fetch/gw167npjcepqzz9bqli3.jpeg', '', '', 0, '2019-12-13 16:38:41', '2019-12-24 09:29:35', 0);
INSERT INTO `shop_user` VALUES (6, '15555555555', '$2a$10$r5rpZ2Zh9QqulfmVYf/gw.TSN55id8vgHRbl7kriSrGD494xJJlOe', 0, NULL, '2019-12-16 16:14:25', '0:0:0:0:0:0:0:1', 0, '15555555555', '15555555555', 'http://localhost:8080/client/storage/fetch/gw167npjcepqzz9bqli3.jpeg', '', '', 0, '2019-12-13 17:56:05', '2019-12-16 16:14:25', 0);
INSERT INTO `shop_user` VALUES (7, '13333333333', '$2a$10$9SpVgy6erQzBSm0ZQECFA.COVtyonhnQ/0GnS4/32z0oZoXAK8smG', 0, NULL, '2019-12-16 10:11:52', '0:0:0:0:0:0:0:1', 0, '13333333333', '13333333333', '', '', '', 0, '2019-12-16 10:11:38', '2019-12-16 10:11:52', 0);
INSERT INTO `shop_user` VALUES (8, '19999999999', '$2a$10$MkHJUphYDnvFXLPs4cBXruV9yyfuLgfztkZfR02WvD4rGfqqD/k1q', 0, NULL, '2019-12-16 16:15:43', '0:0:0:0:0:0:0:1', 0, '19999999999', '19999999999', '', '', '', 0, '2019-12-16 16:15:33', '2019-12-16 16:15:43', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
