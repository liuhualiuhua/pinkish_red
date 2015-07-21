<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dodenglu.jsp' starting page</title>
    
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
   String names= request.getParameter("names");
   
  String name2=(String)  session.getAttribute("check");
 
  
  if(names.equals(name2)){
	  request.setCharacterEncoding("utf-8");
      String name=request.getParameter("name");
      String password=request.getParameter("pass");
       out.print(name+password);


    UsersDao usersDao=new UsersDaoImpl();
   Users users=usersDao.dodenglu(name,password);
   
   
   
   if(users.getUserId()!=0){
   session.setAttribute("user",users);
   		Cart cart = (Cart) session.getAttribute("cart");
		if (cart != null && cart.calTotal() > 0.0) {
			ItemDao itemDao = new ItemDaoImpl();
			Order order = new Order();
			order.setOrderId(0);
			order.setUserId(users.getUserId());
			itemDao.addCart(cart, order);
			session.removeAttribute("cart");
			cart.clear();
		}
   
   

    request.getRequestDispatcher("pinhongshouye.jsp").forward(request,response);
}else{
    request.getRequestDispatcher("pinhongdenglu.jsp").forward(request,response); 
}
}else{
   %>
   <script>
   alert("验证码不匹配");
   history.back();
   </script>
   <%
   return;
   }
 %>




  </body>
</html>
