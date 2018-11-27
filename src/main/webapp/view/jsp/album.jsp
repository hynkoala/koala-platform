<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 10/17 0017
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>相册</title>
    <jsp:include page="alluse/autoImport.jsp"/>
    <script src="../../static/thirdControl/jquery/plugins/ajaxfileupload.js"></script>
    <script src="/koala-platform/static/js/photo.js"></script>

    <style>
        #see-photo img {
            width: 200px;
            height: 140px;
            margin: 5px 5px;
        }

        input.form-control {
            width: 750px;
        }

        form {
            float: left;
            margin-left: 43px;
        }

        #upload-btn {
            float: bottom;
            margin-top: 50px;
        }

        #download-button {
            z-index: 100 !important;
            background-color: yellow;
        }
    </style>
    <script>
        $(function () {
            showPhoto(8, "download");
        });

        function photoManager() {
            var url = "/koala-platform/view/jsp/photoManager.jsp";
            window.open(url);
        }

    </script>
</head>
<body>
<div id="out-box">
    <jsp:include page="alluse/header.jsp"/>
    <div id="content">
        <div id="upload-photo">
            <form role="form" enctype="multipart/form-data">
                <div class="form-group">
                    <input class="form-control" id="input-photo" type="file" multiple="multiple" name="photos"
                           placeholder="选择照片">
                </div>
                <div class="form-group">
                    <input class="form-control" id="photo-comment" type="text" PLACEHOLDER="为这张照片写下点什么吧"/>
                </div>
            </form>
            <button type="submit" onclick="uploadPhoto()" class="btn btn-info" id="upload-btn">上传</button>
            <button type="submit" onclick="photoManager()" class="btn btn-info only-admin" id="to-photo-manager">管理
            </button>
        </div>
        <div id="see-photo"></div>
    </div>
    <jsp:include page="alluse/footer.jsp"/>
</div>
</body>
</html>
