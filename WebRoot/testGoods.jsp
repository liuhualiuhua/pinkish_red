<%@ page language="java" import="java.util.*,dao.*,dao.impl.*,entity.*,util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>商品展示页</title>
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
  	
  <table style="margin:50px auto;width:80%;text-align:center;">
  		<tr>
	    	<td colspan="5">当前用户：${sessionScope.user.name }</td>
	    <tr>
	  	<tr>
	    	<td colspan="5">商品列表</td>
	    <tr>
  	<tr>
    	<td>商品ID</td>
    	<td>商品图片</td>
    	<td>商品名称</td>
    	<td>商品描述</td>
    	<td>商品价格</td>
    	<td>操作按钮</td>
    <tr>
  <%
    GoodsDao goodsDao=new GoodsDaoImpl();
    PageBean pageBean=new PageBean(1,30);
    List list=goodsDao.findGoodsByPage(pageBean, new Goods(), new HashMap());
    for(Object o:list){
    	Goods goods=(Goods)o;
    %>
    <tr style="height:15px">
    	<td><%=goods.getGoodsId() %></td>
    	<td><img width="50px" height="50px" src="<%=goods.getPic() %>"></td>
    	<td><%=goods.getName() %></td>
    	<td><%=goods.getDescription() %></td>
    	<td><%=goods.getPrice() %></td>
    	<td>
    		<input type="button" onclick="addItem(<%=goods.getGoodsId() %>)" value="加入购物车">
    	</td>
    <tr>
    <%
    }
     %>
    </table>
    
  </body>
</html>
