<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/jsp/leave/common.css"/>
</head>
<body>
${user.userName}
<div class="login_main">
    <div class="login_view">
        <div class="main_div">
            <span>用户名：</span>
            <input type="text" value="" placeholder="请输入用户名"/>
        </div>
        <div class="main_div m_top20">
            <span>密码：</span>
            <input type="password" value="" placeholder="请输入密码" class="m_lf13"/>
        </div>
        <div class="bottom_sub m_top20 m_rg37 fl_right">登录</div>
    </div>
</div>
</body>
</html>
