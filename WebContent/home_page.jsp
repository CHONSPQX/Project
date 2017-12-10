<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String session_user = (String) session.getAttribute("userID");
if (session_user == null) 
	response.sendRedirect("index.jsp");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>用户空间</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/popper.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery.easing.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Brand</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href="UserAction!UserCheckFile">个人文件
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a href="PublicTextAction!CheckFile">共享文件
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a href="shared_text.jsp">共享空间</a></li>
			</ul>
			<div class="navbar-form navbar-left">
				<select class="btn btn-default" id="choose" >
			     <option  class="btn btn-default" value="0">按关键字</option>
			     <option  class="btn btn-default" value="1">按题目</option>
			     <option  class="btn btn-default" value="2">按时间</option>
			     <option class="btn btn-default" value="3">全文检索</option>
		         </select> 
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							id="search">
					</div>
					<button class="btn btn-default" onclick="Search()">Submit</button>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">用户<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="UserAction!UserLogout">用户注销</a></li>
						<li><a href="people_account.jsp">密码管理</a></li>
						<li><a href="UserAction!getUserProfile">个人信息</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>
	<br>
  <br>
  <br>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="jumbotron">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-10">
							<h1>欢迎来到文章管理系统!</h1>
						</div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	<nav class="navbar navbar-inverse navbar-fixed-bottom">
	<div class="container">CopyRight@QYZ team</div>
	</nav>

</body>
<script>
function Search() {
	var file = document.getElementById("search").value;
	var count=document.getElementById("choose").value;
	//alert(count+"   "+file);
	//alert(file);
	
	window.location.href = "SearchAction!ClassifierSearch?text="
			+ file+"&count="+count;
}
</script>
</html>
