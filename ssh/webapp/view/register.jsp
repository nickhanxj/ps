<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp" />
 <%@taglib prefix="s" uri="/struts-tags"%> 
<title>注册</title>
</head>
<body background="/images/dc54564e9258d109e7edcc52d058ccbf6d814dc7.jpg">
	<div style="width: 30%; margin-left: auto; margin-right: auto; margin-top: 100px; border: 10px solid lightgray;background: white;">
	<div style="padding: 15px;">
	<s:form action="/userAction_register" theme="simple">
		<div class="form-group">
			<label for="name">用户名:</label> 
			<s:textfield name="user.userName"  cssClass="form-control" placeholder="请输入名称"></s:textfield>
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
			已有账号？直接<a href="/view/login.jsp">登录</a>
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
</body>
<script type="text/javascript">
	function validatePwd(){
		var originPwd = $("#originPwd").val();
		var rePwd = $("#rePwd").val();
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