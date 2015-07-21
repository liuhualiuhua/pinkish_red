<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'luentan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <title>taobao jquery js lephy</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <style type="text/css">
<!--
.STYLE7 {font-size: large; font-weight: bold; color: #FF0000; }
.STYLE9 {font-size: small; font-weight: bold; color: #666666; }
.STYLE13 {font-size: medium; font-weight: bold; color: #000000; }
.STYLE15 {font-size: large; font-weight: bold; color: #0099CC; }
.STYLE17 {font-size: medium; font-weight: bold; color: #FF0000;}
.STYLE18 {font-size: medium; font-weight: bold;color: #000000; }
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
                                             <%
         	  Users users=(Users)session.getAttribute("users");
                if(users==null){
                  %>
               <h1><a href="#"></a>&nbsp;|&nbsp;<a href="#">尚未登录</a></h1>
                    <%
        	   }else{
        	   
             %>欢迎<span class="STYLE2"><%=users.getName()%></span>来到品红网
           <h1>&nbsp;|&nbsp;<a href="zhuxiao.jsp">退出</a></h1>
              <%
           	}
              %>
                     
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
				
				
				
				
			<div class="top-main">
        <div class="search-wrapper">
          <div class="search-box">
           <div  id="arrow8" class="search-toggle"> 宝贝  </div>
    <input type="button" class="search-but" value="搜索"><input type="text" size="78">  
		 </div>
		 <br> <br> <br>
		 
		 <table width="40%" border="0" cellspacing="0" cellpadding="0">
  <tr></tr>
    <td>	         <div class="right-con">
            <div class="nav">
          <a id="spe-a1" href="#">首页</a>
            <a id="spe-a2" href="#">最新上架</a>
		   <a id="spe-a2" href="#">最新公告</a>
          <a id="spe-a3" href="#">逛逛论坛</a>
           <a id="spe-a3" href="#">后台管理</a>
           <a id="spe-a3" href="#">在线服务</a>
                <img style="cursor: pointer" src="img/ad.gif" />
                <span class="keep-a"><a href="#">消费者保障</a></span>
            </div></td>

</table>
<br><br>
<table width="116%" height="68" align="center" border="2" bordercolor="#B5E9EE" cellpadding="0" cellspacing="0">
  
  <tr>
    <td align="center"><span class="STYLE15">标题</span></td>
    <td align="center"><span class="STYLE15">用户名</span></td>
    <td align="center"><span class="STYLE7">发表时间</span></td>
  </tr>
  <%
 int topicId=Integer.parseInt(request.getParameter("topicId"));
       TopicDao topicDao=new TopicDaoImpl(); 
          int count1=topicDao.findCountTopic(topicId);
         String page1=request.getParameter("page");
         if(page1==null){
            page1="1";
         }
          int pages=Integer.parseInt(page1);
         %>
       
    <%
      
      List list=topicDao.findList(pages);
      for(int i=0;i<list.size();i++){
         Topic topic=(Topic)list.get(i);
         
 %>
 
  <tr>
    <td align="center"><a href="luentanfabiao.jsp?topicId=<%=topic.getTopicId()%>&userId=<%=topic.getUserId() %>"><span class="STYLE17"><%=topic.getTitle()%></span></a></td>
    <td align="center"><span class="STYLE18"><%=topic.getUserName() %></span></td>
    <td align="center"><span class="STYLE9"><%=topic.getPostTime() %></span></td>
  </tr>
     <%} %>
     <%
     Topic topic=new Topic();
     System.out.println(count1);
      %>
      <br><br>
    <tr >
    <td height="20" align="center">
     <a href="luentan.jsp?page=<%=pages==1?1:pages-1%>&topicId=<%=topic.getTopicId()%>"">上一页</a>|
     <a href="luentan.jsp?page=<%=pages==count1?count1:pages+1%>&topicId=<%=topic.getTopicId()%>"">下一页</a></td>
  </tr>
</table>

    <div class="help">
        <div class="help-info">
            <h1><img src="img/help4.png"><span class="help-text">消费者保障</span></h1>
            <a class="help-a" href="#">保障范围</a>
            <a class="help-a" href="#">退货退款流程</a>
            <a class="help-a" href="#">服务中心</a>
            <a class="help-a" href="#">更多特色服务</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help1.png"><span class="help-text">新手上路</span></h1>
            <a class="help-a" href="#">新手专区</a>
            <a class="help-a"v href="#">消费警示</a>
            <a class="help-a" href="#">交易安全</a>
            <a class="help-a margin-r" href="#">24小时在线帮助</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help2.png"><span class="help-text">付款方式</span></h1>
            <a class="help-a-litter" href="#">支付宝快捷支付</a>
            <a class="help-a-litter" href="#">支付宝卡（现金）付款</a>
            <a class="help-a-litter" href="#">支付宝余额付款</a>
            <a class="help-a" href="#">货到付款</a>
        </div>
        <div class="help-info">
            <h1><img src="img/help3.png"><span class="help-text">品红特色</span></h1>
            <a class="help-a" href="#">品红指数</a>
            <a class="help-a" href="#">品公仔</a>
            <a class="help-a" href="#">手机品红</a>
            <a class="help-a" href="#">旺信</a>
        </div>
    </div>
    <!--footer-->
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

    <!--backtoTop1-->
    <!--兼容所有现代浏览器同时包括 ie6/7/8/9 （ie6会有一点点抖动）-->
    <div class="backtoTop" id="backToTop1">
        <div id="backToTop-up" class="up-back"><i class="fa fa-angle-up"></i></div>
        <div id="backToTop-down" class="down-back"><i class="fa fa-angle-down"></i></div>
    </div>

    <script src="js/main.js"></script>
    <script src="js/img-show.js"></script>

</body>
</html>
