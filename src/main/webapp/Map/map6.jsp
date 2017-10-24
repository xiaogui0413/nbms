<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	      <!-- 引入 Bootstrap -->
<!--     <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
    <link href="resources/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" type="text/css" />
    
	<style type="text/css">
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		
		#shang{ float:left;width:75%;height:100%;}
        #xia{ float:right;width:25%;height:100%;}
        #top{height:80%;}
        #bellow{height:20%;}
        #myModalLabel{color : #FFFFFF;}

		p{margin-left:5px; font-size:14px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=XiFYlQUERCmYwQt138GT76oPSpfp08d8"></script>
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
			<th>ID</th>
			<th style="display:none">id</th>
			<th>设备名称</th>
			<th>状态</th>
			<!-- <th>经度</th> -->
			<th>操作</th>
			<th>操作</th>
		</tr>
	</thead>
	    <c:choose>
			<c:when test="${not empty requestScope.devAttr }">
		<c:forEach var="u" items="${devAttr }">
		<tr>
		   <!-- <td><input type="checkbox"></td> -->
		    <td>${u.sDevID }</td>
		    <td style="display:none">${u.sn }</td>
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
			<td><input type="hidden" name="test1" id="test1" value="${u.sn }"><a href="javascript:void(0)" onclick="locate(this)">定位</a></td>
<%-- 			<td><input type="hidden" name="test" id="test" value="${u.sn }"><a href="javascript:void(0)" onclick="detail(this)">详情</a></td> --%>
			<td><input type="hidden" name="test" id="test" value="${u.sn }"><a href="javascript:void(0)" onclick="recall(this)">取消监控</a></td>
		</tr>
		</c:forEach>
		     </c:when>
	     <c:otherwise>
	     	<tr class="success">
				<td colspan=13>没有你要找的内容!</td>
			</tr>
	     </c:otherwise>
     </c:choose>
</table>
<div class="inline pull-right page">
        共${page.total}条记录 /共${page.pages}页  <a href='listDevAttrByPage?page=${page.prePage}'>上一页</a><a href="listDevAttrByPage?page=${page.nextPage}">下一页</a>   
</div>
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
			<th>可信度</th>
			<th>电池电压</th>
			<th>报警信息</th>
		</tr>
	</thead>

</table>
<!--    //页面每隔30秒自动刷新一遍       
   response.setHeader("refresh" , "30" );   -->
<div style="text-align:center;">
 <p><span>© 2017 深圳市意格尔数字技术有限公司</span></p>
</div>
</div>
<!-- 模态框开始 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<!-- 设置模态框宽度，加在<div class="modal-dialog"> 中         style="width:450px" -->
	<div class="modal-dialog" style="width:450px;overflow:auto">
		<div class="modal-content">
			<div class="modal-header" style="background:#3B4E89;height:40px">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					设备信息
				</h4>
			</div>
			<div class="modal-body" style="height:212px">
<table class="table table-bordered table-condensed table-hover"> 
        <tr>
            <td rowspan="6" width="200px" id="image">
            <img src="Images/bird.jpg"></td>           
            <td align="right" width="80px">名称:</td>
            <td id="sDevName"></td>
        </tr>
        <tr>      
            <td align="right" width="80px">类型:</td>
            <td id="sDevType"></td>
        </tr>
        <tr>
            <td align="right" width="80px">设备SN:</td>
            <td id="sn"></td>
        </tr>
        <tr>
            <td align="right" width="80px">关联ID:</td>
            <td id="sDevID"></td>
        </tr>
        <tr>
            <td align="right" width="80px">电池电压:</td>
            <td id="fBatteryVolt">3.3</td>
        </tr>
        <tr>
            <td align="right" width="80px">报警信息:</td>
            <td id="nAlarm"></td>
        </tr>
</table> 
			</div>
			<div class="modal-footer" style="background:#F0F0E1;height:130px">
			<table class="table table-bordered table-condensed table-hover">
				<tr>
					<td>定位地址:</td>
					<td align="left" colspan=3 id="address"></td>
				</tr>
				<tr>
					<td>经度:</td>
					<td align="left" id="x_pos"></td>
					<td>纬度:</td>
					<td align="left" id="y_pos"></td>
				</tr>
				<tr>
					<td>可信度(米):</td>
					<td align="left" id="fHop"></td>
					<td>定位方式:</td>
					<td align="left" id="nLocaMode"></td>
				</tr>
			</table>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 模态框结束 -->
<script type="text/javascript">

	// 百度地图API功能
	map = new BMap.Map("shang");
/* 	map.centerAndZoom("深圳",9); */
	map.centerAndZoom(new BMap.Point(114.273439,30.674298), 5);
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

/*  	  if("${s}"!=']'){
		  alert("hah");
		  var data_info = "${s}";
	  }
	  alert("java");
	  //alert("${s}"); */

  	 	var data_info = ${s};


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
		var label = new BMap.Label("我是文字标注哦",{offset:new BMap.Size(20,-10)});
		marker.setLabel(label);
		addClickHandler(content,marker);
	}

	function addClickHandler(content,marker){
 		 marker.addEventListener("click1",function(e){
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
<!-- <script type="text/javascript">

$(function(){
 setInterval(aa,700000);
 function aa(){
   $.ajax({
		type : "post",
		url : "selectDevAttr1",
		dataType : 'json',
		contentType: "application/json; charset=utf-8",
		success : function (data){

		}
	});
   /*   window.location.reload(true);   */
 /* alert("aaaaaa")  */
 }
})
</script> -->
<script type="text/javascript">
function detail(obj){

 	var id = $(obj).parent().prev().prev().prev().prev().text();
	$.ajax({
		type : "post",
		url : "selectDevAttr1",
		data: id, 
		dataType : 'json',
		contentType: "application/json; charset=utf-8",
		success : function (data){
			var trs = '';			
			$("#table001 tr td").remove();
			console.log(data);
			for(var i=0;i<data.length;i++){
			 trs+='<tr><td>'+data[i].sDevID+'</td><td>'+data[i].sDevName+'</td><td>'+data[i].nState+'</td><td>'+data[i].nLocaMode+'</td><td>'+data[i].x_pos+'&nbsp;'+data[i].y_pos+'</td><td>'+data[i].samplingTime+'</td><td>'+data[i].fHop+'</td><td>'+data[i].fBatteryVolt+'</td><td>'+data[i].nAlarm+'</td></tr>'
		}
			console.log(trs);
			 $('#table001').append(trs);
		}
	});
}

function recall(obj){
 	var id = $(obj).parent().prev().prev().prev().prev().text();
 	var sDevID = $(obj).parent().prev().prev().prev().prev().prev().text();
  	if(confirm("确定要取消监控吗？")){	
 		$.ajax({
 			type : "post",
 			url : "recallDevAttr",
 			data: id, 
 			dataType : 'json',
 			contentType: "application/json; charset=utf-8",
 			success : function (data){
 				alert(data);
 				alert("java");
 			}
 		});
/*  		$.ajax({
 			type : "post",
 			url : "recallDevAttr",
 			data: id,
 			dataType : 'json',
 			contentType: "application/json; charset=utf-8",
 			success : function (data){
 				alert(data);
 				alert("java");
 			}
 		}); */
	}
	else{
		return false;
	}
	alert("取消监控成功！");
	flush(); 
}

function flush(){
	
	location.href="listDevAttrByPage";
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
			for(var i=0;i<data.length;i++){
				$("#sDevName").text(data[i].sDevName);
			    $("#sDevID").text(data[i].sDevID);
			    $("#x_pos").text(data[i].x_pos);
			    $("#y_pos").text(data[i].y_pos);
			    $("#fHop").text(data[i].fHop);
			    $("#nLocaMode").text(data[i].nLocaMode);
		}
		}
	});
}
/* function aa(a,b){
	var map = new BMap.Map("shang");
	var point = new BMap.Point(a,b);
	var marker = new BMap.Marker(point);  // 创建标注
	map.addOverlay(marker);              // 将标注添加到地图中
	map.centerAndZoom(point, 15);
	var opts = {
	  width : 200,     // 信息窗口宽度
	  height: 100,     // 信息窗口高度
	  title : "设备窗口信息" , // 信息窗口标题
	  enableMessage:true,//设置允许信息窗发送短息
	}
	var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	});
	} */
	
	function aa(a,b){
		var map = new BMap.Map("shang");
		var point = new BMap.Point(a,b);
		//map.enableScrollWheelZoom(true);		
		
	    //坐标转换完之后的回调函数
	    translateCallback = function (data){
	    	
	      if(data.status === 0) {
	        var marker = new BMap.Marker(data.points[0]);
	      
	        map.addOverlay(marker);	       
	        
	        map.setCenter(data.points[0]);
	       
			map.centerAndZoom(data.points[0], 18);
			var point = data.points[0];
			var geoc = new BMap.Geocoder();
/***************** 下面注释的这段代码是显示导航控件的 *******************/
			/*  // 添加带有定位的导航控件
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
			  var geolocationControl = new BMap.GeolocationControl(); */
/***************** 上面注释的这段代码是显示导航控件的 *******************/
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
			var opts = {
			  width : 200,     // 信息窗口宽度
			  height: 100,     // 信息窗口高度
			  title : "窗口信息" , // 信息窗口标题
			  enableMessage:true,//设置允许信息窗发送短息
			}
			marker.addEventListener("click",function(e){
				$("#myModal").modal('show');
				var pt = e.point;
				geoc.getLocation(pt, function(rs){
					var addComp = rs.addressComponents;
					var dizhi = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
					$("#address").text(dizhi);
/* 					var infoWindow = new BMap.InfoWindow(dizhi, opts);
					map.openInfoWindow(infoWindow,point); */
				});
			});
	      }
	    }
	        var convertor = new BMap.Convertor();
	        var pointArr = [];
	        pointArr.push(point);
	        convertor.translate(pointArr, 1, 5, translateCallback);   	 
		}
</script>
</body>
</html>