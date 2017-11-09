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
 <link rel="stylesheet" href="http://www.pintuer.com/css/pintuer.css">
 <link rel="stylesheet" href="css/admin.css">
 <script src="http://www.pintuer.com/js/jquery.js"></script>
 <script src="js/admin.js"></script>
 <link type="image/x-icon" href="http://www.pintuer.com/favicon.ico" rel="shortcut icon"/>
 <link href="http://www.pintuer.com/favicon.ico" rel="bookmark icon"/>
<link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="./uieditor/bootstrap-combined.no-icons.min.css" rel="stylesheet">
<link href="./uieditor/bootstrap-responsive.min.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="./uieditor/index.css" type="text/css"> </link>
<script src="./uieditor/jquery1.9.1.min.js" type="text/javascript"></script>
<script src="./uieditor/bootstrap.min.js"></script>
<script src="./uieditor/bootstrap-wysiwyg.js" type="text/javascript"></script>
<script src="./uieditor/external/jquery.hotkeys.js" type="text/javascript"></script>
<style>
#editor {overflow:scroll; max-height:600px}
</style>
</head>
<body>
<div class="righter nav-navicon" id="admin-nav">
       <div class="admin-navbar">
          <span class="float-left">
                    <a class="button button-little bg-main" href="content_user.jsp">回到首页</a>
          </span>
          <span class="float-right">
                    <a class="button button-little bg-yellow" href="login_user.jsp">注销登录</a>
          </span>
        </div>
        <div class="admin-bread">
            <span>您好，${userID}，欢迎您的光临。</span>
            <ul class="bread">
                <li><a href="content.html"> </a></li>
            </ul>
        </div>
</div>
<div class="container">
  <div class="hero-unit">
  <hr/>
   <%
              String file= (String) request.getAttribute("readContext");
              String fileName= (String) request.getAttribute("filename");
   %>
    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
          <ul class="dropdown-menu">
          </ul>
        </div>
      <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
          <ul class="dropdown-menu">
          <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
          <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
          <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
          </ul>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
      </div>
      <div class="btn-group">
      <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
        <div class="dropdown-menu input-append">
          <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
          <button class="btn" type="button">Add</button>
        </div>
        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>
      </div>
      
      <div class="btn-group">
        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
      </div>
      <div class="btn-group">
        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
        <a class="btn" id="saveFile" title="Save File" onclick="saveFile()"><i class="icon-save"></i></a>
      </div>
      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
    </div>
    <div id="editor">
    <%=file %>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">   
$(function(){
  function initToolbarBootstrapBindings() {
    var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
          'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
          'Times New Roman', 'Verdana'],
          fontTarget = $('[title=Font]').siblings('.dropdown-menu');
    $.each(fonts, function (idx, fontName) {
        fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
    });
    $('a[title]').tooltip({container:'body'});
    $('.dropdown-menu input').click(function() {return false;})
      .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
      .keydown('esc', function () {this.value='';$(this).change();});

    $('[data-role=magic-overlay]').each(function () { 
      var overlay = $(this), target = $(overlay.data('target')); 
      overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
    });
    if ("onwebkitspeechchange"  in document.createElement("input")) {
      var editorOffset = $('#editor').offset();
      $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
    } else {
      $('#voiceBtn').hide();
    }
};
function showErrorAlert (reason, detail) {
  var msg='';
  if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
  else {
    console.log("error uploading file", reason, detail);
  }
  $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
   '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
};
  initToolbarBootstrapBindings(); 
$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
});

function saveFile(){
   var file=$('#editor').html();
   var name= '<%=fileName %>';
   var data ={context:file,filename:name};
   console.log(data);
    $.ajax({
      url:"AjaxAction!saveFile",
      data:  data, //$('#context').value
      type: "POST",
      dataType:"json"
    })
    .done(function(data){
      if(data.flag==true)
      {
        confirm("保存成功");
      }
      else
      {
        confirm("保存失败");
      }
    })
    .fail( function(){
      alert("error");
    })
}
</script>
</html>