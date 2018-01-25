<?php 
namespace Cash\Model;
use Think\Model;
	/**
	 * 
	 */
Class BookModel extends Model{
	//构造函数
	Public function __construct(){
		$this->dbBook = M("book");
	}
	/**
	 * [getBook description]
	 * Powered By BJUT
	 * @copyright [MrXiao]
	 * @license   [@BJUT]
	 * @version   [0.1]
	 * @return    [array]   [已经预定的餐桌]
	 */
	Public function getBook($condition){
		self::changeStatus();
		$result = $this->dbBook->where($condition)->select();
		// dump($this->dbBook->getLastSql()); 
		return $result; 
	}
	/**
	*由tableId得到tableName全称。
	*/
	Public function idToName($result){
		for ($i=0; $i <count($result) ; $i++) { 
			 $tableId=$result[$i]["book_table"]; 
			 $table = M("table")->where(array("id"=>$tableId))->select();
			 $tableName=$table[0]["table_name"];
			 $hall = M("hall")->where(array("id"=>$table[0]["hall_id"]))->select();
			 $hallName = $hall[0]["name"];
			 $result[$i]["table"] = $hallName." ".$tableName; 
		}
		return $result;
	}
	/**
	 * [doOUTofDate description]
	 * Powered By BJUT
	 * 在检索已经预定的餐桌之前执行
	 * @copyright [MrXiao]
	 * @license   [@BJUT]
	 * @version   [0.1]
	 * @return    [none]   [当等待时间大于预定时间的时候，执行恢复正常状态]
	 */
	Public function changeStatus(){
		/*
		*6:00-10:00是早饭吧，10:00到15:00是午饭，16：00-凌晨是晚饭。
		*/
		$today = Date("Y")."-".Date("m")."-".Date("d");
		$Day = Date("d")-1;
		$yesterday = Date("Y")."-".Date("m")."-". $Day;

		$condition = array("book_status" => 0);
		//数据库选择status=0的预定（没有来但是还没过期的预定）
		$bookInfo=$this->dbBook->where($condition)->select(); 
		for($i=0;$i<count($bookInfo);$i++){
			$deadline=$bookInfo[$i]["book_day"];
			if($deadline==$yesterday){
				//昨天的预定过期
				$con = array("id"=>$bookInfo[$i]["id"]);
				$data=$bookInfo[$i];
				$data["book_status"]=2;
				$this->dbBook->where($con)->save($data);
			} 
		}
	}
	/**
	 * [doBook description]
	 * Powered By BJUT
	 * 执行预定功能
	 * @copyright [MrXiao]
	 * @license   [@BJUT]
	 * @version   [0.1]
	 * @return    [error/success]   [返回成功或者失败][失败原因可能是已经预定]
	 */
	Public function doBook($data){ 
		if($this->dbBook->add($data)) return "success";
		else return "failed";
	}
	/**
	 * [unBook description]
	 * Powered By BJUT
	 * 取消预定功能
	 * @copyright [MrXiao]
	 * @license   [@BJUT]
	 * @version   [0.1]
	 * @return    [error/success]   [description]
	 */
	Public function unBook($condition){  
		$data=array("book_status"=>3); 
		$result=$this->dbBook->where($condition)->save($data); 
		if($result!=null){ 
			return "success";
		} 
		else return "failed"; 
	}
	
}

 ?>