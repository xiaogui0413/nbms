<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类列表</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="resources/bootstrap-3.3.7/css/bootstrap.css" rel="stylesheet" type="text/css" />
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <h2 style="text-align: center;">分类列表</h2>
    <table class="table table-bordered table-hover definewidth m10">
    	<caption class="captionAddOneLevel">
    	  <a href="<c:url value='/adminjsps/admin/category/add.jsp'/>">添加一级分类</a>
    	</caption>
    	<tr class="trTitle">
    		<th>分类名称</th>
    		<th>描述</th>
    		<th>操作</th>
    	</tr>
    	<tr class="trTitle">
    		<td>发电机</td>
    		<td>发电机分类</td>
    		<td>
    			<a href="添加二级分类"></a>
    			<a href="修改"></a>
    			<a href="删除"></a>
    		</td>
    	</tr>
    	
<c:forEach items="${parents }" var="parent">  	
    	<tr class="trOneLevel">
    		<td width="200px;">${parent.cname }</td>
    		<td>${parent.desc }</td>
    		<td width="200px;">
    		  <a href="<c:url value='/admin/AdminCategoryServlet?method=addChildPre&pid=${parent.cid }'/>">添加二级分类</a>
    		  <a href="<c:url value='/admin/AdminCategoryServlet?method=editParentPre&cid=${parent.cid }'/>">修改</a>
    		  <a onclick="return confirm('您是否真要删除该一级分类？')" href="<c:url value='/admin/AdminCategoryServlet?method=deleteParent&cid=${parent.cid }'/>">删除</a>
    		</td>
    	</tr>
   <c:forEach items="${parent.children }" var="child">
    	<tr class="trTwoLevel">
    		<td>${child.cname }</td>
    		<td>${child.desc }</td>
    		<td width="200px;" align="right">
    		  <a href="<c:url value='/admin/AdminCategoryServlet?method=editChildPre&cid=${child.cid }'/>">修改</a>
    		  <a onclick="return confirm('您是否真要删除该二级分类？')" href="<c:url value='/admin/AdminCategoryServlet?method=deleteChild&cid=${child.cid }'/>">删除</a>
    		</td>
    	</tr>
   </c:forEach>
</c:forEach>


    </table>
  </body>
</html>