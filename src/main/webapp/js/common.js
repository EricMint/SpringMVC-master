function ajaxPostHtml(url, data, successCallBack, errorCallBack) {
    addMask();
    $.ajax({
        url: url,
        type: "POST",
        dataType: "html",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function (result) {
            removeMask();
            if (successCallBack && typeof successCallBack == "function")
                successCallBack(result);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            removeMask();
            if (jqXHR.status == 401) {
                statusCode401();
            }
            else if (jqXHR.status == 403) {
                statusCode403();
            }
            else if (errorCallBack && typeof errorCallBack == "function")
                errorCallBack(jqXHR, textStatus, errorThrown);
            else {
                //$.tip.error("操作失败");
            }
            if (console && console.log) {
                console.log(jqXHR.responseText);
            }
            //alert((jqXHR.responseText));
        }
    });
}

function ajaxPostJsonForTest(url, data, successCallBack, errorCallBack) {
    addMask();

    $.ajax({
        url: url,
        type: "POST",
        dataType: "json",
        contentType: "application/json",
        data: data,
        success: function (result) {
            removeMask();
            if (successCallBack && typeof successCallBack == "function")
                successCallBack(result);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            removeMask();
            if (jqXHR.status == 401) {
                statusCode401();
            }
            else if (jqXHR.status == 403) {
                statusCode403();
            }
            else if (errorCallBack && typeof errorCallBack == "function")
                errorCallBack(jqXHR, textStatus, errorThrown);
            else {
                //$.tip.error("操作失败");
            }
            if (console && console.log) {
                console.log(jqXHR.responseText);
            }
            //alert((jqXHR.responseText));

        }
    });
}

function ajaxPostJson(url, data, successCallBack, errorCallBack) {
    addMask();

    $.ajax({
        url: url,
        type: "POST",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function (result) {
            removeMask();
            if (successCallBack && typeof successCallBack == "function")
                successCallBack(result);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            removeMask();
            if (jqXHR.status == 401) {
                statusCode401();
            }
            else if (jqXHR.status == 403) {
                statusCode403();
            }
            else if (errorCallBack && typeof errorCallBack == "function")
                errorCallBack(jqXHR, textStatus, errorThrown);
            else {
                //$.tip.error("操作失败");
            }
            if (console && console.log) {
                console.log(jqXHR.responseText);
            }
            //alert((jqXHR.responseText));

        }
    });
}

function ajaxPostForm(url, data, successCallBack, errorCallBack) {
    addMask();

    $.ajax({
        url: url,
        type: "POST",
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        processData: false,
        data: data,
        success: function (result) {
            removeMask();
            if (successCallBack && typeof successCallBack == "function")
                successCallBack(result);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            removeMask();
            if (jqXHR.status == 401) {
                statusCode401();
            }
            else if (jqXHR.status == 403) {
                statusCode403();
            }
            else if (errorCallBack && typeof errorCallBack == "function")
                errorCallBack(jqXHR, textStatus, errorThrown);
            else {
                //$.tip.error("操作失败");
            }
            if (console && console.log) {
                console.log(jqXHR.responseText);
            }
            //alert((jqXHR.responseText));

        }
    });
}
function ajaxGetHtml(url, successCallBack, errorCallBack) {
    addMask();
    $.ajax({
        url: url,
        type: "GET",
        async: true,
        cache: false,
        dataType: "html",
        contentType: "application/xhtml+xml; charset=utf-8",
        success: function (result) {
            removeMask();
            if (successCallBack && typeof successCallBack == "function")
                successCallBack(result);
        },
        error: function (jqXHR) {
            removeMask();
            if (jqXHR.status == 401) {
                statusCode401();
            }
            else if (jqXHR.status == 403) {
                statusCode403();
            }
            else if (errorCallBack && errorCallBack == "function") {
                errorCallBack(jqXHR);
            }
            //$.tip.error("加载失败");
            if (console && console.log) {
                console.log(jqXHR.responseText);
            }
            //alert((jqXHR.responseText));

        }
    });
}

function ajaxGetPartHtml(containerName, url, successCallBack, errorCallBack) {
    addPartMask(containerName);
    $.ajax({
        url: url,
        type: "GET",
        async: true,
        cache: false,
        dataType: "html",
        contentType: "application/xhtml+xml; charset=utf-8",
        success: function (result) {
            removePartMask(containerName);
            if (successCallBack && typeof successCallBack == "function")
                successCallBack(result);
        },
        error: function (jqXHR) {
            removePartMask(containerName);
            if (jqXHR.status == 401) {
                statusCode401();
            }
            else if (jqXHR.status == 403) {
                statusCode403();
            }
            else if (errorCallBack && errorCallBack == "function") {
                errorCallBack(jqXHR);
            }
            //$.tip.error("加载失败");
            if (console && console.log) {
                console.log(jqXHR.responseText);
            }
            //alert((jqXHR.responseText));

        }
    });
}

function ajaxGetJson(url, successCallBack, errorCallBack) {
    addMask();
    $.ajax({
        url: url,
        type: "GET",
        cache: false,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (result) {
            removeMask();
            if (successCallBack && typeof successCallBack == "function")
                successCallBack(result);
        },
        error: function (jqXHR) {
            removeMask();
            if (jqXHR.status == 401) {
                statusCode401();
            }
            else if (jqXHR.status == 403) {
                statusCode403();
            }
            else if (errorCallBack && errorCallBack == "function") {
                errorCallBack(jqXHR);
            }
            //$.tip.error("加载失败");
            if (console && console.log) {
                console.log(jqXHR.responseText);
            }
            //alert((jqXHR.responseText));

        }
    });
}

function statusCode401() {
    //$.tip.error("您未登陆，或登陆已超时，需重新登陆！");
}

function statusCode403() {
    //$.tip.error("您登陆时未被授予权限，如已授权，请尝试重新登陆。");
}

function removeMask() {
    $('.modal-backdrop.loading').remove();
    $('.save-loading-wrap').remove();
}

function addMask() {
    var saveLoading = "<div class='modal-backdrop loading in'></div>"
        + "<div class='save-loading-wrap'>"
        + "<div class='sk-spinner sk-spinner-fading-circle save-loading'>"
        + "<div class='sk-circle1 sk-circle'></div>"
        + "<div class='sk-circle2 sk-circle'></div>"
        + "<div class='sk-circle3 sk-circle'></div>"
        + "<div class='sk-circle4 sk-circle'></div>"
        + "<div class='sk-circle5 sk-circle'></div>"
        + "<div class='sk-circle6 sk-circle'></div>"
        + "<div class='sk-circle7 sk-circle'></div>"
        + "<div class='sk-circle8 sk-circle'></div>"
        + "<div class='sk-circle9 sk-circle'></div>"
        + "<div class='sk-circle10 sk-circle'></div>"
        + "<div class='sk-circle11 sk-circle'></div>"
        + "<div class='sk-circle12 sk-circle'></div>"
        + "</div>"
        + "<span>加载中...</span>"
        + "</div>";
    if ($(".modal-backdrop.loading").length == 0) {
        $("#page-wrapper").append(saveLoading);
    }
}

function removePartMask(containerName) {
    $('.modal-' + containerName).remove();
    $('.loading-wrap-' + containerName).remove();
}

function addPartMask(containerName) {
    var saveLoading = "<div class='modal-backdrop loading modal-" + containerName + "'></div>"
        + "<div class='save-loading-wrap loading-wrap-" + containerName + "'>"
        + "<div class='sk-spinner sk-spinner-fading-circle save-loading'>"
        + "<div class='sk-circle1 sk-circle'></div>"
        + "<div class='sk-circle2 sk-circle'></div>"
        + "<div class='sk-circle3 sk-circle'></div>"
        + "<div class='sk-circle4 sk-circle'></div>"
        + "<div class='sk-circle5 sk-circle'></div>"
        + "<div class='sk-circle6 sk-circle'></div>"
        + "<div class='sk-circle7 sk-circle'></div>"
        + "<div class='sk-circle8 sk-circle'></div>"
        + "<div class='sk-circle9 sk-circle'></div>"
        + "<div class='sk-circle10 sk-circle'></div>"
        + "<div class='sk-circle11 sk-circle'></div>"
        + "<div class='sk-circle12 sk-circle'></div>"
        + "</div>"
        + "<span>加载中...</span>"
        + "</div>";
    if ($('.modal-' + containerName).length == 0) {
        $("#" + containerName).append(saveLoading);
    }
}

function showModal(element, title, ajaxUrl, callBack, data, ajaxCallBack) {
    if (!element) {
        console.log("元素不存在");
        return;
    }
    if (!ajaxUrl) {
        console.log("ajax url不存在");
        return;
    }
    $(element).modal();
    $(element).find(".modal-title").text(title);
    if (data) {
        $(element).data("data", data);
    }
    //弹出窗点击确认的回调函数
    bindModalCallBack(element, callBack);
    ajaxGetHtml(ajaxUrl, function (data) {
        if (data) {
            $(element).find(".modal-body").replaceWith(data);
            if (typeof ajaxCallBack === "function") {
                ajaxCallBack();
                initTabsReset();
            }
        }
    });
}

function bindModalCallBack(element, callBack) {
    var $checkBtn = $(element).find("[name='confirm']")
    $checkBtn.off("click");
    if (callBack) {
        $checkBtn.on("click", callBack);
    }
}

function setModalData(element, data) {
    $(element).data("data", data);
}

function getModalData(element) {
    var data = $(element).data("data");
    if (!data) {
        console.info("获取不到modal data")
    }
    return $(element).data("data");
}

function showModalWithData(element, data, callBack) {
    $(element).modal();
    $(element).data("data", data);
    bindModalCallBack(element, callBack);
}

function showAjaxInfo(result, element) {
    if (result.status) {
        if (result.msg) {
            swal({
                title: "保存成功",
                text: result.msg
            });
        } else {
            swal({
                showConfirmButton: false,
                title: "保存成功",
                text: "",
                timer: 1000
            });
        }
        if (element) {
            $(element).modal("hide");
        }
    } else {
        swal({
            title: "保存失败",
            text: result.msg || ""
        });
    }
}

function hasPhoto(form) {
    var photos = getPhotoMap(form, null, null);
    return (photos.length > 0);
}

function validateForm(form) {
    return $(form).valid();
}

function validatePhoto(form) {
    if (!hasPhoto(form)) {
        $(form).parent("div.dropzone-wrap").next(".error").removeClass("hide");
        return false;
    }
    $(form).parent("div.dropzone-wrap").next(".error").addClass("hide");
    return true;
}

function validateFormWithPhoto(form, photoForm) {
    return $(form).valid() && validatePhoto(photoForm);
}

//键为url，值为图片名
function addPhoto(element, key, value) {
    var oldMap = $(element).data("photoMap");
    if (!oldMap) {
        oldMap = {};
    }
    oldMap[key] = value;
    $(element).data("photoMap", oldMap);
}

function removePhoto(element, key) {
    var oldMap = $(element).data("photoMap");
    if (oldMap) {
        delete oldMap[key];
    }
}

function removePhotoMap(element) {
    $(element).removeData("photoMap");
}

function findCustomerId() {
    return $("#project-customer-id").val();
}

function getPhotoMap(element, isPublic, referId, stageTemplateId, processTemplateId) {
    var photoList = $(element).data("photoMap");
    var request = [];
    if (photoList) {
        for (var p in photoList) {
            var photo = {};
            photo["customer-id"] = findCustomerId();
            photo["photo-name"] = photoList[p];
            photo["photo-url"] = p;
            photo["is-public"] = isPublic;
            photo["refer-id"] = referId;
            photo["stage-template-id"] = stageTemplateId || 0;
            photo["process-template-id"] = processTemplateId || 0;
            request.push(photo);
        }
    }
    return request;
}

function bindPhotoConfig(photoForm) {
    $(photoForm).blsDropzone({
        url: $(photoForm).data('url'),
        limitOnlyOneFile: false,
        autoProcessQueue: true,
        fn_success: function (result, dzthis) {
            console.info(result.xhr.responseText);
            var res = eval('(' + result.xhr.responseText + ')');
            if (res.fileList.length > 0) {
                addPhoto(photoForm, res.fileList[0].fileID, res.fileList[0].originName);
                if ($('#attachmentSize').val() != undefined)
                    $('#attachmentSize').val(res.fileList[0].size);
                // 移除错误提示
                $(photoForm).parent("div.dropzone-wrap").next("label.error").addClass("hide");
            }
        },
        fn_removedfile: function (file, dzthis) {
            if (file.xhr) {
                var res = eval('(' + file.xhr.responseText + ')');
                if (res.fileList.length > 0) {
                    removePhoto(photoForm, res.fileList[0].fileID);
                }
            }
        }
    });
}

$(function () {
    testAddDeletePhoto();
});

function testAddDeletePhoto() {
    var $element = $('<div></div>');
    addPhoto($element, "key1", "value1");
    var request = getPhotoMap($element, 1, 1);
    if (request.length != 1 || request[0]["photo-url"] != "key1") {
        alert("test add photo error!");
    }
    removePhoto($element, "key1");
    request = getPhotoMap($element, 1, 1);
    if (request.length != 0) {
        alert("test remove photo error!");
    }
    removePhotoMap($element);
    var data = $element.data("photoMap");
    if (data !== undefined) {
        alert("remove photo map error!");
    }
}

function swalClose() {
    $(".sweet-overlay").hide();
    $(".sweet-alert").removeClass("visible");
    $(".sweet-alert").hide();
    $("body").removeClass("stop-scrolling");
}

function isFloat(value) {
    return /^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$/.test(value) || /^[1-9]\d*|0$/.test(value);
}

function promptMessage(message, type) {
    $.erpTips({message: message, positionClass: "toast-top-right", messageType: type});
}

function syncPostJson(url, data, successCallBack, errorCallBack) {
    addMask();

    $.ajax({
        url: url,
        type: "POST",
        async: false,
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(data),
        success: function (result) {
            removeMask();
            if (successCallBack && typeof successCallBack == "function")
                successCallBack(result);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            removeMask();
            if (jqXHR.status == 401) {
                statusCode401();
            }
            else if (jqXHR.status == 403) {
                statusCode403();
            }
            else if (errorCallBack && typeof errorCallBack == "function")
                errorCallBack(jqXHR, textStatus, errorThrown);
            else {
                //$.tip.error("操作失败");
            }
            if (console && console.log) {
                console.log(jqXHR.responseText);
            }
            //alert((jqXHR.responseText));

        }
    });
}

function moneyPayableFreeze(phase, customerId) {
    swal({
        title: "确认要进行担保款冻结操作？",
        type: "info",
        showCancelButton: true,
        cancelButtonText: "取消",
        confirmButtonText: "确认"
    }, function () {
        $.ajax({
                url: siteContext.baseUrl + "money-payable/freeze/" + customerId + "/" + phase,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    swal({
                        title: result.title,
                        text: result.msg,
                        type: "info",
                        showCancelButton: false,
                        confirmButtonText: "知道了"
                    }, function () {
                        window.location.href = window.location.href;
                    });
                },
                error: function () {
                    window.location.href = window.location.href;
                }
            }
        );
    });
}

function moneyPayableUnfreeze(phase, customerId) {
    swal({
        title: "确认要进行担保款解冻操作？",
        type: "info",
        showCancelButton: true,
        cancelButtonText: "取消",
        confirmButtonText: "确认"
    }, function () {
        $.ajax({
                url: siteContext.baseUrl + "money-payable/unfreeze/" + customerId + "/" + phase,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    swal({
                        title: result.title,
                        text: result.msg,
                        type: "info",
                        showCancelButton: false,
                        confirmButtonText: "知道了"
                    }, function () {
                        window.location.href = window.location.href;
                    });
                },
                error: function () {
                    window.location.href = window.location.href;
                }
            }
        );
    });
}