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

<s:form action="new">
<s:textfield name="teacher.name" label="姓名" maxlength=35 size=10></s:textfield>
<s:textfield name="teacher.institute" label="单位" maxlength=95 size=20></s:textfield>
<s:textfield name="teacher.email" label="邮箱" maxlength=95 size=20></s:textfield>
<s:textfield name="teacher.web" label="网址" maxlength=95 size=20></s:textfield>

<s:textfield name="teacher.name" label="用户名"></s:textfield>
<s:textfield name="teacher.name" label="用户名"></s:textfield>
<s:textfield name="teacher.name" label="用户名"></s:textfield>

<s:textfield name="teacher.name" label="用户名"></s:textfield>
<s:textfield name="teacher.name" label="用户名"></s:textfield>
<s:textfield name="teacher.name" label="用户名"></s:textfield>

public String name;  //not null
    public boolean sex;  //not null
    public int id;
    public Date birthday;
    public String institute;
    public String email;
    public String web;
    public String basic;
    public String awards;
    public String work;
    public String education;
    public String research;
    public String other;

</s:form>

</body>
</html>