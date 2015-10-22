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
				<a href="/view/homepage.jsp" style="color: white;">
					<img alt="" src="/images/p3.png" width="30px;">
					Personal Space
				</a>
			</div>
			<div style="margin-left: 100px;" class="header-vertically header-content">
				<a href="/resourceAction_blog" class="ele"><span class="glyphicon glyphicon-paperclip">&ensp;Blog</span></a>
				<a href="/resourceAction_photo" class="ele"><span class="glyphicon glyphicon-picture">&ensp;Photo</span></a>
				<a href="/resourceAction_music" class="ele"><span class="glyphicon glyphicon-music">&ensp;Music</span></a>
				<a href="/resourceAction_video" class="ele"><span class="glyphicon glyphicon-film">&ensp;Video</span></a>
			</div>
			<div style="float: right; margin-right: 100px;font-size: 14px; font-family: monospace;" class="header-content vertically" >
				<a href="/userAction_personalCenter?id=${authUser.id}" title="Detail Infomation!"><span class="glyphicon glyphicon-user" style="color: white;">&ensp;${authUser.userName}</span></a>&ensp;|
				<a href="/userAction_logout" title="Logout" style="color: white; "><span class="glyphicon glyphicon-off">&ensp;Logout</span></a>
			</div>
	</div>
<%-- 	<s:debug></s:debug> --%>
</body>
</html>