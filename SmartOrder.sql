-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-11-02 07:23:05
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartorder`
--

-- --------------------------------------------------------

--
-- 表的结构 `so_action`
--

CREATE TABLE `so_action` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统行为表' ROW_FORMAT=DYNAMIC;

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

CREATE TABLE `so_action_log` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `action_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表' ROW_FORMAT=FIXED;

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
(148, 1, 1, 0, 'member', 1, 'admin在2015-07-03 10:30登录了后台', 1, 1435890642),
(149, 1, 1, 0, 'member', 1, 'admin在2015-07-11 09:15登录了后台', 1, 1436577311),
(150, 1, 1, 0, 'member', 1, 'admin在2015-07-11 14:05登录了后台', 1, 1436594745),
(151, 1, 1, 0, 'member', 1, 'admin在2015-07-11 14:08登录了后台', 1, 1436594902),
(152, 10, 1, 0, 'Menu', 74, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1436595169),
(153, 10, 1, 0, 'Menu', 75, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1436604032),
(154, 10, 1, 0, 'Menu', 75, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1436604139),
(155, 10, 1, 0, 'Menu', 75, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1436604358),
(156, 1, 1, 0, 'member', 1, 'admin在2015-07-12 09:05登录了后台', 1, 1436663103),
(157, 10, 1, 0, 'Menu', 75, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1436696350),
(158, 1, 1, 0, 'member', 1, 'admin在2015-07-12 18:23登录了后台', 1, 1436696614),
(159, 10, 1, 0, 'Menu', 74, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1436696889),
(160, 10, 1, 0, 'Menu', 75, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1436696959),
(161, 1, 1, 0, 'member', 1, 'admin在2015-07-13 08:26登录了后台', 1, 1436747161),
(162, 1, 1, 0, 'member', 1, 'admin在2015-07-13 13:56登录了后台', 1, 1436766976),
(163, 1, 1, 0, 'member', 1, 'admin在2015-07-13 14:13登录了后台', 1, 1436767998),
(164, 10, 1, 2130706433, 'Menu', 76, '操作url：/SmartOrder/admin.php/Menu/add.html', 1, 1437379556),
(165, 10, 1, 2130706433, 'Menu', 76, '操作url：/SmartOrder/admin.php/Menu/edit.html', 1, 1437379566),
(166, 10, 1, 2130706433, 'Menu', 4, '操作url：/SmartOrder/admin.php/Menu/edit.html', 1, 1437379580),
(167, 10, 1, 2130706433, 'Menu', 0, '操作url：/SmartOrder/admin.php/Menu/del/id/74.html', 1, 1437379608),
(168, 10, 1, 2130706433, 'Menu', 77, '操作url：/SmartOrder/admin.php/Menu/add.html', 1, 1437379645),
(169, 1, 1, -1408105273, 'member', 1, 'admin在2015-07-21 11:34登录了后台', 1, 1437449682),
(170, 1, 1, 0, 'member', 1, 'admin在2015-08-29 10:00登录了后台', 1, 1440813619),
(171, 1, 1, -1408105293, 'member', 1, 'admin在2015-09-01 10:01登录了后台', 1, 1441072910),
(172, 1, 1, -1408105433, 'member', 1, 'admin在2015-09-11 10:23登录了后台', 1, 1441938217),
(173, 1, 1, 2130706433, 'member', 1, 'admin在2015-09-17 15:03登录了后台', 1, 1442473429),
(174, 1, 1, 2130706433, 'member', 1, 'admin在2015-09-18 17:02登录了后台', 1, 1442566932),
(175, 1, 1, -1408105293, 'member', 1, 'admin在2015-09-18 18:20登录了后台', 1, 1442571654),
(176, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-18 19:16登录了后台', 1, 1445166972),
(177, 1, 1, 2130706433, 'member', 1, 'admin在2015-11-25 19:36登录了后台', 1, 1448451369),
(178, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-02 16:24登录了后台', 1, 1449044669),
(179, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-03 15:59登录了后台', 1, 1449129577),
(180, 1, 1, 2130706433, 'member', 1, 'admin在2015-12-03 21:44登录了后台', 1, 1449150242),
(181, 1, 1, 0, 'member', 1, 'admin在2017-01-06 17:28登录了后台', 1, 1483694931),
(182, 10, 1, 0, 'Menu', 78, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1483695025),
(183, 10, 1, 0, 'Menu', 78, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483695478),
(184, 1, 1, 0, 'member', 1, 'admin在2017-01-08 09:35登录了后台', 1, 1483839339),
(185, 1, 1, 0, 'member', 1, 'admin在2017-01-08 13:30登录了后台', 1, 1483853420),
(186, 10, 1, 0, 'Menu', 78, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483853456),
(187, 10, 1, 0, 'Menu', 78, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483857805),
(188, 10, 1, 0, 'Menu', 79, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1483857867),
(189, 10, 1, 0, 'Menu', 79, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483858030),
(190, 1, 1, 0, 'member', 1, 'admin在2017-01-08 14:49登录了后台', 1, 1483858177),
(191, 10, 1, 0, 'Menu', 80, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1483858592),
(192, 10, 1, 0, 'Menu', 80, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483858718),
(193, 10, 1, 0, 'Menu', 78, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483858903),
(194, 10, 1, 0, 'Menu', 80, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483858943),
(195, 10, 1, 0, 'Menu', 80, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483859002),
(196, 10, 1, 0, 'Menu', 80, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483859090),
(197, 10, 1, 0, 'Menu', 81, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1483859128),
(198, 10, 1, 0, 'Menu', 0, '操作url：/SmartOrder/Admin.php/Menu/del/id/81.html', 1, 1483859301),
(199, 10, 1, 0, 'Menu', 82, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1483859346),
(200, 10, 1, 0, 'Menu', 82, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483859375),
(201, 10, 1, 0, 'Menu', 82, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483859392),
(202, 10, 1, 0, 'Menu', 83, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1483862852),
(203, 10, 1, 0, 'Menu', 83, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483862895),
(204, 10, 1, 0, 'Menu', 84, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1483862984),
(205, 10, 1, 0, 'Menu', 84, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483863010),
(206, 10, 1, 0, 'Menu', 83, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483863033),
(207, 10, 1, 0, 'Menu', 84, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483863040),
(208, 10, 1, 0, 'Menu', 83, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1483865149),
(209, 1, 1, 0, 'member', 1, 'admin在2017-01-09 21:33登录了后台', 1, 1483968835),
(210, 1, 1, 0, 'member', 1, 'admin在2017-01-13 10:24登录了后台', 1, 1484274250),
(211, 10, 1, 0, 'Menu', 83, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1484278339),
(212, 10, 1, 0, 'Menu', 84, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1484280248),
(213, 1, 1, 0, 'member', 1, 'admin在2017-02-01 12:06登录了后台', 1, 1485921988),
(214, 1, 1, 0, 'member', 1, 'admin在2017-02-13 15:41登录了后台', 1, 1486971677),
(215, 1, 1, 0, 'member', 1, 'admin在2017-02-24 09:48登录了后台', 1, 1487900883),
(216, 1, 1, 0, 'member', 1, 'admin在2017-03-17 15:26登录了后台', 1, 1489735565),
(217, 1, 1, 0, 'member', 1, 'admin在2017-03-18 09:46登录了后台', 1, 1489801601),
(218, 1, 1, 0, 'member', 1, 'admin在2017-03-22 20:22登录了后台', 1, 1490185353),
(219, 10, 1, 0, 'Menu', 85, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1491545426),
(220, 10, 1, 0, 'Menu', 78, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1491545460),
(221, 10, 1, 0, 'Menu', 4, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1491545470),
(222, 10, 1, 0, 'Menu', 85, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1491545478),
(223, 10, 1, 0, 'Menu', 86, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1491545640),
(224, 10, 1, 0, 'Menu', 86, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1491545742),
(225, 10, 1, 0, 'Menu', 86, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1491545867),
(226, 10, 1, 0, 'Menu', 85, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1491546316),
(227, 10, 1, 0, 'Menu', 86, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1491546333),
(228, 10, 1, 0, 'Menu', 86, '操作url：/SmartOrder/Admin.php/Menu/edit.html', 1, 1491546928),
(229, 10, 1, 0, 'Menu', 87, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1491549145),
(230, 10, 1, 0, 'Menu', 88, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1491549209),
(231, 10, 1, 0, 'Menu', 89, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1491549263),
(232, 10, 1, 0, 'Menu', 90, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1491549339),
(233, 1, 1, 0, 'member', 1, 'admin在2017-04-13 10:25登录了后台', 1, 1492050313),
(234, 10, 1, 0, 'Menu', 91, '操作url：/SmartOrder/Admin.php/Menu/add.html', 1, 1492050905),
(235, 10, 1, 0, 'Menu', 0, '操作url：/SmartOrder/Admin.php/Menu/del.html', 1, 1492050966),
(236, 1, 1, 0, 'member', 1, 'admin在2017-04-14 10:02登录了后台', 1, 1492135378),
(237, 1, 1, 0, 'member', 1, 'admin在2017-04-18 14:14登录了后台', 1, 1492496046),
(238, 1, 1, 0, 'member', 1, 'admin在2017-04-19 09:58登录了后台', 1, 1492567101),
(239, 1, 1, 0, 'member', 1, 'admin在2017-06-03 11:40登录了后台', 1, 1496461245),
(240, 1, 1, 0, 'member', 1, 'admin在2017-06-05 10:56登录了后台', 1, 1496631418),
(241, 1, 1, 0, 'member', 1, 'admin在2017-06-05 17:05登录了后台', 1, 1496653524),
(242, 1, 1, 0, 'member', 1, 'admin在2017-06-05 18:50登录了后台', 1, 1496659826),
(243, 1, 1, 0, 'member', 1, 'admin在2017-06-05 20:28登录了后台', 1, 1496665721),
(244, 1, 1, 0, 'member', 1, 'admin在2017-06-06 14:38登录了后台', 1, 1496731089),
(245, 1, 1, 0, 'member', 1, 'admin在2017-06-06 15:46登录了后台', 1, 1496735204),
(246, 1, 1, 0, 'member', 1, 'admin在2017-06-07 10:49登录了后台', 1, 1496803774),
(247, 1, 1, 0, 'member', 1, 'admin在2017-06-13 13:53登录了后台', 1, 1497333214),
(248, 1, 1, 0, 'member', 1, 'admin在2017-06-29 13:49登录了后台', 1, 1498715399),
(249, 1, 1, 0, 'member', 1, 'admin在2017-08-09 22:23登录了后台', 1, 1502288593),
(250, 1, 1, 0, 'member', 1, 'admin在2017-08-11 18:00登录了后台', 1, 1502445615),
(251, 1, 1, 0, 'member', 1, 'admin在2017-08-17 21:44登录了后台', 1, 1502977440),
(252, 1, 1, 0, 'member', 1, 'admin在2017-08-18 08:56登录了后台', 1, 1503017783),
(253, 1, 1, 0, 'member', 1, 'admin在2017-08-18 09:27登录了后台', 1, 1503019643),
(254, 1, 1, 0, 'member', 1, 'admin在2017-08-28 09:25登录了后台', 1, 1503883512),
(255, 1, 1, 0, 'member', 1, 'admin在2017-08-30 10:49登录了后台', 1, 1504061345),
(256, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-04 09:00登录了后台', 1, 1504486842),
(257, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-04 21:43登录了后台', 1, 1504532614),
(258, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-05 08:47登录了后台', 1, 1504572439),
(259, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-05 15:04登录了后台', 1, 1504595097),
(260, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-05 21:42登录了后台', 1, 1504618926),
(261, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-06 08:35登录了后台', 1, 1504658128),
(262, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-07 15:46登录了后台', 1, 1504770366),
(263, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-08 10:04登录了后台', 1, 1504836246),
(264, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-08 10:05登录了后台', 1, 1504836316),
(265, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-08 10:05登录了后台', 1, 1504836332),
(266, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-08 10:06登录了后台', 1, 1504836360),
(267, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-10 11:01登录了后台', 1, 1505012513),
(268, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-10 13:25登录了后台', 1, 1505021114),
(269, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-10 13:36登录了后台', 1, 1505021788),
(270, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-10 16:52登录了后台', 1, 1505033552),
(271, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-11 08:35登录了后台', 1, 1505090106),
(272, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-11 15:38登录了后台', 1, 1505115504),
(273, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-12 10:09登录了后台', 1, 1505182142),
(274, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-12 15:09登录了后台', 1, 1505200199),
(275, 1, 1, 2130706433, 'member', 1, 'admin在2017-09-14 10:02登录了后台', 1, 1505354558),
(276, 1, 1, 2093950685, 'member', 1, 'admin在2017-09-19 20:26登录了后台', 1, 1505824009),
(277, 1, 1, 2093950685, 'member', 1, 'admin在2017-09-20 09:24登录了后台', 1, 1505870665),
(278, 1, 1, 2093950685, 'member', 1, 'admin在2017-09-20 19:54登录了后台', 1, 1505908468),
(279, 1, 1, 2093950685, 'member', 1, 'admin在2017-09-21 20:00登录了后台', 1, 1505995206),
(280, 1, 1, 2093963632, 'member', 1, 'admin在2017-09-21 21:11登录了后台', 1, 1505999477),
(281, 1, 1, 2093950685, 'member', 1, 'admin在2017-09-27 15:09登录了后台', 1, 1506496147),
(282, 1, 1, 1880924255, 'member', 1, 'admin在2017-09-29 10:46登录了后台', 1, 1506653166),
(283, 1, 1, 2093963632, 'member', 1, 'admin在2017-10-11 21:56登录了后台', 1, 1507730174),
(284, 1, 1, 2093950685, 'member', 1, 'admin在2017-10-13 18:10登录了后台', 1, 1507889442),
(285, 1, 1, 2093963632, 'member', 1, 'admin在2017-10-15 09:55登录了后台', 1, 1508032523),
(286, 1, 1, 2093950685, 'member', 1, 'admin在2017-10-15 11:28登录了后台', 1, 1508038135),
(287, 1, 1, 2093950685, 'member', 1, 'admin在2017-10-15 17:22登录了后台', 1, 1508059375),
(288, 1, 1, 2093950685, 'member', 1, 'admin在2017-10-15 19:31登录了后台', 1, 1508067096),
(289, 1, 1, 2093950685, 'member', 1, 'admin在2017-10-18 20:20登录了后台', 1, 1508329236),
(290, 1, 1, 2093950685, 'member', 1, 'admin在2017-10-20 09:46登录了后台', 1, 1508463963),
(291, 1, 1, 2093950685, 'member', 1, 'admin在2017-10-20 15:20登录了后台', 1, 1508484035),
(292, 1, 1, 2093950685, 'member', 1, 'admin在2017-10-21 11:13登录了后台', 1, 1508555622),
(293, 1, 1, 2093950734, 'member', 1, 'admin在2017-10-21 15:07登录了后台', 1, 1508569678),
(294, 1, 1, 2093950734, 'member', 1, 'admin在2017-10-21 15:12登录了后台', 1, 1508569966);

-- --------------------------------------------------------

--
-- 表的结构 `so_addons`
--

CREATE TABLE `so_addons` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台列表'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- 转存表中的数据 `so_addons`
--

INSERT INTO `so_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_admin`
--

CREATE TABLE `so_admin` (
  `id` int(6) NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `lasttime` int(10) NOT NULL COMMENT '最后登录时间',
  `lastip` varchar(32) NOT NULL COMMENT '最后登录IP',
  `isDelete` int(1) NOT NULL COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_admin`
--

INSERT INTO `so_admin` (`id`, `username`, `password`, `lasttime`, `lastip`, `isDelete`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_ads`
--

CREATE TABLE `so_ads` (
  `adnum` int(11) NOT NULL,
  `starttime` date NOT NULL,
  `endtime` date NOT NULL,
  `adname` varchar(40) NOT NULL,
  `adtext` text NOT NULL,
  `adremark` text NOT NULL,
  `adpic` text NOT NULL,
  `edit_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `adhref` text NOT NULL,
  `adtitle` text NOT NULL,
  `adtype` int(11) NOT NULL,
  `adshowcount` int(11) NOT NULL,
  `introduction` text NOT NULL,
  `activity` text NOT NULL,
  `address` text NOT NULL,
  `phone` int(11) NOT NULL,
  `vehicle` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `detail` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COMMENT='广告管理表';

--
-- 转存表中的数据 `so_ads`
--

INSERT INTO `so_ads` (`adnum`, `starttime`, `endtime`, `adname`, `adtext`, `adremark`, `adpic`, `edit_time`, `adhref`, `adtitle`, `adtype`, `adshowcount`, `introduction`, `activity`, `address`, `phone`, `vehicle`, `detail`) VALUES
(43, '2017-10-13', '2017-10-31', '必胜客', '必胜客披萨', '广告招租', '/SmartOrder/Data/Uploads/Images/59eaf6e4afcd4.jpg', '1508570852', 'http://www.pizzahut.com.cn/', '必胜客', 1, 2, '必胜客披萨', '满100减10', '大望路家乐福', 123555, '0', '0'),
(45, '2017-10-04', '2017-10-05', '1', '这里写内容', '1', '/smartorder/Data/Uploads/Images/59e955c8dd4a6.jpg', '1508464072', '1', '1', 1, 1, '这里写内容', '1', '1', 1, '0', '0');

-- --------------------------------------------------------

--
-- 表的结构 `so_ads_type`
--

CREATE TABLE `so_ads_type` (
  `typenum` int(11) NOT NULL,
  `typename` varchar(40) NOT NULL,
  `remark` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告类别管理表';

--
-- 转存表中的数据 `so_ads_type`
--

INSERT INTO `so_ads_type` (`typenum`, `typename`, `remark`) VALUES
(1, '娱乐', '测试'),
(2, '养生', '测试'),
(3, '交通', '测试2'),
(4, '购物', '测试4'),
(5, '健身', '测试5'),
(6, '银行', ''),
(7, '餐饮', '');

-- --------------------------------------------------------

--
-- 表的结构 `so_book`
--

CREATE TABLE `so_book` (
  `id` int(11) NOT NULL,
  `book_day` date NOT NULL,
  `book_time` varchar(12) NOT NULL,
  `book_name` varchar(36) NOT NULL,
  `book_num` int(11) NOT NULL,
  `book_tel` varchar(15) NOT NULL,
  `book_table` int(11) NOT NULL,
  `book_demand` varchar(36) NOT NULL,
  `book_deadline` datetime NOT NULL,
  `book_status` int(11) NOT NULL COMMENT '预定的状态：0代表预定了还没来，时间还没到1：来了正在用餐2：时间过期3：取消'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `so_book`
--

INSERT INTO `so_book` (`id`, `book_day`, `book_time`, `book_name`, `book_num`, `book_tel`, `book_table`, `book_demand`, `book_deadline`, `book_status`) VALUES
(14, '2015-07-14', '晚饭', '李小姐', 5, '15650752237', 15, '', '0000-00-00 00:00:00', 0),
(15, '2015-07-14', '午饭', '鲍小姐', 11, '13575431234', 11, '', '0000-00-00 00:00:00', 1),
(16, '2015-07-14', '晚饭', '张先生', 3, '17645671234', 11, '', '0000-00-00 00:00:00', 2),
(17, '2015-07-15', '午饭', '肖起', 4, '13356781234', 11, '138套餐', '0000-00-00 00:00:00', 3),
(18, '2015-07-16', '早饭', '', 0, '', 1, '', '0000-00-00 00:00:00', 3),
(19, '2015-07-24', '早饭', '', 0, '', 1, '', '0000-00-00 00:00:00', 3),
(20, '2015-07-23', '早饭', '', 0, '', 1, '', '0000-00-00 00:00:00', 3),
(21, '2015-07-20', '早饭', '', 0, '', 1, '', '0000-00-00 00:00:00', 3),
(22, '2015-07-25', '早饭', '', 0, '', 1, '', '0000-00-00 00:00:00', 3),
(23, '2015-07-30', '早饭', '', 0, '', 1, '', '0000-00-00 00:00:00', 3),
(24, '2015-07-22', '早饭', '', 0, '', 1, '', '0000-00-00 00:00:00', 3),
(25, '2015-07-16', '午饭', '孙增旺', 4, '13376542478', 11, '235', '0000-00-00 00:00:00', 3),
(26, '2015-07-15', '晚饭', '路', 7, '15650762345', 2, '', '0000-00-00 00:00:00', 3),
(27, '2015-07-15', '晚饭', '哈', 6, '13573245413', 21, '', '0000-00-00 00:00:00', 3),
(28, '2015-07-15', '午饭', '飞', 3, '15678456785', 2, '', '0000-00-00 00:00:00', 3),
(29, '2015-07-15', '晚饭', '吃', 5, '17857458533', 18, '', '0000-00-00 00:00:00', 3),
(30, '2015-08-31', '午饭', '肖起', 4, '15650752237', 9, '', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_cash`
--

CREATE TABLE `so_cash` (
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

CREATE TABLE `so_category` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '分类ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类表';

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

CREATE TABLE `so_config` (
  `conf` char(16) NOT NULL COMMENT '配置项名称',
  `val` char(32) NOT NULL COMMENT '配置项内容',
  `remark` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `so_config`
--

INSERT INTO `so_config` (`conf`, `val`, `remark`) VALUES
('adVersion', '1508570852', '广告的版本信息'),
('authPwd', 'c4ca4238a0b923820dcc509a6f75849b', '客户端权限验证密码'),
('cloud_ip', '127.0.0.1', '云端IP地址'),
('CopyRight', '©2014 北京工业大学软件学院', '返回版权信息'),
('ServerIP', '140.143.190.196', '服务端IP地址'),
('synKey', '3ChvkTZq8Aa7RMUHYpOy0tw24XoidQES', ''),
('SynVersion', '1505913528', 'Val存放时间戳，用户与前台同步'),
('Version', '0', '返回版本信息');

-- --------------------------------------------------------

--
-- 表的结构 `so_cookmenu`
--

CREATE TABLE `so_cookmenu` (
  `id` int(11) NOT NULL COMMENT '菜名ID',
  `c_id` int(10) NOT NULL COMMENT '云端ID，用于更新标示',
  `styleid` int(4) NOT NULL COMMENT '菜系ID',
  `cookname` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '菜名',
  `introduce` varchar(3200) CHARACTER SET utf8 NOT NULL COMMENT '菜的简介',
  `price` decimal(8,0) NOT NULL COMMENT '单价',
  `standard` char(4) CHARACTER SET utf8 NOT NULL COMMENT '规格',
  `recommend` char(16) CHARACTER SET utf8 NOT NULL COMMENT '推荐',
  `picture` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '图片地址',
  `is_delete` int(1) NOT NULL COMMENT '逻辑删除',
  `edit_time` int(10) NOT NULL COMMENT '最后编辑时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_cookmenu`
--

INSERT INTO `so_cookmenu` (`id`, `c_id`, `styleid`, `cookname`, `introduce`, `price`, `standard`, `recommend`, `picture`, `is_delete`, `edit_time`) VALUES
(1, 26, 8, '鱼汤面', '', '60', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d137a011e.jpg', 0, 1505913528),
(2, 25, 8, '韭菜银芽鸡丝两面黄', '', '70', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d12544219.jpg', 0, 1505874214),
(3, 24, 8, '扬州炒饭', '', '80', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d113e5533.jpg', 0, 1505874197),
(4, 23, 7, '香醇牛排骨', '', '88', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d0e190357.jpg', 0, 1505874147),
(5, 22, 7, '鲜菠萝什果咕咾肉', '', '68', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d0cdb4535.jpg', 0, 1505874126),
(6, 21, 7, '榄菜肉末四棱豆', '', '68', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d0ab2c6bd.jpg', 0, 1505874091),
(7, 20, 7, '脆皮孜然羊柳', '', '78', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d09863353.jpg', 0, 1505874073),
(8, 19, 6, '石锅葱烧海参', '', '168', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d07253015.jpg', 0, 1505874035),
(9, 18, 6, '黑松露萝卜烧肉', '', '168', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d05f91bc9.jpg', 0, 1505874016),
(10, 17, 6, '和风烧汁和牛粒', '', '280', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d04d60fb6.jpg', 0, 1505873998),
(11, 16, 6, '醋溜大黄鱼', '', '238', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d03853b4f.jpg', 0, 1505873977),
(12, 15, 5, '原盅椰子雨花石汤圆', '', '38', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d010ece29.jpg', 0, 1505873937),
(13, 14, 5, '香滑鸳鸯芝麻布丁', '', '28', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1d0007845f.jpg', 0, 1505873921),
(14, 13, 5, '核桃烙', '', '28', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1cfeb5ae95.jpg', 0, 1505873900),
(15, 12, 5, '杨枝甘露', '', '38', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1cfcc45f41.jpg', 0, 1505873869),
(16, 11, 4, '怀旧西柠鸡', '', '98', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1cfa025925.jpg', 0, 1505873824),
(17, 10, 4, '龙凤柔情', '', '198', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1cf85acd7e.jpg', 0, 1505873798),
(18, 9, 3, '腊肉芥兰', '', '78', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1cf2451838.jpg', 0, 1505873701),
(19, 8, 3, '草头烧冬笋', '', '98', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1cf13327c5.jpg', 0, 1505873684),
(20, 7, 2, '清炒河虾仁', '', '88', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1cedacd0af.jpg', 0, 1505873627),
(21, 6, 2, '锅巴带子虾', '', '88', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1ceca25b74.jpg', 0, 1505873610),
(22, 5, 2, '干贝酱金蒜泡明虾球', '', '98', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1ceb8a9530.jpg', 0, 1505873593),
(23, 4, 1, '太白鸡', '', '68', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1ce9838177.jpg', 0, 1505873560),
(24, 3, 1, '素烧鸭', '', '38', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1ce8644791.jpg', 0, 1505873543),
(25, 2, 1, '冰宫肴肉', '', '42', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1ce6accab6.jpg', 0, 1505873516),
(26, 1, 1, '蓑衣黄瓜拼老醋海蜇', '', '75', '盘', '0', '/SmartOrder/Data/Uploads/Images/59c1ce4c136f5.jpg', 0, 1505873489);

-- --------------------------------------------------------

--
-- 表的结构 `so_cookstyle`
--

CREATE TABLE `so_cookstyle` (
  `id` int(11) NOT NULL COMMENT '菜系ID',
  `c_id` int(11) NOT NULL COMMENT '云端ID',
  `stylename` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '菜系名称',
  `edit_time` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL,
  `remark` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_cookstyle`
--

INSERT INTO `so_cookstyle` (`id`, `c_id`, `stylename`, `edit_time`, `is_delete`, `remark`) VALUES
(1, 8, '主食点心', 1505874161, 0, ''),
(2, 7, '猪牛羊', 1505874047, 0, ''),
(3, 6, '粤菜精选', 1505873952, 0, ''),
(4, 5, '甜品', 1505873841, 0, ''),
(5, 4, '禽类', 1505873770, 0, ''),
(6, 3, '健康素食', 1505873657, 0, ''),
(7, 2, '海鲜', 1505873570, 0, ''),
(8, 1, '风味凉菜', 1505873453, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `so_evaluate`
--

CREATE TABLE `so_evaluate` (
  `eId` int(11) NOT NULL COMMENT '自增ID',
  `degree` int(1) NOT NULL DEFAULT '0' COMMENT '星级',
  `suggest` text CHARACTER SET utf8 NOT NULL COMMENT '建议',
  `menuId` int(8) NOT NULL COMMENT '菜品ID',
  `eva_time` int(12) NOT NULL COMMENT '评价时间',
  `is_delete` int(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(18, 5, '', 2, 1434685850, 0),
(19, 5, '', 2, 0, 0),
(20, 5, '很好', 11, 1437481203, 0),
(21, 4, 'nice', 13, 1483649246, 0),
(22, 0, '', 28, 1504341271, 0),
(23, 5, '123', 16, 1505998393, 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_hall`
--

CREATE TABLE `so_hall` (
  `id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '大厅名称'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_hall`
--

INSERT INTO `so_hall` (`id`, `name`) VALUES
(1, '富贵厅'),
(2, '迎宾厅'),
(3, '清风厅'),
(4, '复古厅'),
(5, '怀旧厅');

-- --------------------------------------------------------

--
-- 表的结构 `so_hooks`
--

CREATE TABLE `so_hooks` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `so_hooks`
--

INSERT INTO `so_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_member`
--

CREATE TABLE `so_member` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `so_member`
--

INSERT INTO `so_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', 0, '0000-00-00', '', 530, 137, 0, 1432774307, 2093950734, 1508569966, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_menu`
--

CREATE TABLE `so_menu` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
(4, '系统设置', 0, 7, 'Menu/index', 0, '', '', 0, 1),
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
(77, '桌号管理', 76, 0, 'Table/index', 0, '', '桌号设置', 0, 1),
(75, '新增厅堂', 74, 1, 'Table/add', 0, '', '座位管理', 0, 1),
(76, '桌号设置', 0, 4, 'Table/index', 0, '', '', 0, 1),
(78, '广告管理', 0, 5, 'AdsManage/index', 0, '', '', 0, 1),
(79, '类别管理', 79, 0, 'AdsManage/Index', 0, '', '', 0, 1),
(80, '类别管理', 78, 0, 'AdsManage/index', 0, '', '类别管理', 0, 1),
(82, '新增类别', 78, 1, 'AdsManage/add', 0, '', '类别管理', 0, 1),
(83, '广告列表', 78, 0, 'AdsManage/adslist', 0, '', '内容管理', 0, 1),
(84, '新增广告', 78, 1, 'AdsManage/adsadd', 0, '', '内容管理', 0, 1),
(85, '收银端', 0, 6, 'Cash/index', 0, '收银端全部功能', '', 0, 1),
(86, '桌号管理', 85, 0, 'Cash/Index', 0, '桌号管理', '桌号管理', 0, 1),
(87, '结账管理', 85, 1, 'Cash/Order', 0, '', '结账管理', 0, 1),
(88, '预约管理', 85, 2, 'Cash/Book', 0, '', '预约管理', 0, 1),
(89, '会员管理', 85, 3, 'Cash/Vip', 0, '', '会员管理', 0, 1),
(90, '账务管理', 85, 4, 'Cash/Income', 0, '', '账务管理', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_order`
--

CREATE TABLE `so_order` (
  `oid` int(10) NOT NULL COMMENT '自增ID',
  `order_time` int(10) NOT NULL COMMENT '下单时间',
  `pay_time` int(11) NOT NULL COMMENT '支付时间',
  `add_time` int(12) NOT NULL COMMENT '追加订单时间',
  `detail` text CHARACTER SET utf8 NOT NULL COMMENT '订单详情',
  `total_money` decimal(8,2) NOT NULL COMMENT '总金额',
  `real_money` decimal(8,2) NOT NULL COMMENT '实收金额',
  `table_id` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '桌号',
  `uuid` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一编号',
  `evaluate` text CHARACTER SET utf8 NOT NULL COMMENT '评价',
  `pay_type` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '支付类型',
  `is_pay` int(1) NOT NULL COMMENT '是否支付',
  `syn_check` int(11) NOT NULL DEFAULT '0' COMMENT '账单同步标志位'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_order`
--

INSERT INTO `so_order` (`oid`, `order_time`, `pay_time`, `add_time`, `detail`, `total_money`, `real_money`, `table_id`, `uuid`, `evaluate`, `pay_type`, `is_pay`, `syn_check`) VALUES
(1, 1497337261, 0, 0, '[{"menuId":"26","c_id":"19","name":"\\u7cd6\\u918b\\u91cc\\u810a","price":"35","num":"2","taste":"","isUp":1},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"10","num":"1","taste":"","isUp":1}]', '80.00', '0.00', '1', 'a6b7a37d0115365a', '', '', 1, 1),
(2, 1497337904, 0, 0, '[{"menuId":"30","c_id":"40","name":"\\u9ed1\\u6912\\u725b\\u67f3","price":"70","num":"1","taste":"","isUp":0},{"menuId":"8","c_id":"37","name":"\\u8106\\u76ae\\u9e21","price":"40","num":"1","taste":"","isUp":0},{"menuId":"29","c_id":"39","name":"\\u8001\\u5317\\u4eac\\u6dae\\u809a","price":"89","num":"1","taste":"","isUp":0},{"menuId":"4","c_id":"14","name":"\\u68d2\\u5b50\\u5e16\\u5b50","price":"50","num":"92","taste":"","isUp":0}]', '4799.00', '0.00', '8', 'a6b7a37d0115365a', '', '', 1, 1),
(3, 1502978458, 0, 0, '[{"menuId":"18","c_id":"28","name":"\\u6885\\u83dc\\u6263\\u8089","price":"40","num":"2","taste":"","isUp":1},{"menuId":"29","c_id":"39","name":"\\u8001\\u5317\\u4eac\\u6dae\\u809a","price":"89","num":"1","taste":"","isUp":1},{"menuId":"30","c_id":"40","name":"\\u9ed1\\u6912\\u725b\\u67f3","price":"70","num":"1","taste":"","isUp":1},{"menuId":"8","c_id":"37","name":"\\u8106\\u76ae\\u9e21","price":"40","num":"1","taste":"","isUp":1},{"menuId":"7","c_id":"12","name":"\\u6bdb\\u8840\\u65fa","price":"60","num":"1","taste":"","isUp":1},{"menuId":"6","c_id":"9","name":"\\u4eac\\u9171\\u8089\\u4e1d","price":"49","num":"1","taste":"\\u52a0\\u5feb \\u5fae\\u8fa3 \\u5c11\\u6cb9 \\u5c11\\u7cd6","isUp":0}]', '388.00', '0.00', '1', 'a6b7a37d0115365a', '', '', 1, 1),
(4, 1503019595, 0, 0, '[{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"2","taste":"\\u52a0\\u5feb \\u514d\\u59dc \\u5c11\\u6cb9 \\u5c11\\u76d0","isUp":0},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"22","num":"1","taste":"","isUp":1},{"menuId":"23","c_id":"22","name":"\\u7ea2\\u70e7\\u6392\\u9aa8","price":"55","num":"1","taste":"","isUp":1},{"menuId":"20","c_id":"25","name":"\\u624b\\u6495\\u5305\\u83dc","price":"20","num":"1","taste":"","isUp":1}]', '177.00', '0.00', '1', 'a6b7a37d0115365a', '', '', 1, 1),
(5, 1503024301, 0, 0, '[{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"2","taste":[],"isUp":1},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"22","num":"2","taste":[],"isUp":1}]', '124.00', '0.00', '2', 'a6b7a37d0115365a', '', '', 1, 1),
(6, 1503025035, 0, 0, '[{"menuId":"6","c_id":"9","name":"\\u4eac\\u9171\\u8089\\u4e1d","price":"49","num":"1","taste":"","isUp":1},{"menuId":"10","c_id":"32","name":"\\u53ef\\u4e50\\u9e21\\u7fc5","price":"30","num":"1","taste":"","isUp":1},{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"1","taste":"","isUp":0},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"20","num":"1","taste":"","isUp":0}]', '139.00', '0.00', '8', 'a6b7a37d0115365a', '', '', 1, 1),
(7, 1503026105, 0, 0, '[{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"2","taste":"","isUp":1},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"20","num":"1","taste":"","isUp":1}]', '100.00', '0.00', '8', 'a6b7a37d0115365a', '', '', 1, 1),
(8, 1503026408, 0, 0, '[{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"2","taste":"","isUp":1},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"20","num":"1","taste":"","isUp":1}]', '100.00', '0.00', '21', 'a6b7a37d0115365a', '', '', 1, 1),
(9, 1504062286, 0, 1504083360, '[{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"1","taste":"","isUp":1},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"20","num":"2","taste":"\\u5fae\\u8fa3 \\u514d\\u849c \\u5c11\\u76d0","isUp":0},{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"1","taste":"","isUp":0},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"20","num":"1","taste":"","isUp":0}]', '140.00', '0.00', '1', 'a6b7a37d0115365a', '', '', 1, 1),
(10, 1504328152, 0, 0, '[{"menuId":"15","c_id":"33","name":"\\u9ebb\\u5a46\\u8c46\\u8150","price":"30","num":"3","taste":[],"isUp":1},{"menuId":"14","c_id":"34","name":"\\u4f5b\\u8df3\\u5899","price":"100","num":"1","taste":"","isUp":1},{"menuId":"11","c_id":"38","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"70","num":"1","taste":"","isUp":1},{"menuId":"13","c_id":"35","name":"\\u9633\\u6f84\\u6e56\\u5927\\u95f8\\u87f9","price":"120","num":"1","taste":["\\u7b49\\u4e0a"],"isUp":0},{"menuId":"10","c_id":"32","name":"\\u53ef\\u4e50\\u9e21\\u7fc5","price":"30","num":"2","taste":[],"isUp":1},{"menuId":"4","c_id":"14","name":"\\u68d2\\u5b50\\u5e16\\u5b50","price":"50","num":"2","taste":[],"isUp":1},{"menuId":"28","c_id":"17","name":"\\u6c34\\u716e\\u725b\\u86d9","price":"60","num":"2","taste":[],"isUp":1},{"menuId":"12","c_id":"36","name":"\\u767d\\u5207\\u9e21","price":"40","num":"1","taste":"","isUp":1},{"menuId":"6","c_id":"9","name":"\\u4eac\\u9171\\u8089\\u4e1d","price":"49","num":"1","taste":"","isUp":1}]', '749.00', '0.00', '21', 'a6b7a37d0115365a', '', '', 1, 1),
(11, 1504337104, 0, 0, '[{"menuId":"35","c_id":"46","name":"321","price":"321","num":"1","taste":"","isUp":1},{"menuId":"36","c_id":"47","name":"12","price":"1","num":"1","taste":"","isUp":1},{"menuId":"26","c_id":"19","name":"\\u7cd6\\u918b\\u91cc\\u810a","price":"35","num":"1","taste":"","isUp":1},{"menuId":"27","c_id":"18","name":"\\u6c34\\u716e\\u8089","price":"55","num":"1","taste":"","isUp":1},{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"1","taste":"","isUp":1},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"10","num":"1","taste":"","isUp":0},{"menuId":"22","c_id":"23","name":"\\u7f8a\\u8089\\u4e32","price":"60","num":"1","taste":"","isUp":0},{"menuId":"23","c_id":"22","name":"\\u7ea2\\u70e7\\u6392\\u9aa8","price":"55","num":"2","taste":[],"isUp":0},{"menuId":"20","c_id":"25","name":"\\u624b\\u6495\\u5305\\u83dc","price":"20","num":"1","taste":"","isUp":0},{"menuId":"21","c_id":"24","name":"\\u9c7c\\u9999\\u8304\\u5b50","price":"30","num":"1","taste":"","isUp":0},{"menuId":"18","c_id":"28","name":"\\u6885\\u83dc\\u6263\\u8089","price":"55","num":"1","taste":"","isUp":0},{"menuId":"19","c_id":"26","name":"\\u9ebb\\u8fa3\\u5c0f\\u9f99\\u867e","price":"80","num":"1","taste":"","isUp":0}]', '817.00', '0.00', '29', 'a6b7a37d0115365a', '', '', 1, 1),
(12, 1504338977, 0, 1504341170, '[{"menuId":"42","c_id":"53","name":"www","price":"0","num":"1","taste":"","isUp":0},{"menuId":"43","c_id":"54","name":"eee","price":"0","num":"1","taste":"","isUp":0},{"menuId":"40","c_id":"51","name":"hhh","price":"0","num":"1","taste":"","isUp":0},{"menuId":"41","c_id":"52","name":"qqq","price":"0","num":"1","taste":"","isUp":0},{"menuId":"38","c_id":"49","name":"321","price":"321","num":"1","taste":"","isUp":0},{"menuId":"39","c_id":"50","name":"12","price":"1","num":"1","taste":"","isUp":0},{"menuId":"36","c_id":"47","name":"12","price":"1","num":"1","taste":"","isUp":0},{"menuId":"37","c_id":"48","name":"321","price":"321","num":"1","taste":"","isUp":0},{"menuId":"28","c_id":"17","name":"\\u6c34\\u716e\\u725b\\u86d9","price":"60","num":"1","taste":"","isUp":1},{"menuId":"2","c_id":"16","name":"\\u6fb3\\u6d32\\u9f99\\u867e","price":"350","num":"1","taste":"","isUp":0},{"menuId":"12","c_id":"36","name":"\\u767d\\u5207\\u9e21","price":"40","num":"1","taste":"","isUp":0},{"menuId":"7","c_id":"12","name":"\\u6bdb\\u8840\\u65fa","price":"60","num":"1","taste":"","isUp":0},{"menuId":"6","c_id":"9","name":"\\u4eac\\u9171\\u8089\\u4e1d","price":"49","num":"1","taste":"","isUp":0},{"menuId":"30","c_id":"40","name":"\\u9ed1\\u6912\\u725b\\u67f3","price":"70","num":"1","taste":"","isUp":0},{"menuId":"8","c_id":"37","name":"\\u8106\\u76ae\\u9e21","price":"40","num":"1","taste":"","isUp":0},{"menuId":"29","c_id":"39","name":"\\u8001\\u5317\\u4eac\\u6dae\\u809a","price":"89","num":"1","taste":"","isUp":0},{"menuId":"4","c_id":"14","name":"\\u68d2\\u5b50\\u5e16\\u5b50","price":"50","num":"1","taste":"","isUp":0},{"menuId":"3","c_id":"13","name":"\\u5730\\u9505\\u9e21","price":"70","num":"1","taste":"","isUp":1},{"menuId":"1","c_id":"30","name":"\\u5bab\\u4fdd\\u9e21\\u4e01","price":"40","num":"1","taste":"","isUp":1},{"menuId":"9","c_id":"27","name":"\\u9505\\u5305\\u8089","price":"75","num":"1","taste":"","isUp":0},{"menuId":"28","c_id":"17","name":"\\u6c34\\u716e\\u725b\\u86d9","price":"60","num":"1","taste":"","isUp":1},{"menuId":"2","c_id":"16","name":"\\u6fb3\\u6d32\\u9f99\\u867e","price":"350","num":"1","taste":"\\u52a0\\u5feb \\u5fae\\u8fa3 \\u514d\\u9e21\\u7cbe \\u5c11\\u6cb9 \\u5c11\\u7cd6 \\u5c11\\u76d0","isUp":0}]', '2047.00', '0.00', '30', 'a6b7a37d0115365a', '', '', 1, 1),
(13, 1504342511, 0, 0, '[{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"1","taste":"","isUp":1},{"menuId":"17","c_id":"29","name":"\\u4e1c\\u5761\\u8089","price":"40","num":"1","taste":"","isUp":1},{"menuId":"18","c_id":"28","name":"\\u6885\\u83dc\\u6263\\u8089","price":"55","num":"1","taste":"","isUp":1},{"menuId":"15","c_id":"33","name":"\\u9ebb\\u5a46\\u8c46\\u8150","price":"30","num":"1","taste":"","isUp":1},{"menuId":"16","c_id":"31","name":"\\u6e05\\u7092\\u82a5\\u5170","price":"20","num":"1","taste":"","isUp":1},{"menuId":"13","c_id":"35","name":"\\u9633\\u6f84\\u6e56\\u5927\\u95f8\\u87f9","price":"120","num":"1","taste":"","isUp":0},{"menuId":"14","c_id":"34","name":"\\u4f5b\\u8df3\\u5899","price":"100","num":"1","taste":"","isUp":1},{"menuId":"10","c_id":"32","name":"\\u53ef\\u4e50\\u9e21\\u7fc5","price":"30","num":"1","taste":"","isUp":0},{"menuId":"11","c_id":"38","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"70","num":"1","taste":"","isUp":1},{"menuId":"5","c_id":"15","name":"\\u9178\\u8fa3\\u571f\\u8c46\\u4e1d","price":"32","num":"1","taste":"","isUp":1},{"menuId":"9","c_id":"27","name":"\\u9505\\u5305\\u8089","price":"75","num":"1","taste":"","isUp":0},{"menuId":"1","c_id":"30","name":"\\u5bab\\u4fdd\\u9e21\\u4e01","price":"40","num":"1","taste":"","isUp":0},{"menuId":"3","c_id":"13","name":"\\u5730\\u9505\\u9e21","price":"70","num":"1","taste":"","isUp":0},{"menuId":"4","c_id":"14","name":"\\u68d2\\u5b50\\u5e16\\u5b50","price":"50","num":"1","taste":"","isUp":0},{"menuId":"29","c_id":"39","name":"\\u8001\\u5317\\u4eac\\u6dae\\u809a","price":"89","num":"1","taste":"","isUp":0},{"menuId":"30","c_id":"40","name":"\\u9ed1\\u6912\\u725b\\u67f3","price":"70","num":"1","taste":"","isUp":0},{"menuId":"8","c_id":"37","name":"\\u8106\\u76ae\\u9e21","price":"40","num":"1","taste":"","isUp":0},{"menuId":"6","c_id":"9","name":"\\u4eac\\u9171\\u8089\\u4e1d","price":"49","num":"1","taste":"","isUp":0},{"menuId":"7","c_id":"12","name":"\\u6bdb\\u8840\\u65fa","price":"60","num":"1","taste":"","isUp":0},{"menuId":"12","c_id":"36","name":"\\u767d\\u5207\\u9e21","price":"40","num":"1","taste":"","isUp":0},{"menuId":"28","c_id":"17","name":"\\u6c34\\u716e\\u725b\\u86d9","price":"60","num":"1","taste":"","isUp":0}]', '1180.00', '0.00', '2', 'a6b7a37d0115365a', '', '', 1, 1),
(14, 1504343445, 0, 0, '[{"menuId":"42","c_id":"53","name":"www","price":"0","num":"1","taste":"","isUp":0},{"menuId":"40","c_id":"51","name":"hhh","price":"0","num":"1","taste":"","isUp":0},{"menuId":"41","c_id":"52","name":"qqq","price":"0","num":"1","taste":"","isUp":0},{"menuId":"38","c_id":"49","name":"321","price":"321","num":"1","taste":"","isUp":0},{"menuId":"39","c_id":"50","name":"12","price":"1","num":"1","taste":"","isUp":0},{"menuId":"36","c_id":"47","name":"12","price":"1","num":"1","taste":"","isUp":0},{"menuId":"37","c_id":"48","name":"321","price":"321","num":"1","taste":"","isUp":0},{"menuId":"35","c_id":"46","name":"321","price":"321","num":"1","taste":"","isUp":0},{"menuId":"27","c_id":"18","name":"\\u6c34\\u716e\\u8089","price":"55","num":"1","taste":"","isUp":0},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"10","num":"1","taste":"","isUp":0},{"menuId":"26","c_id":"19","name":"\\u7cd6\\u918b\\u91cc\\u810a","price":"35","num":"1","taste":"","isUp":0},{"menuId":"23","c_id":"22","name":"\\u7ea2\\u70e7\\u6392\\u9aa8","price":"55","num":"1","taste":"","isUp":0},{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"1","taste":"","isUp":0},{"menuId":"21","c_id":"24","name":"\\u9c7c\\u9999\\u8304\\u5b50","price":"30","num":"1","taste":"","isUp":0},{"menuId":"22","c_id":"23","name":"\\u7f8a\\u8089\\u4e32","price":"60","num":"1","taste":"","isUp":0},{"menuId":"19","c_id":"26","name":"\\u9ebb\\u8fa3\\u5c0f\\u9f99\\u867e","price":"80","num":"1","taste":"","isUp":0},{"menuId":"20","c_id":"25","name":"\\u624b\\u6495\\u5305\\u83dc","price":"20","num":"1","taste":"","isUp":0}]', '1350.00', '0.00', '9', 'a6b7a37d0115365a', '', '', 1, 1),
(15, 1504344706, 0, 1504350243, '[{"menuId":"27","c_id":"18","name":"\\u6c34\\u716e\\u8089","price":"55","num":"1","taste":"","isUp":1},{"menuId":"25","c_id":"20","name":"\\u62cd\\u9ec4\\u74dc","price":"10","num":"1","taste":"","isUp":1},{"menuId":"26","c_id":"19","name":"\\u7cd6\\u918b\\u91cc\\u810a","price":"35","num":"1","taste":"","isUp":1},{"menuId":"23","c_id":"22","name":"\\u7ea2\\u70e7\\u6392\\u9aa8","price":"55","num":"1","taste":"","isUp":1},{"menuId":"24","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"1","taste":"","isUp":1},{"menuId":"21","c_id":"24","name":"\\u9c7c\\u9999\\u8304\\u5b50","price":"30","num":"1","taste":"","isUp":1},{"menuId":"22","c_id":"23","name":"\\u7f8a\\u8089\\u4e32","price":"60","num":"1","taste":"","isUp":0},{"menuId":"19","c_id":"26","name":"\\u9ebb\\u8fa3\\u5c0f\\u9f99\\u867e","price":"80","num":"1","taste":"","isUp":0},{"menuId":"20","c_id":"25","name":"\\u624b\\u6495\\u5305\\u83dc","price":"20","num":"1","taste":"","isUp":0},{"menuId":"17","c_id":"29","name":"\\u4e1c\\u5761\\u8089","price":"40","num":"1","taste":"","isUp":0},{"menuId":"12","c_id":"36","name":"\\u767d\\u5207\\u9e21","price":"40","num":"1","taste":"\\u52a0\\u5feb \\u5c11\\u6cb9","isUp":1}]', '465.00', '0.00', '11', 'a6b7a37d0115365a', '', '', 1, 1),
(16, 1504354975, 0, 0, '[{"menuId":"27","c_id":"21","name":"\\u9c7c\\u9999\\u8089\\u4e1d","price":"40","num":"1","taste":"","isUp":1},{"menuId":"28","c_id":"28","name":"\\u6885\\u83dc\\u6263\\u8089","price":"55","num":"1","taste":"","isUp":1},{"menuId":"25","c_id":"24","name":"\\u9c7c\\u9999\\u8304\\u5b50","price":"30","num":"1","taste":"","isUp":1},{"menuId":"26","c_id":"29","name":"\\u4e1c\\u5761\\u8089","price":"40","num":"1","taste":"","isUp":1},{"menuId":"23","c_id":"22","name":"\\u7ea2\\u70e7\\u6392\\u9aa8","price":"55","num":"1","taste":"","isUp":1},{"menuId":"24","c_id":"30","name":"\\u5bab\\u4fdd\\u9e21\\u4e01","price":"40","num":"1","taste":"","isUp":1},{"menuId":"21","c_id":"18","name":"\\u6c34\\u716e\\u8089","price":"55","num":"1","taste":"","isUp":0},{"menuId":"22","c_id":"19","name":"\\u7cd6\\u918b\\u91cc\\u810a","price":"35","num":"1","taste":"","isUp":0},{"menuId":"19","c_id":"34","name":"\\u4f5b\\u8df3\\u5899","price":"100","num":"1","taste":"","isUp":0},{"menuId":"20","c_id":"35","name":"\\u9633\\u6f84\\u6e56\\u5927\\u95f8\\u87f9","price":"120","num":"1","taste":"","isUp":0},{"menuId":"17","c_id":"32","name":"\\u53ef\\u4e50\\u9e21\\u7fc5","price":"30","num":"1","taste":"","isUp":0}]', '600.00', '0.00', '20', 'a6b7a37d0115365a', '', '', 1, 1),
(17, 1504433428, 0, 0, '[{"menuId":"1","c_id":"1","name":"111","price":"111","num":"1","taste":"","isUp":1}]', '111.00', '0.00', '23', 'a6b7a37d0115365a', '', '', 1, 1),
(18, 1504488369, 0, 1504493456, '[{"menuId":"3","c_id":"3","name":"333","price":"333","num":"1","taste":"","isUp":1},{"menuId":"1","c_id":"1","name":"111","price":"111","num":"1","taste":"","isUp":1},{"menuId":"10","c_id":"10","name":"000","price":"0","num":"1","taste":"","isUp":0},{"menuId":"1","c_id":"1","name":"111","price":"111","num":"1","taste":"","isUp":1},{"menuId":"10","c_id":"10","name":"000","price":"0","num":"1","taste":"","isUp":0},{"menuId":"12","c_id":"12","name":"321","price":"321","num":"1","taste":"","isUp":0},{"menuId":"3","c_id":"3","name":"333","price":"333","num":"1","taste":"","isUp":1},{"menuId":"9","c_id":"9","name":"999","price":"999","num":"1","taste":"","isUp":0},{"menuId":"5","c_id":"5","name":"555","price":"555","num":"1","taste":"","isUp":0}]', '2763.00', '0.00', '24', 'a6b7a37d0115365a', '', '', 1, 1),
(19, 1505913165, 0, 1505913207, '[{"menuId":"3","c_id":"24","name":"\\u626c\\u5dde\\u7092\\u996d","price":"80","num":"1","taste":"","isUp":1},{"menuId":"18","c_id":"9","name":"\\u814a\\u8089\\u82a5\\u5170","price":"78","num":"1","taste":"","isUp":1},{"menuId":"21","c_id":"6","name":"\\u9505\\u5df4\\u5e26\\u5b50\\u867e","price":"88","num":"1","taste":"","isUp":0},{"menuId":"20","c_id":"7","name":"\\u6e05\\u7092\\u6cb3\\u867e\\u4ec1","price":"88","num":"1","taste":"","isUp":0},{"menuId":"4","c_id":"23","name":"\\u9999\\u9187\\u725b\\u6392\\u9aa8","price":"88","num":"1","taste":"","isUp":0}]', '422.00', '0.00', '1', 'a6b7a37d0115365a', '', '', 1, 1),
(20, 1505914357, 0, 0, '[{"menuId":"2","c_id":"25","name":"\\u97ed\\u83dc\\u94f6\\u82bd\\u9e21\\u4e1d\\u4e24\\u9762\\u9ec4","price":"70","num":"1","taste":"","isUp":1},{"menuId":"19","c_id":"8","name":"\\u8349\\u5934\\u70e7\\u51ac\\u7b0b","price":"98","num":"1","taste":"","isUp":1},{"menuId":"7","c_id":"20","name":"\\u8106\\u76ae\\u5b5c\\u7136\\u7f8a\\u67f3","price":"78","num":"1","taste":"","isUp":1},{"menuId":"22","c_id":"5","name":"\\u5e72\\u8d1d\\u9171\\u91d1\\u849c\\u6ce1\\u660e\\u867e\\u7403","price":"98","num":"1","taste":"","isUp":1},{"menuId":"5","c_id":"22","name":"\\u9c9c\\u83e0\\u841d\\u4ec0\\u679c\\u5495\\u54be\\u8089","price":"68","num":"1","taste":"","isUp":1},{"menuId":"1","c_id":"26","name":"\\u9c7c\\u6c64\\u9762","price":"50","num":"1","taste":"","isUp":1},{"menuId":"21","c_id":"6","name":"\\u9505\\u5df4\\u5e26\\u5b50\\u867e","price":"88","num":"1","taste":"","isUp":1},{"menuId":"17","c_id":"10","name":"\\u9f99\\u51e4\\u67d4\\u60c5","price":"198","num":"1","taste":"","isUp":1},{"menuId":"1","c_id":"26","name":"\\u9c7c\\u6c64\\u9762","price":"60","num":"1","taste":"","isUp":1},{"menuId":"18","c_id":"9","name":"\\u814a\\u8089\\u82a5\\u5170","price":"78","num":"1","taste":"","isUp":1},{"menuId":"21","c_id":"6","name":"\\u9505\\u5df4\\u5e26\\u5b50\\u867e","price":"88","num":"1","taste":"","isUp":1},{"menuId":"7","c_id":"20","name":"\\u8106\\u76ae\\u5b5c\\u7136\\u7f8a\\u67f3","price":"78","num":"1","taste":"","isUp":1},{"menuId":"19","c_id":"8","name":"\\u8349\\u5934\\u70e7\\u51ac\\u7b0b","price":"98","num":"1","taste":"","isUp":1},{"menuId":"5","c_id":"22","name":"\\u9c9c\\u83e0\\u841d\\u4ec0\\u679c\\u5495\\u54be\\u8089","price":"68","num":"1","taste":"\\u52a0\\u5feb \\u5fae\\u8fa3 \\u514d\\u9e21\\u7cbe \\u514d\\u8471 \\u514d\\u849c \\u514d\\u59dc \\u5c11\\u6cb9 \\u5c11\\u7cd6 \\u5c11\\u76d0","isUp":1}]', '1218.00', '0.00', '8', 'c605f5fd1232dec7', '', '', 1, 1),
(21, 1505995095, 0, 0, '[{"menuId":"13","c_id":"14","name":"\\u9999\\u6ed1\\u9e33\\u9e2f\\u829d\\u9ebb\\u5e03\\u4e01","price":"28","num":"1","taste":"","isUp":1}]', '28.00', '0.00', '21', 'c605f5fd1232dec7', '', '', 1, 1),
(22, 1505997489, 0, 0, '[{"menuId":"16","c_id":"11","name":"\\u6000\\u65e7\\u897f\\u67e0\\u9e21","price":"98","num":"1","taste":"","isUp":1},{"menuId":"17","c_id":"10","name":"\\u9f99\\u51e4\\u67d4\\u60c5","price":"198","num":"1","taste":"","isUp":1},{"menuId":"10","c_id":"17","name":"\\u548c\\u98ce\\u70e7\\u6c41\\u548c\\u725b\\u7c92","price":"280","num":"1","taste":"","isUp":1},{"menuId":"26","c_id":"1","name":"\\u84d1\\u8863\\u9ec4\\u74dc\\u62fc\\u8001\\u918b\\u6d77\\u8707","price":"75","num":"1","taste":"","isUp":0},{"menuId":"3","c_id":"24","name":"\\u626c\\u5dde\\u7092\\u996d","price":"80","num":"1","taste":"","isUp":0},{"menuId":"2","c_id":"25","name":"\\u97ed\\u83dc\\u94f6\\u82bd\\u9e21\\u4e1d\\u4e24\\u9762\\u9ec4","price":"70","num":"1","taste":"","isUp":0},{"menuId":"3","c_id":"24","name":"\\u626c\\u5dde\\u7092\\u996d","price":"80","num":"1","taste":"","isUp":0},{"menuId":"2","c_id":"25","name":"\\u97ed\\u83dc\\u94f6\\u82bd\\u9e21\\u4e1d\\u4e24\\u9762\\u9ec4","price":"70","num":"1","taste":"","isUp":0},{"menuId":"18","c_id":"9","name":"\\u814a\\u8089\\u82a5\\u5170","price":"78","num":"1","taste":"","isUp":0},{"menuId":"1","c_id":"26","name":"\\u9c7c\\u6c64\\u9762","price":"60","num":"1","taste":"","isUp":0},{"menuId":"2","c_id":"25","name":"\\u97ed\\u83dc\\u94f6\\u82bd\\u9e21\\u4e1d\\u4e24\\u9762\\u9ec4","price":"70","num":"1","taste":"","isUp":0},{"menuId":"3","c_id":"24","name":"\\u626c\\u5dde\\u7092\\u996d","price":"80","num":"1","taste":"","isUp":0},{"menuId":"18","c_id":"9","name":"\\u814a\\u8089\\u82a5\\u5170","price":"78","num":"1","taste":"","isUp":0},{"menuId":"19","c_id":"8","name":"\\u8349\\u5934\\u70e7\\u51ac\\u7b0b","price":"98","num":"1","taste":"","isUp":0}]', '1415.00', '0.00', '21', 'c605f5fd1232dec7', '', '', 1, 1),
(23, 1506046180, 0, 0, '[{"menuId":"8","c_id":"19","name":"\\u77f3\\u9505\\u8471\\u70e7\\u6d77\\u53c2","price":"168","num":"1","taste":"","isUp":0}]', '168.00', '0.00', '25', 'c605f5fd1232dec7', '', '', 1, 1),
(24, 1506048931, 0, 1506049375, '[{"menuId":"1","c_id":"26","name":"\\u9c7c\\u6c64\\u9762","price":"60","num":"1","taste":"","isUp":1},{"menuId":"1","c_id":"26","name":"\\u9c7c\\u6c64\\u9762","price":"60","num":"1","taste":"","isUp":1},{"menuId":"2","c_id":"25","name":"\\u97ed\\u83dc\\u94f6\\u82bd\\u9e21\\u4e1d\\u4e24\\u9762\\u9ec4","price":"70","num":"1","taste":"","isUp":0},{"menuId":"3","c_id":"24","name":"\\u626c\\u5dde\\u7092\\u996d","price":"80","num":"1","taste":"","isUp":0},{"menuId":"19","c_id":"8","name":"\\u8349\\u5934\\u70e7\\u51ac\\u7b0b","price":"98","num":"1","taste":"","isUp":0}]', '368.00', '0.00', '8', 'c605f5fd1232dec7', '', '', 1, 1),
(25, 1506049652, 0, 0, '[{"menuId":"1","c_id":"26","name":"\\u9c7c\\u6c64\\u9762","price":"60","num":"1","taste":"","isUp":0}]', '60.00', '0.00', '21', 'c605f5fd1232dec7', '', '', 1, 1),
(26, 1506049742, 0, 1506069068, '[{"menuId":"2","c_id":"25","name":"\\u97ed\\u83dc\\u94f6\\u82bd\\u9e21\\u4e1d\\u4e24\\u9762\\u9ec4","price":"70","num":"1","taste":"","isUp":1},{"menuId":"3","c_id":"24","name":"\\u626c\\u5dde\\u7092\\u996d","price":"80","num":"1","taste":"","isUp":1},{"menuId":"3","c_id":"24","name":"\\u626c\\u5dde\\u7092\\u996d","price":"80","num":"1","taste":"","isUp":1}]', '230.00', '0.00', '30', 'c605f5fd1232dec7', '', '', 1, 1),
(27, 1506329684, 0, 0, '[{"menuId":"6","c_id":"21","name":"\\u6984\\u83dc\\u8089\\u672b\\u56db\\u68f1\\u8c46","price":"68","num":"1","taste":"\\u5c11\\u76d0","isUp":0},{"menuId":"18","c_id":"9","name":"\\u814a\\u8089\\u82a5\\u5170","price":"78","num":"1","taste":"\\u5c11\\u7cd6","isUp":0},{"menuId":"20","c_id":"7","name":"\\u6e05\\u7092\\u6cb3\\u867e\\u4ec1","price":"88","num":"1","taste":"\\u5fae\\u8fa3","isUp":0},{"menuId":"5","c_id":"22","name":"\\u9c9c\\u83e0\\u841d\\u4ec0\\u679c\\u5495\\u54be\\u8089","price":"68","num":"1","taste":"\\u5c11\\u76d0","isUp":0},{"menuId":"15","c_id":"12","name":"\\u6768\\u679d\\u7518\\u9732","price":"38","num":"1","taste":"\\u5c11\\u7cd6","isUp":1},{"menuId":"16","c_id":"11","name":"\\u6000\\u65e7\\u897f\\u67e0\\u9e21","price":"98","num":"1","taste":"\\u5c11\\u76d0","isUp":0},{"menuId":"10","c_id":"17","name":"\\u548c\\u98ce\\u70e7\\u6c41\\u548c\\u725b\\u7c92","price":"280","num":"1","taste":"\\u5fae\\u8fa3","isUp":1},{"menuId":"25","c_id":"2","name":"\\u51b0\\u5bab\\u80b4\\u8089","price":"42","num":"1","taste":"\\u514d\\u849c","isUp":0}]', '760.00', '0.00', '1', 'c605f5fd1232dec7', '', '', 1, 1),
(28, 1506330072, 0, 0, '[{"menuId":"25","c_id":"2","name":"\\u51b0\\u5bab\\u80b4\\u8089","price":"42","num":"1","taste":"\\u5fae\\u8fa3","isUp":1}]', '42.00', '0.00', '1', 'c605f5fd1232dec7', '', '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_position`
--

CREATE TABLE `so_position` (
  `id` int(4) NOT NULL,
  `position` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户职位'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- 表的结构 `so_queue`
--

CREATE TABLE `so_queue` (
  `id` int(12) UNSIGNED NOT NULL,
  `tel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(2) NOT NULL DEFAULT '2',
  `begin_time` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `so_queue`
--

INSERT INTO `so_queue` (`id`, `tel`, `num`, `begin_time`) VALUES
(1, '13507683368', 2, 1509602519),
(2, '13507683369', 4, 1509602524),
(3, '13500004546', 6, 1509602529),
(4, '13507683345', 8, 1509602536),
(5, '13507686695', 2, 1509602542);

-- --------------------------------------------------------

--
-- 表的结构 `so_table`
--

CREATE TABLE `so_table` (
  `id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL COMMENT 'hall_id',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `num` int(2) NOT NULL DEFAULT '1',
  `uuid` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一编号',
  `is_lock` int(1) NOT NULL DEFAULT '0' COMMENT '当有订单的时候，isLock置1',
  `is_leave` int(1) UNSIGNED ZEROFILL NOT NULL,
  `leave_time` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='UUID和TableID对应表';

--
-- 转存表中的数据 `so_table`
--

INSERT INTO `so_table` (`id`, `hall_id`, `table_name`, `num`, `uuid`, `is_lock`, `is_leave`, `leave_time`) VALUES
(1, 1, '一号桌', 2, 'a6b7a37d0115365a', 1, 0, 0),
(2, 2, '一号桌', 6, 'a6b7a37d0115365a', 1, 0, 0),
(8, 1, '二号桌', 4, 'a6b7a37d0115365a', 1, 1, 0),
(9, 2, '二号桌', 4, 'a6b7a37d0115365a', 1, 0, 0),
(11, 2, '三号桌', 8, 'a6b7a37d0115365a', 1, 0, 0),
(15, 1, '三号桌', 2, 'a6b7a37d0115365a', 1, 1, 0),
(18, 3, '二号桌', 6, 'a6b7a37d0115365a', 1, 1, 0),
(20, 2, '四号桌', 2, 'a6b7a37d0115365a', 1, 0, 0),
(21, 1, '四号桌', 4, 'a6b7a37d0115365a', 1, 0, 0),
(22, 4, '一号', 8, '', 0, 1, 0),
(23, 2, '五号桌', 2, 'a6b7a37d0115365a', 1, 1, 0),
(24, 2, '六号桌', 4, 'a6b7a37d0115365a', 1, 0, 0),
(25, 3, 'ppppp', 4, '', 0, 1, 0),
(26, 5, 'll', 6, '', 0, 0, 0),
(27, 2, '7777', 6, 'a6b7a37d0115365a', 1, 1, 0),
(28, 5, 'ppp', 8, 'a6b7a37d0115365a', 1, 1, 0),
(29, 1, '五号桌', 2, 'a6b7a37d0115365a', 1, 0, 0),
(30, 1, '六号桌', 4, 'a6b7a37d0115365a', 1, 1, 0),
(31, 1, '123', 8, 'a6b7a37d0115365a', 1, 1, 0);

-- --------------------------------------------------------

--
-- 替换视图以便查看 `so_table_hall`
--
CREATE TABLE `so_table_hall` (
`id` int(11)
,`hall_id` int(11)
,`table_name` varchar(64)
,`uuid` varchar(16)
,`is_lock` int(1)
,`hall_name` varchar(64)
);

-- --------------------------------------------------------

--
-- 表的结构 `so_temp`
--

CREATE TABLE `so_temp` (
  `table_id` int(11) NOT NULL COMMENT '桌号',
  `uuid` varchar(16) NOT NULL,
  `order` text CHARACTER SET utf8 NOT NULL COMMENT '订单信息',
  `total_money` decimal(8,2) NOT NULL COMMENT '订单总额',
  `order_id` int(10) NOT NULL COMMENT '订单号',
  `holding` text CHARACTER SET utf8 NOT NULL COMMENT '呼叫内容',
  `hold_time` int(10) NOT NULL COMMENT '呼叫时间',
  `start_time` int(10) NOT NULL COMMENT '开始点餐时间',
  `end_time` int(10) NOT NULL COMMENT '提交订单时间'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_temp`
--

INSERT INTO `so_temp` (`table_id`, `uuid`, `order`, `total_money`, `order_id`, `holding`, `hold_time`, `start_time`, `end_time`) VALUES
(8, 'c605f5fd1232dec7', '', '0.00', 0, '', 0, 1508668049, 0),
(15, 'a6b7a37d0115365a', '[{"menuId":"18","c_id":"9","name":"\\u814a\\u8089\\u82a5\\u5170","price":"78","num":"1","taste":"\\u5c11\\u7cd6","isUp":0}]', '78.00', 0, '', 0, 1508570005, 0);

-- --------------------------------------------------------

--
-- 表的结构 `so_test`
--

CREATE TABLE `so_test` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `verify` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `so_ucenter_member`
--

CREATE TABLE `so_ucenter_member` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `so_ucenter_member`
--

INSERT INTO `so_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '4a7364270ebba0a7472a2e076bc5bd4c', 'xqnssa@qq.com', '', 1432774307, 2130706433, 1508569966, 2093950734, 1432774307, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_user`
--

CREATE TABLE `so_user` (
  `id` int(8) NOT NULL,
  `UserName` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '登录用户名',
  `PassWord` varchar(64) CHARACTER SET utf8 NOT NULL,
  `RealName` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '真实姓名',
  `WorkId` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '员工号',
  `IdCardNum` varchar(18) NOT NULL COMMENT '身份证号',
  `Address` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '家庭住址',
  `Position` int(4) NOT NULL COMMENT '职位'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_user`
--

INSERT INTO `so_user` (`id`, `UserName`, `PassWord`, `RealName`, `WorkId`, `IdCardNum`, `Address`, `Position`) VALUES
(1, 'xqnssa', '202cb962ac59075b964b07152d234b70', '肖起', 'SO_001', '370983199004015336', '山东省肥城市', 1),
(2, 'yueyue', 'aae72a8166bf3c7d5e78ded859189c75', '常成月', 'SO_002', '123', '山东省德州市', 2),
(3, 'juner', '202cb962ac59075b964b07152d234b70', '张亚君', 'SO_003', 'xxx', '天津市南开区', 3),
(4, 'fcdsvsd', '57a736948682813ae14d02a74f565aaf', 'vdsbsd', 'bfsdbfds', 'svdcbfsd', 'dsa', 1),
(5, 'aaa', '202cb962ac59075b964b07152d234b70', 'a j', 'asx', 'asxa', 'asdc', 2);

-- --------------------------------------------------------

--
-- 视图结构 `so_table_hall`
--
DROP TABLE IF EXISTS `so_table_hall`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `so_table_hall`  AS  select `so_table`.`id` AS `id`,`so_table`.`hall_id` AS `hall_id`,`so_table`.`table_name` AS `table_name`,`so_table`.`uuid` AS `uuid`,`so_table`.`is_lock` AS `is_lock`,`so_hall`.`name` AS `hall_name` from (`so_table` left join `so_hall` on((`so_table`.`hall_id` = `so_hall`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `so_action`
--
ALTER TABLE `so_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_action_log`
--
ALTER TABLE `so_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_ip_ix` (`action_ip`),
  ADD KEY `action_id_ix` (`action_id`),
  ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `so_addons`
--
ALTER TABLE `so_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_admin`
--
ALTER TABLE `so_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_ads`
--
ALTER TABLE `so_ads`
  ADD PRIMARY KEY (`adnum`);

--
-- Indexes for table `so_ads_type`
--
ALTER TABLE `so_ads_type`
  ADD PRIMARY KEY (`typenum`);

--
-- Indexes for table `so_book`
--
ALTER TABLE `so_book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_category`
--
ALTER TABLE `so_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `so_config`
--
ALTER TABLE `so_config`
  ADD PRIMARY KEY (`conf`);

--
-- Indexes for table `so_cookmenu`
--
ALTER TABLE `so_cookmenu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `c_id` (`c_id`);

--
-- Indexes for table `so_cookstyle`
--
ALTER TABLE `so_cookstyle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `c_id` (`c_id`);

--
-- Indexes for table `so_evaluate`
--
ALTER TABLE `so_evaluate`
  ADD PRIMARY KEY (`eId`);

--
-- Indexes for table `so_hall`
--
ALTER TABLE `so_hall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_hooks`
--
ALTER TABLE `so_hooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `so_member`
--
ALTER TABLE `so_member`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `so_menu`
--
ALTER TABLE `so_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `so_order`
--
ALTER TABLE `so_order`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `so_position`
--
ALTER TABLE `so_position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_queue`
--
ALTER TABLE `so_queue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_table`
--
ALTER TABLE `so_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_temp`
--
ALTER TABLE `so_temp`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `so_test`
--
ALTER TABLE `so_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `so_ucenter_member`
--
ALTER TABLE `so_ucenter_member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `so_user`
--
ALTER TABLE `so_user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `so_action`
--
ALTER TABLE `so_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `so_action_log`
--
ALTER TABLE `so_action_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=295;
--
-- 使用表AUTO_INCREMENT `so_addons`
--
ALTER TABLE `so_addons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `so_admin`
--
ALTER TABLE `so_admin`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `so_ads`
--
ALTER TABLE `so_ads`
  MODIFY `adnum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- 使用表AUTO_INCREMENT `so_ads_type`
--
ALTER TABLE `so_ads_type`
  MODIFY `typenum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `so_book`
--
ALTER TABLE `so_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `so_category`
--
ALTER TABLE `so_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID', AUTO_INCREMENT=38;
--
-- 使用表AUTO_INCREMENT `so_cookmenu`
--
ALTER TABLE `so_cookmenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜名ID', AUTO_INCREMENT=27;
--
-- 使用表AUTO_INCREMENT `so_cookstyle`
--
ALTER TABLE `so_cookstyle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜系ID', AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `so_evaluate`
--
ALTER TABLE `so_evaluate`
  MODIFY `eId` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=24;
--
-- 使用表AUTO_INCREMENT `so_hall`
--
ALTER TABLE `so_hall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `so_hooks`
--
ALTER TABLE `so_hooks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `so_member`
--
ALTER TABLE `so_member`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `so_menu`
--
ALTER TABLE `so_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文档ID', AUTO_INCREMENT=92;
--
-- 使用表AUTO_INCREMENT `so_order`
--
ALTER TABLE `so_order`
  MODIFY `oid` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID', AUTO_INCREMENT=29;
--
-- 使用表AUTO_INCREMENT `so_position`
--
ALTER TABLE `so_position`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `so_queue`
--
ALTER TABLE `so_queue`
  MODIFY `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `so_table`
--
ALTER TABLE `so_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- 使用表AUTO_INCREMENT `so_test`
--
ALTER TABLE `so_test`
  MODIFY `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `so_ucenter_member`
--
ALTER TABLE `so_ucenter_member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `so_user`
--
ALTER TABLE `so_user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
