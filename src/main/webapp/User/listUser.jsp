<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户列表</title>
    <link href="resources/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/Css/style.css" />
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
<div>
<form class="form-inline definewidth m20" action="selectUserList" method="post">    
    用户名称：
    <input type="text" name="username" id="username"class="abc input-default" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
    <button type="button" class="btn btn-success" id="addnew">新增用户</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>用户ID</th>
        <th>用户名称</th>
        <th>手机</th>
        <th>邮箱</th>
        <th>地址</th>
        <th>最后登录时间</th>
        <th>备注</th>
        <th colspan="2" align="center">操作</th>
    </tr>
    </thead>
    
	<c:forEach var="userData" items="${userData }">
	     <tr>
            <td>${userData.id }</td>
            <td>${userData.clerkName }</td>
            <td>${userData.contact }</td>
            <td>${userData.emailAddr }</td>
            <td>${userData.address }</td>
            <td>${userData.last_login }</td>
            <td>${userData.memo }</td>
       <%--      <td><a href="updateUserView?id=${userData.id }">编辑</a></td> --%>
            <td><input type="hidden" name="test1" id="test1" value="${userData.id }">
            <a href="javascript:void(0)" onclick="edit(this)">编辑</a></td>
            <td><a href="deleteUser?id=${userData.id }" onclick = "return delConfirm();">删除</a></td>
        </tr>
	</c:forEach>
</table>
</div>

<!-- 添加用户模态框 -->
<!-- 模态框（Modal） -->
<form action="${pageContext.request.contextPath }/addUser" method="post" class="definewidth m20">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加用户
				</h4>
			</div>
			<div class="modal-body">
<table class="table table-bordered definewidth m10">
    <tr>
        <td width="15%" class="tableleft">登录名</td>
        <td><input type="text" name="clerkName" id="clerkName" style="border:none; width:450px"/>${msg }</td>
    </tr>
    <tr>
        <td class="tableleft">密码</td>
        <td><input type="password" name="password" id="password"  style="border:none; width:450px"/></td>
    </tr>
    <tr>
        <td class="tableleft">手机</td>
        <td><input type="text" name="contact" id="contact" style="border:none; width:450px"/></td>
    </tr>
    <tr>
        <td class="tableleft">邮箱</td>
        <td><input type="text" name="emailAddr" id="emailAddr" style="border:none; width:450px"/></td>
    </tr>
    <tr>
        <td class="tableleft">地址</td>
 		<td><input type="text" name="address" id="address"  style="border:none; width:450px"/></td>
    </tr>
    <tr>
        <td class="tableleft">备注</td>
 		<td><input type="text" name="memo" id="memo"  style="border:none; width:450px"/></td>
    </tr>
</table>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="clean">清空</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary">提交</button>				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</form>

<!-- 修改用户模态框 -->
<!-- 模态框（Modal） -->

<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改用户信息
				</h4>
			</div>
			<div class="modal-body">
<table class="table table-bordered definewidth m10">
    	<tr style="display:none">
            <td width="15%" class="tableleft">用户ID</td>
            <td><input type="text" name="id" id="id1" readonly="readonly" value="" style="border:none; width:450px"/></td>
        </tr> 
        <tr>
            <td width="15%" class="tableleft">用户名称</td>
            <td><input type="text" name="clerkName"  id="clerkName1" readonly="readonly" value="" style="border:none; width:450px"/></td>
        </tr>      
        <tr>
            <td width="15%" class="tableleft">密码</td>
            <td><input type="password" name="password" id="password1" value="" style="border:none; width:450px"/></td>
        </tr>
        <tr>
            <td class="tableleft">手机</td>
            <td><input type="text" name="contact" id="contact1" value="" style="border:none; width:450px"/></td>
        </tr>
        <tr>
            <td class="tableleft">邮箱</td>
            <td><input type="text" name="emailAddr" id="emailAddr1" value="" style="border:none; width:450px"/></td>
        </tr>
        <tr>
            <td class="tableleft">地址</td>
            <td><input type="text" name="address" id="address1" value="" style="border:none; width:450px"/></td>
        </tr>
        <tr>
            <td class="tableleft">备注</td>
            <td><input type="text" name="memo" id="memo1" value="" style="border:none; width:450px"/></td>
        </tr>
</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn btn-primary" id="change">修改</button>				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<script>
    $(function () {       
		$('#addnew').click(function(){
			 $("#myModal").modal('show');
				//window.location.href="User/addUser.jsp";
		 });
    });  
    
    $(function () {       
		$('#change').click(function(){
			var id = $("#id1").val();
			var clerkname = $("#clerkName1").val();
			var password = $("#password1").val();
			var contact = $("#contact1").val();
			var emailAddr = $("#emailAddr1").val();
			var address = $("#address1").val();
			var memo = $("#memo1").val(); 
			var data={"id":id,
						"clerkName":clerkname,
	    				"password":password,
	    				"contact":contact,
	    				"emailAddr":emailAddr,
	    				"address":address,
	    				"memo":memo};
	    	$.ajax({
	    		type : "post",
	    		url : "updateUser",
	    		data:JSON.stringify(data), 
	    		dataType : 'json',
	    		contentType: "application/json; charset=utf-8",
	    		success : function (data){
	    			alert(data);
					alert("修改成功！");
	    		}
	    	});
	    	$("#myModal1").modal('hide');
		 });
    }); 
    
	function delConfirm()
	{				
		if(confirm("确定要删除吗？"))
		{	}
		else{
			return false;
		}
	}
//清空模态框
    $(function () {
		$('#clean').click(function(){
			$("#clerkName").val("");
			$("#password").val("");
			$("#contact").val("");
			$("#emailAddr").val("");
			$("#address").val("");
			$("#memo").val("");
		 });
    });
    
    function edit(obj){
     	var id = $(obj).parent().prev().prev().prev().prev().prev().prev().prev().text();
    	$.ajax({
    		type : "post",
    		url : "updateUserView",
    		data: id, 
    		dataType : 'json',
    		contentType: "application/json; charset=utf-8",
    		success : function (data){
    			
    			for(var i=0;i<data.length;i++){
    				$("#id1").val(data[i].id);
    			    $("#clerkName1").val(data[i].clerkName);
    			    $("#password1").val(data[i].password);
    			    $("#contact1").val(data[i].contact);
    			    $("#emailAddr1").val(data[i].emailAddr);
    			    $("#address1").val(data[i].address);
    			    $("#memo1").val(data[i].memo);
    		}
    			$("#myModal1").modal('show');
    		}
    	});
    }
</script>
</body>
</html>