<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>病人详情</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/hospital/css/bootstrap.min.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/hospital/css/grid.css">
    <!-- Loading Flat UI -->
    <link href="/hospital/css/flat-ui.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <c:if test="${isManager}">
        <h4>用户详情 <a type="button" id="modifyUser" class="btn btn-sm btn-warning">修改</a>
        </h4>
    </c:if>
    <c:if test="${!isManager}">
        <h4>用户详情</h4>
    </c:if>

    <hr>
    <div class="row">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>

        <div class="col-xs-6 col-md-2">
            <label for="patientNumber">人员编号:</label>
            <input type="text" style="width:80px;background-color:#FFFFFF" id="patientNumber" name="patientNumber"
                   value="${patient.patientNumber}" disabled="disabled"/>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="realName">姓名:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="realName" name="realName"
                   value="${patient.realName}" disabled="disabled"/>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="ethnicity">民族:</label>
            <input type="hidden" id="currentEthnicity" name="currentEthnicity" value="${patient.ethnicity}"/>
            <select name="ethnicity" id="ethnicity" required disabled="disabled"
                    style="width:100px;background-color:#FFFFFF">
                <option value="" disabled hidden>请选择</option>
            </select>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="gender">性别:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="gender" name="gender"
                   value="${patient.gender}" disabled="disabled"/>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="age">年龄:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="age" name="age"
                   value="${patient.age}" disabled="disabled"/>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="age">身高:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="height" name="height"
                   value="${patient.height}" disabled="disabled"/>
        </div>
    </div>
    <%--<div class="tagsinput-primary">--%>
    <%--<label for="disease">疾病类型:</label>--%>
    <%--<input type="text" id="disease" name="disease" placeholder="请输入疾病类型(按回车键可输入多个):" class="tagsinput tagsinput-typeahead input-lg form-control" />--%>
    <%--</div>--%>
    <div class="row">
        <div class="col-xs-6 col-md-2">
            <label for="weight">体重:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="weight" name="weight"
                   value="${patient.weight}" disabled="disabled"/>
        </div>
        <div class="col-xs-12 col-md-10">
            <label for="weight">疾病类型:</label>
            <input type="text" style="width:600px;background-color:#FFFFFF" id="disease" name="disease"
                   value="${patient.disease}" disabled="disabled"/>
        </div>
    </div>
    <button type="button" id="saveUser" style="display: none" class="btn btn-sm btn-warning">保存</button>
    <hr>

    <c:if test="${empty physicalRecordList}">
        <p class="bg-warning">
        <c:if test="${isManager}">
            <h5>无体格检查记录 <a href="/hospital/physicalRecord/create/${patient.id}" type="button"
                           class="btn btn-default btn-sm">添加</a>
            </h5>
        </c:if>
        <c:if test="${!isManager}">
            <h5>无体格检查记录 </h5>

        </c:if>
        <br/>
        </p>
    </c:if>
    <c:if test="${!empty physicalRecordList}">
        <c:if test="${isManager}">
            <h5>体格检查记录
                <div class="btn-group">
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">添加 <span
                            class="caret"></span></button>
                    <ul role="menu" class="dropdown-menu">
                        <c:forEach items="${physicalClassAList}" var="physicalClassA">
                            <li>
                                <a href="/hospital/physicalRecord/create/${patient.id}/${physicalClassA.physicalClassAId}">${physicalClassA.physicalClassAName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </h5>
        </c:if>
        <c:if test="${!isManager}">
            <h5>体格检查记录 </h5>
        </c:if>

        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>体格检查部位</th>
                <th>检查关节</th>
                <th>具体关节</th>
                <th>关节方位</th>
                <th>测量数值</th>
            </tr>

            <c:forEach items="${physicalRecordList}" var="physicalRecord">
                <tr>
                    <td>${physicalRecord.physicalRecordId}</td>
                    <td>${physicalRecord.physicalClassAName}</td>
                    <td>${physicalRecord.physicalClassBName}</td>
                    <td>${physicalRecord.physicalClassCName}</td>
                    <td>${physicalRecord.physicalClassDName}</td>
                    <td>${physicalRecord.result}</td>
                    <c:if test="${isManager}">
                        <td>
                            <a href="/hospital/physicalRecord/update/${physicalRecord.physicalRecordId}" type="button"
                               class="btn btn-sm btn-warning">修改</a>
                            <a href="/hospital/physicalRecord/delete/${physicalRecord.physicalRecordId}" type="button"
                               class="btn btn-sm btn-danger">删除</a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <%--<nav class="navbar navbar-default" role="navigation">--%>
    <h5>脊柱查体
        <button type="submit" id="modifyPhysical" class="btn btn-primary transition-duration">修改</button>
    </h5>

    <div class="container-fluid">
        <div>
            <%--<form class="navbar-form navbar-left" id="searchFrom" method="post" action="/hospital/patient/search">--%>
            <div class="navbar-form navbar-left" id="searchFrom">
                <div class="form-group">
                    <label>侧突畸形:</label>
                    <input type="hidden" id="currentPhysicalJizhuCetujixing" name="currentPhysicalJizhuCetujixing"/>
                    <select style="width:120px;color:black" id="physicalJizhuCetujixing" name="physicalJizhuCetujixing"
                            class="form-control">
                        <option value="" disabled selected="selected">请选择</option>
                    </select>
                    <br>

                    <label>活动度:</label><br>
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>部位</th>
                            <th>前屈</th>
                            <th>后伸</th>
                            <th>左侧弯</th>
                            <th>右侧弯</th>
                            <th>左侧旋</th>
                            <th>右侧旋</th>
                        </tr>
                        <tr>
                            <td>颈椎</td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="jingzhui_qianqu"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="jingzhui_houshen"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="jingzhui_zuocewan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="jingzhui_youcewan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="jingzhui_zuocexuan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="jingzhui_youcexuan"/></td>
                        </tr>
                        <tr>
                            <td>胸椎</td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="xiongzhui_qianqu"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="xiongzhui_houshen"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="xiongzhui_zuocewan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="xiongzhui_youcewan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="xiongzhui_zuocexuan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="xiongzhui_youcexuan"/></td>
                        </tr>
                        <tr>
                            <td>腰椎</td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="yaozhui_qianqu"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="yaozhui_houshen"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="yaozhui_zuocewan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="yaozhui_youcewan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="yaozhui_zuocexuan"/></td>
                            <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                       id="yaozhui_youcexuan"/></td>
                        </tr>
                    </table>

                    <label>压痛:</label><br>
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>部位</th>
                            <th>具体部位</th>
                        </tr>
                        <tr>
                            <td>颈椎</td>
                            <td><select disabled="disabled" class="form-control" style="width:100px;color:black"
                                        id="physical_jizhu_yatong_jingzhui" name="physical-jizhu-yatong">
                                <option value="" disabled selected="selected">请选择</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>胸椎</td>
                            <td><select disabled="disabled" class="form-control" style="width:100px;color:black"
                                        id="physical_jizhu_yatong_xiongzhui" name="physical-jizhu-yatong">
                                <option value="" disabled selected="selected">请选择</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>腰椎</td>
                            <td><select disabled="disabled" class="form-control" style="width:100px;color:black"
                                        id="physical_jizhu_yatong_yaozhui" name="physical-jizhu-yatong">
                                <option value="" disabled selected="selected">请选择</option>
                            </select></td>
                        </tr>
                    </table>

                    <label>叩击痛:</label><br>
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>部位</th>
                            <th>具体部位</th>
                        </tr>
                        <tr>
                            <td>颈椎</td>
                            <td><select disabled="disabled" class="form-control" style="width:100px;color:black"
                                        id="physical_jizhu_koujitong_jingzhui" name="physical-jizhu-koujitong">
                                <option value="" disabled selected="selected">请选择</option>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>胸椎</td>
                            <td><select disabled="disabled" class="form-control" style="width:100px;color:black"
                                        id="physical_jizhu_koujitong_xiongzhui"
                                        name="physical-jizhu-koujitong">
                                <option value="" disabled selected="selected">请选择</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>腰椎</td>
                            <td><select disabled="disabled" class="form-control" style="width:100px;color:black"
                                        id="physical_jizhu_koujitong_yaozhui" name="physical-jizhu-koujitong">
                                <option value="" disabled selected="selected">请选择</option>

                            </select></td>
                        </tr>
                    </table>

                    <label>压颈试验:</label>
                    <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuYajingshiyan"
                            name="physical-jizhu-shiyan"
                            class="form-control">
                        <option value="" disabled selected="selected">请选择</option>
                    </select>
                    <br>

                    <label>臂丛牵拉试验:</label>
                    <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuBiconglashiyan"
                            name="physical-jizhu-shiyan"
                            class="form-control">
                        <option value="" disabled selected="selected">请选择</option>
                    </select>
                    <br>

                    <label>拾物试验:</label>
                    <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuShiwushiyan"
                            name="physical-jizhu-shiyan"
                            class="form-control">
                        <option value="" disabled selected="selected">请选择</option>
                    </select>
                    <br>

                    <label>直腿抬高试验:</label>
                    <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuZhituitaigaoshiyan"
                            name="physical-jizhu-shiyan"
                            class="form-control">
                        <option value="" disabled selected="selected">请选择</option>
                    </select>
                    <br>

                    <label>股神经牵拉试验:</label>
                    <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuGushenjingqianlashiyan"
                            name="physical-jizhu-shiyan"
                            class="form-control">
                        <option value="" disabled selected="selected">请选择</option>
                    </select>
                    <br>

                </div>
            </div>
        </div>
    </div>
    <button type="submit" id="savePhysical" hidden="hidden" class="btn btn-primary transition-duration">保存</button>
    <%--</nav>--%>

    <c:if test="${empty scoreMarkList}">
        <p class="bg-warning">
        <c:if test="${isManager}">
            <h5>无功能评分记录 <a href="/hospital/scoreRecord/create/${patient.id}" type="button"
                           class="btn btn-default btn-sm">添加</a>
        </c:if>
        <c:if test="${!isManager}">
            <h5>无功能评分记录 </h5>
        </c:if>
        </h5>
        <br/>
        </p>
    </c:if>
    <c:if test="${!empty scoreMarkList}">
        <c:if test="${isManager}">
            <h5>功能评分记录 <a href="/hospital/scoreRecord/create/${patient.id}" type="button"
                          class="btn btn-default btn-sm">添加</a>
        </c:if>
        <c:if test="${!isManager}">
            <h5>功能评分记录 </h5>
        </c:if>
        </h5>

        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>功能评分名称</th>
                <th>得分</th>
            </tr>

            <c:forEach items="${scoreMarkList}" var="scoreMarkRecord">
                <tr>
                    <td>${scoreMarkRecord.scoreMarkId}</td>
                    <td>${scoreMarkRecord.scoreClassAName}</td>
                    <td>${scoreMarkRecord.result}</td>
                    <c:if test="${isManager}">
                        <td>
                            <a href="/hospital/scoreRecord/createDetail/${patient.id}/${scoreMarkRecord.scoreClassAId}"
                               type="button"
                               class="btn btn-sm btn-warning">修改</a>
                            <a href="/hospital/scoreMark/delete/${scoreMarkRecord.scoreMarkId}" type="button"
                               class="btn btn-sm btn-danger">删除</a>
                        </td>
                    </c:if>

                </tr>
            </c:forEach>
        </table>
    </c:if>


    <c:if test="${empty imageRecordList}">
        <p class="bg-warning">
        <c:if test="${isManager}">
            <h5>无影像检查记录 <a href="/hospital/imageRecord/create/${patient.id}" type="button"
                           class="btn btn-default btn-sm">添加</a>
            </h5>
        </c:if>
        <c:if test="${!isManager}">
            <h5>无影像检查记录</h5>
        </c:if>
        <br/>
        </p>
    </c:if>
    <c:if test="${!empty imageRecordList}">
        <c:if test="${isManager}">
            <h5>影像检查记录
                <div class="btn-group">
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">添加 <span
                            class="caret"></span></button>
                    <ul role="menu" class="dropdown-menu">
                        <c:forEach items="${imageClassAList}" var="imageClassA">
                            <li>
                                <a href="/hospital/imageRecord/create/${patient.id}/${imageClassA.imageClassAId}">${imageClassA.imageClassAName}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </h5>
        </c:if>
        <c:if test="${!isManager}">
            <h5>影像检查记录</h5>
        </c:if>
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>影像检查部位</th>
                <th>检查关节</th>
                <th>具体关节</th>
                <th>关节方位</th>
                <th>具体位置</th>
                <th>测量数值</th>
            </tr>

            <c:forEach items="${imageRecordList}" var="imageRecord">
                <tr>
                    <td>${imageRecord.imageRecordId}</td>
                    <td>${imageRecord.imageClassAName}</td>
                    <td>${imageRecord.imageClassBName}</td>
                    <td>${imageRecord.imageClassCName}</td>
                    <td>${imageRecord.imageClassDName}</td>
                    <td>${imageRecord.imageClassEName}</td>
                    <td>${imageRecord.result}</td>
                    <c:if test="${isManager}">
                        <td>
                            <a href="/hospital/imageRecord/update/${imageRecord.imageRecordId}" type="button"
                               class="btn btn-sm btn-warning">修改</a>
                            <a href="/hospital/imageRecord/delete/${imageRecord.imageRecordId}" type="button"
                               class="btn btn-sm btn-danger">删除</a>
                        </td>
                    </c:if>

                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${isManager}">
        <a href="/hospital/patient/list/isManager" type="button" class="btn btn-sm btn-success">返回列表页</a>
    </c:if>
    <c:if test="${!isManager}">
        <a href="/hospital/patient/list/notManager" type="button" class="btn btn-sm btn-success">返回列表页</a>
    </c:if>

    <%--<a href="/hospital/patient/list/${userEntity.userName}" type="button" class="btn btn-sm btn-success">返回列表页</a>--%>

</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/hospital/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#savePhysical").hide();
        initEthnicity();
        PhysicalJizhuCetujixingGet();
        PhysicalJizhuHuodongduGet();
        PhysicalJizhuTongGet();
        PhysicalJizhuShiyanGet();
    });

    $("#modifyUser").click(function () {
        $("input").prop('disabled', false);
        $("select").prop('disabled', false);
        $('input').css('background-color', '#F0F8FF'); // change the background color
        $('select').css('background-color', '#F0F8FF'); // change the background color
        $("#saveUser").show();
    });

    $("#saveUser").click(function () {
        $("input").prop('disabled', true);
        $("select").prop('disabled', true);
        $('input').css('background-color', '#FFFFFF'); // change the background color
        $('select').css('background-color', '#FFFFFF'); // change the background color
        $("#saveUser").hide();

        var data = {};
        data.patientId = $("#patientId").val();
        data.patientNumber = $("#patientNumber").val();
        data.realName = $("#realName").val();
        data.ethnicity = $("#ethnicity").val();
        data.gender = $("#gender").val();
        data.age = $("#age").val();
        data.height = $("#height").val();
        data.weight = $("#weight").val();
        data.disease = $("#disease").val();
        console.log(data);
        $.ajax({
                url: "/hospital/patient/updatePost",
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
    });

    function initEthnicity() {
        var currentEthnicity = $("#currentEthnicity");
        var ethnicity = $("#ethnicity");
        var ethnicityList = ["汉族", "蒙古族", "回族", "藏族", "维吾尔族", "苗族", "彝族", "壮族", "布依族", "朝鲜族", "满族", "侗族", "瑶族", "白族", "土家族",
            "哈尼族", "哈萨克族", "傣族", "黎族", "傈僳族", "佤族", "畲族", "高山族", "拉祜族", "水族", "东乡族", "纳西族", "景颇族", "柯尔克孜族",
            "土族", "达斡尔族", "仫佬族", "羌族", "布朗族", "撒拉族", "毛南族", "仡佬族", "锡伯族", "阿昌族", "普米族", "塔吉克族", "怒族", "乌孜别克族",
            "俄罗斯族", "鄂温克族", "德昂族", "保安族", "裕固族", "京族", "塔塔尔族", "独龙族", "鄂伦春族", "赫哲族", "门巴族", "珞巴族", "基诺族"];
        for (var i = 0; i < ethnicityList.length; i++) {
            var ethnicityElement = ethnicityList[i];
            if (currentEthnicity[0].value == ethnicityElement) {
                ethnicity.append("<option value=" + ethnicityElement + " " + "selected>" + ethnicityElement + "</option>");
            } else {
                ethnicity.append("<option value=" + ethnicityElement + ">" + ethnicityElement + "</option>");
            }
        }
    };

    $("#modifyPhysical").click(function () {
        $("#physicalJizhuCetujixing").prop('disabled', false);
        $('#physicalJizhuCetujixing').css('background-color', '#F0F8FF'); // change the background color
        $(".huodongdu").prop('disabled', false);
        $("select[name='physical-jizhu-yatong']").prop('disabled', false);
        $("select[name='physical-jizhu-yatong']").css('background-color', '#F0F8FF');
        $("select[name='physical-jizhu-koujitong']").prop('disabled', false);
        $("select[name='physical-jizhu-koujitong']").css('background-color', '#F0F8FF');
        $("select[name='physical-jizhu-shiyan']").prop('disabled', false);
        $("select[name='physical-jizhu-shiyan']").css('background-color', '#F0F8FF');
        $("#savePhysical").show();
    });

    $("#savePhysical").click(function () {
        $("#physicalJizhuCetujixing").prop('disabled', true);
        $(".huodongdu").prop('disabled', true);
        $("select[name='physical-jizhu-yatong']").prop('disabled', true);
        $("select[name='physical-jizhu-yatong']").css('background-color', '#FFFFFF');
        $("select[name='physical-jizhu-koujitong']").prop('disabled', true);
        $("select[name='physical-jizhu-koujitong']").css('background-color', '#FFFFFF');
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
        $("#physicalJizhuCetujixing").prop('disabled', true);
        var answerList = ["前突", "后突", "侧突", "无"];
        $.ajax({
                url: "/hospital/patient/physical/jizhu/cetujixing/" + patientId,
                type: "GET",
                dataType: "json",
                contentType: "application/xhtml+xml; charset=utf-8",
                success: function (result) {
                    console.log(result);
                    var current = result.answer;
                    var physicalJizhuCetujixing = $("#physicalJizhuCetujixing");
                    for (var i = 0; i < answerList.length; i++) {
                        var answerElement = answerList[i];
                        if (answerElement == current) {
                            physicalJizhuCetujixing.append("<option value=" + answerElement + " " + "selected>" + answerElement + "</option>")
                        } else {
                            physicalJizhuCetujixing.append("<option value=" + answerElement + ">" + answerElement + "</option>")
                        }
                    }

                },
                error: function () {

                }
            }
        );
    };

    function PhysicalJizhuCetujixingSave() {
        var data = {};
        data.patientId = $("#patientId").val();
        data.answer = $("#physicalJizhuCetujixing").val();
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

                    var node4Jingzhui;
                    if (tong == "压痛") {
                        node4Jingzhui = $("#physical_jizhu_yatong_jingzhui");
                    } else if (tong == "叩击痛") {
                        node4Jingzhui = $("#physical_jizhu_koujitong_jingzhui");
                    }
                    for (var j = 0; j < optionList4Jingzhui.length; j++) {
                        var optionElement = optionList4Jingzhui[j];
                        if (answer && answer.examName == tong && answer.examJingzhui == optionElement) {
                            node4Jingzhui.append("<option value=" + optionElement + " " + "selected>" + optionElement + "</option>");
                        } else {
                            node4Jingzhui.append("<option value=" + optionElement + ">" + optionElement + "</option>");
                        }
                    }

                    var node4Xionghui;
                    if (tong == "压痛") {
                        node4Xionghui = $("#physical_jizhu_yatong_xiongzhui");
                    } else if (tong == "叩击痛") {
                        node4Xionghui = $("#physical_jizhu_koujitong_xiongzhui");
                    }
                    for (var j = 0; j < optionList4Xiongzhui.length; j++) {
                        var optionElement = optionList4Xiongzhui[j];
                        if (answer && answer.examName == tong && answer.examXiongzhui == optionElement) {
                            node4Xionghui.append("<option value=" + optionElement + " " + "selected>" + optionElement + "</option>");
                        } else {
                            node4Xionghui.append("<option value=" + optionElement + ">" + optionElement + "</option>");
                        }
                    }

                    var node4Yaohui;
                    if (tong == "压痛") {
                        node4Yaohui = $("#physical_jizhu_yatong_yaozhui");
                    } else if (tong == "叩击痛") {
                        node4Yaohui = $("#physical_jizhu_koujitong_yaozhui");
                    }
                    for (var j = 0; j < optionList4Yaozhui.length; j++) {
                        var optionElement = optionList4Yaozhui[j];
                        if (answer && answer.examName == tong && answer.examYaozhui == optionElement) {
                            node4Yaohui.append("<option value=" + optionElement + " " + "selected>" + optionElement + "</option>");
                        } else {
                            node4Yaohui.append("<option value=" + optionElement + ">" + optionElement + "</option>");
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
        var data = {};
        data.patientId = $("#patientId").val();
        for (var i = 0; i < tongList.length; i++) {
            var tong = tongList[i];
            data.examName = tong;
            if (tong == "压痛") {
                data.examJingzhui = $("#physical_jizhu_yatong_jingzhui").val();
                data.examXiongzhui = $("#physical_jizhu_yatong_xiongzhui").val();
                data.examYaozhui = $("#physical_jizhu_yatong_yaozhui").val();
            } else if (tong == "叩击痛") {
                data.examJingzhui = $("#physical_jizhu_koujitong_jingzhui").val();
                data.examXiongzhui = $("#physical_jizhu_koujitong_xiongzhui").val();
                data.examYaozhui = $("#physical_jizhu_koujitong_yaozhui").val();
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

</script>

</body>
</html>