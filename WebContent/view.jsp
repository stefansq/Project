<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.tform {text-indent:20px;}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师信息管理系统</title>
</head>

<body>
<script>
var flagArray = new Array();

function extend(id){
	offset = Number(id);
	if (flagArray[offset] == 1){
		document.getElementById(id).style.display='none';
		flagArray[offset] = 0;
	}
	else{
		document.getElementById(id).style.display='inline';
		flagArray[offset] = 1;
	}
}
</script>
<center>

<s:iterator value="institutes" id="inst">

<input type="button" value="<s:property value='value.name'/>" onclick="extend(<s:property value='key'/>)" />
<br>

<script>
flagArray.push(0);

var instid="<s:property value='%{key}'/>";

var html=" style='display:none'><s:iterator value='value.teachers' id='teacher'>" +
"<a href=<s:url action='teacher' >" +
"<s:param name='tid' value='key'></s:param>" +
"</s:url>>" +
"<s:property value='value' />" +
"</a>" +
"<br>" +
"</s:iterator>" +
"</div>";

document.write("<div class='tform' id=" + instid + html);

</script>

</s:iterator>

</center>

</body>
</html>