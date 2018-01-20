 

/*函数功能：读取localStorage中的version*/
function getVersion(){ 
	if(localStorage.version){
		version=localStorage.version;
	}else{
		version= 0;
	}
}
/*获得设备的UUID编号*/
function setUuid(){
	DeviceUUID=device.uuid; 
	//将设备的UUID编号存入localStorage
	localStorage.uuid=DeviceUUID; 
}
	
/*函数功能：请求后台更新数据。 。
*/
function updataData(data,url,successFunction){
	var method="POST";
	yysAjaxJsonpRequest(method,data,url,successFunction); 
}
/*函数功能：更新数据后的success函数
*参数说明：callbackData:ajax返回的函数
*/
function successUpdata(data){
	var callbackData=eval(data); 
	if(version==0){
		//新建数据库
		operateDB(NewTable); 
		//遍历数据，下载图片，存储数据。 
		dealData(callbackData.upData); 
		setVersion(callbackData.lastVersion);
	}else{ 
		// 核对桌号设置。
		var uuidData=getUuidAndTable();
		console.log(uuidData);
		//对uuid与桌号的绑定信息进行处理
		//updataData(uuidData,dealTableUrl,dealReback); 
		//console.log(callbackData.updata[1].id);
		if(callbackData!==1){
			//循环遍历处理数据（有更新） 
			console.log("更新");
			dealData(callbackData.upData); 
			setVersion(callbackData.lastVersion);
		} 
			
	} 
	//请求后台，第一页显示什么 
	//pageShow(1);
	//读取菜系名称。
	operateDB(getStyleName);
}
/*
*版本号为0与版本
*/
/*函数功能：循环遍历数据，下载图片，存储数据
*
*/
function dealData(data){ 
	for(var i=0;i<data.length;i++){
		//下载图片  
		var loadUrl=data[i].picture;
		console.log(loadUrl);
		var targetUrl=loadUrl.replace(imageStr,imageAdd);
		targetUrl=targetUrl.replace(".png",".jpg");
		//targetUrl=imageAdd+targetUrl;
		console.log(targetUrl); 
		downloadImage(loadUrl,targetUrl); 
		//将数据对应数据库的顺序存入数据库。
		paramArr[0]=data[i].id;
		paramArr[1]=data[i].styleid;
		paramArr[2]=data[i].cookname;
		paramArr[3]=data[i].introduce;
		paramArr[4]=data[i].price;
		paramArr[5]=data[i].standard;
		paramArr[6]=targetUrl;
		paramArr[7]=data[i].stylename;
		paramArr[8]=data[i].is_delete;
		//判断数据是否已经存在于数据库中
		operateDB(runSelect); 
		console.log(data[i].id);
		
	}
} 
/*函数说明：下载图片
*参数说明：sourceUrl:下载源地址
			targetUrl:下载源地址
*/
function downloadImage(sourceUrl,targetUrl){ 
	var uri = encodeURI(sourceUrl);   
	//judgeDirectory();
	fileTransfer.download(uri,targetUrl,successPhoneGap,failPhoneGap);
}
/*函数功能：设置localStorage中的version*/
function setVersion(data){
	console.log(data);
	localStorage.version=data;
	console.log(localStorage.version);
}

 /*函数功能：第一页显示内容请求*/
function pageShow(pageNum){
	var data={page:pageNum};
	//请求后台显示什么，发送到后台的是页码。回传回来的，有模板名称，菜品名称，菜系名。
	//updataData(data,pageUrl,dealPageShow);

	console.log("第一页显示123");
}
/*函数功能：phonegap文件处理成功的通知函数*/
function successPhoneGap(){
	console.log("phonegap deal success");
}
/*函数功能：phonegap文件处理失败的通知函数*/
function failPhoneGap(){
	console.log("phonegap deal fail");
}
/*函数说明：处理图片时，判断目录是否存在*/
function judgeDirectory(){
	window.resolveLocalFileSystemURL( imageAdd,checkDirectory,failPhoneGap);
	window.requestFileSystem(LocalFileSystem.PERSISTENT,0,checkDirectory,failPhoneGap);
}
/*函数说明：目录不存在就创建*/
function checkDirectory(fileSystem){
	//查找判断该目录是否存在，
	fileSystem.getDirectory(imageAdd, {create:true}, successPhoneGap,failPhoneGap); 
}