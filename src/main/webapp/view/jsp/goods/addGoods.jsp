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
        padding: 0 12%;
    }

    #operate-area {
        margin-top: 20px;
    }

    #input-area {
        width: 1315px;
        margin: 0 auto;
        top: 20px;
        padding: 20px 20px;
        position: relative;
        height: 200px;
        margin-bottom: 40px;
        border: 5px white solid;
        background-color: whitesmoke;
    }

</style>
<body>
<div id="main-content">
    <div id="input-area">
        <form role="form" class="form-inline" id="form">
            <table class="key-value-table">
                <thead></thead>
                <tbody>
                <tr class="tr-hide hidden">
                    <td>
                        <input name="goodsId" value="${goodsId}">
                    </td>
                </tr>
                <tr class="tr-field">
                    <td class="td-field">货物名</td>
                    <td class="td-value">
                        <input type="text" name="goodsName">
                    </td>
                    <td class="td-field">单位</td>
                    <td class="td-value">
                        <input type="text" name="goodsUnit" class="dropdown-input" onclick="goodsUnitDropdown()">
                        <%--<select type="text" name="goodsUnit" id="goods-unit" class="editable-select" value=""
                                hidden="hidden">
                            <option value="个">个</option>
                            <option value="盒">盒</option>
                            <option value="箱">箱</option>
                            <option value="把">把</option>
                            <option value="件">件</option>
                            <option value="支">支</option>
                            <option value="张">张</option>
                            <option value="本">本</option>
                            <option value="块">块</option>
                            <option value="条">条</option>
                            <option value="袋">袋</option>
                            <option value="根">根</option>
                            <option value="片">片</option>
                        </select>--%>
                    </td>
                    <td class="td-field">类别</td>
                    <td class="td-value">
                        <select name="goodsBigType" id="goods-big-type" class="half-width"
                                onchange="getGoodsSmallType()">
                        </select>
                        <select name="goodsType" id="goods-type" class="half-width"></select>

                    </td>
                    <td class="td-field">品牌</td>
                    <td class="td-value">
                        <input type="text" name="goodsBrand">
                    </td>
                </tr>
                <tr>
                    <td class="td-field">型号</td>
                    <td class="td-value">
                        <input type="text" name="goodsModel" id="goods-model">
                    </td>
                    <td class="td-field">进价</td>
                    <td class="td-value">
                        <input type="text" name="goodsInPrice" id="goods-in-price">
                    </td>
                    <td class="td-field">售价</td>
                    <td class="td-value">
                        <input type="text" name="goodsOutPrice" id="goods-out-price">
                    </td>
                    <td class="td-field">用途</td>
                    <td class="td-value">
                        <input type="text" name="goodsUsage" id="goods-usage">
                    </td>
                </tr>
                <tr>
                    <%--<td class="td-field">厂商</td>
                    <td class="td-value">
                        <input type="text" name="goodsUsage" id="goods-usage">
                    </td>--%>
                </tr>
                </tbody>
            </table>

            <div id="operate-area">
                <input type="button" value="保存" class="btn-default btn-default-dark" onclick="saveGoods()"/>
                <input type="button" value="查看清单" class="btn-default btn-default-dark" onclick="toGoodsList()"/>
            </div>
        </form>

    </div>

    <div class="bg-white">
        <table class="layui-hide" id="goods-list"></table>
    </div>


</div>
<jsp:include page="../alluse/footer.jsp"></jsp:include>
<jsp:include page="../alluse/importJs.jsp"></jsp:include>
<script>
    $(function () {
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
                    window.location.reload();
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
