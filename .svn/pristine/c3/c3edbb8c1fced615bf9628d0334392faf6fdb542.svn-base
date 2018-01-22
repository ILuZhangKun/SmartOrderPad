<?php 
namespace Pad\Model;
use Think\Model;
/**
 * 添加TP3.2支持，引入命名空间
 * 页面数据控制逻辑模块
 */
Class PageModel extends Model{
	function __construct($tableId,$uuId){
		$this->db_model = M("model");
		$this->db_page = M("page");
		$this->db_menu =M("cookmenu");
		//初始化推荐菜品
		$this->recommend = self::getInfo("推荐");
		//初始化普通菜品
		$this->allCook = self::getinfo("all");
	}
	/**
	 * 初始化页面信息
	 * STEP1:初始化推荐菜品页面信息
	 * STEP2:初始化普通菜品页面信息
	 * 将初始化的页面信息入库
	 */
	function initPage(){
		//allPage用于存放入库数据
		$allPage = array();
		//初始化推荐菜品信息
		$recommendModel = getConfig("recommendModel");
		$condition["modelName"] = $recommendModel;
		$recommendModelInfo = $this->db_model->where($condition)->find();
		//初始化普通菜品信息

		//菜品信息入库

	}
	/**
	 * 获取页面配置信息
	 */
	Public function getPage(){

	}


	/**
	 * 根据类型返回菜品MenuId、cookType、
	 */
	Private function getInfo($type){
		$condition = array("isDelete"=>array(neq,1));
		if($type != all) $condition["recommend"] = $type;
		return $this->db_menu->where($condition)
		->field("so_cookmenu.*,so_cookstyle.stylename")
		->join("so_cookstyle on so_cookstyle.id=so_cookmenu.styleid")
		->select();
	}
}
?>
