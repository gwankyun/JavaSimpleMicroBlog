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
            DB db = new DB();
            if (db != null) {
                out.println("OK");
            }
            if (db.getConnection() != null) {
                out.println("conn");
            }
            PreparedStatement preparedStatement = db.getPreparedStatement("select * from user");
            if (preparedStatement != null) {
                out.println("pre");
            }
            ResultSet resultSet = db.getResultSet(preparedStatement);
            if (resultSet != null) {
                while (resultSet.next()) {
                    String name = resultSet.getString("username");
                    out.println(name);
                }
            }

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
                out.println(username + " " + password);
//                response.sendRedirect("index.html");
            }
        %>
    </body>
</html>
