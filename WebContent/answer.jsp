<%@ page contentType="text/html" pageEncoding="utf-8" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>话题页</title>
	<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="breadcrumb">
				<li>
					 <a href="index.jsp">主页</a>
				</li>
				<li>
					 <a href="question.jsp">讨论区</a>
				</li>
				<li class="active">
					话题
				</li>
			</ul>
<%! int pageSize=3;
	int pageCount;
	int showPage;
	String now_id=request.getParameter("now_id");
%>
			
			<button style=float:right type="button" class="btn btn-default">
			<a href="answerquestion.jsp?now_id=<%=now_id %>">回复</a>
			</button>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
		<table>
<%
	Connection con;
	Statement sql;
	ResultSet rs;

	try
	{
		Class.forName("com.mysql.jdbc.Driver"); 
	}catch(ClassNotFoundException e)
	{}
	try
	{
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/question","root","stefan1007");
		sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		//返回可滚动的结果集
		rs=sql.executeQuery("select * from Lanswer");
		//将游标移到最后一行 
		rs.last();
		//获取最后一行的行号 
		int recordCount=rs.getRow();
		//计算分页后的总数 
		pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1);
		//获取用户想要显示的页数：
		String integer=request.getParameter("showPage");
		if(integer==null)
		{
			integer="1";
		}
		try
		{
			showPage=Integer.parseInt(integer);
		}
		catch(NumberFormatException e)
		{
			showPage=1;
		}
		if(showPage<=1)
		{
			showPage=1;
		}
		if(showPage>=pageCount)
		{
			showPage=pageCount;
		}
		//如果要显示第showPage页，那么游标应该移动到的posion的值是：
		int posion=(showPage-1)*pageSize+1;
		//设置游标的位置
		rs.absolute(posion);%>
				<tbody>
		<%
		//用for循环显示本页中应显示的的记录
		for(int i=1;i<=pageSize;i++)
		{%>
					<tr class="success">
						<%	String str=rs.getString("id");
							if(str.equals(now_id))
							{%>
							<%=rs.getString("answer") %>
					</tr>
							<%}%>
		<%rs.next();
		}%>
				</tbody>           	
			</table>
		</div>
	</div>
	<%
		rs.close();
		con.close();
	}
		catch(Exception e)
		{
		e.printStackTrace();
		}
	%>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<center>
			第<%=showPage %>页（共<%=pageCount %>页）
			<br>
			<ul class="pagination">
				<li>
					 <a href="answer.jsp?showPage=1">首页</a>
				</li>
				<li>
					<a href="answer.jsp?showPage=<%=showPage-1%>">上一页</a>
				</li>
				<%
					for(int i=1;i<=pageCount;i++)
					{%>
				<li>
					<a href="answer.jsp?showPage=<%=i%>"><%=i%>
				</li>
				<%
					}%>
				<li>
					 <a href="answer.jsp?showPage=<%=showPage+1%>">下一页</a>
				</li>
				<li>
					 <a href="answer.jsp?showPage=<%=pageCount%>">末页</a>
				</li>
			</ul>
			</center>
		</div>
	</div>		
</div>
</body>
</html>