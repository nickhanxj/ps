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
		border: 2px solid #9AC0CD;
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
	
	.subTable{
		border: 1px solid #9AC0CD; 
		width: 70%; 
		margin-left: auto; 
		margin-right: auto;
	}
	
	.subTableLine{
		border: 1px solid #9AC0CD; 
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
					月总消费: <font color="green">${monthTotal.monthTotal}</font>&emsp;元
				</div>
				<c:set var="perTotal" value="${monthTotal.monthTotal/3}"/>
				<div style="width: 100%; text-align: center; font-weight: bold;">
					人均消费：<font color="green">${perTotal}</font>&emsp;元
				</div>
				<div style=" width: 80%;margin-left: auto; margin-right: auto;">
					<s:iterator value="result" var="result" status="status">
						<div>${result.user}:</div>
						<table>
							<tr>
								<td class="textright">消费总次数：</td>
								<td class="textcenter">
									<a href="javascript:void(0);" class="btn" title="点击查看" onclick="tableSlideDown('${status.index}_tab',this)">
									${result.statisticResult.costTimes}
									</a>
								</td>
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
							<tr style="font-weight: bold;">
								<c:set var="relCost" value="${result.statisticResult.costTotal.csum - perTotal}"/>
								<c:if test="${relCost > 0}">
									<td class="textright" style="color:blue;">本月应收(￥)：</td>
									<td class="textcenter"  style="color:blue;">
										${relCost}
									</td>
								</c:if>
								<c:if test="${relCost == 0}">
									<td class="textright" style="color:black;">本月收支平衡：</td>
									<td class="textcenter"  style="color:black;">
										${relCost}
									</td>
								</c:if>
								<c:if test="${relCost < 0}">
									<td class="textright" style="color:red;">本月应付(￥)：</td>
									<td class="textcenter"  style="color:red;">
										${relCost}
									</td>
								</c:if>
							</tr>
							<tr>
								<td colspan="2">
									<div style="display: none;" id="${status.index}_tab">
									<table class="subTable" id="subTable">
										<tr >
											<th class="subTableLine">消费人</th>
											<th class="subTableLine">消费金额（元）</th>
											<th class="subTableLine">消费用途</th>
											<th class="subTableLine">消费时间</th>
											<th class="subTableLine">状态</th>
											<th class="subTableLine">备注</th>
										</tr>
										<c:forEach items="${result.statisticResult.records}" var="record">
											<tr>
												<td class="subTableLine">
													<c:if test="${record.user == 1}">
														韩晓军
													</c:if>
													<c:if test="${record.user == 2}">
														胡丰盛
													</c:if>
													<c:if test="${record.user == 3}">
														李洪亮
													</c:if>
												</td>
												<td class="subTableLine">${record.cost}</td>
												<td class="subTableLine">${record.costFor}</td>
												<td class="subTableLine">${record.costdate}</td>
												<td class="subTableLine">
													<c:if test="${record.status == 0}">
														未结
													</c:if>
													<c:if test="${record.status == 1}">
														<font color="green">已结</font>
													</c:if>
												</td>
												<td class="subTableLine">${record.mark}</td>
											</tr>
										</c:forEach>
									</table>
									</div>
								</td>
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
<script type="text/javascript">
	function tableSlideDown(tableId,t){
		$('#'+tableId).slideDown(1000);
		$(t).attr("onclick","tableSlideUp('"+tableId+"',this)");
	}
	
	function tableSlideUp(tableId,t){
		$('#'+tableId).slideUp(1000);
		$(t).attr("onclick","tableSlideDown('"+tableId+"',this)");
	}
</script>
</html>