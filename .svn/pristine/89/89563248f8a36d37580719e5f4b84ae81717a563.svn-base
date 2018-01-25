<?php 
namespace Pad\Model;
use Think\Model;
/**
 * 添加TP3.2支持，引入命名空间
 * 数据同步模块
 */
Class SysDataModel extends Model{
	/**
	 * 构造函数,获取客户端版本
	 */
	function __construct($SysVersion){
		$this->SysVersion = $SysVersion;
		$this->SysVersion_Server = getConfig("SynVersion");
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
		//获取Server的IP地址，用于构建图片的URL。
		$serverIP = getConfig("ServerIP");
		// dump($serverIP);die;
		$condition["edit_time"] = array(between,array($this->SysVersion+1,$this->SysVersion_Server));
		$condition["is_delete"] = array(neq,1);
		$upData = M("cookmenu")->where($condition)
		->field("so_cookmenu.*,so_cookstyle.stylename")
		->join("so_cookstyle on so_cookstyle.id=so_cookmenu.styleid")
		->select();
		// return M("cookmenu")->getlastsql();
		//生成图片URL
		foreach ($upData as $key => $value) {
			$upData[$key]["picture"] = "http://".$serverIP.$value["picture"];
		}
		$ret = array("upData"=>$upData,"lastVersion"=>$this->SysVersion_Server);
		return $ret;
	}

}

 ?>