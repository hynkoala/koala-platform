<%@ page language="java" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <jsp:include page="alluse/importCss.jsp"/>
    <link rel="stylesheet" type="text/css" href="/koala-platform/static/css/login.css"/>

</head>
<body>
<div class="out-box">
    <form role="form" class="form-inline" method="post">
        <div class="form-group">
            <input class="form-control" type="text" id="user-name" placeholder="用户名"/>
        </div>
        <div class="form-group">
            <input class="form-control" type="password" id="password" placeholder="密码"/>
        </div>
        <div class="btn-group">
            <button id="submit-login" onclick="checkUser();return false" class="btn-default-dark">登陆</button>
            <button id="to-register" onclick="toRegister();return false" class="btn-default-dark">注册</button>
        </div>
    </form>
</div>
<jsp:include page="alluse/importJs.jsp"></jsp:include>
<script>
    function checkUser() {
        var userName = $("#user-name").val();
        var password = $("#password").val();
        $.ajax({
            type: "post",
            url: "/koala-platform/user/login",
            data: {userName: userName, userPassword: password},
            success: function (data) {
                if (data == "验证通过！") {
                    makeBlockTime("欢迎来到koala之家", 400);
                    window.location.href = "/koala-platform/user/toHome?userName=" + userName;
                } else {
                    makeBlockTime(data, 400);
                }

            },
            error: function () {
                makeBlockTime("发生未知错误！", 1000);
            }
        })
    }
</script>
</body>
</html>