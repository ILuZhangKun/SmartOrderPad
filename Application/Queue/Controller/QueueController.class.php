<?php
namespace Queue\Controller;
use Think\Controller;
	/**
	 * 排队控制
	 * 1、排队信息录入
	 * 2、获取当前空桌
	 *
	 */
Class QueueController extends Controller{

	/**
	 * 加载主页
	 */
	Public function index(){
		$date=time();
		$m=date('Y-m-d',$date);
		$sqltime="select begin_time from so_queue order by begin_time asc limit 1";
		$prvtime=M('queue')->query($sqltime);
		$n=date('Y-m-d',$prvtime[0]['begin_time']);
		if($m==$n)
		{
			$this->display("Index/index");
		}
		else{
			$sql='TRUNCATE so_queue';
			$i=M("queue")->execute($sql);
			if($i==0)
			$this->display("Index/index");
		}
	}

	/**
	 * 调用index页面中的iframe，展示其中页面。
	 */
	public function ifindex(){
		$h = M('table');
		$arr = $h->field('id,table_name')->select();
		$this->display("Queue/index");
	}
	
	/**
	 * 获取桌面布局
	 */
	public function getTableDisplay(){
	  $sql = "SELECT t.id, concat(h.name,t.table_name) as name, t.is_leave, t.num FROM so_table t LEFT JOIN so_hall h on h.id = t.hall_id order by num asc,hall_id asc,t.id asc";
	  $ret = M("")->query($sql);
	  $tmp = M("")->query("select distinct num from so_table order by num asc");//存放餐桌类型，如：有2,4,6,8
	  $table = array();
	  if(!empty($tmp)){
	   foreach ($tmp as $key => $value) {
	    $table[$value["num"]] = array();  //为数据分类，将一维数组变为按餐桌类型分类的二维数组
	   }
	  }
	  foreach ($table as $key => $value) {
	   foreach ($ret as $id => $val) {
	    if($key == $val["num"]) $table[$key][] = $val;
	    }
	  }
	  //dump($table);die;
	  $this->ajaxReturn($table);
	 }

	/**
	 * 获取全局的空桌信息，按照几人桌的方式返回。
	 * 主要是用于填充Tab上的圆形红色提醒标志
	 */
	public function getGlobalEmptyTables(){
		$sql = "SELECT count(*) as empty_tables , num FROM so_table where is_leave = 1 group by num";
		$ret = M()->query($sql);
		$table = array();
		foreach ($ret as $key => $value) {
			$table[$value["num"]] = $value["empty_tables"];
		}
		// dump($table);
		$this->ajaxReturn($table);
	}

	/**
  * 获取桌面布局（二维数组）
  */
	 public function getTableDisplayTwo(){

	  // $sql = "SELECT t.id, concat(h.name,t.table_name) as name, t.is_leave FROM so_table t LEFT JOIN so_hall h on h.id = t.hall_id order by hall_id asc,t.id asc";
	  $sql = "SELECT t.id, concat(h.name,t.table_name) as name, t.is_leave, t.num FROM so_table t LEFT JOIN so_hall h on h.id = t.hall_id order by num asc,hall_id asc,t.id asc";
	  $ret = M("")->query($sql);
	  // dump($ret);die;
	  $this->ajaxReturn($ret);
	 }

 
	/**
	 * 根据几人桌获取空桌信息，填充前台每个tab下的内容。
	 */
	public function getEmptyTableByNum(){
		$num = I("num");
		if($num == null || $num =="") $this->ajaxReturn("num is error");
		else{
			$sql = "select t.id,concat(h.name,t.table_name) as name from so_table t left join so_hall h on h.id = t.hall_id  where t.is_leave = 1 and num = {$num} order by t.leave_time asc";
			$getEmptyTableByNum = M()->query($sql);
			$ac  = count($getEmptyTableByNum);
			$this->assign('getEmptyTableByNum', $getEmptyTableByNum);
			$this->display("Queue/index");
			$this->ajaxReturn($ret);
		}
	}
	/**
	 * 获取当前排队对列
	 */
	public function getQueue(){
		$sql = "select * from so_queue order by num asc, begin_time asc ";
		$ret = M("")->query($sql);
		foreach ($ret as $id => $user) {
			$que[$user["num"]] = array();
		}
		foreach ($ret as $id => $user) {
			foreach ($que as $key => $value) {
				if($user["num"] == $key) $que[$key][]=$user;
			}
		}
		$this->ajaxReturn($que);
	}

	/**
	 * 根据餐桌类型，对每类餐桌下等待排队的客户信息进行罗列。
	 */
	public function getQueueByNum(){
		$num  = I("num");
		if($num == null || $num == "")  $this->ajaxReturn("请填入用餐人数！");
		$sql = "select * from so_queue where num = {$num} order by num asc, begin_time asc ";
		$getQueueByNum = M("queue")->query($sql);
		$this->assign('getQueueByNum',$getQueueByNum);
		// dump($getQueueByNum);die;
		$this->display("Queue/index");
		$this->ajaxReturn($getQueueByNum);
	}


	/**
	 * 插入客户信息到排队队列。
	 */
	public function insertQueue(){
		// $name = I("name");
		$num  = I("num");
		$tel  = I("tel");
		$map['tel']=$tel;
		$map['num']=$num;
		$judgeTel=M("queue")->where($map)->find();
		//dump($judgeTel);
		if($judgeTel==null)
		{
		if($num == null || $num == "")  $this->ajaxReturn("请填入用餐人数！");
		else{
			$data = array(
				'num' =>$num,  
				'tel' =>$tel,
				'begin_time' =>time()
			);
			if(M("queue")->add($data)) $this->ajaxReturn("添加成功！");
		}
		}
		else $this->ajaxReturn("已有该顾客排号！");
	}

	/**
	 * 删除排队信息
	 */
	public function delQueue(){
		$sql = "select * from so_queue";
		$queueNull = M("queue")->query($sql);
		if (count($queueNull) == 1) {
			$queueNull = M()->execute("TRUNCATE TABLE so_queue");
		}
		else{
			$id = I("id");
			if($id == "" || $id == null) $this->ajaxReturn("请输入正确的ID"); 
			else{
				if(M("Queue")->where("id=$id")->delete()) $this->ajaxReturn("删除成功");
			}
		}
	}

	/**
	 * 分配桌子
	 * 上桌，即：将空桌分配给第一个等待排队的客户，且该客户不过号。
	 */
	public function upTable(){
		//is_leave = 0 leave_time清空
		$id = I("id");
		if($id == "" || $id == null) $this->ajaxReturn("请输入正确的ID");
		$sql = "select num from so_table where id = {$id}";
		$num = M()->query($sql);
		$num = $num[0]["num"];
		$data["is_leave"] = 0;				//is_leave置为0，说明改桌已经被占用
		$data["leave_time"] = "";
		M("table")->where(array("id"=>$id))->save($data);
		$this->ajaxReturn("上桌成功");
		// if(M("table")->where(array("id"=>$id))->save($data)){
		// 	//删除最近的排队信息
		// 	$sql = "SELECT id FROM so_queue WHERE num = {$num} ORDER BY begin_time ASC limit 1";
		// 	$id  = M()->query($sql);
		// 	if(!empty($id[0])) $id  = $id[0]["id"];
		// 	else $this->ajaxReturn("队列中没有用户");
		// 	$ret = M()->execute("delete from so_queue where id = {$id}");
		// 	$this->ajaxReturn("上桌成功");

		// }
	}


	public function GlobalTable(){
		$sql = "SELECT t.id, concat(h.name,t.table_name) as name, t.is_leave FROM so_table t LEFT JOIN so_hall h on h.id = t.hall_id order by hall_id asc,t.id asc";
  			$ret = M("")->query($sql);
  			$this->ajaxReturn($ret);
	}

	/**
	 *发送短信
	 */

	public function sendMsg(){
		$a=time();
		$b=date("Ymd",$a);
        Vendor('Alidayu.Sendmsg','','.class.php');
        $config=C('DYSMS');
        $keyid=$config['ALIMS_APPKEY'];
        $secretkey=$config['ALIMS_APPSECRET'];
        $demo = new \SmsDemo(
            $keyid,// $config['alims_appkey'],
            $secretkey//$config['alims_appsecret']
        );

        $id = I("id");
		if($id == "" || $id == null) $this->ajaxReturn("请输入正确的ID"); 
		else{
			$arr=M("Queue")->where("id=$id")->find();
			$mobile=$arr['tel'];
			$num=$arr['id'];
			//dump($arr['tel']);
		}
        $time='5';
        if(preg_match("/^1[34578]\d{9}$/", $mobile)){
            //echo "SmsDemo::sendSms\n";
            $response = $demo->sendSms(
                $config['SIGNNAME'], // 短信签名
                $config['NOTICE_TEMPLATEID'], // 短信模板编号
                $mobile, // 短信接收者
                Array(  // 短信模板中字段的值
                    "num"=>$num,
                    "time"=>$time,
                ),
                "123"         //待改
            );
			//$this->ajaxReturn("发送成功");
            //print_r($response);
            //echo "SmsDemo::queryDetails\n";
            $response = $demo->queryDetails(
                $mobile,  // phoneNumbers 电话号码
                $b, // sendDate 发送时间        
                10, // pageSize 分页大小
                1 // currentPage 当前页码
                // "abcd" // bizId 短信发送流水号，选填
            );
            //print_r($response);
			 
        }
        else{
            echo"手机号码错误！";
        }
    }

}
?>
