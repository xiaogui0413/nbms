<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>历史告警数据</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/bootstrap-datetimepicker.min.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/Js/bootstrap.js"></script>
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
<form class="form-inline definewidth m20" action="selectDevAlarmMap" method="post">    
	&nbsp;&nbsp;&nbsp;设备ID：
    <input type="text" name="devID" id="selectItem" class="abc input-default" value="${devID }">&nbsp;&nbsp;
	设备名称：
    <input type="text" name="devName" id="selectItem" class="abc input-default" value="${devName }">&nbsp;&nbsp;
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;<br>
	开始时间：
    <input type="text" name="beginTime" readonly="readonly" id="selectItem" class="form_datetime" value="${beginTime }">&nbsp;&nbsp;
	结束时间：
    <input type="text" name="endTime" readonly="readonly" id="selectItem" class="form_datetime" value="${endTime }">&nbsp;&nbsp;     
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
	        <th>告警ID</th>
	        <th>告警名称</th>
	        <th>告警描述</th>
	        <th>告警等级</th>
	        <th>告警发生时间</th>
	        <th>当前值</th>
	        <th>告警状态</th>
	        <th>告警恢复时间</th>
	        <th>备注</th>
	    </tr>
    </thead>
    <c:choose>
			<c:when test="${not empty requestScope.devAlarm }">
	<c:forEach var="s" items="${devAlarm }">
	    <tr>
            <td>${s.nDevType }</td>
            <td>${s.nSubtype }</td>
            <td>${s.nDevAddr }</td>
            <td>${s.sDevID }</td>
            <td>${s.nLocaMode }</td>
            <td>${s.sDevName }</td>
            <td>${s.alarmId }</td>
            <td>${s.signalName }</td>
            <td>${s.meanings }</td>
            <td>${s.levelFlag }</td>
            <td>${s.tmOccured }</td>
            <td>${s.value }</td>
			<td>${s.state }</td>
			<td>${s.tmRestored }</td>
			<td>${s.sRemark }</td>
        </tr>
     </c:forEach>
      </c:when>
	     <c:otherwise>
	     	<tr class="success">
				<td colspan=15>没有你要找的内容!</td>
			</tr>
	     </c:otherwise>
     </c:choose>
</table>
<script type="text/javascript">
$(function () {
	$(".form_datetime").datetimepicker({
	 	autoclose : true,
		minView : 0,
		format : "yyyy-mm-dd HH:ii:ss",
		language : "zh-CN"
	 });
});
</script>
</body>
</html>