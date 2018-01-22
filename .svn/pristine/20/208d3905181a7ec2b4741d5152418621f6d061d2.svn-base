<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------s

namespace Admin\Controller;
use Think\Controller;
/**
 * 桌号管理控制器
 * @author Mr.Xiao
 */
Class TableController extends AdminController{
	/**
	 * 列出桌号信息
	 */
	Public function index(){
		//显示层级关系
		$result = D("table")->GetDegree();
    	$this->assign("degreeInfo",$result);
    	$this->assign('meta_title',"桌号设置"); 
		$this->display("index");
	}
	/**
	 * 新增桌号
	 */
	Public function add(){
		if(IS_POST){
			$status = I("status");
			// dump($_POST);DIE;
			if($status=="hall"){ 
				if($_POST["hall"]=="") $this->error("厅堂名称不能为空"); 
				$condition = array("name"=>I("hall"));
				$result = D("Table")->Add($condition,$status);
				if($result!="error") $this->success("厅堂添加成功！",U("Table/index"));
				else $this->error("添加失败！请输入其他厅堂名称！");
			}
			if($status=="table"){
				$tableName=I("table_name");
				$hallId = I("hall_id");
				$condition = array("table_name" => $tableName,
								 "hall_id" => $hallId
							 );  
				$result=D("Table")->Add($condition,$status);
				$this->ajaxReturn($result,"JSON");
			}
		}
		else{
			$this->assign("meta_title","新增厅堂");
			$this->display("add");
		} 
	} 
    /**
     * 修改大厅桌名
     */
    Public function edit(){
    	$type = I("type"); 
    	if($type!="table"&&$type!="hall") $this->ajaxReturn("修改类型错误！"); 
    	$ret = D("Table")->Edit($type,I("id"),I("name"));
    	 $this->ajaxReturn($ret); 
    }
    /**
     * 删除大厅桌名
     */
    Public function del(){
    	$type = I("type");
    	// dump(I("id"));
    	if($type!="table"&&$type!="hall") $this->ajaxReturn("删除类型错误！"); 
    	$ret = D("Table")->Del($type,I("id"));
    	
    	if($ret == "success") {
			$this->success('删除成功！');
        }else if($ret == "false"){
            $this->error('请先删除该分类下的子分类');
        } else{
        	$this->error('删除失败！');
        }
    }
}