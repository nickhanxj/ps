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
<title>Write</title>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	   <div class="navbar-header">
	      <a class="navbar-brand" href="/resourceAction_blog">My Blogs</a>
	   </div>
	   <div>
	      <ul class="nav navbar-nav">
	         <li class="active"><a href="/blogAction_writeBlogPage">Write New</a></li>
	         <li><a href="#">My Share</a></li>
	         <li><a href="#">Contact Writer</a></li>
	         <li><a href="#">Manage Center</a></li>
	      </ul>
	   </div>
	</nav>
</body>
</html>