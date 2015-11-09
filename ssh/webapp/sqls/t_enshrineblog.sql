/*
Navicat MySQL Data Transfer

Source Server         : monitor
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-11-09 16:37:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_enshrineblog`
-- ----------------------------
DROP TABLE IF EXISTS `t_enshrineblog`;
CREATE TABLE `t_enshrineblog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enshrineDate` datetime DEFAULT NULL,
  `blog_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8D6B8F7961A21B21` (`blog_id`),
  KEY `FK8D6B8F795A2B3E81` (`user_id`),
  CONSTRAINT `FK8D6B8F795A2B3E81` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK8D6B8F7961A21B21` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_enshrineblog
-- ----------------------------
