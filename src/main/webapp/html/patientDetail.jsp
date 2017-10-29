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
    <c:if test="${isManager}">
        <h1>用户详情 <a href="/patient/update/${patient.id}" type="button" class="btn btn-sm btn-warning">修改</a></h1>
    </c:if>
    <c:if test="${!isManager}">
        <h1>用户详情</h1>
    </c:if>

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

    <c:if test="${empty physicalRecordList}">
        <p class="bg-warning">
        <c:if test="${isManager}">
            <h1>无体格检查记录 <a href="/physicalRecord/create/${patient.id}" type="button"
                           class="btn btn-default btn-sm">添加</a>
            </h1>
        </c:if>
        <c:if test="${!isManager}">
            <h1>无体格检查记录 </h1>

        </c:if>
        </h1>
        <br/>
        </p>
    </c:if>
    <c:if test="${!empty physicalRecordList}">
        <c:if test="${isManager}">
            <h1>体格检查记录 <a href="/physicalRecord/create/${patient.id}" type="button"
                          class="btn btn-default btn-sm">添加</a></h1>
        </c:if>
        <c:if test="${!isManager}">
            <h1>体格检查记录 </h1>
        </c:if>

        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>体格检查部位</th>
                <th>检查关节</th>
                <th>具体关节</th>
                <th>关节方位</th>
                <th>测量数值</th>
            </tr>

            <c:forEach items="${physicalRecordList}" var="physicalRecord">
                <tr>
                    <td>${physicalRecord.physicalRecordId}</td>
                    <td>${physicalRecord.physicalClassAName}</td>
                    <td>${physicalRecord.physicalClassBName}</td>
                    <td>${physicalRecord.physicalClassCName}</td>
                    <td>${physicalRecord.physicalClassDName}</td>
                    <td>${physicalRecord.result}</td>
                    <c:if test="${isManager}">
                        <td>
                            <a href="/physicalRecord/update/${physicalRecord.physicalRecordId}" type="button"
                               class="btn btn-sm btn-warning">修改</a>
                            <a href="/physicalRecord/delete/${physicalRecord.physicalRecordId}" type="button"
                               class="btn btn-sm btn-danger">删除</a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty scoreMarkList}">
        <p class="bg-warning">
        <c:if test="${isManager}">
            <h1>无功能评分记录 <a href="/scoreRecord/create/${patient.id}" type="button" class="btn btn-default btn-sm">添加</a>
        </c:if>
        <c:if test="${!isManager}">
            <h1>无功能评分记录 </h1>
        </c:if>
        </h1>
        <br/>
        </p>
    </c:if>
    <c:if test="${!empty scoreMarkList}">
        <c:if test="${isManager}">
            <h1>功能评分记录 <a href="/scoreRecord/create/${patient.id}" type="button" class="btn btn-default btn-sm">添加</a>
        </c:if>
        <c:if test="${!isManager}">
            <h1>功能评分记录 </h1>
        </c:if>
        </h1>

        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>功能评分名称</th>
                <th>得分</th>
            </tr>

            <c:forEach items="${scoreMarkList}" var="scoreMarkRecord">
                <tr>
                    <td>${scoreMarkRecord.scoreMarkId}</td>
                    <td>${scoreMarkRecord.scoreClassAName}</td>
                    <td>${scoreMarkRecord.result}</td>
                    <c:if test="${isManager}">
                        <td>
                            <a href="/scoreRecord/createDetail/${patient.id}/${scoreMarkRecord.scoreClassAId}"
                               type="button"
                               class="btn btn-sm btn-warning">修改</a>
                            <a href="/scoreMark/delete/${scoreMarkRecord.scoreMarkId}" type="button"
                               class="btn btn-sm btn-danger">删除</a>
                        </td>
                    </c:if>

                </tr>
            </c:forEach>
        </table>
    </c:if>


    <c:if test="${empty imageRecordList}">
        <p class="bg-warning">
        <c:if test="${isManager}">
            <h1>无影像检查记录 <a href="/imageRecord/create/${patient.id}" type="button" class="btn btn-default btn-sm">添加</a>
            </h1>
        </c:if>
        <c:if test="${!isManager}">
            <h1>无影像检查记录</h1>
        </c:if>
        <br/>
        </p>
    </c:if>
    <c:if test="${!empty imageRecordList}">
        <c:if test="${isManager}">
            <h1>影像检查记录 <a href="/imageRecord/create/${patient.id}" type="button" class="btn btn-default btn-sm">添加</a>
            </h1>
        </c:if>
        <c:if test="${!isManager}">
            <h1>影像检查记录</h1>
        </c:if>
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
                    <c:if test="${isManager}">
                        <td>
                            <a href="/imageRecord/update/${imageRecord.imageRecordId}" type="button"
                               class="btn btn-sm btn-warning">修改</a>
                            <a href="/imageRecord/delete/${imageRecord.imageRecordId}" type="button"
                               class="btn btn-sm btn-danger">删除</a>
                        </td>
                    </c:if>

                </tr>
            </c:forEach>
        </table>
    </c:if>

    <a href="/patient/list/${userEntity.userName}" type="button" class="btn btn-sm btn-success">返回列表页</a>

</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/js/bootstrap.min.js"></script>
</body>
</html>