$(document).ready(function() {
	//设置头部标签默认显示
	var title = $("title").html(); 
	$(".menu").find("li div.text").each(function(){
		var tabTitle = $(this).html(); 
		tabTitle  = tabTitle.replace( /^\s+|\s+$/g, "" ); 
		title  = title.replace( /^\s+|\s+$/g, "" );  
		if($(this).parent().hasClass("active") ){
			$(this).parent().removeClass("active"); 
		}
		if(title==tabTitle){ 
			$(this).parent().addClass("active"); 
		} 

	});
	//头部标签点击切换
	$(".menu").find("li").click(function(){
		$(this).addClass("active");
		$(this).siblings().removeClass("active");
		var id = $(this).attr("id"); 
		console.log(id);
		switch(id){
			case "table": 
		  		window.location.href="../table/showTable";
		  	break;
			case "checkout":
		  		window.location.href="../order/index";
		  	break;
		  	case "reservation":
		  		window.location.href="../book/index";
		  	break;
		  	case "other":
		  		window.location.href="../other/index";
		  	break;
			default:
		  		window.location.href="../table/index";
		}
	}); 
	/*小标签动态显示*/ 
	$("#menu2 li a").wrapInner( '<span class="out"></span>' ); 
	$("#menu2 li a").each(function() {
		$('<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
	}); 
	// $("#menu2 li a").hover(function() {
	// 	$(".out",this).stop().animate({'top':'45px'},200); // 向下滑动 - 隐藏
	// 	$(".over",this).stop().animate({'top':'0px'},200); // 向下滑动 - 显示
	// }, function() {
	// 	$(".out",this).stop().animate({'top':'0px'},200); // 向上滑动 - 显示
	// 	$(".over",this).stop().animate({'top':'-45px'},200); // 向上滑动 - 隐藏
	// }); 
	//小标签切换
	$(".numBoard").attr("style","display:none");
	$(".numBoard:first").attr("style","display:block");
	$(".nav4").children(":first").find(".out").attr("style","top:45px");
	$(".nav4").children(":first").find(".over").attr("style","top:0px");
	$(".nav4").children().click(function(e){
		// $(".out").attr("style","top:0px");
		// $(".over").attr("style","top:-45px");
		// $(this).find(".out").attr("style","top:45px");
		// $(this).find(".over").attr("style","top:0px");
		$(".out").stop().animate({'top':'0px'},200); // 向上滑动 - 显示
		$(".over").stop().animate({'top':'-45px'},200);
		$(".out",this).stop().animate({'top':'45px'},200); // 向下滑动 - 隐藏
		$(".over",this).stop().animate({'top':'0px'},200); // 向下滑动 - 显示

		var cate=$(this).attr("class");  
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
		
	});
	//桌号点击弹框事件 
	$(".numBoard").children().click(function(){
		$("#tableChoose").show();
		var tableId = $(this).attr("id");
		var tableName = $(this).html();
		tableName  = tableName.replace( /^\s+|\s+$/g, "" ); 
		var cId = $(this).parent().attr("id");
		var cName = $(this).parent().attr("type");
		$("a[type='book']").attr("href","../book/index?cid="+cId+"&cname="+cName+"&tableid="+tableId+"&tablename="+tableName);
		$("a[type='order']").attr("href","../order/index");
		$("a[type='other']").attr("href","../other/index"); 
	});
	//弹框取消事件
	$("#cancel").click(function(){
		$("#tableChoose").hide();
	});
	//结账桌号查询
	$("#searchTableId").click(function(){
		var tableId = $("#tableId").val();
		console.log(tableId);
	});
	//现金结账
	$(".inputCash").attr("style","display:none");
	$
	$("#inputCash").click(function(){ 
		$(".inputCash").attr("style","display:block");
	});
	$(".submitMoney").click(payOrder);
	//预约设定
	$("#RVsubmit").click(booking);
	//预约查询
	$("#RVsearch").click(booking);
	$(".cancelBook").click(cancelBook);
	// //查询空座
	 $("#searchTable").click(getTable);
	 //查询本日收入
	 // $(".searchIncome").click(searchIncome);
	//时间选择器
    $('.time-start').datetimepicker({
        format: 'yyyy-mm-dd',
        language:"zh-CN",
        minView:2,
        autoclose:true
    }); 
    $('#datetimepicker').datetimepicker({
       format: 'yyyy-mm-dd',
        language:"zh-CN",
        minView:2,
        autoclose:true,
        pickerPosition:'bottom-right'
    })
    //弹窗取消按钮
    $("#alertCancel").click(function(){
    	$("#alert").hide();
    });
	//设置字幕滚动 
	$("#scrollDiv").Scroll({line:1,speed:1000,timer:700});  
});

 

//预定界面点击事件函数
function dealUrl(url){  
        var query  = $('#book_info').find('[name]').serialize();
        query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g,'');
        query = query.replace(/^&/g,''); 
        if( url.indexOf('?')>0 ){
            url += '&' + query;
        }else{
            url += '?' + query;
        } 
        console.log(url);
        return(url);  
	}
//制订查询
function booking(){
	var url = $(this).attr('url');
	url = dealUrl(url);
	// 这里需要检查时间(是否过期)，电话是否符合规范，找到餐台对应的唯一id
    if(!url.match("RVday")){
    	alert("请输入预定日期");
    	return;
    } 
    if(!url.match("RVdname")){
    	alert("请输入订餐人姓名");
    	return;
    }
    var urlArr = url.split("?");
    var urlData = urlArr[1].split("&");
    for(var i=0;i<urlData.length;i++){
    	var dataArr = urlData[i].split("=");
    	if(dataArr[0]=="RVtel"){
    		if(!dataArr[1].match(/^1\d{10}$/)){
	         	alert("电话号码不符合规范！");
	         	return;
	         }
    	}
    	if(dataArr[0]=="RVday"){
    		var today = new Date();
			today.setHours(0);
			today.setMinutes(0);
			today.setSeconds(0);
			today.setMilliseconds(0); 
    		if(today.getTime()>Date.parse(dataArr[1])){
    			alert("日期不符合规范！");
	         	return;
    		}
    	}
    } 
    window.location.href = url;
} 
//取消预定
function cancelBook(){ 
	var date = $(this).attr("id");
	var className = $(this).attr("class");
	var classArr = className.split(" ");
	var time = classArr[3];
	var name = classArr[4];
	var data = {date:date,time:time,name:name};
	 if(!confirm("确定要取消该预定吗？"))return; 
	var result = yysAjaxRequest("POST",data,"cancelBook"); 
	if(result=="success"){   
		$("#alert").show();
		$("#alert").find(".modal-body").html("取消成功"); 
		setTimeout(function(){
			window.location.href = "index";
		},3000);
	}else{  
		setTimeout(function(){
			$("#alert").show();
			$("#alert").find(".modal-body").html("取消失败！请核实后取消预定"); 
		},5000);
	} 
	 

}
//查询空座（指定时间）
function getTable(){
	var day = $("#tableDay").val();
	var today = new Date();
	today.setHours(0);
	today.setMinutes(0);
	today.setSeconds(0);
	today.setMilliseconds(0); 
	if(today.getTime()>Date.parse(day)){
		alert("日期不符合规范！");
     	return;
	}
	 if(day==""){
	 	$("#alert").show();
		$("#alert").find(".modal-body").html("请输入查询时间"); 
	 }else{ 
	 	window.location.href = "showTable?date="+day;
	 }
}
//买单
function payOrder(){ 
	var realMoney = $("#realMoney").val();
	if(realMoney==""){ 
		setTimeout(function(){
			$("#alert").show();
			$("#alert").find(".modal-body").html("请输入实收金额");  
		},3000);
	}else{
		totleMoney=$("#totleMoney").html().split("</strong>")[1];
		var change = realMoney-totleMoney;
		$(".takeChange").html("<strong>找零：</strong>"+change+"元"); 
		//ajax修改order表
		var tableId = $(".payTable").attr("class").split(" ")[1];
		var result = yysAjaxRequest("POST",{tableid:tableId,realMoney:realMoney,paytype:"现金结账"},"payBill"); 
		if(result=="success"){   
			$("#alert").show();
			$("#alert").find(".modal-body").html("成功买单！"); 
			setTimeout(function(){
				window.location.href = "index";
			},3000);
		}else{  
			console.log(result);
			setTimeout(function(){
				$("#alert").show();
				$("#alert").find(".modal-body").html("遇到点小问题！请重新查询买单!"); 
			},5000);
		}
	} 
}
//查询某一天的收入
function searchIncome(){
	day = $("#incomeDay").val();
	stampStart = Date.parse(day);//查询时间凌晨的时间戳（毫秒）
	//一天86400000毫秒
	stampEnd = stampStart+86400000;
	var result = yysAjaxRequest("POST",{tableid:tableId,paytype:"现金结账"},"payBill"); 

}