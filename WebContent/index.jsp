<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>文章管理系统</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
					<li><a href="#">我的空间</a></li>
					<li><a href="#">共享空间</a></li>
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
					<button class="btn btn-default">Submit</button>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login_user.jsp">登录</a></li>
					<li><a href="register_user.jsp">注册</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
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
	alert(count+"   "+file);
	//alert(file);
	
	window.location.href = "SearchAction!ClassifierSearch?text="
			+ file+"&count="+count;
}
</script>
</html>