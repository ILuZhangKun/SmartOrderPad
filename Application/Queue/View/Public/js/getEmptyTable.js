// 全局显示桌子和空桌颜色变蓝
    $.ajax({
        type: 'post',
        async: true,
        url: '/SmartOrder/index.php/Queue/Queue/getTableDisplay', //修改
        dataType: 'json',
        success: function(data) {
            // console.log(data);
            var allEmptyTable = document.getElementById('tab5').getElementsByClassName('table');
            for (var attr in data) {
                if (attr == 2 || attr == 1) {
                    var allTable = document.getElementById('tab1').getElementsByClassName('table');
                    showEmptyTable(allTable, data[attr]);
                    showEmptyTable(allEmptyTable, data[attr]);

                } else if (attr == 4 || attr == 3) {
                    var allTable = document.getElementById('tab2').getElementsByClassName('table');
                    showEmptyTable(allTable, data[attr]);
                    showEmptyTable(allEmptyTable, data[attr]);
                } else if (attr == 6 || attr == 5) {
                    var allTable = document.getElementById('tab3').getElementsByClassName('table');
                    showEmptyTable(allTable, data[attr]);
                    showEmptyTable(allEmptyTable, data[attr]);
                } else {
                    var allTable = document.getElementById('tab4').getElementsByClassName('table');
                    showEmptyTable(allTable, data[attr]);
                    showEmptyTable(allEmptyTable, data[attr]);
                }
            }
            for(var attr in data){
                var tab5 = document.getElementById("#tab5");
            }
            function showEmptyTable(allTable, arr) {
            //     //现在的allTable是每一页的table数组是一维的
            //     //遍历table
            //     //通过is_leave=1来判断为空桌?
                for (var i = 0; i < arr.length; i++) {
                    if (arr[i].is_leave == 1) {
                        for (var j = 0; j < allTable.length; j++) {
                            if (allTable[j].id == arr[i].id || allTable[j].getElementsByTagName("a")[0].innerText == arr[i].name) {
                                allTable[j].classList.add('class', 'bluetable');
                                //为每一个蓝色按钮添加点击事件
                                allTable[j].onclick = function() {
                                    //调用upTable.js中的函数
                                    if (this.getAttribute('id')) {
                                        isDistribute(this);
                                    }
                                };
                            }
                        }
                    }
                }
            }

        },
        error: function(data) {
        }
    });

    