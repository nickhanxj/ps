<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="/view/context.jsp"/>
<link href="/css/homepage.css" rel="stylesheet">
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<title>新增消费记录</title>
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
			<div style="width: 100%;">
				<s:form action="/cost/add.html" method="post">
					<table>
						<tr>
							<td class="textright">消费人：</td>
							<td class="textcenter">
								<s:select name="record.user" list="#{1:'韩晓军',2:'胡丰盛',3:'李洪亮'}" cssStyle="width: 160px;"></s:select>
							</td>
						</tr>
						<tr>
							<td class="textright">消费金额：</td>
							<td class="textcenter">
								<s:textfield name="record.cost" placeholder="消费金额"/>
							</td>
						</tr>
						<tr>
							<td class="textright">消费用途：</td>
							<td class="textcenter">
								<s:textfield name="record.costFor" placeholder="消费用途"/>
							</td>
						</tr>	
						<tr>
							<td class="textright">消费时间：</td>
							<td class="textcenter">
								<s:textfield name="record.costdate" onClick="WdatePicker()" placeholder="消费时间"/>
							</td>
						</tr>
						<tr>
							<td class="textright">备注：</td>
							<td class="textcenter">
								<s:textarea name="record.mark" placeholder="消费备注" rows="5"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="textcenter">
								<s:submit value="保存" cssClass="btn btn-success"/>
								<a href="/cost/list.html" class="btn btn-warning">取消</a>
							</td>
						</tr>				
					</table>
				</s:form>
			</div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
</body>
</html>