 var DealOrder = "http://172.18.4.179/SmartOrder/DealOrder";
 //avalon控制模块 
var model=avalon.define({
	//avalon 控制范围声明
	$id:"avalonCon",
	//图片轮播显示的序号
	index:0,
	//设置桌号的变量
	table:2,
	//控制购物车弹出框是否显示
	istrue:false,
	//点餐界面是否显示
	orderIsTrue:false, 
	//切换键的变量
	active:"active",
	currentIndex:0,
	//存放菜系名称的数组
	//"特色菜品","美味凉菜","甜品小吃","酒水主食"
	styleArr:[],
	//当前显示的菜系名称，以便于控制tab的当前选中状态。
	currentStyle:"",
	//菜品介绍相关参数
	introName:"",
	introId:0,
	introArtical:"",
	introPrice:0,
	note:"",
	num:1,
	//推荐菜品的数组
	recommendMenuArr:[
		{id:"1",cookName:"油焖大虾",introduce:"这是盘油焖大虾哦~~~大虾哇！！嘿嘿……",price:"100",standard:"份",picture:"file://mnt/sdcard/Download/54fa5da4c9383.jpg"},
		{id:"1",cookName:"油焖大虾",introduce:"这是盘油焖大虾哦~~~大虾哇！！嘿嘿……",price:"100",standard:"份",picture:"file://mnt/sdcard/Download/54fa5da4c9383.jpg"},
		{id:"1",cookName:"油焖大虾",introduce:"这是盘油焖大虾哦~~~大虾哇！！嘿嘿……",price:"100",standard:"份",picture:"file://mnt/sdcard/Download/54fa5da4c9383.jpg"}

	],
	//普通菜品的数组
	menuArr:[
		{id:"1",cookName:"油焖大虾",introduce:"这是盘油焖大虾哦~~~大虾哇！！嘿嘿……",price:"100",standard:"份",picture:"file://mnt/sdcard/Download/54fa5da4c9383.jpg"},
		{id:"1",cookName:"古香排骨",introduce:"这是盘油焖大虾哦~~~大虾哇！！嘿嘿……",price:"100",standard:"份",picture:"file://mnt/sdcard/Download/552338dddbefe.png"}
		 
	],
	//已点菜品的数组
	menuAlreadyArr:[], 
	//控制总价
	totleMoney:0,
	//计算菜品总价
	countTotleMoney:function (){
		var totle=0;
		for(var i=0;i<menuArr.length;i++){
			totle+=menuArr[i].money;
		}
		model.totleMoney=totle;
		//return totle;
	},
	//切换选项卡
	changeIndex:function(data){
		model.currentIndex=data;
		if(data==0){
			$(".notYet").html();
		}else{
			
		}
	},
	commitMenu:function(){
		//yysAjaxRequest("GET",{id:id,note:'等待'},"提交菜单");  
	},
	//删除菜单的操作
	deletMenu:function(id){
		model.menuArr.splice(id,1);
	},
	//修改菜单的操作
	changeMenu:function(id){
		 //功能预留，小学妹好好写啊~~~~
	},
	//等待上菜的操作
	waitMenu:function(id){
		model.menuArr[id].note="等待";
		//发送ajax到后台修改状态
		//yysAjaxRequest("GET",{id:id,note:'等待'},"设置桌号的后台连接");  
	},
	//减少菜量
	reduceNum:function(id){ 
		model.num--; 
		if(model.num<=0){
			alert("您所点菜的数量为0！！");
			model.orderIsTrue=0; 
		}
	},
	//增加菜量
	addNum:function(id){ 
		model.num++;  
	},
	//控制购物车是否显示
	showDialog:function(data){
		model.istrue=data;
	},
	//单击事件显示上菜
	markTip:function(id){
		model.menuAlreadyArr[id].type="已上菜";
	},
	//跳转页面，到购物车页面。
	nextPage:function(){
		//跳转页面，到购物车页面。
		window.location='www.baidu.com'
	},
	//菜品简介响应事件
	order:function(menuArr,id,data){
		model.orderIsTrue=data; 
		model.introName=menuArr[id].cookName;
		model.introId=menuArr[id].id;
		model.introArtical=menuArr[id].introduce;
		model.price=menuArr[id].price;
	},
	//点餐响应事件
	doOrder:function(id,data){
		//弹出框隐藏
		model.orderIsTrue=data; 
		//将顾客点餐的信息存入点餐数组，并且将信息发送到后台
		//判断：如果用户点了两次这个菜品怎么办？？？加个判断
		if (id!=0) { 
			var num=model.num;
			var type="学妹来实现吧。。。";
			var note=model.note;
			var id=model.introId;
			var name=model.introName;
			var money=model.introPrice*num;
			var price=model.introPrice;
			//增加重复点菜的判断
			var judgeRepeat=judgeRepeat(id);
			num=num+judgeRepeat;
			model.menuAlreadyArr.push({id:id,name:name,money:money,price:price,num:num,type:"",note:note})
			console.log(model.menuAlreadyArr[0].id);
			//然后将本次点的菜发送到后台。
			//接口怎么定义的来着。。。。（明天写吧）
		}; 

	},
	//左侧列表显示当前选中的标签  
	changeTab:function(){
		$(".am-nav").children().removeClass("am-active");
		if($(this).hasClass("am-active")){
			
		}else{
			$(this).addClass("am-active")
		} 
	}
});

  //判断菜品是否已经存在点餐菜品数组中
  function judgeRepeat(id){
  	for (var i = 0; i < menuAlreadyArr.length; i++) {
  		if (menuAlreadyArr[i].id==id) {
  			return menuAlreadyArr[i].num;
  			//删除之前点的，将订单合并。
  			menuAlreadyArr.splice(i,1);
  		}else{
  			return 0;
  		}
  	};

  }
