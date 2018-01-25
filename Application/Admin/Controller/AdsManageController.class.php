<?php 
//ThinkPHP默认添加
namespace Admin\Controller;
use Think\Controller;
/**
 * 广告控制器，主要实现广告消息的管理功能
 */
Class AdsManageController extends AdminController{
	/**
	 * 主页模板视图
	 */
	public function index(){
		$date = date("Y-m-d");
		$ltdate['endtime']  = array('lt',$date);
		$ltdata['is_delete'] = 1;
		M("ads")->where($ltdate)->save($ltdata);
		$gtdate['endtime']  = array('gt',$date);
		$gtdata['is_delete'] = 0;
		M("ads")->where($gtdate)->save($gtdata);
		$Ads_list = M("ads")->select();
		$this->assign("meta_title","广告内容列表");
		$this->assign("list",$Ads_list)->display("list");
	}

	public function edit(){
		if(!$_POST['typename'])
		{
			$this->assign("meta_title","修改广告类型");
			$typenum = I("typenum");
			$user = M("ads_type")->where("typenum = $typenum")->find();
			$typename=$user['typename'];
			$this->assign("typenum",$typenum);
			$this->assign("typename",$typename);			
			$this->display("edit");
		}
		else
		{
			$this->assign("meta_title","修改广告类型");			 
			$data['typenum'] = I("typenum");
			$data['typename'] = I("typename");
			$user = M('ads_type')->data($data)->save();
			$this->success('修改成功！',U('index'));
		}
		
	}

	public function del(){
		$typenum = I("typenum");
		$user = M('ads_type')->where("typenum = $typenum")->delete();
		$this->success("删除成功！",U('index'));
	}

	public function add(){		
		if(!IS_POST){
			$this->assign("meta_title","新增广告类型");
			$this->display("add");
		}
		else{
			$data["typename"] = I("typename");
			if($data['typename']=='')
			echo "<script>alert('类型名不能为空');window.location='add.html'</script>";
			else{
			if(M("ads_type")->add($data)) $this->success('添加成功',U('index'));
			else $this->error("添加失败",U('index'));
		}
		}
	}

	public function adslist(){
		$date = date("Y-m-d");
		$ltdate['endtime']  = array('lt',$date);
		$ltdata['is_delete'] = 1;
		M("ads")->where($ltdate)->save($ltdata);
		$gtdate['endtime']  = array('gt',$date);
		$gtdata['is_delete'] = 0;
		M("ads")->where($gtdate)->save($gtdata);
		$Ads_list = M("ads")->where()->select();
		$this->assign("meta_title","广告内容列表");
		$this->assign("list",$Ads_list)->display("list");
	}

	public function adsadd(){
	import("Org.Net.UploadFile"); 
        $upload = new \UploadFile(); 
        //设置上传文件大小 
        $upload->maxSize = 3292200; 
        //设置上传文件类型 
        $upload->allowExts = explode(',', 'jpg,gif,png,jpeg');
        // $upload->rootPath =__ROOT__;  
        //设置附件上传目录 
        $upload->savePath = C("IMAGES"); 
        //设置需要生成缩略图，仅对图像文件有效 
        // $upload->thumb = true; 
        // 设置引用图片类库包路径 
        // $upload->imageClassPath = '@.ORG.Image'; 
        //设置需要生成缩略图的文件后缀 
        // $upload->thumbPrefix = 'm_';  //缩略图 
        //设置缩略图最大宽度 
        // $upload->thumbMaxWidth = '400,200'; 
        //设置缩略图最大高度 
        // $upload->thumbMaxHeight = '400,200'; 
        //设置上传文件规则 
        $upload->saveRule = uniqid;
        //删除原图 
        // $upload->thumbRemoveOrigin = true; 
        // dump($upload);die;
        
		if(!IS_POST){
			$this->assign("meta_title","新增广告");
			$this->display("adsadd");
		}
		else{
			if(!$upload->upload()){ 
	            //捕获上传异常 
	            $this->error($upload->getErrorMsg()); 
       		} 
        	else{ 
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
        // dump($upload);die;
        $imageUrl = __ROOT__.$upUrl.$_POST['image'];
        // dump($imageUrl);die;
        //$time = time();
		//$data = array("picture"=>$imageUrl,"edit_time"=>$time);
		// dump($data);die;
		//$id = array("id"=>$id);
		// dump($id);die;
		//$up = M('cookmenu')->where($id)->save($data);
		// dump($up);die;
		// dump($imageUrl);die;
    //     if ($up !== false) {
    //     	//更新版本信息
    //     	// $saveVersion = array("val"=>$time);
 			// // SaveConfig("SynVersion",$saveVersion);	//这里用的是菜单图片的上传函数，所以不用更新版本信息
 			// echo chenggong;
    //         // $this->success('上传图片成功！'); 
    //     } else { 
    //         $this->error('上传图片失败!'); 
    //     }

			$data["starttime"] = I("starttime");
			$data["endtime"] = I("endtime");
			$data["adname"] = I("adname");
			$data["adtext"] = I("adtext");
			$data["adremark"] = I("adremark");
			$data["adpic"] = $imageUrl;
			$data["adhref"] = I("adhref");
			$data["adtitle"] = I("adtitle");
			$data["adtype"] = I("adtype");
			$data["adshowcount"] = I("adshowcount");
			$data["introduction"] = I("introduction");
			$data["activity"] = I("activity");
			$data["address"] = I("address");
			$data["phone"] = I("phone");
			$data["vehicle"] = I("vehicle");
			$data["detail"] = I("detail");
			$data["edit_time"] = time();
			SaveConfig("adVersion",array("val"=>$data["edit_time"]));
			if(M("ads")->add($data)) $this->success('添加成功',U('adslist'));
			else $this->error("添加失败",U('adslist'));
		}
	}

	public function adsedit(){
	import("Org.Net.UploadFile"); 
        $upload = new \UploadFile(); 
        //设置上传文件大小 
        $upload->maxSize = 3292200; 
        //设置上传文件类型 
        $upload->allowExts = explode(',', 'jpg,gif,png,jpeg');
        // $upload->rootPath =__ROOT__;  
        //设置附件上传目录 
        $upload->savePath = C("IMAGES"); 
        //设置需要生成缩略图，仅对图像文件有效 
        // $upload->thumb = true; 
        // 设置引用图片类库包路径 
        // $upload->imageClassPath = '@.ORG.Image'; 
        //设置需要生成缩略图的文件后缀 
        // $upload->thumbPrefix = 'm_';  //缩略图 
        //设置缩略图最大宽度 
        // $upload->thumbMaxWidth = '400,200'; 
        //设置缩略图最大高度 
        // $upload->thumbMaxHeight = '400,200'; 
        //设置上传文件规则 
        $upload->saveRule = uniqid;
        //删除原图 
        // $upload->thumbRemoveOrigin = true; 
        // dump($upload);die;
		if(!$_POST['adname']){
			$this->assign("meta_title","修改广告内容");
			$adnum = I("adnum");
			$editlist = M("ads")->where("adnum = $adnum")->find();
			// dump($editlist);die;
			$this->assign("list",$editlist);			
			$this->display("adsedit");
		}
		else{
			if(!$upload->upload()){ 
				// echo 111;die;
	            //捕获上传异常 
	            $this->error($upload->getErrorMsg()); 
       		} 
        	else{ 
	            //取得成功上传的文件信息 
	            $uploadList = $upload->getUploadFileInfo(); 
	            import('ORG.Util.Image');
	            //给m_缩略图添加水印, Image::water('原文件名','水印图片地址') 
	            //Image::water($uploadList[0]['savepath'].'m_'.$uploadList[0]['savename'], '/tp/Examples/File/Tpl/default/Public/Images/logo2.png');
	            $savename = $uploadList[0]['savename']; 
        	} 
	        // $baseurl = __ROOT__.C("IMAGES");
	        // $imageUrl = substr($baseurl.$_POST['image'],1);
	        $upUrl = substr(C("IMAGES"),1);
	        // dump($upload);die;
	        $imageUrl = __ROOT__.$upUrl.$savename;
	        // dump($imageUrl);die;
	       // $time = time();
			//$data = array("picture"=>$imageUrl,"edit_time"=>$time);
			// dump($data);die;
			//$id = array("id"=>$id);
			// dump($id);die;
			//$up = M('cookmenu')->where($id)->save($data);
		// dump($up);die;
		// dump($imageUrl);die;
    //     if ($up !== false) {
    //     	//更新版本信息
    //     	// $saveVersion = array("val"=>$time);
 			// // SaveConfig("SynVersion",$saveVersion);	//这里用的是菜单图片的上传函数，所以不用更新版本信息
 			// echo chenggong;
    //         // $this->success('上传图片成功！'); 
    //     } else { 
    //         $this->error('上传图片失败!'); 
    //     }
			$this->assign("meta_title","修改广告内容");		
			$data['adnum'] = I("adnum");
			$data['adname'] = I("adname");
			$data['starttime'] = I("starttime");
			$data['endtime'] = I("endtime");
			$data['adtext'] = I("adtext");
			$data['adremark'] = I("adremark");
			$data["adpic"] = $imageUrl;
			$data['adhref'] = I("adhref");
			$data['adtitle'] = I("adtitle");
			$data['adtype'] = I("adtype");
			$data['adshowcount'] = I("adshowcount");
			$data["introduction"] = I("introduction");
			$data["activity"] = I("activity");
			$data["address"] = I("address");
			$data["phone"] = I("phone");
			$data["vehicle"] = I("vehicle");
			$data["detail"] = I("detail");
			$data["edit_time"] = time();
			$user = M('ads')->data($data)->save();
			$this->success('修改成功！',U('adslist'));
		}
		
	}

	public function adsdel(){
		$adnum = I("adnum");
		$user = M('ads')->where("adnum = $adnum")->delete();
		$this->success("删除成功！",U('adslist'));
	}




	//文件上传
	public function leo() { 
		// echo 111;die;
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
        // $upload->thumb = true; 
        // 设置引用图片类库包路径 
        // $upload->imageClassPath = '@.ORG.Image'; 
        //设置需要生成缩略图的文件后缀 
        // $upload->thumbPrefix = 'm_';  //缩略图 
        //设置缩略图最大宽度 
        // $upload->thumbMaxWidth = '400,200'; 
        //设置缩略图最大高度 
        // $upload->thumbMaxHeight = '400,200'; 
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
        // dump($upload);die;
        $imageUrl = __ROOT__.$upUrl.$_POST['image'];
        // dump($imageUrl);die;
        $time = time();
		$data = array("picture"=>$imageUrl,"edit_time"=>$time);
		// dump($data);die;
		$id = array("id"=>$id);
		// dump($id);die;
		$up = M('cookmenu')->where($id)->save($data);
		// dump($up);die;
		dump($imageUrl);die;
        if ($up !== false) {
        	//更新版本信息
        	// $saveVersion = array("val"=>$time);
 			// SaveConfig("SynVersion",$saveVersion);	//这里用的是菜单图片的上传函数，所以不用更新版本信息
 			echo chenggong;
            // $this->success('上传图片成功！'); 
        } else { 
            $this->error('上传图片失败!'); 
        }

    } 

    // public function upload(){
    // 	// echo 111;
    // 	import("ORG.Net.UploadFile");
    // 	$upload = new \UploadFile();
    // 	$upload->maxSize = 3145728;
    // 	$upload->allowExts = array('jpg', 'gif', 'png', 'jpeg');
    // 	$upload->savePath = './Public/uploads/';
    // 	if(!$upload->upload()){
    // 		$this->error($upload->getErrorMsg());
    // 	}else{
    // 		$info = $upload->getUploadFileInfo();
    // 	}
    // }


}

	
 ?>
