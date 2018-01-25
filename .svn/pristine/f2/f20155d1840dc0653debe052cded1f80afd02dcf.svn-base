<?php 
//ThinkPHP默认添加 
namespace Admin\Controller;
use Think\Controller;
/**
 * 菜品管理控制器，主要实现菜品的增删改查！
 */
Class MenuManageController extends AdminController{
	/**
	 * 主页模板视图
	 */ 
	Public function index(){
		$CookStyle=M("cookstyle")->select();
		$this->assign('meta_title',"菜系列表");
		$this->assign("CookStyle",$CookStyle)->display("index");
	} 
	/**
	 * 增加菜系类别
	 */
	Public function addCookStyle(){
		if(!IS_POST) {
			$this->assign("meta_title","新增菜系");
			$this->assign("CookStyle",$CookStyle)->display("addCookStyle");
		}
		else{
			// dump($_POST);
			$data["stylename"] = I("stylename");
			if(M("cookstyle")->add($data)) $this->success('添加成功',U('/MenuManage/index'));
			else $this->error("添加失败",U('/MenuManage/index'));
		}
	}


	/**
	 * 修改菜系
	 */
	Public function ModifyCookStyle(){

		if(IS_POST){
			$data = array("stylename"=>I("stylename"));
			$condition = array("id"=>I("styleid"));
			if(M("cookstyle")->where($condition)->save($data)) $this->success("修改成功！",U('/MenuManage/'));
			else $this->error("没有修改！",U('/MenuManage/'));
		}
		else if(IS_GET){
		if(I("styleid")=="") $this->error("通过点击修改按钮进行修改！",U('/MenuManage/'));
		$data = array("id"=>I("styleid"));
		$info = M("cookstyle")->where($data)->find();
		$this->assign("info",$info)->display("ModifyCookStyle");
		}
	}
	/**
	 * 删除菜系名称
	 */
	Public function DelCookStyle(){
		$data = array("styleid"=>I("id"));
		if(M("cookmenu")->where($data)->find()){
			// echo M("cookmenu")->getlastsql();
			$this->error("所属菜系下菜名不为空，不能删除！",U('/MenuManage/'));
		}
		else{
			$id = array("id"=>I("id"));
			M('cookstyle')->where($id)->delete();
			$this->success("删除成功！",U('/MenuManage/'));
		}
	}


/***************************************************************************************************
 *  							分割线：下边是对菜名的编辑修改函数
 ****************************************************************************************************/
	/**
	 * 添加菜名视图
	 */
	Public function CookMenu(){
		$this->assign('meta_title',"菜品信息");
		$condition["is_delete"] = array("neq",1);
		$cook = M("cookmenu")->field("cookname,stylename,so_cookmenu.id,price,standard,recommend")
		->join("so_cookstyle on so_cookmenu.styleid=so_cookstyle.id")
		->where($condition)->select();
		$this->assign("CookMenu",$cook)->display("cookmenu");
	}
	Public function listCookMenu(){
		$condition["is_delete"] = array("neq",1);
		$cook = M("cookmenu")->field("cookname,stylename,so_cookmenu.id,price,standard,recommend")
		->join("so_cookstyle on so_cookmenu.styleid=so_cookstyle.id")
		->where($condition)->select();
		$this->assign("CookMenu",$cook)->display("cookmenu");
	}
	/**
	 * 菜品名称入库
	 */
	Public function addCookMenu(){
		if(!IS_POST){
			$cookstyle = M("cookstyle")->select();
			$this->assign('meta_title',"添加菜品");
			$this->assign("CookStyle",$cookstyle)->display("addCookMenu");
		}
		else{
			// dump($_POST);
			// die;
			$time = time();
			$data["styleid"] = I("styleid");
			$data["cookname"] = I("cookname");
			$data["price"] = I("price");
			$data["standard"] = I("standard");
			$data["recommend"] = I("recommend");
			$data["introduce"] = I("introduce");
			$data["is_delete"] = 0;
			$data["edit_time"] = $time;
 			if(M("cookmenu")->add($data)) {
 				//添加版本时间戳，用于版本同步
 				SaveConfig("SynVersion",array("val"=>$time));
 				$this->success("添加成功",U('/MenuManage/CookMenu'));
 			}

			else $this->error("添加失败",U('/MenuManage/CookMenu'));
		}	
	}
	/**
	 * 修改菜品名称
	 */
	Public function ModifyCookMenu(){
		// dump($_GET);
		if(IS_POST){
			$condition = array("id"=>I("cookid"));
			$time = time();
			$data=array("styleid" => I("styleid"),
						"cookname"=>I("cookname"),
						"introduce"=>I("introduce"),
						"price"=>I("price"),
						"recommend"=>I("recommend"),
						"edit_time"=>$time,
						);
			// dump($data);
			// die;
			if(M("cookmenu")->where($condition)->save($data)) {
				//更新版本信息
 				SaveConfig("SynVersion",array("val"=>$time));
				$this->success("修改成功！",U('/MenuManage/cookmenu'));
			}
			else $this->error("没有修改!！",U('/MenuManage/cookmenu'));
		}
		else if(IS_GET){
		if(I("MenuId")=="") $this->error("通过点击修改按钮进行修改！",U('/MenuManage/CookMenu'));
			$data = array("id"=>I("MenuId"));
			$cookstyle = M("cookstyle")->select();
			$info = M("cookmenu")->where($data)->find();
			$this->assign("info",$info)->assign("CookStyle",$cookstyle)->display("ModifyCookMenu");
		}
	}
	Public function DelCookMenu(){
		if(!IS_GET) $this->error("非法操作",U('/MenuManage/cookmenu'));
		$id = array('id'=>I('id'));
		$data = array('is_delete'=>1,
					  'edit_time'=>time());
		if(M("cookmenu")->where($id)->save($data)) $this->success("删除成功！",U("/MenuManage/cookmenu"));

	}
	Public function upImage(){
		if(!I("id")) $this->error("请点击编辑图片，进行上传图片！",U('/MenuManage/cookmenu'));
		$conditon = array("id"=>I("id"));
		$info = M("cookmenu")->where($conditon)->find();
		$this->assign('info',$info)->display("upImage");
	}
    public function upload() { 
		if (!empty($_FILES)) { 
			//如果有文件上传 上传附件
			$id = I("id");
			$this->_upload($id);
		}
	}
	/**
	 * 文件上传
	 */
	protected function _upload($id) { 
        import("ORG.Net.UploadFile"); 
        $upload = new \UploadFile(); 
        //设置上传文件大小 
        $upload->maxSize = 3292200; 
        //设置上传文件类型 
        $upload->allowExts = explode(',', 'jpg,gif,png,jpeg');
        // $upload->rootPath =__ROOT__;  
        //设置附件上传目录 
        $upload->savePath = C("IMAGES"); 
        //设置需要生成缩略图，仅对图像文件有效 
        $upload->thumb = true; 
        // 设置引用图片类库包路径 
        // $upload->imageClassPath = '@.ORG.Image'; 
        //设置需要生成缩略图的文件后缀 
        $upload->thumbPrefix = 'm_';  //缩略图 
        //设置缩略图最大宽度 
        $upload->thumbMaxWidth = '400,200'; 
        //设置缩略图最大高度 
        $upload->thumbMaxHeight = '400,200'; 
        //设置上传文件规则 
        $upload->saveRule = uniqid;
        //删除原图 
        // $upload->thumbRemoveOrigin = true; 
        if (!$upload->upload()) { 
            //捕获上传异常 
            $this->error($upload->getErrorMsg()); 
        } 
        else { 
            //取得成功上传的文件信息 
            $uploadList = $upload->getUploadFileInfo(); 
            import('ORG.Util.Image');
            //给m_缩略图添加水印, Image::water('原文件名','水印图片地址') 
            //Image::water($uploadList[0]['savepath'].'m_'.$uploadList[0]['savename'], '/tp/Examples/File/Tpl/default/Public/Images/logo2.png');
            $_POST['image'] = $uploadList[0]['savename']; 
        } 
        // $baseurl = __ROOT__.C("IMAGES");
        // $imageUrl = substr($baseurl.$_POST['image'],1);
        $upUrl = substr(C("IMAGES"),1);
        $imageUrl = __ROOT__.$upUrl.$_POST['image'];
        $time = time();
		$data = array("picture"=>$imageUrl,"edit_time"=>$time);
		$id = array("id"=>$id);
		$up = M('cookmenu')->where($id)->save($data);
        if ($up !== false) {
        	//更新版本信息
        	$saveVersion = array("val"=>$time);
 			SaveConfig("SynVersion",$saveVersion);
            $this->success('上传图片成功！'); 
        } else { 
            $this->error('上传图片失败!'); 
        } 
    } 
/***************************************************************************************************
 *  							分割线：下边测试区
 ****************************************************************************************************/

	Public function test(){
		$this->display();
	}

}

 ?>