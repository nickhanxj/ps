<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
	<meta charset="utf-8"/>
	<title>PersonalSpace | BackendSystem</title>
</head>


<body>

	<s:include value="/WEB-INF/backendsystem/menu.jsp"></s:include>	
	<section id="main" class="column" style="height: 100%;">
		<h4 class="alert_success">冻结用户成功</h4>
		
		<article class="module width_3_quarter" style="width: 95%;">
		<header><h3 class="tabs_involved">所有用户</h3>
		</header>

		<div class="tab_container" >
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0" > 
			<thead> 
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
			</thead> 
			<tbody> 
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
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->
			
		</div><!-- end of .tab_container -->
		
		</article><!-- end of content manager article -->
		
<!-- 		<div class="clear"></div> -->
		
		<div class="spacer"></div>
	</section>


</body>

</html>