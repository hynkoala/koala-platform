<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>koala之家</title>
    <jsp:include page="alluse/importCss.jsp"/>
    <link rel="stylesheet" type="text/css" href="/koala-platform/static/css/homepage.css"/>

</head>
<body>

<div id="out-box">
    <jsp:include page="alluse/header.jsp"/>
    <div id="content">
        <div id="dongtai">
            <h4 class="biaoti">我的动态</h4>
            <ul>
                <c:forEach begin="0" end="4" items="${diaryList}" var="diary">
                    <li class="diary-title">${diary.diaryTitle}</li>
                </c:forEach>
            </ul>
        </div>
        <img width="338" height="427" class="welcome" src="/koala-platform/static/img/welcome_hua.png"/>
    </div>
    <jsp:include page="alluse/footer.jsp"/>
</div>
<jsp:include page="alluse/importJs.jsp"></jsp:include>
<script>
    var user;
    var diaryAraay;
    $(function () {
        user =${user};
        diaryAraay =${diaryList};

    })
</script>
</body>
</html>




