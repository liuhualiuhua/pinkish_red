<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="../kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="../kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
var editor1;
KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="content"]', {
				cssPath : '../kindeditor/plugins/code/prettify.css',
				uploadJson : '../kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '../kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				allowImageUpload : true,
				items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				},
				afterChange: function () {
         			this.sync();
        		},
        		afterBlur: function () {
        			this.sync(); 
        		}
			});
			prettyPrint();
		});
</script>
<script type="text/javascript">
	var url;
	
	function searchTopic() {
		$("#dg").datagrid('load', {
			"id" : $("#s_topicId").val(),
			"title":$("#s_title").val(),
			"content":$("#s_content").val(),
			"userId":$("#s_userId").val(),
			"replyId":$("#s_replyId").val()
		});
	}
	
	function openTopicAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加留言信息");
		url="${pageContext.request.contextPath}/TopicAdd";
	}
	function openTopicModifyDialog(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 editor1.html(row.content);
		 $("#dlg").dialog("open").dialog("setTitle","编辑留言/回复信息");
		 $("#fm").form("load",row);
		 url="${pageContext.request.contextPath}/TopicAdd?topicId="+row.topicId;
	 }
	 
	 function openTopicReplyDialog(){
	 	var selectedRows=$("#dg").datagrid("getSelections");
		if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要回复的留言！");
		return;
		}
		var row=selectedRows[0];
		//editor1.html(row.content);
		if(row.replyId!=0){
			$.messager.alert("系统提示","请选择一条要回复的留言！");
		return;
		}
		 $("#dlg").dialog("open").dialog("setTitle","添加回复信息");
		 //$("#fm").form("load",row);
		url="${pageContext.request.contextPath}/TopicAdd?replyId="+row.topicId;
	 }
	 
	 function saveTopic(){
		 $("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				//if($("#postTime").combobox("getValue")==""){
					//$.messager.alert("系统提示","请选择日期！");
					//return false;
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
		 editor1.html("");
		 $("#postTime").datetimebox("setValue","");
		 $("#replyId").val("");
	 }
	 
	 function closeTopicDialog(){
		 $("#dlg").dialog("close");
		 resetValue();
	 }

	 function deleteTopic(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].topicId);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/TopicDelete",{ids:ids},function(result){
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
	<table id="dg" title="用户管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/TopicList" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="topicId" width="20" align="center">编号</th>
   		<th field="title" width="40" align="center">标题</th>
   		<th field="content" width="100" align="center">内容</th>
   		<th field="userId" width="20" align="center">用户ID</th>
   		<th field="userName" width="30" align="center">用户ID</th>
   		<th field="replyId" width="20" align="center">回复帖子ID</th>
   		<th field="postTime" width="30" align="center">发表时间</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openTopicAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加新留言</a>
 		<a href="javascript:openTopicModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:openTopicReplyDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-save'" plain="true">回复</a>
 		<a href="javascript:deleteTopic()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 	</div>
 	<div>
 		&nbsp;帖子ID：&nbsp;<input type="text" id="s_topicId" size="10"  onkeydown="if(event.keyCode==13) searchTopic"/>
 		&nbsp;标题：&nbsp;<input type="text" id="s_title" size="10"  onkeydown="if(event.keyCode==13) searchTopic"/>
 		&nbsp;内容：&nbsp;<input type="text" id="s_content" size="20" onkeydown="if(event.keyCode==13) searchTopic()"/>
 		&nbsp;用户ID：&nbsp;<input type="text" id="s_userId" size="10" onkeydown="if(event.keyCode==13) searchTopic()"/>
 		&nbsp;回复帖子ID：&nbsp;<input type="text" id="s_replyId" size="10" onkeydown="if(event.keyCode==13) searchTopic()"/>
 		<a href="javascript:searchTopic()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
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
   			<td> </td>
   			<td></td>
   		</tr>
   		<tr>
   		<td>新闻内容：</td>
   			<td colspan="4">
   				<textarea id="content" name="content" cols="100" rows="6" style="width:100%;height:150px;visibility:hidden;"></textarea>
   				&nbsp;<font color="red">*</font>
   			</td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveTopic()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeTopicDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
 
 
 
</body>
</html>
