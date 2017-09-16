<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-datetimepicker.min.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>
    <script type="text/javascript" src="../Js/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="../Js/bootstrap-datetimepicker.zh-CN.js"></script>
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
<form action="${pageContext.request.contextPath }/insertStockIn" method="post" class="definewidth m20">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">设备名称</td>
        <td><input type="text" name="sDevName"/></td>
    </tr>
    <tr>
        <td class="tableleft">设备类型</td>
        <td>
        	<select name="nDevType">
			  <option value="1">类型1</option>
			  <option value="2">类型2</option>
			  <option value="3">类型3</option>
			  <option value="4">类型4</option>
			</select>
        </td>
    </tr>
    <tr>
        <td class="tableleft">入库类型</td>
        <td>
       	 	<select name="sStockIntType">
			  <option value="入库类型1">入库类型1</option>
			  <option value="入库类型1">入库类型2</option>
			  <option value="入库类型1">入库类型3</option>
			  <option value="入库类型1">入库类型4</option>
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
    </tr>
    <tr>
        <td class="tableleft">入库时间</td>
         <td><input type="text" name="StorageTime" class="form_datetime"/></td>
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
</script>
</body>
</html>