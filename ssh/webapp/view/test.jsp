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
			<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
	
</body>
<script type="text/javascript">
var chart;

$(function() {
	$.ajax({
		url: "/cost/graphic.html?year=2015&month=11",
		type: "GET",
		success: function(data){
			console.debug(data);
		}
	});

	chart = new Highcharts.Chart({

	chart: {

		renderTo: 'container',

		type: 'column'

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

			'Jan',
		
			'Feb',
			
			'Mar',
			
			'Apr',
			
			'May',
			
			'Jun',
			
			'Jul',
			
			'Aug',
		
			'Sep',
			
			'Oct',
			
			'Nov',
			
			'Dec'

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
		
			return ''+this.x +': '+ this.y +' mm';
		
		}

	},

	plotOptions: {

		column: {

			pointPadding: 0.2,
	
			borderWidth: 0

		}

	},

	series: [{

			name: '韩晓军',
	
			data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

		}, {

			name: '胡丰盛',
			
			data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
		
		}, {
		
			name: '李洪亮',
			
			data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
		
		}]

	});

});

</script>
</html>