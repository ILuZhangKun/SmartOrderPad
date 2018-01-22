<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * Table管理
 * @author 
 */
class TableModel extends Model{
    /**
    *新增厅堂
    */
    Public function Add($condition,$db){
        //判断重复机制  
        if(M($db)->where($condition)->count()){ 
            return "error";
        } 
        else{
            $result = M($db)->add($condition);
            if($result) return $result;
        } 
        
    }
    
    /**
     * 获得层级关系
     */
    Public function GetDegree(){
        //获得hall信息
        $hallInfo=M("hall")->where()->select();
        // dump($hallInfo);die;
        // foreach ($hallInfo as $hallKey => $hallValue) {
        for($i=0;$i<count($hallInfo);$i++){
            $hallId=$hallInfo[$i]["id"];
            // $degreeInfo=$hallValue;
            $condition=array("hall_id"=>$hallId);
            $tableInfo = M("table")->where($condition)->field("id,table_name")->select();
            // dump($tableInfo);die;
            $temp=array();
            if(count($tableInfo)!=0){
                foreach ($tableInfo as $tableKey => $tableValue) { 
                    array_push($temp,$tableValue);
                }
                $hallInfo[$i]["table"]=$temp;
            } 
        }
        return($hallInfo);
    }
    /**
     * 修改大厅或者桌名
     * 
     */
    Public function Edit($type,$id,$name){
        //修改大厅或者桌名
        if($type!="table"&&$type!="hall") return "type错误";
        $condition = array("id"=>$id); 
        if($type=="table") $data= array("table_name"=>$name);
        else $data= array("name"=>$name);
        if(M($type)->where($condition)->save($data)){
            // dump(M($type)->getLastSql());
            return "success";
        } 
        else return "error"; 
        
    }
    /**
     * 删除大厅或者桌名
     * 
     */
    Public function Del($type,$id){
        if($type=="hall"){
            //判断该厅下面有没有座位，有就不能删。
            if(M("table")->where(array("hall_id"=>$id))->count()){
                return "false";
            }else{
                if(M("hall")->where()->delete($id)) return "success";
                else return"error";
            }
        }else{
            if(M("table")->where()->delete($id)) return "success";
                else return"error";
        }
    }

}
