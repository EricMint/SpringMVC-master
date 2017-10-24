<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sjj
  Date: 2015/10/24 0024
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户详情</title>

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
<div class="container">
    <h1>用户详情</h1>
    <hr/>

    <table class="table tavble-bordered table-striped">
        <tr>
            <th>ID</th>
            <td>${user.id}</td>
        </tr>
        <tr>
            <th>人员编号</th>
            <td>${user.patientNumber}</td>
        </tr>
        <tr>
            <th>身份证号</th>
            <td>${user.idNumber}</td>
        </tr>
        <tr>
            <th>姓名</th>
            <td>${user.realName}</td>
        </tr>
        <tr>
            <th>民族</th>
            <td>${user.ethnicity}</td>
        </tr>
        <tr>
            <th>性别</th>
            <td>${user.gender}</td>
        </tr>
        <tr>
            <th>年龄</th>
            <td>${user.age}</td>
        </tr>
        <tr>
            <th>身高</th>
            <td>${user.height}</td>
        </tr>
        <tr>
            <th>体重</th>
            <td>${user.weight}</td>
        </tr>

    </table>

    <c:if test="${empty recordEntityList}">
        <p class="bg-warning">
            <br/>
            无影像检查记录，请<a href="/addImagingRecord/${user.id}" type="button" class="btn btn-default btn-sm">添加</a>
            <br/>
            <br/>
        </p>
    </c:if>
    <c:if test="${!empty recordEntityList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>影像检查部位</th>
                <th>具体部位</th>
                <th>方位</th>
            </tr>

            <c:forEach items="${recordEntityList}" var="imagingExaminationRecord">
                <tr>
                    <td>${imagingExaminationRecord.id}</td>
                    <td>${imagingExaminationRecord.imagingExaminationCategoryName}</td>
                    <td>${imagingExaminationRecord.imagingExaminationItemName}</td>
                    <td>${imagingExaminationRecord.imagingExaminationItemOptionName}</td>
                    <%--<td>--%>
                        <%--<a href="/showUser/${user.id}" type="button" class="btn btn-sm btn-success">详情</a>--%>
                        <%--<a href="/updateUser/${user.id}" type="button" class="btn btn-sm btn-warning">修改</a>--%>
                        <%--<a href="/deleteUser/${user.id}" type="button" class="btn btn-sm btn-danger">删除</a>--%>
                    <%--</td>--%>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <a href="/users" type="button" class="btn btn-sm btn-success">返回列表页</a>

</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>