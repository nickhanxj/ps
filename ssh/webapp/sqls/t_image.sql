/*
Navicat MySQL Data Transfer

Source Server         : monitor
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : ssh

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-11-09 16:37:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_image`
-- ----------------------------
DROP TABLE IF EXISTS `t_image`;
CREATE TABLE `t_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `blog_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA069E5D061A21B21` (`blog_id`),
  CONSTRAINT `FKA069E5D061A21B21` FOREIGN KEY (`blog_id`) REFERENCES `t_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_image
-- ----------------------------
