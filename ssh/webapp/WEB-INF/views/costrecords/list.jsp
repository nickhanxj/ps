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
	/*手机*/
	@media screen and (max-width:600px){
		#searchParamsForm{
			display: none;
		}
		#searchParamsFormRes{
			display: none;
		}
		.searchParam{
			width: 150px; 
			height:32px;
		}
		#dataForm{
			display: none;
		}
		#normal{
			display: none;
		}
	}
	/*平板*/
	@media screen and (min-width:600px) and (max-width:960px){
		#searchParamsForm{
			display: none;
		}
		#searchParamsFormResForPhone{
			display: none;
		}
		.searchParam{
			width: 140px; 
			height:32px;
		}
		#advancedQuery{
			display: none;
		}
		#dataFormForPhone{
			display: none;
		}
		#forPhone{
			display: none;
		}
	}
	/*PC*/
	@media screen and (min-width:960px){
		#searchParamsFormRes{
			display: none;
		}
		#searchParamsFormResForPhone{
			display: none;
		}
		.searchParam{
			width: 150px; 
			height:32px;
		}
		#advancedQuery{
			display: none;
		}
		#dataFormForPhone{
			display: none;
		}
		#forPhone{
			display: none;
		}
	}
	table {
		width: 100%;
		border: 1px solid lightgray;
	}
	table tr{
		padding: 5px;
		margin-top: 5px;
	}
	table th{
		text-align: center;
		border: 1px solid lightgray;
		padding:5px;
/* 		background-color: lightblue; */
	}
	table td{
		text-align: center;
		padding:10px;
		border: 1px solid lightgray;
	}
	
	.btn{
		background-color: #E3E3E3;
	}
	
	#searchDiv a:VISITED {
		color: gray;
	}
	#searchDiv a:HOVER {
		color: #103858;
	}
	#searchDiv a:LINK {
		color: gray;
	}
</style>
</head>
<body>
	<div id="gallery2" class="gallery">
	<s:include value="/view/header.jsp"/>
	<div class="main-container">
		<div class="body-head">
			<h1 class="body-head-title">消费记录</h1>  
			<p class="body-head-text">
			记录每天消费，月底结账！
			</p>
		</div>
		<div class="body-container">
			<div style="border-bottom: 0px dotted gray; padding-bottom: 10px;" id="searchDiv">
<%-- 				<s:hidden name="pageSize" value="1"/> --%>
				<span id="normal">
					<a href="/cost/addRecord.html"  class="btn btn-small">新增记录</a>
					<a href="/cost/statistics.html" id="viewNormal" class="btn btn-small">表格统计信息</a>
					<a href="/cost/perPersonCostChart.html" id="viewNormal" class="btn btn-small">每人/月消费统计图</a>
					<a href="/cost/timeChart.html" id="viewNormal" class="btn btn-small">日消费折线图</a>
				</span>
				<span id="forPhone">
					<a href="/cost/addRecord.html"  class="btn btn-small">新增</a>
					<a href="/cost/statistics.html" id="view" class="btn btn-small">统计</a>
					<span id="advancedQuery"><a href="javascript:void(0)" onclick="showQueryForm()"  class="btn btn-small" id="queryText">高级查询</a></span>
				</span>
				<span style="float:right;" id="searchParamsForm">
					<s:form action="/cost/list.html" theme="simple" id="searchForm">
					<s:hidden name="currentPage" value="1" id="currentPageId"/>
					<s:textfield name="startTime" readonly="true" onClick="WdatePicker()" cssClass="searchParam" placeholder="开始时间" id="startTime"/>
					至<s:textfield name="endTime" readonly="true" onClick="WdatePicker()" cssClass="searchParam" placeholder="结束时间" id="endTime"/>
					<s:select name="userName" list="#{0:'--选择消费人--',1:'韩晓军',2:'胡丰盛',3:'李洪亮'}" cssClass="searchParam" id="userName"></s:select>
					<s:textfield name="costFor" placeholder="消费用途" id="costFor" cssClass="searchParam"/>
					<s:submit value="查询" cssClass="btn btn-small" id="searchBtn"></s:submit>
					<a href="javascript:void(0)" onclick="resetForm()" class="btn btn-small">重置</a>
					</s:form>
				</span>
				<!-- 0 收起  1展开 -->
				<input value="0" type="hidden" id="queryStatus">
				<div id="searchParamsFormResForPhone" style="display: none;">
					<s:form action="/cost/list.html" theme="simple" id="searchForm">
					<s:hidden name="currentPage" value="1" id="currentPageId"/>
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td><s:textfield name="startTime" readonly="true" onClick="WdatePicker()" cssClass="searchParam" placeholder="开始时间" id="startTime"/></td>
						</tr>
						<tr>
							<td><s:textfield name="endTime" readonly="true" onClick="WdatePicker()" cssClass="searchParam" placeholder="结束时间" id="endTime"/></td>
						</tr>
						<tr>
							<td><s:select name="userName" list="#{0:'--选择消费人--',1:'韩晓军',2:'胡丰盛',3:'李洪亮'}" cssClass="searchParam" id="userName"></s:select></td>
						</tr>
						<tr>
							<td><s:textfield name="costFor" placeholder="消费用途" id="costFor" cssClass="searchParam"/></td>
						</tr>
						<tr>
							<td>
							<s:submit value="查询" cssClass="btn btn-small" id="searchBtn"></s:submit>
							<a href="javascript:void(0)" onclick="resetForm()" class="btn btn-small">重置</a>
							</td>
						</tr>
					</table>
					</s:form>
				</div>
				<span id="searchParamsFormRes">
					<s:form action="/cost/list.html" theme="simple" id="searchForm">
					<s:hidden name="currentPage" value="1" id="currentPageId"/>
					<table style="margin-top: 10px; width: 100%;">
						<tr>
							<td><s:textfield name="startTime" readonly="true" onClick="WdatePicker()" cssClass="searchParam" placeholder="开始时间" id="startTime"/></td>
							<td><s:textfield name="endTime" readonly="true" onClick="WdatePicker()" cssClass="searchParam" placeholder="结束时间" id="endTime"/></td>
							<td><s:submit value="查询" cssClass="btn btn-small" id="searchBtn"></s:submit></td>
						</tr>
						<tr>
							<td><s:select name="userName" list="#{0:'--选择消费人--',1:'韩晓军',2:'胡丰盛',3:'李洪亮'}" cssClass="searchParam" id="userName"></s:select></td>
							<td><s:textfield name="costFor" placeholder="消费用途" id="costFor" cssClass="searchParam"/></td>
							<td><a href="javascript:void(0)" onclick="resetForm()" class="btn btn-small">重置</a></td>
						</tr>
					</table>
					</s:form>
				</span>
			</div>
			<br>
			<table id="dataForm">
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
				<s:iterator value="%{#records.rows}" var="record">
					<tr>
						<td>
							<c:if test="${record.user == 0}">
								系统提示
							</c:if>
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
						<td>
							<c:if test="${record.user == 0}">
								/
							</c:if>
							<c:if test="${record.user != 0}">
								${record.costFor}
							</c:if>
						</td>
						<td>${record.costdate}</td>
						<td>
							<c:if test="${record.status == 0}">
								未结
							</c:if>
							<c:if test="${record.status == 1}">
								<font color="green">已结</font>
							</c:if>
						</td>
						<td>
							<c:if test="${record.user == 0}">
								当日无消费记录
							</c:if>
							<c:if test="${record.user != 0}">
								${record.mark}
							</c:if>
						</td>
						<td>
							<c:if test="${not empty record.attachment}">
<%-- 								<a href="#" data-toggle="modal" data-target="#myModal" onclick="getAttachment('${record.attachment}')" title="点击查看 ">查看附件</a> --%>
								
									<a href="${record.attachment}" cmd="attachment"  title="${record.costdate}-${record.costFor}">查看附件</a>
							</c:if>
							<c:if test="${empty record.attachment}">
								无附件
							</c:if>
						</td>
						<td>
							<a href="/cost/editRecord.html?recordId=${record.id}" title="修改"><span class="glyphicon glyphicon-pencil"></span></a>&ensp;|
<%-- 							<a href="/cost/delete.html?recordId=${record.id}">删除</a> --%>
							<a href="javascript:void(0)" onclick="confirmDelete(${record.id})" title="删除"><span class="glyphicon glyphicon-trash"></span></a>
							<c:if test="${record.status == 0}">
							|&ensp;<a href="javascript:void(0)" onclick="checkout(${record.id},${record.user},'${record.costFor}','${record.cost}','${record.costdate}','${record.mark}')" title="结账"><span class="glyphicon glyphicon-shopping-cart"></span></a>
							</c:if>
						</td>
					</tr>
				</s:iterator>
			</table>
			<table id="dataFormForPhone">
				<tr>
					<th>消费人</th>
					<th>消费金额（元）</th>
					<th>消费用途</th>
					<th>附件</th>
					<th>操作</th>
				</tr>
				<s:iterator value="%{#records.rows}" var="record">
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
						<td>
							<c:if test="${not empty record.attachment}">
<%-- 								<a href="#" data-toggle="modal" data-target="#myModal" onclick="getAttachment('${record.attachment}')" title="点击查看 ">查看附件</a> --%>
								
									<a href="${record.attachment}" cmd="attachment"  title="${record.costdate}-${record.costFor}">查看</a>
							</c:if>
							<c:if test="${empty record.attachment}">
								无
							</c:if>
						</td>
						<td>
							<a href="/cost/editRecord.html?recordId=${record.id}" title="修改"><span class="glyphicon glyphicon-pencil"></span></a>
						</td>
					</tr>
				</s:iterator>
			</table>
<%-- 			<s:debug></s:debug> --%>
			<!-- 分页 -->
			<ul class="pagination" style="float: right;">
			<s:if test="%{#records.isFirstPage}">
			</s:if>
			<s:else>
			  <li><a href="#" onclick="gotoPage(1);">&laquo;</a></li>
			</s:else>
			<c:forEach begin="1" end="${records.totalPage}" varStatus="status">
				<c:if test="${records.currentPage == status.index}">
					  <li class="active"><a href="#" onclick="gotoPage(this);">${status.index}</a></li>
				</c:if>
				<c:if test="${records.currentPage != status.index}">
					  <li><a href="#" onclick="gotoPage(${status.index});">${status.index}</a></li>
				</c:if>
			 </c:forEach>
			  <li><a href="#" onclick="gotoPage(${records.totalPage});">&raquo;</a></li>
			</ul>
			<br>
			<div style="width: 100%; text-align: center; margin-top: 7px;">
				共查询到 ${records.totalRow} 条记录
<!-- 				<a href="/cost/graphic.html" class="btn btn-success" id="view">查看图形报表</a> -->
			</div>
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
	         	<s:include value="/view/unauthorized.jsp"></s:include>
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
	   <div class="modal-dialog" style="width: 300px; text-align: center;">
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
	   <div class="modal-dialog" style="width: 300px; text-align: center;">
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
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var date = new Date;
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var url = "/cost/statistics.html?year="+year+"&month="+month;
		$("#view").attr('href',url);
		$("#viewNormal").attr('href',url);
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
	
	$('#gallery2').rebox({ selector: 'a[cmd=attachment]' });

	
	function refreshPage(){
		var url = window.location.href;
		window.location.href = url;
	}
	
	function gotoPage(page){
		$("#currentPageId").val(page);
		$("#searchBtn").click();
	}
	
	function showQueryForm(){
		var status = $("#queryStatus").val();
		if(status == 0){
			$("#searchParamsFormResForPhone").slideDown(500);
			$("#queryText").html("收起");
			$("#queryStatus").val(1);
		}else if(status == 1){
			$("#searchParamsFormResForPhone").slideUp(500);
			$("#queryText").html("高级查询");
			$("#queryStatus").val(0);
		}
	}
</script>
</html>