<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <jsp:include page="alluse/importCss.jsp"/>

    <style>
        #out-box {

            width: 1024px;
            height: 768px;
            position: relative;
            margin-top: 8px;
            margin: 0 auto;
            border: 1px solid rgb(36, 66, 92);

        }

        #personal-infomation {
            width: 500px;
            margin: 0 auto;
            margin-top: 20px;
        }

        label {
            float: left;
            display: block;
            position: relative;
            display: table-cell;
            vertical-align: middle;
        }
    </style>
</head>
<body>
<div id="out-box">
    <jsp:include page="alluse/header.jsp"/>
    <div id="personal-infomation">
        <form role="form">
            <div class="form-group">
                <label for="user-name-2">名称</label>
                <input type="text" class="form-control" readonly="true" id="user-name-2" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <label for="user-true-name">真实姓名</label>
                <input type="text" class="form-control" id="user-true-name" placeholder="请输入真实姓名">
            </div>
            <div class="form-group">
                <label for="email">邮箱</label>
                <input type="text" class="form-control" id="email" placeholder="请输入邮箱">
            </div>
            <div class="form-group">
                <label for="phone">电话</label>
                <input type="text" class="form-control" id="phone" placeholder="请输入电话号码">
            </div>
            <div class="form-group">
                <label for="sex">性别</label>
                <select class="form-control" id="sex">
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </div>
            <div class="form-group">
                <label for="age">年龄</label>
                <input type="text" class="form-control" id="age" placeholder="请输入年龄">
            </div>
        </form>
        <button class="btn btn-default" onclick="alterUserInfo()">更新信息</button>
        <button class="btn btn-default" onclick="alterPassword()">修改密码</button>
    </div>
</div>
<jsp:include page="alluse/importJs.jsp"></jsp:include>
<script>
    var user;
    var userName = getUserNameByUrl();
    $(function () {
        var url = '/koala-platform/user/getUserInfo?userName=' + userName;
        var xmlhttp = new XMLHttpRequest();
        if (xmlhttp != null) {
            xmlhttp.onreadystatechange = state_Change;
            xmlhttp.open("GET", url, true);
            xmlhttp.send(null);
        }
        function state_Change() {
            if (xmlhttp.readyState == 4) {// 4 = "loaded"
                if (xmlhttp.status == 200) {// 200 = "OK"
                    var str = xmlhttp.responseText;
                    //var user = str.parseJSON();
                    user = eval('(' + str + ')')[0];
                    putdata(user);
                }
                else {
                    makeBlockTime("Problem retrieving XML data:" + xmlhttp.statusText);
                }
            }
        }
    });
    function putdata(user) {
        document.getElementById("user-name").innerHTML = user.userName;
        document.getElementById("user-name-2").value = user.userName;
        document.getElementById("user-true-name").value = user.userTrueName;
        document.getElementById("email").value = user.userEmail;
        document.getElementById("phone").value = user.userPhone;
        document.getElementById("sex").value = user.userSex;
        document.getElementById("age").value = user.userAge;
        document.getElementById("user-name").innerHTML = user.userName;
        document.getElementById("to-myspace").href = "/koala-platform/user/toMyspace?userName=" + user.userName;
        document.getElementById("to-home").href = "/koala-platform/user/toHome?userName=" + user.userName;
    }
    function alterUserInfo() {
        var userName = $("#user-name-2").val();
        var userTrueName = $("#user-true-name").val();
        var userSex = $("#sex").val();
        var userAge = $("#age").val();
        var userEmail = $("#email").val();
        var userPhone = $("#phone").val();
        $.ajax({
            type: "post",
            url: "/koala-platform/user/alterUserInfo",
            data: {
                userName: userName,
                userTrueName: userTrueName,
                userSex: userSex,
                userAge: userAge,
                userEmail: userEmail,
                userPhone: userPhone
            },
            success: function () {
                makeBlockTime("更新成功！");
                window.location.reload();
            },
            error: function () {
                makeBlockTime("发生未知错误！");
            }
        })
    }
    function alterPassword() {
        var url = "alterPassword.jsp?userName=" + userName;
        var title = "修改密码";
        window.open(url, title, "width=500px,height=400px,toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no");
    }
</script>
</body>
</html>
