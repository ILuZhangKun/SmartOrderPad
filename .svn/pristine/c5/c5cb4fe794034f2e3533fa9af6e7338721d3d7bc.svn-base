<?php
namespace Pad\Controller;
use Think\Controller;
/**
  * 引入命名空间，3.2.3以后新加功能！
  * 查验权限
  * 1、在设置桌号的时候需要验证权限
  * 2、在下订单的时候需要验证权限
  */ 
Class CheckAuthController extends Controller{
	Public function CheckAuth(){
		// include(__ROOT__.'/'.APP_NAME.'/Common/common.php');
		$pwd = I("pwd");
		$authPwd = getConfig("authPwd");
		if($pwd == $authPwd) $ret = "success";
		else $ret = "failed";
		$this->ajaxReturn($ret,"jsonp");
	}
}
?>