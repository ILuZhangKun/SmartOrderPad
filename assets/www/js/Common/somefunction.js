 
 /*****************
**函数作用：用于页面的跨域ajax请求，
**参数说明：data：向后台传递的数据；
						url：需要传递参数的URL；
						method：后台接受参数方式
**data格式：	{receive:data}
						receive是后台接受的参数名称；
						data是要传递的参数； 
**返回参数：result 
*****************/
var Common =Class.extend({
	init:function(){
		this.loginUrl="http://"+SERVER+"/"+ProName+"/CheckAuth";
		//this.pageUrl:"http://"+SERVER+"/"+ProName+"/XXX";
	},  
	loginc:function(data,fun){
		this.ajaxRequest(data,this.loginUrl,fun); 
	},
	GetRandomNum:function(Min,Max){   
		var Range = Max - Min;   
		var Rand = Math.random();   
		return(Min + Math.round(Rand * Range));   
	},
	ajaxRequest:function(data,url,func){
		console.log(url);  
		$.ajax({
			type: "POST",
			async: false,
			crossDomain:true,
			url: url,
			data:data,
			dataType: "jsonp",
			//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
			jsonp: "callback",
			//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
			//jsonpCallback:"itemsListGet",
			error: function(XMLHttpRequest, textStatus, errorThrown){
				console.log("Error:"+XMLHttpRequest.readyState+"   "+XMLHttpRequest.responseText);
			},
			success: func
		}); 
	},
		ajaxRequestTest:function(data,url,func){
    		console.log(url);
    		$.ajax({
    			type: "POST",
    			async: false,
    			crossDomain:true,
    			url: url,
    			data:data,
    			dataType: "jsonp",
    			//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
    			jsonp: "callback",
    			//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
    			jsonpCallback:"itemsListGet",
    			error: function(XMLHttpRequest, textStatus, errorThrown){
    				console.log("Error:"+XMLHttpRequest.readyState+"   "+XMLHttpRequest.responseText);
    			},
    			success:function(data){
    			    console.log(data);
    			}
    		});
    	}

})

 