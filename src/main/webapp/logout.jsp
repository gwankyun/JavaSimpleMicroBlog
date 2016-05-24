<%-- 
    Document   : logout
    Created on : 2016-5-23, 10:44:49
    Author     : ljqic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            session.removeAttribute("thisUser");
            response.sendRedirect("index.html");
        %>
    </body>
</html>
