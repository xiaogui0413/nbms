<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实时数据</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/common.js"></script>
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
<form class="form-inline definewidth m20" action="selectgStockInByDevName1" method="post">    
	&nbsp;&nbsp;&nbsp;设备ID：
    <input type="text" name="selectItem" id="selectItem"class="abc input-default" value="">&nbsp;&nbsp;
	设备名称：
    <input type="text" name="selectItem" id="selectItem"class="abc input-default" value="">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;<br> 
	开始时间：
    <input type="text" name="selectItem" id="selectItem"class="abc input-default" value="">&nbsp;&nbsp;
	结束时间：
    <input type="text" name="selectItem" id="selectItem"class="abc input-default" value="">&nbsp;&nbsp;     
    <button type="button" class="btn btn-success" id="addnew">导出</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
	    <tr>
	        <th>设备类型</th>
	        <th>设备子类型	</th>
	        <th>设备地址</th>
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
	<c:forEach var="s" items="${devHisData }">
	    <tr>
            <td>${s.nDevType }</td>
            <td>${s.nSubtype }</td>
            <td>${s.nDevAddr }</td>
            <td>${s.sDevID }</td>
            <td>${s.nLocaMode }</td>
            <td>${s.sDevName }</td>
            <td>${s.x_pos }</td>
            <td>${s.y_pos }</td>
            <td>${s.fHop }</td>
            <td>${s.fBatteryVolt }</td>
            <td>${s.fRSOC }</td>
            <td>${s.fVolt }</td>
            <td>0</td>
          <%--   <td>${s.SamplingTime }</td> --%>
        </tr>
     </c:forEach>
</table>
</body>
</html>