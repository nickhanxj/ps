<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
</head>
<body>
	<div class="head">
		<div class="header-vertically logo header-content">
			<a href="/view/homepage.jsp" style="color: white;">Personal Space</a>
		</div>
		<div class="header-vertically header-content" style="padding-left: 400px;">
			<a href="" class="ele"><span class="glyphicon glyphicon-paperclip">&ensp;Blog</span></a>
			<a href="" class="ele"><span class="glyphicon glyphicon-picture">&ensp;Photo</span></a>
			<a href="" class="ele"><span class="glyphicon glyphicon-music">&ensp;Music</span></a>
			<a href="" class="ele"><span class="glyphicon glyphicon-film">&ensp;Video</span></a>
		</div>
		<div align="right" class="header-content" style="padding-left: 200px;">
			<a href="/userAction_personalCenter?id=${authUser.id}" title="Detail Infomation!"><span class="glyphicon glyphicon-user" style="color: white;">&ensp;${authUser.userName}</span></a>&ensp;|
			<a href="/userAction_logout" title="Logout" style="color: white; font-size: x-small;"><span class="glyphicon glyphicon-off">&ensp;Logout</span></a>
		</div>
	</div>
<%-- 	<s:debug></s:debug> --%>
</body>
</html>