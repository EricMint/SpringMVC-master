$("#modify_image_kuanjiuce").click(function () {

    $(".image_kuanjiuce").prop('disabled', false);

    $("#save_image_kuanjiuce").show();
});

$("#save_image_kuanjiuce").click(function () {

    $(".image_kuanjiuce").prop('disabled', true);

    $("#save_image_kuanjiuce").hide();

    imageKuanjiuceSave();
});

var kuanjiuceList = ["髋臼周长",
    "横断位髋臼直径",
    "矢状位髋臼直径",
    "横断位前方髋臼-股骨间距离",
    "横断位后方髋臼-股骨间距离",
    "冠状位外侧缘髋臼-股骨头间距离",
    "冠状位最高点髋臼-股骨头间距离",
    "横断位髋臼最薄的厚度",
    "横断位卵圆窝宽度",
    "横断位卵圆窝深度",
    "冠状位髋臼最薄的厚度",
    "冠状位卵圆窝的宽度",
    "冠状位卵圆窝的深度",
    "横断位髋臼前后缘连线与髋臼围成的面积",
    "横断位髋臼-股骨头间面积",
    "横断位股骨头未被髋臼包容的面积",
    "水平线与髋臼最上缘和最前缘连线的夹角",
    "横断位冠状轴与股骨头中心和髋臼前缘连线夹角",
    "横断位冠状轴与股骨头中心和髋臼后缘连线夹角",
    "冠状位CE角",
    "冠状位髋臼最下缘和垂线夹角",
    "横断位髋臼前后缘连线与矢状面夹角",
    "冠状位髋臼上下缘连线与垂线夹角",
    "横断位上髋臼前缘与卵圆窝后缘连线与冠状轴夹角",
    "横断位上髋臼后缘与卵圆窝后缘连线与冠状轴夹角",
    "冠状位髋臼上缘及卵圆窝上缘连线与水平面夹角",
    "冠状位髋臼下缘及卵圆窝上缘连线与水平面夹角",
    "冠状位髋臼深度",
    "横断面髋臼深度",
    "冠状位髋臼最高点水平线与髋臼最外缘水平线间垂直距离",
    "股骨头内侧缘与髋臼外侧缘垂线间距离",
    "股骨头直径",
    "颈干角",
    "覆盖率是15/14",
    "髋臼头指数是31/32"];

function imageKuanjiuceGet() {
    var kuanjiuceMap = new Map();
    for (var i = 0; i < 35; i++) {
        var number = i + 1;
        var id = "image_kuanjiuce_" + number;
        kuanjiuceMap.set(kuanjiuceList[i], id);
    }
    var patientId = $("#patientId").val();
    $.ajax({
            url: "/hospital/patient/image/kuanjiuce/" + patientId,
            type: "GET",
            dataType: "json",
            contentType: "application/xhtml+xml; charset=utf-8",
            success: function (answerList) {
                console.log(answerList);
                if (answerList.length > 0) {
                    for (var i = 0; i < answerList.length; i++) {
                        var answer = answerList[i];
                        var id = kuanjiuceMap.get(answer.examName);
                        $("#" + id).val(answer.examResult);
                    }
                }
            },
            error: function () {

            }
        }
    );
};

function imageKuanjiuceSave() {
    for (var i = 0; i < 35; i++) {
        var data = {};
        data.patientId = $("#patientId").val();
        var number = i + 1;
        var id = "image_kuanjiuce_" + number;
        data.examName = kuanjiuceList[i];
        data.examResult = $("#" + id).val();
        if (data.examResult) {
            $.ajax({
                    url: "/hospital/patient/image/kuanjiuce",
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

