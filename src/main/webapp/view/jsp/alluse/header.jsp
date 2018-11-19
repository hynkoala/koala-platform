<%@ page language="java" pageEncoding="utf-8" %>
<script>
    window.onload = function () {
        document.getElementById("to-home").href = "/koala-platform/user/toHome?userName=" + userName;
        document.getElementById("to-myspace").href = "/koala-platform/user/toMyspace?userName=" + userName;
        document.getElementById("to-visitor-book").href = "/koala-platform/view/jsp/visitorBook.jsp?userName=" + userName;
        document.getElementById("to-diary").href = "/koala-platform/view/jsp/diary.jsp?userName=" + userName;
        document.getElementById("to-album").href = "/koala-platform/view/jsp/album.jsp?userName=" + userName;
        document.getElementById("user-name").innerHTML = userName;
    }
</script>
<div id="header">
    <div id="banner">
        <div id="biaoqian">
            <div width="80%" height="30" border="0" id="anniu">
                <ul>
                    <li width="32"><a id="to-home" title="首页" target="_self">首页</a></li>
                    <li width="30"><a href="#" id="to-diary" tilte="日志" target="_self">日志</a></li>
                    <li width="30"><a href="#" id="to-album" title="我的相册" target="_self">相册</a></li>
                    <li width="30"><a href="#" id="to-visitor-book" title="给我留言" target="_self">留言</a></li>
                    <li width="50"><a href="#" id="to-myspace" title="个人中心" target="_self">欢迎您：<span id="user-name"></span></a>
                    </li>
                    <li width="20" id="register-li"><a id="register-a" href="#" onclick="toRegister()">注册</a></li>
                    <li width="20" id="login-li"><a id="login-a" href="#" onclick="exitLogin()">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>