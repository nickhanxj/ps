<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp" />
<link href="/css/homepage.css" rel="stylesheet">
 <%@taglib prefix="s" uri="/struts-tags"%> 
<script src="/js/jquery-validation-1.14.0/lib/jquery.js" type="text/javascript"></script>
<script src="/js/jquery-validation-1.14.0/dist/jquery.validate.min.js" type="text/javascript"></script>
<style type="text/css">
	/*手机*/
	@media screen and (max-width:600px){
		#registerDiv{
			margin-left: auto; 
			margin-right: auto;
			margin-top: 60px; 
			width: 90%; 
		}
	}
	/*平板*/
	@media screen and (min-width:600px) and (max-width:960px){
		#registerDiv{
			width: 80%; 
			margin-left: auto; 
			margin-right: auto; 
			margin-top: 80px; 
			background: rgba(255,255,255, 0.5);
			-webkit-border-radius: 15px; 
			-moz-border-radius: 15px;
		}
	}
	/*PC*/
	@media screen and (min-width:960px){
		#registerDiv{
			width: 50%; 
			margin-left: auto; 
			margin-right: auto; 
			margin-top: 100px; 
			background: rgba(255,255,255, 0.5);
			-webkit-border-radius: 15px; 
			-moz-border-radius: 15px;
		}
	}
</style>
<title>新用户注册</title>
</head>
<body>
	<s:include value="/view/header.jsp"/>
<!-- 	<img alt="" src="/images/backImg.jpg" class="back-img"> -->
	<div id="registerDiv">
	<div style="padding: 15px;">
	<s:form action="/userAction_register" theme="simple">
	<div style="font-size: 20px; font-family: cursive; font-weight: bold;  padding-bottom: 15px; padding-top: 10px; text-align: center; -webkit-border-radius: 15px;-moz-border-radius: 15px;">
	获取我的私人空间<br>
	<p style="font-size: 8px;font-weight: normal;">Private space is a place where you can place your personal files(videos, photos, musics etc) and manage your resources, and also you can take record your daily mood here and some interesting things of your daily life. It's a harbour of your heart and a time capsule of your experience. Just retain wonderful moment !</p>
	</div>
		<div class="form-group" style="margin-top: 15px;">
			<label for="name">用户名:</label> 
			<s:textfield name="user.userName"  cssClass="form-control" placeholder="请输入名称"></s:textfield>
		</div>
		<div class="form-group" style="margin-top: 15px;">
			<label for="name">真实姓名:</label> 
			<s:textfield name="user.trueName"  cssClass="form-control" placeholder="请输入真实姓名"></s:textfield>
		</div>
		<div >
			<label for="password">性别: </label><br>
			&emsp;&emsp;<s:radio name="user.sex" list="%{#{'1':'男','2':'女'}}" value="1"></s:radio>
		</div>
		<div class="form-group">
			<label for="password">密码:</label> 
			<s:password name="user.password" cssClass="form-control" placeholder="请输入密码" id="originPwd" onblur="validatePwd()"/>
		</div>
		<div class="form-group">
			<label for="password">重复密码:</label> 
			<s:password  cssClass="form-control" placeholder="请再次输入密码" id="rePwd" onblur="validatePwd()"/>
		</div>
		<div class="form-group">
			<label for="password">邮箱:</label> 
			<s:textfield name="user.email" cssClass="form-control" placeholder="请输入邮箱"/>
		</div>
		<div class="form-group">
			<label for="password">电话:</label> 
			<s:textfield name="user.phoneNumber" cssClass="form-control" placeholder="请输入电话号码"/>
		</div>
		<div align="center">
			<s:submit value="注册" cssClass="btn btn-default"/>
		</div>
		<div align="right" style="font-size: x-small;">
			已有账号？直接<a href="/view/login.html">登录</a>
		</div>
		<div style="color: red;" align="center" id="errorField">
			<s:actionerror/>
		</div>
		<div style="color: green;" align="center">
			<s:actionmessage/>
		</div>
	</s:form>
	</div>
	</div>
<%-- 	<s:include value="/view/footer.jsp"/> --%>
</body>
<script type="text/javascript">
	function validatePwd(){
		var originPwd = $("#originPwd").val();
		var rePwd = $("#rePwd").val();
		if(originPwd.length < 6){
			$("#errorField").html("密码长度至少大于6位");	
		}else{
			$("#errorField").html("");
		}
		if(originPwd && rePwd){
			if(originPwd != rePwd){
				$("#errorField").html("两次输入密码不一致");	
			}else{
				$("#errorField").html("");
			}
		}
	}
</script>
</html>