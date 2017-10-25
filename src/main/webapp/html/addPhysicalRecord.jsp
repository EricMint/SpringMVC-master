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
    <h1>添加用户体格检查信息</h1>
    <hr/>

    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>人员编号</th>
            <th>身份证号</th>
            <th>民族</th>
            <th>性别</th>
            <th>年龄</th>
            <th>身高</th>
            <th>体重</th>
        </tr>

        <tr>
            <td>${user.id}</td>
            <td>${user.realName}</td>
            <td>${user.patientNumber}</td>
            <td>${user.idNumber}</td>
            <td>${user.ethnicity}</td>
            <td>${user.gender}</td>
            <td>${user.age}</td>
            <td>${user.height}</td>
            <td>${user.weight}</td>
        </tr>

    </table>


    <form:form action="/exam/addPhysicalRecordPost" method="post" role="form">
        <input type="hidden" id="patientNumber" name="patientNumber" value="${user.patientNumber}"/>
        <input type="hidden" id="userId" name="userId" value="${user.id}"/>

        <div class="form-group">
            <label for="physicalExaminationCategoryId">体格检查部位:</label>
            <select id="physicalExaminationCategoryId" name="physicalExaminationCategoryId">
                <option value="">请选择</option>
                <c:forEach items="${categoryList}" var="category">
                    <option value="${category.id}">${category.physicalExaminationCategoryName}</option>
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
