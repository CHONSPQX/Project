<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
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
					<li><a href="#">我的空间</a></li>
					<li><a href="#">共享空间</a></li>
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
				<div class="navbar-form navbar-left">
					<div class="form-groupc">
						<input type="text" class="form-control" placeholder="Search"
							id="search">
					</div>
					<button class="btn btn-default">Submit</button>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login_user.jsp">登录</a></li>
					<li><a href="register_user.jsp">注册</a></li>
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
	<br>
  	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-11">
					<div role="main">
		<div id="js-pjax-container" data-pjax-container>
			<div class="container">
				<div class="col-3 float-left pr-4" role="navigation">
					<nav class="menu" data-pjax>
						<h3 class="menu-heading">Personal settings</h3>
						<a href="/settings/profile"
							class="js-selected-navigation-item selected menu-item"
							data-selected-links="avatar_settings /settings/profile">Profile</a>
					</nav>
				</div>
				<div class="col-9 float-right">
					<div class="Subhead mt-0 mb-0">
						<h2 class="Subhead-heading">Public profile</h2>
					</div>
					<form accept-charset="UTF-8" action="/users/CHONSPQX"
						class="columns js-uploadable-container js-upload-avatar-image is-default"
						id="profile_26895794" method="post" novalidate="novalidate">
					
						<div class="column">
							<dl class="form-group">
								<dt>
									<label for="user_profile_name">姓名</label>
								</dt>
								<dd>
									<input class="form-control" id="user_profile_name"
										name="user[profile_name]" size="30" type="text"
										value="CHONSPQX" />
								</dd>
							</dl>
							<dl class="form-group">
								<dt>
									<label for="user_profile_email">邮箱</label>
								</dt>
								<dd>
									<input class="form-control" id="user_profile_public_email"
										name="user[profile_public_email]" size="30" type="text"
										value="1264596728@qq.com" />
								</dd>
							</dl>
							<dl class="form-group">
								<dt>
									<label for="user_profile_bio">描述</label>
								</dt>
								<dd
									class="user-profile-bio-field-container js-suggester-container js-length-limited-input-container">
									<textarea
										class="form-control user-profile-bio-field js-suggester-field js-length-limited-input"
										cols="40" data-input-max-length="160"
										data-warning-text="{{remaining}} remaining"
										id="user_profile_bio" name="user[profile_bio]"
										placeholder="Tell us a little bit about yourself" rows="20">
student of the Harbin Institute of Technology,China </textarea>
									<p class="note">
										You can <strong>@mention</strong> other users and
										organizations to link to them.
									</p>
									<p
										class="js-length-limited-input-warning user-profile-bio-message d-none"></p>
									<div class="suggester-container">
										<div class="suggester js-suggester js-navigation-container"
											data-url="/autocomplete/user-suggestions"></div>
									</div>
								</dd>
							</dl>
							<dl class="form-group">
								<dt>
									<label for="user_profile_blog">性别</label>
								</dt>
								<dd>
									<input class="form-control" id="user_profile_blog"
										name="user[profile_blog]" size="30" type="url" value="" />
								</dd>
							</dl>
							<dl class="form-group">
								<dt>
									<label for="user_profile_company">生日</label>
								</dt>
								<dd
									class="user-profile-company-field-container js-suggester-container">
									<input autocomplete="off"
										class="form-control js-suggester-field"
										id="user_profile_company" name="user[profile_company]"
										size="30" type="text" value="" />
									<p class="note">
										You can <strong>@mention</strong> your company's GitHub
										organization to link it.
									</p>
									<div class="suggester-container">
										<div class="suggester js-suggester js-navigation-container"
											data-url="/autocomplete/organizations"></div>
									</div>
								</dd>
							</dl>
							<hr>
							<dl class="form-group">
								<dt>
									<label for="user_profile_location">地址</label>
								</dt>
								<dd>
									<input class="form-control" id="user_profile_location"
										name="user[profile_location]" size="30" type="text"
										value="Harbin, China" />
								</dd>
							</dl>
							<p>
								<button type="submit" class="btn btn-primary">Update
									</button>
							</p>
							<br>
							<br>
							<br>
							<br>
							<br>
						</div>
					</form>
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
	function Search() {
		var file = document.getElementById("search").value;
		//alert(file);
		window.location.href = "SearchAction!SearchFile?CheckedFile=" + file;
	}
</script>
</html>