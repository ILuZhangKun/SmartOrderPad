 //avalon控制模块 
var model=avalon.define({
	//avalon 控制范围声明
	$id:"avalon", 
	//切换键的变量
	active:"active",
	currentIndex:0,  
	notOrder:[],
	haveOrder:[],
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
		var num=parseInt(model.menuArr[id].num);
		var price=parseInt(model.menuArr[id].price);
		model.menuArr[id].num--;
		num--;
		model.menuArr[id].money=parseInt(num*price);
		
		if(model.menuArr[id].num<=0){
			model.menuArr.splice(id,1);
		} 
	},
	//增加菜量
	addNum:function(id){
		var num=parseInt(model.menuArr[id].num);
		var price=parseInt(model.menuArr[id].price);
		model.menuArr[id].num++;
		num++;
		model.menuArr[id].money=parseInt(num*price); 
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
		window.location.href='../ShoppingCart/index';
	},
	//点餐响应事件
	order:function(id,data){
		model.orderIsTrue=data; 
	}
});


 
