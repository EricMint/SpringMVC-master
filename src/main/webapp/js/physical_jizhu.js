
function physicalJizhuGet() {
    PhysicalJizhuCetujixingGet();
    PhysicalJizhuHuodongduGet();
    PhysicalJizhuTongGet();
    PhysicalJizhuShiyanGet();
}

$("#modifyPhysical").click(function () {
    $("#physical_jizhu_cetujixing_has_symptom").prop('disabled', false);
    $('#physical_jizhu_cetujixing_has_symptom').css('background-color', '#F0F8FF'); // change the background color
    $(".physical_jizhu_cetujixing").prop('disabled', false);
    $(".huodongdu").prop('disabled', false);
    $("input[name*='physical_jizhu_yatong']").prop('disabled', false);
    $("input[name*='physical_jizhu_koujitong']").prop('disabled', false);
    $("select[name='physical-jizhu-shiyan']").prop('disabled', false);
    $("select[name='physical-jizhu-shiyan']").css('background-color', '#F0F8FF');
    $("#savePhysical").show();
});

$("#savePhysical").click(function () {
    $("#physical_jizhu_cetujixing_has_symptom").prop('disabled', true);
    $('#physical_jizhu_cetujixing_has_symptom').css('background-color', '#FFFFFF'); // change the background color
    $(".physical_jizhu_cetujixing").prop('disabled', true);
    $(".huodongdu").prop('disabled', true);
    $("select[name='physical-jizhu-shiyan']").prop('disabled', true);
    $("select[name='physical-jizhu-shiyan']").css('background-color', '#FFFFFF');
    $("#savePhysical").hide();
    PhysicalJizhuCetujixingSave();
    PhysicalJizhuHuodongduSave();
    PhysicalJizhuTongSave();
    PhysicalJizhuShiyanSave();
});

function PhysicalJizhuCetujixingGet() {
    var patientId = $("#patientId").val();
    $.ajax({
            url: "/hospital/patient/physical/jizhu/cetujixing/" + patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/xhtml+xml; charset=utf-8",
            success: function (result) {
                console.log(result);
                var hasSymptom = result.hasSymptom;
                var physical_jizhu_cetujixing_has_symptom = $("#physical_jizhu_cetujixing_has_symptom");
                var physical_jizhu_cetujixing_table = $("#physical_jizhu_cetujixing_table");
                if (hasSymptom) {
                    physical_jizhu_cetujixing_has_symptom.append("<option value=1 selected>有</option>");
                    physical_jizhu_cetujixing_has_symptom.append("<option value=0>无</option>");
                    physical_jizhu_cetujixing_table.show();
                    $("#physical_jizhu_cetujixing_qiantu").val(result.qiantu);
                    $("#physical_jizhu_cetujixing_houtu").val(result.houtu);
                    $("#physical_jizhu_cetujixing_cetu").val(result.cetu);
                } else {
                    physical_jizhu_cetujixing_has_symptom.append("<option value=1>有</option>");
                    physical_jizhu_cetujixing_has_symptom.append("<option value=0 selected>无</option>");
                    physical_jizhu_cetujixing_table.hide();
                }
            },
            error: function () {

            }
        }
    );
};

function PhysicalJizhuCetujixingOnChange(hasSymptom) {
    var physical_jizhu_cetujixing_table = $("#physical_jizhu_cetujixing_table");
    if (hasSymptom == 1) {
        physical_jizhu_cetujixing_table.show();
    } else {
        physical_jizhu_cetujixing_table.hide();
    }
};

function PhysicalJizhuCetujixingSave() {
    var data = {};
    data.patientId = $("#patientId").val();
    data.hasSymptom = $("#physical_jizhu_cetujixing_has_symptom").val();
    data.qiantu = $("#physical_jizhu_cetujixing_qiantu").val();
    data.houtu = $("#physical_jizhu_cetujixing_houtu").val();
    data.cetu = $("#physical_jizhu_cetujixing_cetu").val();
    console.log(data);
    $.ajax({
            url: "/hospital/patient/physical/jizhu/cetujixing",
            type: "post",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (result) {
                console.log(result)
            },
            error: function () {

            }
        }
    );
};

function PhysicalJizhuHuodongduGet() {
    var patientId = $("#patientId").val();
    var positionList = ["颈椎", "胸椎", "腰椎"];
    $.ajax({
            url: "/hospital/patient/physical/jizhu/huodongdu/" + patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/xhtml+xml; charset=utf-8",
            success: function (answerList) {
                console.log(answerList);
                for (var i = 0; i < answerList.length; i++) {
                    var answerElement = answerList[i];
                    if (answerElement.examPosition == "颈椎") {
                        $("#jingzhui_qianqu").val(answerElement.qianqu);
                        $("#jingzhui_houshen").val(answerElement.houshen);
                        $("#jingzhui_zuocewan").val(answerElement.zuocewan);
                        $("#jingzhui_youcewan").val(answerElement.youcewan);
                        $("#jingzhui_zuocexuan").val(answerElement.zuocexuan);
                        $("#jingzhui_youcexuan").val(answerElement.youcexuan);
                    } else if (answerElement.examPosition == "胸椎") {
                        $("#xiongzhui_qianqu").val(answerElement.qianqu);
                        $("#xiongzhui_houshen").val(answerElement.houshen);
                        $("#xiongzhui_zuocewan").val(answerElement.zuocewan);
                        $("#xiongzhui_youcewan").val(answerElement.youcewan);
                        $("#xiongzhui_zuocexuan").val(answerElement.zuocexuan);
                        $("#xiongzhui_youcexuan").val(answerElement.youcexuan);
                    } else if (answerElement.examPosition == "腰椎") {
                        $("#yaozhui_qianqu").val(answerElement.qianqu);
                        $("#yaozhui_houshen").val(answerElement.houshen);
                        $("#yaozhui_zuocewan").val(answerElement.zuocewan);
                        $("#yaozhui_youcewan").val(answerElement.youcewan);
                        $("#yaozhui_zuocexuan").val(answerElement.zuocexuan);
                        $("#yaozhui_youcexuan").val(answerElement.youcexuan);
                    }
                }

            },
            error: function () {

            }
        }
    );
};

function PhysicalJizhuHuodongduSave() {
    var data = {};
    data.patientId = $("#patientId").val();
    var positionList = ["颈椎", "胸椎", "腰椎"];
    for (var i = 0; i < positionList.length; i++) {
        var position = positionList[i];
        data.examPosition = position;
        if (position == "颈椎") {
            data.qianqu = $("#jingzhui_qianqu").val();
            data.houshen = $("#jingzhui_houshen").val();
            data.zuocewan = $("#jingzhui_zuocewan").val();
            data.youcewan = $("#jingzhui_youcewan").val();
            data.zuocexuan = $("#jingzhui_zuocexuan").val();
            data.youcexuan = $("#jingzhui_youcexuan").val();
        } else if (position == "胸椎") {
            data.qianqu = $("#xiongzhui_qianqu").val();
            data.houshen = $("#xiongzhui_houshen").val();
            data.zuocewan = $("#xiongzhui_zuocewan").val();
            data.youcewan = $("#xiongzhui_youcewan").val();
            data.zuocexuan = $("#xiongzhui_zuocexuan").val();
            data.youcexuan = $("#xiongzhui_youcexuan").val();
        } else if (position == "腰椎") {
            data.qianqu = $("#yaozhui_qianqu").val();
            data.houshen = $("#yaozhui_houshen").val();
            data.zuocewan = $("#yaozhui_zuocewan").val();
            data.youcewan = $("#yaozhui_youcewan").val();
            data.zuocexuan = $("#yaozhui_zuocexuan").val();
            data.youcexuan = $("#yaozhui_youcexuan").val();
        }
        $.ajax({
                url: "/hospital/patient/physical/jizhu/huodongdu",
                type: "post",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    console.log(result)
                },
                error: function () {

                }
            }
        );
    }
};

function PhysicalJizhuShiyanGet() {
    var shiyanList = ["压颈试验", "臂丛牵拉试验", "拾物试验", "直腿抬高试验", "股神经牵拉试验"];
    var optionsList = ["阳性", "阴性"];
    var patientId = $("#patientId").val();
    $.ajax({
        url: "/hospital/patient/physical/jizhu/shiyan/" + patientId,
        type: "GET",
        dataType: "json",
        contentType: "application/xhtml+xml; charset=utf-8",
        success: function (answerList) {
            console.log(answerList);
            var answerMap = new Map();
            if (answerList.length > 0) {
                for (var i = 0; i < answerList.length; i++) {
                    var answer = answerList[i];
                    answerMap.set(answer.examName, answer.examResult);
                }
            }
            console.log(answerMap);

            for (var i = 0; i < shiyanList.length; i++) {
                var shiyan = shiyanList[i];
                var answer = answerMap.get(shiyan);
                var node;
                if (shiyan == "压颈试验") {
                    node = $("#physicalJizhuYajingshiyan");
                } else if (shiyan == "臂丛牵拉试验") {
                    node = $("#physicalJizhuBiconglashiyan");
                } else if (shiyan == "拾物试验") {
                    node = $("#physicalJizhuShiwushiyan");
                } else if (shiyan == "直腿抬高试验") {
                    node = $("#physicalJizhuZhituitaigaoshiyan");
                } else if (shiyan == "股神经牵拉试验") {
                    node = $("#physicalJizhuGushenjingqianlashiyan");
                }

                for (var j = 0; j < optionsList.length; j++) {
                    var optionElement = optionsList[j];
                    if (answer && answer == optionElement) {
                        node.append("<option value=" + optionElement + " " + "selected>" + optionElement + "</option>");
                    } else {
                        node.append("<option value=" + optionElement + ">" + optionElement + "</option>");
                    }
                }
            }
        },
        error: function () {
        }
    });
};

function PhysicalJizhuShiyanSave() {
    var shiyanList = ["压颈试验", "臂丛牵拉试验", "拾物试验", "直腿抬高试验", "股神经牵拉试验"];
    var data = {};
    data.patientId = $("#patientId").val();
    for (var i = 0; i < shiyanList.length; i++) {
        var shiyan = shiyanList[i];
        data.examName = shiyan;
        if (shiyan == "压颈试验") {
            data.examResult = $("#physicalJizhuYajingshiyan").val();
        } else if (shiyan == "臂丛牵拉试验") {
            data.examResult = $("#physicalJizhuBiconglashiyan").val();
        } else if (shiyan == "拾物试验") {
            data.examResult = $("#physicalJizhuShiwushiyan").val();
        } else if (shiyan == "直腿抬高试验") {
            data.examResult = $("#physicalJizhuZhituitaigaoshiyan").val();
        } else if (shiyan == "股神经牵拉试验") {
            data.examResult = $("#physicalJizhuGushenjingqianlashiyan").val();
        }
        $.ajax({
                url: "/hospital/patient/physical/jizhu/shiyan",
                type: "post",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    console.log(result)
                },
                error: function () {

                }
            }
        );
    }
};


function PhysicalJizhuTongGet() {
    var tongList = ["压痛", "叩击痛"];
    var optionList4Jingzhui = ["颈1", "颈2", "颈3", "颈4", "颈5", "颈6", "颈7"];
    var optionList4Xiongzhui = ["胸1", "胸2", "胸3", "胸4", "胸5", "胸6", "胸7", "胸8", "胸9", "胸10", "胸11", "胸12"];
    var optionList4Yaozhui = ["腰1", "腰2", "腰3", "腰4", "腰5", "骶椎", "尾椎"];
    var patientId = $("#patientId").val();
    $.ajax({
        url: "/hospital/patient/physical/jizhu/tong/" + patientId,
        type: "GET",
        dataType: "json",
        contentType: "application/xhtml+xml; charset=utf-8",
        success: function (answerList) {
            console.log(answerList);
            var answerMap = new Map();
            if (answerList.length > 0) {
                for (var i = 0; i < answerList.length; i++) {
                    var answer = answerList[i];
                    answerMap.set(answer.examName, answer);
                }
            }
            console.log(answerMap);

            for (var i = 0; i < tongList.length; i++) {
                var tong = tongList[i];
                var answer = answerMap.get(tong);
                var valueMap = new Map();

                if (tong == "压痛") {
                    for (var j = 0; j < optionList4Jingzhui.length; j++) {
                        var option = optionList4Jingzhui[j];
                        var number = j + 1;
                        var id = "physical_jizhu_yatong_jing" + number;
                        valueMap.set(option, id);
                    }
                    for (var j = 0; j < optionList4Xiongzhui.length; j++) {
                        var option = optionList4Xiongzhui[j];
                        var number = j + 1;
                        var id = "physical_jizhu_yatong_xiong" + number;
                        valueMap.set(option, id);
                    }
                    for (var j = 0; j < optionList4Yaozhui.length; j++) {
                        var option = optionList4Yaozhui[j];
                        var number = j + 1;
                        var id = "physical_jizhu_yatong_yao" + number;
                        valueMap.set(option, id);
                    }
                } else if (tong == "叩击痛") {
                    for (var j = 0; j < optionList4Jingzhui.length; j++) {
                        var option = optionList4Jingzhui[j];
                        var number = j + 1;
                        var id = "physical_jizhu_koujitong_jing" + number;
                        valueMap.set(option, id);
                    }
                    for (var j = 0; j < optionList4Xiongzhui.length; j++) {
                        var option = optionList4Xiongzhui[j];
                        var number = j + 1;
                        var id = "physical_jizhu_koujitong_xiong" + number;
                        valueMap.set(option, id);
                    }
                    for (var j = 0; j < optionList4Yaozhui.length; j++) {
                        var option = optionList4Yaozhui[j];
                        var number = j + 1;
                        var id = "physical_jizhu_koujitong_yao" + number;
                        valueMap.set(option, id);
                    }
                }

                if (answer && answer.examJingzhui) {
                    var jingzhui = answer.examJingzhui || "";
                    var array = jingzhui.split(',');
                    for (var j = 0; j < array.length; j++) {
                        var jingzhuiAnswer = array[j];
                        var id = valueMap.get(jingzhuiAnswer);
                        $("#" + id).prop("checked", true);
                    }

                    var xiongzhui = answer.examXiongzhui || "";
                    var array = xiongzhui.split(',');
                    for (var j = 0; j < array.length; j++) {
                        var xiongzhuiAnswer = array[j];
                        var id = valueMap.get(xiongzhuiAnswer);
                        $("#" + id).prop("checked", true);
                    }

                    var yaozhui = answer.examYaozhui || "";
                    var array = yaozhui.split(',');
                    for (var j = 0; j < array.length; j++) {
                        var yaozhuiAnswer = array[j];
                        var id = valueMap.get(yaozhuiAnswer);
                        $("#" + id).prop("checked", true);
                    }
                }
            }
        },
        error: function () {
        }
    });
};

function PhysicalJizhuTongSave() {
    var tongList = ["压痛", "叩击痛"];
    var optionList4Jingzhui = ["颈1", "颈2", "颈3", "颈4", "颈5", "颈6", "颈7"];
    var optionList4Xiongzhui = ["胸1", "胸2", "胸3", "胸4", "胸5", "胸6", "胸7", "胸8", "胸9", "胸10", "胸11", "胸12"];
    var optionList4Yaozhui = ["腰1", "腰2", "腰3", "腰4", "腰5", "骶椎", "尾椎"];
    var data = {};
    data.patientId = $("#patientId").val();
    for (var i = 0; i < tongList.length; i++) {
        var tong = tongList[i];
        data.examName = tong;
        data.examJingzhui = "";
        data.examXiongzhui = "";
        data.examYaozhui = "";
        if (tong == "压痛") {
            for (var j = 0; j < optionList4Jingzhui.length; j++) {
                var optionValue = optionList4Jingzhui[j];
                var number = j + 1;
                var id = "physical_jizhu_yatong_jing" + number;
                var jingzhui = $("#" + id);
                if (jingzhui.is(':checked')) {
                    data.examJingzhui += (optionValue + ",");
                }
            }
            for (var j = 0; j < optionList4Xiongzhui.length; j++) {
                var optionValue = optionList4Xiongzhui[j];
                var number = j + 1;
                var id = "physical_jizhu_yatong_xiong" + number;
                var xiongzhui = $("#" + id);
                if (xiongzhui.is(':checked')) {
                    data.examXiongzhui += (optionValue + ",");
                }
            }
            for (var j = 0; j < optionList4Yaozhui.length; j++) {
                var optionValue = optionList4Yaozhui[j];
                var number = j + 1;
                var id = "physical_jizhu_yatong_yao" + number;
                var yaozhui = $("#" + id);
                if (yaozhui.is(':checked')) {
                    data.examYaozhui += (optionValue + ",");
                }
            }
        } else if (tong == "叩击痛") {
            for (var j = 0; j < optionList4Jingzhui.length; j++) {
                var optionValue = optionList4Jingzhui[j];
                var number = j + 1;
                var id = "physical_jizhu_koujitong_jing" + number;
                var jingzhui = $("#" + id);
                if (jingzhui.is(':checked')) {
                    data.examJingzhui += (optionValue + ",");
                }
            }
            for (var j = 0; j < optionList4Xiongzhui.length; j++) {
                var optionValue = optionList4Xiongzhui[j];
                var number = j + 1;
                var id = "physical_jizhu_koujitong_xiong" + number;
                var xiongzhui = $("#" + id);
                if (xiongzhui.is(':checked')) {
                    data.examXiongzhui += (optionValue + ",");
                }
            }
            for (var j = 0; j < optionList4Yaozhui.length; j++) {
                var optionValue = optionList4Yaozhui[j];
                var number = j + 1;
                var id = "physical_jizhu_koujitong_yao" + number;
                var yaozhui = $("#" + id);
                if (yaozhui.is(':checked')) {
                    data.examXiongzhui += (optionValue + ",");
                }
            }
        }
        $.ajax({
                url: "/hospital/patient/physical/jizhu/tong",
                type: "post",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    console.log(result)
                },
                error: function () {

                }
            }
        );
    }
};
