// 全局显示空桌数
$.ajax({
    type: 'post',
    async: true,
    url: '', //修改
    dataType: 'json',
    success: function(data) {

    },
    error: function(data) {
        data = {
            '2': [{
                    "name": "富贵厅三号桌",
                    "id": "15",
                    "num": "2"
                },
                {
                    "name": "迎宾厅四号桌",
                    "id": "20",
                    "num": "2"
                }
            ],
            '3': [{
                "name": "富贵厅一号桌",
                "id": "1",
                "num": "3"
            }],
            '4': [{
                "name": "富贵厅二号桌",
                "id": "8",
                "num": "4"
            }],
            '5': [{
                "name": "迎宾厅一号桌",
                "id": "2",
                "num": "5"
            }],
            '6': [{
                    "name": "清风厅二号桌",
                    "id": "18",
                    "num": "6"
                },
                {
                    "name": "怀旧厅ll",
                    "id": "26",
                    "num": "6"
                }
            ],
            '10': [{
                "name": "迎宾厅7777",
                "id": "27",
                "num": "10"
            }]
        };

        for (var attr in data) {
            var allTable = document.getElementById('tab5').getElementsByTagName('span');
            showEmptyTable(allTable,attr);
        }
        
    }
});

function showEmptyTable(allTable, arr) {
    $(allTable).each(function() {
        for (var i = 0; i < $(arr).length; i++) {
            if ($(this).children('a').text() == arr[i].name) {
                $(this).addClass('bluetable');
            }
        }
    });
}