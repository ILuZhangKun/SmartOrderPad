<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 系统配文件
 * 所有系统级别的配置
 */
return array(
    /* 模块相关配置 */
    'AUTOLOAD_NAMESPACE' => array('Addons' => ONETHINK_ADDON_PATH), //扩展模块列表
    'DEFAULT_MODULE'     => 'Index',
    'MODULE_DENY_LIST'   => array('Common','User','Admin','Install'),
    //'MODULE_ALLOW_LIST'  => array('Home','Admin'),

    /* 系统数据加密设置 */
    'DATA_AUTH_KEY' => 'YE7)HWaM!FVh3q=}Nd"U$`ko1u,ePcJf4sA[bOzR', //默认数据加密KEY

    /* 用户相关设置 */
    'USER_MAX_CACHE'     => 1000, //最大缓存用户数
    'USER_ADMINISTRATOR' => 1, //管理员用户ID

    /* URL配置 */
    'URL_CASE_INSENSITIVE' => true, //默认false 表示URL区分大小写 true则表示不区分大小写
    'URL_MODEL'            => 1, //URL模式
    'VAR_URL_PARAMS'       => '', // PATHINFO URL参数变量
    
    //开启URL路由
    'URL_ROUTER_ON'       =>    true,
    //区分大小写URL
    // 'URL_CASE_INSENSITIVE' =>   true,
    //路由规则
    'URL_MAP_RULES'     =>    array(
        //桌号绑定控制URL
        'DealTable'     =>  'Pad/Table/DealTable',
        //版本控制URL
        'CheckVersion'  =>  'Pad/SynVersion/CompareVersion',
        //订单控制URL
        'DealOrder'     =>  'Pad/Order/DealOrder',
        //呼叫控制URL
        'DealRing'      =>  'Pad/Ring/DealRing',
        //权限控制URL
        'CheckAuth'     =>  'Pad/CheckAuth/CheckAuth',
        //评价模块
        'Comment'       =>  'Pad/Evaluate/doEvaluate',
        //桌号列表
        'TableTree'     =>  'Pad/Table/getTableTree',
    ),
    'URL_PATHINFO_DEPR'    => '/', //PATHINFO URL分割符

    /* 全局过滤配置 */
    'DEFAULT_FILTER' => '', //全局过滤函数

    /* 数据库配置 */
    'DB_TYPE'   => 'mysql', // 数据库类型
    'DB_HOST'   => '127.0.0.1', // 服务器地址
    'DB_NAME'   => 'smartorder', // 数据库名
    'DB_USER'   => 'root', // 用户名
    'DB_PWD'    => '',  // 密码
    'DB_PORT'   => '3306', // 端口
    'DB_PREFIX' => 'so_', // 数据库表前缀
    'DB_PARAMS'    =>    array(\PDO::ATTR_CASE => \PDO::CASE_NATURAL),//数据库区分大小写
    /* 文档模型配置 (文档模型核心配置，请勿更改) */
    'DOCUMENT_MODEL_TYPE' => array(2 => '主题', 1 => '目录', 3 => '段落'),
    //开启URL路由
    'URL_ROUTER_ON'       =>    true,
    //路由规则
    'URL_ROUTE_RULES'     =>    array(

    ),
    //设置预定座位等待时间
    'WAIT_TIME'   =>  array('hour'=>2),
);
