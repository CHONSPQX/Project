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
				<li><a href="UserAction!UserCheckFile">个人文件
						<span class="sr-only">(current)</span>
				</a></li>
				<li ><a href="PublicTextAction!CheckFile">共享文件
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="active"><a href="shared_text.jsp">共享空间</a></li>
			</ul>
						<div class="navbar-form navbar-left">
				<select class="btn btn-default" id="choose" >
				 <option class="btn btn-default" value="0">按作者</option>
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
	<!-- /.container-fluid --> 
	</nav>
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
			<div class="col-sm-4">
			</div>
			<div class="col-sm-4" align="center">
			<ul class="pagination">
					<li><a onclick="prevpage()">Prev</a></li>
					
					<li><a onclick="nextpage()">Next</a></li>
				</ul>
			</div>
			<div class="col-sm-4">
			</div>
		</div>
	</div>
	<br>
	<br>
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
	<div class="container">CopyRight@QYZ team</div>
	</nav>

</body>
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.js"></script>
<script>
	var pagenum = 0;
	var map;
	function prevpage() {
		if(pagenum>0)
		{
		getContext(pagenum-1);
		pagenum = pagenum-1;
		}
		else{
			confirm("前面已经没有啦！");
		}
	}
	function nextpage() {
		var flag=getContext(pagenum);
		pagenum = pagenum+1;
	}
	function getContext(num) {
		var flag=true;
		var data = {
			num : num
		};
		$.ajax({
			url : "AjaxTest!updateContext",
			type : "POST",
			data : data,
			dataType : "json"
		}).done(function(data) {
			for(var i=1;i<=3;i++)
			{
				var title = document.getElementById("title"+i);
				var context=document.getElementById("context"+i);
				var footer=document.getElementById("footer"+i);
				var valtitle=data["title"+i];
				var valcontext=data["context"+i];
				var valfooter=data["footer"+i];
				if(valtitle!=null&&valtitle.length>0)
				title.innerText = valtitle
				else
				{
					alert("后面已经没有啦！");
					pagenum=pagenum-1;
					return ;
				}
				if(valcontext!=null)
				context.innerHTML = valcontext;
				if(valfooter!=null)
				footer.innerText = valfooter;	
			}
		}).fail(function() {
			pagenum=pagenum-1;
			alert("空");
		})
	}
	$(document).ready(function() {
		nextpage();
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
	function Search() {
		var file = document.getElementById("search").value;
		var count=document.getElementById("choose").value;
		//alert(count+"   "+file);
		//alert(file);
		
		window.location.href = "SearchAction!SearchShared?text="
				+ file+"&count="+count;
	}
</script>
</html>