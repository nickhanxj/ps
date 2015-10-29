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
				<a href="/view/homepage.html" style="color: white;">
					<img alt="" src="/images/p3.png" width="30px;">
					Personal Space
				</a>
			</div>
			<div style="margin-left: 100px;" id="navItems" class="header-vertically header-content">
				<a href="/blog/list.html" class="ele" id="blog"><span class="glyphicon glyphicon-paperclip">&ensp;Blog</span></a>
				<a href="/resource/photo.html" class="ele" id="photo"><span class="glyphicon glyphicon-picture">&ensp;Photo</span></a>
				<a href="/resource/music.html" class="ele" id="music"><span class="glyphicon glyphicon-music">&ensp;Music</span></a>
				<a href="/resource/video.html" class="ele" id="video"><span class="glyphicon glyphicon-film">&ensp;Video</span></a>
			</div>
<!-- 			<div style="margin-left: 50px;" class="header-vertically header-content"> -->
<!-- 				<input style="display: block; width: 200px; height: 35px;" placeholder="search something"> -->
<%-- 					<s:form> --%>
<!-- 				         <input type="text" class="form-control search-header" placeholder="search..."> -->
<%-- 					</s:form> --%>
<!-- 			</div> -->
			<div style="float: right; margin-right: 100px;font-size: 14px; font-family: monospace;" class="header-content vertically" >
				<s:if test="%{#session.authUser == null}">
					<a href="/view/login.html" style="color: white;" title="sign in">&ensp;<b>Sign In</b></a>&ensp;|
					<a href="/view/register.html" title="register" style="color: white; ">&ensp;<b>Register</b></a>
				</s:if>
				<s:else>
					<a href="/user/personalCenter.html?id=${authUser.id}" title="Detail Infomation!"><span class="glyphicon glyphicon-user" style="color: white;">&ensp;${authUser.userName}</span></a>&ensp;
					<b style="color: white;">|</b>&ensp;
					<a href="/user/logout.html" title="Logout" style="color: white; "><span class="glyphicon glyphicon-off">&ensp;Logout</span></a>
				</s:else>
			</div>
	</div>
<%-- 	<s:debug></s:debug> --%>
</body>
<script type="text/javascript">
	$(function(){
		var curUrl = window.location.href;
		if(curUrl.indexOf("blog") > 0){
			$("#blog").addClass("ac");
		}else if(curUrl.indexOf("photo") > 0){
			$("#photo").addClass("ac");
		}else if(curUrl.indexOf("music") > 0){
			$("#music").addClass("ac");
		}else if(curUrl.indexOf("video") > 0){
			$("#video").addClass("ac");
		}
	});
</script>
</html>