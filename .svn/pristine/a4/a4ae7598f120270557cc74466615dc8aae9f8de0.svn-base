<?php 
namespace Cash\Controller;
use Think\Controller;
	/**
	 * 
	 * 收银台登录、登出逻辑
	 * @copyright [MrXiao]
	 * @license   [@Mr.Xiao]
	 * @version   [0.1]
	 */
Class LoginController extends Controller{
	//登录模块显示
	Public function index(){
		$this->display();
	}
	//登录逻辑
	Public function login(){
		/**
		 *	用户登录判断用户信息的函数
		 *	1、判断验证码是否正确（这里不区分大小写）。
		 *	2、判断数据是否是POST来的，如果不是提示访问页面不存在。
		 *	3、验证用户名密码，判断用户的状态是否为锁定。
		 *	4、写入Session
		 *	5、重定向到后台主页页面。
		*/
		if(!IS_POST) halt('您访问的页面不存在！','Cash/Login');
		$username = I('username');
		$pwd= md5(I('password'));
		$user= M('cash')->where(array('username'=>$username))->find();
		if (!$user||$user['password']!=$pwd){
			$this->error('用户名或密码错误！');
			return;
		}
		if($user['lock']){
			$this->error('该用户被锁定！');
			return;
		}
		//将用户数据写入SESSION
		session('uid',$user['id']);
		session('username',$user['username']);
		session('logintime',date('y-m-d H:i',time()));
		session('loginip',get_client_ip());
		$this->redirect('Cash/Table/showTable');
	}
	//退出登录：调用方法{:U("Cash/Login/logout")}
	Public function logout(){
		/**
		 * 注销用户登录函数。
		 * 销毁Session，并且重定向到登录界面。
		 */
		session_unset();
		session_destroy();
		$this->redirect('Cash/Login/index');
	}
}
 ?>