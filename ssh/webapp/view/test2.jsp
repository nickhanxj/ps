<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test</title>
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />
<%@taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="/view/context.jsp"/>
<script type="text/javascript" src="/js/Highcharts-4.0.3/js/highcharts.js"></script>
<style type="text/css">
	.btn{
		background-color: #E3E3E3;
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
				<span onclick="init('column')" class="btn">柱形</span>
				<span onclick="init('line')" class="btn">折线</span>
				<span onclick="init('spline')" class="btn">弧线</span>
				<span onclick="init('scatter')" class="btn">点</span>
				<span onclick="init('area')" class="btn">区域</span>
			</div>
			<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
	
</body>
<script type="text/javascript">
var chart;

$(function() {
	init("column");
});

function init(type){
	var data;
	$.ajax({
		url: "/cost/graphic.html?year=2015&month=11",
		type: "GET",
		async: false,
		success: function(rdata){
			data = rdata;
		}
	});

	chart = new Highcharts.Chart({

	chart: {

		renderTo: 'container',

		type: type

	},

		title: {

		text: '消费记录统计图-2015'

	},

	subtitle: {

		text: '来源：www.personalspace.cn'

	},

	xAxis: {
		title: {

			text: '时间'
		
		},

		categories: [

			'一月',
		
			'二月',
			
			'三月',
			
			'四月',
			
			'五月',
			
			'六月',
			
			'七月',
			
			'八月',
		
			'九月',
			
			'十月',
			
			'十一月',
			
			'十二月'

		]
	
	},

	yAxis: {

		min: 0,

		title: {

			text: '金额 (￥)'
		
		}
		
	},

	legend: {

		layout: 'vertical',

		backgroundColor: '#FFFFFF',
		
		align: 'left',
		
		verticalAlign: 'top',
		
		x: 100,

		y: 70,
		
		floating: true,
		
		shadow: true
		
	},

	tooltip: {

		formatter: function() {
		
			return ''+this.x +': '+ this.y +' 元';
		
		}

	},

	plotOptions: {

		column: {

			pointPadding: 0.2,
	
			borderWidth: 0

		}

	},

	series: data

	});
}

</script>
</html>