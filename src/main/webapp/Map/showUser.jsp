<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	      <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Qied2a3vURUG89hlnnvVodf3"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>给多个点添加信息窗口</title>
</head>
<body>
	id:${user.id} <br>
	userName: ${user.userName} <br>
	password: ${user.password} <br>
	age: ${user.age} <br>
	
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
	<!-- <c:forEach var="offer" items="${pageInfo.list }">
		<tr id="${offer.offerCode}">
			<td align="right"><input type="checkbox" name="offercheckbox"
				value="${offer.offerCode}"></td>
		    <td align="center"><input type="hidden" value="${offer.offerCode}"><a href="javascript:void(0)" onclick="offerClick(this)">${offer.offerCode}</a></td>
			<td align="center">${offer.offerName}</td>
			<td align="center">${offer.offerType.typeName}</td>
			<td align="center"><c:choose><c:when test="${offer.fullStatus == 0}">否</c:when>
										<c:otherwise>是</c:otherwise>
			</c:choose></td>
			<td align="center"><c:choose>
					<c:when test="${offer.frozenStatus == 1}">禁用</c:when>
					<c:otherwise>启用</c:otherwise>
				</c:choose></td>
				<td align="center"><fmt:formatDate value="${offer.modifyTime}" pattern="yyyy-MM-dd  HH:mm:ss"/></td>
				<td align="center">${offer.modifier}</td>
			<td align="center">${offer.beginTime}</td>
			<td align="center">${offer.endTime}</td>
			<td align="center"><c:choose><c:when test="${offer.createTime == null}">--</c:when>
                                                 <c:otherwise><fmt:formatDate value="${offer.createTime}" pattern="yyyy-MM-dd  HH:mm:ss"/></c:otherwise>
                     </c:choose></td>
			<td align="center">${offer.ownerMan}</td>
			<td align="center"><input type="hidden" id="${offer.offerCode }stage" value="${offer.approveStage }"><a href="javascript:void(0)" onclick="showApproveList('OFFER_${offer.offerCode}')">
			 <c:choose>
			   <c:when test="${offer.approveStage eq '-1'}">
		      	未审批 
			   </c:when>
			   <c:when test="${offer.approveStage eq '0'}">审批中
			   </c:when>
			   <c:when test="${offer.approveStage eq '1'}">审批通过
			   </c:when>
			   <c:when test="${offer.approveStage eq '2'}">驳回
			   </c:when>
			   <c:when test="${offer.approveStage eq '3'}">审批撤销
                        </c:when>
			   <c:otherwise>
			     <td align="center">--</td>
			   </c:otherwise>
			 </c:choose>
			 </a>
			</td>
		</tr>
	</c:forEach> -->
</table>
</div>
</body>
</html>