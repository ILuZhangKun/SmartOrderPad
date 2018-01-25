<?php
namespace Pad\Controller;
use Think\Controller;
/**
 * 引入命名空间，3.2.3以后新加功能！
  * 版本控制控制器
  */ 
Class SynVersionController extends Controller{
	/**
	 * 判断客户端版本是否与服务端版本一致，如果不一致返回更改的数据。
	 * 如果一致返回1
	 */
	Public function CompareVersion(){
		$ver = I("version");
		$version = new \Pad\Model\SysDataModel($ver);
		$ret = $version->IsSysVersionSame();
		// dump($ret);die;
		$this->ajaxReturn($ret,"jsonp");
	}

}

 ?>