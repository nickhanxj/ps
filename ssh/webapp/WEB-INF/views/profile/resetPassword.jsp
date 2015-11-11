<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心-修改资料</title>
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
			<h1 class="body-head-title">Personal</h1>
			<p class="body-head-text">You can check or edit your personal
				information here!</p>
		</div>
		<div class="body-container" >
			<div style="border: 1px solid silver; width: 100%; clear: both;">
				<ul class="nav nav-tabs">
				  <li role="presentation" onclick="activeItem(this)"><a href="/user/personalCenter.html?id=${authUser.id}">基本信息</a></li>
				  <li role="presentation" onclick="activeItem(this)"><a href="/user/editProfile.html?id=${authUser.id}">修改资料</a></li>
				  <li class="active" role="presentation" onclick="activeItem(this)"><a href="/user/resetPasswordPage.html">修改密码</a></li>
				  <li role="presentation" onclick="activeItem(this)"><a href="#">联系方式</a></li>
				</ul>
				<div style="text-align: left; padding-top: 5px;">
					<table class="table table-condensed" style="width: 50%; margin-left: auto; margin-right: auto;">
						<s:hidden name="id" value="%{#selectedUser.id}"/>
						<tr>
							<td class="tabHead">原密码:</td>
							<td><s:password onblur="checkOriginPasswd(this)" value="%{#selectedUser.userName}" cssClass="form-control edit-input"/></td>
						</tr>
						<tr>
							<td class="tabHead">新密码:</td>
							<td><s:password  id="newPassword" onblur="validatePwd()" value="%{#selectedUser.trueName}" cssClass="form-control edit-input"/></td>
						</tr>
						<tr>
							<td class="tabHead">确认新密码:</td>
							<td><s:password  id="reNewPassword" onblur="validatePwd()" value="%{#selectedUser.email}" cssClass="form-control edit-input"/></td>
						</tr>
					</table>
					<div style="color: red; font-size: x-small;margin-top: 30px;" align="center" id="errorField">
					</div>
					<div style="color: green; font-size: x-small;margin-top: 30px; font-weight: bold;" align="center" id="successField">
					</div>
					<div style="margin-bottom: 15px; text-align: center; margin-top: 6px;">
						<a href="javascript:void(0)" onclick="resetPassword()" class="btn btn-success disabled" id="changePWD">重置密码</a>
						<a href="/user/personalCenter.html?id=${authUser.id}" class="btn btn-warning">取消</a>
					</div>
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
	
	$(function(){
		$("#weixin_image").fileupload({  
            url: '/file/uploadPhoto.html',  
            sequentialUploads: true  
        }).bind('fileuploadprogress', function (e, data) {  
            var progress = parseInt(data.loaded / data.total * 100, 10);  
            $("#weixin_progress").css('width',progress + '%');  
            $("#weixin_progress").html(progress + '%');  
        }).bind('fileuploaddone', function (e, data) { 
        	console.debug(data.result.url);
            $("#weixin_show").attr("src",data.result.url);  
            $("#weixin_upload").css({display:"none"});  
            $("#weixin_cancle").css({display:""});  
        });  
	});
	
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
				$("#successField").html("请记好密码，以免造成不必要的麻烦！");
				$("#changePWD").removeClass("disabled");
			}
		}
	}
	
	function resetPassword(){
		var newPassword = $("#newPassword").val();
		$.ajax({
			url: '/user/resetPwd.html',
			type: "POST",
			data:{"password":newPassword},
			success: function(data){
				if(data == 2){
					$("#errorField").html("密码重置失败！未知错误！请<a href='#'>联系我们</a>！");
					$("#successField").html("");
				}else if(data == 1){
					$("#errorField").html("");
					$("#successField").html("密码重置成功，请重新<a href='/view/login.html'>登录</a>。");
				}
			}
		});
	}
	
	function checkOriginPasswd(t){
		var originPasswd = $(t).val();
		$.ajax({
			url: '/user/validateOriginPasswd.html',
			type: "POST",
			data:{"originPassword":originPasswd},
			success: function(data){
				if(data == 2){
					$("#errorField").html("旧密码错误！");
					$("#successField").html("");
				}else if(data == 1){
					$("#errorField").html("");
					$("#successField").html("旧密码验证通过");
				}
			}
		});
	}
</script>
</html>