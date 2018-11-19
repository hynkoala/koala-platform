<%@ page language="java" pageEncoding="utf-8" %>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <link rel="stylesheet" type="text/css" href="/koala-platform/static/css/login.css"/>
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
</head>
<body>
<div class="out-box">
    <form role="form" class="form-inline" method="post">
        <div class="form-group">
            <label class="label" for="user-name">用户名：</label>
            <input class="form-control" type="text" id="user-name"/>
        </div>
        <div class="form-group">
            <label class="label" for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
            <input class="form-control" type="password" id="password"/>
        </div>
        <div class="btn-group">
            <button id="submit-login" onclick="checkUser();return false" class="btn btn-info">登陆</button>
            <button id="to-register" onclick="toRegister();return false" class="btn btn-default">注册</button>
        </div>
    </form>
</div>
</body>
</html>