$(function () {

    if (thisIsNull($("#account-bh").val())) {
        $("#account-bh").val(getBhFromTime());
    }
    $(".td-value input, select, option,textarea").mouseover(function () {
        $(this).css("box-shadow", "0 0 2px 0.5px red inset");
    });
    $(".td-value input, select, option,textarea").mouseout(function () {
        $(this).css("box-shadow", "none");
    });

    var initType = initGoodsType();
    initType = getGoodsSmallType();
    // 初始化交易商品明细表格
    var rows = 10;
    if (thisIsNull($("#tradeInfoSize").val())) {
        initTableList(rows);
    }
});

function saveAccount() {
    var listData = makeListFromTable(".list-form");
    listData = JSON.stringify(listData);
    var url = "/koala-platform/account/saveAccount?" + $("#form").serialize();
    $.ajax({
        url: url,
        type: "POST",
        data: listData,
        async: true,
        contentType: 'application/json;charset=utf-8',
        success: function (data) {
            if (data == "success") {
                /*window.location.reload();*/
                makeBlockTime("保存成功！");
            }

        },
        error: function (data) {
            alert(data);
        }
    })

}
var initGoodsType = function () {
    var url = goodsUrl + "/";
    $.ajax({
        url: url,
        type: "post",
        async: false,
        success: function (data) {
            data.forEach(function (e) {
                $("#goods-big-type").append('<option value="' + e.DM + '"onclick="getGoodsSmallType()">' + e.MC + '</option>');
            });
            return true;
        }
    })
};
function getGoodsSmallType() {
    var bigType = $('#goods-big-type').val();
    $("#goods-type").empty();
    var url = goodsUrl + "/getSmallTypes";
    $.ajax({
        url: url,
        data: {type: bigType},
        type: "post",
        success: function (data) {
            data.forEach(function (e) {
                $("#goods-type").append('<option value="' + e.DM + '">' + e.MC + '</option>');
            });
            return true;
        }
    })
};

function goodsUnitDropdown() {

}

function toGoodsList() {
    var url = "/koala-platform/goods/toGoodsList";
    window.open(url);
}