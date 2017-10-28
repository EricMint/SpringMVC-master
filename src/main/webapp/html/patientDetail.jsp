<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>病人详情</title>

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
            <td>${patient.id}</td>
        </tr>
        <tr>
            <th>人员编号</th>
            <td>${patient.patientNumber}</td>
        </tr>
        <tr>
            <th>姓名</th>
            <td>${patient.realName}</td>
        </tr>
        <tr>
            <th>疾病类型</th>
            <td>${patient.disease}</td>
        </tr>
        <tr>
            <th>民族</th>
            <td>${patient.ethnicity}</td>
        </tr>
        <tr>
            <th>性别</th>
            <td>${patient.gender}</td>
        </tr>
        <tr>
            <th>年龄</th>
            <td>${patient.age}</td>
        </tr>
        <tr>
            <th>身高</th>
            <td>${patient.height}</td>
        </tr>
        <tr>
            <th>体重</th>
            <td>${patient.weight}</td>
        </tr>

    </table>

    <c:if test="${empty imageRecordList}">
        <p class="bg-warning">
            <br/>
            无影像检查记录 <a href="/imageRecord/create/${patient.id}" type="button" class="btn btn-sm btn-success">添加</a>
            <br/>
            <br/>
        </p>
    </c:if>
    <c:if test="${!empty imageRecordList}">
        <h1>影像检查记录</h1>
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>影像检查部位</th>
                <th>检查关节</th>
                <th>具体关节</th>
                <th>关节方位</th>
                <th>具体位置</th>
                <th>测量数值</th>
            </tr>

            <c:forEach items="${imageRecordList}" var="imageRecord">
                <tr>
                    <td>${imageRecord.imageRecordId}</td>
                    <td>${imageRecord.imageClassAName}</td>
                    <td>${imageRecord.imageClassBName}</td>
                    <td>${imageRecord.imageClassCName}</td>
                    <td>${imageRecord.imageClassDName}</td>
                    <td>${imageRecord.imageClassEName}</td>
                    <td>${imageRecord.result}</td>
                    <td>
                        <a href="/imageRecord/update/${imageRecord.imageRecordId}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="/imageRecord/delete/${imageRecord.imageRecordId}" type="button" class="btn btn-sm btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty physicalRecordList}">
        <p class="bg-warning">
            <br/>
            无体格检查记录 <a href="/exam/addPhysicalRecord/${user.id}" type="button" class="btn btn-sm btn-success">添加</a>
            <br/>
            <br/>
        </p>
    </c:if>
    <c:if test="${!empty physicalRecordList}">
        <h1>体格检查记录</h1>
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>影像检查部位</th>
                <th>具体部位</th>
                <th>方位</th>
            </tr>

            <c:forEach items="${physicalRecordList}" var="physicalRecord">
                <tr>
                    <td>${physicalRecord.id}</td>
                    <td>${physicalRecord.physicalExaminationCategoryName}</td>
                    <td>${physicalRecord.physicalExaminationItemName}</td>
                    <td>${physicalRecord.physicalExaminationItemOptionName}</td>
                        <%--<td>--%>
                        <%--<a href="/showPatientDetail/${user.id}" type="button" class="btn btn-sm btn-success">详情</a>--%>
                        <%--<a href="/updatePatient/${user.id}" type="button" class="btn btn-sm btn-warning">修改</a>--%>
                        <%--<a href="/deletePatient/${user.id}" type="button" class="btn btn-sm btn-danger">删除</a>--%>
                        <%--</td>--%>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <a href="/patient/list" type="button" class="btn btn-sm btn-success">返回列表页</a>

</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>