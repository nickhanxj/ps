<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Blog [ ${blog.title} ]</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container"  style="background-image:url('/images/blog/blog_bg2.jpg'); height: 100%;">
		<div class="body-head">
			<h1 class="body-head-title">Blogs</h1>  
			<p class="body-head-text">
			This is your articles center. Every blog records your emotion, happy or sad. It's a part of your life
			and wealth of you experience which only blongs to you.
			</p>
		</div>
		<div class="body-container">
			<div class="panel panel-default">
			   <div class="panel-heading" style="text-align: center; background-color: lightgray;">
			      <h3 class="panel-title" style="color: blue;">
			         <b>${blog.title}</b>
			      </h3>
			   </div>
			   <div class="panel-body">
			  		${blog.content}
			   </div>
			   <hr>
			   <div class="panel panel-default">
			   	 <div class="panel-body" style="font-style: italic; font-weight: bold;">
				   Category:
				   <s:if test="%{#blog.category == 1}">
				   	<a href="#">STUDY</a>
				   </s:if>
				   <s:elseif test="%{#blog.category == 2}">
				   	<a href="#">ENTERTAINMENT</a>
				   </s:elseif>
				   <s:else>
				   	<a href="#">LIFE</a>
				   </s:else>
			   	 </div>
			   </div>
			   <div style="text-align: center; border: 1px dotted gray; margin-left: 100px;margin-right: 100px; height: 90px; padding: 15px; margin-bottom: 20px;">
			   		<div>
			   			<a href="?id=${blog.id}" class="btn btn-small btn-info">Suggest</a>
			   			<a href="?id=${blog.id}" class="btn btn-small btn-info">Share</a>
			   			<a href="?id=${blog.id}" class="btn btn-small btn-info">Enshrine</a>
			   		</div>
			   		<br>
			   		<div style="float: right;">
						<span class="glyphicon glyphicon-thumbs-up" style="cursor:pointer;">${blog.praisedTimes}</span>
						<span class="glyphicon glyphicon-thumbs-down" style="margin-left: 30px; cursor:pointer;">${blog.disSuggestTimes}</span>
			   		</div>
			   </div>
				<div class="panel panel-default">
				   	 <div class="panel-body" style="font-style: italic; font-weight: bold;">
				   	 	Statistics:
				   		<div style="color: green; margin-left: 100px;" >
				   			<p><b>Readed Times: ${blog.readedTimes}</b></p>
			   				<p><b>Shared Times: ${blog.shredTimes}</b></p>
		   					<p><b>Suggested Times: ${blog.suggestedTimes}</b></p>
				   		</div>
				   	 </div>
			   	 </div>
			   	 <div class="panel panel-default">
				   	 <div class="panel-body" style="font-style: normal;">
				   	 	<b>&lt;&lt;Previous:</b>&emsp;<a style="text-decoration: underline; cursor: pointer;">TEST PICTURE</a>
				   	 </div>
			   	 </div>
			   	  <div class="panel panel-default">
				   	 <div class="panel-body" style="font-style: normal;">
				   	 	<b>Comments:</b>
				   	 		<div class="comments">
				   	 			<div><a href="#">Nick</a>&emsp;2015-02-15 12:14:22</div>
				   	 			<span style="margin-left: 50px;">Greate!</span>
				   	 		</div>
				   	 		<div class="comments">
				   	 			<div><a href="#">Admin</a>&emsp;2015-02-15 12:14:22</div>
				   	 			<span style="margin-left: 50px;">learned</span>
				   	 		</div>
				   	 	<br>
				   	 	<b>Post my comments:</b>
				   	 	<div style="padding-left: 100px;">
				   	 		<s:form theme="simple">
						   	 	<s:textarea cols="100" rows="5"></s:textarea>
						   	 	<br>
						   	 	<s:submit value="submit" cssClass="btn"></s:submit>
				   	 		</s:form>
				   	 	</div>
				   	 </div>
			   	 </div>
			</div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>