/*
Navicat MySQL Data Transfer

Source Server         : monitor
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-11-09 16:36:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_album`
-- ----------------------------
DROP TABLE IF EXISTS `t_album`;
CREATE TABLE `t_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photoNumber` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK9FF8BAE45A2B3E81` (`user_id`),
  KEY `FK9FF8BAE4AEDA9CB3` (`photo_id`),
  CONSTRAINT `FK9FF8BAE45A2B3E81` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK9FF8BAE4AEDA9CB3` FOREIGN KEY (`photo_id`) REFERENCES `t_photo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_album
-- ----------------------------
INSERT INTO `t_album` VALUES ('1', '2015-11-03 14:05:42', '旅游', '0', '1', '1', '1', '旅游旅游旅游旅游旅游旅游旅游旅游旅游', null);
INSERT INTO `t_album` VALUES ('2', '2015-11-03 14:09:51', '日常', '0', '1', '1', '1', '日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常日常', null);
INSERT INTO `t_album` VALUES ('3', '2015-11-03 14:10:55', '大学', '0', '1', '1', '1', '大学大学大学大学大学大学', null);
