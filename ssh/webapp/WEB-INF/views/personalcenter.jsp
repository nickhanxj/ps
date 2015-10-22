<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Information Center</title>
<jsp:include page="/view/context.jsp" />
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
	.tabHead{
		font-weight: bold;
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
				  <li class="active" role="presentation"><a href="#">Basic Info</a></li>
				  <li role="presentation"><a href="#">My Blogs</a></li>
				  <li role="presentation"><a href="#">My Photos</a></li>
				  <li role="presentation"><a href="#">My Musics</a></li>
				  <li role="presentation"><a href="#">My Videos</a></li>
				</ul>
				<div style="text-align: center; padding-top: 5px;">
					<table class="table table-condensed" style="width: 50%; margin-left: auto; margin-right: auto;">
						<tr>
							<td class="tabHead">Name</td>
							<td>${selectedUser.userName}</td>
						</tr>
						<tr>
							<td class="tabHead">Email</td>
							<td>${selectedUser.email}</td>
						</tr>
						<tr>
							<td class="tabHead">PhoneNumber</td>
							<td>${selectedUser.phoneNumber}</td>
						</tr>
						<tr>
							<td class="tabHead">Sex</td>
							<td>
								<s:if test="#selectedUser.sex == 1">
									Male
								</s:if>
								<s:else>
									Female
								</s:else>
							</td>
						</tr>
						<tr>
							<td class="tabHead">Status</td>
							<td>
								<s:if test="#selectedUser.status == 1">
									Normal
								</s:if>
								<s:else>
									<font color="red">Abnormal</font>
								</s:else>
							</td>
						</tr>
						<tr>
							<td class="tabHead">RegisterDate</td>
							<td>${selectedUser.registerDate}</td>
						</tr>
						<tr>
							<td class="tabHead">CurrentLoginDate</td>
							<td>${selectedUser.curLoginDate}</td>
						</tr>
						<tr>
							<td class="tabHead">CurrentLoginIp</td>
							<td>${selectedUser.curLoginIp}</td>
						</tr>
						<tr>
							<td class="tabHead">LastLoginDate</td>
							<td>${selectedUser.lastLoginDate}</td>
						</tr>
						<tr>
							<td class="tabHead">LastLoginIp</td>
							<td>${selectedUser.lastLoginIp}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<s:include value="/view/footer.jsp" />
</body>
</html>