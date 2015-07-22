<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shangpinshangjia.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <style type="text/css">

.STYLE1 {
	font-size: small;
	font-weight: bold;
}
.STYLE3 {font-size: medium; font-weight: bold; }

</style>
<script>
      function check(){
     document.getElementById("name").value="";
	 document.getElementById("name").style.color="black";
   }
   
</script>

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
               <h1><a href="#"></a>&nbsp;|&nbsp;<a href="denglu.jsp">尚未登录</a></h1>
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
                    <a href="order2.jsp">我的订单</a>
                    <span class="down-icon"></span>
                </div>
                <div data-toggle="arrowdown" id="arrow4" class="user-name">
                    <i class="fa fa-shopping-cart fa-orange"></i>
                    <a href="cart.jsp">购物车</a>
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
           <a id="spe-a3" href="manageLogin.jsp">后台管理</a>
           <a id="spe-a3" href="service.jsp">在线服务</a>
                <img style="cursor: pointer" src="img/ad.gif" />
                <span class="keep-a"><a href="#">消费者保障</a></span>
            </div></td>
 
</table>
<br>
<br>
<%
    String page1=request.getParameter("page");
    if(page1==null){
    page1="1";
    }
    int pages=Integer.parseInt(page1);
  //   String name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");out.print(name);
   //  int price=Integer.parseInt(request.getParameter("price"));
   //  String name1=new String(request.getParameter("name1").getBytes("ISO-8859-1"),"UTF-8");
          GoodsDao goodsDao=new GoodsDaoImpl();
           int goodsId=Integer.parseInt(request.getParameter("goodsId"));
        	List list=goodsDao.findListGoods(pages);
     %>
<form action="shangpinshangjia1.jsp?goodsId=<%=goodsId%>" name="form" method="post">
<div>
<select name="name">
<option value="">请选择商品类型</option>
<option value="小米">小米</option>
<option value="苹果">苹果</option>
<option value="oppo">oppo</option>
<option value="男装">男装</option>
<option value="女装">女装</option>
<option value="生活用品">生活用品</option>
</select>
 <select name="price">
	<option value="0">-请选择价格-</option>
     <option value="1">100以下</option>
   <option value="2">100~500</option>
   <option value="3">500以上</option>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;<input id="name" name="name1" type="text" value="请输入商品名称..."  onfocus="check()" style="color:#666666" />

 <input name="" type="submit" value="搜索商品">
</div>
</form>
<div class="main-bottom">
        <div class="sub-bottom-nav">
            <h1>热卖单品</h1>
           <div class="sub-nav-info">
               <a href="#">高腰裤</a>|
               <a href="#">春装</a>|
               <a href="#">iphone</a>|
               <a href="#">男牛仔</a>|
                <a href="#">小米</a>|
                 <a href="#">oppo</a>|
               <a href="#">女T恤</a>|     
               <a href="#">更多</a>
           </div>
        </div>
         <%  
         GoodsDao goodsDaos=new GoodsDaoImpl();
       
          int count1=goodsDaos.findCountGoods(goodsId);
       
         String pagew=request.getParameter("page");
         if(pagew==null){
            pagew="1";
         }
          int pagess=Integer.parseInt(page1);
          %>
          
    <%
      for(int i=0;i<list.size();i++){
         Goods goods=(Goods)list.get(i);  
      %>
        <div class="single-sale">
            <a href="jiaru.jsp?goodsId=<%=goods.getGoodsId() %>">
      <img src="<%=goods.getPic()%>" width="120" height="120"></img>
                <h3><%=goods.getName()%></h3>
            </a>
        <p><span class="orange">￥&nbsp;</span><span class="orange"><%=goods.getPrice() %></span><span class="send-free">包邮</span></p>
        <p class="gary-text">&nbsp;&nbsp;&nbsp;<span>月消29件</span></p>
        </div>
         <%} %>  
       </div>
       <%
       Goods goods=new Goods();
        %>
  <div> <a href="shangpinshangjia.jsp?page=<%=pagess==1?1:pagess-1 %>&goodsId=<%=goods.getGoodsId()%>" class="STYLE8">上一页</a>|
        <a href="shangpinshangjia.jsp?page=<%=pagess==count1?count1:pagess+1%>&goodsId=<%=goods.getGoodsId()%>" class="STYLE8">下一页</a></div>
<!--ad-->

    <!--help-->
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


    <script src="js/jquery_1.9.js"></script>
    <script src="js/main.js"></script>
    <script src="js/img-show.js"></script>
</body>
</html>
