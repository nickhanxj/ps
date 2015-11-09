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
			<div style="border-bottom: 1px dotted gray; padding-bottom: 10px;">
				<s:form action="/cost/list.html" theme="simple" id="searchForm">
				<a href="/cost/addRecord.html" class="btn btn-info">新增记录</a>
				<span style="float:right;">
				<s:textfield name="startTime" readonly="true" onClick="WdatePicker()" placeholder="开始时间" id="startTime"/>
				至<s:textfield name="endTime" readonly="true" onClick="WdatePicker()" placeholder="结束时间" id="endTime"/>
				<s:select name="userName" list="#{0:'--选择消费人--',1:'韩晓军',2:'胡丰盛',3:'李洪亮'}" cssStyle="width: 160px;" id="userName"></s:select>
				<s:textfield name="costFor" placeholder="消费用途" id="costFor"/>
				<s:submit value="查询" cssClass="btn btn-info"></s:submit>
				<a href="javascript:void(0)" onclick="resetForm()" class="btn btn-info">重置</a>
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
<%-- 							<a href="/cost/delete.html?recordId=${record.id}">删除</a> --%>
							<a href="javascript:void(0)" onclick="confirmDelete(${record.id})">删除</a>
							<c:if test="${record.status == 0}">
							|<a href="javascript:void(0)" onclick="checkout(${record.id},${record.user},'${record.costFor}','${record.cost}','${record.costdate}','${record.mark}')">结账</a>
							</c:if>
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
	<a href="#" data-toggle="modal" style="display: none;" data-target="#nopermission" id="noPermissionBtn">warning</a>
	<div class="modal fade" id="nopermission" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width: 600px; text-align: center;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">
	        		    警告
	            </h4>
	         </div>
	         <div class="modal-body">
	         	未授权操作！
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	         </div>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<a href="#" data-toggle="modal" style="display: none;" data-target="#deleteSuccess" id="deleteSuccessBtn">warning</a>
	<div class="modal fade" id="deleteSuccess" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width: 600px; text-align: center;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">
	        		    提示
	            </h4>
	         </div>
	         <div class="modal-body">
	         	删除成功！
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal">关闭
	            </button>
	         </div>
	      </div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<a href="#" data-toggle="modal" style="display: none;" data-target="#checkoutSuccess" id="checkoutSuccessBtn">warning</a>
	<div class="modal fade" id="checkoutSuccess" tabindex="-1" role="dialog" 
	   aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog" style="width: 600px; text-align: center;">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" 
	               data-dismiss="modal" aria-hidden="true" onclick="refreshPage()">
	                  &times;
	            </button>
	            <h4 class="modal-title" id="myModalLabel">
	        		    提示
	            </h4>
	         </div>
	         <div class="modal-body" id="checkoutMsg">
	         	结账成功！
	         </div>
	         <div class="modal-footer">
	            <button type="button" class="btn btn-default" 
	               data-dismiss="modal" onclick="refreshPage()">关闭
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
	
	function confirmDelete(recordId){
		$.confirm({
		    title: '警告',
		    content: '确认删除该消费记录?删除之后不能恢复！',
		    confirmButton:'确认',
		    cancelButton:'取消',
		    confirm: function(){
		    	$.ajax({
		    		url:"/cost/delete.html",
		    		type: "POST",
		    		data: {"recordId":recordId},
		    		success: function(data){
		    			if(data.status == 1){
		    				$("#deleteSuccessBtn").click();
		    				setTimeout(function () { 
			    				var url = window.location.href;
			    				window.location.href = url;
						    }, 1000);
		    			}else{
		    				$("#noPermissionBtn").click();
		    			}
		    		}
		    	});
		    },
		    cancel: function(){
		    }
		});
	}
	
	function checkout(recordId,user,costFor,cost,costdate,mark){
		var username = "";
		if(user == 1){
			username = "韩晓军";
		}else if(user == 2){
			username = "胡丰盛";
		}else if(user == 3){
			username = "李洪亮";
		}
		$.confirm({
		    title: '请确认账单',
		    content: '消费人：'+username+'<br/>消费金额：'+cost+'<br/>消费用途：'+costFor+'<br/>消费日期：'+costdate+'<br/>备注：'+mark,
		    confirmButton:'确认结账',
		    cancelButton:'取消',
		    confirm: function(){
		    	$.ajax({
		    		url:"/cost/checkout.html",
		    		type: "POST",
		    		data: {"recordId":recordId},
		    		success: function(data){
		    			if(data.status == 1){
		    				$("#checkoutMsg").html(data.msg);
		    				$("#checkoutSuccessBtn").click();
		    			}else{
		    				$("#noPermissionBtn").click();
		    			}
		    		}
		    	});
		    },
		    cancel: function(){
		    }
		});
	}
	
	function resetForm(){
		$("#startTime").val("");
		$("#endTime").val("");
		$("#userName").val(0);
		$("#costFor").val("");
	}
	
	function refreshPage(){
		var url = window.location.href;
		window.location.href = url;
	}
</script>
</html>