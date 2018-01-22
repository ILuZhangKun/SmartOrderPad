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
            

            
	<div class="main-title">
		<h2>座位管理</h2>
	</div>
	<!-- 表格列表 -->
	<div class="tb-unit posr">
		<div class="tb-unit-bar">
			<a class="btn" href="<?php echo U('add?type=hall');?>">新 增</a>
		</div>
		<div class="category">
			<div class="hd cf">
				<div class="fold">折叠</div> 
				<div class="name">名称</div>
			</div>
			<?php if(is_array($degreeInfo)): $i = 0; $__LIST__ = $degreeInfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?><div id="<?php echo ($v["id"]); ?>">
					<div class="cf">
						<div  class="btn-toolbar opt-btn cf"> 
							<a class="confirm ajax-get" href="<?php echo U('del',array('id'=>$v['id'],'type'=>'hall'));?>" title="删除">删除</a>
						</div>
						<div class="fold">
							<i class="icon-unfold"></i>
						</div> 
						<div class="name">
							<span class=""></span> 
							<input class="text" type="text" id="<?php echo ($v["id"]); ?>" value="<?php echo ($v["name"]); ?>" name="title">
							<i class="icon-add"></i>
							<span class="help-inline msg"></span>
						</div>
					</div>
					<?php if($v["table"] == null ): ?><div class="cf" style="display:none">
							<div class="btn-toolbar opt-btn cf"> 
								<a class="confirm ajax-get" href="<?php echo U('del',array('id'=>$table['id'],'type'=>'table'));?>" title="删除">删除</a> 
							</div>
							<div class="fold">
								<i></i>
							</div> 
							<div class="name">
								<span class="tab-sign"></span> 
								<input class="text" type="text" cid="<?php echo ($v["id"]); ?>" id="<?php echo ($table["id"]); ?>" value="<?php echo ($table["table_name"]); ?>" name="title"> 
								<span class="help-inline msg"></span>
							</div>
						</div>
                    <?php else: ?> 
                        <?php if(is_array($v["table"])): $i = 0; $__LIST__ = $v["table"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$table): $mod = ($i % 2 );++$i;?><div class="cf">
								<div class="btn-toolbar opt-btn cf"> 
									<a class="confirm ajax-get" href="<?php echo U('del',array('id'=>$table['id'],'type'=>'table'));?>" title="删除">删除</a> 
								</div>
								<div class="fold">
									<i></i>
								</div> 
								<div class="name">
									<span class="tab-sign"></span> 
									<input class="text" type="text" cid="<?php echo ($v["id"]); ?>" id="<?php echo ($table["id"]); ?>" value="<?php echo ($table["table_name"]); ?>" name="title"> 
									<span class="help-inline msg"></span>
								</div>
							</div><?php endforeach; endif; else: echo "" ;endif; endif; ?>
					
					
				</div><?php endforeach; endif; else: echo "" ;endif; ?>  
		</div>
	</div>
	<!-- /表格列表 -->

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
    
	<script>
		(function($){
			// $(".msg").hide();
			$(".icon-add").click(function(){
				//得到本次要添加桌位的大厅id
				var cid = $(this).parent().parent().parent().attr("id");
				console.log(cid);
				var parent = $("#"+cid);
				//获得该厅的座位数+1
				var chiNum = parent.children().length;
				$(this).parent().parent().nextAll().show();
				$(this).parent().prev().find("i").attr("class","icon-unfold"); 
				//得到最后一个元素的克隆值
				var Element = parent.children().last().clone(true); 
				//将可通过来的相关信息置空
				// Element.find("input[name='sort']").val(chiNum);
				Element.removeAttr("style");
				var title = Element.find("input[name='title']");
				if(title.val()!=""){
					title.attr("value","");
					title.val("");
					title.attr("id","");
					title.attr("cid",cid);
					Element.find(".opt-btn").hide();
					parent.append(Element);
				}
				
			});
			//文本框失去焦点则录入信息
			$("[name='title']").change(function(){ 
				var val = $(this).val();
				var thisId = $(this).attr("id");
				var thisCid = $(this).attr("cid"); 
				// console.log("name:"+val+"id:"+thisId+"cid:"+thisCid);
				if(val==""||val==" "){
					alert("请输入名称");
				}else if(thisId==""&&thisCid!=undefined&&thisCid!=""){
					//id为空并且cid不是undifined也不是空说明这是新增的桌号。
					//将cid与value录入数据库得到返回的id，将id填充 
					var data={"table_name":val,"hall_id":thisCid,"status":"table"}; 
					var result = yysAjaxRequest("POST",data,"add"); 
					var msg = $(this).siblings("span.msg");
					if(result!="error"){
						$(this).attr("id",result);
						msg.attr("style","color:green;");
						msg.html("添加成功！");
						$(this).parent().siblings(".opt-btn").show();
						$(this).parent().siblings(".opt-btn").attr("href","/SmartOrder/Admin.php/Table/del/id/"+result+"/type/table.html");
					} 
					else {
						msg.attr("style","color:red;"); 
						msg.html("添加失败！");
					}
					setTimeout(function(){
						msg.hide();
					},3000);
				}else if(thisCid==undefined){
					//cid=undefined说明是修改的hall
					var hallName=$(this).val();
					var hallId=$(this).attr("id");
					var msg = $(this).siblings("span.msg");
					edit_name(hallName,hallId,"hall",msg);

				}else if(thisId!=""&&thisCid!=undefined&&thisCid!=""){
					//修改的桌号 
					var name = $(this).val();
					var id = $(this).attr("id");
					var msg = $(this).siblings("span.msg");
					edit_name(name,id,"table",msg);
				} 
			});
			//点击折叠icon-fold  
			$(".fold i").click(function(){
				 $(this).parent().parent().nextAll().toggle();
				 if($(this).hasClass("icon-unfold")) $(this).attr("class","icon-fold");
				  else $(this).attr("class","icon-unfold");
			});
		})(jQuery);
		function edit_name(name,id,type,msg){
			var data={"name":name,"id":id,"type":type}; 
			var result = yysAjaxRequest("POST",data,"edit");
			
			if(result == "success") {
				msg.attr("style","color:green;");
				msg.html("修改成功！");
			}
			else{
				msg.attr("style","color:red;"); 
				msg.html("修改失败！");
			}
			setTimeout(function(){
				msg.hide();
			},3000);
		}
	</script>	

</body>
</html>