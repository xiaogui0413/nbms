<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link href="resources/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=XiFYlQUERCmYwQt138GT76oPSpfp08d8"></script>
	        	<script src="http://lib.sinaapp.com/js/jquery/2.0.2/jquery-2.0.2.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>添加动画标注点</title>
</head>
<body>
<div id="allmap"></div>

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
var data_info = ${s};
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.enableScrollWheelZoom(true);
	var point = new BMap.Point(data_info[0],data_info[1]);
	map.centerAndZoom(point, 15);
	var geoc = new BMap.Geocoder(); 
	
    translateCallback = function (data){
    	
	      if(data.status === 0) {
	        var marker = new BMap.Marker(data.points[0]);	      
	        map.addOverlay(marker);	               
	        map.setCenter(data.points[0]);
			marker.addEventListener("click",function(){
				locate();

				$("#myModal").modal('show');
				geoc.getLocation(point, function(rs){
					var addComp = rs.addressComponents;
					var dizhi = addComp.province + addComp.city + addComp.district + addComp.street + addComp.streetNumber;
					$("#address").text(dizhi);
				});
			 });
	      }
	    }
	        var convertor = new BMap.Convertor();
	        var pointArr = [];
	        pointArr.push(point);
	        convertor.translate(pointArr, 1, 5, translateCallback); 
	        alert("zixing");
</script>
<script type="text/javascript">
function locate(){
	var id = data_info[2];
	//var id = 865352030201866;
	$.ajax({
		type : "post",
		url : "selectDevAttrID",
		data: JSON.stringify(id), 
		dataType : 'json',
		contentType: "application/json; charset=utf-8",
		success : function (data){
			
			//aa(data[0].x_pos,data[0].y_pos);
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
</script>
</body>
</html>




