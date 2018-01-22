$(function(){
    //搜索功能
    $("#search").click(function(){
        var url = $(this).attr('url');
        var status = $("#sch-sort-txt").attr("data");
        var query  = $('.search-form').find('input').serialize();
        query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g,'');
        query = query.replace(/^&/g,'');
        if(status != ''){
            query = 'status=' + status + "&" + query;
        }
        if( url.indexOf('?')>0 ){
            url += '&' + query;
        }else{
            url += '?' + query;
        }
        window.location.href = url;
    });

    /* 状态搜索子菜单 */
    $(".search-form").find(".drop-down").hover(function(){
        $("#sub-sch-menu").removeClass("hidden");
    },function(){
        $("#sub-sch-menu").addClass("hidden");
    });
    $("#sub-sch-menu li").find("a").each(function(){
        $(this).click(function(){
            var text = $(this).text();
            $("#sch-sort-txt").text(text).attr("data",$(this).attr("value"));
            $("#sub-sch-menu").addClass("hidden");
        })
    });

    //回车自动提交
    $('.search-form').find('input').keyup(function(event){
        if(event.keyCode===13){
            $("#search").click();
        }
    });
    //时间选择器
    $('#time-start').datetimepicker({
        format: 'yyyy-mm-dd',
        language:"zh-CN",
        minView:2,
        autoclose:true
    });
    $('#time-end').datetimepicker({
        format: 'yyyy-mm-dd',
        language:"zh-CN",
        minView:2,
        autoclose:true,
        pickerPosition:'bottom-right'
    });
    $('#datetimepicker').datetimepicker({
       format: 'yyyy-mm-dd',
        language:"zh-CN",
        minView:2,
        autoclose:true,
        pickerPosition:'bottom-right'
    })
            
})
var carMap={ }
var departmentMap={ }
 //avalon控制模块  
var model=avalon.define("avalonCon", function(vm) {
    //车型
    vm.carFirst = []
    vm.carSecond = []
    vm.carThird = []
    vm.carFirstSelected = "北京现代"
    vm.carSecondSelected = ""
    vm.carThirdSelected = "" 
    vm.$watch("carFirstSelected", function(a) {
        vm.carSecond = carMap[a].concat()
        vm.carSecondSelected = vm.carSecond[0]
    })
    vm.$watch("carSecondSelected", function(a) {
        vm.carThird = carMap[a].concat()
        vm.carThirdSelected = vm.carThird[0]
    })

    //部门
    vm.departmentFirst = []
    vm.departmentSecond = [] 
    vm.departmentFirstSelected = ""
    vm.departmentSecondSelected = ""
    //vm.departmentThirdSelected = "" 
    vm.$watch("departmentFirstSelected", function(a) {
        vm.departmentSecond = departmentMap[a].concat()
        vm.departmentSecondSelected = vm.departmentSecond[0]
    }) 
    vm.dealwithResult=function(result){
        //处理车型
        var tempMap={}; 
        for(var i=0;i<result.car.root.length;i++){
            var key =  result.car.root[i]; 
            var val=result.car[key]; 
            tempMap[key]=val; 
            for(var j=0;j<tempMap[key].length;j++){
                var skey=tempMap[key][j]; 
                if(result.car[skey]!=undefined){
                    var sval=result.car[skey]; 
                    tempMap[skey]=sval;
                } 
            }
        }
        carMap=tempMap;
        model.carFirst=result.car.root;
        model.carSecond=carMap[model.carFirst[1]].concat();
        model.carThird = carMap[model.carSecond[0]].concat();
        model.carFirstSelected = model.carFirst[0];
        model.carSecondSelected = model.carSecond[0];
        model.carThirdSelected = model.carThird[0]; 

        //处理部门
        var tempMap={};
        for(var i=0;i<result.department.root.length;i++){
            var key =  result.department.root[i]; 
            var val=result.department[key]; 
            tempMap[key]=val; 
            for(var j=0;j<tempMap[key].length;j++){
                var skey=tempMap[key][j]; 
                if(result.department[skey]!=undefined){
                    var sval=result.department[skey]; 
                    tempMap[skey]=sval;
                } 
            }
        }
        departmentMap=tempMap;
        model.departmentFirst=result.department.root;
        model.departmentSecond=departmentMap[model.departmentFirst[1]].concat();
        //model.departmentThird = departmentMap[model.departmentSecond[0]].concat();
        model.departmentFirstSelected = model.departmentFirst[0];
        model.departmentSecondSelected = model.departmentSecond[0]; 
        //model.departmentThirdSelected = model.departmentThird[0]; 
    }
})

//ajax获取数据
var requestURL = window.Think.APP+"/CarManage/getCategory";
var result=yysAjaxRequest("POST","",requestURL);

model.dealwithResult(result);
avalon.scan();