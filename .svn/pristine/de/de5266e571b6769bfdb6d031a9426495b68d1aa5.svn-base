 
$(document).ready(function(){
    $("#plateNum").blur(function(){
        var plateNum = $("#plateNum").val();
        var url=window.Think.APP+"/CarManage/judgePlateNum";
        var result=yysAjaxRequest("POST",{plateNum:plateNum},url);
        var re=/^[京]{1}[A-Z]{1}[A-Z_0-9]{5}$/; 
        var color = "red"; 
        if(result.search("已经录入")!==-1){
            $("#submit").addClass("disabled");
            $("#submit").attr("type","button");
            }
        else if(plateNum.search(re)==-1||plateNum.length!=7){
            result="请输入规范化车牌号";
            $("#submit").addClass("disabled");
            $("#submit").attr("type","button");
        }
        else {
            color = "green";
            $("#submit").removeClass("disabled");
            $("#submit").attr("type","submit");
        }
        $("#plateNote").html(result);
        $("#plateNote").attr("style","color:"+color);
    });
});

 




 