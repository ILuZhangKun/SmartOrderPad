<?php
	function getusername(){
		//临时用于数据填充
		$db = M('user')->order('id desc')->find();
		return $db['id'];
	}
	/*
		v1.0 返回用户数量。
		V2.0 读取配置文件信息，然后返回想要模拟的用户数量。
	*/
	function user_count(){
		$num = M("user")->count();
		return $num;
	}
	function user_info(){
		$info = M('user')->select();
		return $info;
	}
	function getInfById($id){
		$data = array('id'=>$id);
		$info = M('user')->where($data)->select();
		return $info;
	}
	/*
	返回版本信息
	*/
	function getVersion(){
		$version = M('config')->where("Conf='Version'")->find();
		return($version['Val']);
	}
	function getCopyRight(){
		$copy=$copy = M('config')->where("Conf='CopyRight'")->find();
		return($copy['Val']);
	}
	/*
	返回模拟用户的数量
	*/
	function getSimulateNum(){
		$ret = M('config')->where("Conf='SIMULATE_NUM'")->field('val')->find();
		return $ret['val'];
	}

	/**
	 * SaveConfig($conf,$data);用于保存配置项。
	 *	$conf 为配置项名称 。$data为数组，数组形式为array('Val'=>value);
	 *	返回值为bool型：
	 *	如果更新成功返回true。
	 *	如果没有更新返回false。
	 */
	function SaveConfig($conf,$data){
		//return $data;die;
		return M('config')->where("Conf=\"".$conf."\"")->data($data)->save();
	}
	/**
	 * SaveConfig($conf,$data);用于读取配置项。
	 *	$conf 为配置项名称
	 *	返回值为bool型配置项的Val，对应数据库中的Val列。
	 *	与getConfig配合使用。
	 */
	function getConfig($conf){
		$config = M('config')->where("Conf=\"".$conf."\"")->find();
		return $config['Val'];
	}
	// 把该函数去掉！！！
	function getSimulatePercent(){
		$ret = M('config')->where("Conf='SimulatePercent'")->field('val')->find();
		return $ret['val'];
	}
	function getIndirectNum(){
		$SimulatePercent = getConfig('SimulatePercent');
		$SimulateNum = getConfig('SIMULATE_NUM');
		return (round($SimulateNum*$SimulatePercent/100));
	}
	function getRandom(){
		return  1;
	}
	
 ?>