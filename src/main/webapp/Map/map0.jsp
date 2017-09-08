<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:100%;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Qied2a3vURUG89hlnnvVodf3"></script>
	<title>纯文本的信息窗口</title>
</head>
<body>
	<div id="allmap"></div>
	<p>点击标注点，可查看由纯文本构成的简单型信息窗口</p>
	<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var x = ${devAttr.getX_pos()};
	var y = ${devAttr.getY_pos()};
	var point = new BMap.Point(x,y);
	var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	map.centerAndZoom(point, 15);
	var opts = {
	  width : 200,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "海底捞王府井店" , // 信息窗口标题
	  enableMessage:true,//设置允许信息窗发送短息
	  message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
	}
	var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){        
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	});
</script>
<script type="text/javascript">
function aa(){

  $.ajax({
		type : "POST",
		url : "selectDevAttr",
		dataType : 'json',
		success : function (data){
			alert("hah");
			/* alert(eval(data)); */
			/* eval('(' +data + ')') */
			alert(data);
		}
	});
  alert("-+++++++-------");
}
</script>
</body>
</html>

