/*
Navicat MySQL Data Transfer

Source Server         : monitor
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-11-09 16:37:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_costrecord`
-- ----------------------------
DROP TABLE IF EXISTS `t_costrecord`;
CREATE TABLE `t_costrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float NOT NULL,
  `costFor` varchar(255) DEFAULT NULL,
  `costdate` datetime DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_costrecord
-- ----------------------------
INSERT INTO `t_costrecord` VALUES ('5', '10', '买菜', '2015-11-04 00:00:00', '买菜', '0', '2', null, '0');
INSERT INTO `t_costrecord` VALUES ('6', '40', '买菜', '2015-11-05 00:00:00', '买菜', '0', '2', null, '0');
INSERT INTO `t_costrecord` VALUES ('7', '32', '买菜', '2015-11-04 00:00:00', '买菜', '0', '1', null, '0');
INSERT INTO `t_costrecord` VALUES ('8', '250', '饮水机', '2015-11-07 00:00:00', '饮水机饮水机饮水机', '0', '2', null, '0');
INSERT INTO `t_costrecord` VALUES ('9', '100', '买菜+买米', '2015-11-07 00:00:00', '菜+20斤米', '0', '1', null, '0');
INSERT INTO `t_costrecord` VALUES ('10', '37', '买菜', '2015-11-08 00:00:00', '买菜', '0', '2', null, '0');
