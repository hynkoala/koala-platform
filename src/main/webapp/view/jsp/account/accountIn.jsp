<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 11/24 0024
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加货物</title>
    <jsp:include page="../alluse/importCss.jsp"></jsp:include>
    <link href="/koala-platform/static/css/account.css" rel="stylesheet">
</head>
<style>

</style>
<body>
<div id="main-content">
    <div id="input-area">
        <form role="form" class="form-inline" id="form">
            <table class="key-value-table">
                <thead></thead>
                <tbody>
                <tr class="tr-field">
                    <td class="td-field">入账编号</td>
                    <td class="td-value">
                        <input id="in-bh" type="text" name="inBh">
                    </td>
                    <td class="td-field">账单名</td>
                    <td class="td-value">
                        <input type="text" name="inName">
                    </td>
                    <td class="td-field">类别</td>
                    <td class="td-value">
                        <select name="goodsBigType" id="goods-big-type" class="half-width"
                                onchange="getGoodsSmallType()">
                        </select>
                        <select name="goodsType" id="goods-type" class="half-width"></select>

                    </td>
                    <td class="td-field">总额</td>
                    <td class="td-value">
                        <input type="text" name="sumMoney">
                    </td>
                </tr>
                <tr>
                    <td class="td-field">供货商</td>
                    <td class="td-value">
                        <input type="text" name="supplier">
                    </td>
                    <td class="td-field">联系人</td>
                    <td class="td-value">
                        <input type="text" name="contactPerson">
                    </td>
                    <td class="td-field">电话</td>
                    <td class="td-value">
                        <input type="text" name="supplierPhone">
                    </td>
                    <td class="td-field">地址</td>
                    <td class="td-value">
                        <input type="text" name="supplierAddress">
                    </td>
                </tr>
                <tr>
                    <td class="td-field">备注</td>
                    <td class="td-value" colspan="7">
                        <textarea type="text" name="otherComment"
                                  overflow="auto"></textarea>
                    </td>
                </tr>
                </tbody>

            </table>
        </form>
    </div>
    <div id="operate-area">
        <input type="button" value="保存" class="btn-default-dark" onclick="saveGoods()"/>
        <input type="button" value="查看清单" class="btn-default-dark" onclick="toGoodsList()"/>
    </div>

    <div id="account-details">
        <div class="item-header">近期入账单 <input type="button" class="btn-default-dark right" onclick="initTableList(1)"
                                              value="增加行"></div>

        <table id="recent-account-in" class="list-table">
            <thead class="list-header">
            <th class="col-header hidden"></th>
            <th class="col-header">商品名</th>
            <th class="col-header">类型</th>
            <th class="col-header">单位</th>
            <th class="col-header">规格</th>
            <th class="col-header">品牌</th>
            <th class="col-header">进价</th>
            <th class="col-header">数量</th>
            <th class="col-header">总价</th>
            </thead>
            <tbody class="list-body"></tbody>
        </table>
        <br>
    </div>

    <table class="hidden">
        <tbody class="list-model" class="hidden" hidden="hidden">
        <tr class="list-item">
            <td class="list-value hidden">
                <input name="tradeId">
            </td>
            <td class="list-value">
                <input name="goodsName">
            </td>
            <td class="list-value">
                <input name="goodsType">
            </td>
            <td class="list-value" style="width: 50px">
                <input name="goodsUnit">
            </td>
            <td class="list-value" style="width: 100px">
                <input name="goodsSize">
            </td>
            <td class="list-value">
                <input name="goodsBrand">
            </td>
            <td class="list-value" style="width: 100px">
                <input name="tradePrice">
            </td>
            <td class="list-value" style="width: 80px">
                <input name="tradeNumber">
            </td>
            <td class="list-value">
                <input name="sumPrice">
            </td>
        </tr>
        </tbody>
    </table>


</div>
<jsp:include page="../alluse/footer.jsp"></jsp:include>
<jsp:include page="../alluse/importJs.jsp"></jsp:include>
<script>
    $(function () {
        $("#in-bh").val(getBhFromTime());
        $(".td-value input, select, option,textarea").mouseover(function () {
            $(this).css("box-shadow", "0 0 2px 0.5px red inset");
        });
        $(".td-value input, select, option,textarea").mouseout(function () {
            $(this).css("box-shadow", "none");
        });

        var initType = initGoodsType();
        initType = getGoodsSmallType();
        initTableList(11);
    });
    function saveGoods() {
        var data = $("#form").serialize();
        var url = "/koala-platform/goods/saveGoods";
        $.ajax({
            url: url,
            type: "post",
            data: data,
            success: function (data) {
                if (data == "success") {
                    makeBlockTime("保存成功！");
                    refreshWindow();
                }
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
    function initTableList(n, modelId, tableId) {
        /*获取行模板*/
        var model;
        if (!isNullOrNot(modelId)) {
            model = $("#" + modelId);
        } else {
            model = $(".list-model");
        }

        if (isNullOrNot(model) || model.length > 1) {
            return false;
        }

        var inner = model.children();
        /*获取table对象*/
        var table;
        if (!isNullOrNot(tableId)) {
            table = $("#" + tableId);
        } else {
            table = $(".list-body");
        }
        if (isNullOrNot(table) || table.length > 1) {
            return false;
        }
        /*插入行*/
        for (var i = 1; i <= n; i++) {
            inner.clone().appendTo(table);
        }
    }

</script>
</body>
</html>
