<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加用户体格检查信息</title>
    <link rel="stylesheet" href="/hospital/css/bootstrap.min.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>
<!-- Loading Flat UI -->
<link href="/hospital/css/flat-ui.css" rel="stylesheet">

<div class="container">
    <h1>添加用户体格检查信息</h1>
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


    <h5>${physicalClassBList[0].physicalClassAName} </h5>
    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[0].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[0].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[0].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId0">检查关节:</label>
            <select id="physicalClassCId0" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD0(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[0].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId0">关节方位:</label>
            <select id="physicalClassDId0" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result0" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[1].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[1].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[1].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId1">检查关节:</label>
            <select id="physicalClassCId1" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD1(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[1].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId1">关节方位:</label>
            <select id="physicalClassDId1" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result1" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[2].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[2].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[2].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId2">检查关节:</label>
            <select id="physicalClassCId2" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD2(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[2].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId2">关节方位:</label>
            <select id="physicalClassDId2" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result2" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[3].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[3].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[3].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId3">检查关节:</label>
            <select id="physicalClassCId3" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD3(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[3].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId3">关节方位:</label>
            <select id="physicalClassDId3" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result3" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[4].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[4].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[4].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId4">检查关节:</label>
            <select id="physicalClassCId4" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD4(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[4].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId4">关节方位:</label>
            <select id="physicalClassDId4" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result4" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[5].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[5].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[5].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId5">检查关节:</label>
            <select id="physicalClassCId5" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD5(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[5].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId5">关节方位:</label>
            <select id="physicalClassDId5" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result5" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[6].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[6].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[6].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId6">检查关节:</label>
            <select id="physicalClassCId6" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD6(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[6].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId6">关节方位:</label>
            <select id="physicalClassDId6" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result6" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[7].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[7].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[7].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId7">检查关节:</label>
            <select id="physicalClassCId7" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD7(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[7].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId7">关节方位:</label>
            <select id="physicalClassDId7" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result7" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <form:form action="/hospital/physicalRecord/createPost" target="dummyframe" method="post" class="form-inline" role="form">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
        <input type="hidden" name="physicalClassAId" value="${physicalClassBList[8].physicalClassAId}"/>
        <input type="hidden" name="physicalClassBId" value="${physicalClassBList[8].physicalClassBId}"/>

        <div class="form-group">
            <h6>${physicalClassBList[8].physicalClassBName} </h6>
        </div>

        <div class="form-group">
            <label for="physicalClassCId8">检查关节:</label>
            <select id="physicalClassCId8" name="physicalClassCId" data-placeholder="请选择"
                    onchange="initClassD8(this.value);">
                <option value="">请选择</option>
                <c:forEach items="${physicalClassBList[8].physicalClassCEntityList}" var="physicalClassC">
                    <option value="${physicalClassC.physicalClassCId}">${physicalClassC.physicalClassCName}</option>
                </c:forEach>
            </select>

        </div>

        <div class="form-group">
            <label for="physicalClassDId8">关节方位:</label>
            <select id="physicalClassDId8" name="physicalClassDId" data-placeholder="请选择">
            </select>
        </div>

        <div class="form-group">
            <label class="sr-only" for="result0">测量数值</label>
            <input type="text" class="form-control" id="result8" name="result" placeholder="请输入测量数值">
        </div>
        <button type="submit" class="btn btn-sm btn-success">添加</button>
    </form:form>

    <a href="/hospital/patient/detail/isManager/${patient.id}" type="button" class="btn btn-sm btn-success">返回列表页</a>

    <iframe width="0" height="0" border="0" name="dummyframe" id="dummyframe"></iframe>

</div>

<script src="/hospital/js/bootstrap.min.js"></script>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
<%--<script src="/js/jquery.form.js"/>--%>
<%--<script src="/js/common.js"/>--%>
<script>

    function initClassD0(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId0").empty();
            $("#physicalClassDId0").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId0").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId0").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId0").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD1(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId1").empty();
            $("#physicalClassDId1").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId1").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId1").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId1").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD2(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId2").empty();
            $("#physicalClassDId2").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId2").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId2").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId2").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD3(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId3").empty();
            $("#physicalClassDId3").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId3").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId3").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId3").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD4(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId4").empty();
            $("#physicalClassDId4").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId4").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId4").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId4").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD5(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId5").empty();
            $("#physicalClassDId5").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId5").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId5").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId5").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD6(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId6").empty();
            $("#physicalClassDId6").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId6").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId6").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId6").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD7(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId7").empty();
            $("#physicalClassDId7").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId7").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId7").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId7").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }

    function initClassD8(physicalClassCId) {
        if (physicalClassCId == "") {
            $("#physicalClassDId8").empty();
            $("#physicalClassDId8").append("<option value=''>请选择</option>");
            return;
        }
        $("#physicalClassDId8").empty();
        var url = "/hospital/physical/classD/" + physicalClassCId;
        $.ajax({
            url: url,
            type: "GET",
            contentType: "application/json",
            dataType: "json",
            success: function (result) {
                console.log(result);
                if (result != "") {
                    var list = result.classDEntityList;
                    if (list.length < 1) {
                        $("#physicalClassDId8").append("<option value=''>暂无可选</option>");
                    }
                    var options = "<option value=''>请选择</option>";
                    $.each(list, function (index, item) {
                        options = options + "<option value='" + item["physicalClassDId"] + "'>" + item["physicalClassDName"] + "</option>";
                    });
                    $("#physicalClassDId8").append(options);
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }


</script>

</body>
</html>
