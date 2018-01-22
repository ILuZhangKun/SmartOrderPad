<?php
namespace Cash\Controller;
use Think\Controller;
	/**
	 * 预定模块控制
	 * 1、实现预定功能
	 * 2、取消预定功能
	 * 3、
	 *
	 */
Class BookController extends CommonController{
	Public function index(){
		//获得桌位预定情况
	 	$book = D("book");
	 	//'book_day' =>date("y-m-d") ,
	 	$condition = array('book_status' => "0" );
	 	$bookRes = $book->getBook($condition); 
	 	$res = $book->idToName($bookRes); 
		$this->assign("bookInfo",$res);
		//将座位列表显示到前台 
		$tableTree = D("table")->getTableInfo();   
		$this->assign("tableTree",$tableTree);
		$this->assign("meta_title","预约");
		$this->display("index");
	}
	//确定预定
	Public function makeBook(){   
		$data = array(  "book_day"=>I("RVday"),
						"book_time"=>I("bookHour"),
						"book_name"=>I("RVdname"),
						"book_num"=>I("RVnum"),
						"book_tel" =>I("RVtel"),
						"book_table" =>I("RVtable"),
						"book_demand"=>I("RVdemand"), 
						"book_status" => 0
					);  
		if(empty($bookStatus)) $condition["book_status"] = 0;
		$book = D("book");  
		$condition["book_day"]=I("RVday");
		$condition["book_table"]=I("RVtable");
		$result=$book->getBook($condition); 
		if($result==null){
			$Info = $book->doBook($data); 
			$this->index();
		}else{
			$this->error("该餐桌已被预订，请选择其他餐桌");
		} 
	}
	//查询预定
	Public function searchBook(){
		$data = array(  "book_day"=>I("RVday"), 
						"book_name"=>I("RVdname"), 
						"book_status" => 0
					);  
		$book = D("book"); 
		$result=$book->getBook($data); 
		if($result!=null){ 
		 	$res = $book->idToName($result); 
		 	$tableTree = D("table")->getTableInfo(); 
			$this->assign("bookInfo",$res);
			$this->assign("tableTree",$tableTree);
			$this->assign("meta_title","预约");
			$this->display("index");
		}else{
			$this->error("未找到该预定");
		}
	}
	//取消预订
	Public function cancelBook(){
		$data = array(  "book_day"=>I("date"), 
						"book_name"=>I("name"), 
						"book_time" => I("time") 
					); 
		$book = D("book"); 
		$result = $book->unBook($data);
		$this->ajaxReturn($result); 
	}

}
?>
