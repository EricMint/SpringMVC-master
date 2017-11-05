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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>北医三院-病人列表</h1>
    <hr/>

    <c:if test="${isManager}">
        <h3>所有用户 <a href="/hospital/patient/add" type="button" class="btn btn-default btn-sm">添加</a></h3>
    </c:if>

    <c:if test="${!isManager}">
        <h3>所有用户</h3>
    </c:if>

    <nav class="navbar navbar-default" role="navigation" >
        <div class="container-fluid">
            <%--<div class="navbar-header">--%>
            <%--<a class="navbar-brand" href="#">菜鸟教程</a>--%>
            <%--</div>--%>
            <div>
                <form class="navbar-form navbar-left" id="searchFrom" method="post" action="/hospital/patient/search">
                    <div class="form-group">
                        <label for="patientNumber">人员编号：</label>
                        <input type="text" id="patientNumber" name="patientNumber" class="form-control"
                               placeholder="请输入人员编号">

                        <label for="realName">姓名：</label>
                        <input type="text" id="realName" name="realName" class="form-control" placeholder="请输入姓名">

                        <label for="disease">疾病类型：</label>
                        <input type="text" id="disease" name="disease" class="form-control" placeholder="请输入疾病类型">

                        <label for="ethnicity">民族：</label>
                        <input type="text" id="ethnicity" name="ethnicity" class="form-control" placeholder="请输入民族">

                        <label for="gender">性别：</label>
                        <input type="text" id="gender" name="gender" class="form-control" placeholder="请输入性别">
                    </div>
                    <button type="submit" id="btn-search" class="btn btn-default">搜索</button>
                </form>
                <%--<button type="button" class="btn btn-default navbar-btn">--%>
                <%--导航栏按钮--%>
                <%--</button>--%>
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

            <c:forEach items="${patientList}" var="patient">
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
    </c:if>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/hospital/js/bootstrap.min.js"></script>
<script src="/hospital/js/jquery.myPagination6.0.js"></script>

<script>
//    $(document).ready(function () {
//        search();
//    });
//
//    function search() {
//        $("#btn-search").on("click", function () {
//            $('input[type=text]:not(:disabled)').each(function () {
//                $(this).val($.trim($(this).val()));
//            });
//            searchPage();
//        });
//
//    }
//
//    function searchPage() {
//        $("#pagination").myPagination({
////            panel: {
////                tipInfo_on: true,
////                tipInfo: '<span class="skipPage">共 {sumPage} 页</span>'
////            },
//            ajax: {
//                on: true,
//                type: "POST",
//                url: "/hospital/patient/search",
//                param: $('#searchFrom').serializeJson(),
//                pageCountId: "pageCount",
//                dataType: "html",
//                contentType: 'application/json; charset=utf-8',
//                callback: function (data) {
////                    $("#recordCount").text($(data).find("#totalCount").val());
//                    $("table>tbody").replaceWith(data);
//
//                }
//            }
//        });
//    }

</script>
</body>
</html>
