// 排队队列显示
function getNewestQueneCondition() {
    /*如果存在旧数据，则清除*/
    var tabTable = document.getElementsByClassName('tabTable');
    for (var i = 0; i < tabTable.length; i++) {
        var trs = tabTable[i].getElementsByTagName('tr');
        while (trs.length >= 2) {
            trs[1].parentNode.removeChild(trs[1]);
        }
    }
    var cirArray = document.getElementsByClassName('cir');
    var tabTableArray = document.getElementsByClassName('tabTable');

    /*初始化*/
    for (var i = 0; i < cirArray.length; i++) {
        cirArray[i].innerHTML = "当前排队数有：0";
    }
    for (var i = 0; i < tabTableArray.length - 1; i++) {
        //console.log(tabTableArray[i]);
        var emptyTipRow = document.createElement('tr');
        emptyTipRow.setAttribute('class', 'emptyTip');
        emptyTip = document.createElement('td');
        emptyTip.setAttribute('colspan', '4');
        emptyTip.innerHTML = "暂无顾客排队";
        emptyTipRow.appendChild(emptyTip);
        tabTableArray[i].getElementsByTagName('tbody')[0].appendChild(emptyTipRow);
    }
    $.ajax({
        type: 'post',
        async: true,
        url: 'getQueue', //修改
        dataType: 'json',
        success: function(data) {
            var tbody = document.getElementById('tbMain');

            for (var attr in data) {
                if (attr == 2 || attr == 1) {
                    //清除一下？
                    var tabTable1 = document.getElementById('tabTable1').getElementsByTagName('tbody')[0];
                    // var tbody = tabTable1.getElementsByTagName('tbody')[0];
                    var emptyTipRow = tabTable1.getElementsByClassName('emptyTip')[0];
                    // console.log(emptyTipRow.parentNode);
                    if (emptyTipRow)
                        emptyTipRow.parentNode.removeChild(emptyTipRow);
                    //tabTable1.removeChild(emptyTipRow);
                    var m = 0;
                    for (var i in data[attr]) {
                        var row = document.createElement('tr');
                        var idCol = document.createElement('td');
                        row.appendChild(idCol);
                        var telCol = document.createElement('td');
                        telCol.setAttribute('colspan', '2');
                        telCol.innerHTML = data[attr][i].tel.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
                        row.appendChild(telCol);

                        var numCol = document.createElement('td');
                        numCol.innerHTML = data[attr][i].id;
                        row.appendChild(numCol);
                        var btn = document.createElement('td');
                        btn.setAttribute('colspan', '3');
                        var del = document.createElement('button');
                        del.innerText = "过号";
                        var top = document.createElement('button');
                        top.innerText = "上桌";
                        var send = document.createElement('button');
                        send.innerText = "短信";

                        btn.append(del);
                        btn.append(top);
                        btn.append(send);

                        row.appendChild(btn);



                        tabTable1.append(row);
                        var index = row.rowIndex
                        idCol.innerText = index;
                        del.onclick = confirmDel;
                        top.onclick = confirmTop;
                        send.onclick = confirmSendMessage;
                        m++;
                    }
                    //设置右边列表高度
                    // tabTable1.setAttribute("height", tabTable1.parentNode.getAttribute('height') * 0.9);
                    var cir1 = document.getElementById('cir1');
                    cir1.innerHTML = "当前排队数有：" + m;
                    // alert(m);

                } else if (attr == 3 || attr == 4) {
                    var tabTable2 = document.getElementById('tabTable2').getElementsByTagName('tbody')[0];
                    var emptyTipRow = tabTable2.getElementsByClassName('emptyTip')[0];
                    if (emptyTipRow)
                        emptyTipRow.parentNode.removeChild(emptyTipRow);
                    var m = 0;
                    for (var i in data[attr]) {
                        var row = document.createElement('tr');
                        var idCol = document.createElement('td');
                        row.appendChild(idCol);
                        var telCol = document.createElement('td');
                        telCol.setAttribute('colspan', '2');
                        telCol.innerHTML = data[attr][i].tel.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
                        row.appendChild(telCol);
                        var numCol = document.createElement('td');
                        numCol.innerHTML = data[attr][i].id;
                        row.appendChild(numCol);
                        var btn = document.createElement('td');
                        btn.setAttribute('colspan', '3');
                        var del = document.createElement('button');
                        del.innerText = "过号";
                        var top = document.createElement('button');
                        top.innerText = "上桌";
                        var send = document.createElement('button');
                        send.innerText = "短信";

                        btn.append(del);
                        btn.append(top);
                        btn.append(send);

                        row.appendChild(btn);

                        tabTable2.append(row);
                        idCol.innerText = row.rowIndex;
                        del.onclick = confirmDel;
                        top.onclick = confirmTop;
                        send.onclick = confirmSendMessage;
                        m++;
                    }
                    var cir2 = document.getElementById('cir2');
                    cir2.innerHTML = "当前排队数有：" + m;

                } else if (attr == 5 || attr == 6) {
                    var tabTable3 = document.getElementById('tabTable3').getElementsByTagName('tbody')[0];
                    var emptyTipRow = tabTable3.getElementsByClassName('emptyTip')[0];
                    if (emptyTipRow)
                        emptyTipRow.parentNode.removeChild(emptyTipRow);
                    var m = 0;
                    for (var i in data[attr]) {
                        var row = document.createElement('tr');
                        var idCol = document.createElement('td');
                        row.appendChild(idCol);
                        var telCol = document.createElement('td');
                        telCol.setAttribute('colspan', '2');
                        telCol.innerHTML = data[attr][i].tel.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
                        row.appendChild(telCol);
                        var numCol = document.createElement('td');
                        numCol.innerHTML = data[attr][i].id;
                        row.appendChild(numCol);
                        var btn = document.createElement('td');
                        btn.setAttribute('colspan', '3');
                        var del = document.createElement('button');
                        del.innerText = "过号";
                        var top = document.createElement('button');
                        top.innerText = "上桌";
                        var send = document.createElement('button');
                        send.innerText = "短信";

                        btn.append(del);
                        btn.append(top);
                        btn.append(send);

                        row.appendChild(btn);

                        tabTable3.append(row);
                        idCol.innerText = row.rowIndex;
                        del.onclick = confirmDel;
                        top.onclick = confirmTop;
                        send.onclick = confirmSendMessage;
                        m++;
                    }
                    var cir3 = document.getElementById('cir3');
                    cir3.innerHTML = "当前排队数有：" + m;
                } else {
                    var tabTable4 = document.getElementById('tabTable4').getElementsByTagName('tbody')[0];
                    var emptyTipRow = tabTable4.getElementsByClassName('emptyTip')[0];

                    if (emptyTipRow)
                        emptyTipRow.parentNode.removeChild(emptyTipRow);
                    var m = 0;
                    for (var i in data[attr]) {
                        var row = document.createElement('tr');
                        var idCol = document.createElement('td');
                        row.appendChild(idCol);
                        var telCol = document.createElement('td');
                        telCol.setAttribute('colspan', '2');
                        telCol.innerHTML = data[attr][i].tel.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
                        row.appendChild(telCol);
                        var numCol = document.createElement('td');
                        numCol.innerHTML = data[attr][i].id;
                        row.appendChild(numCol);
                        var btn = document.createElement('td');
                        btn.setAttribute('colspan', '3');
                        var del = document.createElement('button');
                        del.innerText = "过号";
                        var top = document.createElement('button');
                        top.innerText = "上桌";
                        var send = document.createElement('button');
                        send.innerText = "短信";

                        btn.append(del);
                        btn.append(top);
                        btn.append(send);

                        row.appendChild(btn);

                        tabTable4.append(row);
                        idCol.innerText = row.rowIndex;
                        del.onclick = confirmDel;
                        top.onclick = confirmTop;
                        send.onclick = confirmSendMessage;
                        m++;
                    }
                    // var cir4 = document.getElementById('cir4');
                    // var Length = document.getElementById('tabTable4').getElementsByTagName('tr').length;
                    // var length = Length - 1;
                    // cir4.innerHTML = "当前排队数有：" + length;
                    var cir4 = document.getElementById('cir4');
                    cir4.innerHTML = "当前排队数有：" + m;
                }
            }
            for (var attr in data) {
                var tabTable5 = document.getElementById('tabTable5').getElementsByTagName('tbody')[0];
                var emptyTipRow = tabTable5.getElementsByClassName('emptyTip')[0];
                if (emptyTipRow) {
                    console.log(emptyTipRow);
                    emptyTipRow.parentNode.removeChild(emptyTipRow);
                }
                for (var i in data[attr]) {
                    var row = document.createElement('tr');
                    var idCol = document.createElement('td');
                    //idCol.innerHTML=data[attr][i].id;
                    row.appendChild(idCol);
                    var telCol = document.createElement('td');
                    telCol.setAttribute('colspan', '2');
                    telCol.innerHTML = data[attr][i].tel.replace(/(\d{3})\d{4}(\d{4})/, '$1****$2');
                    row.appendChild(telCol);
                    var numCol = document.createElement('td');
                    numCol.innerHTML = data[attr][i].num;
                    row.appendChild(numCol);
                    // var tabTable5 = document.getElementById('tabTable5');
                    tabTable5.append(row);
                    idCol.innerText = row.rowIndex;
                }
                var cir5 = document.getElementById('cir5');
                var Length = document.getElementById('tabTable5').getElementsByTagName('tr').length;
                var length = Length - 1;
                cir5.innerHTML = "当前排队数有：" + length;
            }

        },
        error: function(data) {}

    });
}