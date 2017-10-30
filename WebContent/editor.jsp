<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<%
  response.setCharacterEncoding("UTF-8");
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="./css/editor.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
    <%
              String file= (String) request.getAttribute("readContext");
              String fileName= (String) request.getAttribute("filename");
              Date d=new Date();
    %>
    <!--
    
    
    <h1 id="filename">
    <%=fileName%>
    </h1>
    <p>
    <input id="context" type="text" value="<%=file %>" >
    </p>
    
    <br>
    <br>
    <br>
    <input type="button" class="btn btn-primary"  onclick="saveFile()" value="保存">
     
     -->
    
    
    <div class="panel panel-success">
    <div class="panel-heading">
     <div class="row">
     <div class="col-xs-6">
         <div class="text text-muted"><%=fileName %></div>
      </div>
      <div class="col-xs-6 text-right">
          <button type="button" class="btn btn-primary" onclick="saveFile()" id="submitBTN">保存文件</button>
       </div>
     </div>
    </div>
    <div class="panel-body">
        <textarea class="form-control"  id="textareaCode">
        <%= file %>
        </textarea>
    </div>
    <div class="panel-footer">
    <div class="small text-muted">
          <%= d %>
    </div>
    </div>
    </div>
    
    
    
    
    
    
    
</body>
<script src="./js/jquery.js"></script>
<script type="text/javascript">
function saveFile(){
	 var file=context.value;
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
    	alert(data.flag);
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