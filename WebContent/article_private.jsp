<!-- 展示用户的个人文件 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta name="renderer" content="webkit">
<title>用户空间</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="bootstrap/js/popper.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/jquery.easing.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">登录</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<%
      String context=(String)request.getAttribute("readContext");
      String filename=(String)request.getAttribute("filename");      
%>
<div class="container">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
<div class="panel panel-default">
	<div class="panel-heading">文章详情</div>
	<div class="panel-body">
		<div class="btn-group btn-group-justified" role="group" aria-label="...">
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-default" onclick="createFile();" id="createFileButton">返回<tton>
			</div>
			<div class="btn-group" role="group">
                <button type="button" class="btn btn-default" onclick="renameFile();" id="renameFileButton">编辑<tton>
            </div>
			<div class="btn-group" role="group">
			    <button type="button" class="btn btn-default" onclick="deleteFile();" id="deleteFileButton">分享<tton>
			</div> 
		</div>
	</div>
	<div class="panel-body">
	<div class="panel panel-default">
	<div class="panel-heading"><%=filename %></div>
	<div class="panel-body" style="height:750px">
		<div><%=context %></div>
	</div>
	</div>
	</div>
	<div class="panel-footer">最后更新时间:</div>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript">   
function shareFile(file) 
{   
     //输出值和文本  
     alert("分享:"+file);  
     //把获得的数据转换为字符串传递到后台              
         var data={filename:file};
         $.ajax({
           url:"AjaxAction!shareFile",
           type: "POST",
           data: data,
           dataType:"json"
         })
         .done(function(data){
           alert("分享文件成功");
         })
         .fail( function(){
           alert("分享文件失败");
         })

}  
</script>
</html>