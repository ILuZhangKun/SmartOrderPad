<?php 
/**
 * 这里是菜单同步模块
 * 主要用于菜单的同步
 * 1、判断是否绑定了dept_key,如果没有绑定，返回不执行后续任务。
 * 2、绑定dept_key之后，向服务端发送请求格式为JSON：syn_key：XXXXXX，menu_version:1212312321
 * 3、返回值status：0/1 为0表示没有更新，为1表示有可用更新。
 * 4、如果有更新，case 1 :直接插入数据。case 2：直接更新数据==>逻辑是更新成功则不用插入，否则执行insert操作
 * 5、更新完成后，把餐厅服务端同步PAD端的版本号更新
 */
	use Think\Log;
	use Admin\Model;
	$message = "这里是定时任务测试！".date("Y-m-d H:i:s",time());
	Log::write($message);
	//获取全局配置信息
	//由于这里没有复杂的配置信息，所以直接进行sql查询，不用缓存的形式存放配置项了
	$cloud_ip = getConfig("cloud_ip");
	$syn_key = getConfig("synKey");
	Log::write("synKey{$syn_key}");
	$image_path = "./Data/Uploads/Images"; //下载图片后的存放路径
	// $syn_key = "fdaslkjflkasdjlfjasdklfjlkasd";
	//1、 同步密钥为空，不能进行同步
	if(empty($syn_key)||$syn_key=="") {
		Log::write("同步密钥为空，不能进行同步~");
		return;
	}
	//2、 同步操作
	$syn_url = "http://".trim($cloud_ip)."/Cloud/SynData/Menu/synMenu"; //生成同步URL
	Log::write("我是URL".$syn_url);
	$data = array("key"=>$syn_key,"version"=>getConfig("SynVersion")); //构造同步数据
	$menu_return = object_array(json_decode(curl_request($syn_url,$data)));
	Log::Write($menu_return);
	if($menu_return["status"] == 1) {
		//有更新数据
		//更新菜系
		$style = $menu_return["cook_style"];
		foreach ($style as $key => $value) {

			$data = array();
			$map["c_id"]  = $value["id"];
			// $data["c_id"]  = $value["id"];
			$data["edit_time"] = $value["edit_time"];
			$data["is_delete"] = $value["is_delete"];
			$data["remark"] = $value["remark"];
			$data["stylename"] = $value["style_name"];
			$ret = M("cookstyle")->where($map)->save($data);
			Log::Write("我是RET:".$ret);
			if($ret) continue;
			else{
				//否则插入一条新数据
				$data["c_id"]  = $value["id"];
				M("cookstyle")->add($data);
			}
		}

		//更新菜谱
		$menus = $menu_return["cook_menu"];	
		foreach ($menus as $key => $value) {
			$map = array();
			$map["c_id"] = $value["id"];//云端的唯一编号
			$menu = array();
			// $menu["c_id"] 		= $value["id"];
			$menu["styleid"] 	= $value["style_id"];
			$menu["cookname"] 	= $value["menu_name"];
			$menu["introduce"]  = $value["introduce"];
			$menu["price"] 		= $value["price"];
			$menu["standard"]	= $value["standard"];
			$menu["recommend"]	= $value["recommend"];
			$pic = explode('/', $value["picture"]);
			$menu["picture"]	= "/SmartOrder/Data/Uploads/Images/".$pic["7"];
			$menu["is_delete"]  = $value["is_delete"];
			$menu["edit_time"]	= $value["edit_time"];
			$ret = M("cookmenu")->where($map)->save($menu);
			
			if(!$ret)
			{
				$menu["c_id"] = $value["id"];
				M("cookmenu")->add($menu);
				// Log::Write(M("cookmenu")->getlastsql());
			}

			file_put_contents($image_path."/{$pic["7"]}", file_get_contents("http://".trim($cloud_ip).$value["picture"]));
			// if(M("cookmenu")->where($map)->count()){
			// 	//更新内容
			// 	M("cookmenu")->where($map)->save($menu);
			// 	//更新图片
			// 	$condition = $map;
			// 	$condition["picture"] = "/SmartOrder/Data/Uploads/Images/".$pic["5"];
			// 	// dump($condition);
			// 	if(!M("cookmenu")->where($condition)->count()) file_put_contents($image_path."/{$pic["5"]}", file_get_contents("http://".trim($cloud_ip).$value["picture"]));
			// 	//continue;//跳过添加
			// }
			// else{
			// 	//否则插入更新的数据
			// 	// dump($menu);
			// 	M("cookmenu")->add($menu);
			// }
			//获取菜品图片，并且保存
			//dump("http://".trim($cloud_ip).$value["picture"]);
		}
		//更新同步PAD的版本号
		SaveConfig("SynVersion",array("val"=>$menu_return["version"]));
	}
	elseif ($menu_return["status"]==2) {
		Log::Write("没有更新的数据！");
	}
	elseif ($menu_return["status"]==0) {
		Log::Write("syn_key不能为空");
	}
	else return;
?>