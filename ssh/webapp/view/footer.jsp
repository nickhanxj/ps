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
	<a href="#top" title="Back to top" style="display:block; position:fixed; right:20px; bottom:20px;">
		<img alt="" src="/images/top.jpg" width="40px" height="40px;">
	</a>
	<div class="foot vertically">
		<div align="center">Copyright-2015</div>
		<div align="center">All rights deserved</div>
		<div align="center" id="curTime">Author: Nick</div>
		<div align="center">Current version: v1.0</div>
		<div align="center">
			Quick Links:
			<a href="www.baidu.com" class="footer-a">Baidu</a>
			<a href="www.qq.com" class="footer-a">Tencent</a>
			<a href="www.bing.com" class="footer-a">Bing</a>
			<a href="www.sina.com" class="footer-a">Sina</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		setInterval(function(){
			$("#curTime").html(new Date());
		},1000);
	});
</script>
</html>