<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<h1 class="body-head-title">Album</h1>  
			<p class="body-head-text">
			Retain every wonderful moment with camera. Persist each piece of time.
			</p>
		</div>
		<div class="body-container">
			<s:if test="%{#albums.size == 0}">
				saved albums: 
				You don't have any album yet, <a href="#" onclick="showModel()">create</a> one now?
			</s:if>
			<s:else>
				<table>
				<s:iterator value="#albums" var="album" status="s">
					<c:if test="${s.count % 5 == 0}">
						<tr>
					</c:if>
					<td>
					<a href="/photo/photos.html?albumId=${album.id}" class="album">
						<img  class="album-img" alt="" src="/images/dc54564e9258d109e7edcc52d058ccbf6d814dc7.jpg">
						<div class="album-name">${album.name}</div>
					</a>
					</td>
					<c:if test="${s.count % 3 == 0}">
						</tr>
					</c:if>
				</s:iterator>
				</table>
			</s:else>
			<div>
			<a href="#" onclick="showModel()">create</a> one now.
			</div>
<!-- 			<a href="/photo/upload.html">upload photo</a> -->
		</div>
		<div id="modal-overlay"> 
		    <div class="modal-data">  
		    	<div style="float: right;"><a onclick="showModel()" href="">close</a></div>  
		    	<s:form action="/file/createAlbum.html" theme="simple">
		    		<div style="width: 400px; border-bottom: 1px dotted gray; margin: 20px auto 0px auto">
		    			<b>创建相册</b>
		    		</div>
		    		<div class="item">
		    			名称: <s:textfield name="album.name" placeholder="相册名称"/>
		    		</div>
		    		<div class="item">
		    			权限: <s:radio name="album.status" list="%{#{'1':'公开','0':'私有'}}"></s:radio>
		    		</div>
		    		<div class="item">
		    			描述：<s:textfield name="album.description" placeholder="相册描述"/>
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