<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo ($meta_title); ?>|点餐管理平台</title>
    <link href="/smartorder/Public/favicon.ico" type="image/x-icon" rel="shortcut icon">
    <link rel="stylesheet" type="text/css" href="/smartorder/Public/Admin/css/base.css" media="all">
    <link rel="stylesheet" type="text/css" href="/smartorder/Public/Admin/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="/smartorder/Public/Admin/css/module.css">
    <link rel="stylesheet" type="text/css" href="/smartorder/Public/Admin/css/style.css" media="all">
    
    <link rel="stylesheet" type="text/css" href="/smartorder/Public/Admin/css/order.css">
    
	<!-- <link rel="stylesheet" type="text/css" href="/smartorder/Public/Admin/css/<?php echo (C("COLOR_STYLE")); ?>.css" media="all"> -->
     <!--[if lt IE 9]>
    <script type="text/javascript" src="/smartorder/Public/static/jquery-1.10.2.min.js"></script>
    <![endif]--><!--[if gte IE 9]><!-->
    <script type="text/javascript" src="/smartorder/Public/static/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/smartorder/Public/static/avalon/json2.js"></script>
    <script type="text/javascript" src="/smartorder/Public/Admin/js/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="/smartorder/Public/static/avalon/somefunction.js"></script>
    <script type="text/javascript" src="/smartorder/Public/static/count/exporting.js"></script>
    
    <script type="text/javascript" src="/smartorder/Public/Admin/js/order.js"></script>
    <script type="text/javascript" src="/smartorder/Public/Admin/js/echarts.js"></script>
    <script type="text/javascript" src="/smartorder/Public/Admin/js/echarts.min.js"></script>
   
    <!--<![endif]-->
    <script type="text/javascript">
    (function(){
        var ThinkPHP = window.Think = {
            "ROOT"   : "/smartorder", //当前网站地址
            "APP"    : "/smartorder/admin.php", //当前项目地址
            "PUBLIC" : "/smartorder/Public", //项目公共目录地址
            "DEEP"   : "<?php echo C('URL_PATHINFO_DEPR');?>", //PATHINFO分割符
            "MODEL"  : ["<?php echo C('URL_MODEL');?>", "<?php echo C('URL_CASE_INSENSITIVE');?>", "<?php echo C('URL_HTML_SUFFIX');?>"],
            "VAR"    : ["<?php echo C('VAR_MODULE');?>", "<?php echo C('VAR_CONTROLLER');?>", "<?php echo C('VAR_ACTION');?>"]
        }
    })();
    </script>
    
    <style>body{padding: 40px}</style>

</head>
<body>
    <!-- 头部 -->
    <div class="header">
        <!-- Logo -->
        <span class="logo"></span>
        <!-- /Logo -->

        <!-- 主导航 -->
        <ul class="main-nav">
            <?php if(is_array($__MENU__["main"])): $i = 0; $__LIST__ = $__MENU__["main"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php echo ((isset($menu["class"]) && ($menu["class"] !== ""))?($menu["class"]):''); ?>"><a href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a></li>
                <!-- <li>&nbsp;</li> --><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!-- /主导航 -->

        <!-- 用户栏 -->
        <div class="user-bar">
            <a href="javascript:;" class="user-entrance"><i class="icon-user"></i></a>
            <ul class="nav-list user-menu hidden">
                <li class="manager">你好，<em title="<?php echo session('user_auth.username');?>"><?php echo session('user_auth.username');?></em></li>
                <li><a href="<?php echo U('User/updatePassword');?>">修改密码</a></li>
                <li><a href="<?php echo U('User/updateNickname');?>">修改昵称</a></li>
                <li><a href="<?php echo U('Public/logout');?>">退出</a></li>
            </ul>
        </div>
    </div>
    <!-- /头部 -->

    <!-- 边栏 -->
    <div class="sidebar">
        <!-- 子导航 -->
        
            <div id="subnav" class="subnav">
                <?php if(!empty($_extra_menu)): ?>
                    <?php echo extra_menu($_extra_menu,$__MENU__); endif; ?>
                <?php if(is_array($__MENU__["child"])): $i = 0; $__LIST__ = $__MENU__["child"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub_menu): $mod = ($i % 2 );++$i;?><!-- 子导航 -->
                    <?php if(!empty($sub_menu)): if(!empty($key)): ?><h3><i class="icon icon-unfold"></i><?php echo ($key); ?></h3><?php endif; ?>
                        <ul class="side-sub-menu">
                            <?php if(is_array($sub_menu)): $i = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li>
                                    <a class="item" href="<?php echo (U($menu["url"])); ?>"><?php echo ($menu["title"]); ?></a>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul><?php endif; ?>
                    <!-- /子导航 --><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        
        <!-- /子导航 -->
    </div>
    <!-- /边栏 -->

    <!-- 内容区 -->
    <div id="main-content">
        <div id="top-alert" class="fixed alert alert-error" style="display: none;">
            <button class="close fixed" style="margin-top: 4px;">&times;</button>
            <div class="alert-content">这是内容</div>
        </div>
        <div id="main" class="main">
            
            <!-- nav -->
            <?php if(!empty($_show_nav)): ?><div class="breadcrumb">
                <span>您的位置:</span>
                <?php $i = '1'; ?>
                <?php if(is_array($_nav)): foreach($_nav as $k=>$v): if($i == count($_nav)): ?><span><?php echo ($v); ?></span>
                    <?php else: ?>
                    <span><a href="<?php echo ($k); ?>"><?php echo ($v); ?></a>&gt;</span><?php endif; ?>
                    <?php $i = $i+1; endforeach; endif; ?>
            </div><?php endif; ?>
            <!-- nav -->
            

            
	<label>桌号：<?php echo ($tid); ?></label>
		<!-- 数据列表 -->
		
		<div id="outputDiv" style="display:none;position:absolute;left:0px;top:0px;width:15%;height:20%;background:white;">
      <div style="margin-left:-20px;font-size:10px;">
      &emsp;&emsp;&emsp;&emsp;欢迎您的光临</br>
      -------------------------------------------------</br>
      &emsp;&emsp;&emsp;&emsp;北京工业大学</br>
      店名：&emsp;&emsp;&emsp;天天餐厅</br>
      桌号：&emsp;&emsp;&emsp;<?php echo ($tableId); ?></br>
      收银员：&emsp;&emsp;S201525082</br>
      打印时间：&emsp;</br>
      机器号：&emsp;&emsp;01</br>
      会员号：&emsp;&emsp;25082</br>
      -------------------------------------------------</br>
      <table >
          <thead>
              <tr>
                  <th>菜名</th>
                  <th>&emsp;单价/元</th>
                  <th>&emsp;份数/份</th>
                  <th>&emsp;小计</th>
              </tr>
          </thead>
          <?php if(is_array($orderList)): $i = 0; $__LIST__ = $orderList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><tr >
                 <td><?php echo ($item["name"]); ?></td>
                  <td>&emsp;<?php echo ($item["price"]); ?></td>
                  <td>&emsp;&emsp;<?php echo ($item["num"]); ?></td>
                  <td>&emsp;<?php echo ($item["total"]); ?></td>
              </tr><?php endforeach; endif; else: echo "" ;endif; ?>
      </table>
      -------------------------------------------------</br>
      总计：&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<?php echo ($total_money); ?></br>
      优惠：&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;0</br>
      实收：&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<?php echo ($total_money); ?></br>
      -------------------------------------------------</br>
    &emsp;&emsp;&emsp;谢谢回顾，欢迎下次光临！</br>
    &emsp;&emsp;欢迎来电咨询：13888888888</br>
    &emsp;地址：北京市朝阳区平乐园100号</br>
    </div>
    </div>
		
		<div class="data-table table-striped" style="top: 40px;">
			<table class="">
				<thead>
					<tr>					
						<th>菜品名称</th>
						<th>单价</th>
						<th>数量</th>
						<th>小结</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<?php if(is_array($orderList)): foreach($orderList as $key=>$v): ?><tr>					
							<td><?php echo ($v["name"]); ?></td>
							<td><?php echo ($v["price"]); ?></td>	
							<td><?php echo ($v["num"]); ?></td>
							<td><?php echo ($v["total"]); ?></td>
							
							<td><a href="<?php echo U('edit');?>?">编辑</a>|
								<a href="<?php echo U('del');?>?">删除</a>
							</td>
						</tr><?php endforeach; endif; ?>
				</tbody>
			</table>
        
</div>
        <br/>
        <lable>总计金额：<?php echo ($total_money); ?>元</lable>
        <br/>
        <br/>
        <form method="post" action="<?php echo U('pay');?>">
        	<input type="hidden" name="oid" value="<?php echo ($oid); ?>">
        	<input type="hidden" name="tid" value="<?php echo ($tid); ?>">
            <label>支付方式：</label>
            </br>
            <!--<input type="radio" id="money" class="cash-button" name="pay_type" value="现金" onclick="cashPay()"/>现金
             <input type="radio" id="card" class="cash-button" name="pay_type" value="刷卡" onclick="posPay()">刷卡
            <input type="radio" id="weixin" class="cash-button" name="pay_type" value="微信/支付宝" onclick="mobilePay()">微信/支付宝-->
            
            <input type="button" id="money" class="cash-button" name="pay_type" value="现金" onclick="cashPay()">
            <input type="button" id="card" class="cash-button" name="pay_type" value="刷卡" onclick="posPay()">
            <input type="button" id="weixin" class="cash-button" name="pay_type" value="微信/支付宝" onclick="mobilePay()">
            </br>
           <input id="cash" name="cash" style="display: none;margin-left: 10px;" type="text">
            </br>
            </br>
            <br />
            <br />
            <button class="cash-submit" type="submit">结账</button>
            <button class="cash-submit" type="submit" id="print">打印小票</button>
        </form>

</br>
</br>
<input type="button" class="cash-back" onclick="history.back();" value="返回上一级">
<script>
	$(document).ready(function(){
		$(".sidebar").css("display","none");
	});
</script>
<script type="text/javascript">
	$("#print").click(function(){
		var bodyHTML=window.document.body.innerHTML;
		window.document.body.innerHTML=$('#outputDiv').html();
		window.print();
		// window.document.body.innerHTML=bodyHTML;
	});
</script>
<script type="text/javascript">
	function cashPay()
	{
		var inputshow=document.getElementById('money').value;
		console.log(inputshow);
		if (inputshow == "现金") {
			document.getElementById('cash').style.display="block";
		}
		
//		document.getElementById('money').style.backgroundColor="forestgreen";
//		document.getElementById('money').style.color="black";
		alert("请在文本框中输入金额！");
	}
	function posPay()
	{
		var inputshow=document.getElementById('card').value;
		console.log(inputshow);
		if (inputshow != "现金") {
			document.getElementById('cash').style.display="none";
		}
//		document.getElementById('card').style.backgroundColor="forestgreen";
//		document.getElementById('card').style.color="black";
		alert("请使用POS机结账！");

	}
	function mobilePay()
	{
		var inputshow=document.getElementById('weixin').value;
		console.log(inputshow);
		if (inputshow != "现金") {
			document.getElementById('cash').style.display="none";
		}
//		document.getElementById('weixin').style.backgroundColor="forestgreen";
//		document.getElementById('weixin').style.color="black";
		alert("请打开手机支付二维码界面！");

	}
</script>

        </div>
        <div class="cont-ft">
            <div class="copyright">
                <div class="fl">感谢使用&nbsp;&nbsp;<a href="<?php echo U("Admin/Index/index");?>">智能点餐</a>&nbsp;&nbsp;平台</div>
                <div class="fr">V<?php echo (ONETHINK_VERSION); ?></div>
            </div>
        </div>
    </div>
    <!-- /内容区 -->

    <script type="text/javascript" src="/smartorder/Public/static/think.js"></script>
    <script type="text/javascript" src="/smartorder/Public/Admin/js/common.js"></script>
    <script type="text/javascript">
        +function(){
            var $window = $(window), $subnav = $("#subnav"), url;
            $window.resize(function(){
                $("#main").css("min-height", $window.height() - 130);
            }).resize();

            /* 左边菜单高亮 */
            url = window.location.pathname + window.location.search; 
            url = url.replace(/(\/(p)\/\d+)|(&p=\d+)|(\/(id)\/\d+)|(&id=\d+)|(\/(group)\/\d+)|(&group=\d+)/, ""); 
            $subnav.find("a[href='" + url + "']").parent().addClass("current");

            /* 左边菜单显示收起 */
            $("#subnav").on("click", "h3", function(){
                var $this = $(this);
                $this.find(".icon").toggleClass("icon-fold");
                $this.next().slideToggle("fast").siblings(".side-sub-menu:visible").
                      prev("h3").find("i").addClass("icon-fold").end().end().hide();
            });

            $("#subnav h3 a").click(function(e){e.stopPropagation()});

            /* 头部管理员菜单 */
            $(".user-bar").mouseenter(function(){
                var userMenu = $(this).children(".user-menu ");
                userMenu.removeClass("hidden");
                clearTimeout(userMenu.data("timeout"));
            }).mouseleave(function(){
                var userMenu = $(this).children(".user-menu");
                userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
                userMenu.data("timeout", setTimeout(function(){userMenu.addClass("hidden")}, 100));
            });

	        /* 表单获取焦点变色 */
	        $("form").on("focus", "input", function(){
		        $(this).addClass('focus');
	        }).on("blur","input",function(){
				        $(this).removeClass('focus');
			        });
		    $("form").on("focus", "textarea", function(){
			    $(this).closest('label').addClass('focus');
		    }).on("blur","textarea",function(){
			    $(this).closest('label').removeClass('focus');
		    });

            // 导航栏超出窗口高度后的模拟滚动条
            var sHeight = $(".sidebar").height();
            var subHeight  = $(".subnav").height();
            var diff = subHeight - sHeight; //250
            var sub = $(".subnav");
            if(diff > 0){
                $(window).mousewheel(function(event, delta){
                    if(delta>0){
                        if(parseInt(sub.css('marginTop'))>-10){
                            sub.css('marginTop','0px');
                        }else{
                            sub.css('marginTop','+='+10);
                        }
                    }else{
                        if(parseInt(sub.css('marginTop'))<'-'+(diff-10)){
                            sub.css('marginTop','-'+(diff-10));
                        }else{
                            sub.css('marginTop','-='+10);
                        }
                    }
                });
            }
        }();
    </script>
    
</body>
</html>