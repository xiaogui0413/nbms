<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">  
    function ajaxTest(){  
        $.ajax({  
        data:"name="+$("#name").val(),  
        type:"GET",  
        dataType: 'json',  
        url:"testAction",  
        error:function(data){  
            alert("出错了！！:"+data.msg);  
        },  
        success:function(data){  
            alert("success:"+data.msg);  
            $("#result").html(data.msg) ;  
        }  
        });  
    }  
</script>  
</head>
<body>
    <input type="text" name="name" id="name"/>  
    <input type="submit" value="登录" onclick="ajaxTest();"/>  
    <div id="result"></div>
</body>
</html>