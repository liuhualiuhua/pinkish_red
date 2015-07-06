<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
function searchNews(){
	$("#dg").datagrid('load', {
		"id" : $("#s_newsId").val(),
		"title":$("#s_title").val(),
		"content":$("#s_content").val(),
		"postTime":$("#s_postTime").combobox("getValue"),
		"postTime2":$("#s_postTime2").combobox("getValue"),
	});
}
function openNewsAddDialog(){
	$("#dlg").dialog("open").dialog("setTitle","添加新闻信息");
	url="${pageContext.request.contextPath}/NewsAdd";
}
function openNewsModifyDialog(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#dlg").dialog("open").dialog("setTitle","编辑新闻信息");
		 $("#fm").form("load",row);
		 url="${pageContext.request.contextPath}/NewsAdd?newsId="+row.newsId;
	 }
	 
	 function saveNews(){
		 $("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				//if($("#postTime").combobox("getValue")==""){
				//	$.messager.alert("系统提示","请选择日期！");
				//	return false;
				//}
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功！");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败！");
					return;
				}
			}
		 });
	 }
	 
	 function resetValue(){
		 $("#title").val("");
		 $("#content").val("");
		 $("#postTime").datetimebox("setValue","");
	 }
	 
	 function closeNewsDialog(){
		 $("#dlg").dialog("close");
		 resetValue();
	 }

	 function deleteNews(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].newsId);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/NewsDelete",{ids:ids},function(result){
					if(result.success){
						 $.messager.alert("系统提示","已成功删除<font color=red>"+result.delNums+"</font>条数据!");
						 $("#dg").datagrid("reload");
					}else{
						$.messager.alert("系统提示","数据删除失败，请联系系统管理员！");
					}
				},"json");
			} 
		 });
	 }
</script>
</head>

<body>
	<table id="dg" title="新闻管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" pageSize:"20"  rownumbers="true"
		url="${pageContext.request.contextPath}/NewsList" fit="true"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="newsId" width="20" align="center">新闻ID</th>
				<th field="title" width="50" align="center">标题</th>
				<th field="content" width="100" align="center">内容</th>
				<th field="postTime" width="40" align="center">发表时间</th>
				<th field="userId" width="20" align="center">作者ID</th>
			</tr>
		</thead>
	</table>
	<div id="tb">
 	<div>
 		<a href="javascript:openNewsAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openNewsModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteNews()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		
 		&nbsp;新闻ID：&nbsp;<input type="text" id="s_newsId" size="10"  onkeydown="if(event.keyCode==13) searchNews()"/>
 		&nbsp;标题：&nbsp;<input type="text" id="s_title" size="15" onkeydown="if(event.keyCode==13) searchNews()"/>
 		&nbsp;内容：&nbsp;<input type="text" id="s_content" size="15" onkeydown="if(event.keyCode==13) searchNews()"/>
 		&nbsp;时间范围：&nbsp;<input class="easyui-datetimebox"  id="s_postTime" name="s_postTime"    editable="false" >
 		----<input class="easyui-datetimebox"  id="s_postTime2" name="s_postTime2"    editable="false" >
 		<a href="javascript:searchNews()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:650px;height:380px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>标题：</td>
   			<td><input type="text" id="title" name="title" class="easyui-validatebox" autocomplete="off" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td></td>
   			<td></td>
   		</tr>
   		<tr>
   		<td>新闻内容：</td>
   			<td colspan="4">
   				<textarea rows="7" cols="47" id="content" name="content" class="easyui-validatebox" required></textarea>
   				&nbsp;<font color="red">*</font>
   			</td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveNews()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeNewsDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>



</body>
</html>
