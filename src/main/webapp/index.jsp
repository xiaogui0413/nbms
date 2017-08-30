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
        <div class="dl-inform"><div class="dl-inform-title"></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>		<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">业务管理</div></li>

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
        var config = [{id:'1',menu:[{text:'系统管理',items:[{id:'3',text:'角色管理',href:'Role/index.html'},{id:'4',text:'用户管理',href:'User/index.html'},{id:'6',text:'菜单管理',href:'Menu/index.html'}]}]},{id:'7',homePage : '9',menu:[{text:'地图站点',items:[{id:'9',text:'查询站点',href:'listDevAttr'}]}]}];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
/*     href:'JavaScript:void(0);" onClick="aa()"' */
</script>
<!-- <script type="text/javascript">
function aa(){
	alert("aa");
	$.ajax({
		type : "POST",
		url : "listDevAttr",
		dataType : 'json',
		success : function (devAttr){
			
		}
	});
	alert("yoxi");
}
</script> -->
<!-- <script type="text/javascript">
setInterval(function() {
	  $(".tab-content-container").load(location.href+"listDevAttr");
	}, 1000);
	alert("hah");
</script> -->

<div style="text-align:center;">
<!-- <p>来源：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p> -->
</div>
</body>
</html>