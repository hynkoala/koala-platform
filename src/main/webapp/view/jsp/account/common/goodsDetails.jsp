<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="account-details">
    <div class="item-header">出&nbsp;&nbsp;账&nbsp;&nbsp;单&nbsp;&nbsp;明&nbsp;&nbsp;细</div>
    <form class="list-form" role="form" id="list-form">
        <table id="trade_list" class="list-table">
            <thead class="list-header">
            <th class="col-header hidden"></th>
            <th class="col-header hidden"></th>
            <th class="col-header">商品名</th>
            <th class="col-header">单位</th>
            <th class="col-header">数量</th>
            <th class="col-header">单价</th>
            <th class="col-header" colspan="2">类型</th>
            <th class="col-header">品牌</th>
            <th class="col-header">规格</th>
            <th class="col-header">型号</th>
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
                    <td class="list-value" style="width: 251px">
                        <input name="goodsName" class="goods-name" value="${tradeInfo.goodsName}" onclick="getGoodsInfo(this.value,this)">
                        <ul class="dropdown-ul father-style" style="position: absolute;z-index: 1000" ;></ul>
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

                    <td class="list-value" style="width: 150px">
                        <select name="goodsBigType" class="goods-big-type no-border"
                                onchange="getGoodsSmallType(this.value,this)">
                        </select>
                    </td>
                    <td class="list-value" style="width: 150px">
                        <select name="goodsType" class="goods-type no-border"></select>
                    </td>
                    <td class="list-value" style="width: 150px">
                        <input name="goodsBrand" value="${tradeInfo.goodsBrand}">
                    </td>
                    <td class="list-value" style="width: 100px">
                        <input name="goodsSize" value="${tradeInfo.goodsSize}">
                    </td>
                    <td class="list-value" style="width: 150px">
                        <input name="goodsModel" value="${tradeInfo.goodsModel}">
                    </td>

                    <td class="list-value" style="width: 100px">
                        <input name="sumPrice">
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </form>

    <br>
    <label for="sum-money">合计：</label>
    <input id="sum-money" name="sumMoney" class="show-input" type="text" contenteditable="false" value="123">


    <label for="write-man">填写人：</label>
    <input id="write-man" name="operatePerson" class="show-input" type="text" contenteditable="false" value="koala">
    <input id="write-time" class="show-input" type="text" contenteditable="false" value="2018.08.08">

    <%--<input id="account-print" type="button" class="btn-default btn-default-light btn-save right account-btn"
           value="打印">--%>
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
        <td class="list-value" style="width: 251px">
            <input name="goodsName" class="goods-name" onclick="getGoodsInfo(this.value,this)">
            <ul class="dropdown-ul father-style" hidden="hidden" style="position: absolute;z-index: 1000"></ul>
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
        <td class="list-value" style="width: 150px">
            <input name="goodsBigType" class="goods-big-type no-border" onclick="showTypeDropdown(this,'bigtype')">
            <ul class="dropdown-ul goods-big-type father-style" style="position: absolute;z-index: 999" hidden="hidden"></ul>
        </td>
        <td class="list-value" style="width: 150px">
            <input name="goodsType" class="goods-type no-border" onclick="showTypeDropdown(this,'smalltype')">
            <ul class="dropdown-ul goods-small-type father-style" style="position: absolute;z-index: 1000" hidden="hidden"></ul>
            <%--<select name="goodsBigType" class="goods-big-type half-width no-border"
                    onchange="getGoodsSmallType(this.value,this)">
            </select>
            <select name="goodsType" class="goods-type half-width no-border"></select>--%>
        </td>
        <td class="list-value" style="width: 150px">
            <input name="goodsBrand">
        </td>
        <td class="list-value" style="width: 100px">
            <input name="goodsSize">
        </td>
        <td class="list-value" style="width: 150px">
            <input name="goodsModel">
        </td>
        <td class="list-value">
            <input name="sumPrice">
        </td>
    </tr>
    </tbody>
</table>