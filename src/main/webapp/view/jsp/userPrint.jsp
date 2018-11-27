<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2018/10/9
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .ui-jqgrid .ui-jqgrid-htable th {
            height: 25px;
        }

        .ui-jqgrid .ui-jqgrid-view .ui-jqgrid-bdiv .ui-jqgrid-btable tr {
            height: 25px;
        }

        #out-box {
            width: 1024px;
            margin: 0 auto;
            margin-top: 20px;
        }

        table {
            border: 1px solid black;
            text-align: center;
        }

        /*.ui-state-default ui-jqgrid-hdiv .ui-jqgrid-labels{
            height: 30px;
        }*/
        tr {
            border: 0.2px solid darkgray;
            height: 20px;
        }

        td {
            border: 0.2px solid darkgray;
        }

        a {
            color: black;
            /*position:absolute;*/
            cursor: default;
            text-decoration: none;
        }

        a:link {
            color: black;
            text-decoration: none;
        }

          /* 未被访问的链接 蓝色 */
        a:visited {
            color: black;
            text-decoration: none;
        }

          /* 已被访问过的链接 蓝色 */
        a:hover {
            color: black;
            text-decoration: none;
        }

          /* 鼠标悬浮在上的链接 蓝色 */
        a:active {
            color: black;
            text-decoration: none;
        }

        .table-title {
            font-family: "Adobe 黑体 Std R";
            text-align: center;
            font-size: 18px;
            font-weight: bold;
        }

        /*input#print-button {
            background-color: lightskyblue;
            padding: 5px 10px;
            font-size: 14px;
        }*/

    </style>
    <script type="text/javascript" src="/koala-platform/static/thirdControl/jquery/jQuery.js"></script>
    <script type="text/javascript" src="/koala-platform/static/thirdControl/jqgrid/js/jquery.jqGrid.src.js"></script>
    <script type="text/javascript" src="/koala-platform/static/thirdControl/jqgrid/js/i18n/grid.locale-cn.js"></script>
    <script type="text/javascript" src="/koala-platform/static/thirdControl/jquery/js/jquery.table2excel.js"></script>
    <script src="/koala-platform/static/js/common.js"></script>
    <link rel="icon" href="/koala-platform/static/img/ico.ico"/>

    <script>
        var winData = window.opener;
        var printData = winData.select_users;
        var grid_selector = "#grid-table";
        var pager_selector = "#grid-pager";
        $(function () {
            $(grid_selector)
                .jqGrid(
                    {
                        mtype: 'post',
                        datatype: "local",
                        height: '20px',
                        jsonReader: {id: 'userId'},
                        colNames: ["用户名", '真实名', '电话', '邮箱', '性别', '年龄', '注册时间', '最近修改时间', '最近登陆时间', '管理员'],
                        colModel: [
                            {
                                name: 'userName',
                                index: 'userName',
                                width: '10%',
                                heigth: '30px',
                                sortable: false
                            },
                            {
                                name: 'userTrueName',
                                index: 'userTrueName',
                                width: '8%',
                                sortable: false
                            },
                            {
                                name: 'userPhone',
                                index: 'userPhone',
                                width: '8%',
                                sortable: false
                            },
                            {
                                name: 'userEmail',
                                index: 'userEmail',
                                width: '15%',
                                sortable: false
                            },
                            {
                                name: 'userSex',
                                index: 'userSex',
                                width: '4%',
                                sortable: false
                            },
                            {
                                name: 'userAge',
                                index: 'userAge',
                                width: '4%',
                                sortable: false
                            },
                            {
                                name: 'regTime',
                                index: 'regTime',
                                width: '10%',
                                sortable: false
                            },
                            {
                                name: 'lastUpdateTime',
                                index: 'lastUpdateTime',
                                width: '10%',
                                sortable: false
                            },
                            {
                                name: 'lastLoginTime',
                                index: 'lastLoginTime',
                                width: '10%',
                                sortable: false
                            },
                            {
                                name: 'adminType',
                                index: 'adminType',
                                width: '5%',
                                sortable: false
                            }
                        ],
                        viewrecords: false,//定义是否要显示总记录数
                        loadonce: true,//不配置始终只显示页面显示的数据，无法显示隐藏的后面的数据，导致无法翻页
                        multiselect: false,//不配置不会显示复选框
                        rowNum: -1,
                        rownumbers: true,
                        rownumWidth: 50,
                        autowidth: true
                    });
            if (printData != null && printData != 'undefined') {
                for (i = 0; i < printData.length; i++) {
                    data = printData[i];
                    $(grid_selector).jqGrid("addRowData", i + 1, data);
                }
            }
        });

        function preview(oper) {
            if (oper < 10) {
                bdhtml = window.document.body.innerHTML;//获取当前页的html代码
                sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域
                eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域
                prnhtml = bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html
                prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));//从结束代码向前取html
                window.document.body.innerHTML = prnhtml;
                window.print();
                window.document.body.innerHTML = bdhtml;
            } else {
                window.print();
            }
        }

        function exportExcel() {
            var inName = getFileName("用户信息", 'xls');
            var caption = "用户信息表";
            var thead = $("#thead-area");
            var gridTable = $("#grid-table");
            var temp = gridTable[0].removeChild(gridTable[0].childNodes[0]);
            gridTable[0].appendChild(thead[0]);
            gridTable[0].appendChild(temp);
            gridTable.table2excel({
                // 不被导出的表格行的CSS class类
                exclude: ".jqgfirstrow",
                // 导出的Excel文档的名称
                name: "",
                // Excel文件的名称
                filename: inName,
            });
            var text = gridTable[0].outerHTML;
            window.location.reload();

        }
    </script>
</head>
<body>
<input type=button id="print-button" value='打印' onclick="preview(1)">
<input type=button id="export-button" value='Excel' onclick="exportExcel()">
<!--startprint1-->
<div id="out-box">
    <div class="table-title">用户信息表</div>
    <table id="grid-table"></table>
</div>
<!--endprint1-->
<table id="thead-table" hidden="hidden">
    <caption>用户信息表</caption>
    <thead id="thead-area" hidden="hidden">
    <tr>
        <th>序号</th>
        <th>用户名</th>
        <th>真实名</th>
        <th>电话</th>
        <th>邮箱</th>
        <th>性别</th>
        <th>年龄</th>
        <th>注册时间</th>
        <th>最近修改时间</th>
        <th>最近登陆时间</th>
        <th>管理员</th>
    </tr>
    </thead>
</table>
<div id="export-data"></div>
</body>
</html>
