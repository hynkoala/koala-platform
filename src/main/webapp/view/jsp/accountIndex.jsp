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
</head>
<style>
    #header {
        background-image: url("/koala-platform/static/img/header-bg-account.png");
    }

    #main-content {
        width: 90%;
        padding-top: 60px;
        height: 400px;
    }
    .account-tools {
        position: relative;
        display: block;
        background-color: whitesmoke;
        width: 200px;
        height: 50px;
        margin-top: 30px;
        padding-top: 10px;

    }

    #operater-menu {
        position: absolute;
        right: 5%;
    }

    .left-item {
        width: 600px;
        float: left;
        margin-right: 40px;
        height: 500px;
        top: 0;
        bottom: 0;
        background-color: whitesmoke;

    }

    .menu-bar {
        color: #d65f71;
    }

    .left-item-header {
        height: 50px;
        width: 100%;
        background-color: #d8eee8;
        font-size: 24px;
        font-style: italic;
        padding-top: 6px;
    }
</style>

<body>
<jsp:include page="alluse/header.jsp"></jsp:include>
<div id="main-content">
    <div id="left-show">
        <div id="accountInInfo" class="left-item">
            <div class="left-item-header">近期入账单</div>
            <table id="recent-account-in"></table>
        </div>
        <div id="accountOutInfo" class="left-item">
            <div class="left-item-header">近期出账单</div>
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
        $(".account-tools").mouseover(function () {
            $(this).css("background-color", "wheat");
        });
        $(".account-tools").mouseout(function () {
            $(this).css("background-color", "whiteSmoke");
        });
    });
    function addGoods() {
        var baseUrl = "/koala-platform/view/toTargetUrl?target=";
        /*var urlComponent = encodeURIComponent("target="+"goods/addGoods");*/
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

</script>
