<%@ page language="java" contentType="text/html; charset=utf-8"  
    pageEncoding="utf-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<script type="text/javascript" src="js/jquery-2.1.3.js"></script>  
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=utf8">  
<title>Insert title here</title>  
<script type="text/javascript">
function aa(){
	 alert("--------");
  $.ajax({
		type : "POST",
		url : "listDevAttr2",
		dataType : 'json',
		success : function (data){
			alert(data);

		}
	});
}
</script>
<script type="text/javascript"> 
function myClick() {
alert("aaaa121");
    $.ajax({

              type : "post",
              url : "testJson1",
              //设置contentType类型为json
              contentType : "application/json;charset=utf-8",
              //json数据
             /*  data : "{userName:reader001,password:psw001}", */
              //请求成功后的回调函数
              success : function(data) {
                       alert(data.userName);
                       alert("mylove");
              }
    });
}
</script> 

</head>  
<body>  
	<input type="button" value="json" onclick="myClick();">
    <input type="text" name="name" id="name"/>
    <input type="submit" value="登录" onclick="ajaxTest1();"/>
    <div id="result"></div>  
    <input type="button" value="提交" onclick="aa();">
</body>
</html>