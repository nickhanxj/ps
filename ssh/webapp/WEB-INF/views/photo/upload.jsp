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
<title>File Upload</title>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">Photo</h1>  
			<p class="body-head-text">
			Retain every wonderful moment with camera. Persist each piece of time.
			</p>
		</div>
		<div class="body-container">
			<s:form action="/file/upload.html" method="post" enctype="multipart/form-data" theme="simple">
				<s:textfield placeholder="File Name" name="fileName"/>
				<s:file name="file"></s:file>
				<s:submit value="upload"></s:submit>
			</s:form>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>