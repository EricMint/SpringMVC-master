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
                   value="${patient.disease}" disabled="disabled" />
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
        var currentEthnicity = $("#currentEthnicity");
        var ethnicity = $("#ethnicity");
        var ethnicityList = ["汉族", "蒙古族", "回族", "藏族", "维吾尔族", "苗族", "彝族", "壮族", "布依族", "朝鲜族", "满族", "侗族", "瑶族", "白族", "土家族",
            "哈尼族", "哈萨克族", "傣族", "黎族", "傈僳族", "佤族", "畲族", "高山族", "拉祜族", "水族", "东乡族", "纳西族", "景颇族", "柯尔克孜族",
            "土族", "达斡尔族", "仫佬族", "羌族", "布朗族", "撒拉族", "毛南族", "仡佬族", "锡伯族", "阿昌族", "普米族", "塔吉克族", "怒族", "乌孜别克族",
            "俄罗斯族", "鄂温克族", "德昂族", "保安族", "裕固族", "京族", "塔塔尔族", "独龙族", "鄂伦春族", "赫哲族", "门巴族", "珞巴族", "基诺族"];
        for (var i = 0; i < ethnicityList.length; i++) {
            var ethnicityElement = ethnicityList[i];
            console.log(ethnicityList[i]);
            if (currentEthnicity[0].value == ethnicityElement) {
                ethnicity.append("<option value=" + ethnicityElement + " " + "selected>" + ethnicityElement + "</option>");
            } else {
                ethnicity.append("<option value=" + ethnicityElement + ">" + ethnicityElement + "</option>");
            }
        }

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

    });
</script>

</body>
</html>