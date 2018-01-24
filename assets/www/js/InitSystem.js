// 等待加载PhoneGap   
document.addEventListener("deviceready", onDeviceReady, false);  
/*函数功能：PhoneGap加载完毕 */ 
function onDeviceReady() {
	navigator.splashscreen.hide();
	if(localStorage.SERVER){
		SERVER=localStorage.SERVER;
		modelCon.restaurantName=localStorage.restaurantName;
		console.log(modelCon.restaurantName);
		console.log(SERVER);
		afterSetting();
	}else{
		//设置服务器地址与饭店名称。
		$("#setServerPrompt").show();

	}
	
}

function afterSetting(){
	//同步数据对象
    dataSyn = new SysData();
    //新建同步广告对象
    adData = new Ads();
    console.log(adData.checkUrl);
    upDb = new Db();
    adDb = new Dp();
    fileTransfer = new FileTransfer();
    //网络未连接监听事件
    document.addEventListener("offline",
        function(){
            modelCon.showAlert(true,"网络未连接，请连接网络后点餐！");
        },
    false);
    //网络连接监听事件
    //When the application's network connection changes to being online, the online event is fired.
    document.addEventListener("online",
        function(){
            dataSyn.doSyn();
            adData.doAdSyn();
            initSystem();
            avalon.scan();
        },
    false); 
    dataSyn.doSyn(); 
    adData.doAdSyn();
    initSystem();
    avalon.scan();

}

function initSystem(){
console.log("生成页");
	//生成页码表 
	pageObj=new Page();
	//获取菜系名称(然后生成page表)
	var sqlGetStyle="select distinct `stylename` from images order by stylename";
	upDb.executeDB(sqlGetStyle,[],modelCon.getStyleName);  
	tableObj = new Table(); 
	commonObj = new Common(); 
	ringObj = new Ring(); 
	orderObj = new Order();
	commentObj = new Comment();
	console.log(orderObj.dealOrderUrl)
	modelCon.table=tableObj.tableName;
	console.log(tableObj.tableName);
	console.log(modelCon.table); 
	// modelCon.showShoppingCart();
  	adData.showTopAds();
  	avalon.scan();
}
$(document).ready(function(){
	swipeLeft();
	swipeRight(); 
	//监听长按已上菜事件
	var target=$(".container").find(".hold");
	//console.log(target.html());
	touch.on(target,'hold',function(ev){  
		var cookName=$(ev.target).find(".Nshoppingcart").html();
		console.log(cookName);
		cookName = cookName.replace(/(^\s*)|(\s*$)/g, ""); 
		console.log(cookName);


		var r=confirm("您确定"+cookName+"已上菜嘛？");
		if (r==true){  
			$(ev.target).find(".state").html("已上菜"); 
			//var menArr=modelCon.makeOrderArr; 
			var menArr=modelCon.notUpDishArr;
			var temp;
			var upDish=[];
			for(var i=0;i<menArr.length;i++){ 
				console.log(menArr[i].name)
				if(menArr[i].name==cookName){ 
					temp=menArr[i].menuId;
					modelCon.upDishArr.push(menArr[i]);
					menArr.splice(i,1);
					break;
				} 
			} 
			modelCon.notUpDishArr=menArr;
			//modelCon.upDishArr=upDish;
			if(modelCon.upDishArr.length!=0){
				modelCon.upDish=1;
			}
			if(modelCon.notUpDishArr.length==0){
				modelCon.notUpDish=0;
			}
			console.log(temp);
			orderObj.upDish(temp); 
		} 
		
	}); 
	__start();//小星星
	/*小标签动态显示*/ 
	$("#menu2 li a").wrapInner( '<span class="out"></span>' ); 
	$("#menu2 li a").each(function() {
		$('<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
	});   
});
//向左滑动切换页面
function swipeLeft(){
	//向左滑动的监听事件（下一页） 
	touch.on("#pageone div.order", 'swipeleft', function(ev){ 
		console.log(modelCon.currentPage);
		modelCon.currentPage++;
		modelCon.pageShow();
	});
}
function offSwipeLeft(){
	touch.off("#pageone div.order", 'swipeleft', function(ev){ 
		console.log("解除向左滑动事件");
	});
}
//向右滑动切换页面
function swipeRight(){
	//向右滑动的监听事件（上一页）
	touch.on("#pageone div.order", 'swiperight', function(ev){ 
		console.log(modelCon.currentPage);
		modelCon.currentPage--;
		if(modelCon.currentPage==0){
			modelCon.currentPage=1;
			modelCon.showAlert(true,"已经是第一页了，不要再往前翻了~");
		}else{
			modelCon.pageShow();
		}
	});
}
function offSwiperRight(){
	touch.off("#pageone div.order", 'swiperight', function(ev){ 
		console.log("解除向左滑动事件");
		modelCon.showAlert(true,"已经是第一页了，不要再往前翻了~");
	});
}
/*控制评价小星星的两个函数*/
function __start(){ 
	var initialize_width=0; 
	if(document.getElelmentById){return false}; 
	if(document.getElementsByTagName==null){return false;} 
	var startLevelObj=document.getElementById("www_zzjs_net") 
	if(startLevelObj==null){return false;} 
	initialize_width=parseInt(startLevelObj.getAttribute("star_width"),10); 
	if(isNaN(initialize_width) || initialize_width==0){return false;} 
	var ul_obj=startLevelObj.getElementsByTagName("ul"); 
	if(ul_obj.length<1){return false;} 
	var length=ul_obj.length; 
	var li_length=0; 
	var a_length=0; 
	var li_obj=null; 
	var a_obj=null; 
	var defaultInputObj=null; 
	var defaultValue=null; 
	for(var i=0;i<length;i++){ 
		li_obj=ul_obj[i].getElementsByTagName("li"); 
		li_length=li_obj.length; 
		if(li_length<0){return false;} 
		//获取默认值 
		defaultInputObj=li_obj[0].getElementsByTagName("input");if(!defaultInputObj){return false;} 
		defaultValue=parseInt(defaultInputObj[0].value,10); 
		if(!isNaN(defaultValue) && defaultValue!=0){ 
		//alert("有初始值!"); 
		//li_obj[1].style.width=initialize_width*defaultValue+"px"; 
		//defaultValue=0; 
		} 
		for(var j=0;j<li_length;j++){ 
			a_obj=li_obj[j].getElementsByTagName("a"); 
			if(a_obj.length<1){continue;} 
			if(a_obj[0].className.indexOf("star")>0){ 
				a_obj[0].onclick=function(){ 
				 	return give_value(this); 
				} 
				a_obj[0].onfocus=function(){ 
				 	this.blur(); 
				} 
			} 
		} 
	} 
}

function give_value(obj){ 
	var status=true; 
	var parent_obj=obj.parentNode; 
	var i=0; 
	while(status){ 
		i++; 
		if(parent_obj.nodeName=="UL"){break;} 
		parent_obj=parent_obj.parentNode; 
		if(i>1000){break;}//防止找不到ul发生死循环 
	} 
	var hidden_input=parent_obj.getElementsByTagName("input")[0]; 
	if(hidden_input.length<1){/*alert("sorry?\nprogram error!")*/;} 
	var txt=obj.firstChild.nodeValue;//确保不能存在空格哦，因为这里用的firstChild 
	if(isNaN(parseInt(txt,10))){/*alert('level error!')*/;return false;}  
	hidden_input.setAttribute("value",txt.toString()); 
	//固定选中状态,先找到初始化颜色那个li 
	var current_li=parent_obj.getElementsByTagName("li"); 
	var length=current_li.length; 
	var ok_li_obj=null; 
	for(var i=0;i<length;i++){ 
		if(current_li[i].className.indexOf("current_rating")>=0){ 
			ok_li_obj=current_li[i];break;//找到 
		} 
	} 
	__current_width=txt*14; 
	ok_li_obj.style.width=__current_width+"px"; 
	return false; 
} 
function hallChange(){ 
		console.log("haha");
		$(".out").stop().animate({'top':'0px'},200); // 向上滑动 - 显示
		$(".over").stop().animate({'top':'-45px'},200);
		$(".out",this).stop().animate({'top':'45px'},200); // 向下滑动 - 隐藏
		$(".over",this).stop().animate({'top':'0px'},200); // 向下滑动 - 显示 
		var cate=$(this).attr("class");  
		console.log($(this).attr("href"));
		$(".numBoard").each(function(){
			var board=$(this).attr("type"); 
			cate  = cate.replace( /^\s+|\s+$/g, "" ); 
			board  = board.replace( /^\s+|\s+$/g, "" );  
		    if(board==cate){
				$(this).attr("style","display:block");
			} else{
				 $(this).attr("style","display:none"); 
			}
		});
		
	}