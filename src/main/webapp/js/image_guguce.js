$("#modify_image_guguce").click(function () {

    $(".image_guguce").prop('disabled', false);

    $("#save_image_guguce").show();
});

$("#save_image_guguce").click(function () {

    $(".image_guguce").prop('disabled', true);

    $("#save_image_guguce").hide();

    imageGuguceSave();
});

var guguceList = ["-25水平",
    "-15水平",
    "-10水平",
    "-5水平",
    "0水平",
    "5水平",
    "10水平",
    "15水平",
    "20水平",
    "30水平",
    "40水平",
    "50水平",
    "60水平",
    "70水平",
    "80水平",
    "股骨前倾角"];

function imageGuguceGet() {
    var patientId = $("#patientId").val();
    $.ajax({
            url: "/hospital/patient/image/guguce/" + patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/xhtml+xml; charset=utf-8",
            success: function (answerList) {
                console.log(answerList);
                for (var i = 0; i < answerList.length; i++) {
                    var answerElement = answerList[i];
                    if (answerElement.examName == "-25水平") {
                        $("#image_guguce_-25_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_-25_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_-25_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "-15水平") {
                        $("#image_guguce_-15_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_-15_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_-15_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "-10水平") {
                        $("#image_guguce_-10_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_-10_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_-10_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "-5水平") {
                        $("#image_guguce_-5_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_-5_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_-5_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "0水平") {
                        $("#image_guguce_0_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_0_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_0_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "5水平") {
                        $("#image_guguce_5_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_5_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_5_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "10水平") {
                        $("#image_guguce_10_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_10_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_10_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "15水平") {
                        $("#image_guguce_15_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_15_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_15_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "20水平") {
                        $("#image_guguce_20_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_20_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_20_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "30水平") {
                        $("#image_guguce_30_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_30_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_30_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "40水平") {
                        $("#image_guguce_40_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_40_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_40_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "50水平") {
                        $("#image_guguce_50_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_50_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_50_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "60水平") {
                        $("#image_guguce_60_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_60_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_60_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "70水平") {
                        $("#image_guguce_70_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_70_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_70_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "80水平") {
                        $("#image_guguce_80_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_80_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_80_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "90水平") {
                        $("#image_guguce_90_hengjing").val(answerElement.hengjing);
                        $("#image_guguce_90_shizhuangjing").val(answerElement.shizhuangjing);
                        $("#image_guguce_90_suiqiang").val(answerElement.suiqiang);
                    } else if (answerElement.examName == "股骨前倾角") {
                        $("#image_guguce_guguqian_hengjing").val(answerElement.hengjing);
                    }
                }

            },
            error: function () {

            }
        }
    );
};

function imageGuguceSave() {
    var data = {};
    data.patientId = $("#patientId").val();
    for (var i = 0; i < guguceList.length; i++) {
        var examName = guguceList[i];
        data.examName = examName;
        var hengjing = "";
        var shizhuangjing = "";
        var suiqiang = "";
        if (examName == "-25水平") {
            hengjing = $("#image_guguce_-25_hengjing").val();
            shizhuangjing = $("#image_guguce_-25_shizhuangjing").val();
            suiqiang = $("#image_guguce_-25_suiqiang").val();
        } else if (examName == "-15水平") {
            hengjing = $("#image_guguce_-15_hengjing").val();
            shizhuangjing = $("#image_guguce_-15_shizhuangjing").val();
            suiqiang = $("#image_guguce_-15_suiqiang").val();
        } else if (examName == "-10水平") {
            hengjing = $("#image_guguce_-10_hengjing").val();
            shizhuangjing = $("#image_guguce_-10_shizhuangjing").val();
            suiqiang = $("#image_guguce_-10_suiqiang").val();
        } else if (examName == "-5水平") {
            hengjing = $("#image_guguce_-5_hengjing").val();
            shizhuangjing = $("#image_guguce_-5_shizhuangjing").val();
            suiqiang = $("#image_guguce_-5_suiqiang").val();
        } else if (examName == "0水平") {
            hengjing = $("#image_guguce_0_hengjing").val();
            shizhuangjing = $("#image_guguce_0_shizhuangjing").val();
            suiqiang = $("#image_guguce_0_suiqiang").val();
        } else if (examName == "5水平") {
            hengjing = $("#image_guguce_5_hengjing").val();
            shizhuangjing = $("#image_guguce_5_shizhuangjing").val();
            suiqiang = $("#image_guguce_5_suiqiang").val();
        } else if (examName == "10水平") {
            hengjing = $("#image_guguce_10_hengjing").val();
            shizhuangjing = $("#image_guguce_10_shizhuangjing").val();
            suiqiang = $("#image_guguce_10_suiqiang").val();
        } else if (examName == "15水平") {
            hengjing = $("#image_guguce_15_hengjing").val();
            shizhuangjing = $("#image_guguce_15_shizhuangjing").val();
            suiqiang = $("#image_guguce_15_suiqiang").val();
        } else if (examName == "20水平") {
            hengjing = $("#image_guguce_20_hengjing").val();
            shizhuangjing = $("#image_guguce_20_shizhuangjing").val();
            suiqiang = $("#image_guguce_20_suiqiang").val();
        } else if (examName == "30水平") {
            hengjing = $("#image_guguce_30_hengjing").val();
            shizhuangjing = $("#image_guguce_30_shizhuangjing").val();
            suiqiang = $("#image_guguce_30_suiqiang").val();
        } else if (examName == "40水平") {
            hengjing = $("#image_guguce_40_hengjing").val();
            shizhuangjing = $("#image_guguce_40_shizhuangjing").val();
            suiqiang = $("#image_guguce_40_suiqiang").val();
        } else if (examName == "50水平") {
            hengjing = $("#image_guguce_50_hengjing").val();
            shizhuangjing = $("#image_guguce_50_shizhuangjing").val();
            suiqiang = $("#image_guguce_50_suiqiang").val();
        } else if (examName == "60水平") {
            hengjing = $("#image_guguce_60_hengjing").val();
            shizhuangjing = $("#image_guguce_60_shizhuangjing").val();
            suiqiang = $("#image_guguce_60_suiqiang").val();
        } else if (examName == "70水平") {
            hengjing = $("#image_guguce_70_hengjing").val();
            shizhuangjing = $("#image_guguce_70_shizhuangjing").val();
            suiqiang = $("#image_guguce_70_suiqiang").val();
        } else if (examName == "80水平") {
            hengjing = $("#image_guguce_80_hengjing").val();
            shizhuangjing = $("#image_guguce_80_shizhuangjing").val();
            suiqiang = $("#image_guguce_80_suiqiang").val();
        } else if (examName == "90水平") {
            hengjing = $("#image_guguce_90_hengjing").val();
            shizhuangjing = $("#image_guguce_90_shizhuangjing").val();
            suiqiang = $("#image_guguce_90_suiqiang").val();
        } else if (examName == "股骨前倾角") {
            hengjing = $("#image_guguce_guguqian_hengjing").val();
        }
        if (hengjing || shizhuangjing || suiqiang) {
            data.hengjing = hengjing;
            data.shizhuangjing = shizhuangjing;
            data.suiqiang = suiqiang;
            $.ajax({
                    url: "/hospital/patient/image/guguce",
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

    }
};
