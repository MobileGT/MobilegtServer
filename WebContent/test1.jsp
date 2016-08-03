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
<title>统计特征表单</title>
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
			        		        data :['TCP总报文个数','UDP总报文个数',
			        		              'TCP总报文大小','UDP总报文大小',
			        		              'TCP报文最小长度','UDP报文最小长度',
			        		              'TCP报文平均长度','UDP报文平均长度',
			        		              'TCP报文最大长度','UDP报文最大长度',
			        		              'TCP报文均方差','UDP报文均方差',
			        		              'TCP报文到达时间间隔的最小值','UDP报文到达时间间隔的最小值',
			        		              'TCP报文到达时间间隔的平均值','UDP报文到达时间间隔的平均值',
			        		              'TCP报文到达时间间隔的均方差','UDP报文到达时间间隔的均方差',
			        		              'TCP流持续时间','UDP流持续时间',
			        		              'TCP URGENT包个数','UDP URGENT包个数',
			        		              'TCP PUSH包个数','UDP PUSH包个数',
			        		              'TCP无载荷报文个数','UDP无载荷报文个数']
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
			        		            name:'TCP总报文个数',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            itemStyle : dataStyle,
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP总报文大小',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP报文最小长度',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP报文平均长度',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP报文最大长度',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP报文均方差',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP报文到达时间间隔的最小值',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP报文到达时间间隔的平均值',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP报文到达时间间隔的均方差',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP流持续时间',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP URGENT包个数',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP PUSH包个数',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'TCP无载荷报文个数',
			        		            type:'bar',
			        		            stack: 'TCP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },			        		        
			        		        //UDP		        	
			        		        {
			        		            name:'UDP总报文个数',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP总报文大小',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP报文最小长度',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP报文平均长度',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP报文最大长度',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP报文均方差',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP报文到达时间间隔的最小值',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP报文到达时间间隔的平均值',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP报文到达时间间隔的均方差',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP流持续时间',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP URGENT包个数',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP PUSH包个数',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
			        		        },
			        		        {
			        		            name:'UDP无载荷报文个数',
			        		            type:'bar',
			        		            stack: 'UDP',
			        		            data:[0.023939, 0.279378, 0.803906, 0.738856,0.738856, 0.738856, 0.038856, 0.038856, 0.038856]
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
	<table class="easyui-datagrid" title="对照表" style="width:100%;height:390px;"
			data-options="singleSelect:true,collapsible:true,url:'contrast.json',method:'get'">
		<thead>
			<tr>
				<th data-options="field:'itemid'">序号</th>
				<th data-options="field:'statics'">数据报特征</th>
				<th data-options="field:'unit'">单位</th>
				<th data-options="field:'i1'">1</th>
				<th data-options="field:'i2'">2</th>
				<th data-options="field:'i3'">3</th>
				<th data-options="field:'i4'">4</th>
				<th data-options="field:'i5'">5</th>
				<th data-options="field:'i6'">6</th>
				<th data-options="field:'i7'">7</th>
				<th data-options="field:'i8'">8</th>
				<th data-options="field:'i9'">9</th>
				<th data-options="field:'i10'">10</th>
				<th data-options="field:'i11'">11</th>
			</tr>
		</thead>
	</table>
	</div>
	</body>
</html>