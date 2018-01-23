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
    
    <!-- 预约 -->
    <div class="reservation">
        <div class="inputRedervation">
            <form class="form-inline" id="book_info"> 
                <input type="text" class="time-start" id="RVday" name="RVday" placeholder="请输入查询日期" required /> 
                <select class="orderTime" name="bookHour">
                    <option value="早饭">早饭</option>
                    <option value="午饭">午饭</option>
                    <option value="晚饭">晚饭</option> 
                </select>  
                <input type="text" placeholder="预约人数" id="RVnum" name="RVnum" />
                <input type="text" placeholder="客户姓名" id="RVdname" name="RVdname" />
                <input type="text" placeholder="客户电话" id="RVtel" name="RVtel" />
                
                <select class="orderTable" name="RVtable"> 
                    <?php if(is_array($tableTree)): $i = 0; $__LIST__ = $tableTree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><optgroup label="<?php echo ($cate["name"]); ?>">
                            <?php if(is_array($cate["table"])): $i = 0; $__LIST__ = $cate["table"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i; if($val["id"] == I('tableid') ): ?><option value="<?php echo ($val["id"]); ?>" selected="true"><?php echo ($val["table_name"]); ?></option> 
                                <?php else: ?> 
                                    <option value="<?php echo ($val["id"]); ?>"><?php echo ($val["table_name"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                        </optgroup><?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
                <input type="text" placeholder="预约要求" id="RVdemand" name="RVdemand" />
                <a href="javascript:;" class="btn btn-success" id="RVsubmit" url="<?php echo U('book/makeBook');?>" />确定预定</a>
                <a href="javascript:;" class="btn btn-warning" id="RVsearch" url="<?php echo U('book/searchBook');?>" />查询预定</a>
                <!-- <a type="button" class="btn btn-warning" id="searchTable" url="<?php echo U('book/searchTable');?>" />查询空位</a> -->
            </form>
        </div>
        <div> 
                <table class="table table-hover abc">
                    <thead>
                        <tr>
                            <th class="RVday">预约日期</th>
                            <th class="RVtime">预约时间</th>
                            <th class="RVnum">人数</th>
                            <th class="RVdname">客户姓名</th>
                            <th class="RVtel">客户手机号</th>
                            <th class="RVtable">餐台</th>
                            <th class="RVdemand">要求</th>
                            <th class="RVstatus">状态</th>
                        </tr>
                    </thead>
                    <?php if(is_array($bookInfo)): $i = 0; $__LIST__ = $bookInfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$book): $mod = ($i % 2 );++$i;?><tr class="mytr">
                        <td><?php echo ($book["book_day"]); ?></td>
                        <td><?php echo ($book["book_time"]); ?></td>
                        <td><?php echo ($book["book_num"]); ?></td>
                        <td><?php echo ($book["book_name"]); ?></td>
                        <td><?php echo ($book["book_tel"]); ?></td>
                        <td><?php echo ($book["table"]); ?></td>
                        <td><?php echo ($book["book_demand"]); ?></td>
                        <td>
                            <button type="button" class="btn btn-default cancelBook <?php echo ($book["book_time"]); ?> <?php echo ($book["book_name"]); ?>" id="<?php echo ($book["book_day"]); ?>" >取消</button>
                        </td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?> 
                </table> 
            <!--div class="reservationOther">
                <div class="coBorder">
                    <h4>预约未到</h4>
                    <div id="scrollDiv3">
                        <ul>
                            <li>这是公告标题的第二行</li>
                            <li>这是公告标题的第三行</li>
                            <li>这是公告标题的第四行</li>
                            <li>这是公告标题的第五行</li>
                            <li>这是公告标题的第六行</li>
                            <li>这是公告标题的第七行</li>
                            <li>这是公告标题的第八行</li>
                            <li>这是公告标题的第9行</li>
                            <li>这是公告标题的第10行</li>
                        </ul>
                    </div>
                </div>
                <div class="coBorder">
                    <h4>空置座位</h4>
                    <div id="scrollDiv4">
                        <ul>
                            <li>这是公告标题的第二行</li>
                            <li>这是公告标题的第三行</li>
                            <li>这是公告标题的第四行</li>
                            <li>这是公告标题的第五行</li>
                            <li>这是公告标题的第六行</li>
                            <li>这是公告标题的第七行</li>
                            <li>这是公告标题的第八行</li>
                            <li>这是公告标题的第9行</li>
                            <li>这是公告标题的第10行</li>
                        </ul>
                    </div>
                </div>
            </div-->
        </div>
    </div>
    <!-- /预约 -->
    

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