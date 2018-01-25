<?php 
namespace Pad\Controller;
use Think\Controller;
/**
 * 引入命名空间，3.2.3以后新加功能！
 * 呼叫控制
 */
Class RingController extends Controller{
	Public function dealRing(){
		$action = I("action");
		$uuId = I("uuId");
		$tableId = I("tableId");
		$ringType = I("ringType");
		$ring = new \Pad\Model\RingModel($ringType,$uuId,$tableId);
		switch ($action) {
			case 'addRing':
				$ret = $ring->addRing($tableId,$ringType);
				$this->ajaxReturn($ret,"jsonp");
				break;
			case 'delRing':
				$ret = $ring->delRing($tableId);
				$this->ajaxReturn($ret,"jsonp");
				break;
			case 'getRingList':
				$ret = $ring->getRingList();
				dump($ret);die;
				$this->ajaxReturn($ret,"jsonp");
				break;
			default:
				$this->ajaxReturn("请求参数不合法！","jsonp");
				break;
		}
	}


}
?>