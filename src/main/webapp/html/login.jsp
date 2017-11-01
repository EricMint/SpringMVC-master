
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="zh-CN">--%>
<%--<head>--%>
  <%--<meta charset="utf-8">--%>
  <%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
  <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
  <%--<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->--%>
  <%--<title>添加用户</title>--%>

  <%--<!-- 新 Bootstrap 核心 CSS 文件 -->--%>
  <%--<link rel="stylesheet" href="/hospital/css/bootstrap.min.css">--%>

  <%--<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->--%>
  <%--<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->--%>
  <%--<!--[if lt IE 9]>--%>
  <%--<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>--%>
  <%--<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
  <%--<![endif]-->--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
  <%--<h1>登陆系统</h1>--%>
  <%--<hr/>--%>
  <%--<form:form action="login" method="post" role="form">--%>
    <%--<div class="form-group">--%>
      <%--<label for="userName">用户名:</label>--%>
      <%--<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名:"/>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
      <%--<label for="password">密码:</label>--%>
      <%--<input type="text" class="form-control" id="password" name="password" placeholder="请输入密码:"/>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
      <%--<button type="submit" class="btn btn-sm btn-success">提交</button>--%>
    <%--</div>--%>
  <%--</form:form>--%>
<%--</div>--%>


<%--<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->--%>
<%--<script src="/hospital/js/jquery.min.js"></script>--%>

<%--<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->--%>
<%--<script src="/hospital/js/bootstrap.min.js"></script>--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <%--<link rel="icon" href="../../favicon.ico">--%>

  <title>Signin Template for Bootstrap</title>

  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">

  <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  <link href="../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/signin.css" rel="stylesheet">

  <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
  <!--[if lt IE 9]><script src="../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
  <script src="../assets/js/ie-emulation-modes-warning.js"></script>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body>

<div class="container">
<%--<form:form action="login" method="post" role="form">--%>
  <form class="form-signin" action="login" method="post">
    <h2 class="form-signin-heading">Please sign in</h2>
    <label for="userName" class="sr-only">用户名</label>
    <input type="text" id="userName" name="userName" class="form-control" placeholder="用户名" required autofocus>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="密码" required>
    <div class="checkbox">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  </form>
<%--</form:form>--%>
</div> <!-- /container -->


<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

