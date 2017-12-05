function physicalKuanguanjieGet() {
    physicalKuanguanjieJixingGet();
    physicalKuanguanjieYatongGet();
    physicalKuanguanjieButaiGet();
    physicalKuanguanjieHuodongduGet();
    physicalKuanguanjieShiyanGet();
}

$("#modify_physical_kuanguanjie").click(function () {
    $("#physical_kuanguanjie_jixing_has_symptom").prop('disabled', false);
    $('#physical_kuanguanjie_jixing_has_symptom').css('background-color', '#F0F8FF'); // change the background color
    $(".physical_kuanguanjie_jixing").prop('disabled', false);

    $("#physical_kuanguanjie_yatong_has_symptom").prop('disabled', false);
    $('#physical_kuanguanjie_yatong_has_symptom').css('background-color', '#F0F8FF'); // change the background color
    $(".physical_kuanguanjie_yatong").prop('disabled', false);

    $(".physical_kuanguanjie_butai").prop('disabled', false);

    $(".physical_kuanguanjie_huodongdu").prop('disabled', false);

    $("select[name='physical_kuanguanjie_shiyan']").prop('disabled', false);
    $("select[name='physical_kuanguanjie_shiyan']").css('background-color', '#F0F8FF');

    $("#save_physical_kuanguanjie").show();
});

$("#save_physical_kuanguanjie").click(function () {
    $("#physical_kuanguanjie_jixing_has_symptom").prop('disabled', true);
    $('#physical_kuanguanjie_jixing_has_symptom').css('background-color', '#FFFFFF'); // change the background color
    $(".physical_kuanguanjie_jixing").prop('disabled', true);

    $("#physical_kuanguanjie_yatong_has_symptom").prop('disabled', true);
    $('#physical_kuanguanjie_yatong_has_symptom').css('background-color', '#FFFFFF'); // change the background color
    $(".physical_kuanguanjie_yatong").prop('disabled', true);

    $(".physical_kuanguanjie_butai").prop('disabled', true);

    $(".physical_kuanguanjie_huodongdu").prop('disabled', true);

    $("select[name='physical_kuanguanjie_shiyan']").prop('disabled', true);
    $("select[name='physical_kuanguanjie_shiyan']").css('background-color', '#FFFFFF');

    $("#save_physical_kuanguanjie").hide();
    physicalKuanguanjieJixingSave();
    physicalKuanguanjieYatongSave();
    physicalKuanguanjieButaiSave();
    PhysicalKuanguanjieHuodongduSave();
    physicalKuanguanjieShiyanSave();
});

function physicalKuanguanjieButaiGet() {
    var patientId = $("#patientId").val();
    $.ajax({
            url: "/hospital/patient/physical/kuanguanjie/butai/" + patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/xhtml+xml; charset=utf-8",
            success: function (result) {
                console.log(result);
                $("#physical_kuanguanjie_butai").val(result.examResult);

            },
            error: function () {

            }
        }
    );
};

function physicalKuanguanjieButaiSave() {
    var data = {};
    data.patientId = $("#patientId").val();
    data.examResult = $("#physical_kuanguanjie_butai").val();
    console.log(data);
    $.ajax({
            url: "/hospital/patient/physical/kuanguanjie/butai",
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


function physicalKuanguanjieJixingGet() {
    var patientId = $("#patientId").val();
    $.ajax({
            url: "/hospital/patient/physical/kuanguanjie/jixing/" + patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/xhtml+xml; charset=utf-8",
            success: function (result) {
                console.log(result);
                var hasSymptom = result.hasSymptom;
                var physical_kuanguanjie_jixing_has_symptom = $("#physical_kuanguanjie_jixing_has_symptom");
                var physical_kuanguanjie_jixing_table = $("#physical_kuanguanjie_jixing_table");
                if (hasSymptom) {
                    physical_kuanguanjie_jixing_has_symptom.append("<option value=1 selected>有</option>");
                    physical_kuanguanjie_jixing_has_symptom.append("<option value=0>无</option>");
                    physical_kuanguanjie_jixing_table.show();
                    $("#physical_kuanguanjie_jixing_neishou").val(result.neishou);
                    $("#physical_kuanguanjie_jixing_waizhan").val(result.waizhan);
                    $("#physical_kuanguanjie_jixing_xuanzhuan").val(result.xuanzhuan);
                } else {
                    physical_kuanguanjie_jixing_has_symptom.append("<option value=1>有</option>");
                    physical_kuanguanjie_jixing_has_symptom.append("<option value=0 selected>无</option>");
                    physical_kuanguanjie_jixing_table.hide();
                }
            },
            error: function () {

            }
        }
    );
};

function physicalKuanguanjieJixingOnChange(hasSymptom) {
    var physical_kuanguanjie_jixing_table = $("#physical_kuanguanjie_jixing_table");
    if (hasSymptom == 1) {
        physical_kuanguanjie_jixing_table.show();
    } else {
        physical_kuanguanjie_jixing_table.hide();
    }
};

function physicalKuanguanjieJixingSave() {
    var data = {};
    data.patientId = $("#patientId").val();
    data.hasSymptom = $("#physical_kuanguanjie_jixing_has_symptom").val();
    data.neishou = $("#physical_kuanguanjie_jixing_neishou").val();
    data.waizhan = $("#physical_kuanguanjie_jixing_waizhan").val();
    data.xuanzhuan = $("#physical_kuanguanjie_jixing_xuanzhuan").val();
    console.log(data);
    $.ajax({
            url: "/hospital/patient/physical/kuanguanjie/jixing",
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


function physicalKuanguanjieYatongGet() {
    var patientId = $("#patientId").val();
    $.ajax({
            url: "/hospital/patient/physical/kuanguanjie/yatong/" + patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/xhtml+xml; charset=utf-8",
            success: function (result) {
                console.log(result);
                var hasSymptom = result.hasSymptom;
                var physical_kuanguanjie_yatong_has_symptom = $("#physical_kuanguanjie_yatong_has_symptom");
                var physical_kuanguanjie_yatong = $("#physical_kuanguanjie_yatong");
                if (hasSymptom) {
                    physical_kuanguanjie_yatong_has_symptom.append("<option value=1 selected>有</option>");
                    physical_kuanguanjie_yatong_has_symptom.append("<option value=0>无</option>");
                    physical_kuanguanjie_yatong.show();
                    $("#physical_kuanguanjie_yatong").val(result.examResult);
                } else {
                    physical_kuanguanjie_yatong_has_symptom.append("<option value=1>有</option>");
                    physical_kuanguanjie_yatong_has_symptom.append("<option value=0 selected>无</option>");
                    physical_kuanguanjie_yatong.hide();
                }
            },
            error: function () {

            }
        }
    );
};

function physicalKuanguanjieYatongOnChange(hasSymptom) {
    var physical_kuanguanjie_yatong = $("#physical_kuanguanjie_yatong");
    if (hasSymptom == 1) {
        physical_kuanguanjie_yatong.show();
    } else {
        physical_kuanguanjie_yatong.hide();
    }
};

function physicalKuanguanjieYatongSave() {
    var data = {};
    data.patientId = $("#patientId").val();
    data.hasSymptom = $("#physical_kuanguanjie_yatong_has_symptom").val();
    data.examResult = $("#physical_kuanguanjie_yatong").val();
    console.log(data);
    $.ajax({
            url: "/hospital/patient/physical/kuanguanjie/yatong",
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


function physicalKuanguanjieHuodongduGet() {
    var patientId = $("#patientId").val();
    $.ajax({
            url: "/hospital/patient/physical/kuanguanjie/huodongdu/" + patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/xhtml+xml; charset=utf-8",
            success: function (result) {
                console.log(result);
                $("#physical_kuanguanjie_huodongdu_ququ").val(result.ququ);
                $("#physical_kuanguanjie_huodongdu_houshen").val(result.houshen);
                $("#physical_kuanguanjie_huodongdu_neixuan").val(result.neixuan);
                $("#physical_kuanguanjie_huodongdu_waixuan").val(result.waixuan);
                $("#physical_kuanguanjie_huodongdu_neishou").val(result.neishou);
                $("#physical_kuanguanjie_huodongdu_waizhan").val(result.waizhan);
            },
            error: function () {

            }
        }
    );
};

function PhysicalKuanguanjieHuodongduSave() {
    var data = {};
    data.patientId = $("#patientId").val();
    data.ququ = $("#physical_kuanguanjie_huodongdu_ququ").val();
    data.houshen = $("#physical_kuanguanjie_huodongdu_houshen").val();
    data.neixuan = $("#physical_kuanguanjie_huodongdu_neixuan").val();
    data.waixuan = $("#physical_kuanguanjie_huodongdu_waixuan").val();
    data.neishou = $("#physical_kuanguanjie_huodongdu_neishou").val();
    data.waizhan = $("#physical_kuanguanjie_huodongdu_waizhan").val();
    $.ajax({
            url: "/hospital/patient/physical/kuanguanjie/huodongdu",
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


function physicalKuanguanjieShiyanGet() {
    var shiyanList = ["纵向叩击痛", "Alice征", "Trendlenburg征", "单足站立试验", "4字试验"];
    var optionsList = ["阳性", "阴性"];
    var patientId = $("#patientId").val();
    $.ajax({
        url: "/hospital/patient/physical/kuanguanjie/shiyan/" + patientId,
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
                if (shiyan == "纵向叩击痛") {
                    node = $("#physical_kuanguanjie_zongxiangkoujitong");
                } else if (shiyan == "Alice征") {
                    node = $("#physical_kuanguanjie_alice");
                } else if (shiyan == "Trendlenburg征") {
                    node = $("#physical_kuanguanjie_trendlenburg");
                } else if (shiyan == "单足站立试验") {
                    node = $("#physical_kuanguanjie_danzuzhanlishiyan");
                } else if (shiyan == "4字试验") {
                    node = $("#physical_kuanguanjie_4zishiyan");
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

function physicalKuanguanjieShiyanSave() {
    var shiyanList = ["纵向叩击痛", "Alice征", "Trendlenburg征", "单足站立试验", "4字试验"];
    var data = {};
    data.patientId = $("#patientId").val();
    for (var i = 0; i < shiyanList.length; i++) {
        var shiyan = shiyanList[i];
        data.examName = shiyan;
        if (shiyan == "纵向叩击痛") {
            data.examResult = $("#physical_kuanguanjie_zongxiangkoujitong").val();
        } else if (shiyan == "Alice征") {
            data.examResult = $("#physical_kuanguanjie_alice").val();
        } else if (shiyan == "Trendlenburg征") {
            data.examResult = $("#physical_kuanguanjie_trendlenburg").val();
        } else if (shiyan == "单足站立试验") {
            data.examResult = $("#physical_kuanguanjie_danzuzhanlishiyan").val();
        } else if (shiyan == "4字试验") {
            data.examResult = $("#physical_kuanguanjie_4zishiyan").val();
        }
        $.ajax({
                url: "/hospital/patient/physical/kuanguanjie/shiyan",
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