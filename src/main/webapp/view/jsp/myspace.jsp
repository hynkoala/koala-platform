<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>hynkoala</title>
    <jsp:include page="alluse/importCss.jsp"></jsp:include>
    <link type="text/css" rel="stylesheet" href="/koala-platform/static/css/myspace.css"/>
    <link rel="stylesheet" type="text/css" href="/koala-platform/static/css/home.css"/>


    <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>-->

</head>

<body>
<div id="out-box">
    <jsp:include page="alluse/header.jsp"/>
    <div id="content-group">
        <div id="content-personal" class="content-item" onclick="toPersonal()"><span class="content-font"> 个人信息管理</span>
        </div>
        <div id="content-userManager" class="content-item" onclick="toUserManager()"><span
                class="content-font">用户管理系统</span></div>
        <div id="content-chatRoom" class="content-item" onclick="toPersonal()"><span class="content-font">进入聊天室</span>
        </div>
    </div>
    <jsp:include page="alluse/footer.jsp"/>
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
                }
                else {
                    makeBlockTime("Problem retrieving XML data:" + xmlhttp.statusText);
                }
            }
        }
    });

    function toPersonal() {
        var url = "/koala-platform/view/jsp/personal.jsp?userName=" + userName;
        window.location.href = url;
        window.title = "个人信息管理";
    }
    function toUserManager() {
        var url = "/koala-platform/view/jsp/userManager.jsp";
        if (user.adminType == 0) {
            makeBlockTime("非管理员不能登陆", 500);
        } else {
            window.open(url, "用户管理");
        }
    }
    function getUserNameByUrl() {
        var url = location.search;
        var theRequest = {};
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            strs = str.split("&");
            for (var i = 0; i < strs.length; i++) {
                theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
            }
        }
        return theRequest.userName;
    }
</script>

</body>
</html>




