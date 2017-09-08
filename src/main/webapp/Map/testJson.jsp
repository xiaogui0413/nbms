<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js"></script>
<title>Json测试</title>
</head>
<body>
<body>  
        <button onclick="clickJson()">点我</button>  
        <div id="div1"></div>  
          
        <script type="text/javascript"> 
        function clickJson(){
                  $.ajax({  
                       type: "POST",  
                       url: "testJson",  
                       dataType: "json", 
                       success: function(msg){  
                           //msg : 返回的json对象     // i :元素下标   , n : 遍历出来的学生对象  
                           $.each(msg,function(i,n){  
                                $("#div1").append("<p>"+n.setSn+","+n.setsDevName+","+n.setnState+"</p>");  
                           });  
                       }  
                });  
            }
        </script>  
  </body>  
</body>
</html>