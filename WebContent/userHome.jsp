<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Blog Magazine Flat UI Kit website for high end mobiles,like samsung nokia mobile website templates for free | Home :: w3layouts</title>
      <link href="./css/style.css" rel="stylesheet" type="text/css" media="all" />
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    
      <script src="./js/jquery.min.js"></script>
    <!-- end nav -->
    <script src="./js/login.js"></script>
    <script src="./js/modernizr.custom.js"></script>
     <!---starrt-bx-slider---->
        <!-- bxSlider Javascript file -->
        <script src="./js/jquery.bxslider.min.js"></script>
        <!-- bxSlider CSS file -->
        <link href="./css/jquery.bxslider.css" rel="stylesheet" />
        <script>
          $(document).ready(function(){
              $('.bxslider').bxSlider();
          });
        </script>
        
    <!---End-bx-slider---->
    <!----Calender -------->
    <link rel="stylesheet" href="./css/clndr.css" type="text/css" />
     <link rel="stylesheet" href="./css/userhome.css" type="text/css" />
    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template-->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">
    <script src="./js/underscore-min.js"></script>
    <script src= "./js/moment-2.2.1.js"></script>
    <script src="./js/clndr.js"></script>
    <script src="./js/site.js"></script>
    <script src="./js/layer.js"></script>
    <script type="text/javascript">
    function ShowDirBox()
    {
      layer.open({
        type:1,//１表示的是弹出框的类型是div类型的
        title:"登陆",
        area:["390px","300px"],//弹框的宽和高
        content:$("#DirBox") //引入弹框，即通过id找到这个div
      });
    }
    function ShowFileBox()
    {
      layer.open({
        type:1,//１表示的是弹出框的类型是div类型的
        title:"登陆",
        area:["390px","300px"],//弹框的宽和高
        content:$("#FileBox") //引入弹框，即通过id找到这个div
      });
    }
    </script>
  </head>
  <body>
    <div id="wrapper">
    
    <div id="DirBox">
    <div class="login-item">
    <form action="FileAction!createDir">
          <div class="form-group">
            <label for="InputDirname">文件夹名称</label>
            <input class="form-control" name="dirname" id="InputDirname" type="text"  placeholder="Dirname">
          </div>
          </div>
           <s:submit class="btn btn-primary btn-block" name ="submit" value="Confirm" />
     </form>
    </div> 
    <div>
    <input class="drk" type="button" value="CreateDir" onclick="ShowDirBox();" />
    </div>
    
    <div id="FileBox">
    <div class="login-item">
    <form action="FileAction!createFile">
    <div class="form-group">
    <label for="InputFilename">文件名称</label>
    <input class="form-control" name="filename" id="InputFilename" type="text"  placeholder="Filename">
    </div>
    </div>
    <s:submit class="btn btn-primary btn-block" name ="submit" value="Confirm" />
    </form>
    </div> 
    
     <div>
    <input class="drk" type="button" value="CreateFile" onclick="ShowFileBox();" />
    </div>
    
  <div id="page-wrapper">
    <div id="page-inner">
        <%
      ArrayList<String> all=(ArrayList<String>)request.getAttribute("AllFiles");
      if(all!=null&&!all.isEmpty())
      {
        for(String file:all)
        {
          %>
          <div class="bl_div" >
          File:
          <table width="100%"  border="1"  align="center">
          <tr bgcolor="#66ff33" >             
          <th>file</th>
          </tr>
          <tr>
          <td align="center"><%=file%></td>
          </tr>
          </table>
          </div>
      <%
        }
      }
      %>
    </div>
  </div>
</div>
  </body>
</html>

