<%--
  Created by IntelliJ IDEA.
  User: sjj
  Date: 2015/10/24 0024
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加用户影像检查信息</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<script src="/js/jquery.min.js"></script>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
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
            <select id="imageClassAId" name="imageClassAId">
                <option value="">请选择</option>
                <c:forEach items="${imageClassAList}" var="imageClassA">
                    <option value="${imageClassA.imageClassAId}">${imageClassA.imageClassAName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.form.js"/>
<script src="/js/common.js" />
<script>
//    $(document).ready(function() {
//
//        $("#imagingExaminationCategoryName").change(function() {
//
//            var el = $(this) ;
//
//            if(el.val() === "下肢" ) {
//                $("#imagingExaminationItemName").isShown;
//            }
//            else if(el.val() === "MANUAL" ) {
//                $("#status option:last-child").remove() ; }
//        });
//
//    });
//
//    $("#imagingExaminationCategoryName").change(function() {
//
//        var el = $(this) ;
//
//        if(el.val() === "下肢" ) {
//            $("#imagingExaminationItemName").isShown;
//        }
//    });
</script>

</body>
</html>
