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

<ul>
<li><s:property value="teacher.name" /></li>
<li><s:property value="teacher.sex" /></li>
<li><s:property value="teacher.id" /></li>
<li><s:property value="teacher.birthday" /></li>
<li><s:property value="teacher.institute" /></li>
<li><s:property value="teacher.email" /></li>
<li><s:property value="teacher.web" /></li>
<li><s:property value="teacher.basic" /></li>
<li><s:property value="teacher.awards" /></li>
<li><s:property value="teacher.work" /></li>
<li><s:property value="teacher.education" /></li>
<li><s:property value="teacher.research" /></li>
<li><s:property value="teacher.other" /></li>
</ul>
</body>
</html>