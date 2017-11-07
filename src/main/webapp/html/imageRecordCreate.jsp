<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加用户影像检查信息</title>
    <link rel="stylesheet" href="/hospital/css/bootstrap.min.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//hospital/js/jquery.min.js"></script>
<!-- Loading Flat UI -->
<link href="/hospital/css/flat-ui.css" rel="stylesheet">

<div class="container">
    <h1>添加用户影像检查信息</h1>
    <hr/>

    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <th>人员编号</th>
            <th>姓名</th>
            <th>疾病类型</th>
            <th>民族</th>
            <th>性别</th>
            <th>年龄</th>
            <th>身高</th>
            <th>体重</th>
        </tr>

        <tr>
            <td>${patient.id}</td>
            <td>${patient.patientNumber}</td>
            <td>${patient.realName}</td>
            <td>${patient.disease}</td>
            <td>${patient.ethnicity}</td>
            <td>${patient.gender}</td>
            <td>${patient.age}</td>
            <td>${patient.height}</td>
            <td>${patient.weight}</td>
        </tr>

    </table>

    <h5>${imageClassBList[0].imageClassAName} </h5>
    <form:form action="/hospital/imageRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="imageClassAId" value="${imageClassBList[0].imageClassAId}"/>
        <input type="hidden" name="imageClassBId" value="${imageClassBList[0].imageClassBId}"/>

        <div class="form-group">
            <h6>${imageClassBList[0].imageClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="imageClassCId0">检查关节:</label>
            <select id="imageClassCId0" name="imageClassCId" data-placeholder="请选择"
                    onchange="initClassD0(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${imageClassBList[0].imageClassCEntityList}" var="imageClassC">
                    <option value="${imageClassC.imageClassCId}">${imageClassC.imageClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="imageClassDId0">关节方位:</label>
            <select id="imageClassDId0" name="imageClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result0" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/imageRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="imageClassAId" value="${imageClassBList[1].imageClassAId}"/>
        <input type="hidden" name="imageClassBId" value="${imageClassBList[1].imageClassBId}"/>

        <div class="form-group">
            <h6>${imageClassBList[1].imageClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="imageClassCId1">检查关节:</label>
            <select id="imageClassCId1" name="imageClassCId" data-placeholder="请选择"
                    onchange="initClassD1(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${imageClassBList[1].imageClassCEntityList}" var="imageClassC">
                    <option value="${imageClassC.imageClassCId}">${imageClassC.imageClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="imageClassDId1">关节方位:</label>
            <select id="imageClassDId1" name="imageClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result1" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/imageRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="imageClassAId" value="${imageClassBList[2].imageClassAId}"/>
        <input type="hidden" name="imageClassBId" value="${imageClassBList[2].imageClassBId}"/>

        <div class="form-group">
            <h6>${imageClassBList[2].imageClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="imageClassCId2">检查关节:</label>
            <select id="imageClassCId2" name="imageClassCId" data-placeholder="请选择"
                    onchange="initClassD2(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${imageClassBList[2].imageClassCEntityList}" var="imageClassC">
                    <option value="${imageClassC.imageClassCId}">${imageClassC.imageClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="imageClassDId2">关节方位:</label>
            <select id="imageClassDId2" name="imageClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result2" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <a href="/hospital/patient/detail/isManager/${patient.id}" type="button" class="btn btn-sm btn-success">返回列表页</a>

    <iframe width="0" height="0" border="0" name="dummyframe" id="dummyframe"></iframe>

</div>

<script src="/hospital/js/bootstrap.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--<script src="/js/jquery.form.js"/>--%>
<%--<script src="/js/common.js"/>--%>
<script>

    function initClassD0(imageClassCId) {
        if (imageClassCId == "") {
            $("#imageClassDId0").empty();
            $("#imageClassDId0").append("<option value=''>请选择</option>");
            return;
        }
        $("#imageClassDId0").empty();
        var url = "/hospital/image/classD/" + imageClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#imageClassDId0").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["imageClassDId"] + "'>" + item["imageClassDName"] + "</option>";
                    });
                    $("#imageClassDId0").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD1(imageClassCId) {
        if (imageClassCId == "") {
            $("#imageClassDId1").empty();
            $("#imageClassDId1").append("<option value=''>请选择</option>");
            return;
        }
        $("#imageClassDId1").empty();
        var url = "/hospital/image/classD/" + imageClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#imageClassDId1").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["imageClassDId"] + "'>" + item["imageClassDName"] + "</option>";
                    });
                    $("#imageClassDId1").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD2(imageClassCId) {
        if (imageClassCId == "") {
            $("#imageClassDId2").empty();
            $("#imageClassDId2").append("<option value=''>请选择</option>");
            return;
        }
        $("#imageClassDId2").empty();
        var url = "/hospital/image/classD/" + imageClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#imageClassDId2").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["imageClassDId"] + "'>" + item["imageClassDName"] + "</option>";
                    });
                    $("#imageClassDId2").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

</script>

</body>
</html>
