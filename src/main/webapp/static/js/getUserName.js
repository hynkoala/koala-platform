/**
 * Created by user on 2018/8/24.
 */
function getUsername(){
 var url = location.search;
    var theRequest = {};
 if (url.indexOf("?") != -1) {
 var str = url.substr(1);
 strs = str.split("&");
 for(var i = 0; i < strs.length; i ++) {
 theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
 }
 }
    return theRequest.userName;
 }
window.onload = function(){
    userName = getUsername();
    document.getElementById("to-home").href = "/koala-platform/user/toHome?userName=" + userName;
    document.getElementById("to-myspace").href = "/koala-platform/user/toMyspace?userName=" + userName;
    document.getElementById("user-name").innerHTML = userName;
};