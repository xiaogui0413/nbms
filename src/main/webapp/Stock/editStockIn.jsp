<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
        input {
        	border: none;
        	border-style:none;
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
<div class="form-group">
<form action="updateStockIn" method="post">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">设备ID</td>
            <td><input style="border-style:none" type="text" name="sn" readonly="readonly" value="${stock.sn}" class="form-control"/></td>
        </tr>
        <tr>
            <td class="tableleft">设备名称</td>
            <td><input style="border-style:none" type="text" name="sDevName" value="${stock.sDevName }" class="form-control"/></td>
        </tr>
        <tr>
            <td class="tableleft">设备类型</td>
            <td><input style="border-style:none" type="text" name="nDevType" value="${stock.nDevType }" class="form-control"/></td>
        </tr>
        
        <tr>
            <td class="tableleft">设备子类型</td>
            <td><input style="border-style:none" type="text" name="nSubtype" value="${stock.nSubtype }" class="form-control"/></td>
        </tr>
        
        <tr>
            <td class="tableleft">设备ID</td>
            <td><input style="border-style:none" type="text" name="sDevID" value="${stock.sDevID }" class="form-control"/></td>
        </tr>
        
        <tr>
            <td class="tableleft">入库类型</td>
            <td><input style="border-style:none" type="text" name="sStockInType" value="${stock.sStockIntType }" class="form-control"/></td>
        </tr>
        
        <tr>
            <td class="tableleft">仓库名称</td>
             <td><input style="border-style:none" type="text" name="sStorageName" value="${stock.sStorageName }" class="form-control"/></td>
        </tr>
        <tr>
            <td class="tableleft">供应商名称</td>
             <td><input style="border-style:none" type="text" name="sSupplierName" value="${stock.sSupplierName }" class="form-control"/></td>
        </tr>
        <tr>
            <td class="tableleft">登记人员</td>
             <td><input style="border-style:none" style="border-style:none" type="text" name="sRegistrant" value="${stock.sRegistrant }" class="form-control"/></td>
        </tr>
        
        <tr>
            <td align="center" class ="tableleft">入库时间</td>
            <td><input style="border-style:none" type="text" readonly="readonly" name="StorageTime" value="${stock.storageTime }" class="form_datetime"/></td>
        </tr>
        <tr>
            <td align="right" class="tableleft">备注</td>
             <td><input style="border-style:none" type="text" name="sRemark" value="${stock.sRemark }" class="form-control"/></td>
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
</div>
<script>
    $(function () {
		$('#backid').click(function(){
				window.location.href="listStockIn";
		 });

    });
    
    $(function () {
    	$(".form_datetime").datetimepicker({
		 	autoclose : true,
			minView : 0,
			format : "yyyy-mm-dd hh:ii:ss",
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
