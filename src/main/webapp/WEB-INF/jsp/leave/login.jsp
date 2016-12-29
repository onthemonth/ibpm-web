<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="/static/css/common.css"/>
    <script type="text/javascript" src="/static/base/jquery-1.8.3.min.js" ></script>
    <script>
        $(function(){
          $("#login").click(function(){
              $("#loginform").submit();
         });
        })

    </script>
</head>
<body>
<form action="/leave/login" method="post" id="loginform">
<div class="login_main">
    <div class="login_view">
        <div class="main_div">
            <span>用户名：</span>
            <input type="text" name="userName" placeholder="请输入用户名" id="username" value="${user.userName}"/>
        </div>
        <div class="main_div m_top20">
            <span>密码：</span>
            <input type="password" placeholder="请输入密码" class="m_lf13" name="password"/>
        </div>
        <div class="bottom_sub m_top20 m_rg37 fl_right" id="login">登录</div>
    </div>
</div>
</form>
</body>
</html>
