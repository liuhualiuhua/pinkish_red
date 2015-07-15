<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>哦哦，发生错误了</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href='http://fonts.googleapis.com/css?family=Capriola' rel='stylesheet' type='text/css'>
<style type="text/css">
body{
	font-family: 'Capriola', sans-serif;
}
body{
	background:#DAD6CC;
}	
.wrap{
	margin:0 auto;
	width:1000px;
}
.logo h1{
	font-size:200px;
	color:#FF7A00;
	text-align:center;
	margin-bottom:1px;
	text-shadow:4px 4px 1px white;
}	
.logo p{
	color:#B1A18D;;
	font-size:20px;
	margin-top:1px;
	text-align:center;
}	
.logo p span{
	color:lightgreen;
}	
.sub a{
	color:#ff7a00;
	text-decoration:none;
	padding:5px;
	font-size:13px;
	font-family: arial, serif;
	font-weight:bold;
}	
.footer{
	color:white;
	position:absolute;
	right:10px;
	bottom:10px;
}	
.footer a{
	color:#ff7a00;
}	
</style>
  </head>
  
  <body>
	<div class="wrap">
		<div class="logo">
			<h1>500</h1>
			<p> 哦哦，发生错误了</p>
			<div class="sub">
			   <p><a href="<%=basePath%>">返回首页</a></p>
			</div>
		</div>
	</div>
	
	<div class="footer">
	  
	</div>
  </body>
</html>
