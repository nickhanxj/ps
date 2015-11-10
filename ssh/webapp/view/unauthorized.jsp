<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>授权错误</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
</head>
<body>
	<h1 style="color: red; width: 100%; text-align: center;">
		<img alt="授权错误" src="/images/unauth.gif">
	</h1>
	<h1 style="color: red; width: 100%; text-align: center;">该操作只对指定用户授权！</h1>
	<div style="width: 100%; text-align: center;">
		<a href="/view/login.html" style=" font-family: '微软雅黑';" title="sign in">&ensp;<b>登录</b></a>
		<a href="/view/register.html" title="register" style=" font-family: '微软雅黑';">&ensp;<b>注册</b></a>
	</div>
</body>
</html>