<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 11/28 0028
  Time: 0:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>货物清单</title>
    <jsp:include page="../alluse/importCss.jsp"></jsp:include>
    <style>

    </style>

</head>
<body>
<div id="main-content">
    <div class="bg-white">
        <table class="layui-hide" id="goods-list"></table>
    </div>
</div>
<jsp:include page="../alluse/importJs.jsp"></jsp:include>
<script>
    $(function () {
        var table = layui.table;
        var laypage = layui.laypage;
        table.render({
            id: "goodsId",
            elem: "#goods-list",
            url: goodsUrl + "/getGoodsList",
            method: "post",
            toolbar: 'default',
            height: 600,
            cols: [[ //表头
                {field: '', type: 'checkbox', fixed: 'left'},
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
                /*,{field: 'goodsBrand', title: '品牌', width: 80, sort: true}*/
                , {field: 'goodsInPrice', title: '进价', width: 80, sort: true}
                , {field: 'doHave', title: '存量', width: 80, sort: true}
                , {
                    field: 'createTime', title: '录入时间', width: 120, sort: true, templet: function (d) {
                        return timeFomatter(d.createTime, "yyMMdd")
                    }
                }
                , {
                    field: 'updateTime', title: '更新时间', width: 200, sort: true, templet: function (d) {
                        return timeFomatter(d.createTime, "yyMMddhhmm")
                    }
                }
                , {fixed: 'right', title: "待定", align: 'center', toolbar: 'default'}
            ]],

            page: true,
            limit: 10,
            limits: [10, 30, 50],
            title: "货物清单"
        })
    })

</script>
</body>
</html>

