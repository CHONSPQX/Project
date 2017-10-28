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
<title>Insert title here</title>
</head>
<body>
    <%
              String file= (String) request.getAttribute("readContext");
              String fileName= (String) request.getAttribute("filename");
    %>
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