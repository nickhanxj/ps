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
<title>Sign In</title>
</head>
<body style="clear: both;">
	<span style="display:none;">登录</span>
	<img alt="" src="/images/login-left.jpg" class="back-img">
	<s:form action="/user/login.html" theme="simple">
		<input type="hidden" id="pendingUrl" name="pendingUrl"/>
		<input type="hidden" id="port" name="port"/>
		<input type="hidden" id="host" name="host"/>
		<input type="hidden" id="protocol" name="protocol"/>
		<div style="display:inline-block; float:right; width: 20%; height:400px; margin-right: 200px;  margin-top: 150px; border: 10px solid white;background: rgba(255,255,255, 0);">
			<div style="padding: 15px;">
				<div style="font-size: 20px; font-family: cursive; font-weight: bold; border-bottom: 1px dotted gray; padding-bottom: 15px; padding-top: 10px;">Sign In</div>
				<div class="form-group" style="margin-top: 30px;">
					<s:textfield name="user.userName"  cssClass="form-control user" placeholder="account"></s:textfield>
				</div>
				<div class="form-group" style="margin-top: 40px;">
					<s:password required="true" name="user.password"  cssClass="form-control glyphicon lock" placeholder="password"/>
				</div>
				<div style="color: red; font-size: x-small;margin-top: 30px;" align="center">
					<s:actionerror/>
					${error}
				</div>
				<div align="center" style="margin-top: 30px;">
					<s:submit value="Safe Sign In" cssClass="btn btn-default"/>
				</div>
				<div align="right" style="font-size: x-small; margin-top: 30px;">
					<a href="#">Forget Password</a>&ensp;|
					<a href="/view/register.html">Register</a>&ensp;|
					<a href="#">Contact Us</a>
				</div>
			</div>
		</div>
	</s:form>
</body>
<script type="text/javascript">
	$(function(){
		$("#pendingUrl").val(window.location.href);
	});
</script>
</html>