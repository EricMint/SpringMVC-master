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
            <select id="imageClassAId" name="imageClassAId" data-placeholder="请选择"
                    onchange="initClassB(this.value);">
                    <%--onchange="initClassB()">--%>
                    <%--onchange="initClassB(this.options[this.options.selectedIndex].value)">--%>
                <option value="">请选择</option>
                <c:forEach items="${imageClassAList}" var="imageClassA">
                    <option value="${imageClassA.imageClassAId}">${imageClassA.imageClassAName}</option>
                </c:forEach>
            </select>

            <label for="imageClassBId">具体部位:</label>
            <select id="imageClassBId" name="imageClassBId">
                    <%--<option value="">请选择</option>--%>
                    <%--<c:forEach items="${imageClassAList}" var="imageClassA">--%>
                    <%--<option value="${imageClassA.imageClassAId}">${imageClassA.imageClassAName}</option>--%>
                    <%--</c:forEach>--%>
            </select>


                <%--<select class="form-control custom-select-all" name="companyId" data-placeholder="请选择"--%>
                <%--onchange="initDepartment(this.options[this.options.selectedIndex].value)">--%>
                <%--<option value="">请选择</option>--%>
                <%--<#if companyList??>--%>
                <%--<#list companyList as company>--%>
                <%--<option value="${company.id!}">${company.name!}</option>--%>
                <%--</#list>--%>
                <%--</#if>--%>
                <%--</select>--%>

        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/js/bootstrap.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--<script src="/js/jquery.form.js"/>--%>
<%--<script src="/js/common.js"/>--%>
<script>
//    $(document).ready(function () {
//
////        initPageView();
////        search();
////        initSubmitEvent();
//    });

    //        function checkPhone() {
    //            if($("#copyPhone").val().trim().length == 11) {
    //                var data = {};
    //                data.phone = ""+$("#copyPhone").val();
    //                data.employeeId = "";
    //                $.ajax({
    //                            url: "/management/employee/checkPhone",
    //                            type: "GET",
    //                            data: data,
    //                            contentType: "application/json;",
    //                            success: function (result) {
    //                                if (!result) {
    //                                    swal({
    //                                        title: "",
    //                                        text: "{"+$("#copyPhone").val()+"}电话号码已经存在!",
    //                                        confirmButtonText: "确定"
    //                                    });
    //                                    $("#copyPhone").val('');
    //                                    $("#copyPhone").focus();
    //                                }
    //                            }
    //                        }
    //                );
    //            }
    //        }
    //
    //
    //
    //
    //    function initPageView() {
    //        btnClickEffect("#btn-search", " 搜索", 2000);
    //        equalSearchBox();
    //        searchPage();
    //    }


    function initClassB(imageClassAId) {
//        var x = document.getElementById("imageClassAId").value;
//        alert(x);
//        alert(imageClassAId);
//        document.getElementById("demo").innerHTML = "You selected: " + x;

//        alert("The input value has changed. The new value is: " + imageClassAId);

//        if (imageClassAId == "") {
//            $("#imageClassAId").empty();
//            $("#imageClassAId").append("<option value=''>请选择</option>");
//            return;
//        }
//        $("#imageClassBId").empty();
        var url = "/image/classB/" + imageClassAId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classBEntityList;
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["imageClassBId"] + "'>" + item["imageClassBName"] + "</option>";
                    });
                    $("#imageClassBId").append(options);
                }
            },
            error: function(e){
                console.log(e);
            }
        });
    }


</script>

</body>
</html>
