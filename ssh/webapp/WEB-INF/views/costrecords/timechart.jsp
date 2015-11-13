<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日消费折线图</title>
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
			<div style="width: 100%;"><a href="/cost/list.html" class="btn btn-small">&lt;&lt;返回列表</a></div>
			<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
		</div>
	</div>
	<s:include value="/view/footer.jsp"/>
	
</body>
<script type="text/javascript">
var chart;

$(function () {
	var data;
	$.ajax({
		url: "/cost/timing.html?year=2015&month=11",
		type: "GET",
		async: false,
		success: function(rdata){
			data = rdata;
		}
	});
	chart = new Highcharts.Chart({
        chart: {
        	renderTo: 'container',
            zoomType: 'x',
            spacingRight: 20
        },
        title: {
            text: '2015年消费走势'
        },
        subtitle: {
            text: document.ontouchstart === undefined ?
                '按住鼠标左键选择区域查看放大信息' :
                'Pinch the chart to zoom in'
        },
        xAxis: {
            type: 'datetime',
            maxZoom: 14 * 24 * 3600000, // fourteen days
            title: {
                text: null
            }
        },
        yAxis: {
            title: {
                text: '金额(￥)'
            }
        },
        tooltip: {
            shared: true
        },
        legend: {
            enabled: false
        },
        plotOptions: {
            area: {
                fillColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1},
                    stops: [
                        [0, Highcharts.getOptions().colors[0]],
                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                    ]
                },
                lineWidth: 1,
                marker: {
                    enabled: false
                },
                shadow: false,
                states: {
                    hover: {
                        lineWidth: 1
                    }
                },
                threshold: null
            }
        },

        series: [{
            type: 'area',
            name: '消费额',
            pointInterval: 24 * 3600 * 1000,
            pointStart: Date.UTC(2015, 11, 04),
            data: data
        }]
    });
});

</script>
</html>