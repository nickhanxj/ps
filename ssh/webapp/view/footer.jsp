<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
	/*手机*/
	@media screen and (max-width:600px){
		#gotop{
			display:none; 
			position:fixed; 
			right:20px; 
			bottom:50px; 
			cursor: pointer;
		}
		#quickLinks{
			display: none;
		}
	}
	/*平板*/
	@media screen and (min-width:600px) and (max-width:960px){
		#gotop{
			display:none; 
			position:fixed; 
			right:20px; 
			bottom:60px; 
			cursor: pointer;
		}
	}
	/*PC*/
	@media screen and (min-width:960px){
		#gotop{
			display:none; 
			position:fixed; 
			right:20px; 
			bottom:140px; 
			cursor: pointer;
		}
	}
</style>
</head>
<body>
	<a id="gotop" title="Back to top">
		<img alt="" src="/images/gototop.png" width="40px" height="40px;">
	</a>
	<div class="foot vertically">
		<div align="center">Copyright-2015</div>
		<div align="center">All rights deserved</div>
		<div align="center" id="curTime">Author: Nick</div>
		<div align="center">Current version: v1.0</div>
<!-- 		<div align="center"><img alt="" src="/images/QRCode.png" height="60px"> </div> -->
		<div align="center" id="quickLinks">
			快速链接:
			<a value="www.baidu.com" href="javascript:void(0)" onclick="redirectUrl(this)" class="footer-a">百度</a>
			<a value="www.qq.com" href="javascript:void(0)" onclick="redirectUrl(this)" class="footer-a">腾讯</a>
			<a value="www.bing.com" href="javascript:void(0)" onclick="redirectUrl(this)" class="footer-a">必应</a>
			<a value="www.sina.com" href="javascript:void(0)" onclick="redirectUrl(this)" class="footer-a">新浪</a>
			<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256822752'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1256822752%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script>
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
// 		window.location.href = "http://"+url;
		window.open("http://"+url);
	}
	
</script>
</html>