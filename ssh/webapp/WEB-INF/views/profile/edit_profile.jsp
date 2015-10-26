<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Personal Information</title>
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
				  <li role="presentation" onclick="activeItem(this)"><a href="/user/personalCenter.html?id=${authUser.id}">Basic Info</a></li>
				  <li class="active" role="presentation" onclick="activeItem(this)"><a href="/user/editProfile.html?id=${authUser.id}">Edit Profile</a></li>
				  <li role="presentation" onclick="activeItem(this)"><a href="#">Contact Method</a></li>
				</ul>
				<div style="text-align: left; padding-top: 5px;">
					<s:form theme="simple" action="/userAction_updateUser">
						<s:hidden name="id" value="%{#selectedUser.id}"/>
					<table class="table table-condensed" style="width: 50%; margin-left: auto; margin-right: auto;">
						<tr>
							<td class="tabHead">Name:</td>
							<td><s:textfield name="user.userName" value="%{#selectedUser.userName}" cssClass="form-control edit-input"/></td>
						</tr>
						<tr>
							<td class="tabHead">Email:</td>
							<td><s:textfield name="user.email" value="%{#selectedUser.email}" cssClass="form-control edit-input"/></td>
						</tr>
						<tr>
							<td class="tabHead">PhoneNumber:</td>
							<td><s:textfield name="user.phoneNumber" value="%{#selectedUser.phoneNumber}" cssClass="form-control edit-input"/></td>
						</tr>
						<tr>
							<td class="tabHead">Sex:</td>
							<td>
								<s:radio name="user.sex" list="%{#{'1':'Male','2':'Female'}}" value="%{#selectedUser.sex}"></s:radio>
							</td>
						</tr>
						<tr>
							<td class="tabHead">Status:</td>
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
							<td class="tabHead">RegisterDate:</td>
							<td>${selectedUser.registerDate}</td>
						</tr>
						<tr>
							<td class="tabHead">CurrentLoginDate:</td>
							<td>${selectedUser.curLoginDate}</td>
						</tr>
						<tr>
							<td class="tabHead">CurrentLoginIp:</td>
							<td>${selectedUser.curLoginIp}</td>
						</tr>
						<tr>
							<td class="tabHead">LastLoginDate:</td>
							<td>${selectedUser.lastLoginDate}</td>
						</tr>
						<tr>
							<td class="tabHead">LastLoginIp:</td>
							<td>${selectedUser.lastLoginIp}</td>
						</tr>
					</table>
					<div style="margin-bottom: 15px; text-align: center;">
						<s:submit value="Save" cssClass="btn btn-success"/>
						<a href="/user/personalCenter.html?id=${authUser.id}" class="btn btn-warning">Cancel</a>
					</div>
					</s:form>
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