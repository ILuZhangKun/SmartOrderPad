<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台配置控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class ConfigController extends AdminController {
    Public function Department(){
        // dump(111);die;
        $model = new \Admin\Model\CategoryModel("department");
        $this->type = "department";
        $tree = $model->getTree(0,'id,title,pid');
        $this->assign('tree', $tree);
        C('_SYS_GET_CATEGORY_TREE_', true); //标记系统获取分类树模板
        $this->meta_title = '部门管理';
        $this->display("Config/department/category");
    }
    /**
     * 新增单位分类
     */
    Public function add($pid = 0){
        //接收处理类别的类型
        $type = I("type");
        $Category = new \Admin\Model\CategoryModel($type);
        if(IS_POST){ //提交表单
            $data = array(
            "id" => I("id"),
            "title" => I("title"),
            "pid" => I("pid"),
            );
            $data["status"] = 1;
            if(false !== $Category->update($data)){
                if($type == "department") $this->success('新增成功！', U('/Config/Department'));
                else {
                    $this->success('新增成功！', U('/Config/carType'));
                }
            }
            else {
                $error = $Category->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级分类信息 */
                $cate = $Category->info($pid, 'id,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }
            /* 获取分类信息 */
            $this->assign('category', $cate);
            $this->meta_title = '新增分类';
            $this->display('Config/'.$type.'/edit');
        }
    }
     /**
     * 删除一个分类
     * @author huajie <banhuajie@163.com>
     */
    public function remove(){
        // dump($_GET);DIE;
        if(I("type") == "department") $this->db = M("category");
        else $this->db = M("cartype");
        $cate_id = I('id');
        if(empty($cate_id)){
            $this->error('参数错误!');
        }

        //判断该分类下有没有子分类，有则不允许删除
        $child = $this->db->where(array('pid'=>$cate_id))->field('id')->select();
        if(!empty($child)){
            $this->error('请先删除该分类下的子分类');
        }

        //删除该分类信息
        $res = $this->db->delete($cate_id);
        if($res !== false){
            $this->success('删除分类成功！');
        }else{
            $this->error('删除分类失败！');
        }
    }
    /* 编辑分类 */
    Public function modify($pid = 0){
        //接收处理类别的类型
        $type = I("type");
        $Category = new \Admin\Model\CategoryModel($type);
        if(IS_POST){ //提交表单
            $data = array(
            "id" => I("id"),
            "title" => I("title"),
            "pid" => I("pid"),
            "tel_phone1" => I("tel_phone1"),
            "tel_phone2" => I("tel_phone2"),
            ); 
            $data["status"] = 1;
            if(false !== $Category->update($data)){
                if($type == "department") $this->success('修改成功！', U('/Config/Department'));
                else {
                    //更新fullname
                    self::upFullName();
                    $this->success('修改成功！', U('/Config/carType'));
                }
            }
            else {
                $error = $Category->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级分类信息 */
                $cate = $Category->info($pid); 
                // if( $cate && 1 == $cate['status'] ){
                     
                // }
            }
            /* 获取分类信息 */
            $this->assign('category', $cate);
            $this->meta_title = '修改分类';
            $this->display('Config/'.$type.'/modify');
        }
    }
    /* 编辑分类 */
    public function edit($id = null, $pid = 0){
        // dump($_POST);die;
        $type = I("type");
        if(empty($type)) $this->error("请求参数有误！");
        $Category = new \Admin\Model\CategoryModel($type);
        if(IS_POST){ //提交表单
            //编辑入库数据
            $data = array(
                "id"=>I("id"),
                "sort"=>I("sort"),
                "title"=>I("title"),
                );
            if(false !== $Category->update($data)){
                if($type == "carType") $this->success("编辑成功！",U("/Admin/System/carType"));
                else $this->success('编辑成功！');
            } else {
                $error = $Category->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级分类信息 */
                $cate = $Category->info($pid, 'id,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }
        }
    }

    /**
     * 移动分类
     * @author huajie <banhuajie@163.com>
     */
    public function move(){
        $to = I('post.to');
        $from = I('post.from');
        $res = M('Category')->where(array('id'=>$from))->setField('pid', $to);
        if($res !== false){
            $this->success('分类移动成功！', U('/Admin/Config/Department'));
        }else{
            $this->error('分类移动失败！');
        }
    }
    /**
     * 显示分类树，仅支持内部调
     * @param  array $tree 分类树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    Public function tree_department($tree = null){
        C('_SYS_GET_CATEGORY_TREE_') || $this->_empty();
        // dump($tree);die;
        $this->assign('tree', $tree);
        $this->display('Config/department/tree');
    }


/******************************************************************************************************
 *  @Mr.Xiao  车型管理模块
 ******************************************************************************************************/
    Public function CarType(){
        /**
         * 车型管理模块，用于对车型进行管理维护
         */
        $model = new \Admin\Model\CategoryModel("cartype");
        $type = "carType";
        $tree = $model->getTree(0,'id,title,pid,sort');
        $tree = self::upCarTreeSon($tree);
        // dump($tree);die;
        $this->assign('tree', $tree);
        C('_SYS_GET_CATEGORY_TREE_', true); //标记系统获取分类树模板
        $this->meta_title = '部门管理';
        $this->display("Config/carType/category");
    }

    
    Public function tree_carType($tree = null){
        C('_SYS_GET_CATEGORY_TREE_') || $this->_empty();
        $this->assign('tree', $tree);
        $this->display('Config/carType/tree');
    }
    /**
     * 处理cartype的full_name的格式。
     */
    Public function upFullName(){
        $carType = new \Admin\Model\CategoryModel("cartype") ;
        $carTree = $carType->getTree();
        foreach ($carTree as $key => $value) {
            foreach ($value["_"] as $k => $v) {
                foreach($v["_"] as $m=>$n){
                    $condition = array("id"=>$n["id"]);
                    $fullName = "[".$v["title"]."]--[".$n["title"]."]";
                    // dump($fullName);
                    $data = array("full_name"=>$fullName);
                    M("cartype")->where($condition)->save($data);
                    // dump($fullName);
                }
            }
        }
    }
    /**
     * [upCarTreeSon 更新Tree数组，添加is_son标志]
     * Powered By BJUT
     * @copyright [MrXiao]
     * @license   [@BJUT]
     * @version   [0.1]
     * @return    [array]   [description]
     */
    Public function upCarTreeSon($tree){
        foreach ($tree as $part => $son) {
            if (is_array($son["_"])) $tree[$part]["is_part"] = 1;
            $temp =& $tree[$part]["_"];
            foreach ($temp as $key => $value) {
                if(is_array($value["_"])) $temp[$key]["is_part"] = 1;
            }
        }
        return $tree;

    }

}