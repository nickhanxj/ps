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
	/*手机*/
	@media screen and (max-width:600px){
		#normal{
			display: none;
		}
		.searchParam{
			width: 35%; 
			height:32px;
		}
		table tr,td{
			border: 1px solid #9AC0CD;
		}
		#viewPersonCost{
			display: none;
		}
	}
	/*平板*/
	@media screen and (min-width:600px) and (max-width:960px){
		.searchParam{
			width: 100px; 
			height:32px;
		}
		#forPhone{
			display: none;
		}
	}
	/*PC*/
	@media screen and (min-width:960px){
		.searchParam{
			width: 100px; 
			height:32px;
		}
		#forPhone{
			display: none;
		}
		.statisticItem{
			width: 80%;
			margin-left: auto; 
			margin-right: auto;
		}
	}
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
	
	#tempId a:VISITED {
		color: #9AC0CD;
	}
	#tempId a:HOVER {
		color: #9AC0CD;
	}
	#tempId a:LINK {
		color: #9AC0CD;
	}
	
	.btn{
		background-color: #E3E3E3;
	}
</style>
</head>
<body>
	<div class="main-container">
				<div style="border: 2px solid lightblue; margin-top: 20px;">
				<h3 style="text-align: center; width: 100%;"><b>统计信息（${cyear}年${cmonth}月）</b></h3>
				<div class="statisticItem">
					<table>
						<tr style="background-color: #8FBC8F">
							<th class="textright">统计条目</th>
							<th class="textcenter">金额(￥)</th>
						</tr>
						<tr>
							<td class="textright">月总消费</td>
							<td class="textcenter"><font color="green">${monthTotal.monthTotal}</font>&emsp;</td>
						</tr>
						<tr>
							<td class="textright">已结算消费总额</td>
							<td class="textcenter"><font color="green">${monthTotal.monthTotal - monthTotal.monthTotalExceptSettled}</font>&emsp;</td>
						</tr>
						<tr>
							<td class="textright">扣除已结算月总消费</td>
							<td class="textcenter"><font color="green">${monthTotal.monthTotalExceptSettled}</font>&emsp;</td>
						</tr>
						<tr>
							<td class="textright">人均消费</td>
							<td class="textcenter">
								<c:set var="perTotal" value="${monthTotal.monthTotalExceptSettled/3}"/>
								<font color="green">${perTotal}</font>&emsp;
							</td>
						</tr>
					</table>
				</div>
				<div style="width: 80%; text-align: right; margin-left:auto; margin-right:auto; font-weight: normal; margin-top: 10px; font-size: xx-small;color: blue;">
					注：已结算消费只做历史记录，以便查询。在人均消费和每人当月应付金额的统计中已经扣除已结算消费。
				</div>
				<div class="statisticItem">
					<s:iterator value="result" var="result" status="status">
						<div>${result.user}:</div>
						<table>
							<tr>
								<td class="textright">消费总次数：</td>
								<td class="textcenter" id="tempId">
									<c:set value="${result.statisticResult.costTimes}" var="costtimes"/>
									${costtimes}
								</td>
							</tr>
							<tr>
								<td class="textright">消费总额(￥)：</td>
								<td class="textcenter">
									<c:if test="${costtimes == 0}">
										暂无
									</c:if>
									<c:if test="${costtimes > 0}">
										${result.statisticResult.costTotal.csum}
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="textright">已结算消费金额(￥)：</td>
								<td class="textcenter">
									<c:if test="${costtimes == 0}">
										暂无
									</c:if>
									<c:if test="${costtimes > 0}">
										${result.statisticResult.settledCost}
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="textright">未结算消费金额(￥)：</td>
								<td class="textcenter">
									<c:if test="${costtimes == 0}">
										暂无
									</c:if>
									<c:if test="${costtimes > 0}">
										${result.statisticResult.unsettledCost}
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="textright">每次平均消费(￥)：</td>
								<td class="textcenter">
									<c:if test="${costtimes == 0}">
										暂无
									</c:if>
									<c:if test="${costtimes > 0}">
										${result.statisticResult.costTotal.cavg}
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="textright">已结算消费数：</td>
								<td class="textcenter">
									<c:if test="${costtimes == 0}">
										暂无
									</c:if>
									<c:if test="${costtimes > 0}">
										${result.statisticResult.settled}
									</c:if>
								</td>
							</tr>
							<tr>
								<td class="textright">未结算消费数：</td>
								<td class="textcenter">
									<c:if test="${costtimes == 0}">
										暂无
									</c:if>
									<c:if test="${costtimes > 0}">
										${result.statisticResult.unsettled}
									</c:if>
								</td>
							</tr>
							<tr style="font-weight: bold;">
								<c:set var="relCost" value="${result.statisticResult.unsettledCost - perTotal}"/>
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
</body>
</html>