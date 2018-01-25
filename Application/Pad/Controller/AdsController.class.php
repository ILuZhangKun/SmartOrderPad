<?php
namespace Pad\Controller;
use Think\Controller;
/**
 * 广告控制器
 */
Class AdsController extends Controller{
	//读取后台数据库中的广告内容
	Public function GetAds(){

		$ver = I("version");
		// dump($ver);die();
		$version = new \Pad\Model\AdsModel($ver);
		// dump($version);die;
		$ret = $version->IsSysVersionSame();
		// dump($ret);die;
		$this->ajaxReturn($ret,"jsonp");
		
		// $ads = M('ads');
		// $ret = $ads->select();
		// // dump($ret);die();					//数据库中广告表单的全部数据
		// $this->ajaxReturn($ret,"jsonp");
	}
}


?>