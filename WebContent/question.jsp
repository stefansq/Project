<%@ page contentType="text/html" pageEncoding="utf-8" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>讨论区</title>
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
				<li class="active">
					讨论区
				</li>
			</ul> 
			<center><button type="button" class="btn btn-default">
			<a href="add.jsp">添加新话题</a>
			</button></center>
			<table class="table">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							帖子
						</th>
					</tr>
				</thead>
<%! int pageSize=8;
	int pageCount;
	int showPage;
%>

<%
	try
	{
		String driverName = "com.mysql.jdbc.Driver";
		String DBUser = "root";
		String DBPassword = "stefan1007";
		String DBName = "question";
		String connUrl = "jdbc:mysql://localhost:3306/" + DBName + ","+DBUser+","+"DBPassword";
		Class.forName(driverName).newInstance();
		Connection conn = DriverManager.getConnection(connUrl);
		Statement sql;
		ResultSet rs;
		sql=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		//返回可滚动的结果集
		rs=sql.executeQuery("select * from Lquestion");
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
		}catch(NumberFormatException e)
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
		{
		%>
					<tr class="success">
						<td>
							<%=i%>
						</td>
						<td>
							<%=rs.getString("question") %>
						</td>
						<%String now_id =rs.getString("id");%>
							<a herf="answer.jsp?now_id=<%=now_id %>">回复</a>
					</tr>
		<%rs.next();
		}%>
				</tbody>           	
			</table>
		</div>
	</div>
		<%
		rs.close();
		sql.close();
		conn.close();
	}
	catch(Exception e){
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
					 <a href="question.jsp?showPage=1">首页</a>
				</li>
				<li>
					<a href="question.jsp?showPage=<%=showPage-1%>">上一页</a>
				</li>
				<%
					for(int i=1;i<=pageCount;i++)
					{%>
				<li>
					<a href="question.jsp?showPage=<%=i%>"><%=i%>
				</li>
				<%
					}%>
				<li>
					 <a href="question.jsp?showPage=<%=showPage+1%>">下一页</a>
				</li>
				<li>
					 <a href="question.jsp?showPage=<%=pageCount%>">末页</a>
				</li>
			</ul>
			</center>
		</div>
	</div>	
</div>
</body>
</html>