<?php
//ThinkPHP默认添加
namespace Admin\Controller;
use Think\Controller;
use Think\Log;
/*
收银端管理模块
*/
Class CashController extends AdminController{
/*
主页模板视图
 */
   public function index(){
    $hall = M('table')->field("so_hall.id,count(hall_id),so_hall.name")->join("so_hall ON so_hall.id = so_table.hall_id")->group('hall_id')->select();//统计出每个大厅的空闲桌数
    // dump($table_count);die();
    $holdInfo = M('temp')->field("so_hall.name as hall_name,holding,hold_time,table_name")->join("so_table ON so_table.id = so_temp.table_id")->join("so_hall ON so_table.hall_id = so_hall.id")->where("so_temp.holding is not null")->order("hold_time asc")->select();
    //dump($holdInfo);
    for($i = 0;$i<count($holdInfo);$i++)
    {
      $holding_temp = object_array(json_decode($holdInfo[$i]["holding"]));
      $holdInfo[$i]["holding"] = implode(" ",$holding_temp);
      $holdInfo[$i]["hold_time"] = date("H:i:s",(int)$holdInfo[$i]["hold_time"]);
    }
    //dump($holdInfo);die();
    $this->assign("holdInfo",$holdInfo);
   	$this->assign("meta_title","收银端");
   	$this->assign("hall",$hall)->display("index");
   }
   public function tableList(){
   	$hid = I('hall_id');
   	$tableList = M('table')->where("hall_id = $hid")->select();
   	$this->assign("meta_title","桌号管理");   	
   	$this->assign("tableList",$tableList)->display("tableList");
   }
   public function pay_order(){
      $prefix=C('DB_PREFIX');
      $sql="SELECT o.*,t.table_name,h.id,h.name FROM {$prefix}order as o,{$prefix}table as t,{$prefix}hall as h WHERE o.table_id=t.id AND t.hall_id=h.id AND o.is_pay=1 ORDER BY oid ASC ";
      $order = M('')->query($sql);
      for($i = 0;$i<count($order);$i++)
      {
         $order[$i]['order_time']=date('Y-m-d H:i',$order[$i]['order_time']);
         $order[$i]['pay_time']=date('Y-m-d H:i',$order[$i]['pay_time']);
         $order[$i]['add_time']=date('Y-m-d H:i',$order[$i]['add_time']);
      }
      $hall=M('hall')->select();
      $this->assign("hall",$hall);
      $this->assign("meta_title","结账管理");
      $this->assign("order",$order)->display("ordered");  
   }

    public function nopay_order(){
      $prefix=C('DB_PREFIX');
      $sql="SELECT o.*,t.table_name,h.id,h.name FROM {$prefix}order as o,{$prefix}table as t,{$prefix}hall as h WHERE o.table_id=t.id AND t.hall_id=h.id AND o.is_pay=0 ORDER BY oid ASC ";
      $order = M('')->query($sql);
      for($i = 0;$i<count($order);$i++)
      {
         $order[$i]['order_time']=date('Y-m-d H:i',$order[$i]['order_time']);
         $order[$i]['pay_time']=date('Y-m-d H:i',$order[$i]['pay_time']);
         $order[$i]['add_time']=date('Y-m-d H:i',$order[$i]['add_time']);
      }
      $hall=M('hall')->select();
      $this->assign("hall",$hall);
      $this->assign("meta_title","结账管理");
      $this->assign("order",$order)->display("order");  
   }
   public function pay(){

       $data['pay_type'] = I('pay_type');
       $data['is_pay'] = '1';
       $data2['uuid'] = "";
       $data2['is_lock'] = "0";
       $oid = I('oid');
       $tid = I('tid');
       
       // dump($oid);die();
        //删除temp表，并更新order表；解除锁定
       M('temp')->where("table_id = $tid")->delete();
       // M('order')->where("oid = $oid")->save($data);
       M('table')->where("id = $tid")->save($data2);
       $data3 = array("is_pay"=>0,"syn_check"=>0);
       $syn_order = M('order')->where($data3)->select();
       dump($syn_order);die();
       //同步操作
       $message = "syn_check更新测试！".date("Y-m-d H:i:s",time());
       Log::Write($message);
       $cloud_ip = getConfig("cloud_ip");
       $syn_key = getConfig("synKey");
       //2、开始同步操作
       $syn_url="http://".trim($cloud_ip)."/Cloud/SynData/Order/synOrder";//生成同步URL
       Log::write("同步URL为：".$syn_url);
       $data4["syn_key"] = $syn_key; //构造同步数据
       $data4["syn_order"] = serialize($syn_order);
       //dump(curl_request($syn_url,$data4));die;
       $order_return = object_array(json_decode(curl_request($syn_url,$data4)));
       if($order_return["status"] == 1)
        //如果更新成功，同时修改本地服务器的数据
       {
           $data['syn_check'] = '1';
           $data['is_pay'] = '1';
           $data['pay_time']=time();
           if(M('order')->where($data3)->save($data))
           {
               Log::write("更新syn_check成功！");
               $this->success('结账成功!请稍后...');
           }
           else
           {
               Log::write("更新syn_check失败！");
           }
       }
       else
       {
          $this->error();
       }
   }
   public function orderList(){
      $oid = I('oid');
      $tid = I('tid');
       //判断是从桌号浏览还是从订单浏览
       if($oid == "") //从桌号点击查看
       {
           $orderList_all = M('order')->where("table_id = $tid AND is_pay = 0")->find();
           
           $orderList = M('order')->field("detail")->where("table_id = $tid AND is_pay = 0")->find();
       }
       else          //从订单表点击查看
       {
           $orderList_all = M('order')->where("oid = $oid")->find();
           $orderList = M('order')->field("detail")->where("oid = $oid")->find();
       }
      $orderList = json_decode($orderList['detail'],true);
      //dump($orderList);die;
      foreach ($orderList as $key => $value) {
        $orderList[$key]['total']=$value['price']*$value['num'];
      }

      $this->assign("total_money",$orderList_all['total_money']);
      $this->assign("oid",$oid);
      $this->assign("tid",$tid);
      $this->assign("meta_title","账单详情");
      $this->assign("orderList",$orderList)->display("orderList");
   }
   public function book(){
      $book = M('book')->select();
      $this->assign("meta_title","预约管理");
      $this->assign("book",$book)->display("book");
   }
   public function vip(){
      $member = M('member')->select();
      for($i = 0;$i<count($member);$i++)
      {
         $member[$i]['reg_time'] = date("Y-m-d H:i:s",$member[$i]['reg_time']);
         $member[$i]['last_login_time'] = date("Y-m-d H:i:s",$member[$i]['last_login_time']);
      }      
      $this->assign("meta_title","会员管理");
      $this->assign("member",$member)->display("member");
   }
   public function income(){
      $this->assign("meta_title","账务管理");
      $this->display("income");
   }
}
