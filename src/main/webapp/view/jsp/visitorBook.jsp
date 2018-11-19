<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 10/13 0013
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/visiterBook.css"/>
    <script src="../../static/js/visiterBook.js"></script>

    <script>

    </script>
</head>
<body>
<div id="out-box">
    <jsp:include page="alluse/header.jsp"/>
    <div id="write-area">
        <form role="form">
            <div class="form-group">
                <textarea class="form-control" id="visitor-message" placeholder="请留言："></textarea>
            </div>
        </form>
        <button class="btn btn-info right" type="submit" onclick="submitMessage()">提交</button>
    </div>
    <br>
    <br>

    <div id="history-book">

    </div>

    <jsp:include page="alluse/footer.jsp"/>

</div>
</body>
</html>
