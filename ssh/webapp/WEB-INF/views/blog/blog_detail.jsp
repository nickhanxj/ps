<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客 -${blog.title}</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<input type="hidden" value="${blog.id}" id="blogid">
	<input type="hidden" value="${blog.user.userName}" id="authorName">
	<div class="main-container"  style="background-image:url('/images/blog/u=1367135330,1476901792&fm=21&gp=0.jpg'); height: 100%;">
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
			      <h3 class="panel-title" style="color: #4A708B; font-size: x-large;font-family: fantasy;">
			         <b>${blog.title}</b>
			      </h3>
			   </div>
			   <div class="panel-body">
			  		${blog.content}
			   </div>
			   <hr>
			   <div class="panel panel-default">
			   	 <div class="panel-body" style="font-style: italic; font-weight: bold;">
			   		<div style="color: #36648B; margin-left: 100px; margin-right: 100px;" >
			   			<b>阅读(${blog.readedTimes})</b>
	   					<span style="color: black;font-weight:normal;margin-left: 200px;">posted @ ${blog.publishDate} by *${blog.user.userName}*</span>
	   					<c:if test="${not empty blog.lastEditDate}">
	   						<span style="color: black;font-weight:normal;">(last edit: ${blog.lastEditDate})</span>
	   					</c:if>
	   					
	   					<s:set value="%{#blog.user.id}" var="bloguser"/>
	   					<s:set value="%{#session.authUser.id}" var="sessionuser"/>
	   					<c:if test="${bloguser == sessionuser}">
		   					<a href="/blog/edit.html?id=${blog.id}" style="float: right; font-style: normal; color: red;" title="edit your blog--${blog.title}"><span class="glyphicon glyphicon-pencil"></span></a>
	   					</c:if>
			   		</div>
			   		<br>
			   		<div class="alert alert-success" id="successMsg" style="display: none;"></div>
			   		<div class="alert alert-danger" id="failedMsg" style="display: none;"></div>
			   		<div style="float:right;margin-right: 100px;">
						<span id="praise" onclick="doAction('1')" class="glyphicon glyphicon-thumbs-up" style="margin-left: 30px; cursor:pointer;" title="praise">(${blog.praisedTimes})</span>
						<span id="disSuggest" onclick="doAction('2')" class="glyphicon glyphicon-thumbs-down" style="margin-left: 30px; cursor:pointer;" title="disSuggest">(${blog.disSuggestTimes})</span>
<%-- 			   			<span id="share" onclick="doAction('share')" class="glyphicon glyphicon-share" style="margin-left: 30px; cursor:pointer;" title="share">(${blog.shredTimes})</span> --%>
			   			<span id="enshrine" onclick="doAction('enshrine')" style="margin-left: 30px; cursor:pointer;" class="glyphicon glyphicon-book" title="enshrine">(${blog.enshrineTimes})</span>
			   			<span style="font-family: 'Microsoft YaHei', arial, tahoma, 宋体, sans-serif;"><div id="ckepop"></span>  
			   			<br>
						<span class="jiathis_txt" style="font-style: normal;">分享到：</span>  
						<a class="jiathis_button_weixin" style="font-style: normal;">微信</a>   
						<a href="http://www.jiathis.com/share" style="font-style: normal;"  class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>  
						 </div>   
						<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1" charset="utf-8"></script>  
					</div>  
			   		</div>
			   	 </div>
		   	 </div>
			   <div class="panel panel-default">
			   	 <div class="panel-body" style="font-style: italic; font-weight: bold;">
				   分类:
				   <s:if test="%{#blog.category == 1}">
				   	<a href="#">学习</a>
				   </s:if>
				   <s:elseif test="%{#blog.category == 2}">
				   	<a href="#">娱乐</a>
				   </s:elseif>
				   <s:else>
				   	<a href="#">生活</a>
				   </s:else>
			   	 </div>
			   </div>
			   	 <div class="panel panel-default">
				   	 <div class="panel-body">
				   	 	<b>上一篇:&emsp;</b>
				   	 		<c:if test="${not empty preAndNext.pre}">
				   	 			<a href="/view/blogdetail.html?blogId=${preAndNext.pre.id}" style="text-decoration: underline; cursor: pointer;">
				   	 				${preAndNext.pre.title}
						   	 	</a>
				   	 		</c:if>
				   	 		<c:if test="${empty preAndNext.pre}">
				   	 			已经是第一篇！
				   	 		</c:if>
				   	 	<br><b>下一篇:&emsp;</b>
				   	 		<c:if test="${not empty preAndNext.next}">
			   	 				<a href="/view/blogdetail.html?blogId=${preAndNext.next.id}" style="text-decoration: underline; cursor: pointer;">
			   	 					${preAndNext.next.title}
					   	 		</a>
				   	 		</c:if>
				   	 		<c:if test="${empty preAndNext.next}">
				   	 			已经是最后一篇！
				   	 		</c:if>
				   	 </div>
			   	 </div>
			   	  <div class="panel panel-default">
				   	 <div class="panel-body" style="font-style: normal;">
				   	 	<b>评论:</b>
				   	 		<s:if test="%{#comments.size == 0}">
				   	 			<div class="comments">
				   	 				暂无评论!
				   	 			</div>
				   	 		</s:if>
				   	 		<s:else>
					   	 		<s:iterator value="%{#comments}" var="comment" status="status">
						   	 		<div class="comments">
						   	 			<div><a href="#">${comment.user.userName}</a>&emsp;${comment.pubTime}</div>
						   	 			<span style="margin-left: 50px;">${comment.content}</span>
						   	 			<br><span style="float:right;">#${status.count}</span>
						   	 		</div>
					   	 		</s:iterator>
				   	 		</s:else>
				   	 	<br>
				   	 	<b>发表我的评论:</b>
				   	 	<div style="padding-left: 100px;">
				   	 		<s:form theme="simple" action="/blog/saveCommnets.html?id=%{#blog.id}">
						   	 	<s:textarea cols="100" rows="5" name="comment.content"></s:textarea>
						   	 	<br>
						   	 	<s:if test="#session.authUser != null">
							   	 	<s:submit value="发表评论" cssClass="btn"></s:submit>
						   	 	</s:if>
						   	 	<s:else>
						   	 		<a href="/view/login.html">登录</a>后才能发表评论!
						   	 	</s:else>
				   	 		</s:form>
				   	 	</div>
				   	 </div>
			   	 </div>
			</div>
		</div>
	</div>
	<a href="javascript:void(0)" data-toggle="modal" data-target="#myModal" style="display: none;" id="modelLogin"></a>
	<div id="modal-overlay"> 
	    <div class="modal-data">  
	    	<div style="float: right;"><a onclick="showModel()" href="">关闭</a></div>  
	    	<s:form action="" theme="simple" id="ajaxLoginData">
				<input type="hidden" id="pendingUrl" name="pendingUrl"/>
				<input type="hidden" id="port" name="port"/>
				<input type="hidden" id="host" name="host"/>
				<input type="hidden" id="protocol" name="protocol"/>
				<div style="display:inline-block;  margin:20px auto 20px auto; border: 10px solid white;background: rgba(255,255,255);">
					<div style="font-size: 20px; font-family: cursive; font-weight: bold; border-bottom: 1px dotted gray; padding-bottom: 15px; padding-top: 10px;">登录</div>
					<div style="padding: 15px;">
						<div class="form-group" style="margin-top: 10px;">
							<s:textfield name="user.email"  cssClass="form-control user" placeholder="邮箱"></s:textfield>
						</div>
						<div class="form-group" style="margin-top: 40px;">
							<s:password required="true" name="user.password"  cssClass="form-control glyphicon lock" placeholder="密码"/>
						</div>
						<div style="color: red; font-size: x-small;margin-top: 30px;" align="center">
							必须先登录才能收藏!
						</div>
						<div align="center" style="margin-top: 30px;">
							<button  class="btn btn-default" onclick="ajaxLogin()">登录</button>
						</div>
						<div align="right" style="font-size: x-small; margin-top: 30px;">
							<a href="#">忘记密码</a>&ensp;|
							<a href="/view/register.html">注册</a>&ensp;|
<!-- 							<a href="#">Contact Us</a> -->
						</div>
					</div>
				</div>
			</s:form>
	    </div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width: 300px;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">
	        		      用户登录
	            </h4>
	         </div>
	         <div class="modal-body" style="text-align: center;">
		    		<s:form action="" theme="simple" id="ajaxLoginData">
				<input type="hidden" id="pendingUrl" name="pendingUrl"/>
				<input type="hidden" id="port" name="port"/>
				<input type="hidden" id="host" name="host"/>
				<input type="hidden" id="protocol" name="protocol"/>
				<div style="display:inline-block;  margin:20px auto 20px auto; border: 10px solid white;background: rgba(255,255,255);">
					<div style="padding: 15px;">
						<div class="form-group" style="margin-top: 10px;">
							<s:textfield name="user.email"  cssClass="form-control user" placeholder="邮箱"></s:textfield>
						</div>
						<div class="form-group" style="margin-top: 40px;">
							<s:password required="true" name="user.password"  cssClass="form-control glyphicon lock" placeholder="密码"/>
						</div>
						<div style="color: red; font-size: x-small;margin-top: 30px;" align="center">
							必须先登录才能收藏!
						</div>
						<div align="center" style="margin-top: 30px;">
							<button  class="btn btn-default" onclick="ajaxLogin()">登录</button>
						</div>
						<div align="right" style="font-size: x-small; margin-top: 30px;">
							<a href="#">忘记密码</a>&ensp;|
							<a href="/view/register.html">注册</a>&ensp;|
<!-- 							<a href="#">Contact Us</a> -->
						</div>
					</div>
				</div>
			</s:form>
	         </div>
<!-- 	         <div class="modal-footer"> -->
<!-- 	            <button type="button" class="btn btn-default"  -->
<!-- 	               data-dismiss="modal">关闭 -->
<!-- 	            </button> -->
<%-- 	             <s:submit value="创建" cssClass="btn btn-info"></s:submit> --%>
<!-- 	         </div> -->
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
<script type="text/javascript">
	function doAction(type){
		var blogId = $("#blogid").val();
		var authorName = $("#authorName").val();
		if(type == "1" || type == "2"){
			$.ajax({
				url:"/viewAction_praise?type="+type,
				data:{"blogId":blogId,"authorName":authorName},
				async: false,
				success:function(data){
					if(data.status == 1){
						if(type == "1"){
							$("#successMsg").html("点赞成功!");
							$("#praise").html("("+data.praisedTimes+")");
						}else if(type == "2"){
							$("#successMsg").html("反对成功!");
							$("#disSuggest").html("("+data.praisedTimes+")");
						}
						$('#successMsg').slideDown(500);
						setTimeout(function () { 
							$('#successMsg').slideUp(1000);
					    }, 2000);
					}else if(data.status == 2){
						$("#failedMsg").html(data.message);
						$('#failedMsg').slideDown(500);
						setTimeout(function () { 
							$('#failedMsg').slideUp(1000);
					    }, 2000);
					}
				}
			});
		}else if(type == "share"){
			
		}else if(type == "enshrine"){ 
			$.ajax({
				url:"/blogAction_enshrine",
				data:{"id":blogId,"authorName":authorName},
				async: true,
				success:function(data){
					if(data.status == 1){
						$("#successMsg").html("收藏成功!");
						$("#enshrine").html("("+data.enshrinedTimes+")");
						$('#successMsg').slideDown(500);
						setTimeout(function () { 
							$('#successMsg').slideUp(1000);
					    }, 2000);
					}else if(data.status == 2){
						$("#failedMsg").html(data.message);
						$('#failedMsg').slideDown(500);
						setTimeout(function () { 
							$('#failedMsg').slideUp(1000);
					    }, 2000);
					}else if(data.indexOf("登录") > 0){
// 						$("#failedMsg").html("Please sign in!<a href='/view/login.html' style='color: green; text-decoration: underline;' title='sign in'>&ensp;Sign in now</a><span style='float:right;font-style: normal; font-weight: normal; cursor: pointer;' title='close' class='glyphicon glyphicon-chevron-up' onclick='closeErrorMsg()'></span>");
// 						$('#failedMsg').slideDown(500);
						$("#modelLogin").click();
					}
				}
			});
		}
	}
	
	function closeErrorMsg(){
		$('#failedMsg').slideUp(1000);
	}
	$(function(){
		$("#pendingUrl").val(window.location.href);
	});
	
	function ajaxLogin(){
		$.ajax({
			url:"/user/ajaxLogin.html",
			data:$("#ajaxLoginData").serialize(),
			async: false,
			success:function(data){
				if(data.status == 2){
					alert(data.message);
				}
			}
		});
		return false;
	}
</script>
</html>