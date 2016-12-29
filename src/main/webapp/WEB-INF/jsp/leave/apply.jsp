<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>申请</title>
    <link rel="stylesheet" href="/static/css/common.css"/>
    <script type="text/javascript" src="/static/base/jquery-1.8.3.min.js" ></script>
    <script type="text/javascript" src="/static/js/apply.js"></script>
</head>
<body>
<div class="container">
    <form action="/leave/addTask" method="post" id="subForm">
        <jsp:include  page="header.jsp"/>
        <div class="apply_main">
            <div class="main_div">
                <span>时间：</span>
                <input type="text" value="" placeholder="请输入时间" name="hours" id="time"/>
            </div>
            <div class="main_div m_top20">
                <span>原因：</span>
                <input type="text" value="" placeholder="请输入原因" name="reason" id="reason"/>
            </div>
            <div class="apply_bot">
                <div class="bottom_sub m_rg130 fl_right">提交</div>
            </div>
        </div>
    </form>

    <table>
        <thead>
        <tr>
            <th>时间</th>
            <th>原因</th>
            <th>提交时间</th>
            <th>申请</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach  items="${taskList}" var="task">
            <tr>
                <td>${task.hours}</td>
                <td>${task.reason}</td>
                <td>${task.createTime}</td>
                <td><div class="bottom_sub margin_5 onClickTask">
                    <input type="hidden" value="${task.taskId}">
                    申请
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
