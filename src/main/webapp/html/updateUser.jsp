<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: sjj
  Date: 2015/10/24 0024
  Time: 20:36
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
    <title>SpringMVC Demo 首页</title>

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
    <h1>SpringMVC 更新用户信息</h1>
    <hr/>

    <form:form action="/updateUserPost" method="post" commandName="user" role="form">
        <div class="form-group">
            <label for="patientNumber">人员编号:</label>
            <input type="text" class="form-control" id="patientNumber" name="patientNumber" placeholder="请输入人员编号:"
                   value="${user.patientNumber}"/>
        </div>
        <div class="form-group">
            <label for="idNumber">身份证号:</label>
            <input type="text" class="form-control" id="idNumber" name="idNumber" placeholder="请输入身份证号:"
                   value="${user.idNumber}"/>
        </div>
        <div class="form-group">
            <label for="realName">姓名:</label>
            <input type="text" class="form-control" id="realName" name="realName" placeholder="请输入姓名:"
                   value="${user.realName}"/>
        </div>
        <div class="form-group">
            <label for="ethnicity">民族:</label>
            <input type="text" class="form-control" id="ethnicity" name="ethnicity" placeholder="请输入民族:"
                   value="${user.ethnicity}"/>
        </div>
        <div class="form-group">
            <label for="gender">性别:</label>
            <input type="text" class="form-control" id="gender" name="gender" placeholder="请输入性别:"
                   value="${user.gender}"/>
        </div>
        <div class="form-group">
            <label for="age">年龄:</label>
            <input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄:"
                   value="${user.age}"/>
        </div>
        <div class="form-group">
            <label for="height">身高:</label>
            <input type="text" class="form-control" id="height" name="height" placeholder="请输入身高:"
                   value="${user.height}"/>
        </div>
        <div class="form-group">
            <label for="weight">体重:</label>
            <input type="text" class="form-control" id="weight" name="weight" placeholder="请输入体重:"
                   value="${user.weight}"/>
        </div>
        <!-- 把 id 一并写入 userP 中 -->
        <input type="hidden" id="id" name="id" value="${user.id}"/>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>