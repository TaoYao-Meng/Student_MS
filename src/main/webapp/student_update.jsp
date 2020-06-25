<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2020/4/9
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
当前登陆用户：<s:property value="#session.adminUsername"/><br>
<h2>修改学生信息</h2>
<form action="update" method="post">
    <s:iterator value="#session.stuList.{?#this.studentID == #parameters.studentID[0]}">
        学号：<input type="text" name="stu.studentID" value="<s:property value="studentID"/>"><br>
        姓名：<input type="text" name="stu.name" value="<s:property value="name"/>"><br>
        密码：<input type="text" name="stu.password" value="<s:property value="password"/>">
        性别：
        <input type="radio" name="stu.sex" value="男" checked="checked">男
        <input type="radio" name="stu.sex" value="女">女<br>
        生日：<input type="text" name="stu.birthday" value="<s:property value="birthday"/>"><br>
        学校：<input type="text" name="stu.university" value="<s:property value="university"/>"><br>
        学院：<input type="text" name="stu.department" value="<s:property value="department"/>"><br>
        专业：<input type="text" name="stu.major" value="<s:property value="major"/>"><br>
        年级：<input type="text" name="stu.grade" value="<s:property value="grade"/>"><br>
        <input type="submit" value="修改学生信息">
    </s:iterator>

</form>
</body>
</html>
