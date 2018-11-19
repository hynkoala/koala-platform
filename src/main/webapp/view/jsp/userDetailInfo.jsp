<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <jsp:include page="alluse/autoImport.jsp"></jsp:include>



    <style>
        #out-box {

            width: 320px;
            height: 400px;
            position: relative;
            margin-top: 8px;
            margin: 0 auto;
            border: 1px solid rgb(36, 66, 92);
            margin-top: 20px;

        }

        label {
            width: 120px;
            float: left;
        }

        .form-control {
            width: 180px;
        }

        #isAdmin {
            width: 20px;
            height: 20px;
            left: 50px;
            display: inline-block;
            margin-left: -100px;
            margin-top: -0.5px;
        }

        .form-group {
            display: table;
            margin-top: 12px;
            margin-left: 12px;
            width: 320px;
        }
    </style>

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
            document.getElementById("user-name-2").value = user.userName;
            document.getElementById("user-true-name").value = user.userTrueName;
            document.getElementById("email").value = user.userEmail;
            document.getElementById("phone").value = user.userPhone;
            document.getElementById("sex").value = user.userSex;
            document.getElementById("age").value = user.userAge;
            if (user.adminType != 0) {
                document.getElementById("isAdmin").checked = true;
            }
        }
        function alterUserInfo() {
            var isSuperAdmin = user.adminType;
            if (user.adminType == '2') {
                makeBlockTime('超级管理员信息不可被修改！');
                window.close();
                return;
            }
            var userName = $("#user-name-2").val();
            var userTrueName = $("#user-true-name").val();
            var userSex = $("#sex").val();
            var userAge = $("#age").val();
            var userEmail = $("#email").val();
            var userPhone = $("#phone").val();
            var adminType;
            if ($("#isAdmin")[0].checked) {
                adminType = 1;
            } else {
                adminType = 0;
            }
            $.ajax({
                type: "post",
                url: "/koala-platform/user/alterUserInfo",
                data: {
                    userName: userName,
                    userTrueName: userTrueName,
                    userSex: userSex,
                    userAge: userAge,
                    userEmail: userEmail,
                    userPhone: userPhone,
                    adminType: adminType
                },
                success: function () {
                    makeBlockTime("更新成功！");
                    closeWindow();
                    self.opener.location.reload();
                },
                error: function () {
                    makeBlockTime("发生未知错误！");
                }
            })
        }
    </script>
</head>
<body>
<div id="out-box">
    <form role="form" class="form-inline">
        <div class="form-group">
            <label for="user-name-2">用户名</label>
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
        <div class="form-group">
            <label for="isAdmin">是否设置为管理员</label>
            <input type="checkbox" class="form-control" id="isAdmin">
        </div>
    </form>
    <button class="btn btn-default" onclick="alterUserInfo()">更新信息</button>
</div>

</body>
</html>
