/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : db_wuye

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2018-08-28 20:52:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(55) DEFAULT NULL,
  `userPw` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('2', 'a', 'a');

-- ----------------------------
-- Table structure for t_baoxiu
-- ----------------------------
DROP TABLE IF EXISTS `t_baoxiu`;
CREATE TABLE `t_baoxiu` (
  `baoxiu_id` int(11) NOT NULL,
  `baoxiu_shijian` varchar(55) DEFAULT NULL,
  `baoxiu_beizhu` longtext,
  `zhuhu_id` int(11) DEFAULT NULL,
  `del` varchar(55) DEFAULT NULL,
  `baoxiu_zhuangtai` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`baoxiu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_baoxiu
-- ----------------------------
INSERT INTO `t_baoxiu` VALUES ('1', '222', '2', '1', 'yes', 'weishouli');
INSERT INTO `t_baoxiu` VALUES ('2', '2018-3-30 20:30:48', 'sdfsdfsdf', '5', 'yes', 'weishouli');
INSERT INTO `t_baoxiu` VALUES ('3', '2018-3-31 21:17:46', '23123123123', '5', 'yes', 'weishouli');
INSERT INTO `t_baoxiu` VALUES ('4', '2018-3-20 11:30:50', '请输入内容为范围', '1', 'yes', 'yishouli');
INSERT INTO `t_baoxiu` VALUES ('5', '2018-4-16 6:12:25', '厕所坏了', '8', 'no', 'yishouli');

-- ----------------------------
-- Table structure for t_fangwu
-- ----------------------------
DROP TABLE IF EXISTS `t_fangwu`;
CREATE TABLE `t_fangwu` (
  `id` int(11) NOT NULL,
  `fangwuno` varchar(11) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `mianji` varchar(50) DEFAULT NULL,
  `weizhi` varchar(255) DEFAULT NULL,
  `fangxing` varchar(255) DEFAULT NULL,
  `danjia` varchar(255) DEFAULT NULL,
  `zongjia` varchar(50) DEFAULT NULL,
  `zhuhu` varchar(50) DEFAULT NULL,
  `zhuhu_tel` varchar(50) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fangwu
-- ----------------------------
INSERT INTO `t_fangwu` VALUES ('1', '房号1', '房名1', '面1', '位1', '房型1', '单价1', '总价1', '2', '2', 'no');
INSERT INTO `t_fangwu` VALUES ('3', '房号2', '房名2', '132123', '2', '房型2', '132123', '123123132', '2', '2', 'no');
INSERT INTO `t_fangwu` VALUES ('4', '房号3', '房名3', '4234234234234', '22423424322', '房型3', '123123123234234', '13123234234', '2234234234', '2234234234', 'no');
INSERT INTO `t_fangwu` VALUES ('5', '房号4', '房名4', '2', '2', '房型4', '2', '2', '2', '2', 'no');
INSERT INTO `t_fangwu` VALUES ('6', '房号5', '房名5', '66', '6', '房型5', '6', '6', '6', '6', 'no');
INSERT INTO `t_fangwu` VALUES ('7', '房号6', '房名6', '2', '2', '房型6', '22222', '2', '2', '21313', 'no');
INSERT INTO `t_fangwu` VALUES ('8', '房号7', '房名7', '123132', '123123', '房型7', '123', '123', '132', '123', 'no');
INSERT INTO `t_fangwu` VALUES ('9', '房号8', '房名8', '2', '13132', '房型8', '22222', '2222', '2', '231312312', 'no');
INSERT INTO `t_fangwu` VALUES ('10', '房号9', '房名9', '123123132', '1', '房型9', '1', '1', '1', '1', 'no');
INSERT INTO `t_fangwu` VALUES ('11', '房号10', '房名10', '1', '1', '房型10', '1', '1', '1', '1', 'no');
INSERT INTO `t_fangwu` VALUES ('12', '房号11', '房名11', '2', '2', '房型11', '2', '2', '2', '2', 'no');
INSERT INTO `t_fangwu` VALUES ('13', '房号12', '房名12', '2', '2', '房型12', '2', '2', '2', '222', 'no');
INSERT INTO `t_fangwu` VALUES ('14', '6666666666', '222222', '2', '2', '2', '2', '2', '2', '2', 'yes');

-- ----------------------------
-- Table structure for t_shoufei
-- ----------------------------
DROP TABLE IF EXISTS `t_shoufei`;
CREATE TABLE `t_shoufei` (
  `shoufei_id` int(11) NOT NULL,
  `shoufei_shijian` varchar(55) DEFAULT NULL,
  `shoufei_xiangmu` varchar(50) DEFAULT NULL,
  `shoufei_jine` varchar(55) DEFAULT NULL,
  `yijiaojine` varchar(55) DEFAULT NULL,
  `zhuhu_id` int(11) DEFAULT NULL,
  `del` longtext,
  `isnotice` int(1) DEFAULT NULL,
  PRIMARY KEY (`shoufei_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shoufei
-- ----------------------------
INSERT INTO `t_shoufei` VALUES ('1', '2017-03-08', '水费', '100', '0', '5', 'yes', '1');
INSERT INTO `t_shoufei` VALUES ('2', '2017-03-08', '水费', '100', '0', '1', 'yes', '1');
INSERT INTO `t_shoufei` VALUES ('3', '2017-03-08', '水费', '100', '0', '6', 'yes', null);
INSERT INTO `t_shoufei` VALUES ('4', '2017-04-10', '水费', '100', null, '1', 'yes', null);
INSERT INTO `t_shoufei` VALUES ('5', '2017-04-19', '水费', '100', null, '5', 'yes', null);
INSERT INTO `t_shoufei` VALUES ('6', '2017-04-27', '水费', '100', null, '5', 'yes', null);
INSERT INTO `t_shoufei` VALUES ('7', '2017-04-12', '水费', '100', '0', '3', 'yes', null);
INSERT INTO `t_shoufei` VALUES ('8', '2017-04-25', '水费', '100', '0', '6', 'yes', null);
INSERT INTO `t_shoufei` VALUES ('9', '2017-04-26', '水费', '1000', '0', '5', 'yes', null);
INSERT INTO `t_shoufei` VALUES ('10', '2017-04-10', '水费', '10000', '0', '6', 'yes', '1');
INSERT INTO `t_shoufei` VALUES ('11', '2018-04-11', '水费', '100', '0', '10', 'no', '1');
INSERT INTO `t_shoufei` VALUES ('12', '2018-03-30', '水费', '200', '0', '8', 'no', '1');
INSERT INTO `t_shoufei` VALUES ('13', '2018-05-14', '电费', '100', '0', '9', 'no', null);

-- ----------------------------
-- Table structure for t_tingchechang
-- ----------------------------
DROP TABLE IF EXISTS `t_tingchechang`;
CREATE TABLE `t_tingchechang` (
  `id` int(11) NOT NULL,
  `tingchechangname` varchar(55) DEFAULT NULL,
  `cheweizhuangtai` varchar(55) DEFAULT NULL,
  `danjia` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tingchechang
-- ----------------------------
INSERT INTO `t_tingchechang` VALUES ('1', 'wfsdf', '123123123', '2', 'yes');
INSERT INTO `t_tingchechang` VALUES ('2', '西门停车场', '闲置中', '22', 'no');
INSERT INTO `t_tingchechang` VALUES ('3', '南门停车场', '闲置中', '22222', 'no');
INSERT INTO `t_tingchechang` VALUES ('4', '北门停车场', '使用中', '20', 'no');
INSERT INTO `t_tingchechang` VALUES ('5', '地下停车场一层', '使用中', '20', 'no');
INSERT INTO `t_tingchechang` VALUES ('6', '南门停车场', '使用中', '', 'no');

-- ----------------------------
-- Table structure for t_tousu
-- ----------------------------
DROP TABLE IF EXISTS `t_tousu`;
CREATE TABLE `t_tousu` (
  `tousu_id` int(11) NOT NULL,
  `tousu_shijian` varchar(55) DEFAULT NULL,
  `tousu_yuanyin` longtext,
  `zhuhu_id` int(11) DEFAULT NULL,
  `del` varchar(55) DEFAULT NULL,
  `tousu_zhuangtai` longtext,
  PRIMARY KEY (`tousu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tousu
-- ----------------------------
INSERT INTO `t_tousu` VALUES ('1', '222', '22', '1', 'yes', '1');
INSERT INTO `t_tousu` VALUES ('2', '2018-3-30 16:48:20', 'sfdasdfsadf', '5', 'yes', 'yishouli');
INSERT INTO `t_tousu` VALUES ('3', '2018-3-31 21:17:37', '请输入内容斯蒂芬斯啊司法所地方蒂芬撒发送', '5', 'yes', 'yishouli');
INSERT INTO `t_tousu` VALUES ('4', '2018-4-13 22:16:32', 'asfdsadfsadf', '1', 'yes', 'weishouli');
INSERT INTO `t_tousu` VALUES ('5', '2018-4-13 22:16:32', 'asfdsadfsadf', '1', 'yes', 'weishouli');
INSERT INTO `t_tousu` VALUES ('6', '2018-4-14 9:49:51', '住的太舒服了', '9', 'no', 'yishouli');
INSERT INTO `t_tousu` VALUES ('7', '2018-4-16 6:12:04', '老是收费', '8', 'no', 'yishouli');

-- ----------------------------
-- Table structure for t_zhuhu
-- ----------------------------
DROP TABLE IF EXISTS `t_zhuhu`;
CREATE TABLE `t_zhuhu` (
  `zhuhu_id` int(11) NOT NULL,
  `zhuhu_name` varchar(55) DEFAULT NULL,
  `zhuhu_idcard` varchar(55) DEFAULT NULL,
  `zhuhu_tel` varchar(55) DEFAULT NULL,
  `zhuhu_fangxing` varchar(55) DEFAULT NULL,
  `zhuhu_mianji` varchar(50) DEFAULT NULL,
  `zhuhu_shiyongmianj` varchar(255) DEFAULT NULL,
  `zhuhu_ruzhushijian` varchar(255) DEFAULT NULL,
  `zhuhu_cheliangxinxi` varchar(255) DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` longtext,
  `del` varchar(255) DEFAULT NULL,
  `fangwuno` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`zhuhu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_zhuhu
-- ----------------------------
INSERT INTO `t_zhuhu` VALUES ('1', '222222', '132123132123', '135555555552', '2', '22', null, '2', '2', '21', '1', 'yes', '132132');
INSERT INTO `t_zhuhu` VALUES ('3', '1231232234', '132123132123', '123123', '2', '2', null, '132123', '132123', '22', '1', 'yes', '123123');
INSERT INTO `t_zhuhu` VALUES ('4', '123123123123', '132123132123', '123123123', '2', '2', null, '1231231321', '123123123', '23', '1', 'yes', '2222');
INSERT INTO `t_zhuhu` VALUES ('5', '123', '3223234', '2', '1231231321', '4234234234234', null, '2', '2', '24', '1', 'yes', '1313222');
INSERT INTO `t_zhuhu` VALUES ('6', '测试', '123132', '132132132', '2', '2', null, '2222', '12313132', 'test', '1', 'yes', '123123');
INSERT INTO `t_zhuhu` VALUES ('7', '刘琦', '140602199404285574', '18434260791', '房型1', '面1', null, '2018-3-26', '243', 'dlzh2', '1', 'no', '房号1');
INSERT INTO `t_zhuhu` VALUES ('8', '田亚敏', '140601199304285575', '18434260792', '房型4', '2', null, '2018-03-28', '2', 'dlzh3', '1', 'no', '房号4');
INSERT INTO `t_zhuhu` VALUES ('9', '苗文平', '140602199404285573', '18434260790', '房型9', '123123132', null, '2018-03-26', '123456', 'dlzh1', '1', 'no', '房号9');
INSERT INTO `t_zhuhu` VALUES ('10', '刘建民', '140601199304285576', '18434260793', '房型5', '66', null, '2018-04-08', '1', 'dlzh4', '1', 'no', '房号5');
INSERT INTO `t_zhuhu` VALUES ('11', '张三1', '140602199404285511', '18434260799', '房型1', '面1', null, '2018-05-25', '12', '1', '1', 'no', '房号1');
INSERT INTO `t_zhuhu` VALUES ('12', '杨振华', '140602199404144444', '15234966666', '房型8', '2', null, '2018-06-18', '1', 'dlzh5', '1', 'no', '房号8');
