<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>在线文章管理器</title>
	
	<link rel="stylesheet" href="css/mycss.css">
    <link rel="stylesheet" href="http://www.pintuer.com/css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <script src="http://www.pintuer.com/js/jquery.js"></script>
    <script src="http://www.pintuer.com/js/pintuer.js"></script>
    <script type=text/javascript src=js/query.js></script>
    <script type="text/javascript" src="js/updateNews.js"></script>
    <script src="js/admin.js"></script>
    <link type="image/x-icon" href="http://www.pintuer.com/favicon.ico" rel="shortcut icon"/>
    <link href="http://www.pintuer.com/favicon.ico" rel="bookmark icon"/>
</head>
<%
 ArrayList<String> allFile = (ArrayList<String>) request.getAttribute("AllFiles");
 %>
<body>

<div class="lefter">
    <div class="logo">
        <a href="#" target="_blank"><img src="images/logo.png" alt="后台管理系统"/></a>
    </div>
</div>
<div class="righter nav-navicon" id="admin-nav">
    <div class="mainer">
        <div class="admin-navbar">
			<span class="float-right">
            <a class="button button-little bg-main" href="content_user.jsp">回到首页</a>
            <a class="button button-little bg-yellow" href="login_user.jsp">注销登录</a>
            </span>
            <ul class="nav nav-inline admin-nav">
            <li class="active">
            	<a href="content_user.jsp" ><i class="fa fa-fw fa-file"></i><span >查看文章</span></a>
                <ul>
                	<li><a href="#">添加内容</a></li>
                	<li><a href="#">内容管理</a></li>
                	<li><a href="#">分类设置</a></li>
                	<li><a href="#">链接管理</a></li>
            	</ul>
            </li>
            <li ><a href="Authorization_user.jsp" class="icon-file">文章授权</a></li>
                <li>
                    <a href="AddNews_user.jsp" class="icon-cog">发布文章</a>
                    <ul>
                        <li><a href="#">全局设置</a></li>
                        <li class="active"><a href="#">系统设置</a></li>
                        <li><a href="#">会员设置</a></li>
                        <li><a href="#">积分设置</a></li>
                    </ul>
                </li>
            <li><a href="Dustbin_user.jsp" class="icon-th-list">回收站</a></li>
            </ul>
        </div>
        <div class="admin-bread">
            <span>您好，${userID}，欢迎您的光临。</span>
            <ul class="bread"><li><a href="content.html"> </a></li></ul>
        </div>
    </div>
</div>

<div class="admin">
    
<div class="line">
	
	<div class="x4">
	<div class="panel border-red-light">
		<div class="panel-head  border-red-light bg-red-light">
			<strong>标题</strong>
		</div>
		<div class="panel-body" id="panel-body">
			内容</div>
		<div class="panel-foot border-red-light bg-red-light">
			底部</div>
	</div></div>
	<div class="x4">
	<div class="panel border-red-light">
		<div class="panel-head  border-red-light bg-red-light">
			<strong>标题</strong>
		</div>
		<div class="panel-body" id="panel-body">
			内容</div>
		<div class="panel-foot border-red-light bg-red-light">
			底部</div>
	</div></div>
	<div class="x4">
	<div class="panel border-red-light">
		<div class="panel-head  border-red-light bg-red-light">
			<strong>标题</strong>
		</div>
		<div class="panel-body" id="panel-body">
			内容</div>
		<div class="panel-foot border-red-light bg-red-light">
			底部</div>
	</div></div>
</div>
<div class="line">
        <div class="x8">
        </div>
        <div class="x4">
          <ul class="pagination">
            <li>
              <a href="#">Prev</a>
            </li>
            <li>
              <a onclick="nextpage(0);">1</a>
            </li>
            <li>
              <a onclick="nextpage(1);">2</a>
            </li>
            <li>
              <a onclick="nextpage(2);">3</a>
            </li>
            <li>
              <a onclick="nextpage(3);">4</a>
            </li>
            <li>
              <a onclick="nextpage(4);">5</a>
            </li>
            <li>
              <a href="#">Next</a>
            </li>
          </ul>
        </div>
      </div>

</div>
</body>
</html>