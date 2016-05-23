<%-- 
    Document   : doRegister
    Created on : 2016-5-11, 9:54:07
    Author     : ljqic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.JavaSimpleMicroBlog.DB" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="com.mycompany.JavaSimpleMicroBlog.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (User.hasUser(username)) {
                out.println("用戶名重複！");
            } else {
                if (User.register(username, password)) {
                    out.println(username + " " + password + " 註冊成功！");
                    response.sendRedirect("index.html");
                } else {
                    out.println("失敗");
                    response.sendRedirect("register.jsp");
                }
            }
        %>
    </body>
</html>
