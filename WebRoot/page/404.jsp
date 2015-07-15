<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>哦哦，页面没找到</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href='http://fonts.googleapis.com/css?family=Courgette' rel='stylesheet' type='text/css'>
<style type="text/css">
@font-face {
  font-family: 'Courgette';
  font-style: normal;
  font-weight: 400;
  src: local('Courgette Regular'), local('Courgette-Regular'), url(http://fonts.gstatic.com/s/courgette/v4/BHG8ZtTfO0yYnp02--Qxqj8E0i7KZn-EPnyo3HZu7kw.woff) format

('woff');
}

body{
	font-family: 'Courgette', cursive;
}
body{
	background:#f3f3e1;
}	
.wrap{
	margin:0 auto;
	width:1000px;
}
.logo{
	margin-top:50px;
}	
.logo h1{
	font-size:200px;
	color:#8F8E8C;
	text-align:center;
	margin-bottom:1px;
	text-shadow:1px 1px 6px #fff;
}	
.logo p{
	color:rgb(228, 146, 162);
	font-size:20px;
	margin-top:1px;
	text-align:center;
}	
.logo p span{
	color:lightgreen;
}	
.sub a{
	color:white;
	background:#8F8E8C;
	text-decoration:none;
	padding:7px 120px;
	font-size:13px;
	font-family: arial, serif;
	font-weight:bold;
	-webkit-border-radius:3em;
	-moz-border-radius:.1em;
	-border-radius:.1em;
}	
.footer{
	color:#8F8E8C;
	position:absolute;
	right:10px;
	bottom:10px;
}	
.footer a{
	color:rgb(228, 146, 162);
}	
</style>
  </head>
  <body>
    <div class="wrap">
	   <div class="logo">
	   <h1>404</h1>
	    <p>哦哦，页面没有找到</p>
  	      <div class="sub">
	        <p><a href="<%=basePath%>">返回首页</a></p>
	      </div>
        </div>
	</div>
	
	<div class="footer">
	  
	</div>
  </body>
</html>
