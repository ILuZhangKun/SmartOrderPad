//Global_custId有值时，给每个按钮添加click事件 function js来调用这个函数
// 桌面显示
//参数：每个tab页中的蓝色按钮
//蓝色按钮点击事件：传按钮id给后台，根据后台反应，修改颜色
//清空Global_custId
function emptyTableBindClick(tabId) {
    console.log("属于：" + tabId + "中的桌子");
    //先找到当前tab中的蓝色按钮
    var currentEmptyTables = document.getElementById(tabId).getElementsByClassName('bluetable');
    //console.log(tabId + "中的空桌数" + currentEmptyTables.length);
    for (var i = 0; i < currentEmptyTables.length; i++) {
        currentEmptyTables[i].onclick = function() {
            distributeEmptyTable(this);
        }
    }
}

function distributeEmptyTable(table) {
    //点击蓝色按钮之后
    //在弹窗popupDiv中添加一个询问框
    confirmMessage = "确定为客人分配此桌？";
    console.log("分配空桌的tableId:" + table.id);
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



    document.getElementById('cancelBtn').onclick = function() {
        popupDiv.style.display = 'none';
    }
    document.getElementById('confirmBtn').onclick = function() {
        popupDiv.style.display = 'none';
        //点击确认之后走ajax请求
        Global_tableId = table.id;
        //alert("Global_tableId:" + Global_tableId);
        $.ajax({
            type: 'post',
            async: true,
            url: 'upTable', //修改
            dataType: 'json',
            data: {
                id: Global_tableId //被分配的桌子Id，只需进行桌表的相应字段的修改
            },
            success: function(data) {
                //对于显示桌面的方法进行封装()
                getNewestTableCondition();
                setTimeout(function() {
                    alert(data);
                }, 250);
            },
            error: function() {}
        });
        //重置Global_custId
        Global_custId = "";
    }
}