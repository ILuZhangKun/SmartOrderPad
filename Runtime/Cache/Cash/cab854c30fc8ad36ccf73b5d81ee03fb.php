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
    
    <!-- 其他 -->
    <div class="other">
        <div class="waitPay">
            <div class="otherHeader">
                当前待支付账单
            </div>
            <div class="otherBody waitPayBody">
                <table class="table table-hover waitPayTable">
                    <thead>
                        <tr>
                            <th>结账时间</th>
                            <th>桌号</th>
                            <th>金额</th>
                            <th>操作</th>
                        </tr>
                    </thead>

                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                        <td>
                            <div class="paybtn"><a href="<?php echo U('orderList');?>?oid=<?php echo ($wo_res["oid"]); ?>&tid=<?php echo ($wo_res["table_id"]); ?>">结账</a></div>
                        </td>
                    </tr>
                    <tbody>
                        <?php if(is_array($result)): $i = 0; $__LIST__ = $result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$wo_res): $mod = ($i % 2 );++$i;?><tr>
                                <td><?php echo ($wo_res["pay_time"]); ?></td>
                                <td><?php echo ($wo_res["table_name"]); ?></td>
                                <td><?php echo ($wo_res["real_money"]); ?></td>
                                <td>
                                    <div class="paybtn"><a href="<?php echo U('orderList');?>?oid=<?php echo ($wo_res["oid"]); ?>&tid=<?php echo ($wo_res["table_id"]); ?>">结账</a></div>
                                </td>
                            </tr>
                    </tbody><?php endforeach; endif; else: echo "" ;endif; ?>
                </table>
            </div>
        </div>
        <div class="income">
            <div class="otherHeader">
                今日收入
            </div>
            <div class="otherBody incomeBody">
                <form class="form-inline" action="searchIncome">
                    <!-- input type="search" placeholder="请输入查询日期" -->
                    <input type="search" value="<?php echo ($date==''?date('Y-m-d'):$date); ?>" class="time-start" name="incomeDay" placeholder="请输入查询日期" />
                    <button type="submit" class="btn btn-default">查询</button>
                </form>
                <table class="table table-hover incomeTable">
                    <thead>
                        <tr>
                            <th>结账时间</th>
                            <th>桌号</th>
                            <th>金额</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tr>
                        <td>now</td>
                        <td>你的桌</td>
                        <td>100000.98</td>
                    </tr>
                    <tbody>
                        <?php if(is_array($result)): $i = 0; $__LIST__ = $result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$res): $mod = ($i % 2 );++$i;?><tr>
                                <td><?php echo ($res["pay_time"]); ?></td>
                                <td><?php echo ($res["table_name"]); ?></td>
                                <td><?php echo ($res["real_money"]); ?></td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    <!-- /其他 -->
    <!-- 办卡 -->
    <!--     <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" data-backdrop="static" id="test">Open modal for @mdo</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel">办卡</h3>
                </div>
                <div class="modal-body">
                    <form class="founding">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">会员号:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">状态:</label>
                            <select>
                                <option value="normal">正常</option>
                                <option value="abnormal">非正常</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">类型:</label>
                            <select>
                                <option value="normal">普通会员</option>
                                <option value="abnormal">VIP会员</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">金额:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">开卡是否收费:</label>
                            <input type="radio" value="1" name="msChargeOther">免费&nbsp;&nbsp;&nbsp;&nbsp; 
                            <input type="radio" value="2" name="msChargeOther">收费10元 
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">有效日期:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">密码:</label>
                            <input type="password">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">确认密码:</label>
                            <input type="password">
                        </div>
                    </form>
                    <form class="founding foundingPersonal">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">姓名:</label>
                            <input type="text">
                        </div>                       
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">证件号:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">手机号:</label>
                            <input type="text">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">确认</button>
                </div>
            </div>
        </div>
    </div>  
    <!-- /办卡 -->
    <!-- 充值 -->
    <!-- 
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel">充值</h3>
                </div>
                <div class="modal-body">
                    <form class="foundingOther">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">会员号:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">密码:</label>
                            <input type="password">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">当前金额:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">充值金额:</label>
                            <input type="text">
                        </div>               
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">确认</button>
                </div>
            </div>
        </div>
    </div> -->
    <!-- /充值 -->
    <!-- 退款 -->
    <!--    
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel">退款</h3>
                </div>
                <div class="modal-body">
                    <form class="foundingOther">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">会员号:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">密码:</label>
                            <input type="password">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">当前金额:</label>
                            <input type="text">
                        </div>               
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">确认</button>
                </div>
            </div>
        </div>
    </div> -->
    <!-- /退款 -->
    <!-- 查询 -->
    <!-- 
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel">查询</h3>
                </div>
                <div class="modal-body">
                    <form class="foundingOther">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">会员号:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">密码:</label>
                            <input type="password">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">证件号:</label>
                            <input type="password">
                        </div>               
                    </form>
                    <form class="foundingOther foundingPersonal">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">会员号:</label>
                            123456
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">密码:</label>
                            123456
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">证件号:</label>
                          123456
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">当前金额:</label>
                            123
                        </div> 
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">类型:</label>                           
                            普通会员                    
                        </div>   
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">有效日期:</label>
                            2017-12-13
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">积分:</label>
                            2017-12-13
                        </div>           
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">确认</button>
                </div>
            </div>
        </div>
    </div> -->
    <!-- /查询 -->
    <!-- 挂失 、解挂、注销、积分-->
    <!--  
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel">挂失</h3>
                </div>
                <div class="modal-body">
                    <form class="foundingOther">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">会员号:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">密码:</label>
                            <input type="password">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">确认</button>
                </div>
            </div>
        </div>
    </div> -->
    <!-- 弹出alert框询问确认挂失、解挂、显示积分-->
    <!-- /挂失、解挂、注销、积分 -->
    <!-- 换卡 -->
    <!--     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h3 class="modal-title" id="exampleModalLabel">挂失</h3>
                </div>
                <div class="modal-body">
                    <form class="foundingOther">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">会员号:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">密码:</label>
                            <input type="password">
                        </div>
                    </form>
                    <form class="foundingOther foundingPersonal">
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">现会员号:</label>
                            <input type="text">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">密码:</label>
                            <input type="password">
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">确认密码:</label>
                            <input type="password">
                        </div>   
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">确认</button>
                </div>    
            </div>
        </div>
    </div> -->
    <!-- /换卡 -->

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