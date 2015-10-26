<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<title>首页</title>
</head>
<body>
	<a id="gotop" title="Back to top" style="display:none; position:fixed; right:20px; bottom:140px; cursor: pointer;">
		<img alt="" src="/images/gototop.png" width="40px" height="40px;">
	</a>
	<div class="foot vertically">
		<div align="center">Copyright-2015</div>
		<div align="center">All rights deserved</div>
		<div align="center" id="curTime">Author: Nick</div>
		<div align="center">Current version: v1.0</div>
		<div align="center">
			Quick Links:
			<a value="www.baidu.com" href="javascript:void(0)" onclick="redirectUrl(this)" class="footer-a">Baidu</a>
			<a value="www.qq.com" href="javascript:void(0)" onclick="redirectUrl(this)" class="footer-a">Tencent</a>
			<a value="www.bing.com" href="javascript:void(0)" onclick="redirectUrl(this)" class="footer-a">Bing</a>
			<a value="www.sina.com" href="javascript:void(0)" onclick="redirectUrl(this)" class="footer-a">Sina</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		setInterval(function(){
			$("#curTime").html(new Date());
		},1000);
		
		 $(window).scroll(function(){
            if($(window).scrollTop() > 100){
                $("#gotop").fadeIn(500);//一秒渐入动画
            }else{
                $("#gotop").fadeOut(500);//一秒渐隐动画
            }
        });
         
        $("#gotop").click(function(){
            $('body,html').animate({scrollTop:0},500);
        });
	});
	
	function redirectUrl(t){
		console.debug(t);
		var url = $(t).attr("value");
		window.location.href = url;
	}
	
</script>
</html>