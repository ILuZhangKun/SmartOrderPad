/**
 * 呼叫控制类
 * 主要完成呼叫功能控制
 */

var Ring = Common.extend({
    init: function() {
        this.dealRingUrl = "http://" + SERVER + "/" + ProName + "/DealRing";
    },
    callWaiter: function(array) {
        console.log('RingModel:callWaiter');
        var ringType = [];
        for (var i = array.length - 1; i >= 0; i--) {
            if (array[i].checked) {
                console.log(array[i].option);
                ringType.push(array[i].option);
                modelCon.callWaiterOption[i].checked = false;
            }
        }
        ringType = ringType.join("***");
        var tableId = localStorage.tableId;
        var uuId = localStorage.uuId;
        var action = "addRing";

        var data = { tableId: tableId, uuId: uuId, ringType: ringType, action: action };
        console.log(tableId);
        console.log(uuId);
        console.log(action);
        console.log(ringType);
        var fun = function(data) {
            console.log(data);
            if (data == "success") {
                modelCon.showAlert(true, "呼叫成功，请耐心等待");
                $("#waiterMenu").hide();
                //		$("#callWaiter").hide();
                //		$("#stopCall").show();
            }
        };
        this.ajaxRequest(data, fun);
    },
    stopCallWaiter: function() {
        var data = { tableId: localStorage.tableId, uuId: localStorage.uuId, ringType: "", action: "delRing" };
        var fun = function(data) {
            modelCon.showAlert(true, "呼叫取消");
            $("#waiterMenu").hide();
            $("#callWaiter").show();
            $("#stopCall").hide();
        };
        this.ajaxRequest(data, fun);
    },
    ajaxRequest: function(data, fun) {
        this._super(data, this.dealRingUrl, fun);
    }
});