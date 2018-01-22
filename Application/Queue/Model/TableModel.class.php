<?php
namespace Cash\Model;
use Think\Model;
	/**
	 * 预定模块控制
	 * 1、实现预定功能
	 * 2、取消预定功能
	 * 3、
	 *
	 */
Class TableModel extends Model{
	//构造函数
	Public function __construct(){
		$this->db = M("table");
	}
	/**
	 * [getTableInfo description]
	 * Powered By BJUT
	 * @copyright [MrXiao]
	 * @license   [@BJUT]
	 * @version   [0.1]
	 * @return    [array]   
	 */
	Public function getTableInfo($date){
		$tableModel = new \Admin\Model\TableModel();
		$tableInfo = $tableModel ->GetDegree();  
		// dump($tableInfo);die;
		for ($i=0; $i <count($tableInfo); $i++) { 
			for ($j=0; $j <count($tableInfo[$i]["table"]) ; $j++) { 
				$id=$tableInfo[$i]["table"][$j]["id"];
				//查询检测该桌号是否被预定
				$conBook = array("book_table"=>$id,"book_status"=>0,"book_day"=>$date);
				$book=M("book")->where($conBook)->field("book_day,book_time,book_name")->select();
				// dump(M("book")->getLastSql());
				//获得预订信息
				if($book!=null){
					$tableInfo[$i]["table"][$j]["type"]="book";
					foreach ($book as $key => $value) {
						$bookInfo = $value["book_day"]."-".$value["book_name"]."预定".$value["book_time"];
						$tableInfo[$i]["table"][$j]["info"].=" ".$bookInfo;
					}  
				}
				//查询检测是否被锁定
				$conTable = array("id"=>$id,"is_lock"=>"1");
				if(M("table")->where($conTable)->count()) {
					// if($date==date("Y-m-d"))
					// 这里为什么要加日期判断???
					$tableInfo[$i]["table"][$j]["type"]="lock";
				}
				if($tableInfo[$i]["table"][$j]["type"]==null) $tableInfo[$i]["table"][$j]["type"]="nomal";
			}
		}
		return($tableInfo);
	}
	 
}
?>