<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2020/4/9
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
当前登陆用户：<s:property value="#session.adminUsername"/><br>
<h2>添加学生信息</h2>
<form action="insert" method="post">
        学号：<input type="text" name="stu.studentID" ><br>
        姓名：<input type="text" name="stu.name" ><br>
        性别：
        <input type="radio" name="stu.sex" value="男" checked="checked">男
        <input type="radio" name="stu.sex" value="女">女<br>
        生日：<input type="text" name="stu.birthday" ><br>
        学校：<input type="text" name="stu.university" ><br>
        学院：<input type="text" name="stu.department" ><br>
        专业：<input type="text" name="stu.major" ><br>
        年级：<input type="text" name="stu.grade"><br>
        <input type="submit" value="添加学生信息">

</form>
</body>
</html>
