<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<title>后台管理</title>
<style type="text/css">
	table {
		width: 100%;
		border: 1px solid lightgray;
	}
	table tr{
		padding: 5px;
		margin-top: 5px;
	}
	table th{
		text-align: center;
		border: 1px solid lightgray;
		padding:5px;
/* 		background-color: lightblue; */
	}
	table td{
		text-align: center;
		padding:10px;
		border: 1px solid lightgray;
	}
	.menu{
		list-style-type: none;
	}
	.menu li{
		height: 40px;
		margin: 10px;
		text-align:center;
		padding-top:9px;
		font-weight: bold;
		cursor: pointer;
		background-color: lightblue;
	}
	
	.menu li>a:HOVER{
		text-decoration: none;
	}
	
	.menu li:HOVER{
		height: 40px;
		margin: 10px;
		text-align:center;
		padding-top:9px;
		font-weight: bold;
		cursor: pointer;
		color: white;
		background-color: #103858;
	}
</style>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-container" style="border: 5px solid #F2F2F2; margin-top:130px;">
			<div class="col-xs-2" style="margin-top: 50px; border-right: 2px dashed #CDC5BF;">
				<ul class="menu">
					<a href="/backend/backend.html"><li>用户管理</li></a>
					<a href="/backend/costgroup.html"><li>消费组</li></a>
					<a href="#"><li>博客管理</li></a>
					<a href="#"><li>音乐管理</li></a>
					<a href="#"><li>视频管理</li></a>
				</ul>
			</div>
			<div class="col-xs-6" style="width: 80%; margin-top: 80px;">
			<table>
				<tr>
					<th>用户名</th>
					<th>真实姓名</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>注册日期</th>
					<th>用户类型</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${users}" var="user">
					<tr>
						<td>${user.userName}</td>
						<td>${user.trueName}</td>
						<td>
							<c:if test="${user.sex == 1}">
								男
							</c:if>
							<c:if test="${user.sex == 0}">
								女
							</c:if>
						</td>
						<td>${user.email}</td>
						<td>${user.registerDate}</td>
						<td>
							<c:if test="${user.type == 1}">
								普通用户
							</c:if>
							<c:if test="${user.type == 0}">
								管理员
							</c:if>
						</td>
						<td>
							<c:if test="${user.status == 1}">
								正常
							</c:if>
							<c:if test="${user.status == 0}">
								冻结
							</c:if>
						</td>
						<td>
							<c:if test="${user.status == 1}">
								<a href="#">冻结</a>
							</c:if>
							<c:if test="${user.status == 0}">
								<a href="#">恢复</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>