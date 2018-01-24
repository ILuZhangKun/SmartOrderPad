/**
 * 订单控制类，主要用于控制订单的增删改查
 * 1、订单的增加：(逻辑)
 * 2、订单的修改：(逻辑)
 * 3、订单的删除：(逻辑)
 */
 var Order = Common.extend({
 	init:function(){
 		this.dealOrderUrl="http://"+SERVER+"/"+ProName+"/DealOrder"; 
 	},
 	addOrModify:function(action,menuId,num,taste,dealOrder){  
 	 	taste=modelCon.formalTaste(taste);
 		var data={uuId:localStorage.uuId,tableId:localStorage.tableId,taste:taste,action:action,menuId:menuId,num:num};
		if(dealOrder==undefined){
			dealOrder=function(result){
				console.log(result);
				modelCon.countTotleMoney(modelCon.orderArr);
				modelCon.showAlert(true,"修改成功");
				avalon.scan();
			};
		}
 		orderObj.ajaxRequest(data,dealOrder);
 	},
 	Del:function(menuObj){
 		var action="Del"; 
 		var data={uuId:localStorage.uuId,tableId:localStorage.tableId,action:action,menuId:menuObj.menuId};
 		var dealOrder=function(data){
 			modelCon.showAlert(true,"成功删除");
 			modelCon.countTotleMoney(modelCon.orderArr);
 		};
 		orderObj.ajaxRequest(data,dealOrder);
 	}, 
 	Make:function(action){
 		// var action="Make";
 		var data={uuId:localStorage.uuId,tableId:localStorage.tableId,action:action};
 		var dealOrder=function(data){ 
 			if(data=="notPay"){
 				modelCon.showAlert(true,"订单异常，有订单未支付，请支付后继续点餐。");
 			}else{
 				var dataObj=eval(data);
 				modelCon.makeOrderArr=dataObj.order; 
 				var upDishArr=[];
 				var notUpDishArr=[];
 				for(var i=0;i<dataObj.order.length;i++){
 					if(dataObj.order[i].isUp==1){
 						upDishArr.push(dataObj.order[i]); 
 					}else{
 						notUpDishArr.push(dataObj.order[i]); 
 					}
 				}
 				modelCon.upDishArr=upDishArr;
 				modelCon.notUpDishArr=notUpDishArr;
 				if(modelCon.upDishArr.length!=0){
					modelCon.upDish=1;
				}
				if(modelCon.notUpDishArr.length==0){
					modelCon.notUpDish=0;
				}else{
					modelCon.notUpDish=1;
				}
 				console.log(modelCon.notUpDishArr[0].name);
				modelCon.orderArr=[]; 
				modelCon.hasOrderTotleMoney=dataObj.totalMoney; 
				modelCon.totleMoney=0;
				modelCon.hasOrderTotleNum=parseInt(modelCon.hasOrderTotleNum)+parseInt(modelCon.totleNum);
				modelCon.totleNum=0; 
				$(".notYet").html(); 
				modelCon.changeAlreadyAndNotYet(1); 
				$('#logincPrompt').hide();
 				modelCon.showAlert(true,"点餐成功，马上给您送上可口的饭菜。");
 			}
 			avalon.scan();
 		};
 		orderObj.ajaxRequest(data,dealOrder);
 	}, 
 	read:function(){
 		var action="getOrder";
 		console.log(action);
 		var data={tableId:localStorage.tableId,uuId:localStorage.uuId,action:action};
 		var dealOrder=function(result){
 			if(result.nowOrder.length==0&&result.alreadyOrder.length==0)
 				modelCon.showAlert(true,"您所点菜品数量为零，请点餐后查看~");
 			else{
 				var resultObj=eval(result);
 				if(resultObj.nowOrder.length!=0){
 					//将数据的所有数据放在orderArr中，然后再前台展示。
	 				var resObj=resultObj.nowOrder;
	 				//console.log(resObj.taste.1);
	 				modelCon.countTotleMoney(resObj);
	 				//resObj.taste=resObj.taste.join(",");
	 				modelCon.orderArr=resObj; 
 				}
 				if(resultObj.alreadyOrder.length!=0){
 					var alreadyObj=resultObj.alreadyOrder;
	 				console.log(alreadyObj[0]);
	 				modelCon.countTotleMoney(alreadyObj,1);
	 				console.log(modelCon.totleMoney);
	 				//resObj.taste=resObj.taste.join(",");
	 				modelCon.makeOrderArr=alreadyObj;
	 				var upDishArr=[];
	 				var notUpDishArr=[];
	 				for(var i=0;i<alreadyObj.length;i++){
	 					if(alreadyObj[i].isUp==1){
	 						upDishArr.push(alreadyObj[i]); 
	 					}else{
	 						notUpDishArr.push(alreadyObj[i]); 
	 					}
	 				}
	 				modelCon.upDishArr=upDishArr;
	 				modelCon.notUpDishArr=notUpDishArr;
	 				if(upDishArr.length!=0){
	 					modelCon.upDish=1;
	 				}
	 				if(notUpDishArr.length==0){
	 					modelCon.notUpDish=0;
	 				}
	 				//console.log(modelCon.makeOrderArr.length);
	 				avalon.scan();
 				}
// 				$("#pagetwo").attr("style","display:block");
// 				$("#pageone").attr("style","display:none");
 			} 
 		};
 		orderObj.ajaxRequest(data,dealOrder);
 	}, 
 	upDish:function(menuId){
 		var action="upDish";
 		var data={uuId:localStorage.uuId,tableId:localStorage.tableId,action:action,menuId:menuId};
 		var dealOrder=function(data){
 			modelCon.showAlert(true,"已上菜");

 		}
 		orderObj.ajaxRequest(data,dealOrder);
 	},
 	ajaxRequest:function(data,dealOrder){ 
 		console.log(data);
 		this._super(data,orderObj.dealOrderUrl,dealOrder);
 	}
 });