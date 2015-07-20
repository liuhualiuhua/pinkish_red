<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*,util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
Users users=(Users)session.getAttribute("user");
if(users==null){
	response.sendRedirect("/pinkish_red/index.jsp");
	return;
}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>订单页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet" href="/pinkish_red/style/bootstrap.min.css">
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="/pinkish_red/js/jquery-1.9.1.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="/pinkish_red/js/bootstrap.min.js"></script>
</head>
  <body>
    <div class="container">
	    <ol class="breadcrumb">
		  <li><a href="<%=basePath%>">首页</a></li>
		  <li class="active">订单</li>
		</ol>
    
	  <div class="row">
		  <div class="col-sm-9">
		  <br><br>
		  
<% 
	OrderDao orderDao = new OrderDaoImpl();
	ItemDao itemDao = new ItemDaoImpl();
	String pg=request.getParameter("pg");
	int pages=1;
	if(StringUtil.isNotEmpty(pg)){
		pages=Integer.parseInt(pg);
	}
	PageBean pageBean=new PageBean(pages,10);
	Order order=new Order();
	order.setUserId(users.getUserId());
	List list=orderDao.getList(pageBean, order, new HashMap());
	int count=orderDao.getCount(pageBean, order, new HashMap());
	if(list.isEmpty()){
%>	
	<h3>你没有订单</h3>
<% 	
	}else{	
%>	
	<h3 align="center">订单详情</h3>
		   <table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>
							订单编号
						</th>
						<th>
							订单金额
						</th>
						<th>
							下单时间
						</th>
						<th>
							订单状态
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				
				<tbody>	
	
<%			
		for(Object o:list){
			Order order2=(Order)o;
%>

				
					<tr>
						<td>
							<%=order2.getOrderId() %>
						</td>
						<td>
							<%=order2.getPrice() %>
						</td>
						<td>
							<%=order2.getPostTime() %>
						</td>
						<td>
							<%=order2.getStatus() %>
						</td>
						<td>
							<button type="button" class="btn btn-success" onclick="openDetail('<%=order2.getOrderId() %>')"  data-toggle="modal" data-target="#myModal">查看详情</button>
							 <%if("已发货".equals(order2.getStatus())){ %>
							 	 <button type="button" class="btn btn-success"   onclick="comfirmReceive('<%=order2.getOrderId() %>')">确认收货</button>
							<%} %>
						</td>
					</tr>
					

<%
	}
}
 %>
 				</tbody>
			</table>

<nav>
  <ul class="pager">
  	<% if(pages==1){ %>
    <li class="previous disabled"><a href="order2.jsp?pg=<%=pages %>"><span aria-hidden="true">&larr;</span> 上一页</a></li>
    <% }else if(pages>1){ %>
    <li class="previous"><a href="order2.jsp?pg=<%=pages-1 %>"><span aria-hidden="true">&larr;</span> 上一页</a></li>
   	<% } %>
   	
   	<% 
   	
   	int i=count%10;
   	int j=count/10;
   	
   	
   	if(pages<j || (pages==j&&i>0)){%>
    <li class="next"><a href="order2.jsp?pg=<%=pages+1 %>">下一页 <span aria-hidden="true">&rarr;</span></a></li>
    <%}else if(pages==j&&i==0 ||pages>j){ %>
    <li class="next  disabled"><a href="order2.jsp?pg=<%=pages %>">下一页 <span aria-hidden="true">&rarr;</span></a></li>
    <%} %>
  </ul>
</nav>

	  	  </div>
	  	  <div class="col-sm-3">
		   
	  	  </div>
	</div>
	  
	  
	</div>
	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">订单详情</h4>
      </div>
      <div class="modal-body">
       <table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th>
							商品图片
						</th>
						<th>
							商品名称
						</th>
						<th>
							商品型号
						</th>
						<th>
							单价
						</th>
						<th>
							数量
						</th>
						<th>
							价格
						</th>
					</tr>
				</thead>
				<tbody id="goodsDetail">
					
				</tbody>
		</table>
	

				
				
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>	
<script type="text/javascript">
function openDetail(orderId){
	$.get("OrderDetail",{orderId:orderId},function(date){
		date=$.parseJSON(date);
		$("#goodsDetail").empty();
		date.rows.forEach(function(item){
			var str="<tr><td><img src='"+item.pic+"' width='40' height='40'></td><td>"+item.name+"</td><td>"+item.type+"</td><td>"+item.price+"</td><td>"+item.count+"</td><td>"+item.total+"</td></tr>";
			$("#goodsDetail").append(str);
		});
	});
}
function comfirmReceive(orderId){
	if(!confirm("确定收货吗？")){
		return;
	}
	$.post("OrderReceive",{orderId:orderId},function(date){
		date=$.parseJSON(date);
		if(date.success){
			location.href="order2.jsp";
		}else{
			alert("失败");
		}
	
	
	});

}
</script>	
    
    
  </body>
</html>
