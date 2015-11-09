/*
Navicat MySQL Data Transfer

Source Server         : monitor
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-11-09 16:37:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `curLoginDate` datetime DEFAULT NULL,
  `curLoginIp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginIp` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `registerDate` datetime DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `friends` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '2015-11-09 14:09:45', '0:0:0:0:0:0:0:1', 'admin@qq.com', '2015-11-06 16:17:00', '0:0:0:0:0:0:0:1', '21232f297a57a5a743894a0e4a801fc3', '15947513264', '2015-11-03 11:23:46', '1', '1', '1', '流水无痕', null);
INSERT INTO `t_user` VALUES ('2', '2015-11-09 14:47:49', '127.0.0.1', 'super@qq.com', '2015-11-09 14:13:28', '0:0:0:0:0:0:0:1', '21232f297a57a5a743894a0e4a801fc3', '14725836944', '2015-11-09 14:10:21', '1', '1', '1', 'admin', null);
