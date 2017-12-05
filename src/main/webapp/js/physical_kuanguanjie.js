function physicalKuanguanjieGet() {
    physicalKuanguanjieJixingGet();
    physicalKuanguanjieYatongGet();
    physicalKuanguanjieButaiGet();
    physicalKuanguanjieHuodongduGet();
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


    // $(".huodongdu").prop('disabled', false);
    // $("input[name*='physical_jizhu_yatong']").prop('disabled', false);
    // $("input[name*='physical_jizhu_koujitong']").prop('disabled', false);
    // $("select[name='physical-jizhu-shiyan']").prop('disabled', false);
    // $("select[name='physical-jizhu-shiyan']").css('background-color', '#F0F8FF');
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

    // $(".huodongdu").prop('disabled', true);
    // $("select[name='physical-jizhu-shiyan']").prop('disabled', true);
    // $("select[name='physical-jizhu-shiyan']").css('background-color', '#FFFFFF');
    $("#save_physical_kuanguanjie").hide();
    physicalKuanguanjieJixingSave();
    physicalKuanguanjieYatongSave();
    physicalKuanguanjieButaiSave();
    PhysicalKuanguanjieHuodongduSave();
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