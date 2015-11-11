<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp" />
<link href="/css/homepage.css" rel="stylesheet">
 <%@taglib prefix="s" uri="/struts-tags"%> 
<link rel="stylesheet" type="text/css" href="/css/default.css">
<link rel="stylesheet" type="text/css" href="/css/styles.css">
<style type="text/css">
	/*手机*/
	@media screen and (max-width:600px){
		#logoImg{
			width: 40px;
		}
		#loginDiv{
			margin-left: auto; 
			margin-right: auto;
			margin-top: 100px;
			width: 80%; 
		}
	}
	/*平板*/
	@media screen and (min-width:600px) and (max-width:960px){
		#loginDiv{
			margin-left: auto; 
			margin-right: auto;
			margin-top: 60px;
			width: 80%; 
		}
	}
	/*PC*/
	@media screen and (min-width:960px){
		#loginDiv{
			margin-left: auto; 
			margin-right: auto; 
			width: 40%; 
			height:400px;  
			margin-top: 150px; 
			background: rgba(255,255,255, 1); 
			-webkit-border-radius: 15px;
			-moz-border-radius: 15px;
		}
	}
</style>
<title>帐号登录</title>
</head>
<body >
	<s:include value="/view/header.jsp"/>
	<span style="display:none;">登录</span>
<!-- 	<img alt="" src="/images/backImg.jpg" class="back-img"> -->
	<s:form action="/user/login.html" theme="simple" method="post">
		<s:hidden id="pendingUrl" name="pendingUrl"/>
		<div id="loginDiv">
			<div style="padding: 15px;">
				<div style="width: 100%; text-align: center;"><img alt="" src="/images/favicon.ico" id="logoImg"> </div>
				<div style="width: 100%; text-align: center;font-size: 20px; font-family: cursive; font-weight: bold;  padding-bottom: 15px; padding-top: 10px;">登录</div>
<!-- 				<div class="form-group" style="margin-top: 30px;"> -->
<%-- 					<s:textfield name="user.email"  cssClass="form-control user" placeholder="邮箱"></s:textfield> --%>
<!-- 				</div> -->
<!-- 				<div class="form-group" style="margin-top: 40px;"> -->
<%-- 					<s:password required="true" name="user.password"  cssClass="form-control lock" placeholder="密码"/> --%>
<!-- 				</div> -->
				<div class="form-group">
				    <input required="required" name="email" class="form-control"/>
				    <label class="form-label">邮　箱    </label>
				  </div>
				  <div class="form-group">
				    <input type="password" name="password" required="required" class="form-control"/>
				    <label class="form-label">密　码</label>
				   </div>
				<div style="color: red; font-size: x-small;margin-top: 30px;" align="center">
					<s:actionerror/>
					${error}
				</div>
				<div align="center" style="margin-top: 30px;">
					<s:submit value="安全登录" cssClass="btn btn-default"/>
				</div>
				<div align="right" style="font-size: x-small; margin-top: 30px;">
					<a href="/view/forgetPasswd.jsp">忘记密码</a>&ensp;|
					<a href="/view/register.html">注册</a>&ensp;|
					<a href="mailto:471026023@qq.com?subject=ccc&body=xxx yyy">联系我们</a>
				</div>
			</div>
		</div>
	</s:form>
</body>
<script type="text/javascript">
	$(function(){
		$("#pendingUrl").val(window.location.href);
		console.debug($("#pendingUrl"));
	});
</script>
</html>