<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>

<base href="<%=basePath%>">
    <title>品红商城</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <style>
   .STYLE1 {font-size: small}
   .STYLE2 {font-size: small;color:ff0000}
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
                <a class="a-float-left" href="#">手机品红</a><!--hidden-box-->
                <div data-toggle="hidden-box" id="nav-box1" class="user-box">
                    <img class="my-head" src="img/user-head.jpg" />
                    <div class="my-grow">
                     <%
         	  Users users=(Users)session.getAttribute("user");
                if(users==null){
                  %>
               <h1><a href="#"></a>&nbsp;|&nbsp;<a href="pinhongdenglu.jsp">尚未登录</a></h1>
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
                        <h2><span class="orange">&nbsp;&nbsp;|</span>&nbsp;你的书架&nbsp;<span style="font-weight: lighter">收到了<span class="orange">1</span全中国最穷的小伙子发财日记><br/>
                                掏彩票公共账>本书</span><span class="fa fa-times close-msg"></span></h2>
                        <img src="img/book-1.png" />
                        <div style="float: right">
                            <p>
                                全中国最穷的小伙子发财日记<br/>
                                掏彩票公共账号
                            </p>
                            <h3><a href="#">去看看</a></h3>
                        </div>
                    </div>
                    <div class="msg-setting">
                        <a href="#" class="fa fa-cog"></a>
                        <a href="#" class="fa fa-pencil-square-o"></a>
                        <a style="margin-left: 70px" href="#">买家消息&nbsp;|&nbsp;</a>
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
                <div id="arrow4" class="user-name">
                    <i class="fa fa-shopping-cart fa-orange"></i>
                    <a href="cart.jsp">购物车</a>
                
                </div>
                <div data-toggle="arrowdown" id="arrow5" class="user-name">
                    <i class="fa fa-star fa-gray"></i>
                    <a href="pinhongshouye.html">收藏夹</a>
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
                <!--hidden-box-->
                <div data-toggle="hidden-box" id="nav-box3" class="my-taobao-box">
                    <ul>
                        <li><a href="order2.jsp">我的订单</a></li>
                        <li>新欢</li>
                        <li>我的足迹</li>
                        <li>我的上新</li>
                        <li>我的优惠</li>
                    </ul>
                </div>
                <div  id="nav-box4" class="shopping-box">
                    <span>您购物车里还没有任何宝贝。</span><a class="check-shopp" href="cart.jsp">查看我的购物车</a>
                </div>
                <div  id="nav-box5" class="get-box">
                    <ul>
                        <li>收藏的宝贝</li>
                        <li>收藏的店铺</li>
                    </ul>
                </div>
                <div  id="nav-box6" class="center-box">
                    <ul>
                        <li>已卖出的宝贝</li>
                        <li>出售中的宝贝</li>
                        <li>卖家服务市场</li>
                        <li>卖家培训中心</li>
                    </ul>
                </div>
                <div  id="nav-box7" class="nav-box">
                    <div class="sub-nav top-sub-nav">
                        <!--<input type="button" class="more-btn" value="更多"/>-->
                        <!--sub-nav-cell-->
                        <div class="sub-nav-cell right-shadow">
                            <h3 class="orange">主题市场</h3>
                            <ul class="sub-nav-box">
                                <li><a href="#">爱美女人</a></li>
                                <li><a href="#">品质男人</a></li>
                                <li><a href="#">淘宝二手</a></li>
                                <li><a href="#">全球购</a></li>
                                <li><a href="#">品牌街</a></li>
                                <li><a href="#">汽车生活</a></li>
                                <li><a href="#">花嫁新娘</a></li>
                                <li><a href="#">孕婴童</a></li>
                                <li><a href="#">同城便民</a></li>
                                <li><a href="#">爱么装</a></li>
                                <li><a href="#">运动户外</a></li>
                                <li><a href="#">家用电器</a></li>
                                <li><a href="#">狠爱</a></li>
                                <li><a href="#">网络游戏</a></li>
                                <li><a href="#">潮流设计</a></li>
                                <li><a href="#">淘宝星愿</a></li>
                            </ul>
                        </div>
                        <div class="sub-nav-cell right-shadow">
                            <h3 class="green-sp">特色购物</h3>
                            <ul class="sub-nav-box sp">
                                <li><a href="#">爱美女人</a></li>
                                <li><a href="#">品质男人</a></li>
                                <li><a href="#">淘宝二手</a></li>
                                <li><a href="#">全球购</a></li>
                                <li><a href="#">品牌街</a></li>
                                <li><a href="#">汽车生活</a></li>
                                <li><a href="#">花嫁新娘</a></li>
                                <li><a href="#">孕婴童</a></li>
                                <li><a href="#">同城便民</a></li>
                                <li><a href="#">爱么装</a></li>
                                <li><a href="#">运动户外</a></li>
                                <li><a href="#">家用电器</a></li>
                                <li><a href="#">狠爱</a></li>
                                <li><a href="#">网络游戏</a></li>
                                <li><a href="#">潮流设计</a></li>
                                <li><a href="#">淘宝星愿</a></li>

                            </ul>
                        </div>
                        <div class="sub-nav-cell right-shadow">
                            <h3 class="red-now">当前热点</h3>
                            <ul class="sub-nav-box now">
                                <li><a href="#">爱美女人</a></li>
                                <li><a href="#">品质男人</a></li>
                                <li><a href="#">淘宝二手</a></li>
                                <li><a href="#">全球购</a></li>
                                <li><a href="#">品牌街</a></li>
                                <li><a href="#">汽车生活</a></li>
                                <li><a href="#">花嫁新娘</a></li>
                                <li><a href="#">孕婴童</a></li>
                                <li><a href="#">同城便民</a></li>
                                <li><a href="#">爱么装</a></li>
                                <li><a href="#">运动户外</a></li>
                                <li><a href="#">家用电器</a></li>
                                <li><a href="#">狠爱</a></li>
                                <li><a href="#">网络游戏</a></li>
                                <li><a href="#">潮流设计</a></li>
                                <li><a href="#">淘宝星愿</a></li>

                            </ul>
                        </div>
                        <div class="sub-nav-cell">
                            <h3 class="blue-more">更多精彩</h3>
                            <ul class="sub-nav-box more">
                                <li><a href="#">爱美女人</a></li>
                                <li><a href="#">品质男人</a></li>
                                <li><a href="#">淘宝二手</a></li>
                                <li><a href="#">全球购</a></li>
                                <li><a href="#">品牌街</a></li>
                                <li><a href="#">汽车生活</a></li>
                                <li><a href="#">花嫁新娘</a></li>
                                <li><a href="#">孕婴童</a></li>
                                <li><a href="#">同城便民</a></li>
                                <li><a href="#">爱么装</a></li>
                                <li><a href="#">运动户外</a></li>
                                <li><a href="#">家用电器</a></li>
                                <li><a href="#">狠爱</a></li>
                                <li><a href="#">网络游戏</a></li>
                                <li><a href="#">潮流设计</a></li>
                                <li><a href="#">淘宝星愿</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--scroll-top-->
        <div class="scroll-search">
            <div class="search-litter">
                <img class="scroll-logo" src="img/logo.png" />
                <!--scroll-search-->
                <div class="search-wrapper-scroll">
                    <div class="search-box-scroll">
                        <div data-toggle="arrowdown" id="arrow9" class="search-toggle-scroll">
                            宝贝<span class="down-icon"></span>
                        </div>
                        <input class="search-in-scroll" type="text" placeholder="    搜‘健康椅’试试，办公好选择" />
                        <input type="button" class="search-but-scroll" value="搜索">
                        <div data-toggle="hidden-box" id="nav-box9" class="search-toggle-box-scroll">店铺</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--top-main-->
	<br>
    <div class="top-main">
        <img src="img/logo.gif" />
        <div class="search-wrapper">
          <div class="search-box">
                <div  id="arrow8" class="search-toggle">
                    宝贝                </div>
  <input type="button" class="search-but" value="搜索"><input type="text" size="78">
         
          </div>
            <a class="a-float-left hight-search" href="#">高级<br/>搜索</a>
            <!--other-search-->
            <div class="other-search">
                <a href="#">女士凉鞋</a>
                <a href="#">男士T恤</a>
                <a href="#">连衣裙</a>
                <a href="#">时尚女包</a>
                <a href="#">女士T恤</a>
                <a href="#">雪纺衫</a>
                <a href="#">中老年女装</a>
                <a href="#">风衣</a>
                <a href="#">童装</a>
                <a href="#">孕妇装</a>
                <a href="#">运动套装</a>
                <a href="#">打底裤</a>
                <a href="#">蚊帐</a>
                <a href="#" class="more-other">更多<i class="fa fa-angle-right"></i></a>
            </div>
      </div>
        <!--two-code-->
        <div class="two-code">
            <h3>手机品红二维码</h3>
            <img src="img/code.png" />
            <div class="close-code"><i class="fa fa-times"></i></div>
        </div>
</div>
    <!--content-top-->
    <div class="content-top">
        <!--sidebar-->
        <div class="sidebar">
            <h3>商品服务分类</h3>
            <!--sidebar-info-->
            <div class="sidebar-info">
                <ul class="side-li">
				    <br><br><br><br><br><br><br>
                    <li class="s_1"><h3>服装商城<span class="fa fa-angle-right fa-loc"></span></h3></li>
					     <br><br><br><br>
                    <li class="s_5"><h3>手机数码<span class="fa fa-angle-right fa-loc"></span></h3></li>
					       <br><br><br><br>
                    <li class="s_12"><h3>日用百货<span class="fa fa-angle-right fa-loc"></span></h3></li>
                             <br><br><br><br>
                    <li class="s_16"><h3>虚拟服务<span class="fa fa-angle-right fa-loc"></span></h3></li>
                </ul>
                <!--hidden-li-box-->
                <ul class="hiden-box">
                    <li data-hidden="li" id="hiden-1">
                        <div class="hidden-title">
                            <a href="#">品红女人</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                            <a href="#">品红男人</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                        </div>
                        <div class="sub-nav-right">
                            <div class="cell-box">
                                <h1>品红女装</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">唯一</a><span>|</span>
                                    <a href="#">雪绒钱</a><span>|</span>
                                    <a href="#">类似雪纺</a><span>|</span>
                                    <a href="#">毛衣外套</a><span>|</span>
                                </div>
                            </div>
                            <div class="cell-box">
                                <h1>品红男装</h1>
                                <div class="a-box">
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖T恤</a><span>|</span>
                                    <a href="#">棒球服</a>
                                    <a href="#">牛仔装</a><span>|</span>
                                </div>
                            </div>
                        </div>
                    <li data-hidden="li" id="hiden-5">
                        <div class="hidden-title">
                            <a href="#">品红电器</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                        </div>
                        <div class="sub-nav-right">
                            <div class="cell-box">
                                <h1>品红电器</h1>
                                <div class="a-box">
                                    <a href="#">台式电脑</a><span>|</span>
                                    <a href="#">笔记本电脑</a><span>|</span>
                                    <a href="#">手机</a><span>|</span>
                                    <a href="#">其他电器</a><span>|</span>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li data-hidden="li" id="hiden-12">
                        <div class="hidden-title">
                            <a href="#">品红日用百货</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                        </div>
                        <div class="sub-nav-right">
                            <div class="cell-box">
                                <h1>品红日用百货</h1>
                                <div class="a-box">
                                    <a href="#">连衣裙</a><span>|</span>
                                    <a href="#">裤子</a><span>|</span>
                                    <a href="#">小西装</a><span>|</span>
                                    <a href="#">长袖村上</a><span>|</span>
                                    <a href="#" class="orange">春季外套</a>
                                </div>
                            </div>                        
                    </li>
                
                  
                    <li data-hidden="li" id="hiden-16">
                        <div class="hidden-title">
                            <a href="#">品红虚拟服务</a><span class="right-box"><i class="fa fa-angle-right"></i></span>
                        </div>
                        <div class="sub-nav-right">
                            <div class="cell-box">
                                <h1>品红虚拟服务</h1>
                                <div class="a-box">
                                    <a href="#">Q币充值</a><span>|</span>
                                    <a href="#">话费充值</a><span>|</span>
                                    <a href="#">游戏充值</a><span>|</span>
                                    <a href="#">其他充值</a><span>|</span>
                                </div>
                            </div>
                           
                        </div> 
                  </div>
        
      </div>
 
    
      <div class="right-con">
            <div class="nav">
    <% 
    NewsDao newsDaos=new NewsDaoImpl();
    List lists=newsDaos.findList();        
     News newss=(News)lists.get(1);  
   
   TopicDao topicDao=new TopicDaoImpl();
    List listt=topicDao.findList(1);        
     Topic topic=(Topic)listt.get(1);  
     
   GoodsDao goodsDao=new GoodsDaoImpl();
      List listi=goodsDao.findListGoods(1);
      Goods goods=(Goods)listi.get(1);
     %> 
            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; <a id="spe-a1" href="#">首页</a>
           &nbsp;&nbsp;   &nbsp;&nbsp;  <a id="spe-a2" href="shangpinshangjia.jsp?goodsId=<%=goods.getGoodsId()%>">最新上架</a>
			 &nbsp;&nbsp; &nbsp;&nbsp;<a id="spe-a2" href="xinwen.jsp?newsId=<%=newss.getNewsId()%>">最新快报</a>
             &nbsp;&nbsp;  &nbsp;&nbsp; <a id="spe-a3" href="luentan.jsp?topicId=<%=topic.getTopicId()%>">逛逛论坛</a>
            &nbsp;&nbsp;  &nbsp;&nbsp; <a id="spe-a3" href="manageLogin.jsp">后台管理</a>
            &nbsp;&nbsp;  &nbsp;&nbsp; <a id="spe-a3" href="page/chatroom.jsp">在线聊天室</a>
          &nbsp;&nbsp;  &nbsp;&nbsp; <a id="spe-a3" href="service.jsp">在线服务</a>
          
                
                <span class="keep-a"><a href="#">消费者保障</a></span>
            </div>
           
            <!--show-box-->
            
            
            <div class="show-box">
                <!--content-->
                <div class="content">
                    <ul class="imgBox">
                  <%
                 GoodsDao goodsDaos=new GoodsDaoImpl();
                  List listq=goodsDao.findList();
                for(int i=0;i<listq.size();i++){
                Goods goodsw=(Goods)listq.get(i);  
                    %>
                  <li>
                  <a href="jiaru.jsp?goodsId=<%=goodsw.getGoodsId()%>">
                  <img src="<%=goodsw.getPic()%>"></img></a></li>
                   <%}%>
                    </ul>
                    <div class="currentNum">
                        <span class="imgNum mark-color"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                        <span class="imgNum"></span>
                    </div>
                    <div class="control to-left"><i class="fa fa-angle-left"></i></div>
                    <div class="control to-right"><i class="fa fa-angle-right"></i></div>
              </div>
               <a style="float: left" href="#"><img src="img/9.png" /></a>
                <!--content-down-->
                <div class="content-down">
           <a href="#"><img src="img/6.png"></a>       
                </div>
                <a style="float: left" href="#"><img src="img/10.png" /></a>
            </div>
          <!--right-sidbar-->
            <div class="right-sidebar">
              <div class="info-box">
                <ul class="tab-nav">
                  <li id="li-1" class="li-nav li-nav-hover li-border">品红快报<a href="#"></a></li>
                </ul>
     
        
         <table width="99%" border="0" cellspacing="0" cellpadding="0">
    <% 
    NewsDao newsDao=new NewsDaoImpl();
    List list=newsDao.findList();        
    for(int i=0;i<list.size();i++){
     News news=(News)list.get(i);  
     %> 
  <tr>
    <td><a href="xinwen.jsp?newsId=<%=news.getNewsId()%>" class="STYLE1"><%=news.getTitle()%></a>&nbsp;&nbsp;</td>
  </tr>
 <%}%>	
</table>
	  
		<%
		UsersDao usersDao=new UsersDaoImpl();
		Users usersts=new Users();
		Users userst=(Users)usersDao.findUsers(usersts.getUserId());
		Users u=(Users)session.getAttribute("user");
		 %>
              <!--user-info-->
              <div class="user-info">
                <div class="gold-top">
                <%if(u!=null){%>
                <img width="62px" height="62px" src="<%=u.getHead()%>" />
                <%}else{%>
                <img width="62px" height="62px" src="img/user-head.jpg" />
                <%}%>
                    <div class="inner-user">
                 <%
         	  Users userss=(Users)session.getAttribute("user");
                if(userss==null){
                  %>
               <h1><a href="#">尚未登录</a></h1>
                    <%
        	   }else{	   
             %>
             Hi<span class="STYLE2"><%=userss.getName()%></span>
          
              <%
           	}
              %>
         <a class="vip-home" href="#">会员俱乐部</a> </div>
                </div>
                <!--login-->
                <div class="login"> <a class="login-btn" href="pinhongdenglu.jsp">
                <i class="fa fa-user fa-user-loc"></i>登陆</a> 
                <a class="login-btn free" href="pinhongzhuce.jsp">免费注册</a> </div>
              </div>
              <!--service-->
              <div class="service">
                <h3>便民服务</h3>
                <div id="service-1" class="service-cell service-z">
                  <h5 class="service-i"><img src="img/phone.png" /></h5>
                  <h6>话费</h6>
                  <i class="fa fa-angle-down"></i> </div>
                <div id="service-2" class="service-cell service-z">
                  <h5 class="service-i"><img src="img/game.png" /></h5>
                  <h6>游戏</h6>
                  <i class="fa fa-angle-down"></i> </div>
                <div id="service-3" class="service-cell service-z">
                  <h5 class="service-i"><img src="img/plane.png" /></h5>
                  <h6>旅行</h6>
                  <i class="fa fa-angle-down"></i> </div>
                <div id="service-4" class="service-cell service-z">
                  <h5 class="service-i"><img src="img/save.png" /></h5>
                  <h6>保险</h6>
                  <i class="fa fa-angle-down"></i> </div>
                <div class="service-cell">
                  <h5 class="service-i"><img src="img/18.png" /></h5>
                  <h6>彩票</h6>
                </div>
                <div class="service-cell">
                  <h5 class="service-i"><img src="img/move.png" /></h5>
                  <h6>电影</h6>
                </div>
                <div class="service-cell">
                  <h5 class="service-i"><img src="img/eat.png" /></h5>
                  <h6>点外卖</h6>
                </div>
                <div class="service-cell">
                  <h5 class="service-i"><img src="img/money.png" /></h5>
                  <h6>理财</h6>
                </div>
                <div class="service-cell">
                  <h5 class="service-i"><img src="img/book.png" /></h5>
                  <h6>电子书</h6>
                </div>
                <div class="service-cell">
                  <h5 class="service-i"><img src="img/miusc.png" /></h5>
                  <h6>音乐</h6>
                </div>
                <div class="service-cell">
                  <h5 class="service-i"><img src="img/bag.png" /></h5>
                  <h6>水电煤</h6>
                </div>
                <div class="service-cell">
                  <h5 class="service-i"><img src="img/....png" /></h5>
                  <h6>请期待</h6>
                </div>
              </div>
              <!--service-box-->
              <div id="service-box-1" class="service-box">
                <div class="service-head"> <a href="#">话费充值</a> <a href="#">流量充值</a> <span class="fa fa-times"></span> </div>
                <div class="feihua-in"> <span>号码</span>
                    <input name="text" type="text" class="tell-num"  placeholder="手机号、固话号"/>
                </div>
                <div class="feihua-in"> <span>面值</span>
                    <input name="text2" type="text" class="money-in" value="50" />
                    <span class="fa fa-angle-down sel-money"></span> </div>
                <div class="gary-text"><span>售价&nbsp;￥&nbsp;</span><span class="orange">49-49.8</span></div>
                <div style="margin-top: 10px"> <a href="#" class="now-chongzhi">立即充值</a> <a href="#" class="now-chongzhi dingqi">定期充值</a> <a href="#">3G急速上网卡</a> </div>
              </div>
              <div id="service-box-2" class="service-box">
                <div class="service-head"> <a href="#">话费充值</a> <a href="#">流量充值</a> <span class="fa fa-times"></span> </div>
                <div class="feihua-in"> <span>号码</span>
                    <input name="text2" type="text" class="tell-num"  placeholder="手机号、固话号"/>
                </div>
                <div class="feihua-in"> <span>面值</span>
                    <input name="text2" type="text" class="money-in" value="50" />
                    <span class="fa fa-angle-down sel-money"></span> </div>
                <div class="gary-text"><span>售价&nbsp;￥&nbsp;</span><span class="orange">49-49.8</span></div>
                <div style="margin-top: 10px"> <a href="#" class="now-chongzhi">立即充值</a> <a href="#" class="now-chongzhi dingqi">定期充值</a> <a href="#">3G急速上网卡</a> </div>
              </div>
              <div id="service-box-3" class="service-box">
                <div class="service-head"> <a href="#">话费充值</a> <a href="#">流量充值</a> <span class="fa fa-times"></span> </div>
                <div class="feihua-in"> <span>号码</span>
                    <input name="text2" type="text" class="tell-num"  placeholder="手机号、固话号"/>
                </div>
                <div class="feihua-in"> <span>面值</span>
                    <input name="text2" type="text" class="money-in" value="50" />
                    <span class="fa fa-angle-down sel-money"></span> </div>
                <div class="gary-text"><span>售价&nbsp;￥&nbsp;</span><span class="orange">49-49.8</span></div>
                <div style="margin-top: 10px"> <a href="#" class="now-chongzhi">立即充值</a> <a href="#" class="now-chongzhi dingqi">定期充值</a> <a href="#">3G急速上网卡</a> </div>
              </div>
              <div id="service-box-4" class="service-box">
                <div class="service-head"> <a href="#">话费充值</a> <a href="#">流量充值</a> <span class="fa fa-times"></span> </div>
                <div class="feihua-in"> <span>号码</span>
                    <input name="text2" type="text" class="tell-num"  placeholder="手机号、固话号"/>
                </div>
                <div class="feihua-in"> <span>面值</span>
                    <input name="text2" type="text" class="money-in" value="50" />
                    <span class="fa fa-angle-down sel-money"></span> </div>
                <div class="gary-text"><span>售价&nbsp;￥&nbsp;</span><span class="orange">49-49.8</span></div>
                <div style="margin-top: 10px"> <a href="#" class="now-chongzhi">立即充值</a> <a href="#" class="now-chongzhi dingqi">定期充值</a> <a href="#">3G急速上网卡</a> </div>
              </div>
            </div>
      </div>
    </div>
    <!--main-->
    
     
	 
	 
	 
	 
	 
	 
    <!--main-->
    <!--main-bottom-->
<div class="main-bottom">
        <div class="sub-bottom-nav">
            <h1>热卖单品</h1>
           <div class="sub-nav-info">
               <a href="#">s5皮套</a>|
               <a href="#">Bose</a>|
               <a href="#">春秋</a>|
               <a href="#">定制</a>|
               <a href="#">高腰裤</a>|
               <a href="#">打底裙</a>|
               <a href="#">文胸</a>|
               <a href="#">春装</a>|
               <a href="#">男鞋</a>|
               <a href="#">iphone</a>|
               <a href="#">婚纱</a>|
               <a href="#">男牛仔</a>|
               <a href="#">女T恤</a>|
               <a href="#">针织衫</a>|
               <a href="#">客厅灯</a>|
               <a href="#">巧克力</a>|
               <a href="#">更多</a>
           </div>
        </div>

    <!--ad-->

    <!--help-->
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
                <a href="about.jsp">关于品红</a>
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


    <script src="js/jquery_1.9.js"></script>
    <script src="js/main.js"></script>
    <script src="js/img-show.js"></script>
</body>
</html>
