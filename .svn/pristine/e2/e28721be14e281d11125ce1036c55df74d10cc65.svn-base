<?php 
namespace Pad\Controller;
use Think\Controller;
/**
 * 引入命名空间，3.2.3以后新加功能！
 * 分页控制类
 */
Class PageController extends Controller{
	Public function InitPage(){
		$uuId = I("post.uuId");
		$tableId = I("post.tableId");
		$page = new \Pad\Model\PageModel($tableId,$uuId);
		dump($page->initPage());
	}
}

 ?>