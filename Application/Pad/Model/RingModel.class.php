<?php
namespace Pad\Model;
use Think\Model;
/**
  * 添加TP3.2支持，引入命名空间
  * 呼叫控制模块
  */ 
Class RingModel extends Model{
	function __construct($ringType,$uuId,$tableId){

	}
	/**
	 * 呼叫
	 */
	function addRing($tableId,$ringType){
		$ret = M("temp")->where(array("talbe_id"=>$tableId))->getField("holding");
		$allRing = object_array(json_decode($ret));
		$this->allRing = empty($allRing)?array($ringType):array_merge($allRing,array($ringType));
		$data["holding"] = json_encode($this->allRing);
		$data["hold_time"] = time();
 		if(M("temp")->where(array("table_id"=>$tableId))->save($data)) return "success";
		else return "failed";
	}
	/**
	 * 取消呼叫
	 */
	function delRing($tableId){
		$data["holding"] = "";
		$data["holdTime"] = 0;
		if(M("temp")->where(array("talbe_id"=>$tableId))->save($data)) return "success";
		else return "failed";
	}
	/**
	 * 获取呼叫列表 
	 */
	function getRingList(){
		$ret = M("temp")
		->field("table_id,holding,hold_time,so_table.table_name")
		->join("LEFT JOIN so_table ON so_table.id=so_temp.table_id")
		->select();
		$ringList = array();
		//将数据库数据规范化
		foreach ($ret as $key => $value) {
			$ringList[$key]["table_name"] = $value["table_name"];
			$ringList[$key]["holding"] = object_array(json_decode($value["holding"]));
			$ringList[$key]["holdTime"] = date("Y-m-d H:i:s",$value["hold_time"]);
		}
		return $ringList;
	}
}

 ?>