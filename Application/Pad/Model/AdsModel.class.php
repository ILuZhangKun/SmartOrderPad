<?php 
namespace Pad\Model;
use Think\Model;
/**
 * 添加TP3.2支持，引入命名空间
 * 数据同步模块
 */
Class AdsModel extends Model{
	/**
	 * 构造函数,获取客户端版本
	 */
	function __construct($SysVersion){
		$this->SysVersion = $SysVersion;
		// dump($SysVersion);die;
		$this->SysVersion_Server = getConfig("adVersion");
		// dump($this->SysVersion_Server);die;
	}
	/**
	 * 判断客户端版本是否与服务端版本一致
	 * 相同==>1,不同==>0
	 */
	function IsSysVersionSame(){
		if($this->SysVersion_Server==$this->SysVersion) return "success";
		else {
		//返回变化了的菜单
		return self::getUpdateData();
		} 
	}
	//数组结构：updata：更新的数据；lastVersion:最新版本
	function getUpdateData(){
		$prefix = C('DB_PREFIX');
		//前缀是so__
		//获取Server的IP地址，用于构建图片的URL。
		$serverIP = getConfig("ServerIP");
		//dump($serverIP);die;
		$condition["edit_time"] = array(between,array($this->SysVersion+1,$this->SysVersion_Server));
		$condition["is_delete"] = array(neq,1);

		$SynVersion_Server_int = intval($this->SysVersion_Server);
		$SysVersion_int = intval($this->SysVersion);
		//dump($SysVersion_int);die;
		
		$sql = "SELECT a.adnum, a.starttime, a.endtime, a.adname, a.adtext, a.adremark, a.adpic, a.edit_time, a.adhref, a.adtitle, a.adtype, a.adshowcount, a.introduction, a.activity, a.address, a.phone, a.vehicle, a.detail FROM {$prefix}ads a WHERE $SysVersion_int < a.edit_time <= $SynVersion_Server_int";

		$upData = M("")->query($sql);
		// dump($upData);die;
		// return $ret;
		
		//生成图片URL
		/foreach ($upData as $key => $value) {
		 	$upData[$key]["picture"] = "http://".$serverIP.$value["picture"];
		 }
		$ret = array("upData"=>$upData,"lastVersion"=>$this->SysVersion_Server);
		// dump($ret);die;
		return $ret;
	}

}

 ?>
