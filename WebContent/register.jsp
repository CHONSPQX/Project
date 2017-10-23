<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Register Page</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>
<%@page import="java.sql.*"%>
<%
	String submit = null;
	submit = request.getParameter("submit");
	if (submit != null) {
		String uname = request.getParameter("admin.username");
		String pwd = request.getParameter("admin.userpwd");
		String message=(String)request.getAttribute("admin_check_message");
		System.out.println(message);
		if (message!=null&&message.equals("admin_check_success")) 
		{
			session.setAttribute("user", uname);
			response.sendRedirect("index.jsp");
		} 
	}
%>
<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Register</div>
      <div class="card-body">
        <form action="adminaction!Admin_check">
          <div class="form-group">
            <label for="InputUsername">UserID</label>
            <input class="form-control" name="admin.username" id="InputUsername" type="text"  placeholder="Username">
          </div>
          <div class="form-group">
            <label for="InputPassword">Password</label>
            <input class="form-control" name="admin.userpwd" id="InputPassword" type="password" placeholder="Password">
          </div>
          <div class="form-group">
            <label for="InputPassword">Confirm Password</label>
            <input class="form-control" name="admin.userpwd" id="InputPassword" type="password" placeholder="Password">
          </div>
          </div>
           <s:submit class="btn btn-primary btn-block" name ="submit" value="Register" />
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
</body>

</html>
