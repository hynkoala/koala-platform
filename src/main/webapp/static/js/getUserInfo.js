/**
 * Created by hyn on 8/15 0015.
 */

window.onload = function () {
    var userName = '${JSONObject.userName}';
    var usertruename = '${JSONObject.userTrueName}';
    var email = '${JSONObject.userEmail}';
    var phone = '${JSONObject.userPhone}';
    var sex = '${JSONObject.userSex}';
    var age = '${JSONObject.userAge}';
    document.getElementById("user-name").value = userName;
    document.getElementById("user-true-name").value = usertruename;
    document.getElementById("email").value = email;
    document.getElementById("phone").value = phone;
    document.getElementById("sex").value = sex;
    document.getElementById("age").value = age;
    //document.getElementById("myspace").href="/koala-platform/user/toMyspace?userName"+userName;
    //document.getElementById("to-home").href="/koala-platform/view/home.ftl";

};



