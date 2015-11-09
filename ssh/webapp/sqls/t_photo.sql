/*
Navicat MySQL Data Transfer

Source Server         : monitor
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-11-09 16:37:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_photo`
-- ----------------------------
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `album_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA0CA7AA75A2B3E81` (`user_id`),
  KEY `FKA0CA7AA7554E5793` (`album_id`),
  CONSTRAINT `FKA0CA7AA7554E5793` FOREIGN KEY (`album_id`) REFERENCES `t_album` (`id`),
  CONSTRAINT `FKA0CA7AA75A2B3E81` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_photo
-- ----------------------------
