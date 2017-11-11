<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="Comment.Comment"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<meta name="renderer" content="webkit">
<title>用户空间</title>
 <link rel="stylesheet" href="http://www.pintuer.com/css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="http://www.pintuer.com/js/jquery.js"></script>
    <script src="http://www.pintuer.com/js/pintuer.js"></script>
    <script type=text/javascript src=js/query.js></script>
    <script type="text/javascript" src="js/updateNews.js"></script>
    <script src="js/admin.js"></script>
    <link type="image/x-icon" href="http://www.pintuer.com/favicon.ico" rel="shortcut icon"/>
    <link href="http://www.pintuer.com/favicon.ico" rel="bookmark icon"/>
</head>
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
            <ul class="bread">
                <li><a href="content.html"> </a></li>
            </ul>
        </div>
    </div>
</div>
<%
      String context=(String)request.getAttribute("readContext");
      String filename=(String)request.getAttribute("filename");  
      ArrayList<Comment> comments=(ArrayList<Comment>)request.getAttribute("commentTable");
      
%>
<div class="admin">

    <div class="panel admin-panel">
         <div class="panel-head"><strong>文章详情</strong></div>
        <div class="padding border-bottom">
         <a class="button border-green button-small" href="javascript:history.go(-1);">返回</a>
         <a class="button border-blue button-small" href="FileAction!ReadFile?filename=<%=filename%>">编辑</a>
         <a class="button border-red button-small" href="#" onclick="shareFile('<%=filename%>');">分享</a>
        </div>
    <div class="wrap">
    <div class="clear"> </div>
    <div class="clear"> </div>
    <div class="grids-slider">
      <div class="blog-tabs">
      <h1 id="filename">
          <%=filename %>
          </h1>
        <div class="blog-section">
          <div class="blog-artical">
          
            <div class="artical-info">
            <%=context %>
            </div>
            <div class="artical-related-info">
              <div class="artical-related-info-row">
                <div class="clear"> </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!---//End-wrap---->
    </div>
  </div>
</div>
<%
              if(comments!=null&&comments.size()>0)
              for(Comment com:comments)
              {
       %>
          <div class="comment-section">
            <div class="comment-box">
              <div class="comment-people-pic">
                <a href="#">
                  <img src="./images/comment-people1.png" alt="">
                </a>
              </div>
              <div class="comment-info">
                <div class="comment-info-head">
                  <div class="comment-info-head-left">
                    <%=com.getOwner()%>
                  </div>
                  <div class="comment-info-head-right">
                    <ul>
                      <li>
                       <%=com.getCommentTime() %>
                      </li>
                      
                    </ul>
                  </div>
                  <div class="clear"> </div>
                  <div class="comment-place">
                    <p><%=com.getMessage() %></p>
                  </div>
                  <div class="clear"> </div>
                </div>
              </div>
              <div class="clear"> </div>
            </div>          
          </div>
          <%
              }
          %>
      <div class="contact-form">
         <div class="text-box textarea-box"> 
           <textarea id="comment" rows="2" cols="70" onfocus="if(this.value == 'Your Message') this.value='';" onblur="if(this.value == '') this.value='Your Message';">Your Message</textarea> <span>*</span> </div>
           <button id="sendcomment" value="Send Message" onclick="sendComment();">Send Message</button>
    </div>
</div>
</body>
<script type="text/javascript">   
function shareFile(file) {   
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
<script>
    function AlertMessage()
    {
      alert('test');
    }
    function sendComment(){
        var file=document.getElementById("filename").innerText;
        alert(file);
        var comment=document.getElementById("comment").value;
        alert(comment);
        var data={filename:file,
                  commentcontext:comment};
          $.ajax({
            url:"AjaxAction!sendComment",
            type: "POST",
            data: data,
            dataType:"json"
          })
          .done(function(data){
           alert("send comment success");
          })
          .fail( function(){
            alert("send comment error");
          })
    }
  </script>
</html>