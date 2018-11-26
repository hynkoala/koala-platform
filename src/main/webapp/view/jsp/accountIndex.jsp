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
    <jsp:include page="alluse/autoImport.jsp"></jsp:include>
</head>
<style>
    #header {
        background-image: url("/koala-platform/static/img/header-bg-account.png");
    }

    .account-tools {
        position: relative;
        display: block;
        float: left;
        background-color: #00B83F;
        width: 200px;
        height: 150px;
        margin-right: 50px;
        margin-top: 30px;
    }
</style>
<script>
    $(function () {
        $(".account-tools").mouseover(function () {
            $(this).css("background-color", "rgb(220,220,220)");
        });
        $(".account-tools").mouseout(function () {
            $(this).css("background-color", "#00B83F");
        });
    });

</script>
<body>
<jsp:include page="alluse/header.jsp"></jsp:include>
<div id="main-content">
    <div id="account-in" class="account-tools">
        入账单
    </div>
    <div id="account-out" class="account-tools">
        出账单
    </div>
    <div id="goods-list" class="account-tools">
        货物清单
    </div>
    <div id="query-system" class="account-tools">
        查询系统
    </div>
</div>
<jsp:include page="alluse/footer.jsp"></jsp:include>

</body>
</html>
