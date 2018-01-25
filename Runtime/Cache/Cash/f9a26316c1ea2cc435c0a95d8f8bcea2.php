<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html> 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><?php echo ($meta_title); ?></title>
    <link rel="stylesheet" type="text/css" href="/SmartOrder/Application/Cash/View/Public/css/1.css">
    <link rel="stylesheet" type="text/css" href="/SmartOrder/Application/Cash/View/Public/css/2.css">
    <!--<link rel="stylesheet" type="text/css" href="/SmartOrder/Application/Cash/View/Public/css/module.css">-->
    <!--<link rel="stylesheet" type="text/css" href="/SmartOrder/Application/Cash/View/Public/css/style.css">-->
    <link rel="stylesheet" type="text/css" href="/SmartOrder/Application/Cash/View/Public/css/bootstrap.min.css">
    <link href="/SmartOrder/Application/Cash/View/Public/datetimepicker/css/datetimepicker.css" rel="stylesheet" type="text/css">
    <script src="/SmartOrder/Application/Cash/View/Public/js/jquery-1.10.2.js"></script> 
    <script src="/SmartOrder/Application/Cash/View/Public/js/scroll.js"></script> 
    <script src="/SmartOrder/Application/Cash/View/Public/js/bootstrap.min.js"></script> 
    <script src="/SmartOrder/Application/Cash/View/Public/datetimepicker/js/bootstrap-datetimepicker.js"></script> 
    <script src="/SmartOrder/Application/Cash/View/Public/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/SmartOrder/Application/Cash/View/Public/js/somefunction.js"></script>
    <script src="/SmartOrder/Application/Cash/View/Public/js/1.js"></script>
    <script>
    $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    })
</script>
</head>

<body>
    <div class="header">
        <div class="menu">
            <ul>
                <li id="table">
                    <div class="text">桌号</div>
                    <div class="left">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                </li>
                <li id="checkout">
                    <div class="text">结账</div>
                    <div class="left">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                </li>
                <li id="reservation">
                    <div class="text">预约</div>
                    <div class="left">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                </li>
                <li id="manage">
                    <div class="text">管理</div>
                    <div class="nav-bar">
                    	<a href="../manage/index">桌号管理</a><br />
                    	<a href="../manage/member">会员管理</a><br />
                    	<a href="../manage/employee">员工管理</a>
                    </div>
                    <div class="left">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                </li>
                <li id="other">
                    <div class="text">查询</div>
                    <div class="nav-bar">
                    	<a href="../other/index">账单查看</a><br />
                    	<a href="../other/menulist">菜单查看</a><br />
                    	<a href="../other/adslist">广告查看</a>
                    </div>
                    <div class="left">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="cricle">
                            <div></div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="exit"><a href="<?php echo U("Login/logout");?>">退出</a></div>
    </div>
    
	<div class="table-manage">
	<div class="main-title">
		<h2>桌号管理</h2>
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
						<div class="btn-toolbar opt-btn cf">
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
	</div>
	<!-- /表格列表 -->

    <!--弹出框--> 
    <div class="modal fade in" id="alert">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel">注意</h3>
                </div>
                <div class="modal-body">
                    请完善您的录入信息，方能进行操作！
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="alertCancel">取消</button> 
                </div>
            </div>
        </div>
    </div> 
    <!--弹出框结束-->
</body> 
</html>