<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<center>
姓名:
<s:property value="teacher.name" /><br>
性别:
<s:if test="teacher.sex == true">男</s:if>
<s:else>女</s:else><br>
教职工号:
<s:property value="teacher.id" /><br>
单位:
<s:property value="teacher.institute" /><br>
邮箱:
<s:property value="teacher.email" /><br>
网址:
<s:property value="teacher.web" /><br>
基本信息:
<s:property value="teacher.basic" /><br>
获奖经历:
<s:property value="teacher.awards" /><br>
工作经历:
<s:property value="teacher.work" /><br>
教育经历:
<s:property value="teacher.education" /><br>
研究成果:
<s:property value="teacher.research" /><br>
其他:
<s:property value="teacher.other" /><br>

</center>
</body>
</html>