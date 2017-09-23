<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
	<title>出库</title>
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath }/Public/style/a.css" rel="stylesheet"/>
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
<form class="form-inline definewidth m20" action="selectgStockOutByDevName" method="post">    
    设备名称：
    <input type="text" name="selectItem" id="username"class="abc input-default" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
  	<label class="error" id="msg">${msg }</label><br>
   <!--  <button type="button" class="btn btn-success" id="addnew">新增设备</button> -->
</form>
<table class="table table-bordered table-hover table-condensed table-striped definewidth m10">
    <thead>
    <tr>
        <th>设备ID</th>
        <th>设备名称</th>
        <th>设备类型</th>
        <th>出库类型</th>
        <th>仓库名称</th>
        <th>单位</th>
        <th>负责人</th>
        <th>联系电话</th>
        <th>登记人员</th>
        <th>出库时间</th>
        <th>备注</th>
        <th colspan=2 align="center">操作</th>
    </tr>
    </thead>
    <c:forEach var="so" items="${stockOut }">
    <tr>
       <td>${so.sn }</td>
       <td>${so.sDevName }</td>
       <td>${so.nDevType }</td>
       <td>${so.sStockOutType }</td>
       <td>${so.sStorageName }</td>
       <td>${so.sUnitName }</td>
       <td>${so.sResponsiblePerson }</td>
       <td>${so.sTelphone }</td>
       <td>${so.sRegistrant }</td>
       <td>${so.stockOutTime }</td>
       <td>${so.sRemark }</td>
       <td>
           <a href="updateStockOutView?id=${so.sn }">编辑</a>
       </td>
       <td>
          <%--  <a href="insertToDevAttr?id=${so.sn }">监控</a> --%>
           <a onclick="monitor(this)">监控</a>
       </td>
        <td>
           <a href="deleteStockOut?id=${so.sn }" onClick="return delConfirm();">删除</a>       
       </td>
      </tr>
	</c:forEach>
</table>
<div class="inline pull-right page">
         741条记录 1/50 页  <a href='#'>下一页</a><span class='current'>1</span><a href='#'>2</a><a href='#'>3</a><a href='#'>4</a><a href='#'>5</a>  <a href='#' >下5页</a> <a href='#' >最后一页</a>   
</div>
<script>
    $(function () {      
		$('#addnew').click(function(){
				window.location.href="Stock/addStockOut.jsp";
		 });
    });
	function delConfirm()
	{
		if(confirm("确定要删除吗？"))
		{				
		}
		else{
			return false;
		}
	}
	function monitor(obj){
		var id = $(obj).parent().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().text();
		$.ajax({
			type : "post",
			url : "insertToDevAttr",
			data: id, 
			dataType : 'json',
			contentType: "application/json; charset=utf-8",
			success : function (data){
				/*	if(state == 1){
				model.addAttribute("msg", "已监控，请勿重复操作！");
			}
			else{
				devAttrService.insertDevAttr(dev);
				stockOutService.updateStockOutState(id);
				model.addAttribute("msg", "监控成功！");
			}*/
				if(data == 1){
					alert("已监控，请勿重复操作！");
				}
				else{
					alert("操作成功！");
				}				
			}
		});	
		
	}
</script>
</body>
</html>