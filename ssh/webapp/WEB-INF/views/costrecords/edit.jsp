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
<title>编辑消费记录</title>
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
	/*手机*/
	 @media screen and (max-width:600px){
	 	.body-container{
	 		width: 100%;
	 	}
	 	.textright{
			display: none;
		}
		#uploadDiv{
	 		border: 1px solid lightblue; 
	 		width: 100%; 
	 		margin-left: auto; 
	 		margin-right: auto;
	 	}
	 }
	 /*平板*/
	 @media screen and (min-width:600px) and (max-width:960px){
	
	 }
	 /*PC*/
	 @media screen and (min-width:960px){
	 	#uploadDiv{
	 		border: 1px solid lightblue; 
	 		width: 50%; 
	 		margin-left: auto; 
	 		margin-right: auto;
	 	}
	 }
	 #uploadDiv{
 		display: none;
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
				<s:form action="/cost/update.html" method="post">
					<s:hidden name="record.attachment" value="%{#record.attachment}" id="attachment"/>
					<s:hidden name="record.id" value="%{#record.id}"/>
					<table>
						<tr>
							<td class="textright">消费人：</td>
							<td class="textcenter">
								<s:select name="record.user" value="#record.user" list="#{1:'韩晓军',2:'胡丰盛',3:'李洪亮'}" cssStyle="width: 160px;"></s:select>
							</td>
						</tr>
						<tr>
							<td class="textright">消费金额：</td>
							<td class="textcenter">
								<s:textfield name="record.cost"  value="%{#record.cost}" placeholder="消费金额"/>
							</td>
						</tr>
						<tr>
							<td class="textright">消费用途：</td>
							<td class="textcenter">
								<s:textfield name="record.costFor" value="%{#record.costFor}" placeholder="消费用途"/>
							</td>
						</tr>	
						<tr>
							<td class="textright">消费时间：</td>
							<td class="textcenter">
								<s:textfield name="record.costdate" value="%{#record.costdate}" onClick="WdatePicker()" readonly="true" placeholder="消费时间"/>
							</td>
						</tr>
						<tr>
							<td class="textright">备注：</td>
							<td class="textcenter">
								<s:textarea name="record.mark" value="%{#record.mark}" placeholder="消费备注" rows="5"/>
							</td>
						</tr>
						<tr>
							<td class="textright">附件：</td>
							<td class="textcenter">
								<img alt="" src="${record.attachment}" width="100px;" id="fujian">
							</td>
						</tr>
						<tr>
							<td class="textright">选择附件：</td>
							<td class="textcenter">
								<a href="javascript:void(0)" onclick="slideDown()" class="btn btn-info">重新上传附件</a>
							</td>
						</tr>
						<tr>
							<td colspan="2"class="textcenter" >
								<div id="uploadDiv">
									<div class="modal-header">
						            <button type="button" class="close" 
						               data-dismiss="modal" aria-hidden="true" onclick="javascript:$('#uploadDiv').slideUp(1000);">
						                  &times;
						            </button>
						            <h4 class="modal-title" id="myModalLabel">
						        		       上传附件
						            </h4>
						         </div>
						         <div class="modal-body">
						    		<div class="row fileupload-buttonbar" style="padding-left:15px;">  
									    <div class="thumbnail ">  
										    <img id="weixin_show" style="height:180px;margin-top:10px;margin-bottom:8px;"  src="/images/upload/defaultImg.jpg" data-holder-rendered="true">  
										    <div class="progress progress-striped active" role="progressbar" aria-valuemin="10" aria-valuemax="100" aria-valuenow="0"><div id="weixin_progress" class="progress-bar progress-bar-success" style="width:0%;"></div></div>  
										    <div class="caption" align="center">  
										    <span id="weixin_upload" class="btn btn-primary fileinput-button">  
										    <span>上传</span>  
										    <input type="file" id="weixin_image" name="file" multiple>  
										    </span>  
										    <a id="weixin_cancle" href="javascript:void(0)" class="btn btn-warning" role="button" onclick="cancleUpload('weixin')" style="display:none">删除</a>  
										    </div>  
									    </div>  
								    </div> 
						         </div>
						         <div class="modal-footer">
						         	<span id="uploadBtn"></span>
						            <button type="button" class="btn btn-default" 
						               data-dismiss="modal" id="closeBtn" onclick="javascript:$('#uploadDiv').slideUp(1000);">关闭
						            </button>
						         </div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="textcenter">
								<s:submit value="更新" cssClass="btn btn-success"/>
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
<script type="text/javascript">
	$(function(){
		$("#weixin_image").fileupload({  
	        url: '/cost/uploadPhoto.html',  
	        sequentialUploads: true  
	    }).bind('fileuploadprogress', function (e, data) {  
	        var progress = parseInt(data.loaded / data.total * 100, 10);  
	        $("#weixin_progress").css('width',progress + '%');  
	        $("#weixin_progress").html(progress + '%');  
	    }).bind('fileuploaddone', function (e, data) { 
	    	console.debug(data.result.url);
	    	$("#attachment").val(data.result.url);
	        $("#weixin_show").attr("src",data.result.url);  
	        $("#fujian").attr("src",data.result.url);  
	        $("#weixin_upload").css({display:"none"});  
	        $("#weixin_cancle").css({display:""}); 
	        $("#uploadBtn").html("<font color='blue'>上传成功！</font>");
	        $("#msg").html("<font color='blue'>上传成功！</font>");
	    });  
	});
	
	function slideDown(){
		$('#uploadDiv').slideDown(1000);
	}
</script>
</html>