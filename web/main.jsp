<%-- 
    Document   : main
    Created on : 2016-5-12, 14:12:26
    Author     : ljqic
--%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.kyun.bean.User"%>
<%@page import="com.kyun.bean.Blog"%>
<%@page import="java.util.ArrayList"%>
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
            User user  = (User)session.getAttribute("thisUser");
        %>
        <br />
        <form action="doAddBlog.jsp" method="post">
            <table>
                <tr>
                <textarea id="inputBlock" name="content"></textarea>
                </tr>
                <tr>
                    <td><input type="submit" value="發佈"/></td>
                    <td><input type="submit" value="清除" onclick="clearInput(this);"/></td>
                </tr>
            </table>
        </form>
        <%
            if (user != null) {
                ArrayList<Blog> list =  Blog.getBlogs();
                if (list.size() > 0) {
                    %>
                    <table>
                    <%
                    for (Blog i : list) {
                        %>
                        <tr>
                            <td><%=i.getId() %></td><td><%=i.getTime() %></td>
                        </tr>
                        <tr><td><%=i.getContent() %></td></tr>
                        <%
                    }
                    %>
                    </table>
                    <%
                }
            }
        %>
    </body>
</html>
