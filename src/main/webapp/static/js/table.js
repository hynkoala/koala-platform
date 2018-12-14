/**
 * Created by 12732 on 12/2 0002.
 */

function initTableList(n, modelId, tableId) {
    /*获取行模板*/
    var model;
    if (!thisIsNull(modelId)) {
        model = $("#" + modelId);
    } else {
        model = $(".list-model");
    }

    if (thisIsNull(model) || model.length > 1) {
        return false;
    }

    var inner = model.children();
    /*获取table对象*/
    var table;
    if (!thisIsNull(tableId)) {
        table = $("#" + tableId);
    } else {
        table = $(".list-body");
    }
    if (thisIsNull(table) || table.length > 1) {
        return false;
    }
    /*插入行*/
    for (var i = 1; i <= n; i++) {
        inner.clone().appendTo(table);
    }
    /*设置行的鼠标移上去和移除事件*/
    $(".list-item").mouseover(function () {
        $(this).css({
            "opacity": "0.8"
        })
    })

    $(".list-item").mouseout(function () {
        $(this).css({
            "opacity": "1"
        })
    })
}
$(function () {
    /*页面初始化设置的最小高度*/
    $(".list-table").css({
        "width": $(this).parent().innerWidth()
    })
});

