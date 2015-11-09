/*
Navicat MySQL Data Transfer

Source Server         : monitor
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-11-09 16:37:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_blogcomment`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogcomment`;
CREATE TABLE `t_blogcomment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `pubTime` datetime DEFAULT NULL,
  `blog_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4ABE953261A21B21` (`blog_id`),
  KEY `FK4ABE95325A2B3E81` (`user_id`),
  CONSTRAINT `FK4ABE95325A2B3E81` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK4ABE953261A21B21` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogcomment
-- ----------------------------
INSERT INTO `t_blogcomment` VALUES ('1', '可以！有用！', '2015-11-03 11:59:00', '1', '1');
