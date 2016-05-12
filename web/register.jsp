<%-- 
    Document   : register
    Created on : 2016-5-11, 9:34:01
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
        <h1>註冊</h1>
        <form action="doRegister.jsp" method="post">
            <table>
                <tr>
                    <td>用戶名</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>密碼</td>
                    <td><input type="password" name="password" /></td>
                </tr>
                <tr>
                    <td><input type="submit" value="提交" /></td>
                    <td><a href="register.jsp">註冊</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
