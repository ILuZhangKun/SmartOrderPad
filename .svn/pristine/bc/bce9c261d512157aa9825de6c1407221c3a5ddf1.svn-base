<?php 
namespace Cash\Controller;
use Think\Controller;
/**
 * 订单控制器
 */
Class OrderController extends CommonController{
	Public function index(){ 
		//获得座位信息
		$tableTree = D("table")->getTableInfo(); 
		$holdInfo = D("order")->getHoldInfo(); 
		$longTime = D("order")->getLongTime(); 
		// dump();die;
		$this->assign('longTime',$longTime);
		$this->assign('holdInfo',$holdInfo);
		$this->assign("tableTree",$tableTree);
		$this->assign("meta_title","结账");  
		$this->display("index");
 
	}
	Public function getSearch(){ 
		$this->assign("meta_title","结账");  
		if(IS_GET){ 
			$table_id = I("tableid");
			if(empty($table_id)) $this->error("请输入桌号进行查询");
			$order = D("order");
			$orderInfo = $order->searchPay($table_id); 
			// dump($orderInfo);die;
			if($orderInfo!=null){
				$payInfo=json_decode($orderInfo[0]["detail"]); 
				//获取解析后的菜单信息
				$payItem = array();
				$totle=0;
				for($i=0;$i<count($payInfo);$i++){
					$payItem[$i]["id"]=$table_id;
					$payItem[$i]["name"]=$payInfo[$i]->name;
					$payItem[$i]["price"]=$payInfo[$i]->price;
					$payItem[$i]["num"]=$payInfo[$i]->num;
					$payItem[$i]["totle"]=$payItem[$i]["price"] * $payItem[$i]["num"];
					$totle+=$payItem[$i]["totle"];
				} 
				// dump($payItem);die;
				$this->assign("tableId",$table_id); 
				$this->assign("payInfo",$payItem); 
				$this->assign("totle",$totle);
			}
			 
		}else{
			dump("hahah");die;
		}
		$this->index();
	} 
	//结账
	Public function payBill(){
		$this->assign("meta_title","结账");
		$tableId = I("tableid"); 
		$payType = I("paytype");
		$realMoney = I("realMoney");
		$order = D("order");
		$res = $order->payOrder($tableId,$payType,$realMoney);
		 $this->ajaxReturn($res); 
	}

}
?>
