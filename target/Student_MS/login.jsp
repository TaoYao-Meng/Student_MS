<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2020/4/9
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="studentLogin.action" method="post" id="myform">
    <input type="text" name="student.name" placeholder="用户名" required="required">
    <input type="password" name="student.password" placeholder="密  码" required="required">
    <button type="submit" >学生登录</button>
</form>
</body>
</html>
