<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ERROR</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
</head>
<body>
	<h1 style="color: red;">Internal Error!</h1>
	<p>
		提示:${unauth}
	</p>
	<a href="/view/login.html" style="color: white; font-family: '微软雅黑';" title="sign in">&ensp;<b>登录</b></a>
						<a href="/view/register.html" title="register" style="color: white; font-family: '微软雅黑';">&ensp;<b>注册</b></a>
</body>
</html>