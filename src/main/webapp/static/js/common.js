/**
 * Created by user on 2018/9/25.
 */
/*页面初始化方法*/
var userName = getVarByUrl("userName");
var homeUrl = "/koala-platform";
var platformUrl = "/koala-platform";
var accountUrl = "/koala-platform/account";
var goodsUrl = "/koala-platform/goods";
var queryUrl = "/koala-platform/query";
// eChart路径配置
require.config({
    paths: {
        //echarts: 'http://echarts.baidu.com/build/dist'
        echarts: platformUrl+'/static/thirdControl/eChart/build/dist'

    }
});
var table = layui.table;
$(function () {
    /*页面初始化设置的最小高度*/
    resetFrameCss(1900, 680);
    $(":checkbox").click(function () {
        if($(this)[0].checked == true){
            $(this).val("1");
        }else {
            $(this).val("0");
        }
    })
    initCheckBox();
    document.onmousedown=function () {
        var existShow;
        $.each($(".dropdown-ul"),function (i) {
            //if($($(".dropdown-ul")[i]))
        })
        setTimeout(function () {
            $(".dropdown-ul").hide()
        },200)
    }
});
/*窗口变化时调整*/
$(window).resize(function () {
    resetFrameCss(1900, 680);
});

function makeBlockTime(message, time) {
    if (thisIsNull(message)) {
        message = 'loading...';
    }
    if (thisIsNull(time)) {
        time = 300;
    }
    $.blockUI({message: "<h4>" + message + "</h4>"});
    setTimeout($.unblockUI, time);
}

function getVarByUrl(str) {
    var result;
    var url = location.search;
    var theRequest = {};
    if (url.indexOf("?") != -1) {
        var urlstr = url.substr(1);
        var strs = urlstr.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    result = theRequest[str];
    return result;
}
function dateFormatter(fmt, date) {
    var o = {
        "M+": date.getMonth() + 1,                 //月份
        "d+": date.getDate(),                    //日
        "h+": date.getHours(),                   //小时
        "m+": date.getMinutes(),                 //分
        "s+": date.getSeconds(),                 //秒
        "q+": Math.floor((date.getMonth() + 3) / 3), //季度
        "S": date.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
/*method
 格式化时间
 */
function timeFomatter(cellvalue, type) {
    if (cellvalue) {
        var time = new Date(cellvalue).toLocaleString().replace(/\/|年|月/g, "-").replace(/日/g, " ").replace(/下午|上午/g, "");
        if (type) {
            var year = time.split("-")[0];
            var yyMMdd = time.split(" ")[0];
            var MMdd = yyMMdd.split("-")[1] + "-" + yyMMdd.split("-")[2];
            var hhmmss = time.split(" ")[1];
            var MMddhhmm = MMdd + " " + hhmmss.split(":")[0] + ":" + hhmmss.split(":")[1];
            var hhmm = hhmmss.split(":")[0] + ":" + hhmmss.split(":")[1];
            var yyMMddhhmm = yyMMdd + " " + hhmm;
            switch (type) {
                case 'yy':
                    return year;
                case 'yyMMdd':
                    return yyMMdd;
                case 'MMdd':
                    return MMdd;
                case 'hhmmss':
                    return hhmmss;
                case 'MMddhhmm':
                    return MMddhhmm;
                case 'hhmm':
                    return hhmm;
                case 'yyMMddhhmm':
                    return time;
                case 'yyMMddhhmmss':
                    return yyMMddhhmm;
                default:
                    return yyMMdd;
            }
        }
        return time;
    } else {
        return null;
    }
}

function getFileName(prefix, suffix) {
    var d = new Date();
    var curYear = d.getYear() + 1900;
    var curMonth = "" + (d.getMonth() + 1);
    var curDate = "" + d.getDate();
    var curHour = "" + d.getHours();
    var curMinute = "" + d.getMinutes();
    var curSecond = "" + d.getSeconds();
    if (curMonth.length == 1) {
        curMonth = "0" + curMonth;
    }
    if (curDate.length == 1) {
        curDate = "0" + curDate;
    }
    if (curHour.length == 1) {
        curHour = "0" + curHour;
    }
    if (curMinute.length == 1) {
        curMinute = "0" + curMinute;
    }
    if (curSecond.length == 1) {
        curSecond = "0" + curSecond;
    }
    var fileName = prefix + "_" + curYear + curMonth + curDate + "_"
        + curHour + curMinute + curSecond + "." + suffix;
    return fileName;
}
function thisIsNull(str) {
    if (str == null || str == '' || str == "" || str == 'undefined' || str.length < 1) {
        return true;
    }
    return false;
}
function getBhFromTime() {
    var d = new Date();
    var curYear = d.getYear() + 1900;
    var curMonth = "" + (d.getMonth() + 1);
    var curDate = "" + d.getDate();
    var curHour = "" + d.getHours();
    var curMinute = "" + d.getMinutes();
    var curSecond = "" + d.getSeconds();
    if (curMonth.length == 1) {
        curMonth = "0" + curMonth;
    }
    if (curDate.length == 1) {
        curDate = "0" + curDate;
    }
    if (curHour.length == 1) {
        curHour = "0" + curHour;
    }
    if (curMinute.length == 1) {
        curMinute = "0" + curMinute;
    }
    if (curSecond.length == 1) {
        curSecond = "0" + curSecond;
    }
    var bh = curYear + curMonth + curDate
        + curHour + curMinute + curSecond;
    return bh;
}
function resetFrameCss(minWidth, minHeigth) {
    if (thisIsNull(minWidth)) {
        minWidth = 1900;
    }
    if (thisIsNull(minHeigth)) {
        minHeigth = 760;
    }
    var winHeight = window.innerHeight;
    var winWidth = window.innerWidth;
    var width = winWidth - 20;
    var height = winHeight;
    var headerHeight = $("#header").outerHeight(true);
    var footerHeight = $("#footer").outerHeight(true);
    var mainContentHeight = $("#main-content").outerHeight(true);
    if (thisIsNull(headerHeight)) {
        headerHeight = 0;
    }
    var height = winHeight - headerHeight - footerHeight;
    if (height < minHeigth) {
        height = minHeigth;
    }
    if (width < minWidth) {
        width = minWidth;
    }
    var currentBodyWidth = $('body').width;
    if (width < currentBodyWidth) {
        width = currentBodyWidth;
    }
    $("#header,#footer").css({
        "min-width": width
    })
    $("#main-content").css({
        "min-height": height,
        "min-width": width
    });
    headerHeight = $("#header").outerHeight(true);
    footerHeight = $("#footer").outerHeight(true);
    mainContentHeight = $("#main-content").outerHeight(true);
    if (winHeight > headerHeight + footerHeight + mainContentHeight) {
        $("#footer").css({
            "bottom": "0",
        })
    }
    $("#footer").show()
}

function makeListFromTable(tableId, rowNums, colNums) {
    var table = $(tableId);
    var returnList = [];
    if (table.length == 1) {
        var listData = table.serializeArray();
        var list = [];
        if (thisIsNull(rowNums)) {
            rowNums = $(tableId + " tbody tr").length;
        }
        if (thisIsNull(colNums)) {
            colNums = listData.length / rowNums;
        }
        var start;
        for (var i = 0; i < rowNums; i++) {
            var row = [];
            start = i * colNums;
            for (var j = 0; j < colNums; j++) {
                row.push(listData[start + j]);
            }
            list.push(row)
        }
        /*将form中name-value形式的值组织为k-value形式*/
        for (var i = 0; i < list.length; i++) {
            var jsonObj = {};
            for (var j = 0; j < list[0].length; j++) {
                jsonObj[list[i][j].name] = list[i][j].value;
            }
            returnList.push(jsonObj);
        }
    }
    return returnList;
}

function initCheckBox() {
    var box = $(":checkbox");
    $.each(box,function (i) {
        if(box[i].value==1){
            box[i].checked=true;
        }
    })
}






