<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>任务列表</title>
    <link rel="stylesheet" href="/static/css/common.css"/>
    <script type="text/javascript" src="/static/base/jquery-1.8.3.min.js" ></script>
    <script type="text/javascript" src="/static/js/taskList.js"></script>
</head>
<body>
<div class="container">
    <jsp:include  page="header.jsp"/>
    <table>
        <thead>
        <tr>
            <th>时间</th>
            <th>原因</th>
            <th>提交时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach  items="${taskList}" var="task">
            <tr>
                <td style="display: none" class="taskId">${task.taskId}</td>
                <td style="display: none" class="employee">${task.employee}</td>
                <td class="hours">${task.hours}</td>
                <td class="reason">${task.reason}</td>
                <td class="createTime">${task.createTime}</td>
                <td><div class="bottom_sub margin_5 examine">审核</div>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<div id="bk_layer" style="display: none">
    <div class="layer_div" style="background-color: #ffffff">
        <input type="hidden" value="" id="taskId_text">
        <div class="main_div" id="employee_text">
            <span>员工:</span>
            <span>无</span>
        </div>
        <div class="main_div" id="time_text">
            <span>时间:</span>
            <span>无</span>
        </div>
        <div class="reason" id="reason_text">
            <span>原因:</span>
            <span>无</span>
        </div>
        <div class="main_div" id="comment_text">
            <span>评论:</span>
            <input type="text" value="" placeholder="" style="width:250px;"/>
        </div>
        <div class="agree">
            <div class="bottom_sub fl_left" id="noAgree">不同意</div>
            <div class="bottom_sub fl_left m_lf80" id="agree">同意</div>
        </div>
        <img src="/static/images/close_img.png" class="closeImg"/>
    </div>
</div>
</body>
</html>
