var photos;
var choosePhotos = [];
function uploadPhoto() {
    var photoComment = $("#photo-comment").val();
    var data = new FormData();
    if ($("#input-photo")[0].files.length < 1) {
        alert("请先选择图片");
        return;
    }
    data.append('file', $("#input-photo")[0].files);
    var url = homeUrl + "/album/uploadPhoto?userName=" + userName + "&photoComment=" + photoComment;
    photos = data;
    data = {photos: photos};
    $.ajaxFileUpload({
        url: url,
        type: "post",
        fileElementId: "input-photo",
        dataType: "text",
        success: function (data) {
            alert(data);
            window.location.reload();
        },
        error: function (e) {
            alert("error:" + e);
        }
    })
}
function showPhoto(showNumber, usage) {
    var url = homeUrl + "/album/queryPhoto";
    var path = "../../static/album/";
    $.ajax({
        url: url,
        type: "post",
        success: function (data) {
            if (data.length < showNumber || showNumber == null || showNumber == "") {
                showNumber = data.length;
            }
            var innerHtmlStr = "";
            for (var i = 0; i < showNumber; i++) {
                if (data[i].photoComment != null) {
                    innerHtmlStr = innerHtmlStr + '<img class="photo-img" id="' + data[i].photoId + '" src="' + path + data[i].photoNewName + '" title="' + data[i].photoComment + '"/>';
                } else {
                    innerHtmlStr = innerHtmlStr + '<img class="photo-img" id="' + data[i].photoId + '" src="' + path + data[i].photoNewName + '"/>';
                }
            }
            document.getElementById("see-photo").innerHTML = innerHtmlStr;
            if (usage == "onlyShow") {
                var imgs = document.getElementsByClassName("photo-img");
                for (var i = 0; i < imgs.length; i++) {
                    imgs[i].onclick = "";
                }
            } else if (usage == "download") {
                var imgs = document.getElementsByClassName("photo-img");
                for (var i = 0; i < imgs.length; i++) {
                    imgs[i].onclick = function () {
                        seeRaw(this);
                    }
                    var img = $("#" + imgs[i].id);
                    img.mouseover(function () {
                        this.style.opacity = 0.6;
                        this.title = "查看";
                    });
                    img.mouseout(function () {
                        this.style.opacity = 1;
                    })
                }
            } else if (usage == "manager") {
                var imgs = document.getElementsByClassName("photo-img");
                for (var i = 0; i < imgs.length; i++) {
                    imgs[i].onclick = function () {
                        choosePhoto(this);
                    }
                }
            }
        }
    })
}
function seeRaw(img) {
    //var rawPath = "file://E://photo//";
    var photoId = img.id;
    var imgUrl = homeUrl + "/static/album/raw/" + photoId + ".jpg";
    window.open(imgUrl);
    /*if(img.alt!="chosen"){
     img.style.opacity = 0.2;

     /!*var child=$("#download-button")[0];
     img.appendChild(child);
     child.hidden=false;
     img.alt="chosen"*!/
     }*/
}
function choosePhoto(img) {
    var photoId = img.id;
    var position = "";
    if (img.alt == "chosen") {
        for (var i = 0; i < choosePhotos.length; i++) {
            if (choosePhotos[i] == photoId) {
                position = i;
                break;
            }
        }
        choosePhotos.splice(position, 1);
        img.style.opacity = 1;
        img.alt = "";
    } else {
        img.style.opacity = 0.2;
        choosePhotos.push(photoId);
        img.alt = "chosen";
    }

}
function clearSelect() {
    choosePhotos = [];
    var imgs = document.getElementsByClassName("photo-img")
    for (var i = 0; i < imgs.length; i++) {
        imgs[i].style.opacity = 1;
        imgs[i].alt = "";
    }
}
function deletePhoto() {
    if (choosePhotos.length == 0) {
        makeBlockTime("请先选择", 300);
        return;
    }
    var url = homeUrl + "/album/deletePhoto";
    var data = {photoIds: choosePhotos.toString()};
    $.ajax({
        url: url,
        data: data,
        postType: "post",
        success: function (data) {
            if (data != "success") {
                makeBlockTime(data, 300);
            } else {
                refreshWindow();
            }
        },
        error: function () {
            makeBlockTime("未知错误！", 300);
        }

    })
}