<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户日志信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/bootstrap-3.3.7/css/bootstrap.css" />
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
<form class="form-inline definewidth m20" action="selectByOperator" method="post">    

    	<div class="input-group input-group-sm">
			<span class="input-group-addon">操作人：</span>
			<input type="text" class="form-control" name="selectItem" id="username" value="" placeholder="操作人">
		</div>
		<button type="submit" class="btn btn-primary btn-sm">查询</button>&nbsp;&nbsp;

</form>
<table class="table table-bordered table-hover definewidth m10">
   <thead>
    <tr>
    	<th>操作人</th>
        <th>登录时间</th>
        <th>内容</th>
        <th>IP</th>
        <th>备注</th>
    </tr>
    </thead>
    <c:forEach var="userLog" items="${userLog }">
    <tr>
    	<td>${userLog.operator }</td>
       <td>${userLog.create_time }</td>
       <td>${userLog.content }</td>
       <td>${userLog.ip }</td>
       <td>${userLog.remark }</td>
    </tr>
	</c:forEach>
</table>

<div class="inline pull-right page">
<ul class="pagination">
	<li><a>共${page.total}条记录</a></li>
	<li><a>第${page.pageNum}页/共${page.pages}页</a></li>
	<li><a href="logInfo?page=${page.firstPage}">&laquo;</a></li>
	<li><a href="logInfo?page=${page.prePage}">上一页</a></li>
	<li><a href="logInfo?page=${page.nextPage}">下一页</a></li>
	<li><a href="logInfo?page=${page.pages}">&raquo;</a></li>
</ul>
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
					 //console.log($(obj).parent().parent());
					 //$(obj).parent().parent().css('background','red');
					 $(obj).parent().parent().addClass('success');
				}				
			}
		});		
	}
</script>
</body>
</html>