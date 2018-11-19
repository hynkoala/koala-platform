/**
 * Created by user on 2018/10/9.
 */
var grid_selector = "#grid-table";
var pager_selector = "#grid-pager";
var select_users;
$(function () {
    $(grid_selector)
        .jqGrid(
            {
                url: "/koala-platform/user/getUserInfo",
                mtype: 'post',
                datatype: "json",
                height: '600px',
                colNames: ["id", "用户名", '真实名', '电话', '邮箱', '性别', '年龄', '注册时间', '最近修改时间', '最近登陆时间', '管理员'],
                colModel: [
                    {
                        name: 'userId',
                        index: 'userId',
                        width: '0px',
                        heigth: '50px',
                        sortable: false,
                        key: true,
                        hidden: true
                    },
                    {
                        name: 'userName',
                        index: 'userName',
                        width: '10%',
                        heigth: '50px',
                        sortable: false,
                        formatter: editLink
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
                        sortable: false,
                        formatter: formatSex
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
                        sortable: false,
                        formatter: "date",
                        formatoptions: {srcformat: 'u/1000', newformat: 'Y-m-d'}
                    },
                    {
                        name: 'lastUpdateTime',
                        index: 'lastUpdateTime',
                        width: '10%',
                        sortable: false,
                        formatter: "date",
                        formatoptions: {srcformat: 'u/1000', newformat: 'Y-m-d'}
                    },
                    {
                        name: 'lastLoginTime',
                        index: 'lastLoginTime',
                        width: '10%',
                        sortable: false,
                        formatter: "date",
                        formatoptions: {srcformat: 'u/1000', newformat: 'Y-m-d'}
                    },
                    {
                        name: 'adminType',
                        index: 'adminType',
                        width: '5%',
                        sortable: false,
                        cellattr: addCellAttr,
                        formatter: formatAdmin
                    }
                ],
                viewrecords: true,//定义是否要显示总记录数
                loadui: "enable",
                loadonce: true,//不配置始终只显示页面显示的数据，无法显示隐藏的后面的数据，导致无法翻页
                multiselect: true,//不配置不会显示复选框
                //multiboxonly: true,
                //viewrecords: true,
                rowNum: 10,
                rowList: [5, 10, 20],
                //pgbuttons: true,
                pager: pager_selector,
                // pagerpos: "left",
                //altRows: true,
                rownumbers: true,
                rownumWidth: 50,
                //editurl: "", //nothing is saved
                caption: "",
                autowidth: true,
                beforeSelectRow: function (rowid, e) {
                    var $myGrid = $(this);
                    var i = $.jgrid.getCellIndex($(e.target).closest('td')[0]);
                    var cm = $myGrid.jqGrid('getGridParam', 'colModel');
                    // cb列为复选框（multiselect : true时生效）, 复选框列和no列不屏蔽单击选中行事件，其他列屏蔽单击事件
                    //return (cm[i].name === 'qlrmc' || cm[i].name === "qlrzjh");
                    return (cm[i].name === 'cb');
                }

                ,
                //beforeSelectRow: function(rowid, e) { return true; },
                onSelectRow: function (id) {
                    if (id) {
                        //window.open();
                    }
                }
            });
    $(grid_selector).jqGrid('navGrid', pager_selector, {edit: false, add: false, del: false});
});
function formatTime(cellvalue) {
    if (cellvalue) {
        return new Date(cellvalue).toLocaleString().replace(/\/|年|月/g, "-").replace(/日/g, " ").replace(/下午|上午/g, "");
    } else {
        return '';
    }
}
function formatSex(cellvalue) {
    if (cellvalue == 1) {
        return "男";
    }
    else if (cellvalue == 2) {
        return "女";
    }
    else {
        return '';
    }

}
function formatAdmin(cellvalue) {
    if (cellvalue == 1) {
        return "普通";
    }
    else if (cellvalue == 2) {
        return "超级";
    }
    else {
        return "否";
    }
}
function editLink(cellValue, options, rowdata, action) {
    var str = rowdata.userName;
    return "<a href=# onclick=seeCorrectUser('" + str + "')>" + rowdata.userName + "</a>";
}
function addCellAttr(rowId, val, rawObject, cm, rdata) {
    return "style='color:orange'"
}

function muldelete() {
    var ids = $(grid_selector).jqGrid('getGridParam', 'selarrrow');
    var adminType;
    for (i = 0; i < ids.length; i++) {
        adminType = $(grid_selector).getRowData(ids[i]).adminType;
        if (adminType == '2') {
            alert("存在不可被删除的用户！");
            return;
        }
    }
    var userIds = ids.toString();
    $.ajax({
        type: 'post',
        url: "/koala-platform/user/deleteUser",
        data: {userIds: userIds},
        traditional: true,
        success: function (data0) {
            alert("删除成功！");
            refreshtable();
        }
    })
}
function refreshtable(data) {
    $("#grid-table").setGridParam({
        url: "/koala-platform/user/getUserInfo",
        datatype: 'json',
        page: 1,
        postData: data,
    });
    $("#grid-table").trigger("reloadGrid");
}
function queryUser() {
    var userName = $("#user-name").val();
    var data = {userName: userName};
    refreshtable(data);
}
function seeCorrectUser(str) {
    //var dqqlrid = qlrid.toString();
    var url = '/koala-platform/view/jsp/userDetailInfo.jsp?userName=' + str;
    window.open(url, window, "width=500px,height=450px,toolbar=no, menubar=no, scrollbars=no, resizable=yes,location=no, status=no");
}
function toPrint() {
    select_users = getSelectData();
    url = "/koala-platform/view/jsp/userPrint.jsp";
    window.open(url, '打印');
}
function getSelectData() {
    var ids = $(grid_selector).jqGrid('getGridParam', 'selarrrow');
    var users = [];
    for (i = 0; i < ids.length; i++) {
        users[i] = $(grid_selector).jqGrid('getRowData', ids[i]);
    }
    return users;
}


