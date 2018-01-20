/*
 *  数据库操作类
 *  对数据库的增删改查都写在这个Model中
 *  1、创建数据表
 *  2、更新存储数据
 *  3、执行sql语句，操作数据库
 */
 var Dp = Class.extend({
 	init:function(){
 		//构造函数
	 	this.dp=window.openDatabase('MyDB', '1.0', '存储广告信息', 5242880);
	 	this.sqlAdInsert="INSERT INTO ads (adnum,starttime,endtime,adname,adtext,adremark,adpic,adhref,adtitle,adtype,adshowcount,introduction,activity,address,phone,vehicle,detail,is_delete) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		this.sqlAdUpdate="UPDATE `ads` SET `adnum` = ?, `starttime` = ?, `endtime` = ?, `adname` = ?, `adtext` = ?, `adremark` = ?, `adpic` = ? ,`adhref` = ? ,`adtitle`= ? `adtype` = ?, `adshowcount` = ?,`introduction` = ?, `activity` = ? ,`address` = ? ,`phone`= ? ,`vehicle` = ? ,`detail`= ? ,`is_delete`= ?   WHERE `adnum` =?";
		this.sqlAdCreate='CREATE TABLE IF NOT EXISTS ads(adnum, starttime, endtime ,adname, adtext, adremark, adpic, adhref, adtitle, adtype, adshowcount, introduction,activity, address, phone,vehicle,detail,is_delete)';
        /*数据库字段增减：去掉adshowcount，address,添加adverify,is_submit,ad_hotel*/
        /*
		this.sqlAdInsert="INSERT INTO ads (adnum,starttime,endtime,adname,adtext,adremark,adpic,adhref,adtitle,adtype,introduction,activity,phone,vehicle,detail,is_delete,adverify,is_submit,ad_hotel) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        this.sqlAdUpdate="UPDATE `ads` SET `adnum` = ?, `starttime` = ?, `endtime` = ?, `adname` = ?, `adtext` = ?, `adremark` = ?, `adpic` = ? ,`adhref` = ? ,`adtitle`= ? `adtype` = ?,`introduction` = ?, `activity` = ?,`phone`= ? ,`vehicle` = ? ,`detail`= ? ,`is_delete`= ? `adverify`= ? ,`is_submit`= ?, `ad_hotel`= ?   WHERE `adnum` =?";
        this.sqlAdCreate='CREATE TABLE IF NOT EXISTS ads(adnum, starttime, endtime ,adname, adtext, adremark, adpic, adhref, adtitle, adtype, introduction,activity, phone,vehicle,detail,is_delete,adverify,is_submit,ad_hotel)';
		*/
		this.tableAdExist=this.newAdTable(this.sqlAdCreate);
 	},
 	//创建数据表executeDB
	newAdTable:function(sql){
	//transaction管理sql数据库的事务
		this.dp.transaction(function(t){
		//获取表中的数据（executeSql）
			t.executeSql(sql,[],function(tx,result){
				return true;
			},
			function(tx,err){
				var msg;
				if(err)	msg="TX:"+err.message+"("+err.code+")";
				else	msg="TX:Unknow error";
				console.log(msg);
			});
		});
	},
	//更新存储数据
	saveAdDataToBase:function(data){
		console.log("AD执行了么？？");
		console.log(data);
		/*数据库字段增减：去掉adshowcount，address,添加adverify,is_submit,ad_hotel*/
		var paramAdArr=[
			data.adnum,data.starttime,data.endtime,data.adname,data.adtext,
			data.adremark,data.adpic,data.adhref,data.adtitle,data.adtype,
			data.adshowcount,data.introduction,data.activity,data.address,data.phone,data.vehicle,data.detail, data.is_delete
		];
		var sqlAdSelect='SELECT * FROM ads where adnum="'+data.adnum+'"';
		adDb.dp.transaction(function(t){t.executeSql(sqlAdSelect,[],
			function(tx,result){
			console.log(adDb.sqlAdUpdate);
			console.log(adDb.sqlAdInsert);
			console.log(paramAdArr[0]);
				 if(result.rows.length)
				 	adDb.executeAdDB(adDb.sqlAdUpdate,paramAdArr);
				 else
				 	adDb.executeAdDB(adDb.sqlAdInsert,paramAdArr);
			},function(tx,err){
              				var msg;
              				if(err)	msg="TX:"+err.message+"("+err.code+")";
              				else	msg="TX:Unknow error";
              				console.log(adDb.sqlAdInsert);
                            			console.log(paramAdArr[0]);
              				console.log(msg);
              			})
		});
		//gen
	},
	//执行sql语句，操作数据库
	executeAdDB:function(sql,arr,func){
		func==undefined?function(){}:func;

		console.log(sql);
		console.log(arr);
		adDb.dp.transaction(function(t){t.executeSql(sql,arr,func,
			function(tx,err){
				var msg;
				if(err)	msg="TX:"+err.message+"("+err.code+")";
				else	msg="TX:Unknow error";
				console.log(sql);
				console.log(arr);
				console.log(msg);
			})
		});
	}

 })