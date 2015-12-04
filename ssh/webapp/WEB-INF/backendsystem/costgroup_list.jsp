<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%> 
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
		<h4 class="alert_success">删除消费组成功</h4>
		
		<article class="module width_3_quarter" style="width: 95%;">
		<header><h3 class="tabs_involved">所有用户</h3>
		</header>

		<div class="tab_container" >
			<div id="tab1" class="tab_content">
			<table class="tablesorter" cellspacing="0" > 
			<thead> 
				<tr> 
   					<th>组名</th>
					<th>组员个数</th>
					<th>组员</th>
					<th>备注</th>
					<th>创建时间</th>
					<th>操作</th>
				</tr> 
			</thead> 
			<tbody> 
			<c:forEach items="${groups}" var="group">
				<tr>
					<td>${group.groupName}</td>
					<td>${fn:length(group.members)}</td>
					<td>
						<c:forEach items="${group.members}" var="member">
							${member.user.trueName}&ensp;
						</c:forEach>
					</td>
					<td>${group.mark}</td>
					<td>${group.createTime}</td>
					<td>
						<a href="#">删除</a>
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