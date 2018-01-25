/**
 * 广告控制类：主要负责广告的内容管理
 */
var Ads = Common.extend({
	init:function(){
		this.checkUrl = "http://"+SERVER+"/"+ProName+"/Ads/GetAds";
        this.AdsData= 'SELECT * FROM ads where `adnum` = ?';
        if(localStorage.adVersion!=null) this.adVersion = localStorage.adVersion;
        else this.adVersion = 0;
	},
    //将version写入本地存储
    setAdVersion:function(version){
        localStorage.adVersion = version;
        console.log(version);
        return version;
    },
    //顶端广告渲染
        showTopAds: function() {
            document.getElementById('adsMenu').style.display = "block";
            var adsTop = "SELECT * FROM `ads` ";
            console.log(adsTop);
            function callbackFunc(tx, result) {
                //result时从数据库搜索的所有top=1的数据
                console.log(result.rows.length);
                var count = result.rows.length;
                //渲染数据
                if(count!=0) {
                    //list.innerHTML = "";
                    modelCon.adsArr=[];
                    modelCon.adsArrMenu=[];
                    for(var i=0;i<count;i++){
                        var param=result.rows.item(i).adtext;
                        var adnum =result.rows.item(i).adnum;
//                        var address=result.rows.item(i).address;//新版数据库已删此字段
                        var phone =result.rows.item(i).phone;
                        var adpic =  result.rows.item(i).adpic;
                        var adname = result.rows.item(i).adname;
                        var activity = result.rows.item(i).activity;
                        if(result.rows.item(i).is_delete = '0'){
                            modelCon.adsArr.push({adnum:adnum,adtext:param,adname:adname});
                            console.log(modelCon.adsArr);
                            modelCon.adsArrMenu.push({adnum:adnum,adtext:param,phone:phone,adname:adname,activity:activity,adpic:adpic});
                            console.log(modelCon.adsArrMenu);
                        }
                    }
                };
            }
            adDb.executeAdDB(adsTop, [], callbackFunc);
        },
        //详情页广告渲染
        showDetailAds: function(adnum) {
            document.getElementById('show_big').style.display = "block";
            var adsTopDetail = "SELECT * FROM `ads` where  `adnum` = '" + adnum + "'";
            console.log(adsTopDetail);
            //解析数据，填充页面
            function func(tx, results) {
                var count = results.rows.length;
                //渲染数据
                if(count!=0) {
                    for(var i=0;i<count;i++){
                        var param = results.rows.item(i);
                        console.log(param);
                        //图片展示(show_big_img src)
                        $('#show_big_img').attr('src', param.adpic);
                        //店铺介绍（历史、类型、菜品）
                        $("#content1").html(param.introduction);
                        //最新活动
                        $("#content2").html(param.activity);
                        //地址以及电话//地址字段已删
//                        $("#content3").html('店铺地址' + param.address + '&nbsp;' + '店铺电话' + param.phone);
                        $("#content3").html('店铺电话' + param.phone);
                    }
                }
            };
            adDb.executeAdDB(adsTopDetail, [], func);

        },
         //轮播广告渲染
        //        showLunBoAds: function() {
        //            var adsLunBo = "SELECT * FROM ads where `vehicle` = '1'";
        //
        //            function func(tx, result) {
        //            console.log(result.rows.length);
        //                var listLun = document.getElementById('wrap');
        //                var oLi = document.createElement('li'); //轮播列表
        //                for (var i = 0; i <= result.length; i++) {
        //                    var oB = document.createElement('a');
        //                    var pic = document.createElement('image');
        //                    var param = results.rows.item(i);
        //                    console.log(param);
        //                    var obj = { adnum: param.adnum, adtext: param.adtext, adpic: param.adpic, detail: param.detail };
        //                    pic.attr('src', adpic).attr("width", "100%").attr("height", "100%");
        //                    pic.attr('id', adnum);
        //                    adId = pic.attr('id');
        //                    oB.innerText = data[i][1];
        //                    console.log(oB);
        //                    oB.appendChild(pic);
        //                    if (detail == 1) {
        //                        //绑定onclick事件
        //                        pic.onclick = function(adId) {
        //                            document.getElementById('show_big').style.display = "block";
        //                            //触发详情展示函数
        //                            showDetailAds(adId);
        //                        }
        //                    }
        //                    oLi.appendChild(oB);
        //                }
        //            }
        //            listLun.appendChild(oLi);
        //            adDb.executeAdDB(adsLunBo, [], func);
        //        },
    doAdSyn:function(){
        this.ajaxRequest();
    },
    //首次加载或者版本号过期，进行更新数据
    updateAdData:function(data){
        var jsonData;
        console.log(data);
        if(data=="success"){
            initSystem();
        }else{
            jsonData = eval(data);
            console.log(jsonData.upData);
            for (var i = jsonData.upData.length - 1; i >= 0; i--) {
                var imageStr="http://"+SERVER;
                var imageUrl=imageStr+jsonData.upData[i].adpic;
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
                jsonData.upData[i].adpic=targetUrl;

                adDb.saveAdDataToBase(jsonData.upData[i]);
            }
            //将version写入本地存储
            console.log(jsonData.lastVersion);
            adData.setAdVersion(jsonData.lastVersion);
            initSystem();
        }
    },
    ajaxRequest:function(){
        console.log(this.adVersion);
        console.log(this.checkUrl);
        this._super({adVersion:this.adVersion},this.checkUrl,this.updateAdData);
    }
})
