// 桌面显示

function getNewestTableCondition() {
    /*如果存在旧数据，则清除*/
    var tab = document.getElementsByClassName('tab');
    for (var i = 0; i < tab.length; i++) {
        var tables = tab[i].getElementsByClassName('table');
        // console.log("tab" + (i + 1));
        // console.log("table数量：" + tables.length);
        while (tables.length != 0) {
            // console.log(tables[0].innerHTML);
            tables[0].parentNode.removeChild(tables[0]);
        }
    }
    $.ajax({
        type: 'post',
        async: true,
        url: 'getTableDisplay', //修改
        dataType: 'json',
        data: {},
        success: function(data) {
            for (var attr in data) {
                if (attr == 1 || attr == 2) {
                    // var tab1 = document.getElementById('tab1');
                    var tab1 = document.getElementById('tableDisplay1');
                    for (var i = 0; i < data[attr].length; i++) {
                        if (data[attr][i].is_leave == 1) {
                            tab1.innerHTML += '<span class="table bluetable" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                        } else {
                            tab1.innerHTML += '<span class="table" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                        }

                    }
                } else if (attr == 3 || attr == 4) {
                    // var tab2 = document.getElementById('tab2');
                    var tab2 = document.getElementById('tableDisplay2');
                    for (var i = 0; i < data[attr].length; i++) {
                        if (data[attr][i].is_leave == 1) {
                            tab2.innerHTML += '<span class="table bluetable" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                        } else {
                            tab2.innerHTML += '<span class="table" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                        }

                    }
                } else if (attr == 5 || attr == 6) {
                    // var tab3 = document.getElementById('tab3');
                    var tab3 = document.getElementById('tableDisplay3');
                    for (var i = 0; i < data[attr].length; i++) {
                        if (data[attr][i].is_leave == 1) {
                            tab3.innerHTML += '<span class="table bluetable" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                        } else {
                            tab3.innerHTML += '<span class="table" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                        }

                    }
                } else {
                    // var tab4 = document.getElementById('tab4');
                    var tab4 = document.getElementById('tableDisplay4');
                    for (var i = 0; i < data[attr].length; i++) {
                        if (data[attr][i].is_leave == 1) {
                            tab4.innerHTML += '<span class="table bluetable" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                        } else {
                            tab4.innerHTML += '<span class="table" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                        }

                    }
                }
            }
            for (var attr in data) {
                // var tab5 = document.getElementById("tab5");
                var tab5 = document.getElementById("tableDisplay5");
                for (var i = 0; i < data[attr].length; i++) {
                    if (data[attr][i].is_leave == 1) {
                        tab5.innerHTML += '<span class="table bluetable" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                    } else {
                        tab5.innerHTML += '<span class="table" id="' + data[attr][i].id + '">' + '<a href="#">' + data[attr][i].name + '</a></span>';
                    }
                }
            }
        },
        error: function(data) {}
    });
    //调用getGlobalEmptyTables.js中的函数在小圆点中显示空桌统计数
    getEmptyTableTotal();
}