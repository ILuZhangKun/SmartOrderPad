/**
 *  数据库操作类
 *  对数据库的增删改查都写在这个Model中
 *  1、创建数据表
 *  2、更新存储数据
 *  3、执行sql语句，操作数据库 
 */
 var Db = Class.extend({
 	init:function(){
 		//构造函数
	 	this.db=window.openDatabase('MyDB', '1.0', '存储菜品信息', 5242880); 
	 	this.sqlInsert="INSERT INTO images (styleid,cookname,introduce,price,standard,picture,stylename,is_delete,recommend,id) VALUES (?,?,?,?,?,?,?,?,?,?)";
		this.sqlUpdate="UPDATE `images` SET `styleid` = ?, `cookname` = ?, `introduce` = ?, `price` = ?, `standard` = ?, `picture` = ?, `stylename` = ? ,`is_delete` = ? ,`recommend`= ? WHERE `id` =?";
		this.sqlCreate='CREATE TABLE IF NOT EXISTS images(id unique,styleid,stylename,cookname,introduce,price,standard,picture,is_delete,recommend)';
		this.tableExist=this.newTable(this.sqlCreate); 
 	},
 	//创建数据表executeDB
	newTable:function(sql){  
		this.db.transaction(function(t){
			t.executeSql(sql,[],
			function(tx,result){  
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
	saveDataToBase:function(data){ 
		console.log("执行了么？？");
		console.log(data.introduce);
		console.log(data.picture);
		console.log(data.styleName);
		var paramArr=[
			data.styleid,	data.cookname,	data.introduce,
			data.price,	data.standard,	data.picture,
			data.stylename,data.is_delete, data.recommend,	data.id
		];
		var sqlSelect='SELECT * FROM images where id="'+data.id+'"';
		upDb.db.transaction(function(t){t.executeSql(sqlSelect,[],
			function(tx,result){
				 if(result.rows.length)
				 	upDb.executeDB(upDb.sqlUpdate,paramArr);
				 else
				 	upDb.executeDB(upDb.sqlInsert,paramArr);
			})
		});
		//gen
	},
	//执行sql语句，操作数据库
	executeDB:function(sql,arr,func){  
		 func==undefined?function(){}:func;
		console.log(sql);
		console.log(arr);
		upDb.db.transaction(function(t){t.executeSql(sql,arr,func, 
			function(tx,err){
				var msg;
				if(err)	msg="TX:"+err.message+"("+err.code+")";
				else	msg="TX:Unknow error";
				console.log(msg);
			})
		}); 
	}

 }) 