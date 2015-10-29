<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<title>Personal Space</title>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">Personal Space</h1>  
			<p class="body-head-text">
			Personal space is a place where you can place your personal files(videos, photos, musics etc) and manage your resources,
			and also you can take record your daily mood here and some interesting things of your daily life. It's a harbour
			of your heart and a time capsule of your experience. Just retain wonderful moment !
			</p>
		</div>
		<div class="body-container">
			<div style="width: 100%; border-left: 1px solid gray;border-right: 1px solid gray; margin-left: auto; margin-right: auto; overflow: hidden;" >
<!-- 				<div style="width: 30%; border: 1px dotted gray; height: 300px;"> -->
<!-- 					photos -->
<!-- 				</div> -->
				<div style="width: 20%; border: 5px solid #103858; margin-left: 75%; padding: 5px;">
					<div style="font-weight: bold;  border-bottom: 1px solid gray;" >Newest Blogs</div>
					<s:iterator value="%{#blogList}" var="blog">
						<div style="height: auto; border-bottom: 1px dashed gray; width:90%; margin-left: auto; margin-right: auto;">
						   <div class="panel-body" style="clear: both;">
						   	<div style="display: inline; float: left;"><a href="/view/blogdetail.html?blogId=${blog.id}"><b>${blog.title}</b></a></div>
						   	<div style="display: inline; float: right;">${blog.user.userName}</div>
						   	<br>
						   </div>
						 </div>
					</s:iterator>
				</div>
				<div style="width: 30%; border: 1px dotted gray;  float: left;">
					videos<br>
				</div>
				<div style="width: 20%; border: 5px solid #103858; margin-left: 75%; padding: 5px; float: left;">
					<div style="font-weight: bold;  border-bottom: 1px solid gray;" >Hot Blogs</div>
					<s:iterator value="%{#hotList}" var="blog">
						<div style="height: auto; border-bottom: 1px dashed gray; width:90%; margin-left: auto; margin-right: auto;">
						   <div class="panel-body" style="clear: both;">
						   	<div style="display: inline; float: left;"><a href="/view/blogdetail.html?blogId=${blog.id}"><b>${blog.title}</b></a></div>
						   	<div style="display: inline; float: right;">${blog.user.userName}</div>
						   	<br>
						   </div>
						 </div>
					</s:iterator>
				</div>
			</div>
<!-- 			<div class="panel panel-default" style="clear: both;"> -->
<!-- 				<div class="panel-body" style="clear: both;width: 60%;"> -->
<!-- 					<div class="panel panel-default"> -->
<!-- 					   <div class="panel-heading" style="background-color: lightblue;"> -->
<!-- 					      <h3 class="panel-title"> -->
<!-- 					         <b>New Blogs:</b> -->
<!-- 					      </h3> -->
<!-- 					   </div> -->
<%-- 						<s:iterator value="%{#blogList}" var="blog"> --%>
<!-- 							<div style="height: auto; border-bottom: 1px dashed gray; width: 80%; margin-left: auto; margin-right: auto;"> -->
<!-- 							   <div class="panel-body" style="clear: both;"> -->
<%-- 							   	<div style="display: inline; float: left;"><a href="/view/blogdetail.html?blogId=${blog.id}"><b>${blog.title}</b></a></div> --%>
<%-- 							   	<div style="display: inline; float: right;">${blog.user.userName} / ${blog.publishDate}</div> --%>
<!-- 							   	<br> -->
<!-- 							   </div> -->
<!-- 							 </div> -->
<%-- 						</s:iterator> --%>
<!-- 					</div> -->
<!-- 						<div id="myCarousel" class="carousel slide "> -->
<!-- 						   轮播（Carousel）指标 -->
<!-- 						   <ol class="carousel-indicators"> -->
<!-- 						      <li data-target="#myCarousel" data-slide-to="0" class="active"></li> -->
<!-- 						      <li data-target="#myCarousel" data-slide-to="1"></li> -->
<!-- 						      <li data-target="#myCarousel" data-slide-to="2"></li> -->
<!-- 						   </ol>    -->
<!-- 						   轮播（Carousel）项目 -->
<!-- 						   <div class="carousel-inner"> -->
<!-- 						      <div class="item active"> -->
<!-- 						         <img src="/images/upload/1.jpg" alt="First slide"> -->
<!-- 						      </div> -->
<!-- 						      <div class="item"> -->
<!-- 						         <img src="/images/upload/2.jpg" alt="Second slide"> -->
<!-- 						      </div> -->
<!-- 						      <div class="item"> -->
<!-- 						         <img src="/images/upload/3.jpg" alt="Third slide"> -->
<!-- 						      </div> -->
<!-- 						   </div> -->
<!-- 						   轮播（Carousel）导航 -->
<!-- 						   <a class="carousel-control left" href="#myCarousel"  -->
<!-- 						      data-slide="prev">&lsaquo;</a> -->
<!-- 						   <a class="carousel-control right" href="#myCarousel"  -->
<!-- 						      data-slide="next">&rsaquo;</a> -->
<!-- 						</div>  -->
<!-- 				</div> -->
<!-- 				<div class="panel-body" style="clear: both;width: 30%;"> -->
<!-- 					<div class="panel panel-default"> -->
<!-- 					   <div class="panel-heading" style="background-color: lightblue;"> -->
<!-- 					      <h3 class="panel-title"> -->
<!-- 					         <b>New Blogs:</b> -->
<!-- 					      </h3> -->
<!-- 					   </div> -->
<!-- 				   </div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>