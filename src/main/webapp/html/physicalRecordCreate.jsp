<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加用户体格检查信息</title>
    <link rel="stylesheet" href="/hospital/css/bootstrap.min.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>

<div class="container">
    <h1>添加用户体格检查信息</h1>
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


    <form:form action="/hospital/physicalRecord/createPost" method="post" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>

        <div class="form-group">
            <label for="physicalClassAId">体格检查部位:</label>
            <select id="physicalClassAId" name="physicalClassAId" data-placeholder="请选择" onchange="initClassB(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassAList}" var="physicalClassA">
                    <option value="${physicalClassA.physicalClassAId}">${physicalClassA.physicalClassAName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="physicalClassBId">检查关节:</label>
            <select id="physicalClassBId" name="physicalClassBId" data-placeholder="请选择" onchange="initClassC(this.value);">
            </select>
        </div>
        <div class="form-group">

            <label for="physicalClassCId">具体关节:</label>
            <select id="physicalClassCId" name="physicalClassCId" data-placeholder="请选择" onchange="initClassD(this.value);">
            </select>
        </div>
        <div class="form-group">

            <label for="physicalClassDId">关节方位:</label>
            <select id="physicalClassDId" name="physicalClassDId" data-placeholder="请选择" onchange="initClassE(this.value);">
            </select>
        </div>

        <div class="form-group">
            <label for="result">测量数值</label>
            <input type="text" class="form-control" id="result" name="result" placeholder="请输入测量数值:"/>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>

<script src="/hospital/js/bootstrap.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--<script src="/js/jquery.form.js"/>--%>
<%--<script src="/js/common.js"/>--%>
<script>

    function initClassB(physicalClassAId) {
        if (physicalClassAId == "") {
            $("#physicalClassBId").empty();
            $("#physicalClassBId").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassBId").empty();

        var url = "/hospital/physical/classB/" + physicalClassAId;
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
                        options = options + "<option value='" + item["physicalClassBId"] + "'>" + item["physicalClassBName"] + "</option>";
                    });
                    $("#physicalClassBId").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassC(physicalClassBId) {
        if (physicalClassBId == "") {
            $("#physicalClassCId").empty();
            $("#physicalClassCId").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassCId").empty();
        var url = "/hospital/physical/classC/" + physicalClassBId;
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
                        options = options + "<option value='" + item["physicalClassCId"] + "'>" + item["physicalClassCName"] + "</option>";
                    });
                    $("#physicalClassCId").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId").empty();
            $("#physicalClassDId").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
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
                        $("#physicalClassDId").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId").append(options);
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
