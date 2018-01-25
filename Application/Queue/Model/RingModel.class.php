<?php 
namespace Cash\Model;
use Think\Model;
/**
 * 呼叫控制器
 */
Class RingModel extends Model{
	//构造函数	
	Public function __construct(){
		$this->dbTmep = M("temp");
	}
	Public function getHolding(){
		$betTime = C("BETWEENTIME");
		// $betTime = 5;
		$startTime = strtotime(date("Y-m-d H:m:i",strtotime("- {$betTime} minute")));
		$condition["holdTime"] = array("between",array($startTime,time()));
		$ret = M("temp")->where($condition)->field("uuId,tableId,holdTime")->select();
		return $ret;
	}
}

 ?>