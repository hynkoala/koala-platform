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
</head>
<style>
    body {
        font-size: 30px;
        min-width: 1506px;
    }

    div#main-content {
        width: 85%;
        max-height: 1000px;
        background-color: whitesmoke;
    }

    #operate-area {
        margin-top: 20px;
    }

    #input-area {
        width: 1280px;
        margin: 0 auto;
        top: 20px;
        padding: 20px 20px;
        position: relative;
        height: 200px;
        margin-bottom: 40px;
        border: 5px white solid;
    }

    .key-value-table tr td {
        font-size: 18px;
        height: 30px;
    }

    .td-field {
        background-color: #fdfffd;
        text-align: right;
        width: 100px;
        border-top: 1px solid whitesmoke;
        border-bottom: 1px solid whitesmoke;
        padding-right: 8px;

    }

    .td-value {
        text-align: left;
        background-color: whitesmoke;
        width: 200px;
    }

    .key-value-table select, input {
        width: inherit;
        height: inherit;
        border: 0.1px solid #cec1ce;
        padding-left: 5px;
    }

    .tr-hide {
        display: none
    }

</style>
<body>
<div id="main-content">
    <div id="input-area">
        <form role="form" class="form-inline" id="form">
            <table class="key-value-table">
                <thead></thead>
                <tbody>
                <tr class="tr-hide">
                    <td>
                        <input name="goodsId" value="${goodsId}">
                    </td>
                </tr>
                <tr class="tr-field">
                    <td class="td-field">入账编号</td>
                    <td class="td-value">
                        <input id="in-bh" type="text" name="inBh">
                    </td>
                    <td class="td-field">账单名</td>
                    <td class="td-value">
                        <input type="text" name="accountName">
                    </td>
                </tr>
                <tr>
                    <td class="td-field">备注</td>
                    <td class="td-value">
                        <input type="text" name="accountName">
                    </td>
                </tr>

                </tbody>
            </table>

            <div id="operate-area">
                <input type="button" value="保存" class="btn-default-dark" onclick="saveGoods()"/>
                <input type="button" value="查看清单" class="btn-default-dark" onclick="toGoodsList()"/>
            </div>
        </form>

    </div>


    <table class="layui-hide" id="goods-list"></table>


</div>
<jsp:include page="../alluse/footer.jsp"></jsp:include>
<jsp:include page="../alluse/importJs.jsp"></jsp:include>
<script>
    $(function () {
        $("#in-bh").val(getBhFromTime());
        var table = layui.table;
        var laypage = layui.laypage;

        // 定义添加页面需要显示的条数
        var limit = 12;
        table.render({
            id: "goodsId",
            elem: "#goods-list",
            url: goodsUrl + "/getGoodsList?limit=" + limit,
            method: "post",
            height: 600,
            cols: [[ //表头
                {
                    field: '', title: '序号', width: 60, templet: function (d) {
                    return d.LAY_INDEX;
                }
                }
                /*{type: 'checkbox', fixed: 'left'}*/
                , {field: 'goodsId', title: 'ID', width: 0, hide: true}
                , {field: 'goodsName', title: '货物名', width: 200}
                , {field: 'goodsUnit', title: '单位', width: 60}
                , {field: 'goodsType', title: '类别', width: 100, sort: true}
                , {field: 'goodsBrand', title: '品牌', width: 80, sort: true}
                , {field: 'goodsInPrice', title: '进价', width: 80, sort: true}
                , {field: 'doHave', title: '存量', width: 80, sort: true}
                , {
                    field: 'createTime', title: '录入时间', width: 200, sort: true, templet: function (d) {
                        return timeFomatter(d.createTime, 1);
                    }
                }
                , {
                    field: 'updateTime', title: '更新时间', width: 150, sort: true, templet: function (d) {
                        return timeFomatter(d.createTime, 2);
                    }
                }
                , {fixed: 'right', align: 'center', toolbar: 'default'}
            ]],
            title: "货物清单"
        });

        $(".td-value input, select, option").mouseover(function () {
            $(this).css("box-shadow", "0 0 2px 0.5px red inset");
        });
        $(".td-value input, select, option").mouseout(function () {
            $(this).css("box-shadow", "none");
        });

        var initType = initGoodsType();
        initType = getGoodsSmallType();
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

</script>
</body>
</html>
