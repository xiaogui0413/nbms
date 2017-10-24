<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>实时数据</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/bootstrap-3.3.7/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/bootstrap-datetimepicker.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/Js/bootstrap-datetimepicker.zh-CN.js"></script>
     <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }
        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
</head>    
<body>
<form class="form-inline definewidth m20" action="selectStockInMapByPage" method="post">

&nbsp;&nbsp;
		<div class="input-group input-group-sm">
			<span class="input-group-addon">设备ID：</span>
			<input type="text" class="form-control" name="devID" id="selectItem" value="${devID }" placeholder="设备ID">
		</div>
		
		<div class="input-group input-group-sm">
			<span class="input-group-addon">设备名称：</span>
			<input type="text" class="form-control" name="devName" id="selectItem" value="${devName }" placeholder="设备名称">
		</div> 

    <button type="submit" class="btn btn-primary btn-sm">查询</button><br><br>
		
		<div class="input-group input-group-sm">
			<span class="input-group-addon">开始时间：</span>
			<input type="text" class="form-control form_datetime" name="beginTime" id="selectItem" readonly="readonly" value="${beginTime }">
		</div>
		
		<div class="input-group input-group-sm">
			<span class="input-group-addon">结束时间：</span>
			<input type="text" class="form-control form_datetime" name="endTime" id="selectItem" readonly="readonly" value="${endTime }">
		</div> 
		
    <button type="button" class="btn btn-success btn-sm" onclick="export1()">导出</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
	    <tr>
	    	<th>序号</th>
	        <!-- <th>设备类型</th>
	        <th>设备子类型	</th>
	        <th>设备地址</th> -->
	        <th>设备ID</th>
	        <th>定位方式</th>
	        <th>设备名称</th>
	        <th>经度</th>
	        <th>纬度</th>
	        <th>可信度(米)</th>
	        <th>电池电压(V)</th>
	        <th>剩余电量(%)</th>
	        <th>供电电压(V)</th>
	        <th>数据采集时间</th>
	    </tr>
    </thead>
    <c:choose>
			<c:when test="${not empty requestScope.devHisData }">
	<c:forEach var="s" items="${devHisData }" varStatus="vs">
	    <tr>
            <%-- <td>${s.nDevType }</td>
            <td>${s.nSubtype }</td>
            <td>${s.nDevAddr }</td> --%>
            <td>${vs.count }</td>
            <td>${s.sDevID }</td>
            <td>${s.nLocaMode }</td>
            <td>${s.sDevName }</td>
            <td>${s.x_pos }</td>
            <td>${s.y_pos }</td>
            <td>${s.fHop }</td>
            <td>
            <fmt:formatNumber type="number" value="${s.fBatteryVolt } " pattern="0.00" maxFractionDigits="6"/>
            </td>
            <td>${s.fRSOC }</td>
            <td>${s.fVolt }</td>
			<td>${s.samplingTime }</td>
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
<ul class="pagination">
	<li><a>共${page.total}条记录</a></li>
	<li><a>第${page.pageNum}页/共${page.pages}页</a></li>
	<li><a href="selectStockInMapByPage?page=${page.firstPage}">&laquo;</a></li>
	<li><a href="selectStockInMapByPage?page=${page.prePage}">上一页</a></li>
	<li><a href="selectStockInMapByPage?page=${page.nextPage}">下一页</a></li>
	<li><a href="selectStockInMapByPage?page=${page.pages}">&raquo;</a></li>
</ul>
</div>
<%-- <div class="inline pull-right page">
        共${page.total}条记录 第${page.pageNum}页/共${page.pages}页  <a href='selectStockInMapByPage?page=${page.prePage}'>上一页</a>
        <a href="selectStockInMapByPage?page=${page.nextPage}">下一页</a>
        <a href='selectStockInMapByPage?page=${page.lastPage}'>最后一页</a>
</div> --%>

<script type="text/javascript">
$(function () {
	$(".form_datetime").datetimepicker({
	 	autoclose : true,
		minView : 0,
		format : "yyyy/mm/dd HH:ii:ss",
		language : "zh-CN"
	 });
});
 function export1(){
	 location.href = "export";
	 }

</script>
</body>
</html>