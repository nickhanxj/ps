<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<title>后台管理-消费组</title>
<style type="text/css">
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
	.costgroup{
		margin-left: 15px;
		cursor: pointer;
		text-align: center;
		border: 2px solid gray;
		-webkit-border-radius: 15px;
		-moz-border-radius: 15px;
	}
	.costgroup:HOVER{
		background-color: #F0FFF0;
	}
	.costgroup span{
		font-weight: bolder;
	}
	.costgroup p{
		text-align: left;
	}
	.groupmember{
		padding-left: 25px;
	}
</style>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-container">
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
				<c:forEach items="${groups}" var="group">
					<div class="costgroup col-xs-2">
						<span>${group.groupName}</span><br><br>
						<p>消费人数：${fn:length(group.members)}</p>
						<p>消费人：</p>
						<c:forEach items="${group.members}" var="member">
							<p class="groupmember">${member.user.trueName}</p>
						</c:forEach>
					</div>
				</c:forEach>
				<div class="col-xs-2" style="margin-left: 10px; cursor: pointer;" title="添加消费组">
					<span class="glyphicon glyphicon-plus" onclick="showInput()"></span>
				</div>
				<div id="inputArea" class="costgroup col-xs-2" style="height: 170px; padding: 10px; display: none;">
					<s:form theme="simple" method="POST" action="/backend/addCostGroup.html">
						<s:textfield placeholder="请输入组名" name="group.groupName"/><br>
						<s:textfield placeholder="请输组员真实姓名，用','隔开" name="members"/><br>
						<s:textarea placeholder="备注" cols="19" name="group.mark"></s:textarea>
						<button type="submit" class="btn" style="margin-top: 10px;">保存</button>
						<a href="javascript:void(0)" class="btn" id="cancel" onclick="closeInput()" style="margin-top: 10px;">取消</a>
					</s:form>
				</div>
			</div>
		</div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
<script type="text/javascript">
	function showInput(){
			$("#inputArea").show(1000);
	}
	function closeInput(){
		$("#inputArea").hide(1000);
	}
</script>
</html>