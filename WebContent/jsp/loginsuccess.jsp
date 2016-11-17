<%@ page contentType="text/html;charset=utf-8"%>
<style type="text/css">
h1
{
	margin-left:650px;
	margin-top:0px;
	font-size:60px;
	color:red;
}
b
{
	margin-left:650px;
	margin-top:200px;
	font-size:30px;
	color:red;
}
div
{
	width:100%;
	height:100%;
	background-color:white;
}
</style>
<html>
<head>
<title>loginSucess</title>
<script type="text/javascript">
var time = 6;
function returnUrlByTime() 
{
	window.setTimeout('returnUrlByTime()', 1000);
	time = time - 1;
	document.getElementById("layer").innerHTML = time;
}
</script>
</head>
<body onload="returnUrlByTime()">
<div>
<h1>登陆成功！</h1>
<b><span id="layer">5</span>秒后，转入输入界面。</b>
<%
//转向语句
response.setHeader("Refresh", "5;URL=index.jsp");
%>
</div>
</body>
</html>