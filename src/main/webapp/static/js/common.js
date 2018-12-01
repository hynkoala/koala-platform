/**
 * Created by user on 2018/9/25.
 */
/*页面初始化方法*/
$(function () {
    /*页面初始化设置的最小高度*/
    resetFrameCss();
    /*table的宽度设置为它父元素的内宽度*/
    $(".list-table").css({
        "width": $(".list-table").parent().innerWidth()
    })


    $("#footer").show()
});
/*窗口变化时调整*/
$(window).resize(function () {
    resetFrameCss();
});
var userName = getUserNameByUrl();
var homeUrl = "/koala-platform";
var platformUrl = "/koala-platform";
var accountUrl = "/koala-platform/account";
var goodsUrl = "/koala-platform/goods";

function toRegister() {
    window.location.href = "/koala-platform/view/jsp/register.jsp";
}
function toLogin() {
    window.location.href = "/koala-platform/view/jsp/login.jsp";
}
function exitLogin() {
    $.blockUI({message: "<h4>" + "记得再回来噢" + "</h4>"});
    setTimeout($.unblockUI, 1000);
    window.location.href = "/koala-platform/view/jsp/login.jsp";
}
function makeBlockTime(message, time) {
    if (isNullOrNot(time)) {
        time = 300;
    }
    $.blockUI({message: "<h4>" + message + "</h4>"});
    setTimeout($.unblockUI, time);
}
/*刷新页面*/
function refreshWindow() {
    window.location.reload();
}
/*关闭窗口*/
function closeWindow() {
    window.close();
}

function getUserNameByUrl() {
    var url = location.search;
    var theRequest = {};
    var userName;
    if (url.indexOf("?") != -1) {
        var str = url.substr(1);
        strs = str.split("&");
        for (var i = 0; i < strs.length; i++) {
            theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
        }
    }
    userName = theRequest.userName;
    if (userName == "undefined") {
        userName = "guest";
    }
    return userName;
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
                    return yyMMddhhmm;
                default:
                    return yyMMdd;
            }
        }
        return time;
    } else {
        return '';
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
function isNullOrNot(str) {
    if (str == null || str == '' || str == "" || str == 'undefined') {
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
        + curHour + curMinute + curSecond
    return bh;
}
function resetFrameCss() {
    var winHeight = window.innerHeight;
    var winWidth = window.innerWidth;
    var width = winWidth;
    var height = winHeight;
    var headerHeight = $("#header").outerHeight(true);
    var footerHeight = $("#footer").outerHeight(true);
    if (isNullOrNot(headerHeight)) {
        headerHeight = 0;
    }
    var height = winHeight - headerHeight - footerHeight;
    if (winHeight < 680) {
        height = 680;
    }
    if (1 == 1) {
        width = 1440;
    }
    $("#header,#footer").css({
        "min-width": width
    })
    $("#main-content").css({
        "min-height": height,
        "min-width": width
    })
}

/*window.onload=function(){
 var enabled=0;
 var today=new Date();
 var date;
 date=today.getFullYear()+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日";
 //date2=day;
 document.write(date);
 document.write("<span id='clock'></span>");
 var now,hours,minutes,seconds,timeValue;
 function showtime(){
 now=new Date();
 hours=now.getHours();
 minutes=now.getMinutes();
 seconds=now.getSeconds();
 timeValue=(hours>=10)?"":"0";
 timeValue+=hours+":";
 timeValue+=((minutes<10)?"0":"")+minutes+":";
 timeValue+=((seconds<10)?"0":"")+seconds+"";
 clock.innerHTML=timeValue;
 setTimeout("showtime()",1000);
 }
 showtime();
 }*/






