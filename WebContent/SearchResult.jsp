<%@page import="Article.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Comment.Comment"%>
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
<title>搜索结果</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="bootstrap/js/popper.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/jquery.easing.js"></script>
</head>
<%
  ArrayList<Article> allMyFile = (ArrayList<Article>) request.getAttribute("Classifier");
  //ArrayList<String> allPublicFile = (ArrayList<String>) request.getAttribute("allSearchedPublicFiles");
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
				<li class="active"><a href="UserAction!UserCheckFile">个人文件
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
	<!-- 搜索道德用户的自己的文章   -->
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>我的文章列表</strong>
					</div>
					<div class="panel-body">
						<div class="btn-group btn-group-justified" role="group"
							aria-label="...">
							<div class="btn-group" role="group">
								<button type="button" class="btn btn-default"
									onclick="pageBack();">返回</button>
							</div>
						</div>
					</div>
					
					<table class="table table-hover">
						<tr>
							<th width="45">选择</th>
							<th width="300">标题</th>
							<th width="100">类别</th>
							<th width="150">操作</th>
						</tr>
						<%
						  if (allMyFile != null && allMyFile.size() > 0)
										for (int i = 0; i < allMyFile.size(); i++) {
											Article temp = allMyFile.get(i);
											String type = temp.getTitle().substring(temp.getTitle().lastIndexOf("."), temp.getTitle().length());
						%>
						<tr>
							<td><input type="radio" name="filename" value="<%=temp.getTitle()%>" /></td>
							<td><%=temp.getTitle()%></td>
							<td><%=type%></td>
							<td><a class="button border-green button-little"
								href="FileAction!showPrivate?filename=<%=temp.getTitle()%>">详情</a> <a
								class="button border-blue button-little"
								href="FileAction!ReadFile?filename=<%=temp.getTitle()%>">编辑</a> <a
								class="button border-red button-little" href="#"
								onclick="shareFile('<%=temp.getTitle()%>');">分享</a></td>
						</tr>
						<%
						  }
						%>
					</table>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</div>

	
<br>
  <br>
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
	<div class="container">CopyRight@QYZ team</div>
	</nav>

	<script type="text/javascript">	
		function shareFile(file) {
			//输出值和文本  
			//alert("分享:" + file);
			//把获得的数据转换为字符串传递到后台              
			var data = {
				filename : file
			};
			$.ajax({
				url : "AjaxAction!shareFile",
				type : "POST",
				data : data,
				dataType : "json"
			}).done(function(data) {
				confirm("分享文件成功");
			}).fail(function() {
				alert("分享文件失败");
			})
		}
		function ShowDetail(file) {
			window.location.href = "FileAction!showPublic?filename=" + file;
		}
		function pageBack() {
			history.go(-1);
		}
	</script>
</body>
</html>