<%@ page language="java" pageEncoding="utf-8" %>
<script>
    window.onload = function () {
        $("div.main-menu").mouseover(function () {
            $(this).css("border-top", "2px solid red");
            /*$(this).children("a.dropdown-toggle").click();*/
            /*$(this).children("ul.dropdown-menu").removeClass("hidden");*/
        });
        $("div.main-menu").mouseout(function () {
            $(this).css("border-top", "none");
            /* $(this).children("ul.dropdown-menu").addClass("hidden");*/
        });
        $("li.sec-menu").mouseover(function () {
            $(this).css("color", "rgb(220,220,220)");
        });
        $("li.sec-menu").mouseout(function () {
            $(this).css("color", "rgb(180,180,180)");
        });
        $('.dropdown-toggle').dropdown()
    }

    function toOneMenu(fileName, projectName) {
        url = "/koala-platform/view/jsp/" + fileName + ".jsp";
        window.open(url);
    }

</script>
<div id="header">
    <div id="banner">
        <div id="action-area">
            <input type="button" class="btn-default btn-default-dark" onclick="toLogin()" value="登录">
            <input type="button" class="btn-default btn-default-dark" value="注册" onclick="toRegister()">
            <input type="button" class="btn-default btn-default-dark" value="退出" onclick="exitLogin()">
        </div>
        <div id="platform-function" class="dropdown main-menu">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">平台功能</a>
            <ul class="dropdown-menu">
                <li class="sec-menu" onclick="toOneMenu('home','koala-home')">koala驿站</li>
                <li class="sec-menu" onclick="toOneMenu('accountIndex','koala-account')">记账系统</li>
                <li class="sec-menu">3</li>
            </ul>
        </div>

        <div id="about" class="dropdown main-menu">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">关于</a>
            <ul class="dropdown-menu" role="menu">
                <li class="sec-menu">关于网站</li>
                <li class="sec-menu">关于我们</li>
                <li class="sec-menu">E-mail</li>
            </ul>
        </div>

        <div id="manager-login" class="dropdown main-menu">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">管理员</a>
            <ul class="dropdown-menu" role="menu">
                <li class="sec-menu" onclick="toOneMenu('userManager')">后台管理系统</li>
                <li class="sec-menu">申请成为管理员</li>
                <li class="sec-menu">找管理员</li>
            </ul>
        </div>
    </div>
</div>