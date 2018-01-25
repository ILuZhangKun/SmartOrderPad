<?php 
namespace Cash\Controller;
use Think\Controller;
/**
 * 收银台首页控制器
 */
Class IndexController extends CommonController{
	Public function index(){
	 	$this->redirect("Table/showTable");
	}


}

 ?>