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
			
			<div id="a1" style="margin-left: auto; margin-right: auto; text-align: center;"></div>
			<script type="text/javascript" src="/js/ckplayer/ckplayer.js" charset="utf-8"></script>
			<script type="text/javascript">
			    var flashvars={
			        f:'http://movie.ks.js.cn/flv/other/1_0.mp4',
			        c:0,
			        loaded:'loadedHandler'
			    };
			    var video=['http://movie.ks.js.cn/flv/other/1_0.mp4->video/mp4'];
			    CKobject.embed('/js/ckplayer/ckplayer.swf','a1','ckplayer_a1','600','400',false,flashvars,video);
			</script>
			
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>