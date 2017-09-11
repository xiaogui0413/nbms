<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	      <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		
		#shang{ float:left;width:80%;height:100%;}
        #xia{ float:right;width:20%;height:100%;}
        #top{height:80%;}
        #bellow{height:20%;}

		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Qied2a3vURUG89hlnnvVodf3"></script>
	<!-- <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script> -->
	<script src="http://lib.sinaapp.com/js/jquery/2.0.2/jquery-2.0.2.min.js"></script>	
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>给多个点添加信息窗口</title>

</head>
<body>
<div id="top">
<div id="shang">

</div>
<div id="xia">
<table id="offerTable"
	class="table table-bordered table-condensed table-hover table-striped"
	style="padding: 1px; margin: 0px;">
	<thead>
		<tr>
			<!-- <th></th> -->
			<th>设备ID</th>
			<th>设备名称</th>
			<th>状态</th>
			<!-- <th>经度</th> -->
			<th>操作</th>
			<th>操作</th>
		</tr>
	</thead>
		<c:forEach var="u" items="${devAttr }">
		<tr>
		   <!-- <td><input type="checkbox"></td> -->
		   
		    <td>${u.sn }</td>
			<td>${u.sDevName }</td>
			<td align="center">
			<c:choose>
				<c:when test="${u.nState eq '-1' }">离线
				</c:when>
				<c:when test="${u.nState eq '1' }">在线
				</c:when>
				<c:otherwise>
				--
				</c:otherwise>
			</c:choose>
			</td>
		
			<%-- <td>${u.x_pos }</td> --%>
			<!-- 用于控制浮点数的不同位数按照格式输出 -->
			<%-- <fmt:formatNumber type="number" value="${u.x_pos } " pattern="000.000000" maxFractionDigits="6"/> --%>
			
			<!-- <td><a href="selectDevAttr">定位</a></td> -->
			<td><input type="hidden" name="test1" id="test1" value="${u.sn }"><a onclick="locate(this)">定位</a></td>
			<td><input type="hidden" name="test" id="test" value="${u.sn }"><a onclick="ajaxTest(this)">详情</a></td>
		</tr>
		</c:forEach>
</table>

</div>
</div>
<div id="bellow">
<table id="table001"
	class="table table-bordered table-condensed table-hover table-striped"
	style="padding: 0px; margin: 0px;">
	<thead>
		<tr>
			<th>设备ID</th>
			<th>设备名称</th>
			<th>在线状态</th>
			<th>定位方式</th>
			<th>经纬度</th>
			<th>信息获取时间</th>
			<th>报警信息</th>
		</tr>
	</thead>

</table>
<%-- <%  
   //页面每隔30秒自动刷新一遍       
   response.setHeader("refresh" , "30" );  
%> 		 --%>
</div>
<script type="text/javascript">
	// 百度地图API功能	
	map = new BMap.Map("shang");
	map.centerAndZoom(new BMap.Point(114.273439,30.674298), 9);
	map.enableScrollWheelZoom(true);
	var geoc = new BMap.Geocoder();   
	
	 // 添加带有定位的导航控件
	  var navigationControl = new BMap.NavigationControl({
	    // 靠左上角位置
	    anchor: BMAP_ANCHOR_TOP_LEFT,
	    // LARGE类型
	    type: BMAP_NAVIGATION_CONTROL_LARGE,
	    // 启用显示定位
	    enableGeolocation: true
	  });
	  map.addControl(navigationControl);
	  // 添加定位控件
	  var geolocationControl = new BMap.GeolocationControl();
	  geolocationControl.addEventListener("locationSuccess", function(e){
	    // 定位成功事件
	    var address = '';
	    address += e.addressComponent.province;
	    address += e.addressComponent.city;
	    address += e.addressComponent.district;
	    address += e.addressComponent.street;
	    address += e.addressComponent.streetNumber;
	    alert("当前定位地址为：" + address);
	  });
	  geolocationControl.addEventListener("locationError",function(e){
	    // 定位失败事件
	    alert(e.message);
	  });
	  map.addControl(geolocationControl);
	  
	var data_info = ${s};
 	/* alert(data_info); */

	var opts = {
				width : 250,     // 信息窗口宽度
				height: 80,     // 信息窗口高度
				title : "信息窗口" , // 信息窗口标题
				enableMessage:true//设置允许信息窗发送短息
			   };
	for(var i=0;i<data_info.length;i++){
		var marker = new BMap.Marker(new BMap.Point(data_info[i][0],data_info[i][1]));  // 创建标注
		 var content1 = data_info[i][2];
		content = "设备ID："+content1;
		map.addOverlay(marker);        // 将标注添加到地图中
		addClickHandler(content,marker);
	}

	function addClickHandler(content,marker){
  		 marker.addEventListener("click",function(e){
   			    var pt = e.point;			
				geoc.getLocation(pt, function(rs){
				var addComp = rs.addressComponents;
				var dizhi = addComp.province  + addComp.city  + addComp.district  + addComp.street + addComp.streetNumber;
				
				openInfo(content+"地址："+dizhi,e);
			      
			 });

			}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
</script>

<script type="text/javascript">
function ajaxTest(obj){
	/* alert($(obj).parent().prev().prev().prev().prev().text()); */
 	var id = $(obj).parent().prev().prev().prev().prev().text();
 	/* alert("我的ID是："+id); */
	$.ajax({
		type : "post",
		url : "selectDevAttr1",
		data: id, 
		dataType : 'json',
		contentType: "application/json; charset=utf-8",
		success : function (data){
			/* alert(data[0].sn+data[0].sDevName+data[0].x_pos+data[0].y_pos);
			var obj=eval(data);
			alert(obj);
			alert(obj[0].sn); */
			var trs = '';			
			$("#table001 tr td").remove();			 
			for(var i=0;i<data.length;i++){
			 trs+='<tr><td>'+data[i].sn+'</td><td>'+data[i].sDevName+'</td><td>'+data[i].nState+'</td><td>'+data[i].nLocaMode+'</td><td>'+data[i].x_pos+'&nbsp;'+data[i].y_pos+'</td><td>'+data[i].nAlarm+'</td><td>'+'</td></tr>'
		}
			console.log(trs);
			 $('#table001').append(trs);
		}
	});
}
function locate(obj){
	var id = $(obj).parent().prev().prev().prev().text();
	$.ajax({
		type : "post",
		url : "selectDevAttr",
		data: id, 
		dataType : 'json',
		contentType: "application/json; charset=utf-8",
		success : function (data){
			aa(data[0].x_pos,data[0].y_pos);
		}
	});	
}

function aa(a,b){
	var map = new BMap.Map("shang");
	var point = new BMap.Point(a,b);
	map.enableScrollWheelZoom(true);
	var marker = new BMap.Marker(point); // 创建标注
	map.addOverlay(marker);       // 将标注添加到地图中
	map.centerAndZoom(point, 17);
	var geoc = new BMap.Geocoder(); 
	var opts = {
	  width : 200,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "窗口信息" , // 信息窗口标题
	  enableMessage:true,//设置允许信息窗发送短息
	}
	marker.addEventListener("click",function(e){     
		var pt = e.point;
		geoc.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
			var dizhi = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
			var infoWindow = new BMap.InfoWindow(dizhi, opts);
			map.openInfoWindow(infoWindow,point);

		});  
	});
	 
	}
	
$(function(){
	 setInterval(aa,700000);
	 function aa(){
	   $.ajax({
			type : "post",
			url : "selectDevAttr1",
			dataType : 'json',
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success : function (data){

			}
		});
	   /*   window.location.reload(true);   */
	 /* alert("aaaaaa")  */
	 }
	})
</script>
</body>
</html>