<%@ page contentType="text/html;charset=gb2312"%>
<style type="text/css">
h2
{
	margin-left:10px;
	margin-top:0px;
	font-size:50px;
	color:blue;
}
h4
{
	margin-top:0px;
	margin-left:1100px;
	font-size:30px;
	color:blue;
}
td
{
	border:solid 1px azure;
}
table
{
	margin-left:1150px;
	margin-top:0px;
	border:solid 1px azure;
	width:200px;
	height:200px;
	border-collapase:collapse;
	word-spacing:20px;
}
div
{
	width:90%;
	height:100%;
	background-image:url(login.jpg);
}
</style>
<html>
<script language="javascript">
function on_submit()
{//验证数据的合法性
if (formin.id.value == "")
		{
		alert("学号不能为空，请输入学号！");
		formin.id.focus();
		return false;
		}
if (formin.userpassword.value == "")
		{
		alert("密码不能为空，请输入密码！");
		formin.userpassword.focus();
		return false;
		}
if (formin.reuserpassword.value == "")
		{
		alert("确认密码不能为空，请输入密码！");
		formin.reuserpassword.focus();
		return false;
		}
if (formin.userpassword.value != formin.reuserpassword.value)
		{
		alert("密码与确认密码不同！");
		formin.userpassword.focus();
		return false;
		}
}
</script>
<head>
<title>用户注册</title>
</head>
<body> 
<div> 
<h2>欢迎使用!</h2>
<h4>请注册：</h4> 
<form action="checkregister.jsp" name="formin" method="post" onsubmit="return on_submit()"> 
<table> 
<tr>
<td align=right> 学&nbsp;&nbsp;号：</td>
<td><input type="text" name="id"></td>
</tr>  
<tr>
<td align=right> 密&nbsp;&nbsp;码：</td>
<td><input type="password" name="userpassword"></td>
</tr> 
<tr>
<td align=left> 请确认密码：</td>
<td><input type="password" name="reuserpassword"></td>
</tr>
<td align=right> 类&nbsp;&nbsp;型：</td>
<td align=center><select name="tp">
		<option value="1">学生</option>
		<option value="2">教师</option></td>
	</select>
</tr> 
<tr>
<td colspan="2" align="center">
<input type="submit" value="注册"></td>
</tr> 
</table>
</form>  
</div> 
</body>
</html>