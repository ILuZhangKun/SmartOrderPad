<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Think\Controller;


class TestController extends AdminController {
	Public function test(){
		// $syn_key = I("post.syn_key");
		//如果判断数据库中不存在syn_key直接返回error;
		/*
		
		$dept_info = M("dept")->where("syn_key = '{$syn_key}'")->find();
		 */
		
		// $menu_version 
		// $data = array("status"=>1,"data"=>$dat,"syn_key"=>$syn_key);
		// $this->ajaxReturn($data,'json');
		$url = "http://www.baidu.com/img/bd_logo1.png";
		for($i=0;$i<=100;$i++){
			file_put_contents("./Public/test_{$i}.png", file_get_contents($url));
		}
		die;
  		file_put_contents("./Public/21.png",file_get_contents($url));
		die;
		image_download("http://www.baidu.com/img/bd_logo1.png", "./Public/2.png");

		


	}


}