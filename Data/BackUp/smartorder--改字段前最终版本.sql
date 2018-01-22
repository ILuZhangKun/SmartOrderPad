-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 07 月 02 日 03:42
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
  `tel_phone1` varchar(11) NOT NULL COMMENT '联系电话',
  `tel_phone2` varchar(11) NOT NULL COMMENT '联系方式2',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `so_category`
--

INSERT INTO `so_category` (`id`, `title`, `tel_phone1`, `tel_phone2`, `pid`, `sort`, `status`) VALUES
(1, '樱花厅', '', '', 0, 1, 1),
(2, '大厅', '', '', 0, 0, 1),
(25, '123', '', '', 0, 0, 1),
(4, '二号桌', '', '', 1, 1, 1),
(6, '大厅西区', '', '', 2, 1, 1),
(13, '一号桌', '', '', 1, 0, 1),
(17, '大厅东区', '15650752256', '15650752256', 2, 0, 1),
(20, '牡丹厅', '15650752237', '15650752256', 0, 0, 1),
(24, '一号桌', '6548123', '0534-654123', 20, 0, 1),
(26, '杜鹃厅', '', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `so_config`
--

CREATE TABLE IF NOT EXISTS `so_config` (
  `Conf` char(16) NOT NULL COMMENT '配置项名称',
  `Val` char(32) NOT NULL COMMENT '配置项内容',
  `remark` varchar(64) NOT NULL,
  PRIMARY KEY (`Conf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `so_config`
--

INSERT INTO `so_config` (`Conf`, `Val`, `remark`) VALUES
('authPwd', 'e10adc3949ba59abbe56e057f20f883e', '客户端权限验证密码'),
('CopyRight', '©2014 北京工业大学软件学院', '返回版权信息'),
('generalModel', 'general_2', '普通模板'),
('recommendModel', 'recommend_1', '推荐模板'),
('ServerIP', '172.18.4.179', '服务端IP地址'),
('SynVersion', '1435318823', 'Val存放时间戳，用户与前台同步'),
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
  `isDelete` int(1) NOT NULL COMMENT '逻辑删除',
  `editTime` int(10) NOT NULL COMMENT '最后编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `so_cookmenu`
--

INSERT INTO `so_cookmenu` (`id`, `styleid`, `cookname`, `introduce`, `price`, `standard`, `recommend`, `picture`, `isDelete`, `editTime`) VALUES
(2, 4, '水煮鱼', '水煮鱼又称江水煮江鱼，是一道重庆市的汉族创新名菜，属于重庆渝北风味。最早流行于重庆、四川等地。看似原始的做法，实际做工考究--选新鲜生猛活鱼，又充分发挥辣椒御寒、益气养血功效，烹调出来的肉质一点也不会变韧，口感滑嫩，油而不腻。既去除了鱼的腥味，又保持了鱼的鲜嫩。满目的辣椒红亮养眼，辣而不燥，麻而不苦。“麻上头，辣过瘾”，让水煮鱼在全国流行。', 91, '盘', '普通', '/SmartOrder/Data/Uploads/Images/54fa5da4c9383.jpg', 0, 1435308142),
(3, 2, '回锅肉', '川菜里的回锅肉，是我比较喜欢的一个菜，去十家菜馆，有十种做法，味道各有特色。据说四川人家家都得会做回锅肉，作为一道传统的川菜，可见它的地位非同一般。今天我也来做一下这道经典的川菜，用的是传统的做法。', 99, '盘', '普通', '/SmartOrder/Data/Uploads/Images/552338dddbefe.png', 0, 1428486688),
(4, 1, 'q', '', 0, '盘', '普通', '', 1, 0),
(5, 4, '北京烤鸭', '烤鸭是具有世界声誉的北京著名菜式，由中国汉族人研制于明朝，在当时是宫廷食品。用料为优质肉食鸭北京鸭，果木炭火烤制，色泽红润，肉质肥而不腻，外脆里嫩。...', 122, '盘', '普通', '/SmartOrder/Data/Uploads/Images/55263628354af.png', 0, 1428567592),
(6, 2, '白灼虾', '白灼虾是广东省广州地区一道汉族传统名菜，属粤菜系。主要食材是虾，主要烹饪工艺是白灼。广州人喜欢用白灼之法来做虾，为的是保持其鲜、甜、嫩的原味，然后将虾剥壳蘸酱汁而食。', 85, '盘', '推荐', '/SmartOrder/Data/Uploads/Images/554988e86df3c.png', 0, 1430882536),
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
  `evaTime` int(12) NOT NULL COMMENT '评价时间',
  `isDelete` int(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`eId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `so_evaluate`
--

INSERT INTO `so_evaluate` (`eId`, `degree`, `suggest`, `menuId`, `evaTime`, `isDelete`) VALUES
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
-- 表的结构 `so_model`
--

CREATE TABLE IF NOT EXISTS `so_model` (
  `mId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modelType` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '模板类型',
  `modelName` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mainNum` int(2) NOT NULL DEFAULT '0',
  `normalNum` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `so_model`
--

INSERT INTO `so_model` (`mId`, `modelType`, `modelName`, `mainNum`, `normalNum`) VALUES
(1, 'recommend', 'recommend_1', 3, 2),
(2, 'general', 'general_1', 0, 2),
(3, 'general', 'general_2', 0, 2),
(4, 'other', 'other_1', 0, 3);

-- --------------------------------------------------------

--
-- 表的结构 `so_order`
--

CREATE TABLE IF NOT EXISTS `so_order` (
  `oId` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `orderTime` int(10) NOT NULL COMMENT '下单时间',
  `addTime` int(12) NOT NULL COMMENT '追加订单时间',
  `detail` text CHARACTER SET utf8 NOT NULL COMMENT '订单详情',
  `totalMoney` decimal(8,2) NOT NULL COMMENT '总金额',
  `tableId` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '桌号',
  `uuId` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一编号',
  `evaluate` text CHARACTER SET utf8 NOT NULL COMMENT '评价',
  `payType` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '支付类型',
  `isPay` int(1) NOT NULL COMMENT '是否支付',
  PRIMARY KEY (`oId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `so_order`
--

INSERT INTO `so_order` (`oId`, `orderTime`, `addTime`, `detail`, `totalMoney`, `tableId`, `uuId`, `evaluate`, `payType`, `isPay`) VALUES
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
-- 表的结构 `so_page`
--

CREATE TABLE IF NOT EXISTS `so_page` (
  `pId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mainContent` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `normalContent` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `styleName` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `so_position`
--

CREATE TABLE IF NOT EXISTS `so_position` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `Position` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户职位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `so_position`
--

INSERT INTO `so_position` (`id`, `Position`) VALUES
(1, '总经理'),
(2, '大堂经理'),
(3, '厨师长'),
(4, '服务员');

-- --------------------------------------------------------

--
-- 表的结构 `so_table`
--

CREATE TABLE IF NOT EXISTS `so_table` (
  `id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `full_name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `so_temp`
--

CREATE TABLE IF NOT EXISTS `so_temp` (
  `tableId` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '桌号',
  `uuId` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '设备唯一编号',
  `pageContent` text CHARACTER SET utf8 NOT NULL COMMENT '页面模板和菜品',
  `order` text CHARACTER SET utf8 NOT NULL COMMENT '订单信息',
  `totalMoney` decimal(8,2) NOT NULL COMMENT '订单总额',
  `orderId` int(10) NOT NULL COMMENT '订单号',
  `holding` text CHARACTER SET utf8 NOT NULL COMMENT '呼叫内容',
  `holdTime` int(10) NOT NULL COMMENT '呼叫时间',
  `startTime` int(10) NOT NULL COMMENT '开始点餐时间',
  `endTime` int(10) NOT NULL COMMENT '提交订单时间',
  PRIMARY KEY (`tableId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `so_temp`
--

INSERT INTO `so_temp` (`tableId`, `uuId`, `pageContent`, `order`, `totalMoney`, `orderId`, `holding`, `holdTime`, `startTime`, `endTime`) VALUES
('12', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433403638, 0),
('125', '19326bf52f5dee18', '', '[{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"\\u514d\\u8471 \\u5c11\\u6cb9 \\u5c11\\u7cd6 \\u5c11\\u76d0 undefined","isUp":0}]', 85.00, 0, '', 0, 1433403352, 0),
('14', '19326bf52f5dee18', '', '[{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"1","taste":"","isUp":0}]', 99.00, 6, '', 0, 1433402113, 1434419547),
('15', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433402048, 0),
('152', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433401095, 0),
('17', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433402290, 0),
('18', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433402373, 0),
('185', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433400997, 0),
('19', '19326bf52f5dee18', '', '', 0.00, 11, '', 0, 1434421104, 1434423064),
('2', '19326bf52f5dee18', '', '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0}]', 90.00, 0, '', 0, 1432952095, 0),
('20', '19326bf52f5dee18', '', '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0},{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"","isUp":0},{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":0}]', 297.00, 7, '', 0, 1434420209, 1434420217),
('24', '19326bf52f5dee18', '', '', 0.00, 9, '', 0, 1434420533, 1434420544),
('3', '19326bf52f5dee18', '', '', 99.00, 1, '111', 0, 1431047245, 1431048448),
('36', '19326bf52f5dee18', '', '', 0.00, 12, '', 0, 1434424062, 1434424700),
('45', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433403300, 0),
('5', '19326bf52f5dee18', '', '[{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"3","taste":["\\u52a0\\u5feb \\u5c11\\u7cd6 undefined \\u7b49\\u4e0a"],"isUp":0}]', 270.00, 2, '["","\\u7ed3\\u8d26***\\u52a0\\u9910\\u5dfe\\u7eb8","\\u52a0\\u767d\\u5f00\\u6c34***\\u83dc\\u5355"]', 1434418026, 1431049125, 1434415809),
('51', '19326bf52f5dee18', '', '', 0.00, 8, '', 0, 1434420320, 1434420334),
('75', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433402888, 0),
('78', '19326bf52f5dee18', '', '[{"menuId":"6","name":"\\u767d\\u707c\\u867e","price":"85","num":"1","taste":"\\u514d\\u8471 \\u5c11\\u6cb9","isUp":0}]', 85.00, 10, '', 0, 1434420786, 1434420861),
('785', '19326bf52f5dee18', '', '', 0.00, 0, '', 0, 1433401629, 0),
('9', '19326bf52f5dee18', '', '', 0.00, 4, '', 0, 1432951735, 1434418835),
('99', '19326bf52f5dee18', '', '[{"menuId":"5","name":"\\u5317\\u4eac\\u70e4\\u9e2d","price":"122","num":"1","taste":"","isUp":0},{"menuId":"3","name":"\\u56de\\u9505\\u8089","price":"99","num":"1","taste":"\\u5fae\\u8fa3 \\u514d\\u59dc","isUp":0},{"menuId":"2","name":"\\u6c34\\u716e\\u9c7c","price":"90","num":"1","taste":"","isUp":0}]', 311.00, 13, '["\\u52a0\\u9910\\u5177***\\u52a0\\u767d\\u5f00\\u6c34"]', 1434590856, 1434434694, 1434590818);

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

-- --------------------------------------------------------

--
-- 表的结构 `so_utot`
--

CREATE TABLE IF NOT EXISTS `so_utot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableId` varchar(128) NOT NULL,
  `tableGroup` varchar(128) NOT NULL COMMENT '所属区域',
  `uuId` varchar(16) NOT NULL COMMENT '设备唯一编号',
  `isLock` int(1) NOT NULL COMMENT '当有订单的时候，isLock置1',
  `isBook` int(1) NOT NULL COMMENT '是否预定',
  `bookName` varchar(64) NOT NULL COMMENT '预定人姓名',
  `bookTel` char(11) NOT NULL COMMENT '预定人联系方式',
  `deadLine` datetime NOT NULL COMMENT '到期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tableId` (`tableId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='UUID和TableID对应表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
