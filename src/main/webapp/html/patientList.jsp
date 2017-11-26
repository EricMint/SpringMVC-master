<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>北医三院-用户管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/hospital/css/bootstrap.min.css">

    <!-- Loading Flat UI -->
    <link href="/hospital/css/flat-ui.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <c:if test="${isManager}">
        <h4>北医三院-病人列表 <a href="/hospital/patient/add" type="button" class="btn btn-primary transition-duration">添加</a>
        </h4>
    </c:if>

    <c:if test="${!isManager}">
        <h4>北医三院-病人列表</h4>
    </c:if>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
            <div>
                <%--<form class="navbar-form navbar-left" id="searchFrom" method="post" action="/hospital/patient/search">--%>
                <div class="navbar-form navbar-left" id="searchFrom">
                    <div class="form-group">
                        <label>编号:</label>
                        <input type="text" style="width:120px" id="patientNumber" name="patientNumber"
                               class="form-control" placeholder="人员编号"> &nbsp;&nbsp;

                        <label>姓名:</label>
                        <input type="text" style="width:120px" id="realName" name="realName" class="form-control"
                               placeholder="姓名"> &nbsp;&nbsp;

                        <label>疾病:</label>
                        <input type="text" style="width:120px" id="disease" name="disease" class="form-control"
                               placeholder="疾病"> &nbsp;&nbsp;

                        <label>民族:</label>
                        <input type="text" style="width:120px" id="ethnicity" name="ethnicity" class="form-control"
                               placeholder="民族"> &nbsp;&nbsp;

                        <label>性别:</label>
                        <input type="text" style="width:120px" id="gender" name="gender" class="form-control"
                               placeholder="性别">
                    </div>
                    <div class="form-group">
                        <label>年龄:</label>
                        <input type="text" style="width:100px" id="minAge" name="minAge" class="form-control"
                               placeholder="最小年龄"> -
                        <input type="text" style="width:100px" id="maxAge" name="maxAge" class="form-control"
                               placeholder="最大年龄"> &nbsp;&nbsp;

                        <label>身高:</label>
                        <input type="text" style="width:100px" id="minHeight" name="minHeight" class="form-control"
                               placeholder="最低身高"> -
                        <input type="text" style="width:100px" id="maxHeight" name="maxHeight" class="form-control"
                               placeholder="最高身高"> &nbsp;&nbsp;

                        <label>体重:</label>
                        <input type="text" style="width:100px" id="minWeight" name="minWeight" class="form-control"
                               placeholder="最低体重"> -
                        <input type="text" style="width:100px" id="maxWeight" name="maxWeight" class="form-control"
                               placeholder="最高体重">
                    </div>
                    <button type="submit" id="btn-search" class="btn btn-primary transition-duration">搜索</button>
                </div>
            </div>
        </div>
    </nav>

    <c:if test="${empty patientList}">
        <p class="bg-warning">
            <br/>
            无病人信息
                <%--，请<a href="/patient/add" type="button" class="btn btn-default btn-sm">添加</a>--%>
            <br/>
            <br/>
        </p>
    </c:if>

    <c:if test="${!empty patientList}">
        <table class="table table-bordered table-striped" id="patientTable">
            <thead>
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
            </thead>
            <c:forEach items="${patientList}" var="patient" varStatus="myIndex">
                <tr>
                    <td>${myIndex.index+1}</td>
                    <td>${patient.patientNumber}</td>
                    <td>${patient.realName}</td>
                    <td>${patient.disease}</td>
                    <td>${patient.ethnicity}</td>
                    <td>${patient.gender}</td>
                    <td>${patient.age}</td>
                    <td>${patient.height}</td>
                    <td>${patient.weight}</td>
                    <td>
                        <c:if test="${isManager}">
                            <a href="/hospital/patient/detail/isManager/${patient.id}" type="button"
                               class="btn btn-sm btn-success">详情</a>
                            <a href="/hospital/patient/update/${patient.id}" type="button"
                               class="btn btn-sm btn-warning">修改</a>
                            <a href="/hospital/patient/delete/${patient.id}" type="button"
                               class="btn btn-sm btn-danger">删除</a>
                        </c:if>
                        <c:if test="${!isManager}">
                            <a href="/hospital/patient/detail/notManager/${patient.id}" type="button"
                               class="btn btn-sm btn-success">详情</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="row m-t-sm">
            <div class="col-sm-2">
                <p class="record">共${patientList.size()}条数据</p>
            </div>
            <div class="col-sm-10">
                <div id="pagination" class=""></div>
            </div>
        </div>

    </c:if>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/hospital/js/bootstrap.min.js"></script>
<script src="/hospital/js/jquery.myPagination6.0.js"></script>
<script src="/hospital/js/flat-ui.min.js"></script>
<script src="/hospital/js/application.js"></script>
<script>
    $(document).ready(function () {
        $("#btn-search").click(function () {
            var data = {};
            data.patientNumber = $("#patientNumber").val();
            data.realName = $("#realName").val();
            data.ethnicity = $("#ethnicity").val();
            data.gender = $("#gender").val();
            data.minAge = $("#minAge").val();
            data.maxAge = $("#maxAge").val();
            data.minHeight = $("#minHeight").val();
            data.maxHeight = $("#maxHeight").val();
            data.minWeight = $("#minWeight").val();
            data.maxWeight = $("#maxWeight").val();
            data.disease = $("#disease").val();
            console.log(data);
            $.ajax({
                    url: "/hospital/patient/search",
                    type: "post",
                    data: JSON.stringify(data),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        $('#patientTable tbody').remove();
                        console.log(result);
                        var searchList = result.patientEntityList;
                        if (null != searchList && searchList.length > 0) {
                            $("p.record").html("共" + searchList.length + "条数据");
                            for (i = 0; i < searchList.length; i++) {
                                var patient = searchList[i];
                                $('#patientTable').append('<tr><td>' + (i + 1) + '</td><td>' + patient.patientNumber + '</td><td>' + patient.realName + '</td>' +
                                    '<td>' + patient.disease + '</td><td>' + patient.ethnicity + '</td><td>' + patient.gender + '</td>' +
                                    '<td>' + patient.age + '</td><td>' + patient.height + '</td><td>' + patient.weight + '</td>' +
                                    '<td>' + '<a href="/hospital/patient/detail/isManager/' + patient.id + '" type="button" class="btn btn-sm btn-success">详情</a>' + '</td></tr>');

                            }

                        }

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
