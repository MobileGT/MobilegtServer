<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<base href = "<%=basePath%>">
<title>Mobile Traffic Flow Statistic</title>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/color.css"/>
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resource/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resource/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="resource/js/echart/echarts.js"></script><!-- 百度echarts2.2.7 -->
<style type="text/css">
html,body{font-family:Microsoft YaHei;}
</style>

<script type="text/javascript">
require.config({
    paths:{
        echarts:'./resource/js/echart'
    }
});
require(
        [
            'echarts/echarts.min'
        ],
        function(ec) {
            var myChart = ec.init(document.getElementById('main'));
			          var lineStyle = {
			              normal: {
			                  width: 1,
			                  opacity: 0.5
			              }
			          };
			          var dataStyle = {
			        		  show :false,
			        		    normal : {
			        		        label : {
			        		            show : false,
			        		            position : 'insideLeft',
			        		            formatter : '{c}',
			        		            textStyle : {
			        		                color : '#000'
			        		            }
			        		        }
			        		    }
			          };
			          option = {
			        		    tooltip : {
			        		        trigger : 'item',
			        		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			        		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        		        }
			        		    },
			        		    legend: {
			        		        data :['tcp totalNum','udp totalNum',
			        		              'tcp totalSize','udp totalSize',
			        		              'tcp minSize','udp minSize',
			        		              'tcp aveSize','udp aveSize',
			        		              'tcp maxSize','udp maxSize',
			        		              'tcp meanSize','udp meanSize',
			        		              'tcp minTime','udp minTime',
			        		              'tcp aveTime','udp aveTime',
			        		              'tcp meanTime','udp meanTime',
			        		              'tcp durationTime','udp durationTime',
			        		              'tcp urgent','udp urgent',
			        		              'tcp pushNum','udp pushNum',
			        		              'tcp invalid load','udp invalid load'],
			        		              selected : {
				        		              'tcp totalSize': false,
				        		              'udp totalSize': false,
				        		              'tcp minSize': false,
				        		              'udp minSize': false,
				        		              'tcp aveSize': false,
				        		              'udp aveSize': false,
				        		              'tcp maxSize': false,
				        		              'udp maxSize': false,
				        		              'tcp meanSize': false,
				        		              'udp meanSize': false,
				        		              'tcp minTime': false,
				        		              'udp minTime': false,
				        		              'tcp aveTime': false,
				        		              'udp aveTime': false,
				        		              'tcp meanTime': false,
				        		              'udp meanTime': false,
				        		              'tcp durationTime': false,
				        		              'udp durationTime': false,
				        		              'tcp urgent': false,
				        		              'udp urgent': false,
				        		              'tcp pushNum': false,
				        		              'udp pushNum': false,
				        		              'tcp invalid load': false,
				        		              'udp invalid load': false
						                  },
			        		    },
			        		    grid: {
			        		        left: '3%',
			        		        right: '4%',
			        		        top: '12%',
			        		        bottom: '3%',
			        		        containLabel: true
			        		    },
			        		    xAxis : [
			        		        {
			        		            type : 'category',
			        		            data : ['0','1','2','3','4','5','6','7','8','9','10','11']
			        		        }
			        		    ],
			        		    yAxis : [
			        		        {
			        		            type : 'value'
			        		        }
			        		    ],
			        		    series : [
			        		        {
			        		            name:'tcp totalNum',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            itemStyle : dataStyle,
			        		            data:[0.565789,0.276316,0.026316,0.065789,0.065789]
			        		        },
			        		        {
			        		            name:'tcp totalSize',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0,0,0.026316,0.276316,0.605263,0.092105]
			        		        },
			        		        {
			        		            name:'tcp minSize',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0,0,0.842105,0.157895]
			        		        },
			        		        {
			        		            name:'tcp aveSize',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.065789,0.052632,0.355263,0.223684,0.078947,0.131579,0.092105]
			        		        },
			        		        {
			        		            name:'tcp maxSize',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.026316,0.065789,0.907895]
			        		        },
			        		        {
			        		            name:'tcp meanSize',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.039474,0.039474,0.026316,0.026316,0.289474,0.289474,0.223684,0.065789]
			        		        },
			        		        {
			        		            name:'tcp minTime',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[1.0,0,0,0,0]
			        		        },
			        		        {
			        		            name:'tcp aveTime',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.026316,0.684211,0.276316,0.013158]
			        		        },
			        		        {
			        		            name:'tcp meanTime',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.013158,0.052632,0.815789,0.105263,0.013158]
			        		        },
			        		        {
			        		            name:'tcp durationTime',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0,0.013158,0.078947,0.763158,0.118421,0.026316]
			        		        },
			        		        {
			        		            name:'tcp urgent',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0,0.052632,0.197368,0.184211,0.144737,0.157895,0.039474,0.013158,0.039474,0.013158,0.157895]
			        		        },
			        		        {
			        		            name:'tcp pushNum',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[1.0,0,0,0,0,0]
			        		        },
			        		        {
			        		            name:'tcp invalid load',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.434211,0.434211,0.065789,0.026316,0.026316,0,0,0,0,0,0.013158]
			        		        },			        		        
			        		        //UDP		        	
			        		        {
			        		            name:'udp totalNum',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp totalSize',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp minSize',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp aveSize',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp maxSize',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp meanSize',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp minTime',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp aveTime',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp meanTime',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp durationTime',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp urgent',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp pushNum',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        },
			        		        {
			        		            name:'udp invalid load',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0]
			        		        }
			        		    ]
			        		};
          myChart.setOption(option);
      }
);
</script>
</head>
	<body>
	<div id="main" style="height:650px;width:100%;"></div>
	<div id="content" style="height:400px;width:100%;">
	<table class="easyui-datagrid" title="Comparison table" style="width:100%;height:390px;"
			data-options="singleSelect:true,collapsible:true,url:'contrast.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'itemid'">order</th>
				<th data-options="field:'statics'">data feature</th>
				<th data-options="field:'unit'">unit</th>
				<th data-options="field:'i1'">0</th>
				<th data-options="field:'i2'">1</th>
				<th data-options="field:'i3'">2</th>
				<th data-options="field:'i4'">3</th>
				<th data-options="field:'i5'">4</th>
				<th data-options="field:'i6'">5</th>
				<th data-options="field:'i7'">6</th>
				<th data-options="field:'i8'">7</th>
				<th data-options="field:'i9'">8</th>
				<th data-options="field:'i10'">9</th>
				<th data-options="field:'i11'">10</th>
			</tr>
		</thead>
	</table>
	</div>
	</body>
</html>