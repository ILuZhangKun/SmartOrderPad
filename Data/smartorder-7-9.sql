-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 07 月 09 日 08:13
-- 服务器版本: 5.5.16
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `smartorder`
--

-- --------------------------------------------------------

--
-- 表的结构 `so_action`
--

CREATE TABLE IF NOT EXISTS `so_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `so_action`
--

INSERT INTO `so_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765),
(12, 'CarAdd', '新增车辆', '新增车辆', '', '', 1, 1, 1433138523),
(13, 'doExam', '执行验车', '执行验车', '', '', 1, 1, 1435718494);

-- --------------------------------------------------------

--
-- 表的结构 `so_action_log`
--

CREATE TABLE IF NOT EXISTS `so_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=149 ;

--
-- 转存表中的数据 `so_action_log`
--

INSERT INTO `so_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 11, 1, 2130706433, 'category', 2, '操作url：/ot/admin.php?s=/Category/edit.html', 1, 1432774327),
(2, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-28 09:22登录了后台', 1, 1432776177),
(3, 11, 1, 2130706433, 'category', 2, '操作url：/new/admin.php/Category/edit.html', 1, 1432778752),
(4, 10, 1, 2130706433, 'Menu', 16, '操作url：/new/admin.php/Menu/edit.html', 1, 1432779246),
(5, 10, 1, 2130706433, 'Menu', 1, '操作url：/new/admin.php/Menu/edit.html', 1, 1432779261),
(6, 10, 1, 2130706433, 'Menu', 68, '操作url：/new/admin.php/Menu/edit.html', 1, 1432779272),
(7, 10, 1, 2130706433, 'Menu', 93, '操作url：/new/admin.php/Menu/edit.html', 1, 1432779291),
(8, 10, 1, 2130706433, 'Menu', 126, '操作url：/new/admin.php/Menu/add.html', 1, 1432780053),
(9, 10, 1, 2130706433, 'Menu', 130, '操作url：/new/admin.php/Menu/add.html', 1, 1432797442),
(10, 10, 1, 2130706433, 'Menu', 130, '操作url：/new/admin.php/Menu/edit.html', 1, 1432797505),
(11, 10, 1, 2130706433, 'Menu', 131, '操作url：/new/admin.php/Menu/add.html', 1, 1432797553),
(12, 10, 1, 2130706433, 'Menu', 2, '操作url：/new/admin.php/Menu/edit.html', 1, 1432797764),
(13, 10, 1, 2130706433, 'Menu', 132, '操作url：/new/admin.php/Menu/add.html', 1, 1432797814),
(14, 10, 1, 2130706433, 'Menu', 134, '操作url：/new/admin.php/Menu/add.html', 1, 1432813016),
(15, 10, 1, 2130706433, 'Menu', 135, '操作url：/new/admin.php/Menu/add.html', 1, 1432819243),
(16, 10, 1, 2130706433, 'Menu', 44, '操作url：/new/admin.php/Menu/edit.html', 1, 1432819272),
(17, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-29 08:38登录了后台', 1, 1432859933),
(18, 10, 1, 2130706433, 'Menu', 22, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1432897229),
(19, 10, 1, 2130706433, 'Menu', 3, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1432908124),
(20, 10, 1, 2130706433, 'Menu', 3, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1432908414),
(21, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-30 09:17登录了后台', 1, 1432948637),
(22, 1, 1, 2130706433, 'member', 1, 'admin在2015-05-30 09:25登录了后台', 1, 1432949144),
(23, 1, 1, -1408105345, 'member', 1, 'admin在2015-05-30 11:10登录了后台', 1, 1432955456),
(24, 10, 1, 2130706433, 'Menu', 61, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1432996636),
(25, 10, 1, 2130706433, 'Menu', 61, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1432996682),
(26, 10, 1, 2130706433, 'Menu', 0, '操作url：/SmartCar/admin.php/Menu/del/id/23.html', 1, 1432996754),
(27, 10, 1, 2130706433, 'Menu', 61, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1432996785),
(28, 10, 1, 2130706433, 'Menu', 61, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1432996829),
(29, 10, 1, 2130706433, 'Menu', 0, '操作url：/SmartCar/admin.php/Menu/del/id/61.html', 1, 1432996868),
(30, 10, 1, 2130706433, 'Menu', 62, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1432996901),
(31, 10, 1, 2130706433, 'Menu', 0, '操作url：/SmartCar/admin.php/Menu/del/id/62.html', 1, 1432996980),
(32, 10, 1, 2130706433, 'Menu', 63, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1432997027),
(33, 10, 1, 2130706433, 'Menu', 24, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1433002147),
(34, 1, 1, 2093950502, 'member', 1, 'admin在2015-05-31 00:26登录了后台', 1, 1433003162),
(35, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 08:19登录了后台', 1, 1433117995),
(36, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 08:21登录了后台', 1, 1433118063),
(37, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 08:35登录了后台', 1, 1433118921),
(38, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 08:48登录了后台', 1, 1433119726),
(39, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 08:49登录了后台', 1, 1433119789),
(40, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 08:50登录了后台', 1, 1433119827),
(41, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 08:53登录了后台', 1, 1433119999),
(52, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 17:38登录了后台', 1, 1433151499),
(43, 10, 1, 2130706433, 'Menu', 3, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1433121457),
(44, 10, 1, 2130706433, 'Menu', 3, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1433121529),
(45, 10, 1, 2130706433, 'Menu', 31, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1433121662),
(46, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-01 09:32登录了后台', 1, 1433122378),
(47, 10, 1, 2130706433, 'Menu', 32, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1433123080),
(48, 10, 1, 2130706433, 'Menu', 33, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1433123093),
(49, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1433123106),
(50, 12, 1, 2130706433, 'CarManage', 22, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1433139999),
(51, 10, 1, 2130706433, 'Menu', 64, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1433140163),
(53, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-02 08:31登录了后台', 1, 1433205094),
(54, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-03 11:32登录了后台', 1, 1433302376),
(55, 12, 1, 2130706433, 'CarManage', 23, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1433315317),
(56, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-11 16:39登录了后台', 1, 1434011962),
(57, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-16 15:30登录了后台', 1, 1434439841),
(58, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-23 08:51登录了后台', 1, 1435020681),
(59, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-24 08:50登录了后台', 1, 1435107048),
(60, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-25 09:06登录了后台', 1, 1435194384),
(61, 10, 1, 2130706433, 'Menu', 33, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435196124),
(62, 10, 1, 2130706433, 'Menu', 33, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435196161),
(63, 10, 1, 2130706433, 'Menu', 32, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435196574),
(64, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435196596),
(65, 10, 1, 2130706433, 'Menu', 65, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1435200627),
(66, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435200697),
(67, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435213083),
(68, 12, 1, 2130706433, 'CarManage', 24, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435214492),
(69, 10, 1, 2130706433, 'Menu', 66, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1435215330),
(70, 10, 1, 2130706433, 'Menu', 32, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435220745),
(71, 10, 1, 2130706433, 'Menu', 67, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1435225227),
(72, 10, 1, 2130706433, 'Menu', 67, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435225300),
(73, 10, 1, 2130706433, 'Menu', 33, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435225318),
(74, 10, 1, 2130706433, 'Menu', 33, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435225341),
(75, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435225379),
(76, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435225408),
(77, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435225443),
(78, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435225465),
(79, 12, 1, 2130706433, 'CarManage', 25, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435226823),
(80, 1, 1, -1408105345, 'member', 1, 'admin在2015-06-25 20:57登录了后台', 1, 1435237058),
(81, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-26 09:21登录了后台', 1, 1435281670),
(82, 10, 1, 2130706433, 'Menu', 0, '操作url：/SmartCar/admin.php/Menu/del/id/31.html', 1, 1435282449),
(83, 10, 1, 2130706433, 'Menu', 3, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435282501),
(84, 10, 1, 2130706433, 'Menu', 68, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1435282636),
(85, 10, 1, 2130706433, 'Menu', 68, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435282653),
(86, 10, 1, 2130706433, 'Menu', 69, '操作url：/SmartCar/admin.php/Menu/add.html', 1, 1435283701),
(87, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435283762),
(88, 10, 1, 2130706433, 'Menu', 65, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435283791),
(89, 10, 1, 2130706433, 'Menu', 68, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435283813),
(90, 10, 1, 2130706433, 'Menu', 3, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435284983),
(91, 10, 1, 2130706433, 'Menu', 65, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435307529),
(92, 10, 1, 2130706433, 'Menu', 34, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435307540),
(93, 10, 1, 2130706433, 'Menu', 68, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435307551),
(94, 10, 1, 2130706433, 'Menu', 69, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435307601),
(95, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-27 13:57登录了后台', 1, 1435384655),
(96, 12, 1, 2130706433, 'CarManage', 26, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435386722),
(97, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-27 17:46登录了后台', 1, 1435398370),
(98, 1, 1, -1408105345, 'member', 1, 'admin在2015-06-27 17:52登录了后台', 1, 1435398772),
(99, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-27 17:58登录了后台', 1, 1435399139),
(100, 12, 1, 2130706433, 'CarManage', 27, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435406397),
(101, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-28 09:00登录了后台', 1, 1435453252),
(102, 12, 1, 2130706433, 'CarManage', 28, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435454176),
(103, 12, 1, 2130706433, 'CarManage', 29, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435454828),
(104, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-28 13:16登录了后台', 1, 1435468591),
(105, 12, 1, 2130706433, 'CarManage', 30, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435470200),
(106, 12, 1, 2130706433, 'CarManage', 31, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435470817),
(107, 10, 1, 2130706433, 'Menu', 33, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435471730),
(108, 10, 1, 2130706433, 'Menu', 33, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435471779),
(109, 10, 1, 2130706433, 'Menu', 68, '操作url：/SmartCar/admin.php/Menu/edit.html', 1, 1435472383),
(110, 1, 1, -1408105341, 'member', 1, 'admin在2015-06-28 15:14登录了后台', 1, 1435475666),
(111, 12, 1, -1408105341, 'CarManage', 32, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435475847),
(112, 12, 1, -1408105341, 'CarManage', 33, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435475959),
(113, 12, 1, -1408105341, 'CarManage', 34, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476008),
(114, 12, 1, -1408105341, 'CarManage', 35, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476079),
(115, 12, 1, -1408105341, 'CarManage', 36, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476135),
(116, 12, 1, -1408105341, 'CarManage', 37, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476197),
(117, 12, 1, -1408105341, 'CarManage', 38, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476301),
(118, 12, 1, 2130706433, 'CarManage', 39, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476438),
(119, 12, 1, -1408105341, 'CarManage', 40, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476497),
(120, 12, 1, -1408105341, 'CarManage', 41, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476557),
(121, 12, 1, -1408105341, 'CarManage', 42, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476660),
(122, 12, 1, -1408105341, 'CarManage', 43, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476696),
(123, 12, 1, -1408105341, 'CarManage', 44, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476728),
(124, 12, 1, -1408105341, 'CarManage', 45, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476856),
(125, 12, 1, -1408105341, 'CarManage', 46, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435476976),
(126, 12, 1, -1408105341, 'CarManage', 47, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435477127),
(127, 12, 1, -1408105341, 'CarManage', 48, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435477259),
(128, 12, 1, -1408105341, 'CarManage', 49, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435477721),
(129, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-28 16:34登录了后台', 1, 1435480492),
(130, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-29 08:28登录了后台', 1, 1435537704),
(131, 12, 1, 2130706433, 'CarManage', 50, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435563548),
(132, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-30 09:04登录了后台', 1, 1435626266),
(133, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-30 09:26登录了后台', 1, 1435627618),
(134, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-30 09:31登录了后台', 1, 1435627900),
(135, 1, 1, 2130706433, 'member', 1, 'admin在2015-06-30 10:41登录了后台', 1, 1435632112),
(136, 1, 1, -1408105293, 'member', 1, 'admin在2015-07-01 07:59登录了后台', 1, 1435708740),
(137, 13, 1, -1408105293, 'Exam', 1, '操作url：/SmartCar/admin.php/CarExam/doExam/status/1.html', 1, 1435718518),
(138, 1, 1, 2130706433, 'member', 1, 'admin在2015-07-01 14:53登录了后台', 1, 1435733629),
(139, 13, 1, 2130706433, 'Exam', 11, '操作url：/SmartCar/admin.php/CarExam/doExam/status/1.html', 1, 1435733828),
(140, 13, 1, 2130706433, 'Exam', 12, '操作url：/SmartCar/admin.php/CarExam/doExam/status/1.html', 1, 1435733828),
(141, 12, 1, 2130706433, 'CarManage', 51, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435734185),
(142, 12, 1, 2130706433, 'CarManage', 52, '操作url：/SmartCar/admin.php/CarManage/carAdd.html', 1, 1435736061),
(143, 13, 1, 2130706433, 'Exam', 13, '操作url：/SmartCar/admin.php/CarExam/doExam/status/1.html', 1, 1435736362),
(144, 13, 1, 2130706433, 'Exam', 14, '操作url：/SmartCar/admin.php/CarExam/doExam/status/1.html', 1, 1435736362),
(145, 1, 1, 2130706433, 'member', 1, 'admin在2015-07-02 08:59登录了后台', 1, 1435798788),
(146, 1, 1, 0, 'member', 1, 'admin在2015-07-02 14:15登录了后台', 1, 1435817702),
(147, 1, 1, 0, 'member', 1, 'admin在2015-07-02 16:27登录了后台', 1, 1435825629),
(148, 1, 1, 0, 'member', 1, 'admin在2015-07-03 10:30登录了后台', 1, 1435890642);

-- --------------------------------------------------------

--
-- 表的结构 `so_admin`
--

CREATE TABLE IF NOT EXISTS `so_admin` (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `lasttime` int(10) NOT NULL COMMENT '最后登录时间',
  `lastip` varchar(32) NOT NULL COMMENT '最后登录IP',
  `isDelete` int(1) NOT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `so_admin`
--

INSERT INTO `so_admin` (`id`, `username`, `password`, `lasttime`, `lastip`, `isDelete`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_book`
--

CREATE TABLE IF NOT EXISTS `so_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_time` datetime NOT NULL,
  `book_name` varchar(36) NOT NULL,
  `book_num` int(11) NOT NULL,
  `book_tel` int(11) NOT NULL,
  `book_table` int(11) NOT NULL,
  `book_demand` varchar(36) NOT NULL,
  `book_deadline` datetime NOT NULL,
  `book_status` int(11) NOT NULL COMMENT '预定的状态：0代表预定了还没来，时间还没到1：来了正在用餐2：用餐结束或者时间过期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `so_book`
--

INSERT INTO `so_book` (`id`, `book_time`, `book_name`, `book_num`, `book_tel`, `book_table`, `book_demand`, `book_deadline`, `book_status`) VALUES
(1, '2015-07-10 00:00:00', '唱', 3, 2147483647, 5, '没有', '0000-00-00 00:00:00', 0),
(2, '2015-07-10 00:00:00', '鍞�', 3, 2147483647, 5, '娌℃湁', '0000-00-00 00:00:00', 0),
(3, '2015-07-10 00:00:00', '唱', 3, 2147483647, 5, '没有', '0000-00-00 00:00:00', 0),
(4, '2015-07-10 00:00:00', '唱', 3, 2147483647, 5, '没有', '0000-00-00 00:00:00', 0),
(5, '2015-07-10 00:00:00', '唱', 3, 2147483647, 5, '没有', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_cash`
--

CREATE TABLE IF NOT EXISTS `so_cash` (
  `id` int(6) NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `lasttime` int(10) NOT NULL COMMENT '最后登录时间',
  `lastip` varchar(32) NOT NULL COMMENT '最后登录IP',
  `isDelete` int(1) NOT NULL COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_cash`
--

INSERT INTO `so_cash` (`id`, `username`, `password`, `lasttime`, `lastip`, `isDelete`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_category`
--

CREATE TABLE IF NOT EXISTS `so_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `so_category`
--

INSERT INTO `so_category` (`id`, `title`, `pid`, `status`) VALUES
(1, '桃花厅', 0, 1),
(2, '大厅', 0, 1),
(4, '二号桌', 1, 1),
(6, '大厅西区', 2, 1),
(13, '一号桌', 1, 1),
(17, '大厅东区', 2, 1),
(20, '牡丹厅', 0, 1),
(24, '一号桌', 20, 1),
(27, '二号桌', 20, 1),
(28, '三号桌', 1, 1),
(29, '三号桌', 20, 1),
(30, '四号桌', 1, 1),
(31, '四号桌', 20, 1),
(32, '杜鹃听', 0, 1),
(33, '富贵厅', 0, 1),
(34, '一号桌', 32, 1),
(35, '二号桌', 32, 1),
(36, '一号桌', 33, 1),
(37, '二号桌', 33, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_config`
--

CREATE TABLE IF NOT EXISTS `so_config` (
  `conf` char(16) NOT NULL COMMENT '配置项名称',
  `val` char(32) NOT NULL COMMENT '配置项内容',
  `remark` varchar(64) NOT NULL,
  PRIMARY KEY (`conf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `so_config`
--

INSERT INTO `so_config` (`conf`, `val`, `remark`) VALUES
('authPwd', 'e10adc3949ba59abbe56e057f20f883e', '客户端权限验证密码'),
('CopyRight', '©2014 北京工业大学软件学院', '返回版权信息'),
('generalModel', 'general_2', '普通模板'),
('recommendModel', 'recommend_1', '推荐模板'),
('ServerIP', '172.18.4.179', '服务端IP地址'),
('SynVersion', '1435558239', 'Val存放时间戳，用户与前台同步'),
('Version', 'V1.0.2', '返回版本信息');

-- --------------------------------------------------------

--
-- 表的结构 `so_cookmenu`
--

CREATE TABLE IF NOT EXISTS `so_cookmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜名ID',
  `styleid` int(4) NOT NULL COMMENT '菜系ID',
  `cookname` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '菜名',
  `introduce` varchar(3200) CHARACTER SET utf8 NOT NULL COMMENT '菜的简介',
  `price` decimal(8,0) NOT NULL COMMENT '单价',
  `standard` char(4) CHARACTER SET utf8 NOT NULL COMMENT '规格',
  `recommend` char(16) CHARACTER SET utf8 NOT NULL COMMENT '推荐',
  `picture` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '图片地址',
  `is_delete` int(1) NOT NULL COMMENT '逻辑删除',
  `edit_time` int(10) NOT NULL COMMENT '最后编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `so_cookmenu`
--

INSERT INTO `so_cookmenu` (`id`, `styleid`, `cookname`, `introduce`, `price`, `standard`, `recommend`, `picture`, `is_delete`, `edit_time`) VALUES
(2, 4, '水煮鱼', '水煮鱼又称江水煮江鱼，是一道重庆市的汉族创新名菜，属于重庆渝北风味。最早流行于重庆、四川等地。看似原始的做法，实际做工考究--选新鲜生猛活鱼，又充分发挥辣椒御寒、益气养血功效，烹调出来的肉质一点也不会变韧，口感滑嫩，油而不腻。既去除了鱼的腥味，又保持了鱼的鲜嫩。满目的辣椒红亮养眼，辣而不燥，麻而不苦。“麻上头，辣过瘾”，让水煮鱼在全国流 行。', 91, '盘', '普通', '/SmartOrder/Data/Uploads/Images/54fa5da4c9383.jpg', 0, 1435308142),
(3, 2, '回锅肉', '川菜里的回锅肉，是我比较喜欢的一个菜，去十家菜馆，有十种做法，味道各有特色。据说四川人家家都得会做回锅肉，作为一道传统的川菜，可见它的地位非同一般。今天我也来做一下这道经典的川菜，用的是传统的做法。', 99, '盘', '普通', '/SmartOrder/Data/Uploads/Images/552338dddbefe.png', 0, 1428486688),
(4, 1, 'q', '', 0, '盘', '普通', '', 1, 0),
(5, 4, '北京烤鸭', '烤鸭是具有世界声誉的北京著名菜式，由中国汉族人研制于明朝，在当时是宫廷食品。用料为优质肉食鸭北京鸭，果木炭火烤制，色泽红润，肉质肥而不腻，外脆里嫩。...', 144, '盘', '普通', '/SmartOrder/Data/Uploads/Images/55263628354af.png', 0, 1428567592),
(6, 2, '白灼虾', '白灼虾是广东省广州地区一道汉族传统名菜，属粤菜系。主要食材是虾，主要烹饪工艺是白灼。广州人喜欢用白灼之法来做虾，为的是保持其鲜、甜、嫩的原味，然后将虾剥壳蘸酱汁而食。', 98, '盘', '普通', '/SmartOrder/Data/Uploads/Images/554988e86df3c.png', 0, 1430882536),
(7, 7, '重庆辣子鸡', '重庆辣子鸡是一道色香味俱全的汉族名肴，属于川菜系或重庆菜。将鸡块炸至外焦内酥，与花椒、干辣椒和指天椒一同拌炒而成，成菜色泽红润，麻辣鲜香，酥香爽脆。 为了原汁原味的体现这道菜的特色， 做好的成品最好是辣椒能全部把鸡盖住， 而不是鸡块中零零星星出现几个辣椒和花椒。', 95, '盘', '普通', '/SmartOrder/Data/Uploads/Images/5549aaa1d4aff.png', 0, 1430891170),
(8, 3, '瓦罐', '哈哈哈哈哈', 45, '罐', '普通', '', 1, 1435308337),
(9, 5, '黄瓜', '的无法为爱而', 231, '盘', '普通', '', 1, 1435308400),
(10, 3, '123', '2222', 12, '盘', '普通', '', 1, 1435318845);

-- --------------------------------------------------------

--
-- 表的结构 `so_cookstyle`
--

CREATE TABLE IF NOT EXISTS `so_cookstyle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜系ID',
  `stylename` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '菜系名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `so_cookstyle`
--

INSERT INTO `so_cookstyle` (`id`, `stylename`) VALUES
(1, '招牌菜1'),
(2, '特色菜'),
(3, '瓦罐煨汤'),
(4, '农家菜'),
(5, '凉菜'),
(7, '香辣川菜'),
(8, '神经病');

-- --------------------------------------------------------

--
-- 表的结构 `so_evaluate`
--

CREATE TABLE IF NOT EXISTS `so_evaluate` (
  `eId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `degree` int(1) NOT NULL DEFAULT '0' COMMENT '星级',
  `suggest` text CHARACTER SET utf8 NOT NULL COMMENT '建议',
  `menuId` int(8) NOT NULL COMMENT '菜品ID',
  `eva_time` int(12) NOT NULL COMMENT '评价时间',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`eId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `so_evaluate`
--

INSERT INTO `so_evaluate` (`eId`, `degree`, `suggest`, `menuId`, `eva_time`, `is_delete`) VALUES
(1, 5, 'Good', 3, 1430985347, 0),
(2, 5, 'Good', 3, 1430985395, 0),
(3, 5, 'Good', 3, 1430985494, 0),
(4, 4, 'tt', 0, 1430987309, 0),
(5, 5, '', 2, 1430987933, 0),
(6, 3, '', 6, 1430988268, 0),
(7, 3, '', 5, 1430988271, 0),
(8, 5, '', 3, 1430988274, 0),
(9, 5, '可是看看书', 7, 1432951566, 0),
(10, 5, '可是看看书', 7, 1432951572, 0),
(11, 5, '好吃....', 3, 1433214227, 0),
(12, 4, '', 3, 1433339711, 0),
(13, 4, '', 3, 1433339720, 0),
(14, 5, '', 7, 1434434660, 0),
(15, 4, '', 2, 1434685487, 0),
(16, 3, '', 2, 1434685511, 0),
(17, 4, '', 5, 1434685595, 0),
(18, 5, '', 2, 1434685850, 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_member`
--

CREATE TABLE IF NOT EXISTS `so_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `so_member`
--

INSERT INTO `so_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', 0, '0000-00-00', '', 100, 45, 0, 1432774307, 0, 1435890642, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_menu`
--

CREATE TABLE IF NOT EXISTS `so_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=75 ;

--
-- 转存表中的数据 `so_menu`
--

INSERT INTO `so_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '系统首页', 0, 1, 'Index/index', 0, '', '', 0, 1),
(2, '菜单管理', 0, 2, 'MenuManage/index', 0, '', '', 0, 1),
(3, '用户', 0, 3, 'UserManage/index', 0, '11', '', 0, 1),
(66, '编辑菜系', 2, 3, 'MenuManage/ModifyCookStyle', 1, '', '菜系管理', 0, 1),
(51, '备份数据库', 5, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1),
(52, '备份', 51, 0, 'Database/export', 0, '备份数据库', '', 0, 1),
(53, '优化表', 51, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1),
(54, '修复表', 51, 0, 'Database/repair', 0, '修复数据表', '', 0, 1),
(55, '还原数据库', 5, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1),
(56, '恢复', 55, 0, 'Database/import', 0, '数据库恢复', '', 0, 1),
(57, '删除', 55, 0, 'Database/del', 0, '删除备份文件', '', 0, 1),
(4, '系统设置', 0, 4, 'Menu/index', 0, '', '', 0, 1),
(46, '增加车型', 43, 0, 'Config/add', 0, '', '', 0, 1),
(45, '添加部门', 42, 0, 'Config/add', 0, '', '', 0, 1),
(41, '菜单管理', 4, 0, 'Menu/index', 0, '菜单管理\r\n', '菜单设置', 0, 1),
(47, '编辑菜单', 41, 0, 'Menu/edit', 0, '', '', 0, 1),
(48, '新增菜单', 41, 0, 'Menu/add', 0, '', '', 0, 1),
(21, '菜系管理', 2, 0, 'MenuManage/index', 0, '', '', 0, 1),
(31, '用户列表', 3, 0, 'UserManage/index', 0, '', '用户管理', 0, 1),
(22, '菜品管理', 2, 0, 'MenuManage/cookmenu', 0, '', '', 0, 1),
(24, '菜系列表', 2, 1, 'MenuManage/index', 0, '', '菜系管理', 0, 1),
(32, '用户管理', 3, 0, 'UserManage/index', 0, '', '', 0, 1),
(33, '添加用户', 3, 0, 'UserManage/AddUser', 0, '', '用户管理', 0, 1),
(34, '用户修改', 3, 0, 'UserManage/ModifyUser', 1, '', '用户管理', 0, 1),
(63, '新增菜系', 2, 2, 'MenuManage/addCookStyle', 0, '', '菜系管理', 0, 1),
(64, '查看日志', 44, 0, 'Action/edit', 0, '', '', 0, 1),
(65, '修改分类', 42, 0, 'Config/modify', 0, '', '部门管理', 0, 1),
(67, '菜品信息', 2, 1, 'MenuManage/cookmenu', 0, '', '菜品管理', 0, 1),
(68, '添加菜品', 2, 2, 'MenuManage/addCookMenu', 0, '', '菜品管理', 0, 1),
(69, '编辑菜品', 2, 3, 'MenuManage/ModifyCookMenu', 1, '', '菜品管理', 0, 1),
(70, '编辑图片', 2, 4, 'MenuManage/upImage', 1, '', '菜品管理', 0, 1),
(71, '修改密码', 3, 0, 'UserManage/ResetPassword', 1, '', '用户管理', 0, 1),
(74, '座位管理', 4, 0, 'Config/Department', 0, '', '座位设置', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_order`
--

CREATE TABLE IF NOT EXISTS `so_order` (
  `oid` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_time` int(10) NOT NULL COMMENT '下单时间',
  `add_time` int(12) NOT NULL COMMENT '追加订单时间',
  `detail` text CHARACTER SET utf8 NOT NULL COMMENT '订单详情',
  `total_money` decimal(8,2) NOT NULL COMMENT '总金额',
  `table_id` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '桌号',
  `uuid` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一编号',
  `evaluate` text CHARACTER SET utf8 NOT NULL COMMENT '评价',
  `pay_type` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '支付类型',
  `is_pay` int(1) NOT NULL COMMENT '是否支付',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `so_order`
--

INSERT INTO `so_order` (`oid`, `order_time`, `add_time`, `detail`, `total_money`, `table_id`, `uuid`, `evaluate`, `pay_type`, `is_pay`) VALUES
(1, 1431048448, 0, '[{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"1","taste":"","isUp":0}]', 99.00, '3', '19326bf52f5dee18', '', '', 0),
(2, 1431049136, 1434415809, '[{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":5,"taste":"","isUp":1},{"menuId":"7","name":"\\u91cd\\u5e86\\u8fa3\\u5b50\\u9e21","price":"95","num":6,"taste":[],"isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"4","taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":3,"taste":"","isUp":1}]', 1680.00, '5', '19326bf52f5dee18', '', '', 0),
(3, 1431052113, 1432951551, '[{"menuId":"7","name":"\\u91cd\\u5e86\\u8fa3\\u5b50\\u9e21","price":"95","num":9,"taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":3,"taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":4,"taste":"","isUp":1},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":1},{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":7,"taste":[],"isUp":1}]', 2280.00, '9', '19326bf52f5dee18', '', '', 0),
(4, 1434417744, 1434418835, '[{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"3","taste":[],"isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"2","taste":["\\u5fae\\u8fa3"],"isUp":0},{"menuId":"7","name":"\\u91cd\\u5e86\\u8fa3\\u5b50\\u9e21","price":"95","num":"1","taste":"\\u514d\\u9e21\\u7cbe","isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"\\u514d\\u9e21\\u7cbe","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"2","taste":["\\u5fae\\u8fa3"],"isUp":0},{"menuId":"7","name":"\\u91cd\\u5e86\\u8fa3\\u5b50\\u9e21","price":"95","num":"1","taste":"","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"\\u514d\\u9e21\\u7cbe","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"2","taste":["\\u5fae\\u8fa3"],"isUp":0},{"menuId":"7","name":"\\u91cd\\u5e86\\u8fa3\\u5b50\\u9e21","price":"95","num":"1","taste":"","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"\\u514d\\u9e21\\u7cbe","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"2","taste":["\\u5fae\\u8fa3"],"isUp":0},{"menuId":"7","name":"\\u91cd\\u5e86\\u8fa3\\u5b50\\u9e21","price":"95","num":"1","taste":"","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":0}]', 2248.00, '9', '19326bf52f5dee18', '', '', 0),
(6, 1434418618, 1434419547, '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"2","taste":["\\u7b49\\u4e0a"],"isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"2","taste":["\\u7b49\\u4e0a"],"isUp":0},{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"2","taste":["\\u7b49\\u4e0a"],"isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0}]', 828.00, '14', '19326bf52f5dee18', '', '', 0),
(7, 1434420217, 0, '[{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":0}]', 85.00, '20', '19326bf52f5dee18', '', '', 0),
(8, 1434420334, 0, '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":0}]', 175.00, '51', '19326bf52f5dee18', '', '', 0),
(9, 1434420544, 0, '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":0}]', 175.00, '24', '19326bf52f5dee18', '', '', 0),
(10, 1434420861, 0, '[{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":0}]', 122.00, '78', '19326bf52f5dee18', '', '', 0),
(11, 1434421123, 1434423064, '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":1},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":1},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":1},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":1}]', 843.00, '19', '19326bf52f5dee18', '', '', 0),
(12, 1434424155, 1434424700, '[{"menuId":"7","name":"\\u91cd\\u5e86\\u8fa3\\u5b50\\u9e21","price":"95","num":"1","taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":1},{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"1","taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"2","taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":1}]', 1002.00, '36', '19326bf52f5dee18', '', '', 0),
(13, 1434434716, 1434590818, '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"1","taste":"","isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":1},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":[],"isUp":1},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"2","taste":"\\u5c11\\u6cb9","isUp":0},{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"2","taste":"\\u514d\\u8471 \\u5c11\\u6cb9","isUp":0}]', 1119.00, '99', '19326bf52f5dee18', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_position`
--

CREATE TABLE IF NOT EXISTS `so_position` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `position` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `so_position`
--

INSERT INTO `so_position` (`id`, `position`) VALUES
(1, '总经理'),
(2, '大堂经理'),
(3, '厨师长'),
(4, '服务员');

-- --------------------------------------------------------

--
-- 表的结构 `so_table`
--

CREATE TABLE IF NOT EXISTS `so_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` varchar(128) NOT NULL,
  `cid` int(10) NOT NULL COMMENT 'category_id',
  `uuid` varchar(16) NOT NULL COMMENT '设备唯一编号',
  `is_lock` int(1) NOT NULL COMMENT '当有订单的时候，isLock置1',
  `is_book` int(1) NOT NULL COMMENT '是否预定',
  `book_name` varchar(64) NOT NULL COMMENT '预定人姓名',
  `book_tel` char(11) NOT NULL COMMENT '预定人联系方式',
  `dead_line` datetime NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tableId` (`table_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='UUID和TableID对应表' AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `so_table`
--

INSERT INTO `so_table` (`id`, `table_id`, `cid`, `uuid`, `is_lock`, `is_book`, `book_name`, `book_tel`, `dead_line`) VALUES
(25, '4', 1, 'fwfwfed', 1, 0, '', '', '0000-00-00 00:00:00'),
(26, '13', 1, 'fgrwgwgr', 0, 1, '', '', '0000-00-00 00:00:00'),
(27, '24', 20, 'grtehyterhwe', 0, 0, '', '', '0000-00-00 00:00:00'),
(28, '27', 20, 'rewqfewfe', 1, 0, '', '', '0000-00-00 00:00:00'),
(29, '28', 1, 'fewqfwefasfsa', 0, 0, '', '', '0000-00-00 00:00:00'),
(30, '30', 1, 'dsfsfsaf', 0, 0, '', '', '0000-00-00 00:00:00'),
(31, '29', 20, 'fewqfwefasfshfa', 0, 0, '', '', '0000-00-00 00:00:00'),
(32, '31', 20, 'dsfsghtfsaf', 0, 0, '', '', '0000-00-00 00:00:00'),
(33, '34', 32, 'fsdgfdz', 0, 0, '', '', '0000-00-00 00:00:00'),
(34, '35', 32, 'greutreu', 0, 0, '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `so_temp`
--

CREATE TABLE IF NOT EXISTS `so_temp` (
  `table_id` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '桌号',
  `uuid` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一编号',
  `order` text CHARACTER SET utf8 NOT NULL COMMENT '订单信息',
  `total_money` decimal(8,2) NOT NULL COMMENT '订单总额',
  `order_id` int(10) NOT NULL COMMENT '订单号',
  `holding` text CHARACTER SET utf8 NOT NULL COMMENT '呼叫内容',
  `hold_time` int(10) NOT NULL COMMENT '呼叫时间',
  `start_time` int(10) NOT NULL COMMENT '开始点餐时间',
  `end_time` int(10) NOT NULL COMMENT '提交订单时间',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_temp`
--

INSERT INTO `so_temp` (`table_id`, `uuid`, `order`, `total_money`, `order_id`, `holding`, `hold_time`, `start_time`, `end_time`) VALUES
('12', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433403638, 0),
('125', '19326bf52f5dee18', '[{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"\\u514d\\u8471 \\u5c11\\u6cb9 \\u5c11\\u7cd6 \\u5c11\\u76d0 undefined","isUp":0}]', 85.00, 0, '', 0, 1433403352, 0),
('14', '19326bf52f5dee18', '[{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"1","taste":"","isUp":0}]', 99.00, 6, '', 0, 1433402113, 1434419547),
('15', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433402048, 0),
('152', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433401095, 0),
('17', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433402290, 0),
('18', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433402373, 0),
('185', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433400997, 0),
('19', '19326bf52f5dee18', '', 0.00, 11, '', 0, 1434421104, 1434423064),
('2', '19326bf52f5dee18', '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0}]', 90.00, 0, '', 0, 1432952095, 0),
('20', '19326bf52f5dee18', '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":0},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":0}]', 297.00, 7, '', 0, 1434420209, 1434420217),
('24', '19326bf52f5dee18', '', 0.00, 9, '', 0, 1434420533, 1434420544),
('3', '19326bf52f5dee18', '', 99.00, 1, '111', 0, 1431047245, 1431048448),
('36', '19326bf52f5dee18', '', 0.00, 12, '', 0, 1434424062, 1434424700),
('45', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433403300, 0),
('5', '19326bf52f5dee18', '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"3","taste":["\\u52a0\\u5feb \\u5c11\\u7cd6 undefined \\u7b49\\u4e0a"],"isUp":0}]', 270.00, 2, '["","\\u7ed3\\u8d26***\\u52a0\\u9910\\u5dfe\\u7eb8","\\u52a0\\u767d\\u5f00\\u6c34***\\u83dc\\u5355"]', 1434418026, 1431049125, 1434415809),
('51', '19326bf52f5dee18', '', 0.00, 8, '', 0, 1434420320, 1434420334),
('75', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433402888, 0),
('78', '19326bf52f5dee18', '[{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"\\u514d\\u8471 \\u5c11\\u6cb9","isUp":0}]', 85.00, 10, '', 0, 1434420786, 1434420861),
('785', '19326bf52f5dee18', '', 0.00, 0, '', 0, 1433401629, 0),
('9', '19326bf52f5dee18', '', 0.00, 4, '', 0, 1432951735, 1434418835),
('99', '19326bf52f5dee18', '[{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":0},{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"1","taste":"\\u5fae\\u8fa3 \\u514d\\u59dc","isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0}]', 311.00, 13, '["\\u52a0\\u9910\\u5177***\\u52a0\\u767d\\u5f00\\u6c34"]', 1434590856, 1434434694, 1434590818);

-- --------------------------------------------------------

--
-- 表的结构 `so_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `so_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `so_ucenter_member`
--

INSERT INTO `so_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '4a7364270ebba0a7472a2e076bc5bd4c', 'xqnssa@qq.com', '', 1432774307, 2130706433, 1435890642, 0, 1432774307, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_user`
--

CREATE TABLE IF NOT EXISTS `so_user` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '登录用户名',
  `PassWord` varchar(64) CHARACTER SET utf8 NOT NULL,
  `RealName` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '真实姓名',
  `WorkId` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '员工号',
  `IdCardNum` varchar(18) NOT NULL COMMENT '身份证号',
  `Address` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '家庭住址',
  `Position` int(4) NOT NULL COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `so_user`
--

INSERT INTO `so_user` (`id`, `UserName`, `PassWord`, `RealName`, `WorkId`, `IdCardNum`, `Address`, `Position`) VALUES
(1, 'xqnssa', '202cb962ac59075b964b07152d234b70', '肖起', 'SO_001', '370983199004015336', '山东省肥城市', 1),
(2, 'yueyue', 'aae72a8166bf3c7d5e78ded859189c75', '常成月', 'SO_002', '123', '山东省德州市', 2),
(3, 'juner', '202cb962ac59075b964b07152d234b70', '张亚君', 'SO_003', 'xxx', '天津市南开区', 3),
(4, 'fcdsvsd', '57a736948682813ae14d02a74f565aaf', 'vdsbsd', 'bfsdbfds', 'svdcbfsd', 'dsa', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
