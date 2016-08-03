




<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<base href = "http://115.28.91.223:80/tas/">
<title>Six tuple</title>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/default/easyui.css"/>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/icon.css"/>
<link rel="stylesheet" type="text/css" href="resource/easyui/themes/color.css"/>
<script type="text/javascript" src="resource/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="resource/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="resource/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="resource/js/echart/echarts.js"></script><!-- 百度¦echarts2.2.7 -->
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
            'echarts/echarts-all'
        ],
        function (ec, ct) {

            $.getJSON('./data/nutrients.json', function (data) {
                echarts = ec;
                colorTool = ct;

                normalizeData(data);

                chart = myChart = echarts.init(document.getElementById('main'));

                console.time('render');
                chart.setOption(getOption(data));
                console.timeEnd('render');

                chart.on('axisAreaSelected', function (event) {
                    // var indices = chart.getModel().getSeries()[0].getRawIndicesByActiveState('active');
                    // console.log('北京: ', indices);
                });

            });

            var indices = {
                name: 0,
                group: 1,
                id: 16
            };
            var schema = [
                {name: 'name', index: 0},
                {name: 'group', index: 1},
                {name: 'protein', index: 2},
                {name: 'calcium', index: 3},
                {name: 'sodium', index: 4},
                {name: 'fiber', index: 5},
                {name: 'vitaminc', index: 6},
                {name: 'potassium', index: 7},
                {name: 'carbohydrate', index: 8},
                {name: 'sugars', index: 9},
                {name: 'fat', index: 10},
                {name: 'water', index: 11},
                {name: 'calories', index: 12},
                {name: 'saturated', index: 13},
                {name: 'monounsat', index: 14},
                {name: 'polyunsat', index: 15},
                {name: 'id', index: 16}
            ];

            function normalizeData(originData) {
                var groupMap = {};
                originData.forEach(row => {
                    var groupName = row[indices.group];
                    if (!groupMap.hasOwnProperty(groupName)) {
                        groupMap[groupName] = 1;
                    }
                });

                originData.forEach(row => {
                    row.forEach((item, index) => {
                        if (index !== indices.name
                            && index !== indices.group
                            && index !== indices.id
                        ) {
                            // Convert null to zero, as all of them under unit "g".
                            row[index] = parseFloat(item) || 0;
                        }
                    });
                });

                for (var groupName in groupMap) {
                    if (groupMap.hasOwnProperty(groupName)) {
                        groupCategories.push(groupName);
                    }
                }
                var hStep = Math.round(300 / (groupCategories.length - 1));
                for (var i = 0; i < groupCategories.length; i++) {
                    groupColors.push(colorTool.modifyHSL('#5A94DF', hStep * i));
                }
            }

            function getOption(data) {

                var lineStyle = {
                    normal: {
                        width: 0.5,
                        opacity: 0.05
                        // shadowBlur: 10,
                        // shadowOffsetX: 0,
                        // shadowOffsetY: 0,
                        // shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                };

                return {
                    backgroundColor: '#333',
                    tooltip: {
                        padding: 10,
                        backgroundColor: '#222',
                        borderColor: '#777',
                        borderWidth: 1,
                        formatter: function (obj) {
                            var value = obj[0].value;
                            return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
                                + schema[1].name + '：' + value[1] + '<br>'
                                + schema[2].name + '：' + value[2] + '<br>'
                                + schema[3].name + '：' + value[3] + '<br>'
                                + schema[4].name + '：' + value[4] + '<br>'
                                + schema[5].name + '：' + value[5] + '<br>'
                                + schema[6].name + '：' + value[6] + '<br>';
                        }
                    },
                    title: [
                        {
                            text: 'Groups',
                            top: 0,
                            left: 0,
                            textStyle: {
                                color: '#fff'
                            }
                        }
                    ],
                    visualMap: {
                        show: true,
                        type: 'piecewise',
                        categories: groupCategories,
                        dimension: indices.group,
                        inRange: {
                            color: groupColors //['#d94e5d','#eac736','#50a3ba']
                        },
                        outOfRange: {
                            color: ['#ccc'] //['#d94e5d','#eac736','#50a3ba']
                        },
                        top: 20,
                        textStyle: {
                            color: '#fff'
                        },
                        realtime: false
                    },
                    parallelAxis: [
                        {dim: 16, name: schema[16].name, scale: true, nameLocation: 'end'},
                        {dim: 2, name: schema[2].name, nameLocation: 'end'},
                        {dim: 4, name: schema[4].name, nameLocation: 'end'},
                        {dim: 3, name: schema[3].name, nameLocation: 'end'},
                        {dim: 5, name: schema[5].name, nameLocation: 'end'},
                        {dim: 6, name: schema[6].name, nameLocation: 'end'},
                        {dim: 7, name: schema[7].name, nameLocation: 'end'},
                        {dim: 8, name: schema[8].name, nameLocation: 'end'},
                        {dim: 9, name: schema[9].name, nameLocation: 'end'},
                        {dim: 10, name: schema[10].name, nameLocation: 'end'},
                        {dim: 11, name: schema[11].name, nameLocation: 'end'},
                        {dim: 12, name: schema[12].name, nameLocation: 'end'},
                        {dim: 13, name: schema[13].name, nameLocation: 'end'},
                        {dim: 14, name: schema[14].name, nameLocation: 'end'},
                        {dim: 15, name: schema[15].name, nameLocation: 'end'}
                    ],
                    parallel: {
                        left: 280,
                        top: 20,
                        // top: 150,
                        // height: 300,
                        width: 400,
                        layout: 'vertical',
                        parallelAxisDefault: {
                            type: 'value',
                            name: 'nutrients',
                            nameLocation: 'end',
                            nameGap: 20,
                            nameTextStyle: {
                                color: '#fff',
                                fontSize: 14
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
                            },
                            realtime: false
                        }
                    },
                    animation: false,
                    series: [
                        {
                            name: 'nutrients',
                            type: 'parallel',
                            lineStyle: lineStyle,
                            inactiveOpacity: 0,
                            activeOpacity: 0.01,
                            progressive: 500,
                            smooth: true,
                            data: data
                        }
                    ]
                };
            }

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