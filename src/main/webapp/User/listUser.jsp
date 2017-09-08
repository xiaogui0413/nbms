<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户列表</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }//Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }//Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }//Css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }//Js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }//Js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }//Js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }//Js/common.js"></script>

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
            <td>
                <a href="updateUserView?id=${userData.id }">编辑</a>                
            </td>
            <td>
                <a href="deleteUser?id=${userData.id }" onclick = "return delConfirm();">删除</a>                
            </td>
        </tr>
	</c:forEach>
</table>

<script>
    $(function () {        
		$('#addnew').click(function(){
				window.location.href="User/addUser.jsp";
		 });
    });
	function delConfirm()
	{				
		if(confirm("确定要删除吗？"))
		{}
		else{
			return false;
		}
	}
</script>
</body>
</html>