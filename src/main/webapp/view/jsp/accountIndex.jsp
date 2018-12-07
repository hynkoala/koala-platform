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
    <title>记账系统</title>
    <jsp:include page="alluse/importCss.jsp"></jsp:include>
    <link href="/koala-platform/static/css/account.css" rel="stylesheet">

</head>
<style>
    #header {
        background-image: url("/koala-platform/static/img/header-bg-account.png");
    }

    div#main-content {
        background-color: #646464;
        padding: 0 5%;
        padding-top: 50px;
        min-width: 1750px !important;
    }

    .account-tools {
        position: relative;
        display: inline-block;
        background-color: whitesmoke;
        width: 200px;
        height: 50px;
        margin-top: 30px;
        padding-top: 10px;
    }

    #operater-menu {
        width: 200px;
        position: relative;
        margin-left: 60px;
        float: left;
        margin-top: 50px;
    }

    #left-show {
        float: left;
    }

    .left-item {
        width: 600px;
        float: left;
        margin-right: 40px;
        height: 490px;
        top: 0;
        bottom: 0;
        background-color: whitesmoke;

    }

    .layui-table-view {
        margin: 0 auto;
    }

    .menu-bar {
        color: #d65f71;
    }

    .btn-table {
        width: 100%;
    }
</style>

<body>
<jsp:include page="alluse/header.jsp"></jsp:include>
<div id="main-content">
    <div id="left-show">
        <div id="accountInInfo" class="left-item">
            <div class="item-header">近期入账单</div>
            <table id="recent-account-in"></table>
        </div>
        <div id="accountOutInfo" class="left-item">
            <div class="item-header">近期出账单</div>
            <table id="recent-account-out"></table>
        </div>
    </div>
    <div id="operater-menu">
        <div id="account-in" class="account-tools">
            <label class="menu-bar">入帐单</label>
        </div>
        <div id="account-out" class="account-tools">
            <label class="menu-bar">出账单</label>
        </div>
        <div id="add-goods" class="account-tools" onclick="addGoods()">
            <label class="menu-bar">加入新货</label>
        </div>
        <div id="goods-list" class="account-tools" onclick="goodsList()">
            <label class="menu-bar">货物清单</label>
        </div>
        <div id="query-system" class="account-tools">
            <label class="menu-bar">查询系统</label>
        </div>
    </div>

</div>
<jsp:include page="alluse/footer.jsp"></jsp:include>
<jsp:include page="alluse/importJs.jsp"></jsp:include>
</body>
</html>

<script>
    $(function () {
        var tableIn = layui.table;
        var tableOut = layui.table;
        tableIn.render({
            id: 'accountId',
            elem: "#recent-account-in",
            method: "post",
            url: "/koala-platform/account/getAccount?accountType=1",
            height: 430,
            cols: [[
                {
                    field: '', title: '序号', width: 60, fixed: 'left', templet: function (d) {
                    return d.LAY_INDEX;
                }
                }
                , {field: "accountId", hide: true}
                , {field: 'accountName', title: "账单", width: 150}
                , {field: 'tradeTarget', title: "交易对象", width: 200}
                , {
                    field: 'createTime', title: "入账时间", width: 100, templet: function (d) {
                        return timeFomatter(d.createTime, "yyMMdd");
                    }
                }
                , {
                    field: '', title: "操作", templet: function (d) {
                        return '<input type="button" class="btn-table" onclick="seeDetails(' + '"' + d.accountId + '"' + ')" value="明细">'
                    }
                }
            ]]

        });

        tableOut.render({
            id: 'accountId',
            elem: "#recent-account-out",
            method: "post",
            url: "/koala-platform/account/getAccount?accountType=1",
            height: 430,
            cols: [[
                {
                    field: '', title: '序号', width: 60, fixed: 'left', templet: function (d) {
                    return d.LAY_INDEX;
                }
                }
                , {field: "accountId", hide: true}
                , {field: 'accountName', title: "账单", width: 150}
                , {field: 'tradeTarget', title: "交易对象", width: 200}
                , {
                    field: 'createTime', title: "入账时间", width: 100, templet: function (d) {
                        return timeFomatter(d.createTime, "yyMMdd");
                    }
                }
                , {
                    field: '', title: "操作", templet: function (d) {
                        return "<input type='button' class='btn-table' onclick='seeDetails(" + d.accountId + ")' value='明细'>"
                    }
                }
            ]]

        });
    });
    $(function () {
        $(".account-tools").mouseover(function () {
            $(this).css("background-color", "wheat");
        });
        $(".account-tools").mouseout(function () {
            $(this).css("background-color", "whiteSmoke");
        });
    });
    function addGoods() {
        var baseUrl = "/koala-platform/view/toTargetUrl?target=";
        var target = "goods/addGoods";
        window.open(baseUrl + target);
    }
    function goodsList() {
        var url = "/koala-platform/view/toTargetUrl?target=" + "goods/goodsList";
        window.open(url);
    }
    $("#account-in").click(function () {
        var url = "/koala-platform/view/toTargetUrl?target=" + "account/accountIn";
        window.open(url);
    })
    $("#account-out").click(function () {
        var url = "/koala-platform/view/toTargetUrl?target=" + "account/accountOut";
        window.open(url);
    })

    function seeDetails(id) {
        var url = "/koala-platform/account/accountDetails?accountType=1&accountId=" + id;
        window.open(url);

        /*var data = {accountId:id,accountType:"1"};
         $.ajax({
         url:url,
         data:data,
         type:'post',
         success:function(){
         window.open()
         }
         })*/
    }

</script>
