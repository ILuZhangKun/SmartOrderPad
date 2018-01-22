// 小圆点个数的判断
function getEmptyTableTotal() {
    $.ajax({
        type: 'post',
        async: true,
        url: 'getGlobalEmptyTables', //修改
        dataType: 'json',
        success: function(data) {
            var sum = 0;
            for (var attr in data) {
                if (data[attr] != '') {
                    if (attr == 1 || attr == 2) {
                        var circle1 = document.getElementById('circle1');
                        circle1.innerText = data[attr];
                        circle1.style.background = 'red';
                        circle1.style.color = "white";
                    } else if (attr == 3 || attr == 4) {
                        var circle2 = document.getElementById('circle2');
                        circle2.innerText = data[attr];
                        circle2.style.background = 'red';
                        circle2.style.color = "white";
                    } else if (attr == 5 || attr == 6) {
                        var circle3 = document.getElementById('circle3');
                        circle3.innerText = data[attr];
                        circle3.style.background = 'red';
                        circle3.style.color = "white";
                    } else {
                        var circle4 = document.getElementById('circle4');
                        // console.log(data[attr]);
                        var a = parseInt(data[attr]);
                        sum += a;
                        circle4.innerText = sum;
                        circle4.style.background = 'red';
                        circle4.style.color = "white";
                    }
                }
            }
            var msg = 0;
            for (var attr in data) {
                if (data[attr] != '') {
                    var circle5 = document.getElementById('circle5');
                    var a = parseInt(data[attr]);
                    msg += a;
                    circle5.innerText = msg;
                    circle5.style.background = 'red';
                    circle5.style.color = "white";
                }
            }
        },
        error: function(data) {}
    });
}