<%@ page language="java"
	import="java.util.*,dao.*,dao.impl.*,entity.*,util.*"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%
Users user=(Users)session.getAttribute("user");
 if(user!=null){
 response.sendRedirect("/pinkish_red/cart2.jsp");
 return;
 }
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
<script src="js/bootstrap.min.js"></script>
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
		  <li><a href="<%=basePath%>">主页</a></li>
		  <li class="active">购物车</li>
		 </ol>
		 <div class="cart-top">
			<a href="<%=basePath%>"><< 主页</a>
		 </div>	
			
		 <div class="col-md-9 cart-items">
			 <h2>我的购物车 </h2>
				<script>
				
			   </script>		   
<%
	//Users users=(Users)session.getAttribute("user");
	Cart cart=(Cart)session.getAttribute("cart");
	if(cart==null){
		cart=new Cart();
	}
	//GoodsDao goodsDao=new GoodsDaoImpl();
	//ItemDao itemDao=new ItemDaoImpl();
	//List itemList=itemDao.getItemByUser(users.getUserId());
	List goodsList=cart.getGoods();
	List countList=cart.getCount();
	
	StringBuffer sb=new StringBuffer("[");
	if(!goodsList.isEmpty()){
	//if(!itemList.isEmpty()){		 
	for(int i=0;i<goodsList.size();i++){
		//Item item=(Item)o;
		Goods goods=(Goods)goodsList.get(i);
		Integer count=(Integer)countList.get(i);
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
							 <input min="1" type="number" id="<%=goods.getGoodsId() %>ItemCount" name="quantity" value="<%=count %>" onchange="changeMoney(<%=goods.getGoodsId() %>)" class="form-control input-small">
					  		   <h4 id="<%=goods.getGoodsId() %>ItemTotal"><span>总价 ￥ </span><%=goods.getPrice()*count %></h4>
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
			if(!goodsList.isEmpty()){
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
			 <button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#myModal" >结算 </button>
			 
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
					location.href="order2.jsp";
				}else{
					alert("失败");
				}
			}
		);
	}
}
function nothing(){
 console.log("nothing");
}
function loginWithCart(){
	var namename=$("#namename").val();
	var passpass=$("#passpass").val();
	var checkcheck=$("#checkcheck").val();
		if(namename==null||namename.trim()==""){
			alert("用户名不能为空！");
			return;
		}
		if(passpass==null||passpass.trim()==""){
			alert("密码不能为空！");
			return;
		}
		if(checkcheck==null||checkcheck.trim()==""){
			alert("验证码不能为空！");
			return;
		}
		if(checkcheck.trim().length!=4){
			alert("验证码长度错误！");
			return;
		}
	
	$.post("Login",
		{name:namename,pass:passpass,check:checkcheck,fm:"fm"},
		function(date){
			date=$.parseJSON(date);
			if(date.success){
				location.href="order2.jsp";
			}else{
				alert(date.errorMsg);
			}
		}
	);
}
function checkCode(){
	document.getElementById('safe').src = 'image.jsp?' + Math.random();
}

$(document).ready(function(){
	calTotal();
});
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form method="post" action="Login">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">请登录后结算</h4>
      </div>
      <div class="modal-body">
		  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="namename" style="width:400px" name="name" placeholder="用户名">
			    </div>
			  </div>
			  <br><br>
			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label">密码   </label>
			    <div class="col-sm-10">
			      <input type="password" class="form-control" style="width:400px" name="pass" id="passpass" placeholder="密码">
			    <input type="hidden" name="fm" value="checkout">
			    </div>
			  </div>
			  <br><br>
			 <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">验证码</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" style="width:340px" name="check" id="checkcheck" placeholder="验证码"><img id="safe" onclick="checkCode()" src="image.jsp">
			    </div>
			  </div>
			  <br><br>
			  
       	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="loginWithCart()">登录</button>
      </div>
      </form>
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
