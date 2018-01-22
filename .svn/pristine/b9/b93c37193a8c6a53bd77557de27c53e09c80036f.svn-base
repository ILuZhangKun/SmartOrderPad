 /********
 *目的：封装着平常经常用的js函数，希望做到不断添加，不断完善
 *作者：YY
 *版本：V1.0
 *********/
// 全局变量
var globalData001;
/*****************
**函数作用：用于页面的ajax请求，
**参数说明：data：向后台传递的数据；
						url：需要传递参数的URL；
						method：后台接受参数方式
**data格式：	{receive:data}
						receive是后台接受的参数名称；
						data是要传递的参数； 
**返回参数：result 
*****************/
 function yysAjaxRequest(method,data,url){
	$.ajax({
		type:method,
		url:url,
		data:data,
		async:false,
		error: function(XMLHttpRequest, textStatus, errorThrown){
			// console.log("Error:"+XMLHttpRequest.readyState+"   "+XMLHttpRequest.responseText);
		},
		success:function(data){
			var jsonobj=data; 
			// console.log(typeof(jsonobj));
			// console.log((typeof jsonobj=='string')&&jsonobj.constructor==String) ; 
			// //将返回的json数据解析。
			// if(data!=null){
			// 	jsonobj=JSON.parse(data);
			// }else{
			// 	jsonobj=data;
			// } 
			globalData001=jsonobj;
			// console.log(jsonobj);
		 }
	});
	return  globalData001;
 }
 /************************
**函数作用：将时间戳转化成标准时间，
**参数说明：timesTamp：时间戳；  
**返回参数：result 
 ************************/
	function getLocalTime(timesTamp) {     
		time=new Date(parseInt(timesTamp) * 1000).toLocaleString();
		// console.log(time);
		//timeArr=time.split("下午");.substr(0,17);
		//var result;
		//result=timeArr[0]+timeArr[1];
		return time;
	}  
/************************
**函数作用：将时间戳转化成标准时间，
**参数说明：timesTamp：时间戳；  
**返回参数：result 
 ************************/