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
    
    <!-- 结账 -->
    <div id="outputDiv" style="display:none;position:absolute;left:0px;top:0px;width:15%;height:20%;background:white;">
        <div style="margin-left:5px;font-size:10px;">
            &emsp;&emsp;&emsp;&emsp;欢迎您的光临</br>
            -------------------------------------------------</br>
            &emsp;&emsp;&emsp;&emsp;北京工业大学</br>
            店名：&emsp;&emsp;&emsp;天天餐厅</br>
            桌号：&emsp;&emsp;&emsp;<?php echo ($tableId); ?></br>
            收银员：&emsp;&emsp;S201525082</br>
            结账时间：&emsp;<?php echo ($pay_time); ?></br>
            机器号：&emsp;&emsp;01</br>
            会员号：&emsp;&emsp;25082</br>
            -------------------------------------------------</br>
            <table>
                <thead>
                    <tr>
                        <th>菜名</th>
                        <th>&emsp;单价/元</th>
                        <th>&emsp;份数/份</th>
                        <th>&emsp;小计</th>
                    </tr>
                </thead>
                <?php if(is_array($payInfo)): $i = 0; $__LIST__ = $payInfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><tr>
                        <td><?php echo ($item["name"]); ?></td>
                        <td>&emsp;<?php echo ($item["price"]); ?></td>
                        <td>&emsp;&emsp;<?php echo ($item["num"]); ?></td>
                        <td>&emsp;<?php echo ($item["totle"]); ?></td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </table>
            -------------------------------------------------</br>
            总计：&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<?php echo ($totle); ?></br>
            优惠：&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;0</br>
            实收：&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<?php echo ($totle); ?></br>
            -------------------------------------------------</br>
            &emsp;&emsp;&emsp;谢谢回顾，欢迎下次光临！</br>
            &emsp;&emsp;欢迎来电咨询：13888888888</br>
            &emsp;地址：北京市朝阳区平乐园100号</br>
        </div>
    </div>
    <div class="checkout">
        <div class="checkoutBoard form-inline">
            <form class="form-inline" action="getSearch">
                <div class="form-group">
                    <label class="sr-only" for="exampleInputEmail3">Email address</label>
                    <select class="form-control" name="tableid">
                        <?php if(is_array($tableTree)): $i = 0; $__LIST__ = $tableTree;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><optgroup label="<?php echo ($cate["name"]); ?>">
                                <?php if(is_array($cate["table"])): $i = 0; $__LIST__ = $cate["table"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i; if($val["id"] == I('tableid') ): ?><option value="<?php echo ($val["id"]); ?>" selected="true"><?php echo ($val["table_name"]); ?></option>
                                    <?php else: ?>
                                        <option value="<?php echo ($val["id"]); ?>"><?php echo ($val["table_name"]); ?></option><?php endif; endforeach; endif; else: echo "" ;endif; ?>
                            </optgroup><?php endforeach; endif; else: echo "" ;endif; ?>
                    </select>
                </div>
                <button type="submit" class="btn btn-default" id="searchTableId">查询</button>
                <!-- </form>
            <form class="form-inline" action="order/getSearch"> -->
                <div class="form-group">
                    <label class="sr-only" for="exampleInputEmail3">Email address</label>
                    <input type="text" class="form-control" placeholder="请输入会员号">
                </div>
                <button type="submit" class="btn btn-default" id="alone">确认</button>
            </form>
            <table class="table table-hover coTable">
                <thead>
                    <tr>
                        <th>菜名</th>
                        <th>单价/元</th>
                        <th>份数/份</th>
                        <th>小计</th>
                    </tr>
                </thead>
                <?php if(is_array($payInfo)): $i = 0; $__LIST__ = $payInfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><tr class="payTable <?php echo ($item["id"]); ?>">
                        <td><?php echo ($item["name"]); ?></td>
                        <td><?php echo ($item["price"]); ?></td>
                        <td><?php echo ($item["num"]); ?></td>
                        <td><?php echo ($item["totle"]); ?></td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
            </table>
            <div class="row">
                <div class="col-md-5 col-sm-5"></div>
                <div class="col-md-7 col-sm-7">
                    <div class="row">
                        <div class="col-md-4 col-sm-4">
                            <strong>总计：</strong><?php echo ($totle); ?>
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <strong>折扣：</strong>0.0
                        </div>
                        <div class="col-md-4 col-sm-5" id="totleMoney">
                            <strong>应付：</strong><?php echo ($totle); ?>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tableOther">

            </div>
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-8">
                    <div class="row coOther">
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-default" id="inputCash">现金结账</button>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-default">信用卡结账</button>
                        </div>
                        <div class="col-md-4">
                            <button type="submit" class="btn btn-default" id="output">打印小票</button>
                        </div>

                    </div>
                </div>
                <div class="row inputCash">
                    <div class="col-md-4"></div>
                    <div class="col-md-5" style="padding:0;">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputEmail3">Email address</label>
                            <input type="text" class="form-control" id="realMoney" placeholder="请输入实收金额">
                        </div>
                        <button type="button" class="btn btn-default submitMoney">确认</button>
                    </div>
                    <div class="col-md-3 takeChange"><strong></strong></div>
                </div>
            </div>
        </div>
        <div class="membership">
            <div class="otherHeader">
                会员管理
            </div>
            <div class="otherBody memberBody">
                <button type="submit" class="btn btn-default">办卡</button>
                <button type="submit" class="btn btn-default">充值</button>
                <button type="submit" class="btn btn-default">退款</button>

                <button type="submit" class="btn btn-default">查询</button>
                <button type="submit" class="btn btn-default">挂失</button>
                <button type="submit" class="btn btn-default">解挂</button>

                <button type="submit" class="btn btn-default">注销</button>
                <button type="submit" class="btn btn-default">换卡</button>
                <button type="submit" class="btn btn-default">积分</button>

            </div>
        </div>
    </div>
    <!-- /结账 -->
    <!-- 小票 -->
    <div class="note">
        <h4>雨之林餐厅</h4>
        <div class="noteOther">
            <div class="noteOtherLeft">&nbsp;会员号:32655629</div>
            <div class="noteOtherright">桌号:10</div>
        </div>
        <div class="noteBody">
            <table class="table noteTable">
                <tr>
                    <th id="t1">菜名</th>
                    <th id="t2">单价*份数</th>
                    <th id="t3">小计</th>
                </tr>
                <tr>
                    <td id="t1">宫保鸡丁</td>
                    <td id="t2">36*1</td>
                    <td id="t3">36.0</td>
                </tr>
                <tr>
                    <td id="t1">宫保鸡丁</td>
                    <td id="t2">36*1</td>
                    <td id="t3">36.0</td>
                </tr>
                <tr>
                    <td id="t1">宫保鸡丁</td>
                    <td id="t2">36*1</td>
                    <td id="t3">36.0</td>
                </tr>
            </table>
        </div>
        <div class="noteAccount">
            <div><strong>总计:</strong>124.0</div>
            <div><strong>折扣:</strong>0.0</div>
            <div><strong>应付:</strong>124.0</div>
        </div>
        <div class="noteAccount2">
            <div><strong>&nbsp;现金:</strong>200.0</div>
            <div><strong>找零:</strong>76.0</div>
        </div>
        <div class="noteAccount2">
            <div><strong>&nbsp;银行卡:</strong>5444*********3165</div>
        </div>
        <div class="notefooter">
            <div><strong>打印时间：</strong>2015-05-02&nbsp;19:47:00</div>
        </div>
    </div>
    <!-- /小票 -->

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