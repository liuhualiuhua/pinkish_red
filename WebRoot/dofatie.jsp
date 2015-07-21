<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dofatie.jsp' starting page</title>
    
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
     Users users=(Users)session.getAttribute("user");
	SimpleDateFormat formats=new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
    String modifytime =formats.format(new Date());

      TopicDao topicDao=new TopicDaoImpl();
          Topic topic=new Topic();
     
     int replyId=Integer.parseInt(request.getParameter("replyId"));
     
     topic.setTitle(request.getParameter("title"));
     topic.setContent(request.getParameter("content1"));
     topic.setUserId(users.getUserId());
     topic.setReplyId(replyId);
     topic.setPostTime(modifytime);
     topic.setUserName(users.getName());
     int i=topicDao.addTopic(topic);
     
     if(i==0){
     out.print("<script>alert('发帖失败');location.href='fatie.jsp'</script>");
     }else{
     out.print("<script>alert('发帖成功');location.href='luentan.jsp?topicId="+topic.getTopicId()+"'</script>");
     }
%>
  </body>
</html>
