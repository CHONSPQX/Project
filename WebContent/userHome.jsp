<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Blog Magazine</title>
<script src="http://cdn.bootcss.com/jquery/1.12.3/jquery.min.js"></script>
<script src="./layer/dist/layer.js"></script>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" href="css/userhome.css" type="text/css" />
</head>
<body>

	<div class="contianer">
		<div class="btn-group" role="group" aria-label="文件夹">
			<button type="button" id="createDirButton"
				class="btn btn-primary btn4">新建文件夹</button>
			<button type="button" id="renameDirButton" class="btn btn-info btn4">重命名文件夹</button>
			<button type="button" id="deleteDirButton"
				class="btn btn-danger btn4">删除文件夹</button>
		</div>
	</div>
	<p>
	<p>
	<p>
	<p>
	<div class="contianer">
		<div class="btn-group" role="group" aria-label="文件">
			<button type="button" id="createFileButton"
				class="btn btn-primary btn4">新建文件</button>
			<button type="button" id="renameFileButton" class="btn btn-info btn4">重命名文件</button>
			<button type="button" id="deleteFileButton"
				class="btn btn-danger btn4">删除文件</button>
		</div>
	</div>

	<div id="createDirBox" class="hideBox">
		<form action="FileAction!createDir">
			<div class="form-group">
				<label for="InputDirname">文件夹</label> <input class="form-control"
					name="dirname" id="InputDirname" type="text" placeholder="Dirname">
			</div>
			<s:submit class="btn btn-primary btn-block" name="submit"
				value="创建文件夹" />
		</form>
	</div>

	<div id="deleteDirBox" class="hideBox">
		<form action="FileAction!deleteDir">
			<div class="form-group">
				<label for="InputDirname">文件夹</label> <input class="form-control"
					name="dirname" id="InputDirname" type="text" placeholder="Dirname">
			</div>
			<s:submit class="btn btn-primary btn-block" name="submit"
				value="删除文件夹" />
		</form>
	</div>

	<div id="renameDirBox" class="hideBox">
		<form action="FileAction!renameDir">
			<div class="form-group">
				<label for="InputDirname">文件夹</label> 
				<input class="form-control"
					name="dirname" id="InputDirname" type="text" placeholder="Dirname">
				<input class="form-control" name="dirrename" id="InputDirname"
					type="text" placeholder="Direname">
			</div>
			<s:submit class="btn btn-primary btn-block" name="submit"
				value="重命名文件夹" />
		</form>
	</div>


	<div id="createFileBox" class="hideBox">
		<form action="FileAction!createFile">
			<div class="form-group">
				<label for="InputFilename">文件名称</label> <input class="form-control"
					name="filename" id="InputFilename" type="text"
					placeholder="Filename">
			</div>
			<s:submit class="btn btn-primary btn-block" name="submit"
				value="创建文件" />
		</form>
	</div>

	<div id="deleteFileBox" class="hideBox">
		<form action="FileAction!deleteFile">
			<div class="form-group">
				<label for="InputFilename">文件名称</label> <input class="form-control"
					name="filename" id="InputFilename" type="text"
					placeholder="Filename">
			</div>
			<s:submit class="btn btn-primary btn-block" name="submit"
				value="删除文件" />
		</form>
	</div>

	<div id="renameFileBox" class="hideBox">
		<form action="FileAction!renameFile">
			<div class="form-group">
				<label for="InputFilename">文件名称</label> 
				<input class="form-control"
					name="filename" id="InputFilename" type="text"
					placeholder="Filename"> 
				<input class="form-control"
					name="filerename" id="InputFilename" type="text"
					placeholder="Filerename">
			</div>
			<s:submit class="btn btn-primary btn-block" name="submit"
				value="重命名文件" />
		</form>
	</div>


	<div id="wrapper" class="contianer">
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="bl_div">
					<h1>File:</h1>
					<table width="100%" border="1" align="center">
						<tr bgcolor="#66ff33">
							<th>file</th>
						</tr>
						<%
						  ArrayList<String> all = (ArrayList<String>) request.getAttribute("AllFiles");
									if (all != null && !all.isEmpty()) {
										for (String file : all) {
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
			</div>
		</div>
</body>
<script type="text/javascript">
	$('#createDirButton').on('click', function() {
		layer.open({
			type : 1,
			area : [ '300px', '240px' ],
			shadeClose : true, //点击遮罩关闭
			content : $('#createDirBox')
		});
	});
	$('#createFileButton').on('click', function() {
		layer.open({
			type : 1,
			area : [ '300px', '240px' ],
			shadeClose : true, //点击遮罩关闭
			content : $('#createFileBox').attr('display', 'block')
		});
	});
	$('#deleteDirButton').on('click', function() {
		layer.open({
			type : 1,
			area : [ '300px', '240px' ],
			shadeClose : true, //点击遮罩关闭
			content : $('#deleteDirBox')
		});
	});
	$('#deleteFileButton').on('click', function() {
		layer.open({
			type : 1,
			area : [ '300px', '240px' ],
			shadeClose : true, //点击遮罩关闭
			content : $('#deleteFileBox')
		});
	});
	$('#renameDirButton').on('click', function() {
		layer.open({
			type : 1,
			area : [ '300px', '240px' ],
			shadeClose : true, //点击遮罩关闭
			content : $('#renameDirBox')
		});
	});
	$('#renameFileButton').on('click', function() {
		layer.open({
			type : 1,
			area : [ '300px', '240px' ],
			shadeClose : true, //点击遮罩关闭
			content : $('#renameFileBox')
		});
	});
</script>
</html>

