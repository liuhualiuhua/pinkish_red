<%@ page language="java" import="java.util.*,entity.*" pageEncoding="UTF-8"%>
 <%
Users user=(Users)session.getAttribute("user");
 if(user==null||user.getRole()<2){
 response.sendRedirect("/pinkish_red/index.jsp");
 return;
 }
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
var numReg=/^([0-9]*[1-9][0-9]*){1,}$/;
function searchNote(){
	var ids=$("#s_noteId").val();
	var fromId=$("#s_fromId").val();
	var toId=$("#s_toId").val();
	if(ids!=null&&ids.length>0&&!numReg.test(ids)){
		$.messager.alert("系统提示","请输入正确的用户ID");
		return;
	}
	if(fromId!=null&&fromId.length>0&&!numReg.test(fromId)){
		$.messager.alert("系统提示","请输入正确的用户ID");
		return;
	}
	if(toId!=null&&toId.length>0&&!numReg.test(toId)){
		$.messager.alert("系统提示","请输入正确的用户ID");
		return;
	}
	
	
	
	
	
	$("#dg").datagrid('load', {
		"id" : $("#s_noteId").val(),
		"fromId":$("#s_fromId").val(),
		"toId":$("#s_toId").val(),
		"content":$("#s_content").val(),
		"readSign":$("#s_readSign").val(),
		"postTime":$("#s_postTime").combobox("getValue"),
		"postTime2":$("#s_postTime2").combobox("getValue"),
	});
}

 function deleteNote(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].noteId);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/NoteDelete",{ids:ids},function(result){
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
	<table id="dg" title="聊天信息管理" class="easyui-datagrid" fitColumns="true"
		pagination="true" pageSize:"20"  rownumbers="true"
		url="${pageContext.request.contextPath}/NoteList4UI" fit="true"
		toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true" align="center"></th>
				<th field="noteId" width="20" align="center">信息ID</th>
				<th field="fromId" width="20" align="center">发表ID</th>
				<th field="fromName" width="30" align="center">发表用户名</th>
				<th field="toId" width="20" align="center">接收ID</th>
				<th field="toName" width="30" align="center">接收用户名</th>
				<th field="content" width="100" align="center">内容</th>
				<th field="postTime" width="35" align="center">发表时间</th>
				<th field="readSign" width="20" align="center">是否被读</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
 	<div>
 		<a href="javascript:deleteNote()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		
 		&nbsp;信息ID：&nbsp;&nbsp;&nbsp;<input type="text" id="s_noteId" size="5"  onkeydown="if(event.keyCode==13) searchNote()"/>
 		&nbsp;发表ID：<input type="text" id="s_fromId" size="5" onkeydown="if(event.keyCode==13) searchNote()"/>
 		&nbsp;接收ID：<input type="text" id="s_toId" size="5" onkeydown="if(event.keyCode==13) searchNote()"/>
 		&nbsp;内容：<input type="text" id="s_content" size="5" onkeydown="if(event.keyCode==13) searchNote()"/>
 		&nbsp;状态：<input type="text" id="s_readSign" size="5" onkeydown="if(event.keyCode==13) searchNote()"/>
 		&nbsp;时间范围：&nbsp;<input class="easyui-datetimebox"  id="s_postTime" name="s_postTime"    editable="false" >
 		----<input class="easyui-datetimebox"  id="s_postTime2" name="s_postTime2"    editable="false" >
 		<a href="javascript:searchNote()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 
 
</body>
</html>
