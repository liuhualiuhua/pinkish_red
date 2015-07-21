<%@ page language="java" import="java.util.*,java.text.*,entity.*,dao.*,dao.impl.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'xinwenneiron.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <style type="text/css">
<!--
.STYLE7 {
	font-size: large;
	color: #FF0000;
	font-weight: bold;
}
.STYLE8 {font-size: medium}
.STYLE8 {
	font-size: medium;
	color: #666666;
}
.STYLE9 {
	font-size: medium;
	font-weight: bold;
}
.STYLE10 {
	color: #FF0000;
	font-weight: bold;font-size:20;
}
.STYLE11 {font-size: 20;
}
.STYLE12 {color: #FF6633}
-->
 a:link{font-size:14px; color:#9966CC; text-decoration:none}
 a:hover{color:#FF0000; text-decoration:underline}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript">
function addItem(goodsId){
	$.post(
		"ItemAdd",
		{goodsId:goodsId},
		function(date){
			date=$.parseJSON(date);
			if(date.success){
				alert("添加成功");
			}else{
				alert("添加失败");
			}
		}
	);
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
                    <a href="cart2.jsp">购物车</a>
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
          <a id="spe-a1" href="pinhongshouye.jsp">首页</a>
            <a id="spe-a2" href="#">最新上架</a>
		   <a id="spe-a2" href="#">最新快报</a>
          <a id="spe-a3" href="#">逛逛论坛</a>
           <a id="spe-a3" href="#">后台管理</a>
           <a id="spe-a3" href="#">在线服务</a>
                <img style="cursor: pointer" src="img/ad.gif" />
                <span class="keep-a"><a href="#">消费者保障</a></span>
  
            </div></td>
                <br>
</table>
<br>    <br><br>
<%
int goodsId=Integer.parseInt(request.getParameter("goodsId"));
   GoodsDao goodsDaos=new GoodsDaoImpl();
   Goods goods=(Goods)goodsDaos.findGoods(goodsId);
 %>
<table width="62%" height="228" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="36%" rowspan="5"><img src="<%=goods.getPic() %>" width="230" height="225" ></img></td>
    <td width="64%" align="center"><span class="STYLE10"><%=goods.getName()%></span></td>
  </tr>
  <tr>
    <td align="center"><span class="STYLE11"><%=goods.getDescription() %></span></td>
  </tr>
  <tr>
    <td align="center"><span class="STYLE11"></span></td>
  </tr>
  <tr>
    <td align="center"><span class="STYLE11">价格：<%=goods.getPrice()%></span></td>
  </tr>
  <tr>
    <td align="center">
    <h3>
    <a href="#" class="STYLE12"><br>加入购物车</a>
    <input type="button" onclick="addItem(<%=goods.getGoodsId() %>)" value="加入购物车">
    </h3>
    </td>
  </tr>
</table>


    <div >
 
    </div>
    <br><br><br><br><br><br>
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
