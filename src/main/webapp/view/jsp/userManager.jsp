<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2018/9/29
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理系统</title>
    <jsp:include page="alluse/autoImport.jsp"></jsp:include>
    <link rel="stylesheet" href="/koala-platform/static/thirdControl/jqgrid/css/ui.jqgrid.css"/>
    <link rel="stylesheet" href="/koala-platform/static/thirdControl/jquery/css/jquery-ui.theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="/koala-platform/static/css/userManager.css"/>
    <script type="text/javascript" src="/koala-platform/static/thirdControl/jqgrid/js/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="/koala-platform/static/thirdControl/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="/koala-platform/static/js/userManager.js"></script>
</head>
<body>
<div id="select-area">
    <form role="form" class="form-inline">
        <div class="form-group">
            <label for="user-name">用户名：</label>
            <input class="form-control" id="user-name">
        </div>
        <div class="btn-group">
            <button class="btn btn-info" onclick="queryUser();return false">查询</button>
            <button class="btn btn-default" type="reset">重置</button>
            <button class="btn btn-default" type="button" onclick="muldelete()">删除</button>
            <button class="btn btn-default" type="button" onclick="toPrint()">打印</button>
        </div>
    </form>

</div>
<table id="grid-table"></table>
<div id="grid-pager"></div>
</body>
</html>
