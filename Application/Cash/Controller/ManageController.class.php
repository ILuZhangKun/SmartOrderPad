<?php
namespace Cash\Controller;
use Think\Controller;
	/**
	 
	 */
Class ManageController extends CommonController{
	Public function index(){
		//获得桌位预定情况
	 	$this->assign("meta_title","管理");
		$this->display("index");
	}
	Public function member(){
		//获得桌位预定情况
	 	$this->assign("meta_title","管理");
		$this->display("member");
	}
	Public function employee(){
		//获得桌位预定情况
	 	$this->assign("meta_title","管理");
		$this->display("employee");
	}
}

?>