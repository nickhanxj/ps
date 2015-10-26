<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<script type="text/javascript" src="/js/tinymce/js/tinymce/tinymce.min.js"></script>
<script>
//         tinymce.init({selector:'textarea',language:'zh_CN'});
        tinymce.init({selector:'textarea', 
		        	plugins: [
		                "advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
		                "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		                "table contextmenu directionality emoticons template textcolor paste fullpage textcolor"
		            ],
		            height: 300,
		            style_formats: [
                        {title: 'Bold text', inline: 'b'},
                        {title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
                        {title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
                        {title: 'Example 1', inline: 'span', classes: 'example1'},
                        {title: 'Example 2', inline: 'span', classes: 'example2'},
                        {title: 'Table styles'},
                        {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
                    ]});
</script>
<%@taglib prefix="s" uri="/struts-tags"%>
<title>Write Blog</title>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">Blogs</h1>  
			<p class="body-head-text">
			This is your articles center. Every blog records your emotion, happy or sad. It's a part of your life
			and wealth of you experience which only blongs to you.
			</p>
		</div>
		<div class="body-container">
			<nav class="navbar navbar-default" role="navigation">
			   <div>
			      <ul class="nav navbar-nav">
			      	<li><a href="/blog/list.html">My Blogs</a></li>
			         <li class="active"><a href="/blog/writeBlogPage.html"><b>Write New</b></a></li>
			         <li><a href="#">My Share</a></li>
			         <li><a href="#">Contact Writer</a></li>
			         <li><a href="#">Manage Center</a></li>
			      </ul>
			   </div>
			</nav>
			<div class="panel panel-default" >
				<div class="panel-heading" style="background-color: lightblue;">
			      <h3 class="panel-title">
			        Write new blog:
			      </h3>
			   </div>
				<div class="panel-body">
					<s:form action="/blog/saveBlog.html" theme="simple">
					<b>Title:</b><s:textfield name="blog.title" cssClass="form-control"/>
					<b>Content:</b>
					 <s:textarea name="blog.content"></s:textarea>
					 <hr color="black">
					 <div class="panel panel-default">
					   <div class="panel-heading" style="background-color: lightgray;">
					      <h3 class="panel-title">
					         <b>Categories:</b>
					      </h3>
					   </div>
					   <div class="panel-body">
					   	<s:radio name="blog.category" list="%{#{'1':'Study','2':'Entainment','3':'Life'}}" value="1"></s:radio>
					   </div>
					</div>
					<div class="panel panel-default">
					   <div class="panel-heading" style="background-color: lightgray;">
					      <h3 class="panel-title">
					         <b>Publish Selections:</b>
					      </h3>
					   </div>
					   <div class="panel-body">
					   <s:radio name="blog.auth" list="%{#{'1':'Private','2':'Public'}}" value="1"></s:radio>
					   </div>
					</div>
					<div style="text-align: center;">
						<s:submit value="Publish" cssClass="btn btn-success"/>
						<s:submit value="Save as draft" cssClass="btn btn-info"/>
						<a href="/user/personalCenter.html?id=${authUser.id}" class="btn btn-warning">Cancel</a>
					</div>
					</s:form>
				</div>
			</div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>