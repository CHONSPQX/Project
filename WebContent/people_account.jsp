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
	<div class="container">
		<div class="row">
			
			<div class="col-md-11">
				<div role="main">

				<div id="js-pjax-container" data-pjax-container>

					<div class="page-content container clearfix">

						<div class="col-3 float-left pr-4" role="navigation">
							<nav class="menu" data-pjax>
							<h3 class="menu-heading">Personal settings</h3>

							<a href="UserAction!getUserProfile"
								class="js-selected-navigation-item menu-item"
								>Profile</a>
							<a href="#"
								class="js-selected-navigation-item selected menu-item"
								>Account</a> </nav>
						</div>


						<div class="col-9 float-left">


							<div class="Subhead">
								<h2 class="Subhead-heading">Change password</h2>
							</div>

							<!-- Change Password -->
							<!-- '"` -->
							<!-- </textarea></xmp> -->
							</option>
							</form>
							<div accept-charset="UTF-8" action="/account" class="edit_user"
								id="change_password" method="post">
								<div style="margin: 0; padding: 0; display: inline">
									<input name="utf8" type="hidden" value="&#x2713;" /><input
										name="_method" type="hidden" value="put" /><input
										name="authenticity_token" type="hidden"
										value="r/5tOlSeYmiPVb3Sr/3WKF7ULqrMkIMm31OwlvB0q4cANtpmq+9FHZCy01GvQYMvA+z43FUbhFNj7Oqb1mKA+Q==" />
								</div>
								<dl class="form-group password-confirmation-form">
									<dt>
										<label for="user_old_password">Old password</label>
									</dt>
									<dd>
										<input class="form-control form-control"
											id="user_old_password" 
											required="required" tabindex="2" type="password" />
									</dd>
								</dl>
								<dl class="form-group password-confirmation-form">
									<dt>
										<label for="user_new_password">New password</label>
									</dt>
									<dd>
										<input class="form-control form-control"
											id="user_new_password"
											required="required" tabindex="2" type="password" />
									</dd>
								</dl>
								<dl class="form-group password-confirmation-form">
									<dt>
										<label for="user_confirm_new_password">Confirm new
											password</label>
									</dt>
									<dd>
										<input class="form-control form-control"
											id="user_confirm_new_password"
											required="required"
											tabindex="2" type="password" />
									</dd>
								</dl>
								<p>
									<button class="btn mr-2" onclick="changePassword();">Update password</button>
								</p>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-backdrop js-touch-events"></div>
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
	function checkPassword()
	{
		var oldpwd=document.getElementById("user_old_password").value;
		var newpwd=document.getElementById("user_new_password").value;
		var conpwd=document.getElementById("user_confirm_new_password").value;
		var patt1 = /[A-Z]/;
		var patt2 = /[a-z]/;
		var patt3 = /[0-9]/;
		var p1 = patt1.test(oldpwd);
		var p2 = patt2.test(oldpwd);
		var p3 = patt3.test(oldpwd);
		if(!(p1&&p2&&p3))
		{
			alert("密码须同时包含大、小写字母和阿拉伯数字");
			return false;
		}
		var p1 = patt1.test(newpwd);
		var p2 = patt2.test(newpwd);
		var p3 = patt3.test(newpwd);
		if(!(p1&&p2&&p3))
		{
			alert("新密码须同时包含大、小写字母和阿拉伯数字");
			return false;
		}
		var p4 = (newpwd==conpwd);
		if(!p4)
		{
				alert("输入的新密码不一致");
				return false;
		}
		return true;
	}
	function changePassword()
	{
		var oldpwd=document.getElementById("user_old_password").value;
		var newpwd=document.getElementById("user_new_password").value;
		var conpwd=document.getElementById("user_confirm_new_password").value;
		var flag=checkPassword()
		if(!flag)
			return;
		var data = {
			    oldpassword : oldpwd,
				newpassword : newpwd
			};
			$.ajax({
				url : "AjaxAction!changePassword",
				type : "POST",
				data : data,
				dataType : "json"
			}).done(function(data) {
				alert("修改成功");
				window.location.reload();
			}).fail(function() {
				alert("修改失败");
				window.location.reload();
				
	});
	}
</script>
</html>