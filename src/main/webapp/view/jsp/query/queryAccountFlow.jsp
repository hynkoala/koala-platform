<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script id="layui-table-account-flow">

    /*layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function() {
     var laydate = layui.laydate //日期
     , laypage = layui.laypage //分页
     , layer = layui.layer //弹层
     , table = layui.table //表格
     , carousel = layui.carousel //轮播
     , upload = layui.upload //上传
     , element = layui.element //元素操作
     , slider = layui.slider;//滑块
     */
    //向世界问个好
    /*layer.msg('Hello World');

     //监听Tab切换
     element.on('tab(demo)', function (data) {
     layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
     tips: 1
     });
     });
     })*/
    table.on('toolbar(account-flow)', function (obj) {
        var checkStatus = table.checkStatus(obj.config.id)
            , data = checkStatus.data; //获取选中的数据
        var objss = checkStatus.data.obj
        switch (obj.event) {
            case 'add':
                layer.msg('添加');
                break;
            case 'update':
                if (data.length === 0) {
                    layer.msg('请选择一行');
                } else if (data.length > 1) {
                    layer.msg('只能同时编辑一个');
                } else {
                    layer.alert('编辑 [id]：' + checkStatus.data[0].accountId);
                }
                break;
            case 'delete':
                if (data.length === 0) {
                    layer.msg('请选择要删除的数据');
                } else {
                    layer.confirm("您确定要删除吗？", {btn: ['yes', 'no'], title: '提示信息'}, function () {
                        layer.closeAll('dialog');
                        var ids = "";
                        $.each(data, function (i) {
                            ids = ids + data[i].accountId + ',';
                        });
                        $.ajax({
                            type: "post",
                            url: accountUrl + "/delAccount",
                            data: {
                                "ids": ids,
                                'accountType': data[0].accountType
                            },
                            success: function (data) {
                                /*$.each(objs,function (i) {
                                 objs[i].del();
                                 });
                                 objs=[];*/
                                layer.msg("删除成功");
                                table.reload("accountFlow")
                            }
                        });
                    })
                }
                break;
        }
    });
    table.on('tool(account-flow)', function (obj) {
        var data = obj.data //获得当前行数据
            , layEvent = obj.event; //获得 lay-event 对应的值
        if (layEvent === 'seeDetails') {
            seeDetails(obj.data.accountId, obj.data.accountType)
        } else if (layEvent === 'delete') {
            layer.confirm("您确定要删除吗？", {btn: ['yes', 'no'], title: '提示信息'}, function () {
                layer.closeAll('dialog');
                $.ajax({
                    type: "post",
                    url: accountUrl + "/delAccount",
                    data: {
                        "ids": obj.data.accountId,
                        'accountType': obj.data.accountType
                    },
                    success: function (data) {
                        obj.del();
                        layer.msg("删除成功")
                    }
                });
            })
        } else if (layEvent === 'edit') {
            layer.msg('编辑操作');
        }
    });
    table.on('checkbox(account-flow)', function (obj) {
        var data = obj.data;
        if (obj.checked == true) {
            objs.push(obj)
        } else {
            $.each(objs, function (j) {
                if (data.accountId == objs[j].data.accountId) {
                    objs.pop(j);
                    return;
                }
            })
        }
        layer.msg("xuanzhong")
    })


    var showQueryAccountFlow = function () {
        /*货物清单*/
        var table = layui.table;
        var laypage = layui.laypage;
        table.render({
            id: "account-flow",
            elem: "#account-flow-table",
            url: accountUrl + "/queryAccountFlow",
            method: "post",
            toolbar: 'default',
            height: 620,
            cols: [[ //表头
                {field: '', type: 'checkbox', fixed: 'left'},
                {
                    field: '', title: '序号', width: 60, templet: function (d) {
                    return d.LAY_INDEX;
                }
                }
                , {field: 'goodsId', title: 'ID', width: 0, hide: true}
                , {field: 'accountType', title: '流水类型', width: 100,align:"center",templet:function(d){
                    if(d.accountType==1||d.accountType=="1"){
                        return "入库"
                    }else if (d.accountType==1||d.accountType=="1"){
                        return "出库"
                    }else{
                        return "未知"
                    }
                }}
                , {field: 'accountBh', title: '账单编号', width: 150, sort: true}
                , {field: 'accountName', title: '账单名', width: 180, sort: true}
                , {field: 'tradeTarget', title: '交易对象', width: 120, sort: true}
                , {field: 'contactPerson', title: '联系人', width: 100}
                , {field: 'goodsName', title: '货物名', width: 200, sort: true}
                , {field: 'goodsUnit', title: '单位', width: 80}
                , {field: 'tradeNumber', title: '数量', width: 80}
                , {field: 'tradePrice', title: '交易价格', width: 100, sort: true}
                ,{field: 'goodsBrand', title: '品牌', width: 110}
                , {
                    field: 'createTime', title: '发生时间', width: 120, sort: true, templet: function (d) {
                        return timeFomatter(d.createTime, "yyMMdd")
                    }
                }
                , {fixed: 'right', title: "操作", align: 'center', toolbar: '#tool-bar-details'}
            ]],

            page: true,
            limit: 12,
            limits: [10, 30, 50],
            title: "货物清单"
        })
    }
</script>