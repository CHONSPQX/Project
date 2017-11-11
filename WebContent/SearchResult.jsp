<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>玩转Bootstrap</title>
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
	<nav class="navbar navbar-inverse">
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
					<li class="active"><a href="UserAction!UserCheckFile">我的空间 <span class="sr-only">(current)</span></a></li>
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
				 <form class="navbar-form navbar-left" action="SearchAction!SearchFile">
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" name="CheckedFile">
              </div>
              <button type="submit" class="btn btn-default">Submit</button>
        </form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">登录</a></li>
					<li><a href="#">注册</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">用户<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
<!-- 搜索道德用户的自己的文章   -->	
<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="panel panel-default">
			<div class="panel-heading"><strong>我的文章列表</strong></div>
			<div class="panel-body">
				<div class="btn-group btn-group-justified" role="group" aria-label="...">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="createFile();" id="createFileButton">新建</button>
				</div>
				<div class="btn-group" role="group">
                	<button type="button" class="btn btn-default" onclick="renameFile();" id="renameFileButton">重命名</button>
            	</div>
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" onclick="deleteFile();" id="deleteFileButton">删除</button>
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
				String temp = allMyFile.get(i);
			    String type = temp.substring(temp.lastIndexOf("."), temp.length());
		%>
			<tr>
				<td><input type="radio" name="filename" value="<%=temp%>" /></td>
				<td><%=temp%></td>
				<td><%=type%></td>
				<td>
					<a class="button border-green button-little" href="FileAction!showPrivate?filename=<%=temp%>">详情</a> 
					<a class="button border-blue button-little" href="FileAction!ReadFile?filename=<%=temp%>">编辑</a> 
					<a class="button border-red button-little" href="#" onclick="shareFile('<%=temp%>');">分享</a>
				</td>
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
			<div class="panel-heading"><strong>共享文章列表</strong></div>
			<div class="panel-body">
				
			</div>
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
				<td>
					<a class="button border-green button-little" href="FileAction!showPrivate?filename=<%=temp%>">详情</a> 
					<a class="button border-blue button-little" href="FileAction!ReadFile?filename=<%=temp%>">编辑</a> 
					<a class="button border-red button-little" href="#" onclick="shareFile('<%=temp%>');">分享</a>
				</td>
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
	
	
	
	
	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container">CopyRight@QYZ team</div>
	</nav>

	<script type="text/javascript">
		function createFile() {
			var name = prompt("请输入文件名", ""); //将输入的内容赋给变量 name ，  
			//这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值  
			if (name)//如果返回的有内容  
			{
				alert("新建文件：" + name);
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
			var name = prompt("请输入文件名", ""); //将输入的内容赋给变量 name ，  
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
					alert("重命名:" + radioValue + " 为  " + name);
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
	</script>
</body>
</html>