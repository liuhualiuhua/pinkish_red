<%@ page language="java" import="java.util.*,dao.*,dao.impl.*,entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Users users=(Users)session.getAttribute("users");
	if(users!=null){
		response.sendRedirect("manageIndex.jsp");
		return;
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>后台管理--登录页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	body{background-image:url(button/body_05.jpg);background-repeat:no-repeat; background-position:100px 190px;}
	table{margin:200px 400px 400px auto;;border:0px solid gray;text-align:center;}
	.button1{background-image:url(button/btn1.jpg); width:73px;height:26px;}
	.button2{background-image:url(button/btn2.jpg);width:73px;height:26px;}
	</style>
  </head>
  <body>
    <form method="post" action="">
    <table >
    <tr>
	    <td> </td>
	    <td><input type="text" name="name"></td>
    </tr>
        <tr>
	    <td> </td>
	    <td><input type="password" name="pass"></td>
    </tr>
        <tr>
	    <td colspan="2">
		    <input type="submit"  value="" class="button1">
		    <input type="reset" value="" class="button2">
	    </td>
	   
    </tr>
    </table>
    </form>
  </body>
</html>
