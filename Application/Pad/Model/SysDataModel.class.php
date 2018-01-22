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
		// dump($SysVersion);die;
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
			
		//// $upData = M("cookmenu")->where($condition)
		//$upData = M("cookmenu")->where("so_cookmenu.edit_time>{$this->SysVersion} AND so_cookmenu.edit_time<={$this->SysVersion_Server}") 
		//// ->field("so_cookmenu.*,so_cookstyle.stylename")
		//->field("so_cookmenu.id,so_cookmenu.cookname,so_cookmenu.introduce,so_cookmenu.price,so_cookmenu.standard,so_cookmenu.picture,so_cookstyle.stylename,so_cookmenu.is_delete")
		//->join("so_cookstyle on so_cookstyle.c_id=so_cookmenu.styleid")
		//// ->where()
		//->select();
		//// return M("cookmenu")->getlastsql();

		$sql = "SELECT cm.id, cm.cookname, cm.introduce, cm.price, cm.standard, cm.picture, cm.edit_time, cs.stylename, cs.is_delete FROM {$prefix}cookmenu cm INNER JOIN {$prefix}cookstyle cs ON cm.styleid = cs.c_id  WHERE $SysVersion_int < cm.edit_time <= $SynVersion_Server_int";
		$upData = M("")->query($sql);
		//dump($sql);dump($upData);die;
		// dump($upData);die;
		// return $ret;
		
		//生成图片URL
		foreach ($upData as $key => $value) {
			$upData[$key]["picture"] = "http://".$serverIP.$value["picture"];
		}
		$ret = array("upData"=>$upData,"lastVersion"=>$this->SysVersion_Server);
		// dump($ret);die;
		return $ret;
	}

}

 ?>
