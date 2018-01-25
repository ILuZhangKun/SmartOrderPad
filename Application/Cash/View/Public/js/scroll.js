(function($){
	$.fn.extend({
        Scroll:function(opt,callback){
            //参数初始化
            if(!opt) var opt={};
            var _this=$("#scrollDiv").eq(0).find("ul:first");
             var _this2=$("#scrollDiv2").eq(0).find("ul:first");
             var _this3=$("#scrollDiv3").eq(0).find("ul:first");
             var _this4=$("#scrollDiv4").eq(0).find("ul:first");
			 
            var lineH=_this.find("li:first").height();//获取行高
            var line=opt.line;
             var speed=opt.speed;
              var  timer=opt.timer;
            if(line==0) line=1;
            var upHeight=0-line*lineH;
            
                 //2个div一起滚动的函数
            scrollUp=function(){
                    _this.animate({
                            marginTop:upHeight
                    },speed,function(){
                            for(i=1;i<=line;i++){
                                    _this.find("li:first").appendTo(_this);
                            }
                            _this.css({marginTop:0});
                    });
                            
                     _this2.animate({
                            marginTop:upHeight
                    },speed,function(){
                            for(i=1;i<=line;i++){
                                    _this2.find("li:first").appendTo(_this2);
                            }
                            _this2.css({marginTop:0});
                    });
					
					  _this3.animate({
                            marginTop:upHeight
                    },speed,function(){
                            for(i=1;i<=line;i++){
                                    _this3.find("li:first").appendTo(_this3);
                            }
                            _this3.css({marginTop:0});
                    });
					
					  _this4.animate({
                            marginTop:upHeight
                    },speed,function(){
                            for(i=1;i<=line;i++){
                                    _this4.find("li:first").appendTo(_this4);
                            }
                            _this4.css({marginTop:0});
                    });
					
					
            }
                 
                 //只有第一个div滚动的函数
            scrollUp2=function(){
                    _this.animate({
                            marginTop:upHeight
                    },speed,function(){
                            for(i=1;i<=line;i++){
                                    _this.find("li:first").appendTo(_this);
                            }
                            _this.css({marginTop:0});
                    });
                            
            }
                 //只有第二个div滚动的函数
            scrollUp3=function(){
                    _this2.animate({
                            marginTop:upHeight
                    },speed,function(){
                            for(i=1;i<=line;i++){
                                    _this2.find("li:first").appendTo(_this2);
                            }
                            _this2.css({marginTop:0});
                    });
                            
            }
			
			 //只有第三个div滚动的函数
            /*ScrollUp4=function(){
                    _this2.animate({
                            marginTop:upHeight
                    },speed,function(){
                            for(i=1;i<=line;i++){
                                    _this2.find("li:first").appendTo(_this2);
                            }
                            _this2.css({marginTop:0});
                    });
                            
            }*/
                 
            timerID=setInterval("scrollUp()",timer);
            //鼠标事件绑定
            _this.hover(function(){
                            if(typeof(timerID) != "undefined")
                        clearInterval(timerID);
                             if(typeof(timerID2) != "undefined")
                                clearInterval(timerID2);
                            timerID3=setInterval("scrollUp3()",timer);
            },function(){
                  if(typeof(timerID2) != "undefined")
                             clearInterval(timerID2);
                     if(typeof(timerID3) != "undefined")
                             clearInterval(timerID3);
                    timerID=setInterval("scrollUp()",timer);
            }).mouseout();
            
            
             //鼠标事件绑定
            _this2.hover(function(){
                         if(typeof(timerID) != "undefined")
                    clearInterval(timerID);
                         if(typeof(timerID3) != "undefined")
                             clearInterval(timerID3);
                            timerID2=setInterval("scrollUp2()",timer);
            },function(){
                  if(typeof(timerID2) != "undefined")
                         clearInterval(timerID2);
                     if(typeof(timerID3) != "undefined")
                         clearInterval(timerID3);
                    timerID=setInterval("scrollUp()",timer);
            }).mouseout();
        }        
     }) 
})(jQuery);