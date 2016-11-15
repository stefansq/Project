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
<s:form action="submit">
<s:textfield name="newteacher.name" label="姓名" maxlength="35" size="10"></s:textfield>
<s:radio name="newteacher.sex" list="#{'0':'男','1':'女'}" label="性别"></s:radio>

<s:select name="newteacher.institute" list="institutes" label="单位"></s:select>

<s:textfield name="newteacher.email" label="邮箱" maxlength="95" size="20"></s:textfield>
<s:textfield name="newteacher.web" label="网址" maxlength="95" size="20"></s:textfield>
<s:textfield name="newteacher.id" label="教职工号" value="" maxlength="35" size="10"></s:textfield>

<s:textarea name="newteacher.basic" label="基本信息" maxlength="1000" cols="100" rows="4"></s:textarea>
<s:textarea name="newteacher.awards" label="获奖经历" maxlength="1000" cols="100" rows="4"></s:textarea>
<s:textarea name="newteacher.work" label="工作经历" maxlength="1000" cols="100" rows="4"></s:textarea>
<s:textarea name="newteacher.education" label="教育经历" maxlength="1000" cols="100" rows="4"></s:textarea>
<s:textarea name="newteacher.research" label="研究成果" maxlength="1000" cols="100" rows="4"></s:textarea>
<s:textarea name="newteacher.other" label="其他" maxlength="1000" cols="100" rows="4"></s:textarea>

<s:submit value="提交"></s:submit>
</s:form>
</center>
</body>
</html>
