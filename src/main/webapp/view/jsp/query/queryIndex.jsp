<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 12/22 0022
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询系统</title>
    <jsp:include page="../alluse/importCss.jsp"></jsp:include>
    <style>

        .query-item {
            background-color: whitesmoke;
            min-height: 650px;
        }

        #query-content {
            margin-left: 250px;
        }

        #account-in {
            background-color: whitesmoke;
        }

        #main-content {
            margin: 0px;
            padding: 0px;
            padding-right: 50px;

        }

        #query-header {
            border: 1px solid silver;
            width: 100%;
            height: 100px;
            margin-top: 20px;
        }

        .layui-nav-side {
            /*background-color: #3e3c3f;*/
            position: absolute;
            height: 100%;
        }

        .layui-nav-item {
            /* border-bottom: 1px solid grey;*/
        }
    </style>
</head>
<body>

<div id="main-content">
    <div class="left-menu">
        <ul class="layui-nav layui-nav-tree layui-nav-side">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">账单查询</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:toQueryItem('account-in');">入帐单</a></dd>
                    <dd><a href="javascript:toQueryItem('account-out');">出账单</a></dd>
                    <dd><a href="javascript:toQueryItem('account-flow');">流水账</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">货物信息</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:toQueryItem('goods-list');">货物明细</a></dd>
                    <dd><a href="javascript:toQueryItem('goods-list');">存量查询</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">销售情况</a>
                <dl class="layui-nav-child">
                    <dd><a href="">周销售</a></dd>
                    <dd><a href="">月销售</a></dd>
                    <dd><a href="">季销售</a></dd>
                    <dd><a href="">年销售</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <div id="query-content">
        <div id="query-header">
            <input id="vague-query-input" type="text" class="query-input" placeholder="请输入查询条件：">
            <input style="display: block" type="button" class="btn-default btn-save" value="搜索"/>
        </div>
        <div id="account-in" class="query-item" hidden="hidden">
            <table id="account-in-table" class="layui-table"></table>
        </div>
        <div id="account-out" class="query-item" hidden="hidden">
            <table id="account-out-table" class="layui-table"></table>
        </div>
        <div id="account-flow" class="query-item" hidden="hidden">
            <table id="account-flow-table" class="layui-table"></table>
        </div>
        <div id="goods-list" class="query-item" hidden="hidden">
            <table id="goods-list-table" class="layui-table"></table>
        </div>
        <%--<div id="goods-list" class="query-item" hidden="hidden">
            <table id="goods-list-table" class="layui-table"></table>
        </div>--%>
    </div>

</div>

<jsp:include page="../alluse/footer.jsp"></jsp:include>
<jsp:include page="../alluse/importJs.jsp"></jsp:include>


<script>
    function changeQueryInfo(itemId) {

        if (itemId == "account-in") {
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入账单编号/账单名/供货方")
            funQueryAccountIn()
        }
        else if (itemId == 'goods-list') {
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入货物名")
            funQueryGoodsList()
        }
        else if (itemId == 'account-out') {
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入货物名")
            funQueryAccountOut();
        }
        else if (itemId == 'account-flow') {
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入货物名")
            funQueryAccountFlow();
        }
        else {
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入")
        }
    }
    var funQueryAccountIn = function () {
        var tableIn = layui.table;
        tableIn.render({
            id: 'accountId',
            elem: "#account-in-table",
            method: "post",
            url: "/koala-platform/account/getAccount?accountType=1",
            height: 666,
            toolbar: 'default',
            cols: [[
                {field: '', type: 'checkbox', fixed: 'left'}
                , {
                    field: '', title: '序号', width: 60, templet: function (d) {
                        return d.LAY_INDEX;
                    }
                }
                , {field: "accountId", hide: true}
                , {field: 'accountBh', title: "账单编号", width: 150}
                , {field: 'accountName', title: "账单名", width: 150}
                , {field: 'tradeTarget', title: "供货方", width: 200}
                , {field: 'contactPerson', title: "联系人", width: 100}
                , {field: 'contactPhone', title: "联系电话", width: 120}
                , {
                    field: 'createTime', title: "入账时间", width: 150, templet: function (d) {
                        return timeFomatter(d.createTime, "yyMMddhhmmss");
                    }
                }
                , {field: "sumPrice", title: "总额", width: 80}
                , {field: "otherComment", title: "备注", width: 280}
                , {
                    field: '', title: "操作", templet: function (d) {
                        return "<input type='button' class='btn-default btn-default-light' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='明细'>"
                            + "<input type='button' class='btn-default btn-default-light' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='修改'>"
                            + "<input type='button' class='btn-default btn-default-delete' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='删除'>";
                    }
                }
            ]],
            page: true,
            limit: 12,
            limits: [10, 30, 50],
            title: "货物清单"

        });
    };
    var funQueryAccountOut = function () {
        var tableIn = layui.table;
        tableIn.render({
            id: 'accountId',
            elem: "#account-out-table",
            method: "post",
            url: "/koala-platform/account/getAccount?accountType=2",
            height: 666,
            toolbar: 'default',
            cols: [[
                {field: '', type: 'checkbox', fixed: 'left'}
                , {
                    field: '', title: '序号', width: 60, templet: function (d) {
                        return d.LAY_INDEX;
                    }
                }
                , {field: "accountId", hide: true}
                , {field: 'accountBh', title: "账单编号", width: 150}
                , {field: 'accountName', title: "账单名", width: 150}
                , {field: 'tradeTarget', title: "供货方", width: 200}
                , {field: 'contactPerson', title: "联系人", width: 100}
                , {field: 'contactPhone', title: "联系电话", width: 120}
                , {
                    field: 'createTime', title: "入账时间", width: 150, templet: function (d) {
                        return timeFomatter(d.createTime, "yyMMddhhmmss");
                    }
                }
                , {field: "sumPrice", title: "总额", width: 80}
                , {field: "otherComment", title: "备注", width: 280}
                , {
                    field: '', title: "操作", templet: function (d) {
                        return "<input type='button' class='btn-default btn-default-light' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='明细'>"
                            + "<input type='button' class='btn-default btn-default-light' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='修改'>"
                            + "<input type='button' class='btn-default btn-default-delete' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='删除'>";
                    }
                }
            ]],
            page: true,
            limit: 15,
            limits: [10, 30, 50],
            title: "货物清单"

        });
    }
    var funQueryGoodsList = function () {
        /*货物清单*/
        var table = layui.table;
        var laypage = layui.laypage;
        table.render({
            id: "goodsId",
            elem: "#goods-list-table",
            url: goodsUrl + "/getGoodsList",
            method: "post",
            toolbar: 'default',
            height: 666,
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
                , {
                    field: '', title: "操作", templet: function (d) {
                        return "<input type='button' class='btn-default btn-default-light' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='明细'>"
                            + "<input type='button' class='btn-default btn-default-light' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='修改'>"
                            + "<input type='button' class='btn-default btn-default-delete' onclick=seeDetails('" + d.accountId + "','" + d.accountType + "') value='删除'>";
                    }
                }
            ]],

            page: true,
            limit: 15,
            limits: [10, 30, 50],
            title: "货物清单"
        });
        /*table.on({

         })*/
    }
    var funQueryAccountFlow = function () {
        /*货物清单*/
        var table = layui.table;
        var laypage = layui.laypage;
        table.render({
            id: "tradeId",
            elem: "#account-flow-table",
            url: accountUrl + "/queryAccountFlow",
            method: "post",
            toolbar: 'default',
            height: 666,
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
            limit: 15,
            limits: [10, 30, 50],
            title: "货物清单"
        })
    }

</script>

<script>
    $(function () {
        funQueryAccountIn();
        toQueryItem("account-in")
    })
    function toQueryItem(itemID) {
        /*$(".query-item").addClass("hidden");
         $("#"+itemID).removeClass("hidden");*/
        $(".query-item").hide();
        $("#" + itemID).show();
        changeQueryInfo(itemID);
    }
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    /*layui.use('element', function(e){
     var element = layui.element;
     makeBlockTime();

     //…
     });*/
</script>
</body>
</html>
