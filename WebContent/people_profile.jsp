<%@page import="sun.print.resources.serviceui"%>
<%@page import="User.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
String session_user = (String) session.getAttribute("userID");
if (session_user == null) 
	response.sendRedirect("index.jsp");
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>文章管理系统</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="gitcss/gitcss0.css" />
<link rel="stylesheet" href="gitcss/gitcss1.css" />
<link rel="stylesheet" href="gitcss/gitcss.css" />
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
				<li><a href="UserAction!UserCheckFile">个人文件
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
	<%
		User user = (User) request.getAttribute("user_profile");
		if (user == null)
			user = new User();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-11">
				<div role="main">
					<div id="js-pjax-container" data-pjax-container>
						<div class="container">
							<div class="col-3 float-left pr-4" role="navigation">
								<nav class="menu" data-pjax>
									<h3 class="menu-heading">Personal settings</h3>
									<a href="#"
								class="js-selected-navigation-item selected menu-item"
								>Profile</a>
							<a href="people_account.jsp"
								class="js-selected-navigation-item  menu-item"
								>Account</a>
								</nav>
							</div>
							<div class="col-9 float-right">
								<div class="Subhead mt-0 mb-0">
									<h2 class="Subhead-heading">Public profile</h2>
								</div>
								<div 
									class="columns js-uploadable-container js-upload-avatar-image is-default"
									novalidate="novalidate">

									<div class="column">
										<dl class="form-group">
											<dt>
												<label for="user_name">姓名</label>
											</dt>
											<dd>
												<input class="form-control" id="user_name" size="30"
													type="text" value="<%=user.getName()%>" />
											</dd>
										</dl>
										<dl class="form-group">
											<dt>
												<label for="user_email">邮箱</label>
											</dt>
											<dd>
												<input class="form-control" id="user_email" size="30"
													type="text" value="<%=user.getUserEmail()%>" />
											</dd>
										</dl>
										<dl class="form-group">
											<dt>
												<label for="user_message">描述</label>
											</dt>
											<dd
												class="user-profile-bio-field-container js-suggester-container js-length-limited-input-container">
												<textarea
													class="form-control user-profile-bio-field js-suggester-field js-length-limited-input"
													cols="40" data-input-max-length="160"
													id="user_message"
													placeholder="Tell us a little bit about yourself" rows="20"><%=user.getMessage()%></textarea>
											</dd>
										</dl>
										<dl class="form-group">
											<dt>
												<label for="user_sex">性别</label>
											</dt>
											<dd>
												<select class="form-control" id="user_sex" value="<%=user.getSex()%>">
												<%
												if(user.getSex()==1)
												{
													%>
													<option value="1" selected="selected">男</option> 
													<option value="0">女</option> 
													<%
												}
												else
												{
													%>
													<option value="1" >男</option> 
													<option value="0" selected="selected">女</option> 
													<%
												}
												%> 
												
												</select>
											</dd>
										</dl>
										<dl class="form-group">
											<dt>
												<label for="user_birthdate">生日</label>
											</dt>
											<dd>
												<!-- <input autocomplete="off"
													class="form-control js-suggester-field" id="user_birthdate"
													size="30" type="text" value="" />-->
												<input id="user_birthdate" class="form-control" type="date" value="<%=user.getBirthDate()%>"/>
											</dd>
										</dl>
										
										<dl class="form-group">
											<dt>
												<label for="user_address">地址</label>
											</dt>
											<dd>
												<input class="form-control" id="user_address" size="30"
													type="text" value="<%=user.getAddress()%>" />
											</dd>
										</dl>
										<p align="center">
											<button type="submit" class="btn btn-primary"  onclick="SetUserProfile();">Update
											</button>
										</p>
										<br> <br> <br> <br> <br>
									</div>
								</div>
							</div>
						</div>
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

	function SetUserProfile() 
	{
		var username=document.getElementById('user_name').value;
		var useremail=document.getElementById('user_email').value;
		var usermessage=document.getElementById('user_message').value;
		var usersex=document.getElementById('user_sex').value;
		var userbirthdate=document.getElementById('user_birthdate').value;
		var useraddress=document.getElementById('user_address').value;
		var data = {
				'user.Name':username,
				'user.UserEmail':useremail,
				'user.Message':usermessage,
				'user.Sex':usersex,
				'user.BirthDate':userbirthdate,
				'user.Address':useraddress
			};
			$.ajax({
				url : "AjaxUserProfile!SetUserProfile",
				type : "POST",
				data : data,
				dataType : "json"
			}).done(function(data) {
				window.location.reload();
			}).fail(function() {
				alert("error");
			});

	}
</script>
</html>