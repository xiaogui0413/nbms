<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'/>
    <title>NB-IOT物资定位管理系统</title>
    <link href="${pageContext.request.contextPath }/Public/style/a.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath }/Public/img/dianxin.ico" rel="shotcut icon"/>
</head>
<body style="margin:0;padding:0;position:absolute;">
<header>
    <div class="text">
        <!-- <a><em>加入收藏</em>|<span>联系我们</span></a> -->
    </div>
</header>
<div id="content" style="padding-top:20px;">
    <img src="${pageContext.request.contextPath }/Public/img/jian.png"/>
    <h1>物资定位管理系统</h1>
    <form method="post" action="${pageContext.request.contextPath }/userLogin">
    	<label class="error" id="msg">${msg }</label><br>
        <input  id="usename" type="text" name="username" placeholder="用户名"/><br/>
        <input  id="password" type="password" name="password" placeholder="密码"/><br/>
        <div class="bt clear">
            <!-- <input class="check fl" type="checkbox" value=""/> -->
            <!-- <span class="fl">记住密码</span>
            <em class="fl">忘记密码？</em> -->
            <center><input id="submit" type="submit" value="登录"/></center><br/>
        </div>
    </form>
</div>
<div style="text-align:center;width:100%;height:170px;background:#27a9e3;color:#fff;position:absolute;bottom:0;">
    <p><span>© 2017 深圳市意格尔数字技术有限公司</span></p>
</div>
</body>
</html>