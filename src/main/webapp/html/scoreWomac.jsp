<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>WOMAC 健康调查表</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="/hospital/css/bootstrap.min.css">
    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/hospital/css/grid.css">
    <!-- Loading Flat UI -->
    <link href="/hospital/css/flat-ui.css" rel="stylesheet">

    <link href="/hospital/css/score.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <input type="hidden" id="patientId" name="patientId" value="${patient.id}"/>
    <h5 align="center">WOMAC 健康调查表
        <button type="submit" id="modifyScore" class="btn btn-primary transition-duration">修改</button>
    </h5>
    <p align="center">请您根据过去一周里您的膝关节的状况，回答以下的各个问题。</p>
    <p align="center">（阴影部分为手术前情况，请在相应的空格中打勾。）</p>

    <div class="container-fluid">
        <div>
            <div class="navbar-form navbar-left" id="searchFrom">
                <div class="form-group">

                    <table class="table table-bordered table-striped">
                        <tr>
                            <th>在以下各种情况下，<br>您的膝关节的疼痛程度</th>
                            <th colspan="2">没有疼痛0分</th>
                            <th colspan="2">轻微的1分</th>
                            <th colspan="2">中等的2分</th>
                            <th colspan="2">严重的3分</th>
                            <th colspan="2">非常严重4分</th>
                        </tr>
                        <tr>
                            <td>在平地行走的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion1Before(this)"  id="question_1_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion1After(this)"   id="question_1_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion1Before(this)"  id="question_1_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion1After(this)"   id="question_1_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion1Before(this)"  id="question_1_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion1After(this)"   id="question_1_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion1Before(this)"  id="question_1_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion1After(this)"   id="question_1_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion1Before(this)"  id="question_1_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion1After(this)"   id="question_1_after_e"/></td>
                        </tr>
                        <tr>
                            <td>上下楼梯的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion2Before(this)"  id="question_2_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion2After(this)"   id="question_2_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion2Before(this)"  id="question_2_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion2After(this)"   id="question_2_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion2Before(this)"  id="question_2_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion2After(this)"   id="question_2_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion2Before(this)"  id="question_2_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion2After(this)"   id="question_2_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion2Before(this)"  id="question_2_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion2After(this)"   id="question_2_after_e"/></td>

                        </tr>
                        <tr>
                            <td>晚上在床上睡觉的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion3Before(this)"  id="question_3_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion3After(this)"   id="question_3_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion3Before(this)"  id="question_3_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion3After(this)"   id="question_3_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion3Before(this)"  id="question_3_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion3After(this)"   id="question_3_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion3Before(this)"  id="question_3_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion3After(this)"   id="question_3_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion3Before(this)"  id="question_3_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion3After(this)"   id="question_3_after_e"/></td>

                        </tr>
                        <tr>
                            <td>坐着或者躺着的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion4Before(this)"  id="question_4_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion4After(this)"   id="question_4_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion4Before(this)"  id="question_4_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion4After(this)"   id="question_4_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion4Before(this)"  id="question_4_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion4After(this)"   id="question_4_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion4Before(this)"  id="question_4_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion4After(this)"   id="question_4_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion4Before(this)"  id="question_4_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion4After(this)"   id="question_4_after_e"/></td>

                        </tr>
                        <tr>
                            <td>站立的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion5Before(this)"  id="question_5_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion5After(this)"   id="question_5_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion5Before(this)"  id="question_5_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion5After(this)"   id="question_5_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion5Before(this)"  id="question_5_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion5After(this)"   id="question_5_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion5Before(this)"  id="question_5_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion5After(this)"   id="question_5_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion5Before(this)"  id="question_5_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion5After(this)"   id="question_5_after_e"/></td>

                        </tr>
                    </table>

                    <table class="table table-bordered table-striped">
                        <tr>
                            <th></th>
                            <th colspan="2">没有僵硬0分</th>
                            <th colspan="2">轻微的1分</th>
                            <th colspan="2">中等的2分</th>
                            <th colspan="2">严重的3分</th>
                            <th colspan="2">非常严重4分</th>
                        </tr>
                        <tr>
                            <td>在您早晨刚醒的时候，您膝关节的僵硬程度如何</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion6Before(this)"  id="question_6_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion6After(this)"   id="question_6_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion6Before(this)"  id="question_6_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion6After(this)"   id="question_6_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion6Before(this)"  id="question_6_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion6After(this)"   id="question_6_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion6Before(this)"  id="question_6_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion6After(this)"   id="question_6_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion6Before(this)"  id="question_6_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion6After(this)"   id="question_6_after_e"/></td>
                        </tr>
                        <tr>
                            <td>白天，在您坐着、躺着或者休息以后，您关节的僵硬程度如何</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion7Before(this)"  id="question_7_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion7After(this)"   id="question_7_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion7Before(this)"  id="question_7_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion7After(this)"   id="question_7_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion7Before(this)"  id="question_7_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion7After(this)"   id="question_7_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion7Before(this)"  id="question_7_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion7After(this)"   id="question_7_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion7Before(this)"  id="question_7_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion7After(this)"   id="question_7_after_e"/></td>
                        </tr>
                    </table>

                    <table class="table table-bordered table-striped">
                        <tr>
                            <th></th>
                            <th colspan="2">没有困难0分	</th>
                            <th colspan="2">轻微的1分</th>
                            <th colspan="2">中度的2分</th>
                            <th colspan="2">严重的3分</th>
                            <th colspan="2">非常严重4分</th>
                        </tr>
                        <tr>
                            <td>下楼梯</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion8Before(this)"  id="question_8_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion8After(this)"   id="question_8_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion8Before(this)"  id="question_8_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion8After(this)"   id="question_8_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion8Before(this)"  id="question_8_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion8After(this)"   id="question_8_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion8Before(this)"  id="question_8_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion8After(this)"   id="question_8_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion8Before(this)"  id="question_8_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion8After(this)"   id="question_8_after_e"/></td>
                        </tr>
                        <tr>
                            <td>上楼梯</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion9Before(this)"  id="question_9_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion9After(this)"   id="question_9_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion9Before(this)"  id="question_9_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion9After(this)"   id="question_9_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion9Before(this)"  id="question_9_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion9After(this)"   id="question_9_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion9Before(this)"  id="question_9_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion9After(this)"   id="question_9_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion9Before(this)"  id="question_9_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion9After(this)"   id="question_9_after_e"/></td>
                        </tr>
                        <tr>
                            <td>从椅子上站起来的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion10Before(this)"  id="question_10_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion10After(this)"   id="question_10_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion10Before(this)"  id="question_10_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion10After(this)"   id="question_10_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion10Before(this)"  id="question_10_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion10After(this)"   id="question_10_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion10Before(this)"  id="question_10_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion10After(this)"   id="question_10_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion10Before(this)"  id="question_10_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion10After(this)"   id="question_10_after_e"/></td>
                        </tr>
                        <tr>
                            <td>站立</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion11Before(this)"  id="question_11_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion11After(this)"   id="question_11_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion11Before(this)"  id="question_11_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion11After(this)"   id="question_11_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion11Before(this)"  id="question_11_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion11After(this)"   id="question_11_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion11Before(this)"  id="question_11_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion11After(this)"   id="question_11_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion11Before(this)"  id="question_11_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion11After(this)"   id="question_11_after_e"/></td>
                        </tr>
                        <tr>
                            <td>弯腰</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion12Before(this)"  id="question_12_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion12After(this)"   id="question_12_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion12Before(this)"  id="question_12_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion12After(this)"   id="question_12_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion12Before(this)"  id="question_12_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion12After(this)"   id="question_12_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion12Before(this)"  id="question_12_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion12After(this)"   id="question_12_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion12Before(this)"  id="question_12_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion12After(this)"   id="question_12_after_e"/></td>
                        </tr>
                        <tr>
                            <td>在平地行走</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion13Before(this)"  id="question_13_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion13After(this)"   id="question_13_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion13Before(this)"  id="question_13_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion13After(this)"   id="question_13_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion13Before(this)"  id="question_13_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion13After(this)"   id="question_13_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion13Before(this)"  id="question_13_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion13After(this)"   id="question_13_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion13Before(this)"  id="question_13_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion13After(this)"   id="question_13_after_e"/></td>
                        </tr>
                        <tr>
                            <td>上、下汽车</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion14Before(this)"  id="question_14_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion14After(this)"   id="question_14_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion14Before(this)"  id="question_14_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion14After(this)"   id="question_14_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion14Before(this)"  id="question_14_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion14After(this)"   id="question_14_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion14Before(this)"  id="question_14_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion14After(this)"   id="question_14_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion14Before(this)"  id="question_14_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion14After(this)"   id="question_14_after_e"/></td>
                        </tr>
                        <tr>
                            <td>购物</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion15Before(this)"  id="question_15_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion15After(this)"   id="question_15_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion15Before(this)"  id="question_15_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion15After(this)"   id="question_15_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion15Before(this)"  id="question_15_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion15After(this)"   id="question_15_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion15Before(this)"  id="question_15_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion15After(this)"   id="question_15_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion15Before(this)"  id="question_15_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion15After(this)"   id="question_15_after_e"/></td>
                        </tr>
                        <tr>
                            <td>穿鞋、袜</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion16Before(this)"  id="question_16_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion16After(this)"   id="question_16_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion16Before(this)"  id="question_16_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion16After(this)"   id="question_16_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion16Before(this)"  id="question_16_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion16After(this)"   id="question_16_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion16Before(this)"  id="question_16_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion16After(this)"   id="question_16_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion16Before(this)"  id="question_16_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion16After(this)"   id="question_16_after_e"/></td>
                        </tr>
                        <tr>
                            <td>起床</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion17Before(this)"  id="question_17_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion17After(this)"   id="question_17_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion17Before(this)"  id="question_17_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion17After(this)"   id="question_17_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion17Before(this)"  id="question_17_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion17After(this)"   id="question_17_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion17Before(this)"  id="question_17_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion17After(this)"   id="question_17_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion17Before(this)"  id="question_17_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion17After(this)"   id="question_17_after_e"/></td>
                        </tr>
                        <tr>
                            <td>脱鞋、袜</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion18Before(this)"  id="question_18_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion18After(this)"   id="question_18_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion18Before(this)"  id="question_18_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion18After(this)"   id="question_18_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion18Before(this)"  id="question_18_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion18After(this)"   id="question_18_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion18Before(this)"  id="question_18_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion18After(this)"   id="question_18_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion18Before(this)"  id="question_18_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion18After(this)"   id="question_18_after_e"/></td>
                        </tr>
                        <tr>
                            <td>上床躺下的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion19Before(this)"  id="question_19_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion19After(this)"   id="question_19_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion19Before(this)"  id="question_19_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion19After(this)"   id="question_19_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion19Before(this)"  id="question_19_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion19After(this)"   id="question_19_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion19Before(this)"  id="question_19_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion19After(this)"   id="question_19_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion19Before(this)"  id="question_19_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion19After(this)"   id="question_19_after_e"/></td>
                        </tr>
                        <tr>
                            <td>进、出浴缸的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion20Before(this)"  id="question_20_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion20After(this)"   id="question_20_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion20Before(this)"  id="question_20_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion20After(this)"   id="question_20_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion20Before(this)"  id="question_20_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion20After(this)"   id="question_20_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion20Before(this)"  id="question_20_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion20After(this)"   id="question_20_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion20Before(this)"  id="question_20_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion20After(this)"   id="question_20_after_e"/></td>
                        </tr>
                        <tr>
                            <td>坐着</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion21Before(this)"  id="question_21_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion21After(this)"   id="question_21_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion21Before(this)"  id="question_21_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion21After(this)"   id="question_21_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion21Before(this)"  id="question_21_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion21After(this)"   id="question_21_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion21Before(this)"  id="question_21_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion21After(this)"   id="question_21_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion21Before(this)"  id="question_21_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion21After(this)"   id="question_21_after_e"/></td>
                        </tr>
                        <tr>
                            <td>坐马桶或者站起的时候</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion22Before(this)"  id="question_22_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion22After(this)"   id="question_22_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion22Before(this)"  id="question_22_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion22After(this)"   id="question_22_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion22Before(this)"  id="question_22_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion22After(this)"   id="question_22_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion22Before(this)"  id="question_22_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion22After(this)"   id="question_22_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion22Before(this)"  id="question_22_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion22After(this)"   id="question_22_after_e"/></td>
                        </tr>
                        <tr>
                            <td>干比较重的家务活</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion23Before(this)"  id="question_23_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion23After(this)"   id="question_23_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion23Before(this)"  id="question_23_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion23After(this)"   id="question_23_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion23Before(this)"  id="question_23_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion23After(this)"   id="question_23_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion23Before(this)"  id="question_23_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion23After(this)"   id="question_23_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion23Before(this)"  id="question_23_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion23After(this)"   id="question_23_after_e"/></td>
                        </tr>
                        <tr>
                            <td>干比较轻的家务活</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion24Before(this)"  id="question_24_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion24After(this)"   id="question_24_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion24Before(this)"  id="question_24_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion24After(this)"   id="question_24_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion24Before(this)"  id="question_24_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion24After(this)"   id="question_24_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion24Before(this)"  id="question_24_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion24After(this)"   id="question_24_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion24Before(this)"  id="question_24_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion24After(this)"   id="question_24_after_e"/></td>
                        </tr>
                        <tr>
                            <td>骑车</td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion25Before(this)"  id="question_25_before_a"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion25After(this)"   id="question_25_after_a"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion25Before(this)"  id="question_25_before_b"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion25After(this)"   id="question_25_after_b"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion25Before(this)"  id="question_25_before_c"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion25After(this)"   id="question_25_after_c"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion25Before(this)"  id="question_25_before_d"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion25After(this)"   id="question_25_after_d"/></td>
                            <td style="background-color: #8c8c8c;"><input type="checkbox" class="womac" onchange="setUniqueQuestion25Before(this)"  id="question_25_before_e"/></td>
                            <td                                   ><input type="checkbox" class="womac" onchange="setUniqueQuestion25After(this)"   id="question_25_after_e"/></td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
    <button type="submit" id="saveScore" hidden="hidden" class="btn btn-primary transition-duration">保存</button>

</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/hospital/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#saveScore").hide();
        scoreWomacGet();
        $(".womac").prop('disabled', true);
    });

    $("#modifyScore").click(function () {
        $(".womac").prop('disabled', false);
        $("#saveScore").show();
    });

    $("#saveScore").click(function () {
        scoreWomacSave();
        $(".womac").prop('disabled', true);
        $("#saveScore").hide();
    });

    function scoreWomacGet() {
        var questionList = ["在平地行走的时候", "上下楼梯的时候", "晚上在床上睡觉的时候", "坐着或者躺着的时候", "站立的时候", "在您早晨刚醒的时候，您膝关节的僵硬程度如何", "白天，在您坐着、躺着或者休息以后，您关节的僵硬程度如何", "下楼梯", "上楼梯",
            "从椅子上站起来的时候", "站立", "弯腰", "在平地行走", "上、下汽车", "购物", "穿鞋、袜", "起床", "脱鞋、袜", "上床躺下的时候", "进、出浴缸的时候", "坐着", "坐马桶或者站起的时候", "干比较重的家务活", "干比较轻的家务活", "骑车"];
        var questionIndexMap = new Map();
        for (var i = 0; i < questionList.length; i++) {
            var question = questionList[i];
            questionIndexMap.set(question, i + 1);
        }
        var patientId = $("#patientId").val();
        $.ajax({
                url: "/hospital/score/womac-get/" + patientId,
                type: "GET",
                dataType: "json",
                contentType: "application/xhtml+xml; charset=utf-8",
                success: function (result) {
                    console.log(result);
                    if (result.length < 1) {
                        return;
                    }
                    for (var i = 0; i < result.length; i++) {
                        var answer = result[i];
                        var questionIndex = questionIndexMap.get(answer.question);
                        var period = answer.period;
                        var level = answer.level;
                        var id = "question_" + questionIndex + "_" + period + "_" + level;
                        $("#" + id).prop("checked", true);
                    }
                },
                error: function () {

                }
            }
        );
    };

    function scoreWomacSave() {
        var questionList = ["在平地行走的时候", "上下楼梯的时候", "晚上在床上睡觉的时候", "坐着或者躺着的时候", "站立的时候", "在您早晨刚醒的时候，您膝关节的僵硬程度如何", "白天，在您坐着、躺着或者休息以后，您关节的僵硬程度如何", "下楼梯", "上楼梯",
            "从椅子上站起来的时候", "站立", "弯腰", "在平地行走", "上、下汽车", "购物", "穿鞋、袜", "起床", "脱鞋、袜", "上床躺下的时候", "进、出浴缸的时候", "坐着", "坐马桶或者站起的时候", "干比较重的家务活", "干比较轻的家务活", "骑车"];
        var periodList = ["before", "after"];
        var levelList = ["a", "b", "c", "d", "e"];
        var questionIndexMap = new Map();
        for (var i = 0; i < questionList.length; i++) {
            var question = questionList[i];
            questionIndexMap.set(question, i + 1);
        }
        var scoreMap = new Map();
        for (var i = 0; i < levelList.length; i++) {
            var level = levelList[i];
            scoreMap.set(level, i);
        }

        console.log(data);

        var dataList = [];
        for (var i = 0; i < questionList.length; i++) {
            var questionIndex = i + 1;

            for (var j = 0; j < periodList.length; j++) {
                var period = periodList[j];
                for (var k = 0; k < levelList.length; k++) {
                    var level = levelList[k];
                    var id = "question_" + questionIndex + "_" + period + "_" + level;
                    if ($("#" + id).prop('checked')) {
                        var data = {};
                        data.patientId = $("#patientId").val();
                        data.question = questionList[i];
                        data.period = period;
                        data.level = level;
                        data.levelScore = scoreMap.get(level);
                        dataList.push(data)
                    }
                }
            }
        }

        for (var i = 0; i < dataList.length; i++) {
            var data = dataList[i];
            $.ajax({
                    url: "/hospital/score/womac",
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
        }

    };


    function setUniqueQuestion1Before(current){
        if(current.checked){
            $("input[id*='question_1_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion1After(current){
        if(current){
            $("input[id*='question_1_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion2Before(current){
        if(current.checked){
            $("input[id*='question_2_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion2After(current){
        if(current){
            $("input[id*='question_2_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion3Before(current){
        if(current.checked){
            $("input[id*='question_3_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion3After(current){
        if(current){
            $("input[id*='question_3_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion4Before(current){
        if(current.checked){
            $("input[id*='question_4_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion4After(current){
        if(current){
            $("input[id*='question_4_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion5Before(current){
        if(current.checked){
            $("input[id*='question_5_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion5After(current){
        if(current){
            $("input[id*='question_5_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion6Before(current){
        if(current.checked){
            $("input[id*='question_6_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion6After(current){
        if(current){
            $("input[id*='question_6_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion7Before(current){
        if(current.checked){
            $("input[id*='question_7_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion7After(current){
        if(current){
            $("input[id*='question_7_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion8Before(current){
        if(current.checked){
            $("input[id*='question_8_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion8After(current){
        if(current){
            $("input[id*='question_8_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion9Before(current){
        if(current.checked){
            $("input[id*='question_9_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion9After(current){
        if(current){
            $("input[id*='question_9_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion10Before(current){
        if(current.checked){
            $("input[id*='question_10_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion10After(current){
        if(current){
            $("input[id*='question_10_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion11Before(current){
        if(current.checked){
            $("input[id*='question_11_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion11After(current){
        if(current){
            $("input[id*='question_11_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion12Before(current){
        if(current.checked){
            $("input[id*='question_12_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion12After(current){
        if(current){
            $("input[id*='question_12_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion13Before(current){
        if(current.checked){
            $("input[id*='question_13before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion13After(current){
        if(current){
            $("input[id*='question_13_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion14Before(current){
        if(current.checked){
            $("input[id*='question_14_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion14After(current){
        if(current){
            $("input[id*='question_14_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion15Before(current){
        if(current.checked){
            $("input[id*='question_15_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion15After(current){
        if(current){
            $("input[id*='question_15_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion16Before(current){
        if(current.checked){
            $("input[id*='question_16_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion16After(current){
        if(current){
            $("input[id*='question_16_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion17Before(current){
        if(current.checked){
            $("input[id*='question_17_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion17After(current){
        if(current){
            $("input[id*='question_17_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion18Before(current){
        if(current.checked){
            $("input[id*='question_18_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion18After(current){
        if(current){
            $("input[id*='question_18_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion19Before(current){
        if(current.checked){
            $("input[id*='question_19_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion19After(current){
        if(current){
            $("input[id*='question_19_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion20Before(current){
        if(current.checked){
            $("input[id*='question_20_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion20After(current){
        if(current){
            $("input[id*='question_20_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion21Before(current){
        if(current.checked){
            $("input[id*='question_21_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion21After(current){
        if(current){
            $("input[id*='question_21_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion22Before(current){
        if(current.checked){
            $("input[id*='question_22_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion22After(current){
        if(current){
            $("input[id*='question_22_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion23Before(current){
        if(current.checked){
            $("input[id*='question_23_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion23After(current){
        if(current){
            $("input[id*='question_23_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion24Before(current){
        if(current.checked){
            $("input[id*='question_24_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion24After(current){
        if(current){
            $("input[id*='question_24_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion25Before(current){
        if(current.checked){
            $("input[id*='question_25_before']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };

    function setUniqueQuestion25After(current){
        if(current){
            $("input[id*='question_25_after']").prop('checked', false);
            $(current).prop('checked', true);
        }
    };
</script>

</body>
</html>