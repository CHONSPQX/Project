<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Blog Magazine</title>
    <script src="js/jquery.js"></script>
    <script src="layer/src/layer.js"></script>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css"  type="text/css">
    <link rel="stylesheet" href="css/userhome.css" type="text/css" />
  </head>
  <script type="text/javascript">
    /*function ShowDirBox()
    {
      layer.open({
        type:1,//１表示的是弹出框的类型是div类型的
        title:'登陆',
        area:['390px','300px'],//弹框的宽和高
        shadeClose:true,
        content:$("#DirBox") //引入弹框，即通过id找到这个div
      });
    }*/
    $('#showdirbox').on('click', function(){
        layer.open({
          type: 1,
          area: ['600px', '360px'],
          shadeClose: true, //点击遮罩关闭
          content:'\<\div style="padding:20px;">自定义内容\<\/div>'
        });
      });
    /*function ShowFileBox()
    {
      layer.open({
        type:1,//１表示的是弹出框的类型是div类型的
        title:'登陆',
        area:['390px','300px'],//弹框的宽和高
        shadeClose:true;
        content:$("#FileBox") //引入弹框，即通过id找到这个div
      });
    }*/
    $('#showfilebox').on('click', function(){
        layer.open({
          type: 1,
          area: ['600px', '360px'],
          shadeClose: true, //点击遮罩关闭
          content: $("#FileBox")
        });
      });
    </script>
  <body>
   
   <div >
    <form action="FileAction!createDir">
          <div class="form-group">
            <label for="InputDirname">文件夹</label>
            <input class="form-control" name="dirname" id="InputDirname" type="text"  placeholder="Dirname">
          </div>
           <s:submit class="btn btn-primary btn-block" name ="submit" value="创建文件夹" />
     </form>
     </div>
     
   <div >
    <form action="FileAction!deleteDir">
          <div class="form-group">
            <label for="InputDirname">文件夹</label>
            <input class="form-control" name="dirname" id="InputDirname" type="text"  placeholder="Dirname">
          </div>
           <s:submit class="btn btn-primary btn-block" name ="submit" value="删除文件夹" />
     </form>
     </div>
     
     <div>
     <form action="FileAction!renameDir">
          <div class="form-group">
            <label for="InputDirname">文件夹</label>
            <input class="form-control" name="dirname" id="InputDirname" type="text"  placeholder="Dirname">
             <input class="form-control" name="dierename" id="InputDirname" type="text"  placeholder="Direname">
          </div>
           <s:submit class="btn btn-primary btn-block" name ="submit" value="重命名文件夹" />
     </form>
     </div>
   
    
   <div >
    <form action="FileAction!createFile">
    <div class="form-group">
    <label for="InputFilename">文件名称</label>
    <input class="form-control" name="filename" id="InputFilename" type="text"  placeholder="Filename">
    </div>
    <s:submit class="btn btn-primary btn-block" name ="submit" value="创建文件" />
    </form>
    </div>
    
     <div >
    <form action="FileAction!deleteFile">
    <div class="form-group">
    <label for="InputFilename">文件名称</label>
    <input class="form-control" name="filename" id="InputFilename" type="text"  placeholder="Filename">
    </div>
    <s:submit class="btn btn-primary btn-block" name ="submit" value="删除文件" />
    </form>
    </div>
    
     <div >
    <form action="FileAction!renameFile">
    <div class="form-group">
    <label for="InputFilename">文件名称</label>
    <input class="form-control" name="filename" id="InputFilename" type="text"  placeholder="Filename">
    <input class="form-control" name="filerename" id="InputFilename" type="text"  placeholder="Filerename">
    </div>
    <s:submit class="btn btn-primary btn-block" name ="submit" value="重命名文件" />
    </form>
    </div>
    
   
  <div id="wrapper" class="contianer"> 
  <div id="page-wrapper">
    <div id="page-inner">
    <div class="bl_div" >
     <h1>File:</h1>
     <table width="100%"  border="1"  align="center">
     <tr bgcolor="#66ff33" >             
     <th>file</th>
     </tr>
      <%
      ArrayList<String> all=(ArrayList<String>)request.getAttribute("AllFiles");
      if(all!=null&&!all.isEmpty())
      {
        for(String file:all)
        {
      %>
          <tr>
          <td align="center"><%=file%></td>
          </tr> 
      <%
        }
      }
      %>
      </table>
    </div>
    <div>
    <button class="btn btn-primary" id="showdirbox" >CreateDir</button>
    </div>
     <div>
    <button  class="btn btn-primary" id="showfilebox" >CreateFile</button>
    </div>
  </div>
</div>
</body>
</html>

