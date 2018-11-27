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
    <title>添加货物</title>
    <jsp:include page="../alluse/autoImport.jsp"></jsp:include>
</head>
<style>
    body {
        font-size: 30px;
    }
</style>
<script>
    $(function () {
        $(".account-tools").mouseover(function () {
            $(this).css("background-color", "rgb(220,220,220)");
        });
        $(".account-tools").mouseout(function () {
            $(this).css("background-color", "#00B83F");
        });
    });
    function saveGoods() {
        var data = $("#form").serialize();
        var url = "/koala-platform/goods/saveGoods";
        $.ajax({
            url: url,
            type: "post",
            data: data,
            success: function (data) {
                if (data == "success") {
                    makeBlockTime("保存成功！");
                }
            }
        })

    }

</script>
<body>
<div id="main-content">
    <div id="input-area">
        <form role="form" class="form-inline" id="form">
            <div class="form-group">
                <label>货物名：</label>
                <input type="text" name="goodsName" id="goods-name" class="form-control">
            </div>
            <div class="form-group">
                <label>单位：</label>
                <select type="text" name="goodsUnit" id="goods-unit" class="form-control">
                    <option value="个">个</option>
                    <option value="盒">盒</option>
                    <option value="箱">箱</option>
                    <option value="把">把</option>
                    <option value="件">件</option>
                    <option value="支">支</option>
                    <option value="张">张</option>
                    <option value="本">本</option>
                    <option value="块">块</option>
                    <option value="条">条</option>
                    <option value="袋">袋</option>
                    <option value="根">根</option>
                    <option value="片">片</option>
                </select>
            </div>
            <div class="form-group">
                <label>类别：</label>
                <select type="text" name="goodsType" id="goods-type" class="form-control">
                </select>
            </div>
            <div class="form-group">
                <label>进价：</label>
                <input type="text" name="goodsInPrice" id="goods-in-price" class="form-control">
            </div>
            <div class="form-group">
                <label class="inline">定价：</label>
                <input type="text" name="goodsFixedPrice" id="goods-fixed-price" class="form-control">
            </div>
            <div class="form-group">
                <label class="inline">用途：</label>
                <input type="text" name="goodsUsage" id="goods-usage" class="form-control">
            </div>
        </form>
    </div>

    <div id="operate-area">
        <input type="button" value="保存" class="btn-default-dark" onclick="saveGoods()"/>
    </div>
</div>
<jsp:include page="../alluse/footer.jsp"></jsp:include>

</body>
</html>
