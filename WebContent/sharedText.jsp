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
    <script src="http://www.pintuer.com/js/jquery.js"></script>
    <script src="http://www.pintuer.com/js/pintuer.js"></script>
    <script type=text/javascript src=js/query.js></script>
    <script type="text/javascript" src="js/updateNews.js"></script>
    <script src="js/admin.js"></script>
    <link type="image/x-icon" href="http://www.pintuer.com/favicon.ico" rel="shortcut icon"/>
    <link href="http://www.pintuer.com/favicon.ico" rel="bookmark icon"/>
   <link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
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
            	<a href="content_user.jsp" class="icon-file-text">查看文章</a>
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
    
 <div class="row">
    <div class="col-md-4">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title" id="title1">
            Panel title
          </h3>
        </div>
        <div class="panel-body" id="context1">
          Panel content
        </div>
        <div class="panel-footer"id="footer1">
          Panel footer
        </div>
      </div>
      <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
           
          <button type="button" class="btn btn-primary btn-sm" id="detail1"  onclick="ShowDetail();">
            ShowDetail
          </button>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="panel panel-success">
        <div class="panel-heading">
          <h3 class="panel-title" id="title2">
            Panel title
          </h3>
        </div>
        <div class="panel-body" id="context2">
          Panel content
        </div>
        <div class="panel-footer" id="footer2">
          Panel footer
        </div>
      </div>
      <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
           
         <button type="button" class="btn btn-primary btn-sm" id="detail2"  onclick="ShowDetail();">
            ShowDetail
          </button>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="panel panel-info">
        <div class="panel-heading">
          <h3 class="panel-title" id="title3">
           Panel title
          </h3>
        </div>
        <div class="panel-body" id="context3">
          Panel content
        </div>
        <div class="panel-footer" id="footer3">
          Panel footer
        </div>
      </div>
      <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
           
          <button type="button" class="btn btn-primary btn-sm" id="detail3" onclick="ShowDetail();">
            ShowDetail
          </button>
        </div>
      </div>
    </div>
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
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery.js"></script>
<script>
    var pagenum=0;
    var map;
    function nextpage(num)
    {
      getContext(num);
      pagenum=num;
    }

    function getContext(num){
        var data={num:num};
          $.ajax({
            url:"AjaxTest!updateContext",
            type: "POST",
            data: data,
            dataType:"json"
          })
          .done(function(data){
           
          var title1=document.getElementById("title1");
          //alert(data.title1);
           title1.innerText=data.title1;
           var context1=document.getElementById("context1");
           //alert(data.context1);
           context1.innerHTML=data.context1;
           var footer1=document.getElementById("footer1");
           //alert(data.footer1);
           footer1.innerText=data.footer1;
           
           
           var title2=document.getElementById("title2");
          // alert(data.title2);
           title2.innerText=data.title2;
           var context2=document.getElementById("context2");
           context2.innerHTML=data.context2;
           var footer2=document.getElementById("footer2");
           footer2.innerText=data.footer2;
           
           
           var title3=document.getElementById("title3");
           //alert(data.title3);
           title3.innerText=data.title3;
           var context3=document.getElementById("context3");
           context3.innerHTML=data.context3;
           var footer3=document.getElementById("footer3");
           footer3.innerText=data.footer3;
           
          })
          .fail( function(){
            alert(num);
          })
    }
    $(document).ready(function(){
        nextpage(0);
    });
    $(document).ready(function(){
        $("#detail1").click(function(){
          
        });
    });
    $(document).ready(function(){
        $("#detail2").click(function(){
           $.post("POST","http://www.baidu.com");
        });
    });
    $(document).ready(function(){
        $("#detail3").click(function(){
           $.post("POST","http://www.baidu.com");
        });
    });
    
    function ShowDetail() 
    { 
    	console.log(event.target.id)
    	
    	if(event.target.id=="detail1"){
    		var file=document.getElementById("title1").innerText;
    		window.location.href="FileAction!showPublic?filename="+file;
    	}
    	else if(event.target.id=="detail2"){
    		var file=document.getElementById("title2").innerText;
    		window.location.href="FileAction!showPublic?filename="+file;
    	}
    	else if(event.target.id=="detail3"){
    		var file=document.getElementById("title3").innerText;
    		window.location.href="FileAction!showPublic?filename="+file;
    	}
    	//window.location.href="login.jsp?backurl="+window.location.href; 
    } 
    
    //为获取List对象按钮添加鼠标单击事件  
    </script>
</html>