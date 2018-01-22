<?php
namespace Pad\Model;
use Think\Model;
/**
  * 评价模块，用于提交评价，读取评价，处理评价信息等。
  */ 
Class EvaluateModel extends Model{
	Public function __construct($menuId,$suggest,$degree){
		$this->menuId = $menuId;
		$this->suggest = $suggest;
		$this->degree = $degree;
	}
	/**
	 * 存储评价内容
	 */
	Public function doEvaluate(){
		$data["menuId"] = $this->menuId;
		$data["suggest"] = $this->suggest;
		$data["eva_time"] =time();
		$data["degree"] = $this->degree;
		if(M("evaluate")->add($data)) return "success";
		else return "failed";
	}
	/**
	 * 根据menuId获取评价内容
	 */
	Public function getEvaByMenuId($menuId=0,$startTime=0,$endTime=0){
		if($menuId!=0) $condition["menuId"] = $menuId;  
		if($endTime==0) $endTime = time();
		$condition["isDelete"] = 0;
		$condition["eva_time"] = array("between",array($startTime,$endTime));
		$ret = M("evaluate")->where($condition)->select();
		return $ret;
	}
}


 ?>