<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<!-- fileupload -->
<title>File Upload</title>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">${album.name}</h1>  
			<p class="body-head-text">
			${album.description}
			</p>
		</div>
		<div class="body-container" style="clear: both;">
			<s:form action="/file/upload.html" method="post" enctype="multipart/form-data" theme="simple">
				<s:hidden placeholder="File Name" name="fileName" id="fileName"/><br><br>
				<div style="border: 2px dashed #99D3F5; width: 300px; height:30px; float: left; text-align: center;" id="showFile">
				ssss
				</div>
				<div style="float: left; margin-left: 100px; margin-right: 10px;">
					<a href="javascript:;" class="file" >select file
		    			<input type="file" name="file" id="fileInput">
					</a>
				</div>
					<s:submit value="upload" cssClass="file"></s:submit>
				<br><br>
			</s:form>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
<script type="text/javascript">
	$(function(){
		$("#fileInput").bind("change",function(){
			var fileName = $("#fileInput").val();
			$("#fileName").val(fileName);
			$("#showFile").html(fileName);
			console.debug(fileName);
		});
	});
</script>
</html>