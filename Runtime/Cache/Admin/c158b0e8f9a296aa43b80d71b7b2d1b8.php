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
            

            
        <!-- 数据列表 -->
        <div id="container" style="margin:50px auto;">
            <div class="demo" id="highcharts"></div>
        </div>
        <script type="text/javascript">
            var data  = [{"name":"u767eu5ea6","y":1239,"sliced":true,"selected":true},["google",998],["\u641c\u641c",342],["\u5fc5\u5e94",421],["\u641c\u72d7",259],["\u5176\u4ed6",83]];
            $(function() {
                $('#highcharts').highcharts({
                    chart: {
                        renderTo: 'chart_pie', //饼状图关联html元素id值
                        defaultSeriesType: 'pie', //默认图表类型为饼状图
                        plotBackgroundColor: '#ffc', //设置图表区背景色
                        plotShadow: true   //设置阴影
                    },
                    title: {
                        text: '收支统计图'  //图表标题
                    },
                    credits: {
                        text: 'erdangjiade.com'
                    },
                    tooltip: {
                        formatter: function() { //鼠标滑向图像提示框的格式化提示信息
                            return '<b>' + this.point.name + '</b>: ' + twoDecimal(this.percentage) + ' %';
                        }
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true, //允许选中，点击选中的扇形区可以分离出来显示
                            cursor: 'pointer', //当鼠标指向扇形区时变为手型（可点击）
                            //showInLegend: true,  //如果要显示图例，可将该项设置为true
                            dataLabels: {
                                enabled: true, //设置数据标签可见，即显示每个扇形区对应的数据
                                color: '#000000', //数据显示颜色
                                connectorColor: '#999', //设置数据域扇形区的连接线的颜色
                                style: {
                                    fontSize: '12px'  //数据显示的大小
                                },
                                formatter: function() { //格式化数据
                                    return '<b>' + this.point.name + '</b>: ' + twoDecimal(this.percentage) + ' %';
                                    //return '<b>' + this.point.name + '</b>: ' + this.y ;
                                }
                            }
                        }
                    },
                    series: []
                });
            });

            function twoDecimal(x) { //保留2位小数
                var f_x = parseFloat(x);
                if (isNaN(f_x)) {
                    alert('错误的参数');
                    return false;
                }
                var f_x = Math.round(x * 100) / 100;
                var s_x = f_x.toString();
                var pos_decimal = s_x.indexOf('.');
                if (pos_decimal < 0) {
                    pos_decimal = s_x.length;
                    s_x += '.';
                }
                while (s_x.length <= pos_decimal + 2) {
                    s_x += '0';
                }
                return s_x;
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