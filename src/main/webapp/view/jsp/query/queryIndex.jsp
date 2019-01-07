<%--
  Created by IntelliJ IDEA.
  User: 12732
  Date: 12/22 0022
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询系统</title>
    <jsp:include page="../alluse/importCss.jsp"></jsp:include>
    <style>

        .query-item {
            background-color: whitesmoke;
            min-height: 620px;
        }

        #query-content {
            margin-left: 250px;
        }

        #account-in {
            background-color: whitesmoke;
        }

        #main-content {
            margin: 0px;
            padding: 0px;
            padding-right: 50px;

        }

        #query-header {
            border: 1px solid silver;
            width: 100%;
            height: 100px;
            margin-top: 20px;
        }

        #query-header input {
            float: left;
            margin-right: 20px;
            margin-top: 20px;
        }

        .layui-nav-side {
            /*background-color: #3e3c3f;*/
            position: absolute;
            height: 100%;
        }

        .layui-nav-item {
            /* border-bottom: 1px solid grey;*/
        }

        #queryPortal-unit-pix {
            width: 500px;
            height: 400px;
        }

        #queryPortal-meixianghao-pix {
            width: 800px;
            height: 400px;
            margin-left: 50px;
        }

        #queryPortal-sum-bar {
            width: 1400px;
            height: 300px;
            margin-top: 50px;
        }

        #queryPortal {
            height: 800px;
            padding: 20px 50px;
            margin-top: 20px;
        }

        .query-chart {
            float: left;
            border: 1px solid #ebe9e9;
        }
    </style>
</head>
<body>

<div id="main-content">
    <div class="left-menu">
        <ul class="layui-nav layui-nav-tree layui-nav-side">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:toQueryItem('queryPortal');">账单门户</a>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">账单查询</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:toQueryItem('account-in');">入帐单</a></dd>
                    <dd><a href="javascript:toQueryItem('account-out');">出账单</a></dd>
                    <dd><a href="javascript:toQueryItem('account-flow');">流水账</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">货物信息</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:toQueryItem('goods-list');">货物明细</a></dd>
                    <dd><a href="javascript:toQueryItem('goods-list');">存量查询</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">销售情况</a>
                <dl class="layui-nav-child">
                    <dd><a href="">周销售</a></dd>
                    <dd><a href="">月销售</a></dd>
                    <dd><a href="">季销售</a></dd>
                    <dd><a href="">年销售</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <div id="query-content">
        <%--查询页面头部搜索区域--%>
        <div id="query-header" class="account" hidden="hidden">
            <form id="query-form">
                <input id="vague-query-input" name="input" type="text" class="query-input" placeholder="请输入查询条件：">
                <input type="text" name="startTime" class="lay-input-date" id="query-start-date" placeholder="开始日期">
                <input type="text" name="endTime" class="lay-input-date" id="query-end-date" placeholder="截止日期">
                <input style="display: block" type="button" class="btn-default btn-save" id="query-button" value="搜索"/>
                <input style="display: block" type="button" class="btn-default btn-default-light" value="高级搜索"/>
            </form>

            <%--高级搜索--%>
            <%--<input id="vague-query-input" type="text" class="query-input" placeholder="请输入查询条件：">
            <input id="vague-query-input" type="text" class="query-input" placeholder="请输入查询条件：">
            <input id="vague-query-input" type="text" class="query-input" placeholder="请输入查询条件：">--%>


        </div>
        <div id="queryPortal" class="query-item">

            <div id="queryPortal-unit-pix" class="query-chart"></div>
            <div id="queryPortal-meixianghao-pix" class="query-chart"></div>
            <div id="queryPortal-sum-bar" class="query-chart"></div>
        </div>
        <div id="account-in" class="query-item" hidden="hidden" query-url="/account/getAccount?accountType=1">
            <table id="account-in-table" class="layui-table" lay-filter="account-in"></table>
        </div>
        <div id="account-out" class="query-item" hidden="hidden" query-url="/account/getAccount?accountType=2">
            <table id="account-out-table" class="layui-table" lay-filter="account-out"></table>
        </div>
        <div id="account-flow" class="query-item" hidden="hidden" query-url="/account/queryAccountFlow">
            <table id="account-flow-table" class="layui-table" lay-filter="account-flow"></table>
        </div>
        <div id="goods-list" class="query-item" hidden="hidden">
            <table id="goods-list-table" class="layui-table" lay-filter="goods-list"></table>
        </div>
        <%--<div id="goods-list" class="query-item" hidden="hidden">
            <table id="goods-list-table" class="layui-table"></table>
        </div>--%>
    </div>

</div>

<jsp:include page="../alluse/footer.jsp"></jsp:include>
<jsp:include page="../alluse/importJs.jsp"></jsp:include>

<script type="text/html" id="default-tool-bar">
    <input type='button' class='btn-default btn-default-light' lay-event="seeDetails" value='明细'>
    <input type='button' class='btn-default btn-default-light' lay-event='seeDetails' value='修改'>
    <input type='button' class='btn-default btn-default-delete' lay-event='delete' value='删除'>
</script>
<script type="text/html" id="tool-bar-details">
    <input type='button' class='btn-default btn-default-light' lay-event="seeDetails" value='对应账单'>
</script>

<script type="text/javascript">

    function showQueryPortal() {
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/pie' // 使用饼状图就加载pie模块，按需加载
            ]
            ,
            // 饼状图
            function (ec) {
                var trueUnit;
                var trueData;
                $.ajax({
                    type: 'post',
                    url: queryUrl + "/getUnitsUseAmount",
                    success: function (data1) {
                        trueUnit = data1.unit;
                        trueData = data1.data;

                        // 基于准备好的dom，初始化echarts图表
                        var myChart = ec.init(document.getElementById('queryPortal-unit-pix'));
                        option = {
                            title: {
                                text: '近期各单位用量一览',
                                subtext: '查看详细请<a class="button" href="#">点击这里</a>',
                                x: 'center'
                            },
                            tooltip: {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                x: 'left',
                                //data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
                                data: trueUnit
                            },
                            toolbox: {
                                show: true,
                                feature: {
                                    mark: {show: false},
                                    dataView: {show: true, readOnly: false},
                                    magicType: {
                                        show: true,
                                        type: ['pie', 'funnel'],
                                        option: {
                                            funnel: {
                                                x: '25%',
                                                width: '50%',
                                                funnelAlign: 'left',
                                                max: 1548
                                            }
                                        }
                                    },
                                    restore: {show: true},
                                    saveAsImage: {show: true},
                                }
                            },
                            calculable: true,
                            series: [
                                {
                                    name: '用量',
                                    type: 'pie',
                                    radius: '55%',
                                    center: ['50%', '60%'],
                                    data: trueData
                                }
                            ]
                        };
                        // 为echarts对象加载数据
                        myChart.setOption(option);
                    }
                })

            }
        );

        // 使用
        require(
            [
                'echarts',
                'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
                'echarts/chart/pie' // 使用饼状图就加载pie模块，按需加载
            ]
            ,
            // 柱状图
            function (ec) {
                var myChart = ec.init(document.getElementById('queryPortal-sum-bar'));
                var xValue;
                var trueData;
                $.ajax({
                    type: 'post',
                    url: queryUrl + "/getTimeSeriesSum",
                    success: function (data1) {
                        xValue = data1.xValue;
                        trueData = data1.data;
                        option = {
                            title: {
                                text: '近30日销售情况',
                                subtext: '  请注意："30"代表今天-.-'
                            },
                            tooltip: {
                                trigger: 'axis'
                            },
                            legend: {
                                data: ["money"]
                            },
                            toolbox: {
                                show: true,
                                feature: {
                                    mark: {show: true},
                                    dataView: {show: true, readOnly: false},
                                    magicType: {show: true, type: ['line', 'bar']},
                                    restore: {show: true},
                                    saveAsImage: {show: true}
                                }
                            },
                            calculable: true,
                            xAxis: [
                                {
                                    data: xValue
                                }
                            ],
                            yAxis: [
                                {
                                    type: 'value'
                                }
                            ],
                            series: [
                                {
                                    name: 'money',
                                    type: 'bar',
                                    data: trueData,
                                    markPoint: {
                                        data: [
                                            {type: 'max', name: '最大值'},
                                            {type: 'min', name: '最小值'}
                                        ]
                                    },
                                    markLine: {
                                        data: [
                                            {type: 'average', name: '平均值'}
                                        ]
                                    }
                                }
                            ]
                        };

                        // 为echarts对象加载数据
                        myChart.setOption(option);
                    }
                })
            }
        );
    }


</script>

<script>
    var table = layui.table;
    var objs = [];
    var currectQuery = $(".query-item.active");
    var qUrl = platformUrl + currectQuery.attr("query-url");
    $(function () {
        $("#query-button").click(function () {
            currectQuery = $(".query-item.active");
            qUrl = platformUrl + currectQuery.attr("query-url");
            var options = {
                url: qUrl,
                where: {
                    input: $("#vague-query-input").val(),
                    startTime: $("#query-start-date").val(),
                    endTime: $("#query-end-date").val()
                }
            };
            var tableId = currectQuery.attr("id")
            table.reload(tableId, options)
        })
    })
</script>

<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#query-start-date' //指定元素
            , type: 'date'
        });
        laydate.render({
            elem: '#query-end-date'  //指定元素
            , type: 'date'
        });
    });

    function changeQueryInfo(itemId) {

        if (itemId == "account-in") {
            qUrl = "/koala-platform/account/getAccount?accountType=1";
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入账单编号 / 账单名 / 供货方 / 联系人")
            showQueryAccountIn()
        }
        else if (itemId == 'goods-list') {
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入货物名")
            showQueryGoodsList()
        }
        else if (itemId == 'account-out') {
            qUrl = "/koala-platform/account/getAccount?accountType=2";
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入账单编号 / 账单名 / 交易单位 / 联系人")
            showQueryAccountOut();
        }
        else if (itemId == 'account-flow') {
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入账单编号 / 账单名 / 交易方 / 货物名")
            showQueryAccountFlow();
        }
        else {
            $("#vague-query-input")[0].setAttribute("placeholder", "请输入")
        }
    }
</script>

<script>

</script>

<script>
    $(function () {
        //showQueryAccountIn();
        toQueryItem()
        //toQueryItem("account-in")
    })
    function toQueryItem(itemID) {
        $(".query-item").hide();
        $(".query-item.active").removeClass("active");
        /*$.each($(".query-item active"),function (i) {
         $(".query-item active")[i].setAttribute("class","");
         })*/
        if (thisIsNull(itemID)) {
            $("#query-header").hide();
            $("#queryPortal").show();
            $("#queryPortal").addClass("active");
            showQueryPortal();
        } else {
            $("#" + itemID).show();
            $("#" + itemID).addClass("active");
            if (itemID != "queryPortal") {
                $("#query-header").show();
            } else {
                $("#query-header").hide();
            }
            changeQueryInfo(itemID);
        }

    }
    function seeDetails(id, accountType) {
        var url = "/koala-platform/account/accountDetails?accountType=" + accountType + "&accountId=" + id;
        window.open(url);
    }

</script>

<jsp:include page="queryAccountIn.jsp"></jsp:include>
<jsp:include page="queryAccountOut.jsp"></jsp:include>
<jsp:include page="queryAccountFlow.jsp"></jsp:include>
<jsp:include page="queryGoodsList.jsp"></jsp:include>
</body>
</html>
