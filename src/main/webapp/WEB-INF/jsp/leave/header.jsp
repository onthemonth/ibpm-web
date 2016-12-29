<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="com.brightd.controller.User" pageEncoding="UTF-8"%>

<%
    User user = (User)session.getAttribute("user");
    String userName = "";
    if(null != user){
        userName = user.getUserName();
    }
%>

<div class="welcome">欢迎 <%=userName%> | <a href="/leave/logout" target="_self">退出</a> </div>