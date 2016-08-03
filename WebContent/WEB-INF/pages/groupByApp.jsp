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
<title>Six tuple</title>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/color.css"/>
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resource/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resource/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="resource/js/echart/echarts.js"></script><!-- 百度echarts2.2.7 -->
<style type="text/css">
html,body{font-family:Microsoft YaHei;width:100%;margin-left:0px;margin-top:0px;}
a{
	text-decoration:none;
}
.line{
	width:90%;height:100%;margin:0 auto;
}
.header{
	background: #FFFFFF;
	border-bottom: 7px solid rgba(192, 192, 192, 0.31);
	position: fixed;
	top: 0px;
	z-index: 5;
	opacity: 0.97;
	width:100%;
	height:50px;
}
.mytitle{
    margin-top:5px;
	float:left;
	height:100%;
}
.mytitle a{
	font-family: 'Verdana';
	color: #2a323a;
	font-size: 25px;
	display: block;
	padding: 6px;
}
.navigation{
	float:right;
}
.navigation ul li{
	display:inline-block;
}
.navigation ul li a{
	font-family: 'Verdana';
	color: #2a323a;
	padding: 0px 10px 0px 10px;
}
.navigation li.active> a, .navigation li> a:hover {
	color: #DC911F;
}
.navigation ul li ul {
	position: absolute;
	display: none;
	padding: 5px 0px 5px 0px;
}
.navigation ul li ul li {
	float: none;
	font-family: 'Verdana';
}
.navigation ul li ul li a{
	line-height: 40px;
	padding-top: 5px;
	padding-bottom: 5px;
	border-right: none;
	border-top: 1px dotted #ccc;
	background: #f5f5f5;
	font-family: 'Verdana';
	font-size: 15px; 
	color: #808080;
}
.navigation ul li:hover ul{
	display:block;
}
.clear{
	clear:both;
}
</style>
<script type="text/javascript">

//6元组图表
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
            var dataBJ=[${app6groupMap.rows[0].streams}];
			var lineStyle = {
			              	normal: {
				                width: 1,
				                opacity: 0.5
			                	}
			          		};
			var schema = [
			              {name: 'sourceIpGroupn', index: 0, text: 'sourceIp'},
			              {name: 'protocolGroupn', index: 1, text: 'protocol'},
			              {name: 'sourcePortGroupn', index: 2, text: 'sourcePort'},
			              {name: 'destinationPortGroupn', index: 3, text: 'destinationPort'},
			              {name: 'destinationIpGroupn', index: 4, text: 'destinationIp'},
			              {name: 'appNameGroupn', index: 5, text: 'appName'}
			              /* {name: 'versionGroupn', index: 6, text: 'version'},
			              {name: 'streamNumn', index: 7, text: 'number'} */,
			          ];
			var protocolGroups=${app6groupMap.rows[0].protocolGroup};
			var sourceIpGroups=${app6groupMap.rows[0].sourceIpGroup};
			var sourcePortGroups=${app6groupMap.rows[0].sourcePortGroup};
			var destinationIpGroups=${app6groupMap.rows[0].destinationIpGroup};
			var destinationPortGroups=${app6groupMap.rows[0].destinationPortGroup};
			var appNameGroups=${app6groupMap.rows[0].appNameGroup};
			var versionGroups=${app6groupMap.rows[0].versionGroup};			          
			option = {
			              backgroundColor: '#333',
			              legend: {
			                  bottom: 20,
			                  data: ['六元组通信图'],
			                  itemGap: 200,
			                  textStyle: {
			                      color: '#fff',
			                      fontSize: 14
			                  }
			              },
			              tooltip: {
			                  padding: 5,
			                  backgroundColor: '#222',
			                  borderColor: '#777',
			                  borderWidth: 1,
			                  formatter: function (obj) {
			                      var value = obj[0].value;
			                      return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
			                          + obj[0].seriesName + ' ' + value[0] + '日期：'
			                          //+ value[1]
			                          + '</div>'
			                          + schema[1].text + '：' + value[1] + '<br>'
			                          + schema[2].text + '：' + value[2] + '<br>'
			                          + schema[3].text + '：' + value[3] + '<br>'
			                          + schema[4].text + '：' + value[4] + '<br>'
			                          + schema[5].text + '：' + value[5] + '<br>'
			                         /*  + schema[6].text + '：' + value[6] + '<br>'
			                          + schema[7].text + '：' + value[7] + '<br>' */;
			                  }
			              },
			              parallelAxis: [
			                  {dim: 0, name: schema[0].text, type: 'category', data: sourceIpGroups},
			                  {dim: 1, name: schema[1].text, type: 'category', data: protocolGroups},
			                  {dim: 2, name: schema[2].text, type: 'category', data: sourcePortGroups},
			                  {dim: 3, name: schema[3].text, type: 'category', data: destinationPortGroups},
			                  {dim: 4, name: schema[4].text, type: 'category', data: destinationIpGroups},
			                  {dim: 5, name: schema[5].text, type: 'category', data: appNameGroups}
			                  /* {dim: 6, name: schema[6].text, type: 'category', data: versionGroups},
			                  {dim: 7, name: schema[7].text} */
			              ],
			              visualMap: {
			                  show: true,
			                  min: 0,
			                  max: 20,
			                  dimension: 2,
			                  inRange: {
			                      color: ['#eac736','#d94e5d','#50a3ba'].reverse(),
			                  }
			              },
			              parallel: {
			                  left: '15%',
			                  right: '15%',
			                  bottom: 45,
			                  parallelAxisDefault: {
			                      type: 'value',
			                      name: '六元组',
			                      nameLocation: 'end',
			                      nameGap: 20,
			                      nameTextStyle: {
			                          color: '#fff',
			                          fontSize: 12
			                      },
			                      axisLine: {
			                          lineStyle: {
			                              color: '#aaa'
			                          }
			                      },
			                      axisTick: {
			                          lineStyle: {
			                              color: '#777'
			                          }
			                      },
			                      splitLine: {
			                          show: false
			                      },
			                      axisLabel: {
			                          textStyle: {
			                              color: '#fff'
			                          }
			                      }
			                  }
			              },
			              series: [
			                  {
			                      name: '六元组通讯图',
			                      type: 'parallel',
			                      lineStyle: lineStyle,
			                      data: dataBJ
			                  }
			              ]
			          };
          myChart.setOption(option);
      }
);
</script>
</head>
	<body>
		<div class="header">
		<div class="line">
			<div class="mytitle"><a href="./index">MMTAS</a></div>
			<div class="navigation">
				<ul>
					<li><form name="getGroupByAppForm" action="getGroupByApp" method="post">
						<input id="sourceIp" name="sourceIp" class="easyui-textbox" data-options="prompt:'sourceIp'" style="width:100px;">
						<input id="appName" name="appName" class="easyui-textbox" data-options="prompt:'appName'" style="width:100px;">
						<input id="date" name="date" class="easyui-datetimebox" data-options="prompt:'date'" style="width:180px;">
						<input id="sub"  class="easyui-linkbutton" type="submit" value=" search " style="height:25px;"/>
						</form>
					</li>
				</ul>
			</div>
			<div class="navigation">
				<ul>
					<li><a href="./index">network communication diagram</a>
						<ul>
							<li><a href="./index">5 minutes to show</a></li>
							<li><a href="./groupByApp">according to the sourceIp~appName</a></li>
						</ul>
					</li>
					<li><a href="./statistics">statistical feature form</a></li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<div style="background-color:#333;height:70px;"></div>
	<div id="main" style="height:585px;width:100%;"></div>
	</body>
</html>