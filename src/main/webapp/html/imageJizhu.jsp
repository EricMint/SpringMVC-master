<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="zh-CN">--%>
<%--<head>--%>
    <%--<meta charset="utf-8">--%>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->--%>
    <%--<title>病人详情</title>--%>

    <%--<!-- 新 Bootstrap 核心 CSS 文件 -->--%>
    <%--<link rel="stylesheet" href="/hospital/css/bootstrap.min.css">--%>
    <%--<!-- Custom styles for this template -->--%>
    <%--<link rel="stylesheet" href="/hospital/css/grid.css">--%>
    <%--<!-- Loading Flat UI -->--%>
    <%--<link href="/hospital/css/flat-ui.css" rel="stylesheet">--%>

    <%--<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->--%>
    <%--<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->--%>
    <%--<!--[if lt IE 9]>--%>
    <%--<script src="https://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>--%>
    <%--<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>--%>
    <%--<![endif]-->--%>
<%--</head>--%>
<body>
<%--<div class="container">--%>
    <div id="image_jizhu">
        <h5>脊柱
            <button type="submit" id="modify_image_jizhu" class="btn btn-primary transition-duration">修改
            </button>
        </h5>
        <table class="table table-bordered table-striped" style="table-layout: fixed">
            <tr>
                <th colspan="2">颈椎</th>
                <th>颈1</th>
                <th>颈2</th>
                <th>颈3</th>
                <th>颈4</th>
                <th>颈5</th>
                <th>颈6</th>
                <th>颈7</th>
            </tr>
            <tr>
                <td colspan="2">椎体矢状径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎体横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎体高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎板宽度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎板厚度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">双侧椎板夹角(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎管横径(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎管矢径(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">棘突长度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">棘突高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎弓根高度(单位mm) </td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎弓根宽度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎弓根横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎弓根矢径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎弓根间距(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">矢状夹角(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎弓根-椎板角等(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">水平位椎体上矢状径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shangshizhuangjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shangshizhuangjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shangshizhuangjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shangshizhuangjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shangshizhuangjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shangshizhuangjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shangshizhuangjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">水平位椎体中矢状径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhongshizhuangjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhongshizhuangjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhongshizhuangjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhongshizhuangjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhongshizhuangjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhongshizhuangjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhongshizhuangjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">水平位椎体下矢状径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiashizhuangjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiashizhuangjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiashizhuangjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiashizhuangjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiashizhuangjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiashizhuangjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiashizhuangjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">水平位椎体上横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shanghengjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shanghengjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shanghengjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shanghengjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shanghengjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shanghengjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_shanghengjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">水平位椎体中横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhonghengjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhonghengjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhonghengjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhonghengjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhonghengjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhonghengjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhonghengjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">水平位椎体下横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiahengjing_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiahengjing_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiahengjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiahengjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiahengjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiahengjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_xiahengjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">横突孔间距(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_hengtukongjianju_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_hengtukongjianju_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_hengtukongjianju_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_hengtukongjianju_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_hengtukongjianju_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_hengtukongjianju_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_hengtukongjianju_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎体前高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitiqiangaodu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitiqiangaodu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitiqiangaodu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitiqiangaodu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitiqiangaodu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitiqiangaodu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitiqiangaodu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎体中高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitizhonggaodu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitizhonggaodu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitizhonggaodu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitizhonggaodu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitizhonggaodu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitizhonggaodu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitizhonggaodu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎体后高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihougaodu_jing_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihougaodu_jing_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihougaodu_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihougaodu_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihougaodu_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihougaodu_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitihougaodu_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎体钩突高(单位mm)</td>
                <td bgcolor="#808080"></td>
                <td bgcolor="#808080"></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutugao_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutugao_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutugao_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutugao_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutugao_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎体勾突基底宽(单位mm)</td>
                <td bgcolor="#808080"></td>
                <td bgcolor="#808080"></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidikuan_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidikuan_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidikuan_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidikuan_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidikuan_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎体勾突基底长(单位mm)</td>
                <td bgcolor="#808080"></td>
                <td bgcolor="#808080"></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidichang_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidichang_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidichang_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidichang_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuitigoutujidichang_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎弓根上下径(单位mm)</td>
                <td bgcolor="#808080"></td>
                <td bgcolor="#808080"></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshangxiajing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshangxiajing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshangxiajing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshangxiajing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshangxiajing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎弓根左右径(单位mm)</td>
                <td bgcolor="#808080"></td>
                <td bgcolor="#808080"></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzuoyoujing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzuoyoujing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzuoyoujing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzuoyoujing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzuoyoujing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎间孔短径(单位mm)</td>
                <td bgcolor="#808080"></td>
                <td bgcolor="#808080"></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongduanjing_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongduanjing_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongduanjing_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongduanjing_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongduanjing_jing_7"/></td>
            </tr>
            <tr>
                <td colspan="2">椎间孔面积(mm2)</td>
                <td bgcolor="#808080"></td>
                <td bgcolor="#808080"></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100px " type="text" id="image_jizhu_zhuijiankongmianji_jing_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongmianji_jing_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongmianji_jing_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongmianji_jing_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_jingzhui" style="width:100%" type="text" id="image_jizhu_zhuijiankongmianji_jing_7"/></td>
            </tr>
        </table>
        <table class="table table-bordered table-striped" style="table-layout: fixed">
            <tr>
                <th colspan="3">胸椎</th>
                <th>胸1</th>
                <th>胸2</th>
                <th>胸3</th>
                <th>胸4</th>
                <th>胸5</th>
                <th>胸6</th>
                <th>胸7</th>
                <th>胸8</th>
                <th>胸9</th>
                <th>胸10</th>
                <th>胸11</th>
                <th>胸12</th>
            </tr>
            <tr>
                <td colspan="3">椎体矢状径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎体横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎体高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎板宽度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎板厚度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">双侧椎板夹角(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎管横径(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎管矢径(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">棘突长度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">棘突高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎弓根高度(单位mm) </td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎弓根宽度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎弓根横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎弓根矢径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎弓根间距(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">矢状夹角(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_xiong_12"/></td>
            </tr>
            <tr>
                <td colspan="3">椎弓根-椎板角等(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_5"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_6"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_7"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_8"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_9"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_10"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_11"/></td>
                <td><input disabled="disabled" class="image_jizhu_xiongzhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_xiong_12"/></td>
            </tr>
        </table>
        <table class="table table-bordered table-striped">
            <tr>
                <th>腰椎</th>
                <th>腰1</th>
                <th>腰2</th>
                <th>腰3</th>
                <th>腰4</th>
                <th>腰5</th>
            </tr>
            <tr>
                <td>椎体矢状径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitishizhuangjing_yao_5"/></td>
            </tr>
            <tr>
                <td>椎体横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitihengjing_yao_5"/></td>
            </tr>
            <tr>
                <td>椎体高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuitigaodu_yao_5"/></td>
            </tr>
            <tr>
                <td>椎板宽度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibankuandu_yao_5"/></td>
            </tr>
            <tr>
                <td>椎板厚度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuibanhoudu_yao_5"/></td>
            </tr>
            <tr>
                <td>双侧椎板夹角(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shuangcezhuibanjiajiao_yao_5"/></td>
            </tr>
            <tr>
                <td>椎管横径(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanhengjing_yao_5"/></td>
            </tr>
            <tr>
                <td>椎管矢径(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuiguanshijing_yao_5"/></td>
            </tr>
            <tr>
                <td>棘突长度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jituchangdu_yao_5"/></td>
            </tr>
            <tr>
                <td>棘突高度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_jitugaodu_yao_5"/></td>
            </tr>
            <tr>
                <td>椎弓根高度(单位mm) </td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggengaodu_yao_5"/></td>
            </tr>
            <tr>
                <td>椎弓根宽度(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenkuandu_yao_5"/></td>
            </tr>
            <tr>
                <td>椎弓根横径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenhengjing_yao_5"/></td>
            </tr>
            <tr>
                <td>椎弓根矢径(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenshijing_yao_5"/></td>
            </tr>
            <tr>
                <td>椎弓根间距(单位mm)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenjianju_yao_5"/></td>
            </tr>
            <tr>
                <td>矢状夹角(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_shizhuangjiajiao_yao_5"/></td>
            </tr>
            <tr>
                <td>椎弓根-椎板角等(单位°)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuigonggenzhuibanjiaodeng_yao_5"/></td>
            </tr>
            <tr>
                <td>椎体体积(mm2)</td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuititiji_yao_1"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuititiji_yao_2"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuititiji_yao_3"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuititiji_yao_4"/></td>
                <td><input disabled="disabled" class="image_jizhu_yaozhui" style="width:100%" type="text" id="image_jizhu_zhuititiji_yao_5"/></td>
            </tr>
        </table>

        <button type="submit" id="save_image_jizhu" hidden="hidden" class="btn btn-primary transition-duration">保存</button>
    </div>

<%--</div>--%>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/hospital/js/jquery.min.js"></script>

<%--<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->--%>
<%--<script src="/hospital/js/bootstrap.min.js"></script>--%>

<script type="text/javascript">
    $("#modify_image_jizhu").click(function () {
        $(".image_jizhu_jingzhui").prop('disabled', false);
        $(".image_jizhu_xiongzhui").prop('disabled', false);
        $(".image_jizhu_yaozhui").prop('disabled', false);
        $("#save_image_jizhu").show();
    });

    function ImageJizhuGet() {
        var patientId = $("#patientId").val();
        $.ajax({
                url: "/hospital/patient/image/jizhu/" + patientId,
                type: "GET",
                dataType: "json",
                contentType: "application/xhtml+xml; charset=utf-8",
                success: function (answerList) {
                    console.log(answerList);
                    for (var i = 0; i < answerList.length; i++) {
                        var answerElement = answerList[i];
                        if (answerElement.examCategory == "颈椎") {
                            if (answerElement.examName == "椎体矢状径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitishizhuangjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体横径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitihengjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体高度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitigaodu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎板宽度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuibankuandu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎板厚度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuibanhoudu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "双侧椎板夹角") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_shuangcezhuibanjiajiao_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎管横径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuiguanhengjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎管矢径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuiguanshijing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "棘突长度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_jituchangdu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "棘突高度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_jitugaodu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根高度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggengaodu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根宽度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenkuandu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根横径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenhengjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根矢径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenshijing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根间距") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenjianju_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "矢状夹角") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_shizhuangjiajiao_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根-椎板角等") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenbanzhuijiaodeng_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "水平位椎体上矢状径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_shangshizhuangjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "水平位椎体中矢状径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhongshizhuangjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "水平位椎体下矢状径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_xiashizhuangjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "水平位椎体上横径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_shanghengjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "水平位椎体中横径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhonghengjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "水平位椎体下横径") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_xiahengjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "横突孔间距") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_hengtukongjianju_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体前高度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitiqiangaodu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体中高度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitizhonggaodu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体后高度") {
                                for (var j = 1; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitihougaodu_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体钩突高") {
                                for (var j = 3; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitigoutugao_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体勾突基底宽") {
                                for (var j = 3; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitigoutujidikuan_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体勾突基底长") {
                                for (var j = 3; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitigoutujidichang_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根上下径") {
                                for (var j = 3; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_gongchanggenshangxiajing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根左右径") {
                                for (var j = 3; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_gongchanggenzuoyoujing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎间孔长径") {
                                for (var j = 3; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuijiankongchangjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎间孔短径") {
                                for (var j = 3; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuijiankongduanjing_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎间孔面积") {
                                for (var j = 3; j <= 7; j++) {
                                    var position = "颈" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuijiankongmianji_jing_" + j).val(answerElement.examResult);
                                    }
                                }
                            }
                        }
                        else if (answerElement.examCategory == "胸椎") {
                            if (answerElement.examName == "椎体矢状径") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitishizhuangjing_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体横径") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitihengjing_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体高度") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitigaodu_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎板宽度") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuibankuandu_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎板厚度") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuibanhoudu_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "双侧椎板夹角") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_shuangcezhuibanjiajiao_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎管横径") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuiguanhengjing_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎管矢径") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuiguanshijing_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "棘突长度") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_jituchangdu_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "棘突高度") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_jitugaodu_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根高度") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggengaodu_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根宽度") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenkuandu_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根横径") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenhengjing_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根矢径") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenshijing_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根间距") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenjianju_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "矢状夹角") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_shizhuangjiajiao_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根-椎板角等") {
                                for (var j = 1; j <= 12; j++) {
                                    var position = "胸" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenbanzhuijiaodeng_xiong_" + j).val(answerElement.examResult);
                                    }
                                }
                            }

                        }
                        else if (answerElement.examCategory == "腰椎") {
                            if (answerElement.examName == "椎体矢状径") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitishizhuangjing_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体横径") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitihengjing_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体高度") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuitigaodu_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎板宽度") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuibankuandu_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎板厚度") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuibanhoudu_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "双侧椎板夹角") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_shuangcezhuibanjiajiao_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎管横径") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuiguanhengjing_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎管矢径") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuiguanshijing_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "棘突长度") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_jituchangdu_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "棘突高度") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_jitugaodu_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根高度") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggengaodu_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根宽度") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenkuandu_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根横径") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenhengjing_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根矢径") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenshijing_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根间距") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenjianju_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "矢状夹角") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_shizhuangjiajiao_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎弓根-椎板角等") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuigonggenbanzhuijiaodeng_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            } else if (answerElement.examName == "椎体体积") {
                                for (var j = 1; j <= 5; j++) {
                                    var position = "腰" + j;
                                    if (answerElement.examPosition == position) {
                                        $("#image_jizhu_zhuititiji_yao_" + j).val(answerElement.examResult);
                                    }
                                }
                            }

                        }

                    }

                },
                error: function () {

                }
            }
        );
    };

    function ImageJizhuSave() {
        var data = {};
        data.patientId = $("#patientId").val();
        var categoryList = ["颈椎", "胸椎", "腰椎"];
        var positionList = ["颈椎", "胸椎", "腰椎"];
        for (var i = 0; i < positionList.length; i++) {
            var position = positionList[i];
            data.examPosition = position;
            if (position == "颈椎") {
                data.qianqu = $("#jingzhui_qianqu").val();
                data.houshen = $("#jingzhui_houshen").val();
                data.zuocewan = $("#jingzhui_zuocewan").val();
                data.youcewan = $("#jingzhui_youcewan").val();
                data.zuocexuan = $("#jingzhui_zuocexuan").val();
                data.youcexuan = $("#jingzhui_youcexuan").val();
            } else if (position == "胸椎") {
                data.qianqu = $("#xiongzhui_qianqu").val();
                data.houshen = $("#xiongzhui_houshen").val();
                data.zuocewan = $("#xiongzhui_zuocewan").val();
                data.youcewan = $("#xiongzhui_youcewan").val();
                data.zuocexuan = $("#xiongzhui_zuocexuan").val();
                data.youcexuan = $("#xiongzhui_youcexuan").val();
            } else if (position == "腰椎") {
                data.qianqu = $("#yaozhui_qianqu").val();
                data.houshen = $("#yaozhui_houshen").val();
                data.zuocewan = $("#yaozhui_zuocewan").val();
                data.youcewan = $("#yaozhui_youcewan").val();
                data.zuocexuan = $("#yaozhui_zuocexuan").val();
                data.youcexuan = $("#yaozhui_youcexuan").val();
            }
            $.ajax({
                    url: "/hospital/patient/physical/jizhu/huodongdu",
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

</script>

</body>
</html>