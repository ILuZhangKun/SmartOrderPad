<?php 
namespace Cash\Controller;
use Think\Controller;
/**
 * 订单控制器
 */
Class OtherController extends CommonController{
	Public function index(){
		$this->searchIncome();
		// $order = new \Cash\Model\OrderModel();
		// $temp = $order->getAllOrder();
		// dump($temp);
	}
	Public function searchIncome(){
		$day = I("incomeDay");
		$day=$day==""?date("Y-m-d"):$day; 
		// dump($day);die;
		$start = strtotime($day);
		$end = strtotime("+1 day",$start); 
		$res = D("other")->searchIncome($start,$end);  
		// dump($res);die;
		$this->assign("meta_title","杂项");
		$this->assign("date",$day);
		$this->assign("result",$res);
		$this->display("index");
	}
}
?>
