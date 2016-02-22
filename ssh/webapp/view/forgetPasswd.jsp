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
<!-- <link rel="stylesheet" type="text/css" href="/css/default.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="/css/styles.css"> -->
<style type="text/css">
	/*手机*/
	@media screen and (max-width:600px){
		#logoImg{
			width: 40px;
		}
		#loginDiv{
			margin-left: auto; 
			margin-right: auto;
			margin-top: 60px;
			width: 80%; 
		}
	}
	/*平板*/
	@media screen and (min-width:600px) and (max-width:960px){
		#loginDiv{
			margin-left: auto; 
			margin-right: auto;
			margin-top: 60px;
			width: 80%; 
		}
	}
	/*PC*/
	@media screen and (min-width:960px){
		#loginDiv{
			margin-left: auto; 
			margin-right: auto; 
			width: 40%; 
			height:400px;  
			margin-top: 100px; 
			background: rgba(255,255,255, 1); 
			-webkit-border-radius: 15px;
			-moz-border-radius: 15px;
		}
	}
</style>
<title>密码找回</title>
</head>
<body >
	<s:include value="/view/header.jsp"/>
<!-- 	<img alt="" src="/images/backImg.jpg" class="back-img"> -->
		<div id="loginDiv">
			<div style="padding: 15px;">
				<div style="width: 100%; text-align: center;"><img alt="" src="/images/Password.ico" id="logoImg"> </div>
				<div style="width: 100%; text-align: center;font-size: 20px; font-family: cursive; font-weight: bold;  padding-bottom: 15px; padding-top: 10px;">找回密码</div>
				<div id="baseInfo">
					<div class="form-group">
					    <label class="form-label">注册邮箱    </label>
					    <input required="required" id="email" name="email" class="form-control"/>
					  </div>
					  <div class="form-group">
					    <label class="form-label">注册手机 </label>
					    <input required="required" id="phone" name="phone" class="form-control"/>
					  </div>
					  <div class="form-group">
					    <label class="form-label">真实姓名</label>
					    <input required="required" id="trueName" name="trueName" class="form-control"/>
					   </div>
					   <div style="color: green; font-size: x-small;margin-top: 30px;" align="left">
					   	* <font color="blue">邮箱必须提供</font>，手机与真实姓名提供一项即可。
					   </div>
					   <div align="center" style="margin-top: 30px;">
							<a href="javascript:void(0)" onclick="validateBaseInfo()" class="btn btn-default">验证信息</a>
						</div>
				  </div>
				  <div id="resetPasswd" style="display: none;">
				  	<div class="form-group">
					    <label class="form-label">设置新密码    </label>
					    <input required="required" id="newPassword" type="password" name="newPasswd" onblur="validatePwd()" class="form-control"/>
					  </div>
					  <div class="form-group">
					    <label class="form-label">重复新密码 </label>
					    <input required="required" id="reNewPassword" type="password" name="reNewPasswd" onblur="validatePwd()" class="form-control"/>
					  </div>
					  <div align="center" style="margin-top: 30px;">
							<a href="javascript:void(0)" onclick="resetPassword()" class="btn btn-default disabled" id="confirmBtn">确认修改</a>
						</div>
				  </div>
				<div style="color: red; font-size: x-small;margin-top: 30px;" align="center" id="errorField">
				</div>
				<div style="color: green; font-size: x-small;margin-top: 30px; font-weight: bold;" align="center" id="successField">
				</div>
				<div align="right" style="font-size: x-small; margin-top: 30px;">
					<a href="/view/login.html">登录</a>&ensp;|
					<a href="/view/register.html">注册</a>&ensp;|
					<a href="mailto:471026023@qq.com?subject=ccc&body=xxx yyy">联系我们</a>
				</div>
			</div>
		</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#pendingUrl").val(window.location.href);
	});
	function hideBaseInfo(){
		$("#baseInfo").slideUp(1000);
		$("#resetPasswd").slideDown(1000);
		$("#successField").html("");
	}
	
	function validateBaseInfo(){
		var email = $("#email").val();
		var phone = $("#phone").val();
		var trueName = $("#trueName").val();
		$.ajax({
			url:"/user/validateBaseInfo.html",
			type: "POST",
			data:{"email":email,"phone":phone,"trueName":trueName},
			success: function(data){
				if(data == 1){
					$("#successField").html("信息认证成功！即将进入下一步,请稍等...");
					setTimeout(function () { 
						hideBaseInfo();
				    }, 2000);
				}else if(data == 2){
					$("#errorField").html("信息认证失败！请重新填写。");
					setTimeout(function () { 
						$("#errorField").html("");
				    }, 2000);
				}
			}
		});
	}
	
	function resetPassword(){
		var email = $("#email").val();
		var newPassword = $("#newPassword").val();
		$.ajax({
			url:"/user/resetPassword.html",
			type: "POST",
			data:{"password":newPassword,"email":email},
			success: function(data){
				if(data == 1){
					$("#successField").html("密码重置成功！马上去<a href='/view/login.html'>登录</a>");
				}else if(data == 2){
					$("#errorField").html("密码重置失败！未知错误！请<a href='#'>联系我们</a>！");
				}
			}
		});
	}
	
	function validatePwd(){
		var originPwd = $("#newPassword").val();
		var rePwd = $("#reNewPassword").val();
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
				$("#successField").html("请记好密码，以免再次丢失！");
				$("#confirmBtn").removeClass("disabled");
			}
		}
	}
</script>
</html>