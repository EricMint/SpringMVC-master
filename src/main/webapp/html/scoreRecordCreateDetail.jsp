<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加功能评分</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery.min.js"></script>

<div class="container">
    <h1>添加功能评分信息</h1>
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


    <div>
        <div>
            <c:forEach items="${scoreClassBList}" var="classB">
                <div>${classB.groupLabel}</div>
                <div>${classB.scoreClassBName}</div>
                <div>
                    <c:forEach items="${classB.classCResponseList}" var="classC">
                        <div>
                            <div>
                                <c:if test="${classC.selected}">
                                    <input type="radio" id="scoreClassCId" checked="checked"
                                           onchange="submitAnswer(${patient.id},${classC.scoreClassCId})">
                                    <label for="scoreClassCId">${classC.scoreClassCName}</label>
                                </c:if>
                            </div>
                            <div>
                                <c:if test="${!classC.selected}">
                                    <input type="radio" id="scoreClassCId"
                                           onchange="submitAnswer(${patient.id},${classC.scoreClassCId})">
                                    <label for="scoreClassCId">${classC.scoreClassCName}</label>
                                </c:if>
                            </div>

                                <%--<c:if test="${!classB.groupLabel}">--%>
                                <%--<input type="radio" id="scoreClassCId"--%>
                                <%--onchange="submitAnswer(${scoreRecordId},${classC.scoreClassCId})">--%>
                                <%--<label for="scoreClassCId">${classC.scoreClassCName}</label>--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${classC.classDResponseList.size()>0}">--%>
                                <%--<input type="radio" id="scoreClassCId" >--%>
                                <%--<label for="scoreClassCId">${classC.scoreClassCName}</label>--%>
                                <%--<c:forEach items="${classC.classDResponseList}" var="classD">--%>
                                <%--<div>--%>
                                <%--<input type="radio" id="scoreClassDId" name="scoreClassDId"--%>
                                <%--class="scoreClassDId">--%>
                                <%--<label for="scoreClassDId">${classD.scoreClassDName}</label>--%>
                                <%--</div>--%>
                                <%--</c:forEach>--%>
                                <%--</c:if>--%>
                        </div>
                    </c:forEach>

                </div>

            </c:forEach>

        </div>

    </div>


    <form:form action="/scoreRecord/createScorePost" method="post" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" id="patientId" name="scoreClassAId" value="${scoreClassAId}"/>

        <div class="form-group">
            <label for="result">最终评分</label>
            <input type="text" class="form-control" id="result" name="result" value="${result}" placeholder="请输入评分:"/>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交评分</button>
        </div>
    </form:form>
</div>

<script src="/js/bootstrap.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--<script src="/js/jquery.form.js"/>--%>
<%--<script src="/js/common.js"/>--%>
<script>

    function submitAnswer(patientId, scoreClassCId) {
        if (patientId == "") {

            return;
        }
        var url = "/scoreRecord/createDetail/" + patientId + "/answer/" + scoreClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
//                if (result != "") {
//                    var list = result.classDEntityList;
//                    if (list.length < 1) {
//                        $("#scoreClassDId").append("<option value=''>暂无可选</option>");
//                    }
//                    var options = "<option value=''>请选择</option>";
//                    $.each(list, function (index, item) {
//                        options = options + "<option value='" + item["scoreClassDId"] + "'>" + item["scoreClassDName"] + "</option>";
//                    });
//                    $("#scoreClassDId").append(options);
//                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }


    //    $('input[type="radio"]').on('change', function() {
    //        $('.scoreClassDId').prop("checked", false); // Reset all child checkbox
    //        // Check if it's a parent or child being checked
    //        if ($(this).hasClass('scoreClassCId')) {
    //            $('.scoreClassDId').prop('required', false); // Set all children to not required
    //            $(this).next('ul').find('.scoreClassDId').prop('required', true);  // Set the children of the selected parent to required
    //        }
    //    });


</script>

</body>
</html>
