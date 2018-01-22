<?php 
namespace Pad\Controller;
use Think\Controller;
/**
* 评价控制器
*/
Class EvaluateController extends Controller{
	Public function doEvaluate(){
		$menuId = I("menuId");
		$suggest = I("suggest");
		$degree = I("degree");
		$evaluate = new \Pad\Model\EvaluateModel($menuId,$suggest,$degree);
		$ret = $evaluate->doEvaluate();
		$this->ajaxReturn($ret,"jsonp");
	}
	Public function getEvaluate(){
		$menuId = I("menuId");
		$startTime = I("startTime");
		$endTime = I("endTime");
		$evaluate = new \Pad\Model\EvaluateModel();
		$ret = $evaluate->getEvaByMenuId($menuId,$startTime,$endTime);
		dump($ret);
	}
}

 ?>