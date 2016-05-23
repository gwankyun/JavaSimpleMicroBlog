<%-- 
    Document   : welcome
    Created on : 2016-5-9, 15:56:43
    Author     : ljqic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.JavaSimpleMicroBlog.DB" %>
<%@page import="java.sql.PreparedStatement" %>
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
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            String id = user.getId();
            out.println(id);
            if (!id.equals("")) {
                session.setAttribute("thisUser", user);
                response.sendRedirect("main.jsp");
            } else {
                response.sendRedirect("index.html");
            }
%>
    </body>
</html>
