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
</head>
<body>
<div id="top">
<div id="shang">

</div>
<div id="xia">

<%-- <c:forEach var="u" items="${devAttr }">
[${u.x_pos },${u.x_pos },${u.sDevName }],
</c:forEach> --%>

<table id="offerTable"
	class="table table-bordered table-condensed table-hover table-striped"
	style="padding: 1px; margin: 0px;">
	<thead>
		<tr>
			<!-- <th></th> -->
			<th>设备列表</th>
			<th>设备状态</th>
			<th>经度</th>
			<th>操作</th>
		</tr>
	</thead>
		<c:forEach var="u" items="${devAttr }">
		<tr>
		   <!-- <td><input type="checkbox"></td> -->
			<td>${u.sDevName }</td>
			<td align="center">
			<c:choose>
				<c:when test="${u.nState eq '-1' }">离线
				</c:when>
				<c:when test="${u.nState eq '1' }">在线
				</c:when>
				<c:otherwise>
				<td align="center">--</td>
				</c:otherwise>
			</c:choose>
			</td>
		
			<td>${u.x_pos }</td>
			<!-- 用于控制浮点数的不同位数按照格式输出 -->
			<%-- <fmt:formatNumber type="number" value="${u.x_pos } " pattern="000.000000" maxFractionDigits="6"/> --%>
			
			<td><a href="#">详情</a></td>
		</tr>
		</c:forEach>
</table>
	<div>

       <label>地址"</label>
       <span id="dizhi"></span>
    </div>
</div>
</div>
<div id="bellow">
<table id="offerTable"
	class="table table-bordered table-condensed table-hover table-striped"
	style="padding: 0px; margin: 0px;">
	<thead>
		<tr>
			<th>在线状态</th>
			<th>定位</th>
			<th>设备名称</th>
			<th>代理商</th>
			<th>地址</th>
			<th>报警信息</th>
		</tr>
	</thead>
		<tr>
			<td>在线</td>
			<td>GPS</td>
			<td>HL001</td>
			<td>中国电信</td>
			<td>116.417854,39.921988</td>
			<td>默认</td>
		</tr>
</table>
	
</div>
<!-- <script type="text/javascript">
alert("aaaa");
/* $(document).ready(function(){ */
/* 	$.ajax({
		url: "",
		type: "post",
		success: function(data) {	
		$(data).each(function (i, item) {
		});	
		}
}); */
/* alert("NIcao");
<c:forEach var="u" items="${devAttr }">
	alert(${u.x_pos });
</c:forEach>
alert("wocao"); */
alert("78787");
for(int i=0; i < devAttr.size() ; i ++)
	String str = (String)list.get(i);
out.print("'"+str+"'");
if( i < list.size() -1){
out.print(",");
alert("1111");

</script> -->


<script type="text/javascript">
	// 百度地图API功能
	map = new BMap.Map("shang");
	map.centerAndZoom(new BMap.Point(114.273439,30.674298), 10);
	map.enableScrollWheelZoom(true);
	var geoc = new BMap.Geocoder();   
	map.addEventListener("click", function(e){        
		var pt = e.point;
		geoc.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
			var dizhi = addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber;
			 var a = document.getElementById("dizhi");
		        a.innerHTML= dizhi;
		});        
	});
 	alert("888");
	<c:forEach var="u" items="${devAttr }">
	var obj_arr="${u.x_pos}";
	alert(${u.x_pos });

	</c:forEach>
	alert(obj_arr);
/* 	<c:forEach var="u" items="${devAttr }"> 
	   array.push(${u}); //生成如 array.push(123)的字符串 这样前台拿到后就是js 
	</c:forEach>  */
	 /*   alert(array);  */
/* 	var list = ${devAttr};        
	  for(var i = 0; i < list.length; i++ ){    
	     var sinId = list[i];  
	  }    
		alert(sinId); */
	
/* 	var data_info = [[114.273439,30.674298,"地址：武汉市武昌区区王府井大街88号乐天银泰百货八层"],
		 [114.406605,30.921585,"地址：武汉市江汉区东华门大街"],
		 [114.412222,30.712345,"地址：武汉市汉阳区正义路甲5号"]
		]; */

 	var opts = {
				width : 250,     // 信息窗口宽度
				height: 80,     // 信息窗口高度
				title : "信息窗口" , // 信息窗口标题
				enableMessage:true//设置允许信息窗发送短息
			   };
	for(var i=0;i<myarray.length;i++){
		var marker = new BMap.Marker(new BMap.Point(myarray[i][0],myarray[i][1]));  // 创建标注
		var content = myarray[i][2];
		map.addOverlay(marker);               // 将标注添加到地图中
		addClickHandler(content,marker);
	}
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
</script>
</body>
</html>