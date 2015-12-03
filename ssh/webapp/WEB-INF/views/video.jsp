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
<title>Videos</title>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">Video</h1>  
			<p class="body-head-text">
			Interesting videos, inspiring videos, touching videos or other kinds of videos records a certain 
			moment of your life. 
			</p>
		</div>
		<div class="body-container">
		<div id="playercontainer"></div>
		<script type="text/javascript" src="/js/T5PlayerWebSDK/js/cyberplayer.min.js"></script>
		<script type="text/javascript">
			var player = cyberplayer("playercontainer").setup({
				flashplayer : "/js/T5PlayerWebSDK/player/cyberplayer.flash.swf",
				width : 680,
				height : 400,
				backcolor : "#FFFFFF",
				stretching : "uniform",
				file : "http://live.bestvcdn.net/live/ysrw/01.m3u8",
				image : "/js/T5PlayerWebSDK/images/20120611174842_wKcxR.jpeg",
				autoStart : false,
				repeat : "always",
				volume : 100,
				controls : "over",
				//ak 和 sk（sk 只需前 16 位）参数值需要开发者进行申请
// 				ak : ak,
// 				sk : sk
			});
</script> 
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>