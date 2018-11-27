<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2018/10/31
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图片管理</title>
    <jsp:include page="alluse/autoImport.jsp"></jsp:include>
    <script src="/koala-platform/static/js/photo.js"></script>

    <style>
        img {
            width: 200px;
            height: 140px;
            margin: 5px 5px;
        }
    </style>

    <script>
        $(function () {
            showPhoto(null, 'manager');
        })
    </script>
</head>
<body>
<div id="out-box">
    <jsp:include page="alluse/header.jsp"></jsp:include>
    <div id="content">
        <div id="operate-area">
            <button class="btn btn-info" onclick="clearSelect()" id="check-photo">清除选择</button>
            <button class="btn btn-del" onclick="deletePhoto()" id="delete-photo">删除选中</button>
        </div>
        <div id="see-photo"></div>

    </div>
    <jsp:include page="alluse/footer.jsp"></jsp:include>
</div>
</body>
</html>
