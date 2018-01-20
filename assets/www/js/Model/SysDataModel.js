/*
 * 数据同步控制类：主要控制版本的同步问题。
 */ 
var SysData=Common.extend({
	init:function(){
		this.checkUrl = "http://"+SERVER+"/"+ProName+"/SynVersion/CompareVersion";
 		if(localStorage.version!=null)
 		    this.version = localStorage.version;
 		else this.version = 0;   
	},
	doSyn:function(){
		this.ajaxRequest();
	},
	//将version写入本地存储
	setVersion:function(version){
		localStorage.version = version;
		console.log(version);
		return version;
	}, 
	//首次加载或者版本号过期，进行更新数据
	updateData:function(data){  
		var jsonData; 
		console.log(data);
		if(data=="success"){
			initSystem();
		}else{ 
			jsonData = eval(data);
			console.log(jsonData.upData);
			for (var i = jsonData.upData.length - 1; i >= 0; i--) { 
				var imageStr="http://"+SERVER; 
				var imageUrl=jsonData.upData[i].picture;
				var targetUrl=imageUrl.replace(imageStr,imageAdd);
				targetUrl=targetUrl.replace("png","jpg"); 
				console.log(imageUrl); 
				console.log(targetUrl);
				fileTransfer.download(encodeURI(imageUrl),targetUrl,
					function(){
						console.log("图片下载成功。");
					},
					function(){
						console.log("图片下载失败");
					});
				jsonData.upData[i].picture=targetUrl;
				console.log(jsonData.upData[i].is_delete);
				upDb.saveDataToBase(jsonData.upData[i]); 
			}  
			//将version写入本地存储
			dataSyn.setVersion(jsonData.lastVersion);
			initSystem();
		}  
		 
	},
	ajaxRequest:function(){
		console.log(this.version);
		this._super({version:this.version},this.checkUrl,this.updateData);
		//this._super({version:this.version},this.checkUrl,initSystem);
	} 
})
 