/**
 * Created by 12732 on 12/2 0002.
 */

function initTableList(n, modelId, tableId) {
    /*获取行模板*/
    var model;
    if (!isNullOrNot(modelId)) {
        model = $("#" + modelId);
    } else {
        model = $(".list-model");
    }

    if (isNullOrNot(model) || model.length > 1) {
        return false;
    }

    var inner = model.children();
    /*获取table对象*/
    var table;
    if (!isNullOrNot(tableId)) {
        table = $("#" + tableId);
    } else {
        table = $(".list-body");
    }
    if (isNullOrNot(table) || table.length > 1) {
        return false;
    }
    /*插入行*/
    for (var i = 1; i <= n; i++) {
        inner.clone().appendTo(table);
    }
}
$(function () {
    /*页面初始化设置的最小高度*/
    $(".list-table").css({
        "width": $(this).parent().innerWidth()
    })
    $(".list-item").mouseover(function () {
        $(this).css({
            "background-color": "yellow"
        })
    })

    $(".list-item").mouseout(function () {
        $(this).css({
            "background-color": "inherit"
        })
    })
});

