<?php
namespace Pad\Model;
use Think\Model;
/**
  * 添加TP3.2支持，引入命名空间
  * 订单控制类~
  * 完成对订单的增、删、改、生成。
  */ 
Class OrderModel extends Model{
	/**
	 * 构造函数
	 */
	function __construct($uuid,$table_id,$menuId){
		/**
		 * 判断是否初始化了订单表，如果没有初始化，则进行初始化操作。
		 * 如果进行了初始化，则构造order和totalMoney
		 */
		//创建全局数据库模型
		$this->db_temp = M("temp");
		//设置全局变量
		$this->uuid = $uuid;
		$this->table_id = $table_id;
		if(!empty($menuId)) $this->menuId = $menuId;
		//全局查询条件
		$this->condition = array("uuid"=>$this->uuid,"table_id"=>$this->table_id);
		// dump($this->condition);
		$all = M("temp")->where($this->condition)->find();
		// dump(M('temp')->getlastsql());
		// dump($all);
		
		if($all){
			//如果能查询到temp表的信息，将订单和金额作为全局变量
			$this->order = object_array(json_decode($all["order"]));
			$this->totalMoney = $all["total_money"];
			$this->startTime = $all["start_time"];
		}
		//查不到订单信息，则重新初始化TEMP订单
		else self::InitOrder();

	}
	/**
	 * 初始化订单
	 */
	 function InitOrder(){
		//将桌号和uuid对应表置为锁定状态。然后初始化购物车
	 	$lock = array("is_lock"=>1);
	 	//锁定桌号
	 	$map["uuid"] = $this->uuid;
	 	$map["id"] = $this->table_id;
	 	if(empty($map["uuid"])||empty($map["id"])) return "error";
		M("table")->where($this->condition)->save($lock);
		$temp = $this->condition;
		$this->startTime =time();
		$temp["start_time"] = $this->startTime;
		//初始化temp表
 		if(M("temp")->where(array("table_id"=>$this->table_id))->add($temp)) return "success";
		else return "InitOrder Error";
	}
	/**
	 * 读取订单信息
	 * 如果存在已下订单，返回多维数组array('nowOrder'=>现在的订单，也就是TEMP表的订单,'alreadyOrder'=>订单表的订单信息)
	 * @author Mr.Xiao
	 */
	function getOrder(){
		//allOrder数组用于存放订单信息。
		$allOrder = array();
		$allOrder["alreadyOrder"] = array();
		$allOrder["nowOrder"] = array();
		$orderId = M("temp")->where($this->condition)->getField("order_id");
		if ($orderId!=0&&!is_array($orderId)) {
			$condition = array("oid"=>$orderId);
			$search = M("order")->where($condition)->find();
			$allOrder["alreadyOrder"] = object_array(json_decode($search["detail"]));
		}
		if(!empty($this->order)){
			$allOrder["nowOrder"] = $this->order;
		}
		// dump($allOrder);DIE;
		return $allOrder;
	}
	/**
	 * 增加订单
	 * 格式：json
	 * 增加成功返回：success 		更新失败返回：failed
	 * 2015-05-08 修改数组，加isUp(用于标示是否上菜)字段，默认为0。
	 */
	 function AddOrder($menuId,$num,$taste){
	 	// return $this->order;
	 	//如果订单信息为空。再次尝试初始化订单信息，并且返回错误结果。
	 	if(empty($this->startTime)) return "order is abnormal,Please try to init order!";
	 	$info = self::getInfoByMenuId($menuId);
	 	if(!empty($info)){
	 		$name = $info["name"];
	 		$price = $info["price"];
			$c_id = $info["c_id"];
	 	}
	 	// $taste = array_filter(explode("***", $taste));
		$dist = array("menuId"=>$menuId,"c_id"=>$c_id,"name"=>$name,"price"=>$price,"num"=>$num,"taste"=>$taste,"isUp"=>0);
	 	// dump($dist);die();
	 	$temp = $this->order;
	 	//为增加订单数计数
	 	$count = count($temp);
	 	$temp[] = $dist;
	 	$this->order = $temp;
	 	$data["order"] = json_encode($this->order);
	 	$this->db_temp->where($this->condition)->save($data);
	 	self::upTotalMoney();
	 	if($count!=count($this->order)) return "success";
	 	else return "failed";
	}
	/**
	 * 删除订单
	 * 删除成功返回：success，删除失败返回：failed	
	 * 通过对比前后数量不一样，判断删除是否成功
	 */
	 function DelOrder($menuId){
		$temp = $this->order;
		//判断menuId是否存在，如果存在则unset。
		$count = count($temp);
		foreach ($temp as $key => $value) {
			if ($value["menuId"]==$menuId){
				unset($temp[$key]);
			}
			else $undelorder[] = $value;
		}
		if($count==count($undelorder)) return "failed";
		else{
			$this->order = $undelorder;
			//入库
 			$data["order"] = json_encode($this->order);
			$this->db_temp->where($this->condition)->save($data);
			//更新总额
			self::upTotalMoney();
			return "success";
		}
	}
	/**
	 * 修改订单数量
	 */
	function ModifyOrder($menuId,$num,$taste){
		$taste = array_filter(explode("***", $taste));
		$temp = $this->order;
		//标志位，标示是否修改成功。最终为1则修改成功。
		$tag = 0;
		foreach ($temp as $key => $value) {
			if($value["menuId"]==$menuId){
				$tag = 1;
				$temp[$key]["num"] = $num;
				$temp[$key]["taste"] = $taste;

			}
		}
		if($tag==0) return "failed";
		else{
			$this->order = $temp;
			//更新订单表
			$data["order"] = json_encode($this->order);
			$this->db_temp->where($this->condition)->save($data);
			//更新总额
			self::upTotalMoney();
			return "success";
		}
	}
	/*
	 * 生成订单，最后结账的时候用到~
	 * 先入库订单表，然后删除temp表，再将桌号UUIE表解锁。
	 */
	function MakeOrder(){
		//入库订单表
		// return $this->order;
		if(empty($this->order)) return "order is empty!!";
		//判断是否存在未支付订单，并提醒。
		$beginTime = strtotime(date("Y-m-d"));
		// 去掉查询检索时间区间
		// $condit["order_time"] = array("between",array($beginTime,time()));
		$condit["is_pay"]=0;
		$condit["uuid"] = $this->uuid;
		$condit["table_id"] = $this->table_id;
		$search = M("order")->where($condit)->select();
		// return $search;
		$count = count($search);
		if($count==1) return "notPay";
		$orderTime = time();
		$data["total_money"] = $this->totalMoney;
		$data["detail"] = json_encode($this->order);
		$data["order_time"] = $orderTime;
		$data["table_id"] = $this->table_id;
		$data["uuid"] = $this->uuid;
		$orderId = M("order")->add($data);
		if($orderId) $success = 1;
		else return "failed";
		//删除temp表中的order，并且置orderId和下单时间
		$data = array("order"=>"",
					  "end_time"=>$orderTime,
					  "order_id"=>$orderId,
					  "total_money"=>0
					  );
		$this->db_temp->where($this->condition)->save($data);
		//返回订单信息
		$allOrder["order"] = $this->order;
		$allOrder["totalMoney"] = $this->totalMoney;
		$allOrder["orderTime"] = $orderTime;
		return $allOrder;
	}
	/**
	 * @author Mr.Xiao
	 * 追加订单。当提交订单后，想追加菜品的时候用到此方法。
	 * 应该保证一个PAD在开始到结束都是服务同一个桌子的。
	 * 2015-6-16 修改追加订单逻辑，追加订单的同一菜品数量不再叠加
	 */
	Public function extraOrder(){
		// dump($this->order);die;
		//先判断当前订单如果为空，直接返回nowOrder is empty！
		if(empty($this->order)) return "nowOrder is empty!";
		// return $this->condition;
		$orderId = $this->db_temp->where($this->condition)->getField("order_id");
		if($orderId==0) return "Please Make Order first";
		else if(is_array($orderId)) return "Order is abnormal";
		$condition = array("oid"=>$orderId);
		$search = M("order")->where($condition)->find();
		//订单信息编码。
		$originalMoney = $search["total_money"];
		//获取订单ID，为更新表做准备。
		$originalOrder = object_array(json_decode($search["detail"]));
		//更新订单信息(合并originalOrder和$this->order)
		$temp = $this->order;
		// return $temp;
		//增加现有的点菜
		foreach ($temp as $key => $value) {
			if (is_array($value)&&!empty($value)) {
				$originalOrder[] = $value;
			}
		}
		$nowAndAlready = $originalOrder;
		//更新总金额
		foreach ($nowAndAlready as $key => $value) {
			$allMoney = $allMoney + $value["num"]*$value["price"];
		}
		// return $allMoney;
		//更新订单表数据库
		$addTime = time();
		$saveExtraData["add_time"] = $addTime;
		$saveExtraData["detail"] = json_encode($nowAndAlready);
		$saveExtraData["total_money"] = $allMoney;
		$condition = array("oid"=>$orderId);
		// dump($saveExtraData);die;
		M("order")->where($condition)->save($saveExtraData);
		// return M("order")->getlastsql();
		//删除temp表数据
		$data = array("order"=>"","end_time"=>time(),"total_money"=>0);
		$this->db_temp->where($this->condition)->save($data);
		// $this->db_temp->where($this->condition)->delete();
		//返回订单信息
		$allOrder["order"] = $originalOrder;
		$allOrder["totalMoney"] = $allMoney;
		$allOrder["orderTime"] = $addTime;
		return $allOrder;
	}
	/**
	 * 获取订单总额
	 */
	Private function upTotalMoney(){
		$temp = $this->order;
		foreach ($temp as $key => $value) {
			$totalMoney = $totalMoney + $value["num"]*$value["price"];
		}
		$data["total_money"] = $totalMoney;
		$this->db_temp->where($this->condition)->save($data);
		return $totalMoney;
	}
	/**
	 * 获取菜品的名称和单价
	 */
	Private function getInfoByMenuId($menuId){
		$where = array("id"=>$menuId);
		$detail = M("cookmenu")->where($where)->find();
		$info["price"] = $detail["price"];
		$info["name"] = $detail["cookname"];
		$info["c_id"] = $detail["c_id"];
		return $info;
	}
	/**
	 * 添加上菜信息,
	 */
	Public function upDish($menuId){
		//得到已下订单
		$allOrder = self::getOrder();
		$alreadyOrder = $allOrder["alreadyOrder"];
		//置标志位为1
		$tag =0;
		foreach ($alreadyOrder as $key => $value) {
			if($value["menuId"]==$menuId&&$value["isUp"]==0) {
				$tag = 1;
				$alreadyOrder[$key]["isUp"] = 1;
			}
		}
		if($tag==0) return "menuId is not found";
		//入库
		$data["detail"] = json_encode($alreadyOrder);
		$ret = $this->db_temp->where($this->condition)->find();
		if($ret["order_id"] == 0) return "Please make order first!";
		$condition = array("oid"=>$ret["order_id"]);
	 	if(M("order")->where($condition)->save($data)) return "success";
	 	// else return "isUp has changed!";
	}
}
?>
