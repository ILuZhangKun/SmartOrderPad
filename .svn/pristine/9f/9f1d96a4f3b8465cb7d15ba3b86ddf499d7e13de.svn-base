<?php 
//ThinkPHP默认添加 
namespace Admin\Action;
use Think\Action;
/**
 * 菜品管理控制器，主要实现菜品的增删改查！
 */
Class SystemAction extends CommonAction{
	 Public function System(){
        $model = new \Admin\Model\TableModel("table");
        $this->type = "table";
        $tree = $model->getTree(0,'id,title,pid,sort');
        $this->assign('tree', $tree);
        C('_SYS_GET_CATEGORY_TREE_', true); //标记系统获取分类树模板
        $this->meta_title = '座位管理'; 
        $this->display("System/index");
    }
    /**
     * 显示分类树，仅支持内部调
     * @param  array $tree 分类树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    Public function tree_department($tree = null){
        // C('_SYS_GET_CATEGORY_TREE_') || $this->_empty();
        // dump($tree);die;
        $this->assign('tree', $tree);
        $this->display('System/tree');
    }
}

 ?>