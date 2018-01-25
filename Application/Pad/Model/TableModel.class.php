<?php 
namespace Pad\Model;
use Think\Model;
/**
 * 添加TP3.2支持，引入命名空间
 * 选桌模块
 */
Class TableModel extends Model{
	/**
	 * 构造函数
	 */
	function __construct($uuId,$tableId){
		$this->uuId = $uuId;
		$this->tableId = $tableId;
	}
	/**
	 * 判断uuid和桌号是否已经绑定
	 * 确定可用返回success
	 * 不可用返回failed
	 */
	function IsTableSimple(){
		$condition = array("id"=>$this->tableId,"uuid"=>$this->uuId);
		$re = M("table")->where($condition)->find();
		if(empty($re)) return "success";
		else return "failed";
	}
	/**
	 * 绑定uuId和桌号,以桌号为准。
	 * 当冲突的时候，提示是否进行强制绑定。
	 */
	function SetTable(){
		$condition = array("id"=>$this->tableId);
		$ret = M("table")->where($condition)->find();

		$data = array("uuid"=>$this->uuId,"is_lock"=>1);
		
		// $is_condition = array("uuid"=>$this->uuId);
		// $is_ret = M("table")->where($condition)->find();
		//如果重复则更新UUID对应的tableId
		if($ret){
			if($ret["is_lock"]==0){
				if(M("table")->where($condition)->save($data)) return "绑定成功！";
				else return "与原有绑定相同！";
			}
			else return $this->tableId."桌,有订单，正处于锁定状态，请完成订单后重新绑定！";
		}
		// if($is_ret){
		// 	// return $this->tableId."桌,有订单，正处于锁定状态，请完成订单后重新绑定！";
		// 	return "已绑定当前桌，修改请先解绑";
		// }
		// else if($is_ret["is_lock"]==0){
		// 	if(M("table")->where($is_condition)->save($data)) return "绑定成功！";
		// 	else return "与原有绑定相同！";
		// }
	}
	/*
		解绑桌号
	*/
	function RemoveTable(){
		$condition = array("id"=>$this->tableId);
		$ret = M("table")->where($condition)->find();

		$is_condition = array("uuid"=>$this->uuId);
		$is_ret = M("table")->where($is_condition)->find();

		$data = array("uuid"=>"","is_lock"=>0);

		if($ret['uuid']==NULL && $ret['is_lock']==0)	return "该桌号已经解绑，无需再次解绑";
		else
		{
			if(M('table')->where($condition)->save($data)) return "解绑成功！";
			else return "无解绑权限";
		}
		// if($is_ret){
		// 	if($is_ret['is_lock']==1){
		// 		//解绑
		// 		if(M('table')->where($condition)->save($data)) return "解绑成功！";
		// 	}else return "无解绑权限";
		// }else return "未绑定";
	}


}
 ?>