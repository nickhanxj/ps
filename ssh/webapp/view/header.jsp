<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 禁止手机端缩放 -->
<meta name="viewport" content="width=device-width; initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
	#function{
		float: right; 
		margin-right: 100px;
		font-size: 14px; 
		font-family: monospace;
	}
	#menuRes{
 		display: none; 
		position: fixed;
		right: 0px;
		top: 49px;
		background-color: #103858;
 		width: 100%; 
		text-align: left;
		padding-left: 0px;
	}
	/* 	responsive */
	/*手机*/
	@media screen and (max-width:600px){
		#navItems{
			display: none;
		}
		#navItemsRes{
			display: inline;
		}
		#title{
			display: none;
		}
		#function{
 			padding-top: 15px;
			margin-right: 5px;
		}
		#logo{
			margin-top: 0px;
			margin-left: 5px;
		}
		.body-head-text{
			padding-top: 0px;
  			display: none;
		}
		.body-head-title{
			padding-top: 0px;
			font-size: xx-large;
			text-align: center;
		}
		#funNormal{
			display: none;
		}
	}
	/*平板*/
	@media screen and (min-width:600px) and (max-width:1140px){
		#navItems{
			display: none;
		}
		#navItemsRes{
			display: inline;
		}
		#logo{
			margin-left: 50px;
		}
		#function{
 			padding-top: 15px;
			margin-right: 50px;
		}
		#funForPhone{
			display: none;
		}
	}
	/*PC*/
	@media screen and (min-width:1140px){
		#navItemsRes{
			display: none;
		}
		#function{
 			padding-top: 15px;
			margin-right: 100px;
		}
		#funForPhone{
			display: none;
		}
	}
	
</style>
</head>
<body>
	<div class="head">
			<div class="header-vertically logo header-content" id="logo">
				<a href="/view/homepage.html" style="color: white;">
					<img alt="" src="/images/favicon_bak3.ico" width="30px;">
					<span id="title">
					Personal Space
					</span>
				</a>
			</div>
			<div style="margin-left: 50px;" id="navItems" class="header-vertically header-content">
				<a href="/blog/list.html" class="ele" id="blog"><span class="glyphicon glyphicon-paperclip" style="">&ensp;</span>博客</a>
				<a href="/file/album.html" class="ele" id="photo"><span class="glyphicon glyphicon-picture">&ensp;</span>相册</a>
				<a href="/resource/music.html" class="ele" id="music"><span class="glyphicon glyphicon-music">&ensp;</span>音乐</a>
				<a href="/resource/video.html" class="ele" id="video"><span class="glyphicon glyphicon-film">&ensp;</span>视频</a>
				<a href="/cost/list.html" class="ele" id="cost"><span class="glyphicon glyphicon-usd">&ensp;</span>消费记录</a>
			</div>
			<ul style="list-style-type: none;" id="menuRes">
				<li style="margin-top: 5px;"><a href="/blog/list.html" class="ele" id="blog"><span class="glyphicon glyphicon-paperclip" style="">&ensp;</span>博客</a></li>
				<li style="margin-top: 5px;"><a href="/file/album.html" class="ele" id="photo"><span class="glyphicon glyphicon-picture">&ensp;</span>相册</a></li>
				<li style="margin-top: 5px;"><a href="/resource/music.html" class="ele" id="music"><span class="glyphicon glyphicon-music">&ensp;</span>音乐</a></li>
				<li style="margin-top: 5px;"><a href="/resource/video.html" class="ele" id="video"><span class="glyphicon glyphicon-film">&ensp;</span>视频</a></li>
				<li style="margin-top: 5px; margin-bottom: 5px;"><a href="/cost/list.html" class="ele" id="cost"><span class="glyphicon glyphicon-usd">&ensp;</span>消费记录</a></li>
			</ul>
			<!-- 0 收起  1展开 -->
			<input value="0" type="hidden" id="menuStatus">
<!-- 			<div style="margin-left: 50px;" class="header-vertically header-content"> -->
<!-- 				<input style="display: block; width: 200px; height: 35px;" placeholder="search something"> -->
<%-- 					<s:form> --%>
<!-- 				         <input type="text" class="form-control search-header" placeholder="search..."> -->
<%-- 					</s:form> --%>
<!-- 			</div> -->
				<s:if test="%{#session.authUser == null}">
					<div id="function" class="header-content vertically" >
						<a href="#"><img alt="" src="/images/menu1.png" style="height: 25px;" onclick="showHideMenu();" id="navItemsRes"></a>
						<a href="/view/login.html" style="color: white; font-family: '微软雅黑';" title="sign in">&ensp;<b>登录</b></a>
						<a href="/view/register.html" title="register" style="color: white; font-family: '微软雅黑';">&ensp;<b>注册</b></a>
					</div>
				</s:if>
				<s:else>
					<div id="function" class="header-content" >
						<a href="#" style="margin-right: 30px;"><img alt="" src="/images/menu1.png" style="height: 25px;" onclick="showHideMenu();" id="navItemsRes"></a>
<%-- 						<a href="/user/personalCenter.html?id=${authUser.id}" title="Detail Infomation!" style="font-family: '微软雅黑'; color: white;"><img alt="" src="/upload/photo/photo.gif" height="36px" width="36px" style="">${authUser.userName}</a> --%>
						<span id="funNormal">
							<a href="/user/personalCenter.html?id=${authUser.id}" title="Detail Infomation!" style="font-family: '微软雅黑'; color: white;">${authUser.userName}</a>
							<b style="color: white;">|</b>
							<a href="/user/logout.html" title="Logout" style="color: white; font-family: '微软雅黑';"><span class="glyphicon"></span>退出</a>
						</span>
						<span id="funForPhone">
							<a href="/user/personalCenter.html?id=${authUser.id}" title="Detail Infomation!" style="font-family: '微软雅黑'; color: white;">
								<span class="glyphicon glyphicon-user"></span>
							</a>
							<b style="color: white;">|</b>
							<a href="/user/logout.html" title="Logout" style="color: white; font-family: '微软雅黑';"><span class="glyphicon glyphicon-off"></span></a>
						</span>
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
	
	function showHideMenu(){
		var status = $("#menuStatus").val();
		if(status == 0){
			$("#menuRes").slideDown(500);
			$("#menuStatus").val(1);
		}else if(status == 1){
			$("#menuRes").slideUp(500);
			$("#menuStatus").val(0);
		}
	}
</script>
</html>