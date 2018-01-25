<?php 
namespace Pad\Controller;
use Think\Controller;
/**
 * 引入命名空间，3.2.3以后新加功能！
 * 桌号控制类
 **/
Class TableController extends Controller {
	/**
	 * 判断客户端传来的uuId
	 * 如果不重复，返回no
	 */
	Public function DealTable(){
		//接收参数
		$uuId = I("uuId");
		$tableId = I("tableId");
		$action = I("action");
		if(empty($uuId)||empty($tableId)) $this->ajaxReturn("Request Failed！","jsonp");
		$check = new \Pad\Model\TableModel($uuId,$tableId);
		switch ($action) {
			case 'check':
				//检测桌号是否可用
				$ret = $check->IsTableSimple();
				$this->ajaxReturn($ret,"jsonp");
				break;
			case 'set':
				//设置桌号
				$ret = $check->SetTable($uuId,$tableId);
				$this->ajaxReturn($ret,"jsonp");
				break;
			default:
				$this->ajaxReturn("请求参数有误",'jsonp');
				break;
		}
	}
	Public function getTableTree(){
		$table = new \Cash\Model\TableModel();
		$ret = $table->getTableInfo(date("Y-m-d"));
		// dump($ret);die;
		$this->ajaxReturn($ret,"jsonp");
	}
}

 ?>