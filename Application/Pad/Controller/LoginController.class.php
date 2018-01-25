<?php 
namespace Pad\Controller;
use Think\Controller;
/**
 * 提供Pad开机界面信息
 */
Class LoginController extends Controller{
	Public function Login(){
		$data[] = M('config')->select();
		$this->ajaxReturn($data,'jsonp');
	}
}





 ?>