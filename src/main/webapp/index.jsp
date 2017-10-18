<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>NB-IOT物资定位管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/main.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/Public/img/dianxin.ico" rel="shotcut icon"/>
</head>
<!-- 	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		
		#shang{ float:left;width:80%;height:100%;} 
        #xia{ float:right;width:20%;height:100%;}
        #top{height:80%;}
        #bellow{height:20%;}
        .content{border:1px solid red}
        .dl-main-nav{border:1px solid pink}
        .J_NavContent{border:1px solid pink}

		p{margin-left:5px; font-size:14px;}
	</style> -->
<!-- 	<style type="text/css">
/* 		.content{border:1px solid red}
        .J_NavContent{border:1px solid red} */
        .tab-content-container{border:1px solid red}

	</style> -->
<body>

<div class="header">

    <div class="dl-title">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>

    <div class="dl-log">欢迎您，<span class="dl-log-user">${username}</span><a href="Public/login.jsp" title="退出系统" class="dl-log-quit">[退出]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform">
        	<div class="dl-inform-title"></div>
        </div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">监控中心</div></li>
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">实时数据</div></li>
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">告警管理</div></li>
<!--             <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">统计分析</div></li> -->
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-order">仓储管理</div></li>
			<li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="assets/js/bui-min.js"></script>
<script type="text/javascript" src="assets/js/common/main-min.js"></script>
<script type="text/javascript" src="assets/js/config-min.js"></script>
<script>
    BUI.use('common/main',function(){
       var config = [
			         {id:'7',homePage : '9',menu:[{text:'地图站点',items:[{id:'9',text:'物资定位',href:'listDevAttrByPage'}/* ,{id:'9',text:'查询站点测试',href:'listDevAttrTest'},{id:'9',text:'查询站点测试2',href:'listDevAttrTest2'} */]}]}
			        ,{id:'11',homePage : '11',menu:[{text:'实时数据',items:[{id:'11',text:'实时数据',href:'listDevRealtimeData'},{id:'31',text:'历史数据',href:'listDevHisDataByPage'}]}]}
			        ,{id:'12',homePage : '12',menu:[{text:'告警管理',items:[{id:'12',text:'当前告警',href:'listDevAlarmNow'},{id:'32',text:'历史告警',href:'listDevAlarm'},{id:'42',text:'告警配置',href:'alarmDef'}]}]}
/* 			        ,{id:'13',homePage : '13',menu:[{text:'统计分析',items:[{id:'13',text:'图形曲线',href:'chart.jsp'},{id:'33',text:'统计报表',href:'Warning/index1.html'}]}]} */
			        ,{id:'15',homePage : '15',menu:[{text:'仓储管理',items:[{id:'14',text:'分类管理',href:'selectTypeList'},{id:'15',text:'入库管理',href:'listStockIn'},{id:'35',text:'出库管理',href:'listStockOut'}]}]}
			        ,{id:'1',homePage : '4',menu:[{text:'系统管理',items:[{id:'4',text:'用户管理',href:'selectUserList'},{id:'4',text:'帮助',href:'help.jsp'}]}]}
			        ,{id:'17',homePage : '17',menu:[{text:'历史轨迹',items:[{id:'17',text:'历史轨迹',href:'Stock/index.html'}]}]}
			        ];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
/*     href:'JavaScript:void(0);" onClick="aa()"' */
</script>

<div style="text-align:center;">
</div>
</body>
</html>