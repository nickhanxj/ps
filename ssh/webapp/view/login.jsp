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
<title>登录</title>
</head>
<body style="clear: both;">
	<img alt="" src="/images/login-left.jpg" class="back-img">
	<s:form action="/userAction_login" theme="simple">
		<div style="display:inline-block; float:right; width: 20%; height:400px; margin-right: 200px;  margin-top: 150px; border: 10px solid white;background: rgba(255,255,255, 0.5);">
			<div style="padding: 15px;">
				<div class="form-group" style="margin-top: 30px;">
					<s:textfield name="user.userName"  cssClass="form-control user" placeholder="请输入用户名"></s:textfield>
				</div>
				<div class="form-group" style="margin-top: 40px;">
					<s:password required="true" name="user.password"  cssClass="form-control glyphicon lock" placeholder="请输入密码"/>
				</div>
				<div align="center" style="margin-top: 100px;">
					<s:submit value="登录" cssClass="btn btn-default"/>
				</div>
				<div align="right" style="font-size: x-small;">
					<a href="/view/register.jsp">马上注册</a>
				</div>
				<div style="color: red;" align="center">
					<s:actionerror/>
				</div>
			</div>
		</div>
	</s:form>
</body>
</html>