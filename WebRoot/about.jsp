<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>关于品红</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway:400,200,600,800,700,500,300,100,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Arimo:400,700,700italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/component.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="New Fashions Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" 
		/>		
<script src="js/jquery.min.js"></script>
<script src="js/simpleCart.min.js"> </script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!-- start menu -->
</head>
<body>

<div class="about">
	 <div class="container">
			<ol class="breadcrumb">
		  <li><a href="<%=basePath%>">主页</a></li>
		  <li class="active">关于</li>
		 </ol>
		 <h2>关于品红</h2>
		 <div class="about-sec">
			 <div class="about-pic"><img src="images/a1.jpg" class="img-responsive" alt=""/></div>
			 <div class="about-info">
				 <p>&nbsp;&nbsp;品红商城是一家在线购物商城，成立于2015年7月
				 ，目前已成为全球商品种类最多的网上零售商之一。品红商城致力于成为全球最“以客户为中心”的公司，
				 使客户能在公司网站上找到和发现任何他们想在线购买的商品，并努力为客户提供最低的价格。<br>
				&nbsp;&nbsp;品红商城和其他卖家提供数百万种独特的全新、翻新及二手商品，类别包括图书、影视、音乐和游戏、数码下载、
				 电子和电脑、家居和园艺用品、玩具、婴幼儿用品、杂货、服饰、鞋类、珠宝、健康和美容用品、体育、户外用品
				 、工具、以及汽车和工业产品等。</p>
			 </div>
			 <div class="clearfix"></div>
		 </div>
		 <h3>主要商品</h3>
		 <div class="about-grids">
			 <div class="col-md-3 about-grid">
				 <img src="images/mi4.jpg" style="width:276px;height:350px;" class="img-responsive" alt=""/>
				 <a href="<%=basePath%>"><h4>手机</h4></a>
				 
			 </div>
			 <div class="col-md-3 about-grid">
				 <img src="images/c3.jpg" class="img-responsive" alt=""/>
				 <a href="<%=basePath%>"><h4>女装</h4></a>
				 
			 </div>
			 <div class="col-md-3 about-grid pot-2">
				 <img src="images/m5.jpg" class="img-responsive" alt=""/>
				 <a href="<%=basePath%>"><h4>男装</h4></a>
				 
			 </div>
			 <div class="col-md-3 about-grid pot-1">
				 <img src="images/d1.jpg" style="width:276px;height:350px;" class="img-responsive" alt=""/>
				 <a href="<%=basePath%>"><h4>手表</h4></a>
				 
			 </div>
			 <div class="clearfix"></div>
			 </div>
		 </div>
	 </div>
</div>

<!--fotter-->
<div class="fotter-logo">
	 <div class="container">
	 <div class="ftr-logo"><h3><a href="<%=basePath%>">品红商城</a></h3></div>
	 <div class="ftr-info">
	 <p>&copy; 2015 All Rights Reseverd Design by <a href="<%=basePath%>">品红</a> </p>
	</div>
	 <div class="clearfix"></div>
	 </div>
</div>
<!--fotter//-->

</body>
</html>
