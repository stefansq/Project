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
<s:iterator value="institutes" var="iname" status="st">
<li>
<a href=<s:url action="extend">
<s:param name="instname" value="#st.getIndex()"></s:param>
</s:url>>
<s:property value="iname" />
</a>
</li>
</s:iterator>
</ul>
</body>
</html>