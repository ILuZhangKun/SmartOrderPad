<?php 
/**	
 * 引入命名空间，3.2.3以后新加功能！
 * 此模块预留废置
 */
namespace Pad\Controller;
use Think\Controller;
Class IndexController extends Controller {
	Public function logout(){
		/**
		 * 注销用户登录函数。
		 * 销毁Session，并且重定向到登录界面。
		 */
		session_unset();
		session_destroy();
		$this->redirect('Index/Login/index');
	}
	Public function test(){
		$a = '0';
		$b = (bool)$a;
		dump($b);
	}
}

 ?>