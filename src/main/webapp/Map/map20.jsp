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
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>给多个点添加信息窗口</title>
<!-- 	<script type="text/javascript">
	   $.ajax({
			type : "POST",
			url : "listDevAttr2",
			dataType : 'json',
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success : function (data){
				var s="[";
				for(var i=0;i<data.length;i++){
					 s +="["+ data[i].x_pos+","+data[i].y_pos+","+data[i].sn+"],";
					
				}
				s = s.substring(0,s.length-1);
		    	 s+="]";
		    	 alert(s); 
		    	 var data_info=eval(s);

			}
		});
	</script> -->
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
			
			<td><a href="selectDevAttr">详情</a></td>
			<td><input type="hidden" name="test" id="${vs.count }" value="${u.sn }"><a onclick="ajaxTest()">定位</a></td>
		</tr>
		</c:forEach>
</table>

</div>
</div>
<div id="bellow">
<table id="offerTable"
	class="table table-bordered table-condensed table-hover table-striped"
	style="padding: 0px; margin: 0px;">
	<thead>
		<tr>
			<th>设备名称</th>
			<th>在线状态</th>
			<th>定位方式</th>
			<th>设备名称</th>
			<th>代理商</th>
			<th>经纬度</th>
			<th>信息获取时间</th>
			<th>报警信息</th>
		</tr>
	</thead>
		<tr>
			<td>发电机01</td>
			<td>在线</td>
			<td>GPS</td>
			<td>HL001</td>
			<td>中国电信</td>
			<td>116.417854,39.921988</td>
			<td>    
			<%  
			    java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(    
			     "yyyy-MM-dd HH:mm:ss");   
			    java.util.Date currentTime = new java.util.Date();    
			    String time = simpleDateFormat.format(currentTime).toString();
			    out.println(time);  
            %> 
            </td>
			<td>无</td>
		</tr>
</table>
<%-- <%  
   //页面每隔30秒自动刷新一遍       
   response.setHeader("refresh" , "30" );  
%> 		 --%>
</div>
<script type="text/javascript">
	// 百度地图API功能	
	$(document).ready(function(){
	 $.ajax({
			type : "POST",
			url : "listDevAttr2",
			dataType : 'json',
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			success : function (data){
				var s="[";
				for(var i=0;i<data.length;i++){
					 s +="["+ data[i].x_pos+","+data[i].y_pos+","+data[i].sn+"],";
					
				}
				s = s.substring(0,s.length-1);
		    	 s+="]";
		    	  alert(s); 
		    	 var data_info=eval(s);
				 alert(data_info);
	map = new BMap.Map("shang");
	alert("aaa");
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
	/* 	<c:forEach var="u" items="${devAttr }">
	var obj_arr="${u.x_pos}";
	alert(${u.x_pos });

	</c:forEach>  */
/* 	var data_info = ${s};
 	alert(data_info);  */
 	/* alert("aa"); */
 	/*	alert(data_info+"hehe");  */
/* 	 alert(data_info);  */
/* 	var data_info = [[114.273439,30.674298,"地址：湖北省, 武汉市, 硚口区"],
					 [114.406605,30.921585,"地址：湖北省, 武汉市, 黄陂区, 王家河街道"],
					 [114.412222,30.712345,"地址：湖北省, 武汉市, 黄陂区"]
					]; */

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

 	 /*  var content; */
	function addClickHandler(content,marker){
 		 marker.addEventListener("click",function(e){
   			    var pt = e.point;			
				geoc.getLocation(pt, function(rs){
				var addComp = rs.addressComponents;
				var dizhi = addComp.province  + addComp.city  + addComp.district  + addComp.street + addComp.streetNumber;
				
				openInfo(content+"地址："+dizhi,e);
			      
			 });

		/* 	var content = "位置："+aa;
			openInfo(content,e)  */
			}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
			}
		});

});
</script>
<script type="text/javascript">

$(function(){
 setInterval(aa,30000);
 function aa(){
   $.ajax({
		type : "POST",
		url : "listDevAttr2",
		dataType : 'json',
		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		success : function (data){
			/* alert(eval(data)); */
			/* eval('(' +data + ')') */
			/* alert(data); */
			/* var dataObj=eval("("+data+")");    */
			for(var i=0;i<data.length;i++){
				alert(data[i].sn+data[i].sDevName+"hah");
			}
/* 			console.log(data);
			alert(data.length);
			var a= JSON.stringify(data);
			alert(a);
			alert(a.length);
			for(var i=0;i<a.length;i++){
				alert("hah");
			} */
			/* alert(a); */
		}
	});
   /*   window.location.reload(true);   */
 /* alert("aaaaaa")  */
 }
})
</script>
</body>
</html>