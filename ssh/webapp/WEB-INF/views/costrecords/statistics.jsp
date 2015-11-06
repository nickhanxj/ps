<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<%@taglib prefix="s" uri="/struts-tags"%>
<title>消费统计信息</title>
<style type="text/css">
	table {
		width: 100%; 
		border: 2px dashed gray;
	}
	table tr{
		height: 50px;
	}
	.textright{
		text-align: right;
		width: 30%;
	}
	.textcenter{
		text-align: center;
	}
</style>
</head>
<body>
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">消费记录</h1>  
			<p class="body-head-text">
			记录每天消费，月底结账！
			</p>
		</div>
		<div class="body-container">
			<div style="width: 100%;"><a href="/cost/list.html" class="btn btn-info">&lt;&lt;返回列表</a></div>
			<div style="width: 100%;text-align: right;">
				<s:form action="/cost/statistics.html" method="post">
					<s:textfield name="year" placeholder="年份"/>年
					<s:textfield name="month" placeholder="月份"/>月
					<s:submit value="查看统计信息" cssClass="btn btn-info"/>
				</s:form>
			</div>
			<br>
				<div style="border: 2px solid lightblue; margin-top: 20px;">
				<h3 style="text-align: center; width: 100%;"><b>统计信息（${cyear}年${cmonth}月）</b></h3>
				<div style="width: 100%; text-align: center; font-weight: bold;">
					月总消费: <font color="red">${monthTotal.monthTotal}</font>元
				</div>
				<c:set var="perTotal" value="${monthTotal.monthTotal/3}"/>
				<div style="width: 100%; text-align: center; font-weight: bold;">
					人均消费：<font color="blue">${perTotal}元</font>
				</div>
				<div style=" width: 80%;margin-left: auto; margin-right: auto;">
					<s:iterator value="result" var="result">
						<div>${result.user}:</div>
						<table>
							<tr>
								<td class="textright">消费总次数：</td>
								<td class="textcenter">${result.statisticResult.costTimes}</td>
							</tr>
							<tr>
								<td class="textright">消费总额(￥)：</td>
								<td class="textcenter">${result.statisticResult.costTotal.csum}</td>
							</tr>
							<tr>
								<td class="textright">每次平均消费(￥)：</td>
								<td class="textcenter">${result.statisticResult.costTotal.cavg}</td>
							</tr>
							<tr>
								<td class="textright">已结算消费：</td>
								<td class="textcenter">${result.statisticResult.settled}</td>
							</tr>
							<tr>
								<td class="textright">未结算消费：</td>
								<td class="textcenter">${result.statisticResult.unsettled}</td>
							</tr>
							<tr style="color: green; font-weight: bold;">
								<td class="textright">本月应付：</td>
								<td class="textcenter">${result.statisticResult.costTotal.csum - perTotal}</td>
							</tr>
						</table>
						<br>
					</s:iterator>
				</div>	
			</div>
			<br>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>