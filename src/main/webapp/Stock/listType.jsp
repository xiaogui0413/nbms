<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类列表</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户列表</title>
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--     <link href="resources/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" type="text/css" /> -->
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<div class="container-fluid">
<br>
<form class="form-inline definewidth m20" action="selectUserList" method="post">    
    <button type="button" class="btn btn-primary" id="addType">新增一级分类</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>分类名称</th>
        <th>分类描述</th>
        <th align="center">操作</th>
    </tr>
    </thead>
  <c:forEach var="type" items="${type }">  
    <tr class="success">
 		<td style="display:none"><input type="text" name="typeId" value="${type.id }" /></td>
        <td>${type.name }</td>
        <td>${type.detail }</td>
        <td>
        	<a href="javascript:void(0)" onclick="addSubType()">添加二级分类</a>&nbsp;&nbsp;
    		<a href="javascript:void(0)" onclick="updateType()">修改</a>&nbsp;&nbsp;
    		<a href="deleteType?id=${type.id }" onclick = "return delConfirm();">删除</a>
    	</td>
    </tr>
    
    <c:forEach var="subType"  items="${subType }">
    	<tr class="trTwoLevel">
    		<td>${subType.name }</td>
    		<td>${subType.detail }</td>
    		<td width="200px;" align="right">
    		  <a href="<c:url value='/admin/AdminCategoryServlet?method=editChildPre&cid=${child.cid }'/>">修改</a>
    		  <a onclick="return confirm('您是否真要删除该二级分类？')" href="<c:url value='/admin/AdminCategoryServlet?method=deleteChild&cid=${child.cid }'/>">删除</a>
    		</td>
    	</tr>
   </c:forEach>
	</c:forEach>
	   
</table>
</div>
<!-- 添加一级分类 -->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">一级分类</h4>
            </div>
            <div class="modal-body">
           <table class="table table-bordered definewidth m10">
		         <tr>
		            <td class="tableleft">分类名称:</td>
		            <td><input type="text" id="name" value="" style="border:none; width:450px"/></td>
		        </tr>      
		        <tr>
		            <td class="tableleft">分类描述:</td>
		            <td><input type="text" id="detail" value="" style="border:none; width:450px"/></td>
		        </tr>
           </table> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" id="addFirstType" class="btn btn-primary">添加</button>
            </div>
        </div>
    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">二级分类</h4>
            </div>
            <div class="modal-body">
        <table class="table table-bordered definewidth m10">
				 <tr>
		            <td width="30%" class="tableleft">分类名称:</td>
		            <td colspan="2"><input type="text" name=""  id="" value="" style="border:none; width:450px"/></td>
		        </tr>
		        <tr>
		         <td class="tableleft">设备类型:</td>
			        <td colspan="2" width="200px">
			        	<select name="selectType" id="selectType">
			        	<option value="1">---请选择一级分类---</option>
			        	<c:forEach items="${type }" var="type">
						  <option value="${type.id }">${type.name }</option>
 						</c:forEach>
						</select>
			        </td>
		        </tr>
		        <tr>
		            <td width="30%" class="tableleft">分类描述:</td>
		            <td colspan="2"><input type="text" name="" id="" value="" style="border:none; width:450px"/></td>
		        </tr>
		        <tr>
		            <td width="30%" class="tableleft">示意图:</td>
		            <td height="150px"><input type="file" name="" id="" value="" style="border:none;"/></td>
		        	<td> <input type="submit" value="上传文件" /></td>
		        </tr>
		      </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">添加</button>
            </div>
        </div>
    </div>
</div>

<script>
	/* 刷新设备分类列表 */
	 function flush(){
		 location.href="selectTypeList";
	 }
    $(function () { 
		$('#addType').click(function(){
			 $("#myModal").modal('show');
				//window.location.href="User/addUser.jsp";
		 });
    });
    function addSubType(){
    	 $("#myModal1").modal('show');
    	$.ajax({
    		type : "post",
    		url : "",
    		data: id, 
    		dataType : 'json',
    		contentType: "application/json; charset=utf-8",
    		success : function (data){
    		}
    	});	
    }

	$('#addFirstType').click(function(){
/* 	$('form input[type=button]').click(function(){ */
    	var name = $("#name").val();
    	var detail = $("#detail").val();
    	var data={
    			"name":name,
				"detail":detail
				};
    	$.ajax({
    		type : "post",
    		url : "addFirstType",
    		data:JSON.stringify(data),
    		dataType : 'json',
    		contentType: "application/json; charset=utf-8",
    		success : function (data){
				alert("添加成功！");
    		}
    	});
    	$("#myModal").modal('hide');
    	flush();
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
</script>
  </body>
</html>
