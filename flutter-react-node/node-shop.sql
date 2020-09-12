/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : node-shop

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 12/09/2020 11:40:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for shop_cart
-- ----------------------------
DROP TABLE IF EXISTS `shop_cart`;
CREATE TABLE `shop_cart` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `user_id` int(32) NOT NULL COMMENT '用户id',
  `good_id` int(32) NOT NULL COMMENT '商品id',
  `good_count` int(10) NOT NULL COMMENT '商品数量',
  `good_name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `good_price` int(10) DEFAULT NULL COMMENT '商品价格',
  `good_image` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `is_checked` tinyint(8) DEFAULT '0' COMMENT '是否选中 1为tur 0为false',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='购物车';

-- ----------------------------
-- Records of shop_cart
-- ----------------------------
BEGIN;
INSERT INTO `shop_cart` VALUES (25, 1, 71, 1, 'Apple/苹果 iPhone 11 Pro 苹果11 iPhone11 pro max 苹果11pro', 6666, 'http://localhost:8000/images/good/589e69c0-caf0-11ea-99a9-17060a9cb1ff.jpg', 0);
INSERT INTO `shop_cart` VALUES (17, 1, 67, 2, 'Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑', 12888, 'http://localhost:8000/images/good/6f2026d0-c513-11ea-85f3-018204f08dbf.jpg', 1);
INSERT INTO `shop_cart` VALUES (24, 1, 68, 1, '联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品', 8888, 'http://localhost:8000/images/good/8bc95720-c513-11ea-85f3-018204f08dbf.jpg', 1);
COMMIT;

-- ----------------------------
-- Table structure for shop_category
-- ----------------------------
DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE `shop_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pid` int(11) NOT NULL COMMENT '父级id',
  `level` varchar(32) DEFAULT NULL COMMENT '层级',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分类图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类';

-- ----------------------------
-- Records of shop_category
-- ----------------------------
BEGIN;
INSERT INTO `shop_category` VALUES (1, '全部分类', 0, 'V0', 'http://localhost:8000/images/head/head.jpeg');
INSERT INTO `shop_category` VALUES (176, '计算型服务器', 11, 'V2', 'http://localhost:8000/images/category/78d82d90-c58f-11ea-8f56-43be2434799b.png');
INSERT INTO `shop_category` VALUES (175, '低配服务器', 11, 'V2', 'http://localhost:8000/images/category/6ef16350-c58f-11ea-8f56-43be2434799b.png');
INSERT INTO `shop_category` VALUES (174, '高配服务器', 11, 'V2', 'http://localhost:8000/images/category/64987650-c58f-11ea-8f56-43be2434799b.png');
INSERT INTO `shop_category` VALUES (173, '步步高', 2, 'V2', 'http://localhost:8000/images/category/d9a8c450-c516-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (172, '三星手机', 2, 'V2', 'http://localhost:8000/images/category/c1e42c10-c516-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (171, '华为手机', 2, 'V2', 'http://localhost:8000/images/category/b75f2600-c516-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (170, '联想笔记本', 4, 'V2', 'http://localhost:8000/images/category/50548450-c516-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (168, '苹果笔记本', 4, 'V2', 'http://localhost:8000/images/category/0dc3ce70-c516-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (169, '戴尔笔记本', 4, 'V2', 'http://localhost:8000/images/category/63d5cd90-c516-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (166, '华为平板', 5, 'V2', 'http://localhost:8000/images/category/22df7150-c517-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (11, '服务器', 1, 'V1', 'http://localhost:8000/images/category/3b874830-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (164, 'IPad', 5, 'V2', 'http://localhost:8000/images/category/2b2a65e0-c517-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (165, '苹果手机', 2, 'V2', 'http://localhost:8000/images/category/a95d5540-c516-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (10, '硬盘', 1, 'V1', 'http://localhost:8000/images/category/59347b00-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (9, '耳机', 1, 'V1', 'http://localhost:8000/images/category/48bb1a90-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (8, '鼠标', 1, 'V1', 'http://localhost:8000/images/category/52668980-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (7, '键盘', 1, 'V1', 'http://localhost:8000/images/category/5ece5950-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (5, '平板电脑', 1, 'V1', 'http://localhost:8000/images/category/71c05ae0-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (6, '显示器', 1, 'V1', 'http://localhost:8000/images/category/62b111c0-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (2, '手机', 1, 'V1', 'http://localhost:8000/images/category/801cf5d0-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (3, '台式机', 1, 'V1', 'http://localhost:8000/images/category/676264d0-c518-11ea-85f3-018204f08dbf.png');
INSERT INTO `shop_category` VALUES (4, '笔记本', 1, 'V1', 'http://localhost:8000/images/category/7aa82bb0-c518-11ea-85f3-018204f08dbf.png');
COMMIT;

-- ----------------------------
-- Table structure for shop_good
-- ----------------------------
DROP TABLE IF EXISTS `shop_good`;
CREATE TABLE `shop_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_first` int(11) NOT NULL COMMENT '一级分类Id',
  `category_second` int(11) NOT NULL COMMENT '二级分类Id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` int(10) NOT NULL COMMENT '商品价格',
  `discount_price` int(10) NOT NULL COMMENT '折扣价',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `good_sn` int(20) NOT NULL COMMENT '商品编号',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品轮播图片',
  `detail` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `freight` int(10) DEFAULT '0' COMMENT '商品运费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of shop_good
-- ----------------------------
BEGIN;
INSERT INTO `shop_good` VALUES (74, 103, 165, 'Apple/苹果10.5英寸iPad Air 3平板电脑Pro10.5替代款64G256Gwifi版全新国行正品全国联保', 9888, 6980, 100, 1122, 'http://localhost:8000/images/good/b6ae27d0-caf0-11ea-99a9-17060a9cb1ff.jpg', '<p><img src=\"http://localhost:8000/images/detail/ba906b10-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/bfb91100-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (75, 2, 165, 'Apple/苹果 iPhone 11 Pro 苹果11 iPhone11 pro max 苹果11pro', 3888, 2680, 100, 1122, 'http://localhost:8000/images/good/01fb4dd0-d46a-11ea-b22e-89009b6b652d.jpg,http://localhost:8000/images/good/06acef00-d46a-11ea-b22e-89009b6b652d.jpg', '<p><img src=\"http://localhost:8000/images/detail/dec78180-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/e3ed4140-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (73, 2, 165, 'Apple/苹果 iPhone XS Max苹果XR正品iPhoneXS国行8x手机', 6326, 5888, 100, 1122, 'http://localhost:8000/images/good/93e32480-caf0-11ea-99a9-17060a9cb1ff.jpg', '<p><img src=\"http://localhost:8000/images/detail/98563610-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/9c6bbe50-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/a1a09940-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (72, 2, 165, '新款苹果/Apple Watch Series5苹果手表5代iWatch5智能手环S5', 5980, 4888, 100, 1122, 'http://localhost:8000/images/good/7695c4f0-caf0-11ea-99a9-17060a9cb1ff.jpg', '<p><img src=\"http://localhost:8000/images/detail/7a877180-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/7f51a3c0-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (71, 103, 165, 'Apple/苹果 iPhone 11 Pro 苹果11 iPhone11 pro max 苹果11pro', 6666, 5780, 100, 1122, 'http://localhost:8000/images/good/589e69c0-caf0-11ea-99a9-17060a9cb1ff.jpg', '<p><img src=\"http://localhost:8000/images/detail/5c88ea60-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/61065c30-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (68, 103, 107, '联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品', 8888, 6980, 100, 1122, 'http://localhost:8000/images/good/8bc95720-c513-11ea-85f3-018204f08dbf.jpg', '<p><img src=\"http://localhost:8000/images/detail/8f51e1a0-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/944ebca0-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (69, 2, 165, '新款苹果/Apple Watch Series5苹果手表5代iWatch5智能手环S5', 16889, 12666, 100, 1122, 'http://localhost:8000/images/good/70e08cc0-c519-11ea-85f3-018204f08dbf.jpg', '<p><img src=\"http://localhost:8000/images/detail/73c18ca0-c519-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/78a27b30-c519-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (67, 4, 169, 'Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑', 12888, 9999, 100, 1122, 'http://localhost:8000/images/good/6f2026d0-c513-11ea-85f3-018204f08dbf.jpg', '<p><img src=\"http://localhost:8000/images/detail/73676d70-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/7758a4d0-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (65, 4, 168, '苹果笔记本屏幕尺寸： 13.3英寸 处理器： Intel Core i5-8259', 13999, 11999, 100, 1122, 'http://localhost:8000/images/good/22069a50-c513-11ea-85f3-018204f08dbf.jpg', '<p><img src=\"http://localhost:8000/images/detail/254b3e00-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/29a9b620-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/2db4b710-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><br></p>', 0);
INSERT INTO `shop_good` VALUES (66, 4, 169, '外星人alienware全新m15 R2九代酷睿i7六核', 3999, 36666, 100, 1122, 'http://localhost:8000/images/good/4dca5e60-c513-11ea-85f3-018204f08dbf.jpg', '<p><img src=\"http://localhost:8000/images/detail/51343d50-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/563cff30-c513-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (63, 2, 165, 'Apple/苹果 iPhone 11 Pro 苹果11 iPhone11 pro max 苹果11pro', 8999, 6889, 100, 1122, 'http://localhost:8000/images/good/c5ab9880-c50f-11ea-85f3-018204f08dbf.jpg', '<p><img src=\"http://localhost:8000/images/detail/c9281510-c50f-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/cd6aeee0-c50f-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/d24bdd70-c50f-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (64, 2, 165, 'Apple/苹果 iPhone XS Max苹果XR正品iPhoneXS国行8x手机', 3888, 3600, 100, 1122, 'http://localhost:8000/images/good/e1f3fe60-d469-11ea-b22e-89009b6b652d.jpg,http://localhost:8000/images/good/e61ee360-d469-11ea-b22e-89009b6b652d.jpg', '<p><img src=\"http://localhost:8000/images/detail/1b7718c0-c510-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/1fd60610-c510-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/257080a0-c510-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (62, 5, 164, 'Apple/苹果10.5英寸iPad Air 3平板电脑', 6999, 5880, 999, 1122, 'http://localhost:8000/images/good/599c2c90-c50f-11ea-85f3-018204f08dbf.jpg', '<p><img src=\"http://localhost:8000/images/detail/5d6b8410-c50f-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/62491740-c50f-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/690814a0-c50f-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/704da720-c50f-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p><p><br></p><p><img src=\"http://localhost:8000/images/detail/768fd360-c50f-11ea-85f3-018204f08dbf.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (70, 2, 165, 'Apple/苹果10.5英寸iPad Air 3平板电脑Pro10.5替代款64G256Gwifi版全新国行正品全国联保', 5888, 48888, 100, 1122, 'http://localhost:8000/images/good/323de3a0-caf0-11ea-99a9-17060a9cb1ff.jpg', '<p><img src=\"http://localhost:8000/images/detail/3720ce00-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/3c9f0e00-caf0-11ea-99a9-17060a9cb1ff.jpg\" style=\"max-width:100%;\"><br></p>', 0);
INSERT INTO `shop_good` VALUES (76, 2, 165, 'Apple/苹果10.5英寸iPad Air 3平板电脑Pro10.5替代款64G256Gwifi版全新国行正品全国联保', 3680, 2888, 100, 1122, 'http://localhost:8000/images/good/754e05e0-caf4-11ea-84be-b511690b0bc2.jpg', '<p><img src=\"http://localhost:8000/images/detail/790827b0-caf4-11ea-84be-b511690b0bc2.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"http://localhost:8000/images/detail/7e1619b0-caf4-11ea-84be-b511690b0bc2.jpg\" style=\"max-width:100%;\"><br></p>', 0);
COMMIT;

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `user_id` int(32) NOT NULL COMMENT '用户id',
  `pay` int(20) DEFAULT NULL COMMENT '支付金额',
  `express` int(20) DEFAULT NULL COMMENT '快递费用',
  `status` int(10) DEFAULT '0' COMMENT '订单状态',
  `mobile` varchar(32) DEFAULT NULL COMMENT '收货人电话',
  `username` varchar(32) DEFAULT NULL COMMENT '收货人姓名',
  `goods` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '订单商品',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

-- ----------------------------
-- Records of shop_order
-- ----------------------------
BEGIN;
INSERT INTO `shop_order` VALUES (49, 4, 25776, 0, 0, '18872998834', 'test1', '[{\"id\":17,\"user_id\":1,\"good_id\":67,\"good_count\":2,\"good_name\":\"Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑\",\"good_price\":12888,\"good_image\":\"http://localhost:8000/images/good/6f2026d0-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '深圳市深南大道');
INSERT INTO `shop_order` VALUES (50, 24, 3999, 0, 0, '14455443344', 'test3', '[{\"id\":18,\"user_id\":1,\"good_id\":66,\"good_count\":1,\"good_name\":\"外星人alienware全新m15 R2九代酷睿i7六核\",\"good_price\":3999,\"good_image\":\"http://localhost:8000/images/good/4dca5e60-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', 'shanghai');
INSERT INTO `shop_order` VALUES (51, 1, 9888, 0, 0, '18872998833', 'admin', '[{\"id\":21,\"user_id\":1,\"good_id\":74,\"good_count\":1,\"good_name\":\"Apple/苹果10.5英寸iPad Air 3平板电脑Pro10.5替代款64G256Gwifi版全新国行正品全国联保\",\"good_price\":9888,\"good_image\":\"http://localhost:8000/images/good/b6ae27d0-caf0-11ea-99a9-17060a9cb1ff.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (52, 24, 3888, 0, 0, '14455443344', 'test3', '[{\"id\":22,\"user_id\":24,\"good_id\":75,\"good_count\":1,\"good_name\":\"Apple/苹果 iPhone 11 Pro 苹果11 iPhone11 pro max 苹果11pro\",\"good_price\":3888,\"good_image\":\"http://localhost:8000/images/good/db0aa090-caf0-11ea-99a9-17060a9cb1ff.jpg\",\"is_checked\":1}]', 'shanghai');
INSERT INTO `shop_order` VALUES (47, 1, 33778, 0, 0, '18872998833', 'admin', '[{\"id\":20,\"user_id\":1,\"good_id\":69,\"good_count\":2,\"good_name\":\"新款苹果/Apple Watch Series5苹果手表5代iWatch5智能手环S5\",\"good_price\":16889,\"good_image\":\"http://localhost:8000/images/good/70e08cc0-c519-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (48, 4, 8888, 0, 0, '18872998834', 'test1', '[{\"id\":19,\"user_id\":1,\"good_id\":68,\"good_count\":1,\"good_name\":\"联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品\",\"good_price\":8888,\"good_image\":\"http://localhost:8000/images/good/8bc95720-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '深圳市深南大道');
INSERT INTO `shop_order` VALUES (45, 1, 8888, 0, 0, '18829008899', 'admin', '[{\"id\":19,\"user_id\":1,\"good_id\":68,\"good_count\":1,\"good_name\":\"联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品\",\"good_price\":8888,\"good_image\":\"http://localhost:8000/images/good/8bc95720-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (44, 1, 25776, 0, 0, '18829008899', 'admin', '[{\"id\":17,\"user_id\":1,\"good_id\":67,\"good_count\":2,\"good_name\":\"Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑\",\"good_price\":12888,\"good_image\":\"http://localhost:8000/images/good/6f2026d0-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (43, 1, 12888, 0, 0, '18829008899', 'admin', '[{\"id\":17,\"user_id\":1,\"good_id\":67,\"good_count\":1,\"good_name\":\"Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑\",\"good_price\":12888,\"good_image\":\"http://localhost:8000/images/good/6f2026d0-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (53, 1, 69442, 0, 0, '18872998833', 'admin', '[{\"id\":21,\"user_id\":1,\"good_id\":74,\"good_count\":1,\"good_name\":\"Apple/苹果10.5英寸iPad Air 3平板电脑Pro10.5替代款64G256Gwifi版全新国行正品全国联保\",\"good_price\":9888,\"good_image\":\"http://localhost:8000/images/good/b6ae27d0-caf0-11ea-99a9-17060a9cb1ff.jpg\",\"is_checked\":1},{\"id\":20,\"user_id\":1,\"good_id\":69,\"good_count\":2,\"good_name\":\"新款苹果/Apple Watch Series5苹果手表5代iWatch5智能手环S5\",\"good_price\":16889,\"good_image\":\"http://localhost:8000/images/good/70e08cc0-c519-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1},{\"id\":17,\"user_id\":1,\"good_id\":67,\"good_count\":2,\"good_name\":\"Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑\",\"good_price\":12888,\"good_image\":\"http://localhost:8000/images/good/6f2026d0-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (54, 1, 33778, 0, 0, '18872998833', 'admin', '[{\"id\":20,\"user_id\":1,\"good_id\":69,\"good_count\":2,\"good_name\":\"新款苹果/Apple Watch Series5苹果手表5代iWatch5智能手环S5\",\"good_price\":16889,\"good_image\":\"http://localhost:8000/images/good/70e08cc0-c519-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (55, 1, 34664, 0, 0, '18872998833', 'admin', '[{\"id\":17,\"user_id\":1,\"good_id\":67,\"good_count\":2,\"good_name\":\"Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑\",\"good_price\":12888,\"good_image\":\"http://localhost:8000/images/good/6f2026d0-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1},{\"id\":24,\"user_id\":1,\"good_id\":68,\"good_count\":1,\"good_name\":\"联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品\",\"good_price\":8888,\"good_image\":\"http://localhost:8000/images/good/8bc95720-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (56, 1, 6666, 0, 0, '18872998833', 'admin', '[{\"id\":25,\"user_id\":1,\"good_id\":71,\"good_count\":1,\"good_name\":\"Apple/苹果 iPhone 11 Pro 苹果11 iPhone11 pro max 苹果11pro\",\"good_price\":6666,\"good_image\":\"http://localhost:8000/images/good/589e69c0-caf0-11ea-99a9-17060a9cb1ff.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (57, 1, 6666, 0, 0, '18872998833', 'admin', '[{\"id\":25,\"user_id\":1,\"good_id\":71,\"good_count\":1,\"good_name\":\"Apple/苹果 iPhone 11 Pro 苹果11 iPhone11 pro max 苹果11pro\",\"good_price\":6666,\"good_image\":\"http://localhost:8000/images/good/589e69c0-caf0-11ea-99a9-17060a9cb1ff.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (58, 1, 8888, 0, 0, '18872998833', 'admin', '[{\"id\":24,\"user_id\":1,\"good_id\":68,\"good_count\":1,\"good_name\":\"联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品\",\"good_price\":8888,\"good_image\":\"http://localhost:8000/images/good/8bc95720-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
INSERT INTO `shop_order` VALUES (59, 1, 34664, 0, 0, '18872998833', 'admin', '[{\"id\":17,\"user_id\":1,\"good_id\":67,\"good_count\":2,\"good_name\":\"Dell/戴尔 灵越15(3568) Ins15E-3525独显i5游戏本超薄笔记本电脑\",\"good_price\":12888,\"good_image\":\"http://localhost:8000/images/good/6f2026d0-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1},{\"id\":24,\"user_id\":1,\"good_id\":68,\"good_count\":1,\"good_name\":\"联想ThinkPad E480 14英寸超薄轻薄便携官方旗舰店官网正品\",\"good_price\":8888,\"good_image\":\"http://localhost:8000/images/good/8bc95720-c513-11ea-85f3-018204f08dbf.jpg\",\"is_checked\":1}]', '北京市海淀区');
COMMIT;

-- ----------------------------
-- Table structure for shop_user
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `head_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '/images/head/head.jpeg' COMMENT '头像',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of shop_user
-- ----------------------------
BEGIN;
INSERT INTO `shop_user` VALUES (1, 'admin', '123456', '/images/head/head.jpeg', '18872998833', '北京市海淀区');
INSERT INTO `shop_user` VALUES (4, 'test1', '123456', '/images/head/head.jpeg', '18872998834', '深圳市深南大道');
INSERT INTO `shop_user` VALUES (10, 'test2', '123456', '/images/head/head.jpeg', '15566555555', '湖北省武汉市关山大道');
INSERT INTO `shop_user` VALUES (24, 'test3', '123456', '/images/head/head.jpeg', '14455443344', 'shanghai');
INSERT INTO `shop_user` VALUES (25, 'test4', '123456', '/images/head/head.jpeg', '12233445533', 'hubeiwuhan');
INSERT INTO `shop_user` VALUES (26, 'test6', '123456', '/images/head/head.jpeg', '13322334423', 'hubeiwuhan');
INSERT INTO `shop_user` VALUES (27, 'test8', '123456', '/images/head/head.jpeg', '13344556622', 'beijing');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
