<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
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
        .tableleft{
        	align:"right";
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
<form action="updateStockOut" method="post" class="definewidth m20">
<input type="hidden" name="id" value="{$user.id}" />
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">设备ID</td>
            <td><input type="text" name="sn" readonly="readonly" value="${stock.sn}"/></td>
        </tr>
        <tr>
            <td class="tableleft">设备名称</td>
            <td><input type="text" name="sDevName" value="${stock.sDevName }"/></td>
        </tr>
        <tr>
            <td class="tableleft">设备类型</td>
            <td><input type="text" name="nDevType" value="${stock.nDevType }"/></td>
        </tr>
        <tr>
            <td class="tableleft">出库类型</td>
            <td><input type="text" name="sStockOutType" value="${stock.sStockOutType }"/></td>
        </tr>
        <tr>
            <td class="tableleft">仓库名称</td>
             <td><input type="text" name="sStorageName" value="${stock.sStorageName }"/></td>
        </tr>
        <tr>
            <td class="tableleft">单位</td>
             <td><input type="text" name="sUnitName" value="${stock.sUnitName }"/></td>
        </tr>   
        <tr>
            <td class="tableleft">负责人</td>
             <td><input type="text" name="sResponsiblePerson" value="${stock.sResponsiblePerson }"/></td>
        </tr>
        <tr>
            <td class="tableleft">联系电话</td>
             <td><input type="text" name="sTelphone" value="${stock.sTelphone }"/></td>
        </tr>
        <tr>
            <td class="tableleft">登记人员</td>
             <td><input type="text" name="sRegistrant" value="${stock.sRegistrant }"/></td>
        </tr>
        
        <tr>
            <td align="center" class ="tableleft">出库时间</td>
            <td><input type="text" name="stockOutTime" value="${stock.stockOutTime }" class="form_datetime"/></td>
        </tr>
        <tr>
            <td align="right" class="tableleft">备注</td>
             <td><input type="text" name="sRemark" value="${stock.sRemark }"/></td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button" id="saveid">保存</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script>
    $(function () {
		$('#backid').click(function(){
				window.location.href="listStockOut";
		 });

    });
    
    $(function () {
      	 $(".form_datetime").datetimepicker({
      		 		autoclose : true,
   				minView : "month",
   				format : "yyyy-mm-dd",
   				language : "zh-CN"
      		 });
       });
/*     $(function () {       
		$('#saveid').click(function(){
				window.location.href="index.html";
		 });

    }); */
/*     $(function(){  
        $('#backid').click(function(){ 
        	alert("hah");
             $.ajax({  
                 type: "post",  
                 url: "listStockIn", 
                 dataType: "json",  
                 success: function(){  
                          alert("提交成功！");
                           
                          }  
             });  
        });  
    });  */
</script>
</body>
</html>
