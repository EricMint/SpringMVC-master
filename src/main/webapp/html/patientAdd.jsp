<%--
  Created by IntelliJ IDEA.
  User: sjj
  Date: 2015/10/24 0024
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
  <title>添加用户</title>

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
  <h1>添加用户</h1>
  <hr/>
  <form:form action="/hospital/patient/addPost" method="post" role="form">
    <div class="form-group">
      <label for="patientNumber">病人编号:</label>
      <input type="text" class="form-control" id="patientNumber" name="patientNumber" placeholder="请输入病人编号:"/>
    </div>
    <div class="form-group">
      <label for="realName">姓名:</label>
      <input type="text" class="form-control" id="realName" name="realName" placeholder="请输入姓名:"/>
    </div>
    <div class="tagsinput-primary">
      <label for="disease">疾病类型:</label>
      <input type="text" id="disease" name="disease" placeholder="请输入疾病类型(按回车键可输入多个):" class="tagsinput tagsinput-typeahead input-lg form-control" />
    </div>
    <div class="form-group">
      <label for="ethnicity">民族:</label>
      <input type="text" class="form-control" id="ethnicity" name="ethnicity" placeholder="请输入民族:"/>
    </div>
    <div class="form-group">
      <label for="gender">性别:</label>
      <input type="text" class="form-control" id="gender" name="gender" placeholder="请输入性别:"/>
    </div>
    <div class="form-group">
      <label for="age">年龄:</label>
      <input type="text" class="form-control" id="age" name="age" placeholder="请输入年龄:"/>
    </div>
    <div class="form-group">
      <label for="height">身高:</label>
      <input type="text" class="form-control" id="height" name="height" placeholder="请输入身高:"/>
    </div>
    <div class="form-group">
      <label for="weight">体重:</label>
      <input type="text" class="form-control" id="weight" name="weight" placeholder="请输入体重:"/>
    </div>
    <div class="form-group">
      <button type="submit" class="btn btn-sm btn-success">提交</button>
    </div>
  </form:form>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/hospital/js/bootstrap.min.js"></script>
<script src="/hospital/js/flat-ui.js"></script>
<script src="/hospital/js/application.js"></script>

<script>
    var states = new Bloodhound({
        datumTokenizer: function(d) { return Bloodhound.tokenizers.whitespace(d.word); },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        limit: 4,
        local: [
            { word: "Alabama" },
            { word: "Alaska" },
            { word: "Arizona" },
            { word: "Arkansas" },
            { word: "California" },
            { word: "Colorado" }
        ]
    });

    states.initialize();

    $('input.tagsinput').tagsinput();

    $('input.tagsinput-typeahead').tagsinput('input').typeahead(null, {
        name: 'states',
        displayKey: 'word',
        source: states.ttAdapter()
    });

    $('input.typeahead-only').typeahead(null, {
        name: 'states',
        displayKey: 'word',
        source: states.ttAdapter()
    });
</script>

</body>
</html>
