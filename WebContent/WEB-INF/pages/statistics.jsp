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
<title>Statistical feature form</title>
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
	<div style="background-color:#ffffff;height:80px;"></div>
		<table id="appStatistics" class="easyui-datagrid" title="" style="width:auto;height:555px;"
			data-options="rownumbers:true,
				singleSelect:true,
				autoRowHeight:false,
				pagination:true,
				pageSize1:50,url:'getAppStatistics',method:'post'">
		<thead>
			<tr>
				<th data-options="field:'date'">date</th>
				<th data-options="field:'sourceIp'">sourceIp</th>
				<th data-options="field:'protocol'">protocol</th>
				<th data-options="field:'sourcePort'">sourcePort</th>
				<th data-options="field:'destinationPort'">destinationPort</th>
				<th data-options="field:'destinationIp'">destinationIp</th>
				<th data-options="field:'appName'">appName</th>
				<th data-options="field:'version'">version</th>
				<th data-options="field:'totalNum'">totalNum</th>
				<th data-options="field:'totalSize'">totalSize</th>
				<th data-options="field:'minSize'">minSize</th>
				<th data-options="field:'aveSize'">aveSize</th>
				<th data-options="field:'maxSize'">maxSize</th>
				<th data-options="field:'meanSize'">meanSize</th>
				<th data-options="field:'minTime'">minTime</th>
				<th data-options="field:'aveTime'">aveTime</th>
				<th data-options="field:'meanTime'">meanTime</th>
				<th data-options="field:'duration'">durationTime</th>
				<th data-options="field:'urgentNum'">urgentNum</th>
				<th data-options="field:'pushNum'">pushNum</th>
				<th data-options="field:'loadNum'">invalid load</th>
			</tr>
		</thead>
	</table>
	</body>
</html>