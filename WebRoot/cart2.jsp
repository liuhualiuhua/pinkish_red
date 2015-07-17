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
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style1.css" rel="stylesheet" type="text/css" media="all" />
<link href='http://fonts.googleapis.com/css?family=Raleway:400,200,600,800,700,500,300,100,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Arimo:400,700,700italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/component.css" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="js/jquery.min.js"></script>
<script src="js/simpleCart.min.js"> </script>
<!-- start menu -->
<link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<!-- start menu -->
</head>
<body>

<div class="cart">
	 <div class="container">
			 <ol class="breadcrumb">
		  <li><a href="men.html">主页</a></li>
		  <li class="active">购物车</li>
		 </ol>
		 <div class="cart-top">
			<a href="index.html"><< 主页</a>
		 </div>	
			
		 <div class="col-md-9 cart-items">
			 <h2>我的购物车 </h2>
				<script>
				
			   </script>		   
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
			   
			   
			 <div class="cart-header" id="<%=goods.getGoodsId() %>header" >
				 <div class="close1" id="<%=goods.getGoodsId() %>close" onclick="removeItem(<%=goods.getGoodsId() %>)" ></div>
				 <div class="cart-sec">
						<div class="cart-item cyc">
							 <img height="100" src="<%=goods.getPic() %>"/>
						</div>
					   <div class="cart-item-info">
							 <h3><%=goods.getName() %><span>型号 <%=goods.getType() %></span></h3>
							 <input type="hidden" value="<%=goods.getPrice() %>" id="<%=goods.getGoodsId() %>Single">
							 <h4><span>单价 ￥ </span><%=goods.getPrice() %></h4>
							 <p class="qty">数量 :</p>
							 <input min="1" type="number" id="<%=goods.getGoodsId() %>ItemCount" name="quantity" value="<%=item.getCount() %>" onchange="changeMoney(<%=goods.getGoodsId() %>)" class="form-control input-small">
					  		   <h4 id="<%=goods.getGoodsId() %>ItemTotal"><span>总价 ￥ </span><%=goods.getPrice()*item.getCount() %></h4>
					   </div>
					   <div class="clearfix"></div>
						<div class="delivery">
							 <p>货到付款</p>
							 <span>2-3天运到</span>
							 <div class="clearfix"></div>
				        </div>						
				  </div>
			 </div>
<%
			}
			}
				}else{
		%>	
		
		你的购物车还没有商品哦
				 	
		<%
			}
				sb.append("]");
		%>
		<%
			if(!itemList.isEmpty()){
		%>	
		
		
		<%
			}
		%>	
				
		 </div>
		 
		 <div class="col-md-3 cart-total">
			 <a class="continue" href="<%=basePath%>">继续购物</a>
			 <div class="price-details">
				 <h3>价格详情</h3>
				 <span>商品价格</span>
				 <span class="total" id="total1">350.00</span>
				 <span>折扣</span>
				 <span class="total">---</span>
				 <span>运费</span>
				 <span class="total">---</span>
				 <div class="clearfix"></div>				 
			 </div>	
			 <h4 class="last-price">合计</h4>
			 <span class="total final" id="total2">350.00</span>
			 <div class="clearfix"></div>
			 <a class="order" href="javascript:checkOut()" >结算</a>
			 
			</div>
	 </div>
</div>
<script type="text/javascript">
var str=<%=sb.toString().replaceFirst(",", "") %>;
function removeItem(goodsId){
	$("#"+goodsId+"header").fadeOut('slow',function(){
		$("#"+goodsId+"header").remove();
	});
	removeItemOnServer(goodsId);
	calTotal();
}
function changeMoney(goodsId){
	var count=Number($("#"+goodsId+"ItemCount").val());
	var price=Number($("#"+goodsId+"Single").val());
	var itemTotal=count*price;
	updateItem(goodsId,count);
	$("#"+goodsId+"ItemTotal").html("<span>总价 ￥ </span>"+itemTotal);
	calTotal();
	
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
function removeItemOnServer(goodsId){
	str.splice($.inArray(goodsId,str),1);
	updateItem(goodsId,0);
}

function calPrice(goodsId){
	var count=Number($("#"+goodsId+"ItemCount").val());
	var price=Number($("#"+goodsId+"Single").val());
	var itemTotal=count*price;
	
	return itemTotal;
}
function calTotal(){
	var total=0;
	$.each(str,function(i,n){
		total=total+calPrice(n);
	});
	$("#total1").html(total.toFixed(2));
	$("#total2").html(total.toFixed(2));
}

function checkOut(){
	if(confirm("确定要结算吗？")){
		$.post(
			"OrderAdd",
			function(date){
				date=$.parseJSON(date);
				if(date.success){
					//alert("成功");
					location.href="order.jsp";
				}else{
					alert("失败");
				}
			}
		);
	}
}
$(document).ready(function(){
	calTotal();
});
</script>
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