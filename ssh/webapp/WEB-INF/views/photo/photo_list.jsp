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
<link href="/js/jquery-Upload/css/default.css" rel="stylesheet">
<link href="/js/jquery-Upload/css/fileinput.css" rel="stylesheet">
<script type="text/javascript" src="/js/jquery-Upload/js/fileinput.js"></script>
<script type="text/javascript" src="/js/jquery-Upload/js/fileinput_locale_zh.js"></script>
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
			 <form enctype="multipart/form-data">
				<div class="form-group">
	                 <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">
	             </div>
             </form>
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
		
		$("#file-1").fileinput({
	        uploadUrl: '#', // you must set a valid URL here else you will get an error
	        allowedFileExtensions : ['jpg', 'png','gif'],
	        overwriteInitial: false,
	        maxFileSize: 1000,
	        maxFilesNum: 10,
	        //allowedFileTypes: ['image', 'video', 'flash'],
	        slugCallback: function(filename) {
	            return filename.replace('(', '_').replace(']', '_');
	        }
		});

	});
</script>
</html>