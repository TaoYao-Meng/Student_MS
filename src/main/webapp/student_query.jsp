<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 孟祥瑞
  Date: 2020/4/9
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>

</style>
<script type="text/javascript">
    function next(){
        myform.action="findAll.action";
        myform.submit();
    }

</script>
<body>
管理员：<s:property value="#session.adminUsername"/><br>
模糊查询：
<form action="findByName.action" method="post">
    <input type="text" name="stu2.name"/>
    <button type="submit">查询</button>&nbsp;<button type="submit" onclick="next()">返回</button>
</form>
<s:if test="#session.adminUsername!='sherry'">
<a href="student_insert.jsp">添加学生信息</a>
</s:if>
<table border="1" bgcolor="#ffffff" align="center" cellspacing="1" cellpadding="1">
    <caption>学生信息</caption>
    <tr>
        <td align="center" width=9%>studentID</td>
        <td align="center" width=9%>password</td>
        <td align="center" width=9%>name</td>
        <td align="center" width=9%>sex</td>
        <td align="center" width=9%>birthday</td>
        <td align="center" width=9%>university</td>
        <td align="center" width=9%>department</td>
        <td align="center" width=9%>major</td>
        <td align="center" width=9%>grade</td>

    </tr>
<s:if test="#session.adminUsername=='tom'">
    <s:iterator value="stuList">
        <tr>
            <td width=9% align="center"><s:property value="studentID"/></td>
            <td width=9% align="center"><s:property value="password"/></td>
            <td width=9% align="center"><s:property value="name"/></td>
            <td width=9% align="center"><s:property value="sex"/></td>
            <td width=9% align="center"><s:property value="birthday"/></td>
            <td width=9% align="center"><s:property value="university"/></td>
            <td width=9% align="center"><s:property value="department"/></td>
            <td width=9% align="center"><s:property value="major"/></td>
            <td width=9% align="center"><s:property value="grade"/></td>
            <td align="center" width=9%><a href="student_update.jsp?studentID=
<s:property value="studentID"/>" >修改</a></td>
            <td align="center" width=9%><a href="delete?stu.studentID=
<s:property value="studentID"/>" >删除</a></td>

        </tr>
    </s:iterator>
</s:if>


    <s:if test="#session.adminUsername=='jerry'">
        <s:iterator value="stuList">
            <s:if test="department=='信息学院'">
            <tr>
                <td width=9% align="center"><s:property value="studentID"/></td>
                <td width=9% align="center"><s:property value="password"/></td>
                <td width=9% align="center"><s:property value="name"/></td>
                <td width=9% align="center"><s:property value="sex"/></td>
                <td width=9% align="center"><s:property value="birthday"/></td>
                <td width=9% align="center"><s:property value="university"/></td>
                <td width=9% align="center"><s:property value="department"/></td>
                <td width=9% align="center"><s:property value="major"/></td>
                <td width=9% align="center"><s:property value="grade"/></td>
                <td align="center" width=9%><a href="student_update.jsp?studentID=
<s:property value="studentID"/>" >修改</a></td>
                <td align="center" width=9%><a href="delete?stu.studentID=
<s:property value="studentID"/>" >删除</a></td>

            </tr>
            </s:if>
        </s:iterator>
    </s:if>


    <s:if test="#session.adminUsername=='sherry'">
        <s:iterator value="stuList">
            <tr>
                <td width=9% align="center"><s:property value="studentID"/></td>
                <td width=9% align="center"><s:property value="password"/></td>
                <td width=9% align="center"><s:property value="name"/></td>
                <td width=9% align="center"><s:property value="sex"/></td>
                <td width=9% align="center"><s:property value="birthday"/></td>
                <td width=9% align="center"><s:property value="university"/></td>
                <td width=9% align="center"><s:property value="department"/></td>
                <td width=9% align="center"><s:property value="major"/></td>
                <td width=9% align="center"><s:property value="grade"/></td>
            </tr>
        </s:iterator>
    </s:if>


</table>
</body>
</html>
