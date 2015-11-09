/*
Navicat MySQL Data Transfer

Source Server         : monitor
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-11-09 16:37:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_blogpraise`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogpraise`;
CREATE TABLE `t_blogpraise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `anonymousIp` varchar(255) DEFAULT NULL,
  `praisedDate` datetime DEFAULT NULL,
  `type` int(11) NOT NULL,
  `blog_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE730A04961A21B21` (`blog_id`),
  KEY `FKE730A0495A2B3E81` (`user_id`),
  CONSTRAINT `FKE730A0495A2B3E81` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FKE730A04961A21B21` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogpraise
-- ----------------------------
INSERT INTO `t_blogpraise` VALUES ('1', '0:0:0:0:0:0:0:1', '2015-11-03 12:08:59', '1', '1', null);
INSERT INTO `t_blogpraise` VALUES ('2', '0:0:0:0:0:0:0:1', '2015-11-05 12:19:14', '1', '3', null);
