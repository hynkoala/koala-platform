<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 11/24 0024
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>入账单</title>
    <jsp:include page="../alluse/importCss.jsp"></jsp:include>
    <link href="/koala-platform/static/css/account.css" rel="stylesheet">
</head>
<style>

</style>
<body>
<div class="hidden">
</div>
<div id="header"></div>
<div id="main-content">
    <div id="input-area">
        <form role="form" class="form-inline" id="form">
            <div class="hidden">
                <input name="accountId" id="account-id" value="${account.accountId}">
                <input name="accountType" value="1" id="account-type">
            </div>
            <table class="key-value-table">
                <thead></thead>
                <tbody>
                <tr class="tr-field">
                    <td class="td-field">入账编号</td>
                    <td class="td-value">
                        <input id="account-bh" type="text" name="accountBh" value="${account.accountBh}">
                    </td>
                    <td class="td-field">账单名</td>
                    <td class="td-value">
                        <input type="text" name="accountName" value="${account.accountName}">
                    </td>
                    <td class="td-field">类别</td>
                    <td class="td-value">
                        <select name="goodsBigType" id="goods-big-type" class="half-width"
                                onchange="getGoodsSmallType()">
                        </select>
                        <select name="goodsType" id="goods-type" class="half-width"></select>

                    </td>
                    <td class="td-field">总额</td>
                    <td class="td-value">
                        <input type="text" name="sumMoney" value="${account.sumMoney}">
                    </td>
                </tr>
                <tr>
                    <td class="td-field">供货商</td>
                    <td class="td-value">
                        <input type="text" name="tradeTarget" value="${account.tradeTarget}">
                    </td>
                    <td class="td-field">联系人</td>
                    <td class="td-value">
                        <input type="text" name="contactPerson" value="${account.contactPerson}">
                    </td>
                    <td class="td-field">电话</td>
                    <td class="td-value">
                        <input type="text" name="contactWay" value="${account.contactWay}">
                    </td>
                    <td class="td-field">地址</td>
                    <td class="td-value">
                        <input type="text" name="supplierAddress">
                    </td>
                </tr>
                <tr>
                    <td class="td-field">备注</td>
                    <td class="td-value" colspan="7">
                        <textarea type="text" name="otherComment"
                                  overflow="auto">${account.otherComment}</textarea>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>

    <jsp:include page="common/goodsDetails.jsp"></jsp:include>
</div>

<jsp:include page="../alluse/footer.jsp"></jsp:include>
<jsp:include page="../alluse/importJs.jsp"></jsp:include>
<script src="../static/js/table.js"></script>
<script src="/koala-platform/static/js/account.js"></script>
</body>
</html>
