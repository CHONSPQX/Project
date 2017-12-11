<%@page import="Article.Article"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
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
<%
  ArrayList<String> label=(ArrayList<String>)request.getAttribute("AllSecondClass");
  ArrayList<Article> articles=(ArrayList<Article>) request.getAttribute("AllFiles");
  String label1=(String)request.getAttribute("label1");
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>二级分类</strong>
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
							<th width="300">类别/标题</th>
							<th width="100">类型</th>
							<th width="150">操作</th>
						</tr>
						<%
						  if (label != null && label.size() > 0)
										for (int i = 0; i < label.size(); i++) {
											String temp = label.get(i);
											String type = new String();
											if (temp.contains("."))
												type = temp.substring(temp.lastIndexOf("."), temp.length());
						%>
						<tr>
							<td>
							</td>
							<td><%=temp%></td>
							<td><%=type%></td>
							<td><a class="button border-green button-little"
								href="Classifier!checkFilebyClass3?firstclass=<%=label1%>&secondclass=<%=temp %>">进入</a>
							</td>
						</tr>
						<%
						  }
						%>
						<%
						  if (articles != null && articles.size() > 0)
										for (int i = 0; i < articles.size(); i++) {
											Article article = articles.get(i);
											String temp=article.getTitle();
											String type = new String();
											if (temp.contains("."))
												type = temp.substring(temp.lastIndexOf("."), temp.length());
						%>
						<tr>
							<td><input type="radio" name="filename" value="<%=temp%>" />
							</td>
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
					<div class="panel-foot text-center">
						<ul class="pagination">
							<li><a href="#">上一页</a></li>
						</ul>
						<ul class="pagination pagination-group">
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
						</ul>
						<ul class="pagination">
							<li><a href="#">下一页</a></li>
						</ul>
					</div>
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
		function createFile() {
			var name = prompt("请输入文件名(.html)", ""); //将输入的内容赋给变量 name ，  
			//这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值  
			if (name)//如果返回的有内容  
			{
				var reg=/[\.]html$/;
				if(!reg.test(name))
				{
					//alert("文件名格式，错误！请以(.html)结尾");
					return;
				}
				//alert("新建文件：" + name);
				var data = {
					filename : name
				};
				$.ajax({
					url : "AjaxAction!createFile",
					type : "POST",
					data : data,
					dataType : "json"
				}).done(function(data) {
					window.location.reload();
				}).fail(function() {
					alert("添加文件失败");
				})
			}
		}
		function renameFile() {
			var name = prompt("请输入文件名(.html)", ""); //将输入的内容赋给变量 name ，  
			//这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值  
			var radioValue;
			if (name) {
				var radioStr = document.getElementsByName("filename");
				for (var i = 0; i < radioStr.length; i++) {
					if (radioStr[i].checked) {
						radioValue = radioStr[i].value;
					}
				}
				if (radioValue)//如果返回的有内容  
				{
					//输出值和文本  
					var reg=/[\.]html$/;
          if(!reg.test(name))
          {
            alert("文件名格式，错误！请以(.html)结尾");
            return;
          }
					//alert("重命名:" + radioValue + " 为  " + name);
					//把获得的数据转换为字符串传递到后台             
					radioValue = radioValue.toString();
					var data = {
						filename : radioValue,
						filerename : name
					};
					$.ajax({
						url : "AjaxAction!renameFile",
						type : "POST",
						data : data,
						dataType : "json"
					}).done(function(data) {
						window.location.reload();
					}).fail(function() {
						alert("重命名文件失败");
					})
				}
			}
		}
		function deleteFile() {
			var radioValue;
			var radioStr = document.getElementsByName("filename");
			for (var i = 0; i < radioStr.length; i++) {
				if (radioStr[i].checked) {
					radioValue = radioStr[i].value;
				}
			}
			if (radioValue)//如果返回的有内容  
			{
				//输出值和文本  
				alert("删除:" + radioValue);
				//把获得的数据转换为字符串传递到后台             
				radioValue = radioValue.toString();
				var data = {
					filename : radioValue
				};
				$.ajax({
					url : "AjaxAction!deleteFile",
					type : "POST",
					data : data,
					dataType : "json"
				}).done(function(data) {
					window.location.reload();
				}).fail(function() {
					alert("删除文件失败");
				})
			}
		}
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
				alert("分享文件成功");
			}).fail(function() {
				alert("分享文件失败");
			})

		}
		function pageBack() {
			history.go(-1);
		}
		function Search() {
			var file = document.getElementById("search").innerText;
			//alert(file);
			window.location.href = "SearchAction!SearchFile?CheckedFile="
					+ file;
		}
	</script>
</body>
</html>