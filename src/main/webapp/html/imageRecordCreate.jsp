
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
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery.min.js"></script>

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


    <form:form action="/imageRecord/createPost" method="post" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>

        <div class="form-group">
            <label for="imageClassAId">影像检查部位:</label>
            <select id="imageClassAId" name="imageClassAId" data-placeholder="请选择"
                    onchange="initClassB(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${imageClassAList}" var="imageClassA">
                    <option value="${imageClassA.imageClassAId}">${imageClassA.imageClassAName}</option>
                </c:forEach>
            </select>

            <label for="imageClassBId">检查关节:</label>
            <select id="imageClassBId" name="imageClassBId" data-placeholder="请选择"
                    onchange="initClassC(this.value);"></select>

            <label for="imageClassCId">具体关节:</label>
            <select id="imageClassCId" name="imageClassCId"></select>

        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>

<script src="/js/bootstrap.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--<script src="/js/jquery.form.js"/>--%>
<%--<script src="/js/common.js"/>--%>
<script>

    function initClassB(imageClassAId) {
        var url = "/image/classB/" + imageClassAId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classBEntityList;
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["imageClassBId"] + "'>" + item["imageClassBName"] + "</option>";
                    });
                    $("#imageClassBId").append(options);
                }
            },
            error: function(e){
                console.log(e);
            }
        });
    }

    function initClassC(imageClassBId) {
        var url = "/image/classC/" + imageClassBId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classCEntityList;
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["imageClassCId"] + "'>" + item["imageClassCName"] + "</option>";
                    });
                    $("#imageClassCId").append(options);
                }
            },
            error: function(e){
                console.log(e);
            }
        });
    }

</script>

</body>
</html>