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
<title><s:property value="#session.authUser.userName"/>的博客</title>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">Blogs</h1>  
			<p class="body-head-text">
			This is your articles center. Every blog records your emotion, happy or sad. It's a part of your life
			and wealth of you experience which only blongs to you.
			</p>
		</div>
		<div class="body-container">
			<nav class="navbar navbar-default" role="navigation">
			   <div>
			      <ul class="nav navbar-nav">
			      	<li  class="active"><a href="/blog/list.html"><b>我的博客</b></a></li>
			         <li><a href="/blog/writeBlogPage.html">写博客</a></li>
			         <li><a href="#">我的分享</a></li>
			         <li><a href="#">我的收藏</a></li>
			         <li><a href="#">联系作者</a></li>
			         <li><a href="#">管理中心</a></li>
			      </ul>
			   </div>
			</nav>
			<div class="alert alert-success" id="successMsg" style="display: none;">
			 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			${message}
			</div>
			<div class="panel panel-default">
			   <div class="panel-heading" style="background-color: lightblue;">
			      <h3 class="panel-title">
			         <b>Blogs:</b>
			      </h3>
			   </div>
			    <div class="panel-body">
					<s:iterator value="%{#blogList}" var="blog">
						<div class="panel panel-default">
						   <div class="panel-body" style="clear: both;">
						   	<div style="display: inline; float: left;"><a href="/view/blogdetail.html?blogId=${blog.id}"><b>${blog.title}</b></a></div>
						   	<div style="display: inline; float: right;">${blog.user.userName} / ${blog.publishDate}</div>
						   </div>
						</div>
					</s:iterator>
				</div>
			</div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
<script type="text/javascript">
	$(function(){
		var msg = $("#successMsg").html();
		if(msg.indexOf('success') > 0){
			$("#successMsg").slideDown(1000);
		}
	});
</script>
</html>