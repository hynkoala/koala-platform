<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>注册</title>
    <jsp:include page="alluse/importCss.jsp"/>
    <link rel="stylesheet" type="text/css" href="/koala-platform/static/css/register.css"/>

</head>
<body>
<div class="out-box">
    <form role="form" class="form-inline" method="post">
        <div class="form-group">
            <input class="form-control" type="text" name="userName" id="register-userName" placeholder="用户名"/>
        </div>
        <div class="form-group">
            <input class="form-control" type="password" name="userPassword" id="password" placeholder="密码"/>
        </div>
        <div class="form-group">
            <input class="form-control" type="email" name="userEmail" id="email" placeholder="邮箱"/>
        </div>
        <div class="form-group">
            <input class="form-control" type="text" name="passwordHint" id="password-hint" placeholder="密码提示"/>
        </div>
        <div class="btn-group">
            <button class="btn-default btn-default-dark" onclick="checkInputData();return false">确定</button>
            <button class="btn-default btn-default-dark" type="reset" id="reset">重置</button>
            <a class="btn-default btn-default-dark" href="/koala-platform/view/jsp/login.jsp">返回登陆</a>
        </div>
    </form>
</div>
<jsp:include page="alluse/importJs.jsp"></jsp:include>
<script>
    function checkInputData() {
        var userName = $("#register-userName").val();
        var password = $("#password").val();
        var email = $("#email").val();
        var passwordHint = $("#password-hint").val();
        $.ajax({
            type: "post",
            url: "/koala-platform/user/register",
            data: {userName: userName, userPassword: password, userEmail: email, passwordHint: passwordHint},
            success: function (data) {
                if (data == "验证通过！") {
                    window.location.href = "/koala-platform/user/toHome?userName=" + userName;
                    makeBlockTime("欢迎来到koala之家", 400);
                } else {
                    makeBlockTime(data, 400);
                }

            },
            error: function () {
                makeBlockTime("发生未知错误！", 400);
            }
        })
    }
</script>
</body>
</html>