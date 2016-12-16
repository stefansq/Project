<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>回复页</title>
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
				<li>
					 <a href="answer.jsp">话题</a>
				</li>
				<li class="active">
					回复
				</li>
			</ul>
		<div class="input-group-lg">
		<form action="answerquestion.jsp" method="post">
			<input type="text" class="form-control" placeholder="回复:" name="answer">
			<button style=float:right type="submit" class="btn btn-default">
			<a href="question.jsp">回复</a>
			</button>
		</form>
		</div>
		<% 
			String question=request.getParameter("answer");
			try
			{
				String driverName = "com.mysql.jdbc.Driver";
				String DBUser = "root";
				String DBPassword = "stefan1007";
				String DBName = "question";
				String connUrl = "jdbc:mysql://localhost:3306/" + DBName + ","+DBUser+","+"DBPassword";
				Class.forName(driverName).newInstance();
				Connection conn = DriverManager.getConnection(connUrl);
				Statement stmt = conn.createStatement();
				ResultSet rs;
				<%String now_id=request.getParameter("now_id");%>
				stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				String insert_question = "insert into Lanswer values('"+now_id+"','"+answer+"')";
				try{
					stmt.execute(insert_question);
				}catch(Exception e) {
					e.printStackTrace();
				}
				rs.close();
				stmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}	
		%>
		</div>
	</div>
</div>
</body>
</html>