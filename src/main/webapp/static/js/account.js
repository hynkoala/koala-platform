$(function () {
    if (thisIsNull($("#account-bh").val())) {
        $("#account-bh").val(getBhFromTime());
    }
    $(".td-value :text, select, option,textarea").mouseover(function () {
        $(this).css("box-shadow", "0 0 2px 0.5px red inset");
    });
    $(".td-value input, select, option,textarea").mouseout(function () {
        $(this).css("box-shadow", "none");
    });
    // 初始化交易商品明细表格
    var rows = 10;
    rows = 10 - $(".tradeInfo-list").length;
    if (rows > 0) {
        initTableList(rows);
    }
    var initType = initGoodsType();
    initType = getGoodsSmallType('001', 'all');

    $("input.goods-name").bind("input propertychange", function () {
        $("input").removeClass("active");
        $(this).addClass("active");
        getGoodsInfo($(this).val());
    });
});

function saveAccount() {
    var listData = makeListFromTable("#list-form");
    listData = JSON.stringify(listData);
    var url = "/koala-platform/account/saveAccount?" + $("#form").serialize();
    $.ajax({
        url: url,
        type: "POST",
        data: listData,
        async: true,
        contentType: 'application/json;charset=utf-8',
        success: function (data) {
            if (data.msg == "success") {
                var url = window.location.host;
                window.location.href = "http://" + url + accountUrl + "/accountDetails?accountType=" + data.accountType + "&accountId=" + data.accountId;
            }

        },
        error: function (data) {
            alert(data);
        }
    })

}
var initGoodsType = function () {
    var url = goodsUrl + "/getBigTypes";
    $.ajax({
        url: url,
        type: "post",
        async: false,
        success: function (data) {
            data.forEach(function (e) {
                $(".goods-big-type").append('<li value="' + e.DM + '"onclick="getGoodsSmallType()">' + e.MC + '</li>');
            });
            //$("#itemlist option").click(putInGoodsInfo());
            return true;
        }
    })
};
function getGoodsSmallType(bigType, target) {
    //$("#goods-type").empty();
    var targetSelect;
    if (target == "all") {
        targetSelect = $(".goods-type")
    } else{
        targetSelect = $(target).parent().find(".goods-type");
    }
    $.each(targetSelect,function(i){
        $(targetSelect[i]).empty();
    })
    var url = goodsUrl + "/getSmallTypes";
    $.ajax({
        url: url,
        data: {type: bigType},
        type: "post",
        success: function (data) {
            $.each(targetSelect,function(i){
                data.forEach(function (e) {
                    $(targetSelect[i]).append('<option value="' + e.DM + '">' + e.MC + '</option>');
                });
            })
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

function getGoodsInfo(goodsName,input) {
    if(thisIsNull(input)){
        var currentInput = $("input.active");
    }else {
        $("input").removeClass("active");
        currentInput = input;
        $(currentInput).addClass("active");
    }
    //currentInput.parent().find("ul").empty();
    var currentUl=$(currentInput).parent().find("ul");
    var url = goodsUrl + "/getGoodsInfo?goodsName=" + goodsName;
    $.ajax({
        url: encodeURI(url),
        type: 'post',
        dataType: 'json',
        success: function (data) {
            $(currentInput).parent().find("ul").empty();
            $.each(data, function (e) {
                $(currentInput).parent().find("ul").append('<li id="' + data[e].goodsId + '" onclick=putInGoodsInfo(' + JSON.stringify(data[e]) + ')>' + data[e].goodsName + '</li>')
            })
            currentUl.show();
        }
    })
}

function putInGoodsInfo(goods) {
    var currentInput = $("input.active");
    var rowInput = currentInput.parent().parent().find("input");
    $.each(rowInput, function (i) {
        if (this.name == 'goodsId') {
            $(this).val(goods.goodsId);
        }
        if (this.name == 'goodsName') {
            $(this).val(goods.goodsName);
        }
        if (this.name == 'goodsUnit') {
            $(this).val(goods.goodsUnit);
        }
    });
    currentInput.parent().find("ul").empty();
}

function showTypeDropdown(target,size) {
    var targetUl
    if(!thisIsNull(target)){
        if(size=='bigtype'){
            targetUl = $(target).parent().find("ul.goods-big-type");
        }else if(size=='smalltype'){
            targetUl = $(target).parent().find("ul.goods-small-type");
        }
    }
    targetUl.show();
}
function showSmallTypeSelect() {
    makeBlockTime("haha")
}

