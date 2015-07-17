<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*,util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%
Users user=(Users)session.getAttribute("user");
 if(user==null||user.getRole()<=2){
 response.sendRedirect("/pinkish_red/index.jsp");
 return;
 }
  %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>订单管理页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
var url;
function searchOrder(){
	$("#dg").datagrid('load', {
		"orderId" : $("#s_orderId").val(),
		"userId" : $("#s_userId").val(),
		"price1":$("#s_price1").val(),
		"price2":$("#s_price2").val(),
		"postTime1":$("#s_postTime1").combobox("getValue"),
		"postTime2":$("#s_postTime2").combobox("getValue"),
		"filter":$("#s_filter").combobox("getValue"),
		"sort2":$("#s_sort2").combobox("getValue"),
	});
}
function commitOrder(){
	var selectedRows=$("#dg").datagrid("getSelections");
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要发货的订单！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		var row=selectedRows[i];
		if(row.status!="已提交"){
			$.messager.alert("系统提示","请选择要状态为<font color='red'>已提交</font>的订单！");
			return;
		}
		strIds.push(row.orderId);
	}
	var ids=strIds.join(",");
	$.messager.confirm("系统提示","您确定要<font color=red>发货"+selectedRows.length+"条</font>订单吗？",function(r){
		if(r){
			$.post("OrderCommit",{ids:ids},function(date){
				if(date.success){
						 $.messager.alert("系统提示","已成功将<font color=red>"+date.delNums+"条</font>订单发货!");
						 $("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","订单发货失败，请联系系统管理员！");
					}
			},"json");
		}
	});
}

function returnOrder(){
	var selectedRows=$("#dg").datagrid("getSelections");
	if(selectedRows.length==0){
		$.messager.alert("系统提示","请选择要退回的订单！");
		return;
	}
	var strIds=[];
	for(var i=0;i<selectedRows.length;i++){
		var row=selectedRows[i];
		if(row.status!="已提交"){
			$.messager.alert("系统提示","请选择要状态为<font color='red'>已提交</font>的订单！");
			return;
		}
		strIds.push(row.orderId);
	}
	var ids=strIds.join(",");
	
	$.messager.confirm("系统提示","您确定要<font color=red>退回"+selectedRows.length+"条</font>订单吗？",function(r){
		if(r){
			$.post("OrderReset",{ids:ids},function(date){
				if(date.success){
						 $.messager.alert("系统提示","已成功将<font color=red>"+date.delNums+"条</font>订单退回!");
						 $("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","订单退回失败，请联系系统管理员！");
					}
			},"json");
		}
	});
}


</script>
  </head>
  <body>
    <table id="dg" title="订单列表" class="easyui-datagrid" fitColumns="true"
		pagination="true" pageSize:"20"  rownumbers="true"
		url="${pageContext.request.contextPath}/OrderList" fit="true"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="orderId" width="20" align="center">订单号</th>
				<th field="userId" width="20" align="center">用户ID</th>
				<th field="price" width="50" align="center">订单金额</th>
				<th field="status" width="50" align="center">订单状态</th>
				<th field="postTime" width="50" align="center">提交时间</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
	 	<div>
	 		<a href="javascript:openOrderDetailDialog()" class="easyui-linkbutton" iconCls="icon-fwgd" plain="true">查看详情</a>
	 		<a href="javascript:commitOrder()" class="easyui-linkbutton" data-options="iconCls:'icon-kfcg'"  plain="true">发货</a>
	 		<a href="javascript:returnOrder()" class="easyui-linkbutton" iconCls="icon-reset" plain="true">退回订单</a>
	 	</div>
	 	<div>
	 		
	 		&nbsp;订单号：<input type="text" id="s_orderId" size="5"  onkeydown="if(event.keyCode==13) searchOrder()"/>
	 		&nbsp;用户ID：<input type="text" id="s_userId" size="5" onkeydown="if(event.keyCode==13) searchOrder()"/>
	 		
	 		&nbsp;金额范围：<input type="text" id="s_price1" size="5" onkeydown="if(event.keyCode==13) searchOrder()"/>
--<input type="text" id="s_price2" size="5" onkeydown="if(event.keyCode==13) searchOrder()"/>
   		&nbsp;时间范围：<input class="easyui-datetimebox"  id="s_postTime1" name="s_postTime"    editable="false" >
	 		--<input class="easyui-datetimebox"  id="s_postTime2" name="s_postTime2"    editable="false" >
	 	&nbsp;<select class="easyui-combobox" id="s_filter" name="s_filter"  editable="false" panelHeight="auto">
   					<option value="">订单状态筛选</option>
   					<option value="已提交">已提交</option>
   					<option value="已发货">已发货</option>
   					<option value="已退回">已退回</option>
   					<option value="交易成功">交易成功</option>
   				</select>
 		&nbsp;<select class="easyui-combobox" id="s_sort2" name="s_sort2"  editable="false" panelHeight="auto">
   					<option value="">排序方式</option>
   					<option value="priceasc">按价格升序</option>
   					<option value="pricedesc">按价格降序</option>
   					<option value="timeasc">按时间升序</option>
   					<option value="timedesc">按时间降序</option>
   				</select>
	 		<a href="javascript:searchOrder()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	 	</div>
 	</div>
 	
 	
 	<div id="dlg" class="easyui-dialog" style="width:800px;height:400px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   		<table id="dgdg" title="订单详情" class="easyui-datagrid" fitColumns="true"
		 url="${pageContext.request.contextPath}/OrderDetail"   fit="true">
		<thead>
			<tr>
				<th field="goodsId" width="20" align="center">商品ID</th>
				<th field="name" width="50" align="center">名称</th>
				<th field="brand" width="50" align="center">品牌</th>
				<th field="type" width="50" align="center">型号</th>
				<th field="price" width="30" align="center">单价</th>
				<th field="count" width="30" align="center">数量</th>
				<th field="total" width="30" align="center">价格</th>
			</tr>
		</thead>
	</table>
   		
 	</div>
 
 <div id="dlg-buttons">
 	<!-- <a href="javascript:saveNews()" class="easyui-linkbutton" iconCls="icon-ok">保存</a> -->
 	<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
<script type="text/javascript">
function openOrderDetailDialog(){
	var selectedRows=$("#dg").datagrid("getSelections");
	if(selectedRows.length!=1){
		$.messager.alert("系统提示","请选择一条要查看的订单！");
		return;
	}
	 var row=selectedRows[0];
	  
	 $("#dlg").dialog("open").dialog("setTitle","订单详情");
	
	$("#dgdg").datagrid('load', {
		"orderId":row.orderId
	});

	 /* $.get("OrderDetail",{orderId:row.orderId},function(date){
	 	var date=$.parseJSON(date);
	 	if(date.success){
	 		date.list.forEach(function(item){
	 		var str="<p>"+item.goodsId+" <img src='"+item.pic+"' width='30' height='30'>"+item.name+""+item.price+"</p>";
	 		$("dlg").append(str);
	 		});
	 	}
	 }); */

}
function closeDialog(){
	$("#dlg").dialog("close");
}
</script>
  </body>
</html>
