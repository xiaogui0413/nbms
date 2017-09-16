<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑用户</title>
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
<form action="updateUser" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
    	<tr>
            <td width="10%" class="tableleft">用户ID</td>
            <td><input type="text" name="id" readonly="readonly" value="${userData.id }"/></td>
        </tr>
        <tr>
            <td width="10%" class="tableleft">用户名称</td>
            <td><input type="text" name="clerkName" value="${userData.clerkName }"/></td>
        </tr>      
        <tr>
            <td width="10%" class="tableleft">密码</td>
            <td><input type="password" name="password" value="${userData.password }"/></td>
        </tr>
        <tr>
            <td class="tableleft">手机</td>
            <td><input type="text" name="contact" value="${userData.contact }"/></td>
        </tr>
        <tr>
            <td class="tableleft">邮箱</td>
            <td><input type="text" name="emailAddr" value="${userData.emailAddr }"/></td>
        </tr>
        <tr>
            <td class="tableleft">地址</td>
            <td><input type="text" name="address" value="${userData.address }"/></td>
        </tr>
        <tr>
            <td class="tableleft">备注</td>
            <td><input type="text" name="memo" value="${userData.memo }"/></td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button" id="saveid">保存</button>&nbsp;&nbsp;
                <button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="selectUserList";
		 });

    });
</script>
</body>
</html>