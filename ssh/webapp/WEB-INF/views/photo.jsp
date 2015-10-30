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
<title>Photos</title>
<style type="text/css">
	.item{
		margin-top: 20px;
	}
</style>
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
			saved albums: ${albums}
			You don't have any album yet, <a href="#" onclick="showModel()">create</a> one now?
			<a href="/photo/upload.html">upload photo</a>
		</div>
		<div id="modal-overlay"> 
		    <div class="modal-data">  
		    	<div style="float: right;"><a onclick="showModel()" href="">close</a></div>  
		    	<s:form action="/file/createAlbum.html" theme="simple">
		    		<div style="width: 400px; border-bottom: 1px dotted gray; margin: 20px auto 0px auto">
		    			<b>Create Album</b>
		    		</div>
		    		<div class="item">
		    			Name: <s:textfield name="album.name" placeholder="album name"/>
		    		</div>
		    		<div class="item">
		    			Auth: <s:radio name="album.status" list="%{#{'1':'public','0':'private'}}"></s:radio>
		    		</div>
		    		<div class="item">
		    			<s:submit value="Create" cssClass="btn btn-success"></s:submit>
		    			<a href="#" class="btn btn-warning">Cancel</a>
		    		</div>
		    	</s:form>
		    </div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>