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
    <link rel="stylesheet" href="/hospital/css/bootstrap.min.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/hospital/css/grid.css">
    <!-- Loading Flat UI -->
    <link href="/hospital/css/flat-ui.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <c:if test="${isManager}">
        <h4>用户详情 <a type="button" id="modifyUser" class="btn btn-sm btn-warning">修改</a>
        </h4>
    </c:if>
    <c:if test="${!isManager}">
        <h4>用户详情</h4>
    </c:if>

    <hr>
    <div class="row">
        <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>

        <div class="col-xs-6 col-md-2">
            <label for="patientNumber">人员编号:</label>
            <input type="text" style="width:80px;background-color:#FFFFFF" id="patientNumber" name="patientNumber"
                   value="${patient.patientNumber}" disabled="disabled"/>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="realName">姓名:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="realName" name="realName"
                   value="${patient.realName}" disabled="disabled"/>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="ethnicity">民族:</label>
            <input type="hidden" id="currentEthnicity" name="currentEthnicity" value="${patient.ethnicity}"/>
            <select name="ethnicity" id="ethnicity" required disabled="disabled"
                    style="width:100px;background-color:#FFFFFF">
                <option value="" disabled hidden>请选择</option>
            </select>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="gender">性别:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="gender" name="gender"
                   value="${patient.gender}" disabled="disabled"/>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="age">年龄:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="age" name="age"
                   value="${patient.age}" disabled="disabled"/>
        </div>
        <div class="col-xs-6 col-md-2">
            <label for="age">身高:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="height" name="height"
                   value="${patient.height}" disabled="disabled"/>
        </div>
    </div>
    <%--<div class="tagsinput-primary">--%>
    <%--<label for="disease">疾病类型:</label>--%>
    <%--<input type="text" id="disease" name="disease" placeholder="请输入疾病类型(按回车键可输入多个):" class="tagsinput tagsinput-typeahead input-lg form-control" />--%>
    <%--</div>--%>
    <div class="row">
        <div class="col-xs-6 col-md-2">
            <label for="weight">体重:</label>
            <input type="text" style="width:100px;background-color:#FFFFFF" id="weight" name="weight"
                   value="${patient.weight}" disabled="disabled"/>
        </div>
        <div class="col-xs-12 col-md-10">
            <label for="weight">疾病类型:</label>
            <input type="text" style="width:600px;background-color:#FFFFFF" id="disease" name="disease"
                   value="${patient.disease}" disabled="disabled"/>
        </div>
    </div>
    <button type="button" id="saveUser" style="display: none" class="btn btn-sm btn-warning">保存</button>
    <hr>

    <div class="row">
        <h4 style="display: inline-block">体格检查</h4>
        <div class="btn-group" style="bottom: 5px">
            <button type="button" class="btn btn-info" id="show_physical_jizhu">脊柱组</button>
            <button type="button" class="btn btn-info" id="show_physical_kuanguanjie">髋关节</button>
        </div>
    </div>

    <div id="physical_jizhu">
        <h5>脊柱查体
            <button type="submit" id="modify_physical_jizhu" class="btn btn-primary transition-duration">修改</button>
        </h5>

        <div class="container-fluid">
            <div>
                <div class="navbar-form navbar-left">
                    <div class="form-group">
                        <label style="font-weight:bold; font-size: larger;">侧突畸形:</label>
                        <select style="width:120px;color:black" id="physical_jizhu_cetujixing_has_symptom"
                                name="physical_jizhu_cetujixing_has_symptom"
                                class="form-control" disabled="true"
                                onchange="PhysicalJizhuCetujixingOnChange(this.value)">
                            <option value="" disabled selected="selected">请选择</option>
                        </select>
                        <br>

                        <table class="table table-bordered table-striped" id="physical_jizhu_cetujixing_table"
                               hidden="hidden">
                            <tr>
                                <th>前突</th>
                                <th>后突</th>
                                <th>侧突</th>
                            </tr>
                            <tr>
                                <td><input disabled="disabled" class="physical_jizhu_cetujixing" style="width:100px"
                                           type="text"
                                           id="physical_jizhu_cetujixing_qiantu"/></td>
                                <td><input disabled="disabled" class="physical_jizhu_cetujixing" style="width:100px"
                                           type="text"
                                           id="physical_jizhu_cetujixing_houtu"/></td>
                                <td><input disabled="disabled" class="physical_jizhu_cetujixing" style="width:100px"
                                           type="text"
                                           id="physical_jizhu_cetujixing_cetu"/></td>
                            </tr>
                        </table>

                        <label style="font-weight:bold; font-size: larger;">活动度:</label><br>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>部位</th>
                                <th>前屈</th>
                                <th>后伸</th>
                                <th>左侧弯</th>
                                <th>右侧弯</th>
                                <th>左侧旋</th>
                                <th>右侧旋</th>
                            </tr>
                            <tr>
                                <td>颈椎</td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="jingzhui_qianqu"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="jingzhui_houshen"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="jingzhui_zuocewan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="jingzhui_youcewan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="jingzhui_zuocexuan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="jingzhui_youcexuan"/></td>
                            </tr>
                            <tr>
                                <td>胸椎</td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="xiongzhui_qianqu"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="xiongzhui_houshen"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="xiongzhui_zuocewan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="xiongzhui_youcewan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="xiongzhui_zuocexuan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="xiongzhui_youcexuan"/></td>
                            </tr>
                            <tr>
                                <td>腰椎</td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="yaozhui_qianqu"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="yaozhui_houshen"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="yaozhui_zuocewan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="yaozhui_youcewan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="yaozhui_zuocexuan"/></td>
                                <td><input disabled="disabled" class="huodongdu" style="width:100px" type="text"
                                           id="yaozhui_youcexuan"/></td>
                            </tr>
                        </table>

                        <label style="font-weight:bold; font-size: larger;">压痛:</label><br>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>部位</th>
                                <th>具体部位</th>
                            </tr>
                            <tr>
                                <td>颈椎</td>
                                <td>
                                    <input type="checkbox" id="physical_jizhu_yatong_jing1"
                                           name="physical_jizhu_yatong_jing1" value="颈1"><label
                                        for="physical_jizhu_yatong_jing1">颈1</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_jing2"
                                           name="physical_jizhu_yatong_jing2" value="颈1"><label
                                        for="physical_jizhu_yatong_jing2">颈2</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_jing3"
                                           name="physical_jizhu_yatong_jing3" value="颈1"><label
                                        for="physical_jizhu_yatong_jing3">颈3</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_jing4"
                                           name="physical_jizhu_yatong_jing4" value="颈1"><label
                                        for="physical_jizhu_yatong_jing4">颈4</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_jing5"
                                           name="physical_jizhu_yatong_jing5" value="颈1"><label
                                        for="physical_jizhu_yatong_jing5">颈5</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_jing6"
                                           name="physical_jizhu_yatong_jing6" value="颈1"><label
                                        for="physical_jizhu_yatong_jing6">颈6</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_jing7"
                                           name="physical_jizhu_yatong_jing7" value="颈1"><label
                                        for="physical_jizhu_yatong_jing7">颈7</label>
                                </td>
                            </tr>
                            <tr>
                                <td>胸椎</td>
                                <td>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong1" name="physical_jizhu_yatong_xiong1" value="胸1"><label for="physical_jizhu_yatong_xiong1">胸1</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong2" name="physical_jizhu_yatong_xiong2" value="胸2"><label for="physical_jizhu_yatong_xiong2">胸2</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong3" name="physical_jizhu_yatong_xiong3" value="胸3"><label for="physical_jizhu_yatong_xiong3">胸3</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong4" name="physical_jizhu_yatong_xiong4" value="胸4"><label for="physical_jizhu_yatong_xiong4">胸4</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong5" name="physical_jizhu_yatong_xiong5" value="胸5"><label for="physical_jizhu_yatong_xiong5">胸5</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong6" name="physical_jizhu_yatong_xiong6" value="胸6"><label for="physical_jizhu_yatong_xiong6">胸6</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong7" name="physical_jizhu_yatong_xiong7" value="胸7"><label for="physical_jizhu_yatong_xiong7">胸7</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong8" name="physical_jizhu_yatong_xiong8" value="胸8"><label for="physical_jizhu_yatong_xiong8">胸8</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong9" name="physical_jizhu_yatong_xiong9" value="胸9"><label for="physical_jizhu_yatong_xiong9">胸9</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong10" name="physical_jizhu_yatong_xiong10" value="胸10"><label for="physical_jizhu_yatong_xiong10">胸10</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong11" name="physical_jizhu_yatong_xiong11" value="胸11"><label for="physical_jizhu_yatong_xiong11">胸11</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_xiong12" name="physical_jizhu_yatong_xiong12" value="胸12"><label for="physical_jizhu_yatong_xiong12">胸12</label>
                                </td>
                            </tr>
                            <tr>
                                <td>腰椎</td>
                                <td>
                                    <input type="checkbox" id="physical_jizhu_yatong_yao1" name="physical_jizhu_yatong_yao1" value="腰1"><label for="physical_jizhu_yatong_yao1">腰1</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_yao2" name="physical_jizhu_yatong_yao2" value="腰2"><label for="physical_jizhu_yatong_yao2">腰2</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_yao3" name="physical_jizhu_yatong_yao3" value="腰3"><label for="physical_jizhu_yatong_yao3">腰3</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_yao4" name="physical_jizhu_yatong_yao4" value="腰4"><label for="physical_jizhu_yatong_yao4">腰4</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_yao5" name="physical_jizhu_yatong_yao5" value="腰5"><label for="physical_jizhu_yatong_yao5">腰5</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_yao6" name="physical_jizhu_yatong_yao6" value="骶椎"><label for="physical_jizhu_yatong_yao6">骶椎</label>
                                    <input type="checkbox" id="physical_jizhu_yatong_yao7" name="physical_jizhu_yatong_yao7" value="尾椎"><label for="physical_jizhu_yatong_yao7">尾椎</label>
                                </td>
                            </tr>
                        </table>

                        <label style="font-weight:bold; font-size: larger;">叩击痛:</label><br>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>部位</th>
                                <th>具体部位</th>
                            </tr>
                            <tr>
                                <td>颈椎</td>
                                <td>
                                    <input type="checkbox" id="physical_jizhu_koujitong_jing1"
                                           name="physical_jizhu_koujitong_jing1" value="颈1"><label
                                        for="physical_jizhu_koujitong_jing1">颈1</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_jing2"
                                           name="physical_jizhu_koujitong_jing2" value="颈1"><label
                                        for="physical_jizhu_koujitong_jing2">颈2</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_jing3"
                                           name="physical_jizhu_koujitong_jing3" value="颈1"><label
                                        for="physical_jizhu_koujitong_jing3">颈3</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_jing4"
                                           name="physical_jizhu_koujitong_jing4" value="颈1"><label
                                        for="physical_jizhu_koujitong_jing4">颈4</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_jing5"
                                           name="physical_jizhu_koujitong_jing5" value="颈1"><label
                                        for="physical_jizhu_koujitong_jing5">颈5</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_jing6"
                                           name="physical_jizhu_koujitong_jing6" value="颈1"><label
                                        for="physical_jizhu_koujitong_jing6">颈6</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_jing7"
                                           name="physical_jizhu_koujitong_jing7" value="颈1"><label
                                        for="physical_jizhu_koujitong_jing7">颈7</label>
                                </td>
                            </tr>
                            <tr>
                                <td>胸椎</td>
                                <td>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong1" name="physical_jizhu_koujitong_xiong1" value="胸1"><label for="physical_jizhu_koujitong_xiong1">胸1</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong2" name="physical_jizhu_koujitong_xiong2" value="胸2"><label for="physical_jizhu_koujitong_xiong2">胸2</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong3" name="physical_jizhu_koujitong_xiong3" value="胸3"><label for="physical_jizhu_koujitong_xiong3">胸3</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong4" name="physical_jizhu_koujitong_xiong4" value="胸4"><label for="physical_jizhu_koujitong_xiong4">胸4</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong5" name="physical_jizhu_koujitong_xiong5" value="胸5"><label for="physical_jizhu_koujitong_xiong5">胸5</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong6" name="physical_jizhu_koujitong_xiong6" value="胸6"><label for="physical_jizhu_koujitong_xiong6">胸6</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong7" name="physical_jizhu_koujitong_xiong7" value="胸7"><label for="physical_jizhu_koujitong_xiong7">胸7</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong8" name="physical_jizhu_koujitong_xiong8" value="胸8"><label for="physical_jizhu_koujitong_xiong8">胸8</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong9" name="physical_jizhu_koujitong_xiong9" value="胸9"><label for="physical_jizhu_koujitong_xiong9">胸9</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong10" name="physical_jizhu_koujitong_xiong10" value="胸10"><label for="physical_jizhu_koujitong_xiong10">胸10</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong11" name="physical_jizhu_koujitong_xiong11" value="胸11"><label for="physical_jizhu_koujitong_xiong11">胸11</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_xiong12" name="physical_jizhu_koujitong_xiong12" value="胸12"><label for="physical_jizhu_koujitong_xiong12">胸12</label>
                                </td>
                            </tr>
                            <tr>
                                <td>腰椎</td>
                                <td>
                                    <input type="checkbox" id="physical_jizhu_koujitong_yao1" name="physical_jizhu_koujitong_yao1" value="腰1"><label for="physical_jizhu_koujitong_yao1">腰1</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_yao2" name="physical_jizhu_koujitong_yao2" value="腰2"><label for="physical_jizhu_koujitong_yao2">腰2</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_yao3" name="physical_jizhu_koujitong_yao3" value="腰3"><label for="physical_jizhu_koujitong_yao3">腰3</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_yao4" name="physical_jizhu_koujitong_yao4" value="腰4"><label for="physical_jizhu_koujitong_yao4">腰4</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_yao5" name="physical_jizhu_koujitong_yao5" value="腰5"><label for="physical_jizhu_koujitong_yao5">腰5</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_yao6" name="physical_jizhu_koujitong_yao6" value="骶椎"><label for="physical_jizhu_koujitong_yao6">骶椎</label>
                                    <input type="checkbox" id="physical_jizhu_koujitong_yao7" name="physical_jizhu_koujitong_yao7" value="尾椎"><label for="physical_jizhu_koujitong_yao7">尾椎</label>
                                </td>
                            </tr>
                        </table>

                        <label style="font-weight:bold; font-size: larger;">压颈试验:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuYajingshiyan"
                                name="physical-jizhu-shiyan"
                                class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                        <label style="font-weight:bold; font-size: larger;">臂丛牵拉试验:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuBiconglashiyan"
                                name="physical-jizhu-shiyan"
                                class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                        <label style="font-weight:bold; font-size: larger;">拾物试验:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuShiwushiyan"
                                name="physical-jizhu-shiyan"
                                class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                        <label style="font-weight:bold; font-size: larger;">直腿抬高试验:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuZhituitaigaoshiyan"
                                name="physical-jizhu-shiyan"
                                class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                        <label style="font-weight:bold; font-size: larger;">股神经牵拉试验:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physicalJizhuGushenjingqianlashiyan"
                                name="physical-jizhu-shiyan"
                                class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select>

                    </div>
                </div>
            </div>
        </div>
        <button type="submit" id="save_physical_jizhu" hidden="hidden" class="btn btn-primary transition-duration">保存</button>

    </div>

    <div id="physical_kuanguanjie">
        <h5>髋关节
            <button type="submit" id="modify_physical_kuanguanjie" class="btn btn-primary transition-duration">修改
            </button>
        </h5>


        <div class="container-fluid">
            <div>
                <div class="navbar-form navbar-left">
                    <div class="form-group">
                        <label style="font-weight:bold; font-size: larger;">步态:</label>
                        <input disabled="disabled" class="physical_kuanguanjie_butai" type="text" id="physical_kuanguanjie_butai" placeholder="请输入形态"/>
                        <br>

                        <label style="font-weight:bold; font-size: larger;">畸形:</label>
                        <select style="width:120px;color:black" id="physical_kuanguanjie_jixing_has_symptom"
                                name="physical_kuanguanjie_jixing_has_symptom"
                                class="form-control" disabled="true"
                                onchange="physicalKuanguanjieJixingOnChange(this.value)">
                            <option value="" disabled selected="selected">请选择</option>
                        </select>
                        <br>
                        <table class="table table-bordered table-striped" id="physical_kuanguanjie_jixing_table"
                               hidden="hidden">
                            <tr>
                                <th>内收畸形</th>
                                <th>外展畸形</th>
                                <th>旋转畸形</th>
                            </tr>
                            <tr>
                                <td><input disabled="disabled" class="physical_kuanguanjie_jixing" style="width:100px"
                                           type="text"
                                           id="physical_kuanguanjie_jixing_neishou"/></td>
                                <td><input disabled="disabled" class="physical_kuanguanjie_jixing" style="width:100px"
                                           type="text"
                                           id="physical_kuanguanjie_jixing_waizhan"/></td>
                                <td><input disabled="disabled" class="physical_kuanguanjie_jixing" style="width:100px"
                                           type="text"
                                           id="physical_kuanguanjie_jixing_xuanzhuan"/></td>
                            </tr>
                        </table>

                        <label style="font-weight:bold; font-size: larger;">压痛:</label>
                        <select style="width:120px;color:black" id="physical_kuanguanjie_yatong_has_symptom"
                                name="physical_kuanguanjie_yatong_has_symptom"
                                class="form-control" disabled="true"
                                onchange="physicalKuanguanjieYatongOnChange(this.value)">
                            <option value="" disabled selected="selected">请选择</option>
                        </select>
                        <input disabled="disabled" class="physical_kuanguanjie_yatong" type="text" id="physical_kuanguanjie_yatong" placeholder="请输入部位"/>
                        <br>

                        <label style="font-weight:bold; font-size: larger;">活动度:</label><br>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>屈曲</th>
                                <th>后伸</th>
                                <th>内旋</th>
                                <th>外旋</th>
                                <th>内收</th>
                                <th>外展</th>
                            </tr>
                            <tr>
                                <td><input disabled="disabled" class="physical_kuanguanjie_huodongdu" style="width:100px" type="text" id="physical_kuanguanjie_huodongdu_ququ"/></td>
                                <td><input disabled="disabled" class="physical_kuanguanjie_huodongdu" style="width:100px" type="text" id="physical_kuanguanjie_huodongdu_houshen"/></td>
                                <td><input disabled="disabled" class="physical_kuanguanjie_huodongdu" style="width:100px" type="text" id="physical_kuanguanjie_huodongdu_neixuan"/></td>
                                <td><input disabled="disabled" class="physical_kuanguanjie_huodongdu" style="width:100px" type="text" id="physical_kuanguanjie_huodongdu_waixuan"/></td>
                                <td><input disabled="disabled" class="physical_kuanguanjie_huodongdu" style="width:100px" type="text" id="physical_kuanguanjie_huodongdu_neishou"/></td>
                                <td><input disabled="disabled" class="physical_kuanguanjie_huodongdu" style="width:100px" type="text" id="physical_kuanguanjie_huodongdu_waizhan"/></td>
                            </tr>
                        </table>

                        <label style="font-weight:bold; font-size: larger;">纵向叩击痛:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physical_kuanguanjie_zongxiangkoujitong" name="physical_kuanguanjie_shiyan" class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                        <label style="font-weight:bold; font-size: larger;">Alice征:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physical_kuanguanjie_alice" name="physical_kuanguanjie_shiyan" class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                        <label style="font-weight:bold; font-size: larger;">Trendlenburg征:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physical_kuanguanjie_trendlenburg" name="physical_kuanguanjie_shiyan" class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                        <label style="font-weight:bold; font-size: larger;">单足站立试验:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physical_kuanguanjie_danzuzhanlishiyan" name="physical_kuanguanjie_shiyan" class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                        <label style="font-weight:bold; font-size: larger;">4字试验:</label>
                        <select style="width:120px;color:black" disabled="disabled" id="physical_kuanguanjie_4zishiyan" name="physical_kuanguanjie_shiyan" class="form-control">
                            <option value="" disabled selected="selected">请选择</option>
                        </select> &nbsp;&nbsp;

                    </div>
                </div>
            </div>
        </div>
        <button type="submit" id="save_physical_kuanguanjie" hidden="hidden" class="btn btn-primary transition-duration">保存</button>

    </div>

    <h5>功能评分记录
        <div class="btn-group">
            <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">查看 <span
                    class="caret"></span></button>
            <ul role="menu" class="dropdown-menu">
                <li>
                    <a href="/hospital/score/womac/${patient.id}">WOMAC 健康调查表</a>
                </li>
            </ul>
        </div>
    </h5>

    <%--<c:if test="${empty scoreMarkList}">--%>
        <%--<p class="bg-warning">--%>
        <%--<c:if test="${isManager}">--%>
            <%--<h5>无功能评分记录 <a href="/hospital/scoreRecord/create/${patient.id}" type="button"--%>
                           <%--class="btn btn-default btn-sm">添加</a>--%>
        <%--</c:if>--%>
        <%--<c:if test="${!isManager}">--%>
            <%--<h5>无功能评分记录 </h5>--%>
        <%--</c:if>--%>
        <%--</h5>--%>
        <%--<br/>--%>
        <%--</p>--%>
    <%--</c:if>--%>
    <%--<c:if test="${!empty scoreMarkList}">--%>
        <%--<c:if test="${isManager}">--%>
            <%--<h5>功能评分记录 <a href="/hospital/scoreRecord/create/${patient.id}" type="button"--%>
                          <%--class="btn btn-default btn-sm">添加</a>--%>
        <%--</c:if>--%>
        <%--<c:if test="${!isManager}">--%>
            <%--<h5>功能评分记录 </h5>--%>
        <%--</c:if>--%>
        <%--</h5>--%>

        <%--<table class="table table-bordered table-striped">--%>
            <%--<tr>--%>
                <%--<th>ID</th>--%>
                <%--<th>功能评分名称</th>--%>
                <%--<th>得分</th>--%>
            <%--</tr>--%>

            <%--<c:forEach items="${scoreMarkList}" var="scoreMarkRecord">--%>
                <%--<tr>--%>
                    <%--<td>${scoreMarkRecord.scoreMarkId}</td>--%>
                    <%--<td>${scoreMarkRecord.scoreClassAName}</td>--%>
                    <%--<td>${scoreMarkRecord.result}</td>--%>
                    <%--<c:if test="${isManager}">--%>
                        <%--<td>--%>
                            <%--<a href="/hospital/scoreRecord/createDetail/${patient.id}/${scoreMarkRecord.scoreClassAId}"--%>
                               <%--type="button"--%>
                               <%--class="btn btn-sm btn-warning">修改</a>--%>
                            <%--<a href="/hospital/scoreMark/delete/${scoreMarkRecord.scoreMarkId}" type="button"--%>
                               <%--class="btn btn-sm btn-danger">删除</a>--%>
                        <%--</td>--%>
                    <%--</c:if>--%>

                <%--</tr>--%>
            <%--</c:forEach>--%>
        <%--</table>--%>
    <%--</c:if>--%>


    <div class="row">
        <h4 style="display: inline-block">影像检查</h4>
        <div class="btn-group" style="bottom: 5px">
            <button type="button" class="btn btn-info" id="show_image_jizhu">脊柱</button>
            <button type="button" class="btn btn-info" id="show_image_kuanguanjie">髋关节</button>
        </div>
    </div>

    <jsp:include page="imageJizhu.jsp"/>

    <div id="image_kuanguanjie">
        <h5>髋关节</h5>
    <div id="image_kuanjiuce">
        <h5>髋臼侧数据测量
            <button type="submit" id="modify_image_kuanjiuce" class="btn btn-primary transition-duration">修改
            </button>
        </h5>

        <div class="container-fluid">
            <div>
                <div class="navbar-form navbar-left">
                    <div class="form-group">
                        <label style="font-weight:bold; font-size: larger;" id="image_kuanjiuce_name_1">1.髋臼周长:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_1" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">2.横断位髋臼直径:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_2" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">3.矢状位髋臼直径:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_3" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">4.横断位前方髋臼-股骨间距离:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_4" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">5.横断位后方髋臼-股骨间距离:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_5" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">6.冠状位外侧缘髋臼-股骨头间距离:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_6" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">7.冠状位最高点髋臼-股骨头间距离:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_7" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">8.横断位髋臼最薄的厚度:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_8" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">9.横断位卵圆窝宽度:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_9" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">10.横断位卵圆窝深度:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_10" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">11.冠状位髋臼最薄的厚度:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_11" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">12.冠状位卵圆窝的宽度:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_12" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">13.冠状位卵圆窝的深度:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_13" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">14.横断位髋臼前后缘连线与髋臼围成的面积:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_14" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">15.横断位髋臼-股骨头间面积:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_15" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">16.横断位股骨头未被髋臼包容的面积:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_16" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">17.水平线与髋臼最上缘和最前缘连线的夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_17" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">18.横断位冠状轴与股骨头中心和髋臼前缘连线夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_18" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">19.横断位冠状轴与股骨头中心和髋臼后缘连线夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_19" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">20.冠状位CE角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_20" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">21.冠状位髋臼最下缘和垂线夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_21" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">22.横断位髋臼前后缘连线与矢状面夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_22" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">23.冠状位髋臼上下缘连线与垂线夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_23" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">24.横断位上髋臼前缘与卵圆窝后缘连线与冠状轴夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_24" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">25.横断位上髋臼后缘与卵圆窝后缘连线与冠状轴夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_25" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">26.冠状位髋臼上缘及卵圆窝上缘连线与水平面夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_26" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">27.冠状位髋臼下缘及卵圆窝上缘连线与水平面夹角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_27" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">28.冠状位髋臼深度:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_28" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">29.横断面髋臼深度:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_29" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">30.冠状位髋臼最高点水平线与髋臼最外缘水平线间垂直距离:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_30" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">31.股骨头内侧缘与髋臼外侧缘垂线间距离:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_31" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">32.股骨头直径:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_32" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">33.颈干角:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_33" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">34.覆盖率是15/14:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_34" placeholder="请输入"/>
                        <br>
                        <label style="font-weight:bold; font-size: larger;">35.髋臼头指数是31/32:</label>
                        <input disabled="disabled" class="image_kuanjiuce" type="text" id="image_kuanjiuce_35" placeholder="请输入"/>
                        <br>

                    </div>
                </div>
            </div>
        </div>
        <button type="submit" id="save_image_kuanjiuce" hidden="hidden"
                class="btn btn-primary transition-duration">保存
        </button>

    </div>

    <div id="image_guguce">
        <h5>股骨侧测量
            <button type="submit" id="modify_image_guguce" class="btn btn-primary transition-duration">修改
            </button>
        </h5>

        <div class="container-fluid">
            <div>
                <div class="navbar-form navbar-left">
                    <div class="form-group">
                        <label style="font-weight:bold; font-size: larger;">活动度:</label><br>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>方向</th>
                                <th>横径(mm)</th>
                                <th>矢状径(mm)</th>
                                <th>髓腔截面积</th>

                            </tr>
                            <tr>
                                <td>-25水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-25_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-25_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-25_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>-15水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-15_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-15_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-15_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>-10水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-10_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-10_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-10_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>-5水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-5_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-5_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_-5_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>0水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_0_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_0_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_0_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>5水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_5_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_5_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_5_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>10水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_10_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_10_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_10_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>15水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_15_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_15_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_15_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>20水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_20_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_20_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_20_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>30水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_30_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_30_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_30_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>40水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_40_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_40_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_40_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>50水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_50_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_50_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_50_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>60水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_60_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_60_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_60_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>70水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_70_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_70_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_70_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>80水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_80_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_80_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_80_suiqiang"/></td>
                            </tr>
                            <tr>
                                <td>90水平</td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_90_hengjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_90_shizhuangjing"/></td>
                                <td><input disabled="disabled" class="image_guguce" style="width:100px" type="text"id="image_guguce_90_suiqiang"/></td>
                            </tr>
                        </table>

                        <label style="font-weight:bold; font-size: larger;">股骨前倾角:</label>
                        <input disabled="disabled" class="image_guguce" type="text" id="image_guguce_guguqian_hengjing" placeholder="请输入"/>
                        <br>
                    </div>
                </div>
            </div>
        </div>
        <button type="submit" id="save_image_guguce" hidden="hidden"
                class="btn btn-primary transition-duration">保存
        </button>

    </div>

    </div>
    <%--<c:if test="${empty imageRecordList}">--%>
        <%--<p class="bg-warning">--%>
        <%--<c:if test="${isManager}">--%>
            <%--<h5>无影像检查记录 <a href="/hospital/imageRecord/create/${patient.id}" type="button"--%>
                           <%--class="btn btn-default btn-sm">添加</a>--%>
            <%--</h5>--%>
        <%--</c:if>--%>
        <%--<c:if test="${!isManager}">--%>
            <%--<h5>无影像检查记录</h5>--%>
        <%--</c:if>--%>
        <%--<br/>--%>
        <%--</p>--%>
    <%--</c:if>--%>
    <%--<c:if test="${!empty imageRecordList}">--%>
        <%--<c:if test="${isManager}">--%>
            <%--<h5>影像检查记录--%>
                <%--<div class="btn-group">--%>
                    <%--<button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">添加 <span--%>
                            <%--class="caret"></span></button>--%>
                    <%--<ul role="menu" class="dropdown-menu">--%>
                        <%--<c:forEach items="${imageClassAList}" var="imageClassA">--%>
                            <%--<li>--%>
                                <%--<a href="/hospital/imageRecord/create/${patient.id}/${imageClassA.imageClassAId}">${imageClassA.imageClassAName}</a>--%>
                            <%--</li>--%>
                        <%--</c:forEach>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</h5>--%>
        <%--</c:if>--%>
        <%--<c:if test="${!isManager}">--%>
            <%--<h5>影像检查记录</h5>--%>
        <%--</c:if>--%>
        <%--<table class="table table-bordered table-striped">--%>
            <%--<tr>--%>
                <%--<th>ID</th>--%>
                <%--<th>影像检查部位</th>--%>
                <%--<th>检查关节</th>--%>
                <%--<th>具体关节</th>--%>
                <%--<th>关节方位</th>--%>
                <%--<th>具体位置</th>--%>
                <%--<th>测量数值</th>--%>
            <%--</tr>--%>

            <%--<c:forEach items="${imageRecordList}" var="imageRecord">--%>
                <%--<tr>--%>
                    <%--<td>${imageRecord.imageRecordId}</td>--%>
                    <%--<td>${imageRecord.imageClassAName}</td>--%>
                    <%--<td>${imageRecord.imageClassBName}</td>--%>
                    <%--<td>${imageRecord.imageClassCName}</td>--%>
                    <%--<td>${imageRecord.imageClassDName}</td>--%>
                    <%--<td>${imageRecord.imageClassEName}</td>--%>
                    <%--<td>${imageRecord.result}</td>--%>
                    <%--<c:if test="${isManager}">--%>
                        <%--<td>--%>
                            <%--<a href="/hospital/imageRecord/update/${imageRecord.imageRecordId}" type="button"--%>
                               <%--class="btn btn-sm btn-warning">修改</a>--%>
                            <%--<a href="/hospital/imageRecord/delete/${imageRecord.imageRecordId}" type="button"--%>
                               <%--class="btn btn-sm btn-danger">删除</a>--%>
                        <%--</td>--%>
                    <%--</c:if>--%>

                <%--</tr>--%>
            <%--</c:forEach>--%>
        <%--</table>--%>
    <%--</c:if>--%>

    <c:if test="${isManager}">
        <a href="/hospital/patient/list/isManager" type="button" class="btn btn-sm btn-success">返回列表页</a>
    </c:if>
    <c:if test="${!isManager}">
        <a href="/hospital/patient/list/notManager" type="button" class="btn btn-sm btn-success">返回列表页</a>
    </c:if>

    <%--<a href="/hospital/patient/list/${userEntity.userName}" type="button" class="btn btn-sm btn-success">返回列表页</a>--%>

</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/hospital/js/bootstrap.min.js"></script>

<script src="/hospital/js/physical_jizhu.js"></script>
<script src="/hospital/js/physical_kuanguanjie.js"></script>
<script src="/hospital/js/image_kuanjiuce.js"></script>
<script src="/hospital/js/image_guguce.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#save_physical_jizhu").hide();
        $("#save_physical_kuanguanjie").hide();
        initEthnicity();
        $("#physical_jizhu").show();
        $("#physical_kuanguanjie").hide();
        physicalKuanguanjieGet();

        imageKuanjiuceGet();
        imageGuguceGet();
        // $("#image_guguce").hide();

        $("#save_image_kuanjiuce").hide();
        $("#save_image_guguce").hide();

        $("#image_jizhu").show();
        ImageJizhuGet();
        $("#image_kuanguanjie").hide();

        $("#save_image_jizhu").hide();

    });

    $("#modifyUser").click(function () {
        $("input").prop('disabled', false);
        $("select").prop('disabled', false);
        $('input').css('background-color', '#F0F8FF'); // change the background color
        $('select').css('background-color', '#F0F8FF'); // change the background color
        $("#saveUser").show();
    });

    $("#saveUser").click(function () {
        $("input").prop('disabled', true);
        $("select").prop('disabled', true);
        $('input').css('background-color', '#FFFFFF'); // change the background color
        $('select').css('background-color', '#FFFFFF'); // change the background color
        $("#saveUser").hide();

        var data = {};
        data.patientId = $("#patientId").val();
        data.patientNumber = $("#patientNumber").val();
        data.realName = $("#realName").val();
        data.ethnicity = $("#ethnicity").val();
        data.gender = $("#gender").val();
        data.age = $("#age").val();
        data.height = $("#height").val();
        data.weight = $("#weight").val();
        data.disease = $("#disease").val();
        console.log(data);
        $.ajax({
                url: "/hospital/patient/updatePost",
                type: "post",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                    console.log(result)
                },
                error: function () {

                }
            }
        );
    });

    function initEthnicity() {
        var currentEthnicity = $("#currentEthnicity");
        var ethnicity = $("#ethnicity");
        var ethnicityList = ["汉族", "蒙古族", "回族", "藏族", "维吾尔族", "苗族", "彝族", "壮族", "布依族", "朝鲜族", "满族", "侗族", "瑶族", "白族", "土家族",
            "哈尼族", "哈萨克族", "傣族", "黎族", "傈僳族", "佤族", "畲族", "高山族", "拉祜族", "水族", "东乡族", "纳西族", "景颇族", "柯尔克孜族",
            "土族", "达斡尔族", "仫佬族", "羌族", "布朗族", "撒拉族", "毛南族", "仡佬族", "锡伯族", "阿昌族", "普米族", "塔吉克族", "怒族", "乌孜别克族",
            "俄罗斯族", "鄂温克族", "德昂族", "保安族", "裕固族", "京族", "塔塔尔族", "独龙族", "鄂伦春族", "赫哲族", "门巴族", "珞巴族", "基诺族"];
        for (var i = 0; i < ethnicityList.length; i++) {
            var ethnicityElement = ethnicityList[i];
            if (currentEthnicity[0].value == ethnicityElement) {
                ethnicity.append("<option value=" + ethnicityElement + " " + "selected>" + ethnicityElement + "</option>");
            } else {
                ethnicity.append("<option value=" + ethnicityElement + ">" + ethnicityElement + "</option>");
            }
        }
    };


    $("#show_physical_jizhu").click(function () {
        $("#physical_jizhu").show();
        $("#physical_kuanguanjie").hide();
        physicalJizhuGet();
    });

    $("#show_physical_kuanguanjie").click(function () {
        $("#physical_kuanguanjie").show();
        $("#physical_jizhu").hide();
        physicalKuanguanjieGet();
    });

    $("#show_image_jizhu").click(function () {
        $("#image_jizhu").show();
        $("#image_kuanguanjie").hide();

        ImageJizhuGet();
        // $("#image_guguce").hide();
        // imageKuanjiuceGet();
        // imageGuguceGet();
    });

    $("#show_image_kuanguanjie").click(function () {
        $("#image_kuanguanjie").show();
        $("#image_jizhu").hide();
        // $("#image_guguce").hide();
        imageKuanjiuceGet();
        imageGuguceGet();
    });

    // $("#show_image_guguce").click(function () {
    //     $("#image_guguce").show();
    //     $("#image_kuanjiuce").hide();
    //     imageGuguceGet();
    // });

</script>

</body>
</html>