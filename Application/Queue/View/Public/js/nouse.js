// 全局显示桌子和空桌颜色变蓝
//没啥用
function getEmptyTableDisplay() {
    $.ajax({
        type: 'post',
        async: true,
        url: 'getTableDisplay',
        dataType: 'json',
        success: function(data) {
            // console.log(data);
            var allEmptyTable = document.getElementById('tab5').getElementsByClassName('table');
            for (var attr in data) {
                if (attr == 2) {
                    var allTable = document.getElementById('tab1').getElementsByClassName('table');
                    showEmptyTable(allTable, data[attr]);
                    showEmptyTable(allEmptyTable, data[attr]);

                } else if (attr == 4) {
                    var allTable = document.getElementById('tab2').getElementsByClassName('table');
                    showEmptyTable(allTable, data[attr]);
                    showEmptyTable(allEmptyTable, data[attr]);
                } else if (attr == 6) {
                    var allTable = document.getElementById('tab3').getElementsByClassName('table');
                    showEmptyTable(allTable, data[attr]);
                    showEmptyTable(allEmptyTable, data[attr]);
                } else {
                    var allTable = document.getElementById('tab4').getElementsByClassName('table');
                    showEmptyTable(allTable, data[attr]);
                    showEmptyTable(allEmptyTable, data[attr]);
                }
            }
        },
        error: function(data) {}
    });
}

function showEmptyTable(allTable, arr) {
    //现在的allTable是每一页的table数组是一维的
    //遍历table
    //通过is_leave=1来判断为空桌?
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].is_leave == 1) {
            for (var j = 0; j < allTable.length; j++) {
                if (allTable[j].id == arr[i].id || allTable[j].getElementsByTagName("a")[0].innerText == arr[i].name) {
                    allTable[j].classList.add('class', 'bluetable');
                    //为每一个蓝色按钮添加点击事件
                    allTable[j].onclick = function() {
                        //调用upTable.js中的函数
                        if (this.getAttribute('id')) {
                            //调用upTable.js中的函数
                            isDistribute(this);
                        }
                    };
                }
            }
        }
    }
}