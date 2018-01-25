/*
 *Author :Zhangkun
 *wait for the useful table
 *
 */
// $(document).ready(function() {
//获取屏幕尺寸
var g_width = $(window).width();
var g_height = $(window).height();
$('.wholescreen').width(g_width) - 20;
$('.wholescreen').height(g_height) - 20;

$('#popupDiv').width(g_width);
$('#popupDiv').height(g_height);

//两个全局变量
/**
 * Global_custId:即将上桌客人的编号
 * 用于判断是否给当前类别空桌添加单击事件
 * Global_tableId:即将分配的空桌编号
 */
var Global_custId = "";
var Global_tableId = "";


//信息输入
$('#toOnQuene').click(function() {
    $('#popupDiv').css('display', 'block');
    document.getElementById('confirmUpTable').style.display = 'none';
    document.getElementById('queneInfo').style.display = 'block';
});




//信息提交
$('#confirmCustInfo').click(function() {
    // alert("已进入提交函数");
    var num = $("#custNum").find("option:selected").attr("value");
    var tel = $("#custPhone").val();
    if (!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(tel))) {
        alert("不是完整的11位手机号或者正确的手机号前七位");
        document.mobile.focus();
        return false;
    } else {
        $.ajax({
            type: 'post',
            url: 'insertQueue', //修改
            dataType: 'json',
            data: {
                num: num,
                tel: tel,
            },
            success: function(data) {
                alert(data);
                var popupDiv = document.getElementById('popupDiv');
                popupDiv.style.display = 'none';
                getNewestQueneCondition();
            }
        });
    }

});
//取消
$('#cancelCustInfo').click(function() {
    $('#popupDiv').css('display', 'none');
});