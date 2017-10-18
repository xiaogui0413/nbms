<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
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

<%@ page language="java"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<% 
String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
%>
<%-- <% out.print(new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())); %>
<% out.print(request.getSession().getAttribute("username")); %> --%>
<form action="${pageContext.request.contextPath }/insertStockIn" method="post" class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">设备名称</td>
        <td><input type="text" name="sDevName"/></td>
    </tr>
    <tr>
        <td class="tableleft">设备类型</td>
        <td>
			<select name="nDevType" id="selectType" onchange="change(this.options[this.options.selectedIndex].value)">
	        	<option selected="selected" value="">---请选择一级分类---</option>
	        	<c:forEach items="${type }" var="type">
				<option value="${type.id }">${type.name }</option>
				</c:forEach>
			</select> 
        </td>
    </tr>
     <tr>
        <td class="tableleft">设备子类型</td>
        <td>
<!--         	<select name="nSubtype">
			  <option value="1">子类型1</option>
			  <option value="2">子类型2</option>
			  <option value="3">子类型3</option>
			  <option value="4">子类型4</option>
			</select> -->
			
			<select name="nSubtype" id="selectSubType" >
			</select> 
        </td>
    </tr>
	<tr>
        <td width="10%" class="tableleft">设备ID</td>
        <td><input type="text" name="sDevID"/></td>
    </tr>
    <tr>
        <td class="tableleft">入库类型</td>
        <td>
       	 	<select name="sStockIntType">
			  <option value="外购入库">外购入库</option>
			  <option value="受托代理入库">受托代理入库</option>
			  <option value="退还入库">退还入库</option>
			  <option value="赠送入库">赠送入库</option>
			</select>
        </td>
    </tr>
    <tr>
        <td class="tableleft">仓库名称</td>
        <td><input type="text" name="sStorageName"/></td>
    </tr>
    <tr>
        <td class="tableleft">供应商名称</td>
         <td><input type="text" name="sSupplierName"/></td>
    </tr>
    <tr>
        <td class="tableleft">登记人员</td>
         <td><input type="text" name="sRegistrant"/></td>
        <%--  value = "${sessionScope.username.clerkName}"  --%>
    </tr>
    <tr>
        <td class="tableleft">入库时间</td>
         <td><input type="text" readonly="readonly" name="StorageTime" value = "<% out.print(new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())); %>" class="form_datetime"/></td>
    </tr>
    <tr>
        <td class="tableleft">备注</td>
        <td><input type="text" name="sRemark"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;
            <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="${pageContext.request.contextPath }/listStockIn";
		 });
    });
    $(function () {
    	 $(".form_datetime").datetimepicker({
    		 	autoclose : true,
				minView : 0,
				format : "yyyy-mm-dd HH:ii:ss",
				language : "zh-CN"
    		 });
    });
    
    function change(v){
    	yanzhen();
    	$.ajax({
    		type : "post",
    		url : "selectSubTypeByType",
    		data:v,
    		dataType : 'json',
    		contentType: "application/json; charset=utf-8",
    		success : function (data){
     			$("#selectSubType option").remove();
     			/* for循环类型遍历 */
/*     			var subType = data[0].subType;
     			for (var i = 0, len = subType.length; i < len; i ++) {
    				$("#selectSubType").append("<option value="+subType[i].id+">"+subType[i].name+"</option>");
    			}  */
    			
    			/* each循环类型遍历 */
    			var subType = data[0].subType;
     			$.each(subType, function(i, n) {
 					$("#selectSubType").append("<option value="+subType[i].id+">"+subType[i].name+"</option>");
 				});
    		}
    	});
    }
    
    function yanzhen(){
    	
    	var a=$("#selectType option:selected").text();
    	var b=$("#selectType option:selected").val();
    	if(b==""){
    		alert("请选择正确的分类");
    		$("#selectSubType option").remove();
    	}
    }
</script>
</body>
</html>