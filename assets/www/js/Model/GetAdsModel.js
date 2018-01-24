/**
 * 广告详情控制类：
 */
var GetAds = Common.extend({
	init:function(){
		this.checkUrl = "http://"+SERVER+"/"+ProName+"/Introduction/GetIntroduction";
	},
	GetInformation:function(data){
		var jsonData;
		jsonData = eval(data);
		var introduction = jsonData[0].introduction;
		var activity = jsonData[0].activity;
        var address = jsonData[0].address;
		$("#content1").html(introduction);
        $("#content2").html(activity);
        $("#content3").html(address);
	},
	showAd:function(){
    	    this.ajaxRequest();
    	},
	ajaxRequest:function(){
	    this._super("",this.checkUrl,this.GetInformation);
	},
})