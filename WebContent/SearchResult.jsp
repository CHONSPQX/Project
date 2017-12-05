<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="Comment.Comment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
  ArrayList<String> allMyFile = (ArrayList<String>) request.getAttribute("allSearchedMyFiles");
  ArrayList<String> allPublicFile = (ArrayList<String>) request.getAttribute("allSearchedPublicFiles");
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
	<!-- 搜索道德用户的自己的文章   -->
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>我的文章列表</strong>
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
											String temp = allMyFile.get(i);
											String type = temp.substring(temp.lastIndexOf("."), temp.length());
						%>
						<tr>
							<td><input type="radio" name="filename" value="<%=temp%>" /></td>
							<td><%=temp%></td>
							<td><%=type%></td>
							<td><a class="button border-green button-little"
								href="FileAction!showPrivate?filename=<%=temp%>">详情</a> <a
								class="button border-blue button-little"
								href="FileAction!ReadFile?filename=<%=temp%>">编辑</a> <a
								class="button border-red button-little" href="#"
								onclick="shareFile('<%=temp%>');">分享</a></td>
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
	<!-- 搜索共享的文章   -->
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>共享文章列表</strong>
					</div>
					<div class="panel-body"></div>
					<table class="table table-hover">
						<tr>
							<th width="45">选择</th>
							<th width="300">标题</th>
							<th width="100">类别</th>
							<th width="150">操作</th>
						</tr>
						<%
						  if (allPublicFile != null && allPublicFile.size() > 0)
										for (int i = 0; i < allPublicFile.size(); i++) {
											String temp = allPublicFile.get(i);
											String type = temp.substring(temp.lastIndexOf("."), temp.length());
						%>
						<tr>
							<td><input type="radio" name="filename" value="<%=temp%>" /></td>
							<td><%=temp%></td>
							<td><%=type%></td>
							<td><a class="button border-green button-little"
								onclick="ShowDetail('<%=temp%>')">详情</a></td>
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
			alert("分享:" + file);
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
				alert("分享文件成功");
			}).fail(function() {
				alert("分享文件失败");
			})
		}
		function ShowDetail(file) {
			window.location.href = "FileAction!showPublic?filename=" + file;
		}
	</script>
</body>
</html>