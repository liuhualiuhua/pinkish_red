<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'luentanhuifu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <style type="text/css">
<!--
.STYLE18 {font-size: medium}
.STYLE19 {
	color: #FF0000;
	font-weight: bold;
}
.STYLE20 {color: #0000FF}
.STYLE21 {color: #00FFFF; font-weight: bold; }
-->
    </style>
  </head>
  
<body>
    <!--scroll-head-->
    <div class="scroll-head"></div>
    <!--top-->
    <div class="top-wrapper">
        <div class="top-info">
            <div class="top-left">
                <div data-toggle="arrowdown" id="arrow1" class="user-name">
                    <a href="#">用户信息</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow2" class="msg-info">
                    <i class="fa fa-envelope fa-gray"></i>
                    <a href="#">消息</a>
                    <span class="down-icon"></span>
                </div>
                <a class="a-float-left" href="#">手机品红</a>
                
                <!--hidden-box-->
                <div data-toggle="hidden-box" id="nav-box1" class="user-box">
                    <img class="my-head" src="img/user-head.jpg" />
                    <div class="my-grow">
                        <h1><a href="#">账号管理</a>&nbsp;|&nbsp;<a href="#">退出</a></h1>
                   
                      <h2><a href="#">查看我会员特权</a></h2>
                            <a href="#">我的成长</a>
                       
                    </div>
                    <p style="height: 10px; clear: both;">&nbsp;</p>
                    <div class="my-card">
                        <div class="cards-info">
                            <ul>
                                <li><img src="img/icon.png" /></li>
                                <li><img src="img/icon.png" /></li>
                            </ul>
                        </div>
                        <div class="toggle-box">
                            <div class="toggle">
                                 <i style="vertical-align: top" class="fa fa-angle-left arrow-left"></i>
                                 <i style="vertical-align: top" class="fa fa-angle-right arrow-right"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div data-toggle="hidden-box" id="nav-box2" class="msg-box">
                    <h1>未读新消息<a href="#" class="fa fa-pencil-square-o pencil"></a></h1>
                    <div class="read-info">
                        <h2><span class="orange">&nbsp;&nbsp;|</span>&nbsp;你的书架&nbsp;<span style="font-weight: lighter">收到了<span class="orange">1</span>本书</span><span class="fa fa-times close-msg"></span></h2>
                        <img src="img/book-1.png" />
                        <div style="float: right">
                            <p>
                                全中国最穷的小伙子发财日记<br/>
                                掏彩票公共账<br/>
                               
                            </p>
                            <h3><a href="#">去看看</a></h3>
                        </div>
                    </div>
                    <div class="msg-setting">
                        <a href="#" class="fa fa-cog"></a>
                        <a href="#" class="fa fa-pencil-square-o"></a>
                        <a style="margin-left: 70px" href="#">买家消&nbsp;|&nbsp;</a>
                        <a href="#">卖家消息</a>
                    </div>
                </div>
            </div>
            <!--top-right-->
            <div class="top-right">
                <div data-toggle="arrowdown" id="arrow3" class="user-name">
                    <a href="#">我的品红</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-shopping-cart fa-orange"></i>
                    <a href="#">购物车</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-star fa-gray"></i>
                    <a href="#">收藏夹</a>
                    <span class="down-icon"></span>
                </div>
                <a class="a-float-left" href="#">商品分类</a>
                <span class="vertical-line">|</span>
                <div data-toggle="arrowdown" id="arrow6" class="user-name">
                    <a href="#">卖家中心</a>
                    <span class="down-icon"></span>
                </div>
                <a class="a-float-left" href="#">客户联系</a>
                <div data-toggle="arrowdown" id="arrow7" class="user-name">
                    <i class="fa fa-list-ul fa-orange"></i>
                    <a href="#">网站导航</a>
                    <span class="down-icon"></span>
                </div>
				
</div>


<br><br><br><br><br><br>
<table width="90%"  border="0" cellpadding="0" cellspacing="0" >
 <%
  int topicId=Integer.parseInt(request.getParameter("topicId"));
       TopicDao topicDao=new TopicDaoImpl(); 
         Topic topic=topicDao.findTopic(topicId);
         int count1=topicDao.findCountTopic(topicId);
         String page1=request.getParameter("page");
           if(page1==null){
             page1="2";
          }
            int pages=Integer.parseInt(page1);
                 
  %>
 <%
   int userId=Integer.parseInt(request.getParameter("userId"));
     UsersDao usersDao=new UsersDaoImpl(); 
    Users users=usersDao.findUsers(userId);
    System.out.println(users.getHead());
  %>
  <tr>
    <td width="29%" height="24" align="center"><span class="STYLE18"><a href="fatie.jsp" class="STYLE19">发表帖子</a></td>
  </tr>
  <tr>
    <td height="46" align="center" valign="middle"><span class="STYLE18"><%=topic.getUserName() %></span></td>
    <td width="71%" align="left"><span class="STYLE18"><br><br><%=topic.getTitle() %></span></td>
  </tr>
  <tr>
    <td rowspan="2" align="center"><img src="<%=users.getHead()%>" width="100" height="80"></img></td>
    <td height="29" align="left" valign="top"><span class="STYLE18"><%=topic.getContent() %></span></td>
  </tr>
  <tr>
    <td height="34"><span class="STYLE18">[<%=topic.getPostTime() %>]</span></td>
  </tr>
 
  
      <td width="29%" height="38" align="center"><span class="STYLE18"><a href="fatie.jsp" class="STYLE19"><br /><br />回帖信息：</a></td>
   
  <%
       TopicDao topicDaos=new TopicDaoImpl(); 
       List list=topicDaos.findListTop(pages,topicId);
         for(int i=0;i<list.size();i++){
          Topic  topics=(Topic)list.get(i);    
   %>
   
  <tr>
    <td height="35" align="center" valign="middle"><span class="STYLE18"><%=topics.getUserName()%></span></td>
    <td width="71%" align="left"><span class="STYLE18"><%=topics.getTitle() %></span></td>
  </tr>
  <tr>
    <td rowspan="2" align="center"><img src="<%=users.getHead()%>" width="100" height="80"></img></td>
    <td height="34" align="left" valign="top"><span class="STYLE18"><%=topics.getContent() %></span></td>
  </tr>
  <tr>
    <td height="26"><span class="STYLE18">[<%=topics.getPostTime()%>]</span></td>
  </tr>
    <%} %>
<%
Topic  topicq=new Topic();
 %>
  <tr>
   <td height="24" align="right"><span class="STYLE18">
   <a href="luentanfabiao.jsp?page=<%=pages==1?1:pages-1 %>&topicId=<%=topicq.getTopicId()%>" class="STYLE8">上一页</a>|
   <a href="luentanfabiao.jsp?page=<%=pages==count1?count1:pages+1%>&topicId=<%=topic.getTopicId()%>" class="STYLE8">下一页</a>   </td>
  </tr>
</table>

    <!--footer-->
	<br><br><br>
    <div class="footer">
        <div class="footer-right">
            <div class="footer-nav">
                <a href="#">阿里巴巴集团</a>|
                <a href="#">阿里巴巴国际站</a>|
                <a href="#">阿里巴巴中国站</a>|
                <a href="#">全球速卖通</a>|
                <a href="#">淘宝网</a>|
                <a href="#">天猫</a>|
                <a href="#">聚划算</a>|
                <a href="#">一淘</a>|
                <a href="#">阿里妈妈</a>|
                <a href="#">阿里云计算</a>|
                <a href="#">云OS</a>|
                <a href="#">万网</a>|
                <a href="#">支付宝</a>|
                <a href="#">来往</a>
            </div>
            <div class="about-tao">
                <a href="#">关于品红</a>
                <a href="#">合作伙伴</a>
                <a href="#">营销中心</a>
                <a href="#">廉正举报</a>
                <a href="#">联系客服</a>
                <a href="#">开放平台</a>
                <a href="#">诚征英才</a>
                <a href="#">联系我们</a>
                <a href="#">网站地图</a>
                <a href="#">法律声明</a>
                <span class="gary-text">&copy; 2014 Taobao.com 版权所有</span>
            </div>
            <p class="gary-text"><span>网络文化经营许可证：文网文[2010]040号</span>|<span>增值电信业务经营许可证：浙B2-20080224-1</span>|<span>信息网络传播视听节目许可证：1109364号</span></p>
            <div class="some-info">
                <img src="img/some.png" />
            </div>
        </div>
        <div class="tao-man">
            <img src="img/tao-man.png" />
        </div>
    </div>



</body>
</html>
