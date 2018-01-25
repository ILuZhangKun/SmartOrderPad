// 使用同一个弹窗
// 改变的是message标题和确认函数

//过号操作
function confirmDel() {
    confirmMessage = "确定当前顾客过号？";
    var popupDiv = document.getElementById('popupDiv');
    popupDiv.style.display = 'block';
    /*隐藏输入信息框*/
    var queneInfo = document.getElementById('queneInfo');
    queneInfo.style.display = 'none';
    /*显示确认上桌框*/
    var confirmUpTable = document.getElementById("confirmUpTable");
    confirmUpTable.classList.add('queneInfo');
    confirmUpTable.style.height = "200px";
    confirmUpTable.style.width = "400px";
    confirmUpTable.style.paddingTop = "20px";
    confirmUpTable.getElementsByTagName('h2')[0].innerHTML = confirmMessage;
    confirmUpTable.style.display = 'block';

    //获取当前用户的参数
    custId = $(this).parent().prev().text();
    //console.log(id);
    var index = $(this).parent().parent().index();
    //console.log(index);
    var table = this.parentNode.parentNode.parentNode.parentNode;

    //console.log(table);
    document.getElementById('cancelBtn').onclick = function() {
        popupDiv.style.display = 'none';
    }
    document.getElementById('confirmBtn').onclick = function() {
        popupDiv.style.display = 'none';
        var key = index - 1;
        //console.log(key);

        // table.deleteRow(key);//学姐
        var cirIdNum = table.getAttribute('id').slice(-1);
        // var cirId = "cir" + cirIdNum;
        // console.log(index);
        //var table = $(this).parent().parent().parent();
        //点击确认之后走ajax请求
        $.ajax({
            type: 'post',
            async: true,
            url: 'delQueue', //修改
            dataType: 'json',
            data: {
                id: custId
            },
            success: function(data) {
                //显示最新排队列表(√)
                getNewestQueneCondition();
                //刷新排队人数统计数字
                refreshWaitCustTotal(cirIdNum);
                setTimeout(function() {
                    alert('该顾客已过号');
                }, 250);
            },
            error: function() {}
        });
    }
}
//上桌操作
function confirmTop() {
    // body...
    // var i=this.parentNode.parentNode.rowIndex;  
    // i.removeChild();
    confirmMessage = "确定当前顾客上桌嘛？";
    var popupDiv = document.getElementById('popupDiv');
    popupDiv.style.display = 'block';
    var queneInfo = document.getElementById('queneInfo');
    queneInfo.style.display = 'none';
    var confirmUpTable = document.getElementById("confirmUpTable");
    confirmUpTable.classList.add('queneInfo');
    confirmUpTable.style.height = "200px";
    confirmUpTable.style.width = "400px";
    confirmUpTable.style.paddingTop = "20px";
    confirmUpTable.style.display = 'block';
    confirmUpTable.getElementsByTagName('h2')[0].innerHTML = confirmMessage;


    //获取当前用户的参数

    // var tel = $(this).parent().prev().text();
    var Global_custId = $(this).parent().prev().text();
    //console.log(id);
    var index = $(this).parent().parent().index();
    //console.log(index);
    var table = this.parentNode.parentNode.parentNode.parentNode;

    console.log(table.id);

    document.getElementById('cancelBtn').onclick = function() {
        popupDiv.style.display = 'none';
    }
    document.getElementById('confirmBtn').onclick = function() {
        popupDiv.style.display = 'none';
        // table.deleteRow(index);//学姐

        var num = table.getAttribute('id').slice(-1);
        var cirNum = num;
        var cirId = "cir" + num;
        var tabId = "tab" + num;
        //在已选择顾客的前提下
        //为当前框中每个蓝色按钮加点击事件
        if (Global_custId) {
            console.log("要上桌的顾客ID" + Global_custId);
            //distributeEmptyTable.js中的方法
            emptyTableBindClick(tabId);
        }

        // console.log(index);
        //var table = $(this).parent().parent().parent();
        //点击确认之后走ajax请求
        $.ajax({
            type: 'post',
            async: true,
            url: 'delQueue', //修改该用户的状态：删除
            dataType: 'json',
            data: {
                id: Global_custId
            },
            success: function(data) {
                //显示最新排队列表(√)
                getNewestQueneCondition();
                //与此同时刷新排队人数统计数字
                refreshWaitCustTotal(cirNum);
                setTimeout(function() {
                    alert('请选择客人要去的包间');
                }, 250);
            },
            error: function() {}
        });


    }
}

//给等候顾客发送短信通知
function confirmSendMessage() {
    confirmMessage = "确定发送短信通知？";
    var popupDiv = document.getElementById('popupDiv');
    popupDiv.style.display = 'block';
    var queneInfo = document.getElementById('queneInfo');
    queneInfo.style.display = 'none';
    var confirmUpTable = document.getElementById("confirmUpTable");
    confirmUpTable.classList.add('queneInfo');
    confirmUpTable.style.height = "200px";
    confirmUpTable.style.width = "400px";
    confirmUpTable.style.paddingTop = "20px";
    confirmUpTable.style.display = 'block';
    confirmUpTable.getElementsByTagName('h2')[0].innerHTML = confirmMessage;
    //获取当前顾客的排号数(后台ID)

    var thisNode = this;
    var custQueneNum = thisNode.parentNode.parentNode.parentNode.children[2].innerHTML;
    // console.log("顾客排号数：" + custQueneNum);
    //console.log(thisNode);

    document.getElementById('cancelBtn').onclick = function() {
            popupDiv.style.display = 'none';
        }
        //发送短信以及css变化
    document.getElementById('confirmBtn').onclick = function() {
        popupDiv.style.display = 'none';

        thisNode.setAttribute("disabled", "disabled");
        var time = 20;
        thisNode.innerHTML = time + "秒";
        time--;
        var interval = setInterval(function() {
            thisNode.innerHTML = time + "秒";
            time--;
            if (time == -2) {
                clearInterval(interval);
                thisNode.removeAttribute("disabled");
                thisNode.innerHTML = "重发";
            }
        }, 1000);
        $.ajax({
            type: 'post',
            async: true,
            url: 'sendMsg',
            dataType: 'json',
            data: {
                id: custQueneNum
            },
            success: function(data) {
                //显示倒计时

                alert(data);

            },
            error: function() {}
        });
    }

}

//参数？
/**
 * 参数：当前tr
 * 功能：进行获取最新排队汇总人数
 * 过程：
 * 1.获取当前tr所在的tab页面从而获取所属cirI
 * 2.修改cirI中的数字
 */
function refreshWaitCustTotal(cirNum) {
    var cirId = "cir" + cirNum;
    var cir = document.getElementById(cirId);
    var tabTableId = 'tabTable' + cirNum;
    var is_empty = document.getElementById(tabTableId).getElementsByTagName('tbody')[0].getElementsByTagName('tr')[0].className;
    console.log("第一个tr的id:" + is_empty);
    if (is_empty == "emptyTip") {
        var trNum = document.getElementById(tabTableId).getElementsByTagName('tr').length - 2;
    } else {
        var trNum = document.getElementById(tabTableId).getElementsByTagName('tr').length - 1;
    }

    console.log("tab" + cirNum + "下的tr数：" + trNum);
    if (trNum > 0) {
        cir.innerHTML = "当前排队数有：" + trNum;
    } else {
        cir.innerHTML = "当前排队数有：0";
    }
    //同时最后一个tab也需要修改
    var cirArray = document.getElementsByClassName('cir');
    var lastCir = cirArray[cirArray.length - 1];
    var lastCirCurrentShowNum = lastCir.innerHTML.slice(-1) - 1;
    if (lastCirCurrentShowNum > 0) {
        lastCir.innerHTML = "当前排队数有：" + lastCirCurrentShowNum;
    } else {
        lastCir.innerHTML = "当前排队数有：0";
    }
}