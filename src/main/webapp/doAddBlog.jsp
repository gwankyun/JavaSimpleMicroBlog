<%-- 
    Document   : doAddBlog
    Created on : 2016-5-12, 17:47:44
    Author     : ljqic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.JavaSimpleMicroBlog.DB" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page import="com.mycompany.JavaSimpleMicroBlog.User" %>
<%@page import="com.mycompany.JavaSimpleMicroBlog.Blog" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String content = request.getParameter("content");
            User user = (User) session.getAttribute("thisUser");
            if (user != null) {
                Blog blog = new Blog();
                blog.setAuthor(user.getId());
                blog.setContent(content);
                if (Blog.addBlog(blog)) {
                    out.println("發佈成功");
                    response.sendRedirect("main.jsp");
                } else {
                    out.println("發佈失敗");
                }
            } else {
                out.println("用戶未登錄");
            }
        %>
    </body>
</html>
