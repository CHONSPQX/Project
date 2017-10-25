<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="textml; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML>
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
	  <script src="./js/underscore-min.js"></script>
	  <script src= "./js/moment-2.2.1.js"></script>
	  <script src="./js/clndr.js"></script>
	  <script src="./js/site.js"></script>
	 <!----End Calender -------->
	</head>
	<body>
		<div id="wrapper">
  <jsp:include page="/pages/back/header.jsp"></jsp:include>
  <!-- 此处编写内容  -->
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

