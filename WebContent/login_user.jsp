<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>用户登录</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="css/sb-admin.css" rel="stylesheet">
</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Login</div>
			<div class="card-body">
				<form action="UserAction!UserLogin">
					<div class="form-group">
						<label for="InputUsername">UserID or UserEmail</label> <input
							class="form-control" name="user.UserID" id="InputUsername"
							type="text" placeholder="Username or Useremail" required="required">
					</div>
					<div class="form-group">
						<label for="InputPassword">Password</label> <input
							class="form-control" name="user.Password" id="InputPassword"
							type="password" placeholder="Password">
					</div>
					<div class="form-group">
						<div class="form-check">
							<label class="form-check-label"> <input
								class="form-check-input" type="checkbox"> Remember
								Password
							</label>
						</div>
					</div>
					<s:submit class="btn btn-primary btn-block" onclick="return check()" name="submit" value="Login" />
				</form>
			</div>
		</div>
	</div>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script>
		function check()
		{
			var a = document.getElementById("InputPassword").value;
			var patt1 = /[A-Z]/;
			var patt2 = /[a-z]/;
			var patt3 = /[0-9]/;
			var p1 = patt1.test(a);
			var p2 = patt2.test(a);
			var p3 = patt3.test(a);
			if(!(p1&&p2&&p3))
			{
				alert("密码须同时包含大、小写字母和阿拉伯数字！");
				return false;
			}
		}
	</script>
</body>
</html>