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
    <title>出账单</title>
    <jsp:include page="../alluse/importCss.jsp"></jsp:include>
    <link href="/koala-platform/static/css/account.css" rel="stylesheet">
</head>
<style>

</style>
<body>
<div id="header"></div>
<div id="main-content">
    <div id="input-area">
        <form role="form" class="form-inline" id="form">
            <table class="key-value-table" cellpadding="20">
                <thead></thead>
                <tbody>
                <tr class="tr-field">
                    <td class="td-field">出账编号</td>
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
                        <input type="text" name="sumMoney">
                    </td>
                </tr>
                <tr>
                    <td class="td-field">出售方</td>
                    <td class="td-value">
                        <input type="text" name="tradeTarget">
                    </td>
                    <td class="td-field">联系人</td>
                    <td class="td-value">
                        <input type="text" name="contactPerson">
                    </td>
                    <td class="td-field">电话</td>
                    <td class="td-value">
                        <input type="text" name="contactWay">
                    </td>
                    <td class="td-field">是否开税</td>
                    <td class="td-value">
                        <input type="text" placeholder="税率:" class="auto-width">
                        <span class="auto-width"><input type="checkbox" name="doSelie"
                                                        class="input-checkbox"></span>
                    </td>
                </tr>
                <tr>
                    <td class="td-field">备注</td>
                    <td class="td-value" colspan="7">
                        <textarea type="text" name="otherComment"
                                  overflow="auto"></textarea>
                    </td>
                </tr>
                </tbody>
                <%--账单内容隐藏项--%>
                <div class="hidden">
                    <input name="accountId" id="account-id" value="${account.accountId}">
                    <input name="accountType" value="2" id="account-type">
                </div>
            </table>
        </form>
    </div>

    <div id="account-details">
        <div class="item-header">出&nbsp;&nbsp;账&nbsp;&nbsp;单&nbsp;&nbsp;明&nbsp;&nbsp;细</div>
        <form class="list-form" role="form" id="list-form">

            <table id="recent-account-in" class="list-table">
                <thead class="list-header">
                <th class="col-header hidden"></th>
                <th class="col-header hidden"></th>
                <th class="col-header">商品名</th>
                <th class="col-header">单位</th>
                <th class="col-header">数量</th>
                <th class="col-header">单价</th>
                <th class="col-header">类型</th>
                <th class="col-header">规格</th>
                <th class="col-header">品牌</th>
                <th class="col-header">总价</th>
                </thead>
                <tbody class="list-body">
                <c:forEach var="tradeInfo" items="${tradeInfoList}">
                    <tr class="list-item tradeInfo-list">
                        <td class="list-value hidden">
                            <input name="tradeId" value="${tradeInfo.tradeId}">
                        </td>
                        <td class="list-value hidden">
                            <input name="goodsId" value="${tradeInfo.goodsId}">
                        </td>
                        <td class="list-value">
                            <input name="goodsName" value="${tradeInfo.goodsName}">
                        </td>
                        <td class="list-value" style="width: 50px">
                            <input name="goodsUnit" value="${tradeInfo.goodsUnit}">
                        </td>
                        <td class="list-value" style="width: 80px">
                            <input name="tradeNumber" value="${tradeInfo.tradeNumber}">
                        </td>
                        <td class="list-value" style="width: 100px">
                            <input name="tradePrice" value="${tradeInfo.tradePrice}">
                        </td>
                        <td class="list-value">
                            <input name="goodsType" value="${tradeInfo.goodsType}">
                        </td>
                        <td class="list-value" style="width: 100px">
                            <input name="goodsSize" value="${tradeInfo.goodsSize}">
                        </td>
                        <td class="list-value">
                            <input name="goodsBrand" value="${tradeInfo.goodsBrand}">
                        </td>

                        <td class="list-value">
                            <input name="sumPrice">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
        <br>
        <input id="account-save" type="button" class="btn-default btn-default-light btn-save right account-btn"
               onclick="saveAccount()"
               value="保存">
        <input type="button" class="btn-default btn-default-light right account-btn" onclick="initTableList(1)"
               value="增加行">
        <br>
        <br>
    </div>

    <table class="hidden">
        <tbody class="list-model" class="hidden" hidden="hidden">
        <tr class="list-item">
            <td class="list-value hidden">
                <input name="tradeId">
            </td>
            <td class="list-value hidden">
                <input name="goodsId">
            </td>
            <td class="list-value">
                <input name="goodsName">
            </td>
            <td class="list-value" style="width: 50px">
                <input name="goodsUnit">
            </td>
            <td class="list-value" style="width: 80px">
                <input name="tradeNumber">
            </td>
            <td class="list-value" style="width: 100px">
                <input name="tradePrice">
            </td>
            <td class="list-value">
                <input name="goodsType">
            </td>
            <td class="list-value" style="width: 100px">
                <input name="goodsSize">
            </td>
            <td class="list-value">
                <input name="goodsBrand">
            </td>


            <td class="list-value">
                <input name="sumPrice">
            </td>
        </tr>
        </tbody>
    </table>


</div>
<div class="hidden">
    <input type="text" id="tradeInfoSize" value="${tradeInfoSize}">
</div>
<jsp:include page="../alluse/footer.jsp"></jsp:include>
<jsp:include page="../alluse/importJs.jsp"></jsp:include>
<script src="../static/js/table.js"></script>
<script src="/koala-platform/static/js/account.js"></script>
</body>
</html>
