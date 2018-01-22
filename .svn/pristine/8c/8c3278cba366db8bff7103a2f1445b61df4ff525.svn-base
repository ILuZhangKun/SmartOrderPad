<?php 
//ThinkPHP默认添加 
namespace Admin\Controller;
use Think\Controller;
/**
 * 用户管理控制器！主要完成用户的增删改！
 */
Class UserManageController extends AdminController{
	/**
	 * 主页制图
	 */
	Public function index(){ 
		$user = M("user")->select();
		//用于填充用户职位信息！
		$position = M("position")->select();
		foreach ($user as $key => $value) {
			foreach ($position as $k => $v) {
				// echo $value["Position"];
				if($v["id"]==$value["Position"]) $user[$key]["Position"]=$v["Position"];
			}
		} 
		$this->assign("user",$user)->display("index");
	} 
	/**
	 * 添加用户！
	 * 负责控制添加用户的视图、并且完成添加用户的操作。
	 */
	Public function AddUser(){
		if(!IS_POST){
			//获取职位信息，用于前台select选择！
			$position = M("position")->select();
			$this->assign("Position",$position)->display("AddUser");
		}
		else{
			// dump($_POST);
			//获取入库的数据！
			$data = array("UserName"=>I("UserName"),
						  "PassWord"=>md5(I("Password")),
						  "RealName"=>I("RealName"),
						  "WorkId"=>I("WorkId"),
						  "IdCardNum"=>I("IdCardNum"),
						  "Address"=>I("Address"),
						  "Position"=>I("Position")
						  );
			if(M("user")->add($data)) $this->success("添加成功！",U("/UserManage/index"));
			else $this->error("添加失败！",U("/UserManage/index"));
		}
	}
	/**
	 * 修改用户！
	 * 负责完成修改用户的视图填充、并且保存修改信息！
	 */
	Public function ModifyUser(){
		if(!IS_POST){
			if(I("id")=="") $this->error("请点击修改按钮修改用户信息！",U("/UserManage/index"));
			$position = M("position")->select();
			$condition = array("id"=>I("id"));
			$info = M("user")->where($condition)->find();
			// dump($info);
			$this->assign("info",$info)->assign("position",$position)->display("ModifyUser");
		}
		else{
			// dump($_POST);
			$condition = array("id"=>I("id"));
			$data = array("UserName"=>I("UserName"),
			  "RealName"=>I("RealName"),
			  "WorkId"=>I("WorkId"),
			  "IdCardNum"=>I("IdCardNum"),
			  "Address"=>I("Address"),
			  "Position"=>I("Position")
			  );
			if(M("user")->where($condition)->save($data)) $this->success("修改成功!",U("/UserManage/index"));
			else $this->error("没有修改!",U("/UserManage/index"));

		}
	}

	Public function ResetPassword(){
		if(!IS_POST){
			if(I("id")=="") $this->error("请点击修改按钮修改密码！",U("/UserManage/listUser"));
			$condition = array("id"=>I("id"));
			$info = M("user")->where($condition)->find();
			$this->assign("info",$info)->display("ResetPassword");
		}
		else{
			// dump($_POST); 
			$id = I("id");
			if(I("PassWord1")!=I("PassWord2")) 
			$this->error("您两次输入的密码不一致，请重新输入!",U("/UserManage/ResetPassword",array("id"=>$id)));
			$condition = array("id"=>I("id"));
			$data = array("PassWord"=>md5(I("PassWord1")));
			
			if(M("user")->where($condition)->save($data)) $this->success("修改成功!",U("/UserManage/listUser"));
			else $this->error("没有修改!",U("/UserManage/listUser"));
		}
	}
	Public function DelUser(){
		$id = I("id");
		// echo "111";
	}
	/**
	 * 用于显示用户日志信息！
	 * 
	 */
	Public function UserLog(){

	}

}	


 ?>