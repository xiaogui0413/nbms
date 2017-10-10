<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>入库</title>
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
    设备名称：
    <input type="text" name="selectItem" id="selectItem"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;
    <button type="button" class="btn btn-success" id="addnew">新增设备</button>
</form>
<div ><!-- style="width:100%;overflow-x:auto;overflow-y:hidden; padding:10px; border:1px solid black" -->
<table class="table table-bordered table-hover definewidth m10">
     <thead>
    <tr>
        <th>编号</th>
        <th>设备名称</th>
        <th>设备类型</th>
        <th>设备子类型</th>
        <th>设备ID</th>
        <th>入库类型</th>
        <th>仓库名称</th>
        <th>供应商名称</th>
        <th>登记人员</th>
        <th>入库时间</th>
        <th>备注</th>
        <th colspan=3 align="center">操作</th>
    </tr>
    </thead>
	<c:forEach var="s" items="${stockIn }">
          <tr>
            <td>${s.sn }</td>
            <td>${s.sDevName }</td>
            <td>${s.nDevType }</td>
            <td>${s.nSubtype }</td>
            <td>${s.sDevID }</td>
            <td>${s.sStockIntType }</td>
            <td>${s.sStorageName }</td>
            <td>${s.sSupplierName }</td>
            <td>${s.sRegistrant }</td>
            <td>${s.storageTime}</td>
            <%-- <td>
            	<c:choose>
            		<c:when test="${s.storageTime == null}">--
            		</c:when>
                    <c:otherwise><fmt:formatDate value="${s.storageTime}" pattern="yyyy-MM-dd  HH:mm:ss"/>
                    </c:otherwise>
                </c:choose>
            </td> --%>
            <td>${s.sRemark }</td>
            <td>
                <a href="updateStockInView?id=${s.sn }">编辑</a>
            </td>
            <td>
                <a href="outStockInView?id=${s.sn }">出库</a>
            </td>
            <td>
                <a href="deleteStockIn?id=${s.sn }" onClick="return delConfirm();">删除</a>
            </td>
          </tr>
	</c:forEach>
</table>
</div>
<div class="inline pull-right page">
         741条记录 1/50 页  <a href='#'>下一页</a><span class='current'>1</span><a href='#'>2</a><a href='#'>3</a><a href='#'>4</a><a href='#'>5</a>  <a href='#' >下5页</a> <a href='#' >最后一页</a>   
</div>
<script>
    $(function () {        
		$('#addnew').click(function(){
				window.location.href="Stock/addStockIn.jsp";
		 });
    });
	function delConfirm()
	{				
		if(confirm("确定要删除吗？"))
		{		
			/* var url = "index.html";			
			window.location.href=url; */			
		}
		else{
			return false;
		}
	}
</script>
</body>
</html>