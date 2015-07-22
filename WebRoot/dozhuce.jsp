..<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dozhuce.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
request.setCharacterEncoding("utf-8");
 String name=request.getParameter("name");
String password=request.getParameter("pass");
String password1=request.getParameter("pass1");
String head=request.getParameter("touxiang");

  UsersDao usersDao=new UsersDaoImpl();
  Users users1=usersDao.findUsers(name);
  if(users1.getName()!=null){
  out.print("<script>alert('对不起该用户以被注册');location.href='pinhongzhuce.jsp'</script>");
 }else{
Users users=new Users();
users.setName(name);
users.setPass(password);
users.setPass(password1);
users.setHead("img/"+head);
users.setRole(1);
   int i=usersDao.addUsers(users);  
      
  if(password.equals("password1")){
  if(i==1){
   request.setAttribute("users",users);
    request.getRequestDispatcher("pinhongdenglu.jsp").forward(request,response);
  }else{
    request.getRequestDispatcher("pinhongzhuce.jsp").forward(request,response); 
  }
  
  }else{
     request.getRequestDispatcher("pinhongdenglu.jsp").forward(request,response);
  }
}
    %>

  </body>
</html>
