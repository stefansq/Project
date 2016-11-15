<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
h1, #link{text-align:center;}
a
{
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息管理系统</title>
</head>
<body>
<h1>教师信息管理系统</h1>
<a herf="login.jsp">登录</a>
<b herf="register.jsp">注册</b>
<center>
<s:form action="query">
<s:textfield name="name" maxlength="35" size="10"></s:textfield>
<s:submit value="查询"></s:submit>
</s:form>
</center>
<s:action name="view" executeResult="true"></s:action>
<div id="link">
<a href=<s:url action="new"></s:url>>
New teacher
</a>
</div>

</body>
</html>