<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>共享空间</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/popper.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery.easing.js"></script>
<style>
.panel-body {
	height: 380px;
	overflow: scroll;
	max-height: 380px
}
</style>
</head>
<%
  ArrayList<String> allFile = (ArrayList<String>) request.getAttribute("AllFiles");
%>
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
				<li class="active"><a href="UserAction!UserCheckFile">我的空间
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a href="shared_text.jsp">共享空间</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<form class="navbar-form navbar-left"
				action="SearchAction!SearchFile">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search"
						name="CheckedFile">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">用户<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="index.jsp">注销</a></li>
						<li><a href="people_account.jsp">密码</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
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
			<div class="col-md-4">
				<div class="panel panel-primary mypanel">
					<div class="panel-heading">
						<h3 class="panel-title" id="title1">Panel title</h3>
					</div>
					<div class="panel-body" id="context1">Panel content</div>
					<div class="panel-footer" id="footer1">Panel footer</div>
				</div>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4"></div>
					<div class="col-md-4">

						<button type="button" class="btn btn-primary btn-sm" id="detail1"
							onclick="ShowDetail();">ShowDetail</button>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-success mypanel">
					<div class="panel-heading">
						<h3 class="panel-title" id="title2">Panel title</h3>
					</div>
					<div class="panel-body" id="context2">Panel content</div>
					<div class="panel-footer" id="footer2">Panel footer</div>
				</div>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4"></div>
					<div class="col-md-4">

						<button type="button" class="btn btn-primary btn-sm" id="detail2"
							onclick="ShowDetail();">ShowDetail</button>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="panel panel-info mypanel">
					<div class="panel-heading">
						<h3 class="panel-title" id="title3">Panel title</h3>
					</div>
					<div class="panel-body" id="context3">Panel content</div>
					<div class="panel-footer" id="footer3">Panel footer</div>
				</div>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4"></div>
					<div class="col-md-4">

						<button type="button" class="btn btn-primary btn-sm" id="detail3"
							onclick="ShowDetail();">ShowDetail</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8"></div>
			<div class="col-sm-4">
				<ul class="pagination">
					<li><a href="#">Prev</a></li>
					<li><a onclick="nextpage(0);">1</a></li>
					<li><a onclick="nextpage(1);">2</a></li>
					<li><a onclick="nextpage(2);">3</a></li>
					<li><a onclick="nextpage(3);">4</a></li>
					<li><a onclick="nextpage(4);">5</a></li>
					<li><a href="#">Next</a></li>
				</ul>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
	<div class="container">CopyRight@QYZ team</div>
	</nav>

</body>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.js"></script>
<script>
	var pagenum = 0;
	var map;
	function nextpage(num) {
		getContext(num);
		pagenum = num;
	}
	function getContext(num) {
		var data = {
			num : num
		};
		$.ajax({
			url : "AjaxTest!updateContext",
			type : "POST",
			data : data,
			dataType : "json"
		}).done(function(data) {

			var title1 = document.getElementById("title1");
			//alert(data.title1);
			title1.innerText = data.title1;
			var context1 = document.getElementById("context1");
			//alert(data.context1);
			context1.innerHTML = data.context1;
			var footer1 = document.getElementById("footer1");
			//alert(data.footer1);
			footer1.innerText = data.footer1;

			var title2 = document.getElementById("title2");
			// alert(data.title2);
			title2.innerText = data.title2;
			var context2 = document.getElementById("context2");
			context2.innerHTML = data.context2;
			var footer2 = document.getElementById("footer2");
			footer2.innerText = data.footer2;

			var title3 = document.getElementById("title3");
			//alert(data.title3);
			title3.innerText = data.title3;
			var context3 = document.getElementById("context3");
			context3.innerHTML = data.context3;
			var footer3 = document.getElementById("footer3");
			footer3.innerText = data.footer3;

		}).fail(function() {
			alert(num);
		})
	}
	$(document).ready(function() {
		nextpage(0);
	});
	function ShowDetail() {
		if (event.target.id == "detail1") {
			var file = document.getElementById("title1").innerText;
			window.location.href = "FileAction!showPublic?filename=" + file;
		} else if (event.target.id == "detail2") {
			var file = document.getElementById("title2").innerText;
			window.location.href = "FileAction!showPublic?filename=" + file;
		} else if (event.target.id == "detail3") {
			var file = document.getElementById("title3").innerText;
			window.location.href = "FileAction!showPublic?filename=" + file;
		}
	}
</script>
</html>