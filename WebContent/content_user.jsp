<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            <ul class="bread">
                <li><a href="content.html"> </a></li>
            </ul>
        </div>
    </div>
</div>

<div class="admin">

        <div class="panel admin-panel">
            <div class="panel-head"><strong>我的文章列表</strong></div>
            <div class="padding border-bottom">
               <input type="button" onclick="createFile();" id="createFileButton" class="button button-small border-green" value="新建"/>
               <input type="button" onclick="deleteFile();" id="deleteFileButton" class="button button-small border-yellow" value="删除"/>
               <input type="button" onclick="renameFile();" id="renameFileButton" class="button button-small border-blue" value="重命名"/>
            </div>
            <table class="table table-hover">
                <tr>
                    <th width="45">选择</th>
                    <th width="300">标题</th>
                    <th width="100">类别</th>
                    <th width="150">操作</th>
                </tr>
                <%
                    if(allFile!=null&&allFile.size()>0)
                    for (int i = 0; i < allFile.size(); i++) {
                        String temp = allFile.get(i);
                        String type=temp.substring(temp.lastIndexOf("."),temp.length());
                %>
                <tr>
                    <td>
                        <input type="radio" name="filename" value="<%=temp%>"/>
                    </td>
                    <td><%=temp %>
                    </td>
                    <td><%=type%>
                    </td>
                    <td>
                        <a class="button border-green button-little" href="FileAction!showDetail?filename=<%=temp%>">详情</a>
                        <a class="button border-blue button-little" href="FileAction!ReadFile?filename=<%=temp%>">编辑</a>
                        <a class="button border-red button-little" href="#" onclick="shareFile('<%=temp%>');">分享</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <div class="panel-foot text-center">
                <ul class="pagination">
                    <li><a href="#">上一页</a></li>
                </ul>
                <ul class="pagination pagination-group">
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                </ul>
                <ul class="pagination">
                    <li><a href="#">下一页</a></li>
                </ul>
            </div>
        </div>
</div>
<script type="text/javascript">   
function createFile() {  
    var name = prompt("请输入文件名", ""); //将输入的内容赋给变量 name ，  
    //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值  
    if (name)//如果返回的有内容  
    {  
        alert("新建文件：" + name);
        var data={filename:name};
        $.ajax({
          url:"AjaxAction!createFile",
          type: "POST",
          data: data,
          dataType:"json"
        })
        .done(function(data){
        	 window.location.reload();
        })
        .fail( function(){
          alert("添加文件失败");
        })
    }  
}  
function renameFile() {  
    var name = prompt("请输入文件名", ""); //将输入的内容赋给变量 name ，  
    //这里需要注意的是，prompt有两个参数，前面是提示的话，后面是当对话框出来后，在对话框里的默认值  
    var radioValue;  
    if(name){
    var radioStr=document.getElementsByName("filename");    
    for(var i=0; i<radioStr.length; i++){  
     if(radioStr[i].checked){   
         radioValue=radioStr[i].value;          
      }  
     }   
      if (radioValue)//如果返回的有内容  
      {  
    	//输出值和文本  
          alert("重命名:"+radioValue+" 为  "+name);  
            //把获得的数据转换为字符串传递到后台             
          radioValue=radioValue.toString(); 
          var data={filename:radioValue,
        		  filerename:name};
          $.ajax({
            url:"AjaxAction!renameFile",
            type: "POST",
            data: data,
            dataType:"json"
          })
          .done(function(data){
             window.location.reload();
          })
          .fail( function(){
            alert("重命名文件失败");
          })
      }  
    	}
}  
function deleteFile() {  
    var radioValue;  
    var radioStr=document.getElementsByName("filename");    
    for(var i=0; i<radioStr.length; i++)
    {  
     if(radioStr[i].checked)
     {   
         radioValue=radioStr[i].value;          
     }  
    }   
    if (radioValue)//如果返回的有内容  
    {  
     //输出值和文本  
         alert("删除:"+radioValue);  
           //把获得的数据转换为字符串传递到后台             
         radioValue=radioValue.toString(); 
         var data={filename:radioValue};
         $.ajax({
           url:"AjaxAction!deleteFile",
           type: "POST",
           data: data,
           dataType:"json"
         })
         .done(function(data){
            window.location.reload();
         })
         .fail( function(){
           alert("删除文件失败");
         })
    }
}  
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
</body>
</html>