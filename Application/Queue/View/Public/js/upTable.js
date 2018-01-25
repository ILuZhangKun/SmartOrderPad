//给每个按钮添加click事件 function js来调用这个函数
// 桌面显示
//参数：每个tab页中的蓝色按钮
//蓝色按钮点击事件：传按钮id给后台，根据后台反应，修改颜色
function isDistribute(table) {
    //点击蓝色按钮之后
    //在弹窗popupDiv中添加一个询问框
    confirmMessage = "确定上桌？";
    var popupDiv = document.getElementById('popupDiv');
    popupDiv.style.display = 'block';
    var queneInfo = document.getElementById('queneInfo');
    queneInfo.style.display = 'none';

    var confirmUpTable = document.getElementById("confirmUpTable");
    confirmUpTable.classList.add('queneInfo');
    confirmUpTable.style.height = "200px";
    confirmUpTable.style.width = "400px";
    confirmUpTable.style.paddingTop="20px";
    confirmUpTable.style.display = 'block';
    confirmUpTable.getElementsByTagName('h2')[0].innerHTML = confirmMessage;

    var id = table.id;

    document.getElementById('cancelUptable').onclick = function() {
        popupDiv.style.display = 'none';
    }
    document.getElementById('confirmUptable').onclick = function() {
        popupDiv.style.display = 'none';
        //点击确认之后走ajax请求
        $.ajax({
            type: 'post',
            async: true,
            url: '/SmartOrder/index.php/Queue/Queue/upTable', //修改
            dataType: 'json',
            data: {
                id: id
            },
            success: function(data) {
                 table.classList.remove('bluetable');
                 
            },
            error: function() {
            }
        });
    }
}