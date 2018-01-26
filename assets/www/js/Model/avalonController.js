 //avalon控制模块 
 var modelCon = avalon.define({
     //avalon 控制范围声明
     $id: "avalonCon",
     //饭店名称
     restaurantName: "某某饭店",
     //广告内容
     adsText: "广告预留位置",
     //菜系名称
     styleArr: [],
     //桌号设置
     table: 0,
     //弹出框的相关参数
     alert: false,
     attention: "",
     //设置桌号的相关参数
     paramOfSetTable: true,
     //厅堂名称数组
     hallArr: [],
     //广告数组
     adsArr: [],
     //广告榜单数组
     adsArrMenu: [],
     //座位名称，
     tableArr: [],
     //当前所处的菜系
     styleName: "今日推荐",
     //当前所用的模板
     showModel: "model1",
     //当前所展示的页面
     currentPage: 1,
     //菜单显示数组
     menuArr: [],
     //已点菜单数组
     orderArr: [],
     //未下单的购物车数组
     notOrderArr: [],
     //已下单的购物车数组
     makeOrderArr: [],
     //已上菜的购物车数组
     upDishArr: [],
     //未上菜的购物车数组
     notUpDishArr: [],
     //总金额
     totleMoney: 0,
     hasOrderTotleMoney: 0,
     //总数量
     totleNum: 0,
     hasOrderTotleNum: 0,
     //切换已下单与未下单的相关变量
     active: "active",
     currentIndex: 0,
     //控制是否已上菜的菜单显示
     upDish: false,
     notUpDish: true,
     //评价菜品相关变量
     currentCommentName: "",
     commentDescription: "",
     //呼叫服务员的选项
     callWaiterOption: [
         { option: "菜单", checked: false },
         { option: "加茶水", checked: false },
         { option: "加白开水", checked: false },
         { option: "开酒", checked: false },
         { option: "加餐具", checked: false },
         { option: "加餐巾纸", checked: false },
         { option: "呼叫服务员", checked: false },
         { option: "结账", checked: false }

     ],
     //结账服务内容
     //	cashCall: {option:"结账",checked:false}，
     //菜品简介选项
     menuIntrOption: [
         { option: "少盐", checked: false },
         { option: "少糖", checked: false },
         { option: "少油", checked: false },
         { option: "免姜", checked: false },
         { option: "免蒜", checked: false },
         { option: "免葱", checked: false },
         { option: "免鸡精", checked: false },
         { option: "微辣", checked: false },
         { option: "加快", checked: false }
     ],
     //读取page表把该页需要显示的内容读取出来，
     pageShow: function() {
         var sqlGetPage = "select * from pages where rowid=?";
         pageObj.pageShow(sqlGetPage, [modelCon.currentPage]);
         console.log(modelCon.currentPage);
         //modelCon.currentPage++;
         //pageObj.pageShow(); 
     },
     //显示警告信息。
     showAlert: function(bloo, str) {
         modelCon.alert = bloo;
         modelCon.attention = str;
         setTimeout("modelCon.alert=false;", 2000);
     },
     //设置桌号
     setTable: function() {
         // var table=$('#table').val();
         var table = $(this).attr("id");
         var hall = $(this).parent().attr("type");
         var tableName = hall + $(this).html().replace(/^\s+|\s+$/g, "");
         var tableType = $(this).attr('class');
         console.log(tableName);
         console.log(tableType);
         //根据桌子空闲指定绑定解绑事件
         if (tableType == "btn nomal") {
             console.log("绑定桌号");
             tableObj.setTableId(table, tableName);
         } else if (tableType = 'btn lock') {
             tableObj.removeTableId(table, tableName);
             //console.log("解绑");
         }
     },
     //得到菜系名称
     getStyleName: function(tx, result) {
         var modelStyleArr = new Array();
         //将数据库中读取的菜系名复制给avalon数组。
         for (var i = 0; i < result.rows.length; i++) {
             modelStyleArr[i] = result.rows.item(i).stylename;
             console.log(modelStyleArr[i]);
         }
         modelCon.styleArr = modelStyleArr;
         //生成菜品表  
         pageObj.madePage();
     },
     //权限管理
     loginc: function() {
         var pw = $('#pw').val();
         var data = { pwd: $.md5(pw) };
         console.log($.md5(pw));
         var fun = function(data) {
             //var jsonObj=eval(data);
             console.log(data);
             if (data == "success") {
                 modelCon.paramOfSetTable = false;
                 $('#setTablePrompt').hide();
                 tableObj.getTableTree(showTableTree);
             } else {
                 modelCon.showAlert(true, "密码错误，请重新输入");
             }
             $('#pw').val("");
         };
         //显示桌号
         var showTableTree = function(tableTree) {
             var tableTreeObj = eval(tableTree);
             modelCon.hallArr = tableTreeObj;
             console.log(modelCon.hallArr);
             modelCon.smallTagChange();
         };
         commonObj.loginc(data, fun);
     },
     //呼叫服务员
     callWaiter: function() {
         console.log('avalonController.js:callWaiter');
         ringObj.callWaiter(modelCon.callWaiterOption);
     },
     //停止呼叫
     stopCallWaiter: function() {
         ringObj.stopCallWaiter();
     },
     //左侧列表显示当前选中的标签  
     changeTab: function(el) {
         $(".am-nav").children().removeClass("am-active");
         if ($(this).hasClass("am-active")) {

         } else {
             $(this).addClass("am-active")
         }
         console.log(el);
         pageObj.tabShow(el);
     },
     //将菜单填充到html页面
     fillMenuToHtml: function() {
         var menu = modelCon.menuArr;
         console.log(modelCon.menuArr[0].picture);
         console.log(modelCon.showModel);
         var excuteCss = function(obj1, obj2, obj3, value) {
             console.log(value.picture);
             obj1.attr("src", value.picture);
             obj2.html(value.cookname);
             obj3.html(value.price + "元/" + value.standard);
         };
         var whichModel = function(model) {
             $("#menuContent").children().hide();
             $("#menuContent").find("div#" + model).fadeIn();
         };
         switch (modelCon.showModel) {
             case "model1":
                 whichModel("model1");
                 //console.log(modelCon.menuArr[2].cookname);
                 console.log(modelCon.menuArr[0].cookname);
                 var obj1 = $("#model1-first").children("img.image");
                 var obj2 = $("#model1-first").find("strong");
                 var obj3 = $("#model1-first").find("small");
                 excuteCss(obj1, obj2, obj3, menu[0]);
                 console.log(modelCon.menuArr.length);
                 // if(modelCon.menuArr.length==2){ 
                 // 	 $("#model1-second").show(); 
                 // 	var obj4=$("#model1-second").children("img.image");
                 // 	var obj5=$("#model1-second").find("strong");
                 // 	var obj6=$("#model1-second").find("small"); 
                 // 	excuteCss(obj4,obj5,obj6,menu[1]);
                 // } else{ 
                 // 	$("#model1-second").attr("visibility","hidden");
                 // 	$("#model1-second").unbind("click");
                 // 	$("#model1-second").children("img.image").attr("src","");
                 // 	$("#model1-second").find("strong").html("");
                 // 	$("#model1-second").find("small").html(""); 
                 // }
                 break;
             case "model2":
                 console.log("model2");
                 whichModel("model2");
                 console.log(modelCon.menuArr[1].cookname);
                 var obj = $("div#leftCon");
                 var obj1 = obj.children("img#leftfourImage");
                 var obj2 = obj.find("strong");
                 var obj3 = obj.find("small");
                 excuteCss(obj1, obj2, obj3, menu[0]);
                 obj = $("div#RigCon");
                 obj1 = obj.children("img#RigfourImage");
                 obj2 = obj.find("strong");
                 obj3 = obj.find("small");
                 excuteCss(obj1, obj2, obj3, menu[1]);
                 break;
             case "model3":
                 console.log("model3");
                 console.log(menu[0]);
                 console.log(menu.length);
                 whichModel("model3");
                 var obj = $("div#leftContainer");
                 var obj1 = obj.children("img#threeImage");
                 var obj2 = obj.find("strong");
                 var obj3 = obj.find("small");
                 excuteCss(obj1, obj2, obj3, menu[0]);
                 obj = $("div.rightContainer");
                 obj1 = obj.find("img#threeImage2");
                 obj2 = obj.find("div#Nword").find("strong");
                 obj3 = obj.find("div#Nword").find("small");
                 excuteCss(obj1, obj2, obj3, menu[1]);
                 obj1 = obj.find("div#Image3").find("img");
                 obj2 = obj.find("div#Image3").find("strong");
                 obj3 = obj.find("div#Image3").find("small");
                 excuteCss(obj1, obj2, obj3, menu[2]);
                 break;

         }

         //切换tab
         $(".am-nav").children().removeClass("am-active");
         console.log(modelCon.styleName);
         var str = modelCon.styleName;
         $(".am-nav").find("strong:contains('" + str + "')").parent().addClass("am-active");
     },
     //显示菜品简介。
     showIntroduce: function(e) {
         var cookName = $(this).find("strong").html();
         var tempObj = {};
         //得到用户点击的菜品
         tempObj = modelCon.getDishFromMenu(cookName);
         //将点击的菜品填充到页面中。
         modelCon.fillIntroduce(tempObj);
     },
     //遍历数组，得到当前的菜品
     getDishFromMenu: function(cookName) {
         //由得到的菜名在menuArr中找到用户点击的餐然后把菜品介绍显示出来
         var menArr = modelCon.menuArr;
         //暂时存放用户点击的菜品的信息
         var tempObj = {};
         for (var i = 0; i < menArr.length; i++) {
             console.log(menArr[i].introduce);
             if (menArr[i].cookname == cookName)
                 tempObj = menArr[i];
         }
         return tempObj;
     },
     //填充菜品简介。
     fillIntroduce: function(menuObj) {
         $("#modalConfirm").show();
         var str = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
         $("#cookname").html(menuObj.cookname);
         console.log(menuObj.introduce);
         $("#introduce").html(str + menuObj.introduce);
     },
     //将菜品放入购物车
     makeOrder: function() {
         var cookName = $("#cookname").html();
         var tempObj = {};
         //得到用户点餐的菜品
         tempObj = modelCon.getDishFromMenu(cookName);
         var menuId = tempObj.id;
         //得到用户点餐的菜品
         var num = parseInt($("#num").val());
         $("#num").val("1");
         //得到用户对菜品的要求
         var menuRequire = [];
         var array = modelCon.menuIntrOption;
         for (var i = array.length - 1; i >= 0; i--) {
             if (array[i].checked) {
                 console.log(array[i].option);
                 menuRequire.push(array[i].option);
                 modelCon.menuIntrOption[i].checked = false;
             }
         }
         menuRequire = menuRequire.join(" ");
         console.log(menuRequire);
         //得到用户对菜品的其他要求。
         // var otherRequire=$("#otherRequire").val();
         // $("#otherRequire").val("");
         // var taste=menuRequire+" "+otherRequire; 
         var taste = menuRequire;
         console.log(taste);
         var orderArr = modelCon.orderArr;
         var action = "Add";
         console.log(modelCon.orderArr);
         //判断用户是不是重复点同一道菜，是：合并，否：num=1
         for (var i = 0; i < orderArr.length; i++) {
             console.log(orderArr[i].menuId);
             if (orderArr[i].menuId == menuId) {
                 num = num + parseInt(orderArr[i].num);
                 taste = taste + " " + orderArr[i].taste;
                 console.log(taste);
                 console.log(orderArr[i].menuId);
                 modelCon.orderArr.splice(i, 1);
                 action = "Modify";
             }
         }
         var name = tempObj.name;
         var price = tempObj.price;
         var dealOrder = function(result) {
                 console.log(result);
                 if (result == "success") {
                     result = "点菜成功";
                 } else {
                     result = "点菜失败";
                 }
                 modelCon.showAlert(true, result);
                 avalon.scan();
                 //将用户点餐的菜品存储数组。为判断重复点餐，合并菜品做准备。
                 modelCon.orderArr.push({ menuId: menuId, name: name, price: price, num: num, taste: taste });
                 //将用户点餐存入localStorage，以防程序闪退 
                 localStorage.orderArr = JSON.stringify(modelCon.orderArr.$model);
             }
             //调用与后台的接口，将用户所点菜品发送到后台。
         orderObj.addOrModify(action, menuId, num, taste, dealOrder);
         $("#modalConfirm").hide();
     },
     //减少份数
     reduceNum: function() {
         var num = parseInt($("#num").val());
         if (num <= 1) {
             modelCon.showAlert(true, "至少点一份。")
         } else {
             num--;
         }
         $("#num").val(num);
     },
     //增加份数
     addNum: function() {
         var num = parseInt($("#num").val());
         num++;
         $("#num").val(num);
     },
     //购物车菜品减少
     shoppindReduceNum: function(index) {
         //传参过来的index是修改的菜品在notOrderArr数组中的索引。 
         var action = "Modify";
         var menuId = modelCon.orderArr[index].menuId;
         var lastNum = modelCon.orderArr[index].num;
         if (lastNum <= 1) {
             modelCon.showAlert(true, "至少点一份。")
         } else {
             lastNum--;
             modelCon.orderArr[index].num = lastNum;
             var taste = modelCon.orderArr[index].taste;
             //if (taste==""||taste==" ")taste=",";
             console.log(menuId);
             console.log(lastNum);
             console.log(taste);
             orderObj.addOrModify(action, menuId, lastNum, taste);
         }
     },
     //购物车菜品添加
     shoppingAddNum: function(index) {
         var action = "Modify";
         var menuId = modelCon.orderArr[index].menuId;
         var lastNum = modelCon.orderArr[index].num;
         lastNum = parseInt(lastNum) + 1;
         modelCon.orderArr[index].num = lastNum;
         var taste = modelCon.orderArr[index].taste;
         //if (taste==""||taste==" ")taste=",";
         console.log(menuId);
         console.log(lastNum);
         console.log(taste);
         orderObj.addOrModify(action, menuId, lastNum, taste);
     },
     //删除订单
     deletMenu: function(index) {
         var r = confirm("您确定要删除" + modelCon.orderArr[index].name + "嘛？");
         if (r == true) {
             orderObj.Del(modelCon.orderArr[index]);
             modelCon.orderArr.splice(index, 1);
             localStorage.orderArr = JSON.stringify(modelCon.orderArr);
         }
     },
     //修改订单
     changeMenu: function(index) {
         //还没想好怎么实现。。。
         modelCon.showAlert(true, "还没想好怎么实现");
         avalon.scan();
     },
     //添加等上操作
     waitMenu: function(index) {
         var action = "Modify";
         var menuId = modelCon.orderArr[index].menuId;
         var lastNum = modelCon.orderArr[index].num;
         var taste = modelCon.orderArr[index].taste + " " + "等上";
         modelCon.orderArr[index].taste = taste;
         avalon.scan();
         orderObj.addOrModify(action, menuId, lastNum, taste);

     },
     //提交订单，需要授权
     commitMenu: function() {
         var pw = $('#password').val();
         var data = { pwd: $.md5(pw) };
         console.log($.md5(pw));
         var paramFunc = function(data) {
             console.log(data);
             if (data == "success") {
                 var action = "Make";
                 if (modelCon.makeOrderArr.length !== 0) action = "Extra";
                 //提交订单，
                 orderObj.Make(action);
             } else {
                 modelCon.showAlert(true, "密码错误，请重新输入")
             }
             $('#password').val("");
         }
         commonObj.loginc(data, paramFunc);
     },
     //显示购物车页面
     showShoppingCart: function() {
         //获得菜单
         $("#pagetwo").show();
         $("#pageone").hide();
         orderObj.read();
     },
     reback: function() {
         $("#pageone").attr("style", "display:block");
         $("#pagetwo").attr("style", "display:none");
     },
     //计算总价钱数
     countTotleMoney: function(resObj, tag) {
         var totle = 0;
         var num = 0;
         console.log(resObj);
         for (var i = 0; i < resObj.length; i++) {
             totle = totle + parseInt(resObj[i].price * resObj[i].num);
             num = num + parseInt(resObj[i].num);
             //resObj[i].taste=resObj[i].taste.replace("&lt;&gt;"," ");
         }

         if (tag == 1) {
             modelCon.hasOrderTotleMoney = totle;
             modelCon.hasOrderTotleNum = num;
         } else {
             modelCon.totleMoney = totle;
             modelCon.totleNum = num;
         }
         console.log(totle);
         console.log(num);
         console.log(modelCon.totleMoney);
         console.log(modelCon.totleNum);
         avalon.scan();
     },
     //已下单与未下单之间切换
     changeAlreadyAndNotYet: function(data) {
         if (data == 0) {
             $(".notYet").html();
             modelCon.currentIndex = data;
         } else {
             if (modelCon.makeOrderArr.length == 0)
                 modelCon.showAlert(true, "您还没有下单，请下单后查看");
             else
                 modelCon.currentIndex = data;
         }
     },
     //读取localStorage中的菜单备份。
     readStorageMenu: function() {
         var temp;
         if (localStorage.orderArr) {
             temp = JSON.parse(localStorage.orderArr);
             console.log(temp);
         }
         localStorage.orderArr = "";
         modelCon.orderArr = temp;
         console.log(modelCon.orderArr);
     },
     //结账服务事件
     cashServer: function() {
         $("#cashPrompt").show();

     },
     cashEvent: function() {
         $("#cash").show();
         orderObj.read();
     },


     //系统设置
     setServer: function() {
         var server = $("#server").val();
         var name = $("#restaurantName").val();
         if (server != "" && name != "") {
             SERVER = server;
             console.log(SERVER);
             modelCon.restaurantName = name;
             localStorage.SERVER = server;
             localStorage.restaurantName = name;
             $("#setServerPrompt").hide();
             //意义同initsystem里面的函数
             //afterSetting();
             //initSystem();
             dataSyn = new SysData();
             adData = new Ads();
             console.log(dataSyn.checkUrl);
             upDb = new Db();
             adDb = new Dp();
             fileTransfer = new FileTransfer();
             //网络未连接监听事件
             document.addEventListener("offline",
                 function() {
                     modelCon.showAlert(true, "网络未连接，请连接网络后点餐！");
                 }, false);
             //网络连接监听事件
             document.addEventListener("online",
                 function() {
                     dataSyn.doSyn();
                     adData.doAdSyn();
                     avalon.scan();
                     initSystem();
                     avalon.scan();
                 }, false);
             dataSyn.doSyn();
             adData.doAdSyn();
             avalon.scan();
             initSystem();
             avalon.scan();
         } else {
             modelCon.showAlert(true, "系统设置不能为空");
         }
     },
     //桌面结账
     cash: function() {
         $("#cash").hide();
         $("#cashPrompt").show();
     },
     commitCash: function() {
         $("#cash").hide();
         //调用tableModel中的桌号解绑
         //        var cashPwd = $("#cashPassword").innerText;
         var pw = $('#cashPassword').val();
         var tableId = localStorage.tableId;
         var tableName = localStorage.tableName;
         //        this.tableId=localStorage.tableId;
         //        modelCon.table=localStorage.tableName;

         var data = { pwd: $.md5(pw) };
         console.log($.md5(pw));
         var paramFunc = function(data) {
             console.log(data);
             if (data == "success") {
                 tableObj.removeTableId(tableId, tableName);
                 //        				var action="Make";
                 //        				if(modelCon.makeOrderArr.length!==0) action="Extra";
                 //        				//提交订单，
                 //        				orderObj.Make(action);
             } else {
                 modelCon.showAlert(true, "密码错误，请重新输入")
             }
             $('#password').val("");
         }
         commonObj.loginc(data, paramFunc);
     },
     //格式用户点菜的要求
     formalTaste: function(taste) {
         taste = taste.toString();
         taste = taste.split(" ");
         Array.prototype.unique = function() {
             var res = [];
             var json = {};
             for (var i = 0; i < this.length; i++) {
                 if (!json[this[i]]) {
                     res.push(this[i]);
                     json[this[i]] = 1;
                 }
             }
             return res;
         }
         taste = taste.unique();
         taste = taste.join(" ");
         //去除多余的空格 
         taste = taste.replace(/(^\s*)|(\s*$)/g, "");
         taste = taste.replace(/\s/g, " ");
         console.log(taste);
         return taste.toString();
     },
     //显示评价弹框
     showComment: function(index) {
         $('#comment').show();
         modelCon.currentCommentName = modelCon.makeOrderArr[index].name;
         avalon.scan();
     },
     //评价菜品
     comment: function() {
         var name = modelCon.currentCommentName;
         console.log(name);
         // var star=modelCon.commentDescription;
         // console.log(star); 
         var texture = $("#texture").val();
         var color = $("#color").val();
         //var multiple=$("#multiple").val();+"<tag>"+multiple
         var star = texture + "<tag>" + color;
         console.log(star);
         var menuId;
         for (var i = 0; i < modelCon.makeOrderArr.length; i++) {
             if (name == modelCon.makeOrderArr[i].name)
                 menuId = modelCon.makeOrderArr[i].menuId;
         }
         console.log(menuId);
         var otherComment = $("#otherComment").val();
         console.log(otherComment);
         var data = { menuId: menuId, degree: star, suggest: otherComment };
         console.log(commentObj);
         commentObj.commiteComment(data);
     },
     hallChange: function() {
         $(".out").stop().animate({ 'top': '0px' }, 200); // 向上滑动 - 显示
         $(".over").stop().animate({ 'top': '-45px' }, 200);
         $(".out", this).stop().animate({ 'top': '45px' }, 200); // 向下滑动 - 隐藏
         $(".over", this).stop().animate({ 'top': '0px' }, 200); // 向下滑动 - 显示 
         var cate = $(this).attr("class");
         $(".numBoard").each(function() {
             var board = $(this).attr("type");
             cate = cate.replace(/^\s+|\s+$/g, "");
             board = board.replace(/^\s+|\s+$/g, "");
             if (board == cate) {
                 $(this).attr("style", "display:block");
             } else {
                 $(this).attr("style", "display:none");
             }
         });
     },
     //小标签切换
     smallTagChange: function() {
         console.log($("#menu2 li").length);
         $("#menu2 li").each(function() {
             console.log($(this).find(".out").html());
             $(this).find(".out").attr("style", "top:45px");
             $(this).find(".over").attr("style", "top:0px");
             return false;
         });
     }

 })