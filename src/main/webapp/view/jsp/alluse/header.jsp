<%@ page language="java" pageEncoding="utf-8" %>
<script>
    window.onload = function () {
       /* document.getElementById("to-home").href = "/koala-platform/user/toHome?userName=" + userName;
        document.getElementById("to-myspace").href = "/koala-platform/user/toMyspace?userName=" + userName;
        document.getElementById("to-visitor-book").href = "/koala-platform/view/jsp/visitorBook.jsp?userName=" + userName;
        document.getElementById("to-diary").href = "/koala-platform/view/jsp/diary.jsp?userName=" + userName;
        document.getElementById("to-album").href = "/koala-platform/view/jsp/album.jsp?userName=" + userName;
        document.getElementById("user-name").innerHTML = userName;*/

        $("div.main-menu").mouseover(function(){
            $(this).css("border-top","2px solid red");
            /*$(this).children("a.dropdown-toggle").click();*/
            /*$(this).children("ul.dropdown-menu").removeClass("hidden");*/
        });
        $("div.main-menu").mouseout(function(){
            $(this).css("border-top","none");
           /* $(this).children("ul.dropdown-menu").addClass("hidden");*/
        });
        $("li.sec-menu").mouseover(function(){
            $(this).css("color","rgb(220,220,220)");
        });
        $("li.sec-menu").mouseout(function(){
            $(this).css("color","rgb(180,180,180)");
        });
        $('.dropdown-toggle').dropdown()
    }

    function toKoalaHome(){
        window.open("/koala-platform/view/jsp/home.jsp");
    }

</script>
<div id="header">
    <div id="banner">
        <div id="platform-function" class="dropdown main-menu">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">平台功能</a>
            <ul class="dropdown-menu">
                <li class="sec-menu" href="/koala-platform/view/jsp/home.jsp" onclick="toKoalaHome()">koala驿站</li>
                <li class="sec-menu">记账系统</li>
                <li class="sec-menu">3</li>
            </ul>
        </div>

        <div id="about" class="dropdown main-menu">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">关于</a>
            <ul class="dropdown-menu" role="menu">
                <li class="sec-menu" >关于网站</li>
                <li class="sec-menu">关于我们</li>
                <li class="sec-menu">E-mail</li>
            </ul>
        </div>

        <div id="manager-login" class="dropdown main-menu">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">管理员</a>
            <ul class="dropdown-menu" role="menu">
                <li class="sec-menu">后台管理系统</li>
                <li class="sec-menu">申请成为管理员</li>
                <li class="sec-menu">找管理员</li>
            </ul>
        </div>
    </div>
</div>