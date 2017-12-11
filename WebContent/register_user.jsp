<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>用户注册</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="css/sb-admin.css" rel="stylesheet">
</head>
<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Register</div>
			<div class="card-body">
				<form action="UserAction!UserCreate">
					<div class="form-group">
						<label for="InputUsername">UserID</label> <input
							class="form-control" name="user.UserID" id="InputUsername"
							type="text" placeholder="Username" required="required">
					</div>
					<div class="form-group">
						<label for="InputUseremail">UserEmail</label> <input
							class="form-control" name="user.UserEmail" id="InputUseremail"
							type="text" placeholder="Useremail" required="required">
					</div>
					<div class="form-group">
						<label for="InputPassword">Password</label> <input
							class="form-control" name="user.Password" id="InputPassword1"
							type="password" placeholder="Password" required="required">
					</div>
					<div class="form-group">
						<label for="InputPassword">Confirm Password</label> <input
							class="form-control" name="confirmword" id="InputPassword2"
							type="password" placeholder="Password" required="required">
					</div>
			</div>
			<s:submit class="btn btn-primary btn-block" value="Register" onclick="return check()"/>
			</form>
		</div>
	</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script>
	function check()
	{
		var a = document.getElementById("InputUseremail").value;
		var pat = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	    var p = pat.test(a);
		if(!p)
		{
			alert("请输入合法的邮件地址");
			return false;
		}
		var b = document.getElementById("InputPassword1").value;
		var patt1 = /[A-Z]/;
		var patt2 = /[a-z]/;
		var patt3 = /[0-9]/;
		var p1 = patt1.test(b);
		var p2 = patt2.test(b);
		var p3 = patt3.test(b);
		if(!(p1&&p2&&p3))
		{
			alert("密码须同时包含大、小写字母和阿拉伯数字");
			return false;
		}
		var b2 = document.getElementById("InputPassword2").value;
		var p4 = (b2==b);
		if(!p4)
			{
				alert("请确保两次输入的密码一致");
				return false;
			}
	}
	
		
	</script>
</body>

</html>
