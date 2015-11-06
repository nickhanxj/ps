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
					<img alt="" src="/images/favicon_bak3.ico" width="30px;">
					Private Space
				</a>
			</div>
			<div style="margin-left: 100px;" id="navItems" class="header-vertically header-content">
				<a href="/blog/list.html" class="ele" id="blog"><span class="glyphicon glyphicon-paperclip" style="">&ensp;</span>博客</a>
				<a href="/file/album.html" class="ele" id="photo"><span class="glyphicon glyphicon-picture">&ensp;</span>相册</a>
				<a href="/resource/music.html" class="ele" id="music"><span class="glyphicon glyphicon-music">&ensp;</span>音乐</a>
				<a href="/resource/video.html" class="ele" id="video"><span class="glyphicon glyphicon-film">&ensp;</span>视频</a>
				<a href="/cost/list.html" class="ele" id="cost"><span class="glyphicon glyphicon-film">&ensp;</span>消费记录</a>
			</div>
<!-- 			<div style="margin-left: 50px;" class="header-vertically header-content"> -->
<!-- 				<input style="display: block; width: 200px; height: 35px;" placeholder="search something"> -->
<%-- 					<s:form> --%>
<!-- 				         <input type="text" class="form-control search-header" placeholder="search..."> -->
<%-- 					</s:form> --%>
<!-- 			</div> -->
				<s:if test="%{#session.authUser == null}">
					<div style="float: right; margin-right: 100px;font-size: 14px; font-family: monospace;" class="header-content vertically" >
						<a href="/view/login.html" style="color: white; font-family: '微软雅黑';" title="sign in">&ensp;<b>登录</b></a>
						<a href="/view/register.html" title="register" style="color: white; font-family: '微软雅黑';">&ensp;<b>注册</b></a>
					</div>
				</s:if>
				<s:else>
					<div style="float: right; margin: 6px 100px 6px;font-size: 14px; font-family: monospace;" class="header-content" >
						<a href="/user/personalCenter.html?id=${authUser.id}" title="Detail Infomation!" style="font-family: '微软雅黑'; color: white;"><img alt="" src="/upload/photo/photo.gif" height="36px" width="36px" style="">${authUser.userName}</a>
						<b style="color: white;">|</b>&ensp;
						<a href="/user/logout.html" title="Logout" style="color: white; font-family: '微软雅黑';"><span class="glyphicon"></span>退出</a>
					</div>
				</s:else>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var curUrl = window.location.href;
		if(curUrl.indexOf("blog") > 0){
			$("#blog").addClass("ac");
		}else if(curUrl.indexOf("photo") > 0 || curUrl.indexOf("album") > 0){
			$("#photo").addClass("ac");
		}else if(curUrl.indexOf("music") > 0){
			$("#music").addClass("ac");
		}else if(curUrl.indexOf("video") > 0){
			$("#video").addClass("ac");
		}else if(curUrl.indexOf("cost") > 0){
			$("#cost").addClass("ac");
		}
	});
</script>
</html>