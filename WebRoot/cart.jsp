<%@ page language="java"
	import="java.util.*,dao.*,dao.impl.*,entity.*,util.*"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>购物车</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/font-awesome.min.css" />
<link rel="stylesheet" href="css/style.css" />
	<script src="js/jquery_1.9.js"></script>
	<script src="js/main.js"></script>
	<script src="js/img-show.js"></script>
</head>

<body>
	<!--scroll-head-->
	<div class="scroll-head"></div>
	<!--top-->
	<div class="top-wrapper">
		<div class="top-info">
			<div class="top-left">
				<div data-toggle="arrowdown" id="arrow1" class="user-name">
					<a href="#">站长素材</a> <span class="down-icon"></span>
				</div>
				<div data-toggle="arrowdown" id="arrow2" class="msg-info">
					<i class="fa fa-envelope fa-gray"></i> <a href="#">消息</a> <span
						class="down-icon"></span>
				</div>
				<a class="a-float-left" href="#">手机淘宝</a> <img height="34px"
					a-float-left src="img/qqq.gif" />
				<!--hidden-box-->
				<div data-toggle="hidden-box" id="nav-box1" class="user-box">
					<img class="my-head" src="img/user-head.jpg" />
					<div class="my-grow">
						<h1>
							<a href="#">账号管理</a>&nbsp;|&nbsp;<a href="#">退出</a>
						</h1>
						<p>
						<h2>
							<a href="#">查看我会员特权</a>
						</h2>
						<a href="#">我的成长</a>
						</p>
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
								<i style="vertical-align: top"
									class="fa fa-angle-left arrow-left"></i> <i
									style="vertical-align: top"
									class="fa fa-angle-right arrow-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div data-toggle="hidden-box" id="nav-box2" class="msg-box">
					<h1>
						未读新消息<a href="#" class="fa fa-pencil-square-o pencil"></a>
					</h1>
					<div class="read-info">
						<h2>
							<span class="orange">&nbsp;&nbsp;|</span>&nbsp;你的书架&nbsp;<span
								style="font-weight: lighter">收到了<span class="orange">1</span>本书
							</span><span class="fa fa-times close-msg"></span>
						</h2>
						<img src="img/book-1.png" />
						<div style="float: right">
							<p>
								全中国最穷的小伙子发财日记<br /> 掏彩票公共账号
							</p>
							<h3>
								<a href="#">去看看</a>
							</h3>
						</div>
					</div>
					<div class="msg-setting">
						<a href="#" class="fa fa-cog"></a> <a href="#"
							class="fa fa-pencil-square-o"></a> <a style="margin-left: 70px"
							href="#">买家消息&nbsp;|&nbsp;</a> <a href="#">卖家消息</a>
					</div>
				</div>
			</div>
			<!--top-right-->
			<div class="top-right">
				<div data-toggle="arrowdown" id="arrow3" class="user-name">
					<a href="#">我的淘宝</a> <span class="down-icon"></span>
				</div>
				<div data-toggle="arrowdown" id="arrow4" class="user-name">
					<i class="fa fa-shopping-cart fa-orange"></i> <a href="#">购物车</a> <span
						class="down-icon"></span>
				</div>
				<div data-toggle="arrowdown" id="arrow5" class="user-name">
					<i class="fa fa-star fa-gray"></i> <a href="#">收藏夹</a> <span
						class="down-icon"></span>
				</div>
				<a class="a-float-left" href="#">商品分类</a> <span
					class="vertical-line">|</span>
				<div data-toggle="arrowdown" id="arrow6" class="user-name">
					<a href="#">卖家中心</a> <span class="down-icon"></span>
				</div>
				<a class="a-float-left" href="#">联系客户</a>
				<div data-toggle="arrowdown" id="arrow7" class="user-name">
					<i class="fa fa-list-ul fa-orange"></i> <a href="#">网站导航</a> <span
						class="down-icon"></span>
				</div>
				<!--hidden-box-->
				<div data-toggle="hidden-box" id="nav-box3" class="my-taobao-box">
					<ul>
						<li>已买到的宝贝</li>
						<li>新欢</li>
						<li>我的足迹</li>
						<li>我的上新</li>
						<li>我的优惠</li>
					</ul>
				</div>
				<div data-toggle="hidden-box" id="nav-box4" class="shopping-box">
					<span>您购物车里还没有任何宝贝。</span><a class="check-shopp" href="#">查看我的购物车</a>
				</div>
				<div data-toggle="hidden-box" id="nav-box5" class="get-box">
					<ul>
						<li>收藏的宝贝</li>
						<li>收藏的店铺</li>
					</ul>
				</div>
				<div data-toggle="hidden-box" id="nav-box6" class="center-box">
					<ul>
						<li>已卖出的宝贝</li>
						<li>出售中的宝贝</li>
						<li>卖家服务市场</li>
						<li>卖家培训中心</li>
					</ul>
				</div>
				<div data-toggle="hidden-box" id="nav-box7" class="nav-box">
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
						<div data-toggle="arrowdown" id="arrow9"
							class="search-toggle-scroll">
							宝贝<span class="down-icon"></span>
						</div>
						<input class="search-in-scroll" type="text"
							placeholder="    搜‘健康椅’试试，办公好选择" /> <input type="button"
							class="search-but-scroll" value="搜索">
						<div data-toggle="hidden-box" id="nav-box9"
							class="search-toggle-box-scroll">店铺</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--top-main-->
	<div class="top-main">
		<img src="img/logo.gif" />
		<div class="search-wrapper">
			<div class="search-box">
				<div data-toggle="arrowdown" id="arrow8" class="search-toggle">
					宝贝<span class="down-icon"></span>
				</div>
				<input class="search-in" type="text"
					placeholder="    搜‘健康椅’试试，办公好选择"> <input type="button"
					class="search-but" value="搜索">
				<div data-toggle="hidden-box" id="nav-box8"
					class="search-toggle-box">店铺</div>
			</div>
			<a class="a-float-left hight-search" href="#">高级<br />搜索
			</a>
			<!--other-search-->
			<div class="other-search">
				<a href="#">女士凉鞋</a> <a href="#">男士T恤</a> <a href="#">连衣裙</a> <a
					href="#">时尚女包</a> <a href="#">女士T恤</a> <a href="#">雪纺衫</a> <a
					href="#">中老年女装</a> <a href="#">风衣</a> <a href="#">童装</a> <a
					href="#">孕妇装</a> <a href="#">运动套装</a> <a href="#">打底裤</a> <a
					href="#">蚊帐</a> <a href="#" class="more-other">更多<i
					class="fa fa-angle-right"></i></a>
			</div>
		</div>
		<!--two-code-->
		<div class="two-code">
			<h3>手机淘宝</h3>
			<img src="img/code.png" />
			<div class="close-code">
				<i class="fa fa-times"></i>
			</div>
		</div>
	</div>
	<br>
	<br>



	<table style="margin:10px auto;text-align:center;" width="70%">
		<tr>
			<td colspan="7"><br>当前用户：${sessionScope.user.name }<br></td>
		<tr>
		<tr>
			<td colspan="7"><br>购物车<br>
			<br>
			<br>
			<br></td>
		<tr>
		<tr>
			<td>商品ID</td>
			<td>商品图片</td>
			<td>商品信息</td>
			<td>商品单价</td>
			<td>商品数量</td>
			<td>商品金额</td>
			<td>商品操作</td>
		</tr>
		<%
			Users users=(Users)session.getAttribute("user");
				 GoodsDao goodsDao=new GoodsDaoImpl();
				 ItemDao itemDao=new ItemDaoImpl();
				 List itemList=itemDao.getItemByUser(users.getUserId());
				 StringBuffer sb=new StringBuffer("[");
				 if(!itemList.isEmpty()){
				 
			 for(Object o:itemList){
			 	Item item=(Item)o;
			 	Goods goods=goodsDao.findById(item.getGoodsId());
			 	if(goods!=null){
			 	sb.append(","+goods.getGoodsId());
		%>
		<tr name="content" id="<%=goods.getGoodsId()%>tr">
			<td><%=goods.getGoodsId()%></td>
			<td><img width="50px" height="50px" src="<%=goods.getPic()%>">
			</td>
			<td width="200px"><%=goods.getName()%> <%=goods.getBrand()%> <%=goods.getType()%></td>
			<td id="<%=goods.getGoodsId()%>Single"><%=goods.getPrice()%></td>
			<td><input type="button" value="+"
				onclick="addCount(<%=goods.getGoodsId()%>)"> <input
				id="<%=goods.getGoodsId()%>"
				onchange="changeCount(<%=goods.getGoodsId()%>)" type="text"
				value="<%=item.getCount()%>" size="1"> <input type="button"
				value="-" onclick="lessCount(<%=goods.getGoodsId()%>)"></td>
			<td id="<%=goods.getGoodsId()%>Price"></td>
			<td><input type="button" value="移除"
				onclick="makeSure(<%=goods.getGoodsId()%>)"></td>
		</tr>
		<%
			}
			}
				}else{
		%>
		<tr height="20">
			<td colspan="6" style="font-size:+5;">哦哦，你的购物车空空如也...</td>
		</tr>
		<%
			}
				sb.append("]");
		%>
		<%
			if(!itemList.isEmpty()){
		%>
		<tr id="contentToBe">
			<td><input type="button" value="清空购物车" onclick="clearAll()"></td>
			<td></td>
			<td></td>
			<td></td>
			<td>总价：</td>
			<td id="total" style="color:red"></td>
			<td><input type="button" value="提交订单" onclick=""></td>
		</tr>
		<%
			}
		%>

	</table>

	<script type="text/javascript">
var str=<%=sb.toString().replaceFirst(",", "")%>;
function addCount(goodsId){
	var count=Number($("#"+goodsId).val());
	count=count+1;
	updateItem(goodsId,count);
	$("#"+goodsId).val(count);
	calTotal();
}
function lessCount(goodsId){
	var count=Number($("#"+goodsId).val());
	if(count>=2){
		count=count-1;
		updateItem(goodsId,count);
		$("#"+goodsId).val(count);
		calTotal();
	}else{
		if(confirm("确定要移除这件商品吗？")){
			str.splice($.inArray(goodsId,str),1);
			removetr(goodsId);
		}
	}
	
}
function makeSure(goodsId){
	if(confirm("确定要移除这件商品吗？")){
		str.splice($.inArray(goodsId,str),1);
			removetr(goodsId);
	}
}

function removetr(goodsId){
	updateItem(goodsId,0);
	$("#"+goodsId+"tr").remove();
	calTotal();
}
function changeCount(goodsId){
	var numReg=/^(0|[1-9]*){1,}$/; 
	var count=$("#"+goodsId).val();
	if(!numReg.test(count)){
		alert("格式错误");
		$("#"+goodsId).val("1");
	}
	if(Number(count)==0){
		if(confirm("确定要移除这件商品吗？")){
			removetr(goodsId);
		}else{
			$("#"+goodsId).val("1");
			updateItem(goodsId,1);
		}
	}
	calTotal();
}

function calPrice(goodsId){
	var single=Number($("#"+goodsId+"Single").html());
	var count=Number($("#"+goodsId).val());
	var price=single*count;
	$("#"+goodsId+"Price").html(price.toFixed(2)); 
	return price;
}
function calTotal(){
	var total=0;
	
	$.each(str,function(i,n){
		total=total+calPrice(n);
	});
	$("#total").html(total.toFixed(2));
	if(str.length==0){
		alert("哦哦，你的购物车空空如也");
		$("#contentToBe").remove(); 
	}
}

function updateItem(goodsId,count){
	$.post(
		"ItemUpdate",
		{goodsId:goodsId,count:count},
		function(date){
			date=$.parseJSON(date);
			if(date.success){
				//alert("成功");
			}else{
				alert("失败");
			}
		}
	);
}

function cleanItem(){
	$.post(
		"ItemDelete",
		{},
		function(date){
			date=$.parseJSON(date);
			if(date.success){
				//alert("成功");
			}else{
				alert("失败");
			}
		}
	);
}
function clearAll(){
	if(confirm("确定要清空购物车吗？")){
		cleanItem();
		location.href="cart.jsp";
	}
}

$(document).ready(function(){
	calTotal();
})



</script>
	<!--ad-->
	<div class="ad">
		<img src="img/ad.jpg" /> <img src="img/ad1.jpg" />
	</div>
	<!--help-->
	<div class="help">
		<div class="help-info">
			<h1>
				<img src="img/help4.png"><span class="help-text">消费者保障</span>
			</h1>
			<a class="help-a" href="#">保障范围</a> <a class="help-a" href="#">退货退款流程</a>
			<a class="help-a" href="#">服务中心</a> <a class="help-a" href="#">更多特色服务</a>
		</div>
		<div class="help-info">
			<h1>
				<img src="img/help1.png"><span class="help-text">新手上路</span>
			</h1>
			<a class="help-a" href="#">新手专区</a> <a class="help-a" v href="#">消费警示</a>
			<a class="help-a" href="#">交易安全</a> <a class="help-a margin-r"
				href="#">24小时在线帮助</a>
		</div>
		<div class="help-info">
			<h1>
				<img src="img/help2.png"><span class="help-text">付款方式</span>
			</h1>
			<a class="help-a-litter" href="#">支付宝快捷支付</a> <a
				class="help-a-litter" href="#">支付宝卡（现金）付款</a> <a
				class="help-a-litter" href="#">支付宝余额付款</a> <a class="help-a"
				href="#">货到付款</a>
		</div>
		<div class="help-info">
			<h1>
				<img src="img/help3.png"><span class="help-text">淘宝特色</span>
			</h1>
			<a class="help-a" href="#">淘宝指数</a> <a class="help-a" href="#">淘公仔</a>
			<a class="help-a" href="#">手机淘宝</a> <a class="help-a" href="#">旺信</a>
		</div>
	</div>
	<!--footer-->
	<div class="footer">
		<div class="footer-right">
			<div class="footer-nav">
				<a href="#">阿里巴巴集团</a>| <a href="#">阿里巴巴国际站</a>| <a href="#">阿里巴巴中国站</a>|
				<a href="#">全球速卖通</a>| <a href="#">淘宝网</a>| <a href="#">天猫</a>| <a
					href="#">聚划算</a>| <a href="#">一淘</a>| <a href="#">阿里妈妈</a>| <a
					href="#">阿里云计算</a>| <a href="#">云OS</a>| <a href="#">万网</a>| <a
					href="#">支付宝</a>| <a href="#">来往</a>
			</div>
			<div class="about-tao">
				<a href="#">关于淘宝</a> <a href="#">合作伙伴</a> <a href="#">营销中心</a> <a
					href="#">廉正举报</a> <a href="#">联系客服</a> <a href="#">开放平台</a> <a
					href="#">诚征英才</a> <a href="#">联系我们</a> <a href="#">网站地图</a> <a
					href="#">法律声明</a> <span class="gary-text">&copy; 2014
					Taobao.com 版权所有</span>
			</div>
			<p class="gary-text">
				<span>网络文化经营许可证：文网文[2010]040号</span>|<span>增值电信业务经营许可证：浙B2-20080224-1</span>|<span>信息网络传播视听节目许可证：1109364号</span>
			</p>
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
		<div id="backToTop-up" class="up-back">
			<i class="fa fa-angle-up"></i>
		</div>
		<div id="backToTop-down" class="down-back">
			<i class="fa fa-angle-down"></i>
		</div>
	</div>



</body>
</html>
