<%-- 
    Document   : main
    Created on : 2016-5-12, 14:12:26
    Author     : ljqic
--%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.JavaSimpleMicroBlog.User"%>
<%@page import="com.mycompany.JavaSimpleMicroBlog.Blog"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>
        var clearInput = function () {
            var b = document.getElementById('inputBlock');
            b.value = '';
        };
    </script>
    <body>
        <h1>Hello World!</h1>
        <%
            User user = (User) session.getAttribute("thisUser");
//            out.println(user.getId());
        %>
        <a href="logout.jsp">登出</a>
        <br/> 
        <form action="doAddBlog.jsp" method="post">
            <%--<%=user.getId()%>--%>
            <table>
                <tr>
                    <td><textarea id="inputBlock" name="content"></textarea></td>
                </tr>
                <tr>
                    <td><input type="submit" value="發佈"/></td>
                    <td><input type="submit" value="清除" onclick="clearInput(this);"/></td>
                </tr>
            </table>
        </form>
        <table>
            <c:forEach var="blog" items="${Blog.getBlogs()}">
                <tr>
                    <td>${User.getUsername(blog.getAuthor())}</td>
                    <td>${blog.getTime()}</td>
                </tr>
                <tr>
                    <td>${blog.getContent()}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
