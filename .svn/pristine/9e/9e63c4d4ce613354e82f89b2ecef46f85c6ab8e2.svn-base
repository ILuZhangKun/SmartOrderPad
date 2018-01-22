<?php
namespace Pad\Controller;
use Think\Controller;
/**
 * 引入命名空间，3.2.3以后新加功能！
 * 订单控制器
 */ 
Class OrderController extends Controller{
	/**
	 * 接收订单处理操作，总控函数
	 */
	Public function DealOrder(){
		$uuId = I("uuId");
		$tableId = I("tableId");
		$action = I("action");
		$menuId = I("menuId");
		$num = I("num"); 
		$taste = I("taste");
		$order = new \Pad\Model\OrderModel($uuId,$tableId);
		switch ($action) {
			case 'getOrder':
				$ret = $order->getOrder();
				// dump($ret);die;
				$this->ajaxReturn($ret,"jsonp");
				break;
			case 'Add':
				//添加订单操作
				if(empty($menuId)) $this->ajaxReturn("menuId is empty!");
				elseif (empty($num)) $this->ajaxReturn("num is empty!");
				else{
				$ret = $order->AddOrder($menuId,$num,$taste);
				// dump($ret);die;
				$this->ajaxReturn($ret,"jsonp");
				}
				break;
			case 'Del':
			//删除订单操作
				$ret = $order->DelOrder($menuId);
				$this->ajaxReturn($ret,"jsonp");
				break;
			case 'Modify':
			//修改订单
				$ret = $order->ModifyOrder($menuId,$num,$taste);
				// dump($ret);die;
				$this->ajaxReturn($ret,"jsonp");
				break;
			case 'Make':
			//生成订单
				$ret = $order->MakeOrder();
				// dump($ret);die;
				$this->ajaxReturn($ret,"jsonp");
				break;
			case 'Extra':
			//追加订单
				$ret = $order->extraOrder();
				// dump($ret); die;
				$this->ajaxReturn($ret,"jsonp");
				break;
			case 'upDish':
				if(empty($menuId)) $this->ajaxReturn("menuId is empty","jsonp");
				$ret = $order->upDish($menuId);
				// dump($ret);die;
				$this->ajaxReturn($ret,"jsonp");
				break;
			default:
			//返回错误信息
				$this->ajaxReturn("请求的Action不存在！","jsonp");
				break;
		}
	}
}
 ?>