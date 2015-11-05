<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="s" uri="/struts-tags"%>
<link href="/css/homepage.css" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<s:include value="/view/context.jsp"/>
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
					<div class="row">
				<s:iterator value="#albums" var="album" status="s">
					  <div class="col-xs-6 col-md-2">
					    <a href="/photo/photos.html?albumId=${album.id}" class="thumbnail" style="text-align: center;">
					      <img src="/images/dc54564e9258d109e7edcc52d058ccbf6d814dc7.jpg" alt="${album.name}">
					      <b>${album.name}</b>
					    </a>
					  </div>
				</s:iterator>
					</div>
			</s:else>
			<div>
<!-- 			<a href="#" onclick="showModel()">create</a> one now. -->
			<a href="#" data-toggle="modal" data-target="#myModal">创建</a>新相册.
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
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width: 400px; text-align: center;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">
	        		       创建相册
	            </h4>
	         </div>
	           <s:form action="/file/createAlbum.html" theme="simple">
	         <div class="modal-body">
		    		<div class="item">
		    			名称: <s:textfield name="album.name" placeholder="相册名称"/>
		    		</div>
		    		<div class="item">
		    			<s:radio name="album.status" list="%{#{'1':'公开','0':'私有'}}"></s:radio>
		    		</div>
		    		<div class="item">
		    			描述：<s:textarea name="album.description" placeholder="相册描述" rows="5" cols="22"/>
		    		</div>
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	             <s:submit value="创建" cssClass="btn btn-info"></s:submit>
	         </div>
		    	</s:form>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>