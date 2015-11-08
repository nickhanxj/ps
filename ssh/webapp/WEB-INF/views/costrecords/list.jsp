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
<title>消费记录列表</title>
<style type="text/css">
	table {
		width: 100%;
		border: 1px solid gray;
	}
	table tr{
		padding: 5px;
		margin-top: 5px;
	}
	table th{
		text-align: center;
		border: 1px dashed gray;
		background-color: lightblue;
	}
	table td{
		text-align: center;
		border: 1px dashed gray;
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
			<div>
				<s:form action="/cost/list.html" theme="simple">
				<a href="/cost/addRecord.html" class="btn btn-info">新增记录</a>
				<span style="float:right;">
				<s:textfield name="sStartTime" readonly="true" onClick="WdatePicker()" placeholder="开始时间"/>
				至<s:textfield name="sEndTime" readonly="true" onClick="WdatePicker()" placeholder="结束时间"/>
				<s:select name="sUserName" list="#{1:'韩晓军',2:'胡丰盛',3:'李洪亮'}" cssStyle="width: 160px;"></s:select>
				<s:textfield name="sCostFor" placeholder="消费用途"/>
				<s:submit value="搜索" cssClass="btn btn-info"></s:submit>
				</span>
				</s:form>
			</div>
			<br>
			<table>
				<tr>
					<th>消费人</th>
					<th>消费金额（元）</th>
					<th>消费用途</th>
					<th>消费时间</th>
					<th>状态</th>
					<th>备注</th>
					<th>附件</th>
					<th>操作</th>
				</tr>
				<s:iterator value="records" var="record">
					<tr>
						<td>
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
						<td>${record.cost}</td>
						<td>${record.costFor}</td>
						<td>${record.costdate}</td>
						<td>
							<c:if test="${record.status == 0}">
								未结
							</c:if>
							<c:if test="${record.status == 1}">
								<font color="green">已结</font>
							</c:if>
						</td>
						<td>${record.mark}</td>
						<td>
							<c:if test="${not empty record.attachment}">
								<a href="#" data-toggle="modal" data-target="#myModal" onclick="getAttachment('${record.attachment}')" title="点击查看 ">查看附件</a>
							</c:if>
							<c:if test="${empty record.attachment}">
								无附件
							</c:if>
						</td>
						<td>
							<a href="/cost/editRecord.html?recordId=${record.id}">修改</a>|
							<a href="#">删除</a>
						</td>
					</tr>
				</s:iterator>
			</table>
			<br>
			<div style="width: 100%; text-align: right;"><a href="/cost/statistics.html" class="btn btn-success" id="view">查看统计信息</a></div>
		</div>
	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width: 600px; text-align: center;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">
	        		       附件
	            </h4>
	         </div>
	         <div class="modal-body">
	         	<img alt="" src="" id="attachment" width="560px;">
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	         </div>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
<script type="text/javascript">
	$(function(){
		var date = new Date;
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var url = "/cost/statistics.html?year="+year+"&month="+month;
		$("#view").attr('href',url);
	});
	
	function getAttachment(attachment){
		$("#attachment").attr("src",attachment);
	}
</script>
</html>