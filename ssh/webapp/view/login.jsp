<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp" />
 <%@taglib prefix="s" uri="/struts-tags"%> 
<title>登录</title>
</head>
<body background="/images/dc54564e9258d109e7edcc52d058ccbf6d814dc7.jpg">
	<div style="width: 30%; margin-left: auto; margin-right: auto; margin-top: 200px; border: 10px solid lightgray;background: white;">
	<div style="padding: 15px;">
	<s:form action="/userAction_login" theme="simple">
		<div class="form-group">
			<label for="name">用户名:</label> 
			<s:textfield name="user.userName"  cssClass="form-control" placeholder="请输入名称"></s:textfield>
		</div>
		<div class="form-group">
			<label for="password">密码:</label> 
			<s:password required="true" name="user.password" cssClass="form-control" placeholder="请输入密码"/>
		</div>
		<div align="center">
			<s:submit value="登录" cssClass="btn btn-default"/>
		</div>
		<div align="right" style="font-size: x-small;">
			<a href="/view/register.jsp">马上注册</a>
		</div>
		<div style="color: red;" align="center">
			<s:actionerror/>
		</div>
	</s:form>
	</div>
	</div>
</body>
</html>