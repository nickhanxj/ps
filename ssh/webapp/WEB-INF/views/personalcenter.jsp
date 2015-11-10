<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心-基本信息</title>
<jsp:include page="/view/context.jsp" />
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
	.tabHead{
		font-weight: bold;
		text-align: right;
	}
</style>
</head>
<body>
	<s:include value="/view/header.jsp" />
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">Personal Information Center</h1>
			<p class="body-head-text">You can check or edit your personal
				information here!</p>
		</div>
		<div class="body-container" >
			<div style="border: 1px solid silver; width: 100%; clear: both;">
				<ul class="nav nav-tabs">
				  <li class="active" role="presentation" onclick="activeItem(this)"><a href="/user/personalCenter.html?id=${authUser.id}">基本信息</a></li>
				  <li role="presentation" onclick="activeItem(this)"><a href="/user/editProfile.html?id=${authUser.id}">修改资料</a></li>
				  <li role="presentation" onclick="activeItem(this)"><a href="#">联系方式</a></li>
				</ul>
				<div style="text-align: center; padding-top: 5px;">
					<table class="table table-condensed" style="width: 50%; margin-left: auto; margin-right: auto;">
						<tr>
							<td class="tabHead">用户名:</td>
							<td>${selectedUser.userName}</td>
						</tr>
						<tr>
							<td class="tabHead">真实姓名:</td>
							<td>${selectedUser.trueName}</td>
						</tr>
						<tr>
							<td class="tabHead">邮箱:</td>
							<td>${selectedUser.email}</td>
						</tr>
						<tr>
							<td class="tabHead">电话:</td>
							<td>${selectedUser.phoneNumber}</td>
						</tr>
						<tr>
							<td class="tabHead">性别:</td>
							<td>
								<s:if test="#selectedUser.sex == 1">
									男
								</s:if>
								<s:else>
									女
								</s:else>
							</td>
						</tr>
						<tr>
							<td class="tabHead">帐号状态:</td>
							<td>
								<s:if test="#selectedUser.status == 1">
									正常
								</s:if>
								<s:else>
									<font color="red">异常:</font>
								</s:else>
							</td>
						</tr>
						<tr>
							<td class="tabHead">注册时间:</td>
							<td>${selectedUser.registerDate}</td>
						</tr>
						<tr>
							<td class="tabHead">本次登陆时间:</td>
							<td>${selectedUser.curLoginDate}</td>
						</tr>
						<tr>
							<td class="tabHead">本次登录ip:</td>
							<td>${selectedUser.curLoginIp}</td>
						</tr>
						<tr>
							<td class="tabHead">上次登录时间:</td>
							<td>${selectedUser.lastLoginDate}</td>
						</tr>
						<tr>
							<td class="tabHead">上次登录ip:</td>
							<td>${selectedUser.lastLoginIp}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<s:include value="/view/footer.jsp" />
</body>
<script type="text/javascript">
	function activeItem(t){
		var lis = $("li");
		for(var i = 0; i < lis.length; i++){
			$(lis[i]).removeClass("active");
		}
		$(t).addClass("active");
	}
</script>
</html>