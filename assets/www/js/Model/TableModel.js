/**
 * 桌号和设备号处理类
 * 1、设置桌号
 * 2、判断桌号和uuId是否一致 
 */
 var Table=Common.extend({
 	init:function(){
 		//构造函数
 		this.uuId=device.uuid;
 		this.tableId = "";
	 	this.tableName = ""; 
 		console.log(this.uuId);
 		this.dealTableUrl="http://"+SERVER+"/"+ProName+"/DealTable";
 		this.getTableUrl="http://"+SERVER+"/"+ProName+"/TableTree";
 		
	 	if (localStorage.tableId==null){
	 		this.tableId = "error";
	 		this.tableName = "error";
	 		modelCon.showAlert(true,"请设置桌号");
	 	}else{
	 		this.tableId = localStorage.tableId;
	 		this.tableName = localStorage.tableName;
	 		//显示桌号 
	 		modelCon.table=this.tableName;
	 		//核对桌号与uuid的绑定
	 		this.checkTableId();
	 		this.adjustTableId(this.tableName);
	 	} 
 		
 	},
 	checkTable:function(tableId,tableType,tableName){
 	    if(tableType=="0"){
 	        setTableId(tableId,tableName);
 	    }else{
 	        removeTableId(tableId,tableName);
 	    }
 	},
 	setTableId:function(tableId,tableName){ 
 		var data={uuId:tableObj.uuId,tableId:encodeURI(tableId),action:"set"};
 		console.log(tableObj.uuId);
 		console.log(tableId);
 		var fun=function(data){
 			console.log(data); 
 			if(!data.match("绑定成功")){
 				modelCon.paramOfSetTable=true;
 				modelCon.showAlert(true,data);
 			}else{
 				//清空上个桌号的数据
 				//已点菜单数组
				modelCon.orderArr=[]; 
				//未下单的购物车数组
				modelCon.notOrderArr=[];
				//已下单的购物车数组
				modelCon.makeOrderArr=[];
				//已上菜的购物车数组
				modelCon.upDishArr=[];
				//未上菜的购物车数组
				modelCon.notUpDishArr=[];
				//总金额
				modelCon.totleMoney=0;
				modelCon.hasOrderTotleMoney=0;
				//总数量
				modelCon.totleNum=0;
				modelCon.hasOrderTotleNum=0;
 				//存储相关信息
 				localStorage.uuId=device.uuid;
		 		localStorage.tableId=tableId;
		 		localStorage.tableName=tableName;
		 		this.tableId=tableId; 
		 		modelCon.table=tableName;
		 		$('#setTablePrompt').hide();
		 		modelCon.paramOfSetTable=true;
		 		tableObj.adjustTableId(tableName);
		 		modelCon.showAlert(true,data);
 			} 
 		};
 		this.ajaxRequest(data,this.dealTableUrl,fun);
 	},
 	removeTableId:function(tableId,tableName){
     	    var data={uuId:tableObj.uuId,tableId:encodeURI(tableId),action:"remove"};
            var fun = function(data){
                console.log(data);
                if (data = 'success') {
                    //清空上个桌号的数据
                    //已点菜单数组
                    modelCon.orderArr=[];
                    //未下单的购物车数组
                    modelCon.notOrderArr=[];
                    //已下单的购物车数组
                    modelCon.makeOrderArr=[];
                    //已上菜的购物车数组
                    modelCon.upDishArr=[];
                    //未上菜的购物车数组
                    modelCon.notUpDishArr=[];
                    //总金额
                    modelCon.totleMoney=0;
                    modelCon.hasOrderTotleMoney=0;
                    //总数量
                    modelCon.totleNum=0;
                    modelCon.hasOrderTotleNum=0;
                    //存储相关信息
                    localStorage.uuId=device.uuid;
                    localStorage.tableId='error';
                    localStorage.tableName='待绑定';
                    this.tableId=localStorage.tableId;
                    modelCon.table=localStorage.tableName;
                    $('#cashPrompt').hide();
                    modelCon.paramOfSetTable=true;
                    tableObj.adjustTableId(tableName);
    //                modelCon.showAlert(true,data);
                    modelCon.showAlert(true,"请确认结账！");
                }
                else {
                    modelCon.showAlert(true,"解绑失败，稍后再试！");
                }
            }
            this.ajaxRequest(data,this.dealTableUrl,fun);
     	},
 	checkTableId:function(){
 		console.log("action");
 		console.log(this.tableId);
 		var data={uuId:this.uuId,tableId:this.tableId,action:"check"};
 		var fun=function(data){
			//var data=eval(data);
			//var dataObj=JSON.parse(data);
			var dataObj;
			if(data=="faild")dataObj="绑定失败";
			else dataObj="绑定成功";
			
			console.log(dataObj);
			tableObj.adjustTableId(tableObj.tableName);
			modelCon.showAlert(true,dataObj);
		};
 		this.ajaxRequest(data,this.dealTableUrl,fun);
 	},
 	adjustTableId:function(tableId){
 		//1~10 
 		if(tableId.search("[0-9]{1}")!==-1&&tableId.length==1)
 			$(".seatNum").attr("style","font-size:95px;left:50px;top:35px;");
 		//10~99 
 		if(tableId.search("[0-9]{2}")!==-1&&tableId.length==2)
 			$(".seatNum").attr("style","font-size:90px;left:23px;top:40px;");
 		//100- 
 		if(tableId.search("[0-9]{3}")!==-1&&tableId.length>=3)
 			$(".seatNum").attr("style","font-size:70px;left:15px;top:57px;");
 		//字数 
 		if(tableId.search( "[\u4e00-\u9fa5][0-9]{1}")!==-1&&tableId.length==2)
 			$(".seatNum").attr("style","font-size:70px;left:27px;top:57px;");
 		//字数数 
 		if(tableId.search( "[\u4e00-\u9fa5][0-9]{2}")!==-1&&tableId.length==3)
 			$(".seatNum").attr("style","font-size:55px;left:20px;top:70px;");
 		// 字字 
 		if(tableId.search( "[\u4e00-\u9fa5]{2}")!==-1&&tableId.length==2)
 			$(".seatNum").attr("style","font-size:55px;left:25px;top:70px;");
 		//字字数 
 		if(tableId.search( "[\u4e00-\u9fa5]{2}[0-9]{1}")!==-1&&tableId.length==3)
 			$(".seatNum").attr("style","font-size:45px;left:22px;top:77px;");
 		// 字字字 
 		if(tableId.search( "[\u4e00-\u9fa5]{3}")!==-1&&tableId.length==3)
 			$(".seatNum").attr("style","font-size:40px;left:22px;top:80px;");
 		// 6个字 
 		if(tableId.search( "[\u4e00-\u9fa5]{6}")!==-1&&tableId.length==6)
 			$(".seatNum").attr("style","font-size:35px;left:20px;top:70px;letter-spacing:6px;");
 		 
 	},
 	getTableTree:function(fun){ 
 		this.ajaxRequest("",this.getTableUrl,fun);
 	},
 	ajaxRequest:function(data,url,fun){
 		//var fun=undefined?function(data){}:fun;
		this._super(data,url,fun);
	} 
 })