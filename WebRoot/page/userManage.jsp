<%@ page language="java" import="java.util.*,dao.*,dao.impl.*,entity.*" contentType="text/html; charset=GBK"
    pageEncoding="UTF-8"%>
 <%
Users user=(Users)session.getAttribute("user");
 if(user==null||user.getRole()<4){
	 response.sendRedirect("/pinkish_red/index.jsp");
	 return;
 }
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	function searchUser() {
		var ids=$("#s_userId").val();
		if(ids!=null&&ids.length>0&&!numReg.test(ids)){
			$.messager.alert("系统提示","请输入正确的用户ID");
			return;
		}
	
		$("#dg").datagrid('load', {
			"name" : $("#s_name").val(),
			"id":$("#s_userId").val(),
			"role":$("#s_role").val()
		});
	}
	function openUserAddDialog(){
		 $("#dlg").dialog("open").dialog("setTitle","添加用户信息");
		 url="${pageContext.request.contextPath}/UserAdd";
	 }
	 function openUserModifyDialog(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#dlg").dialog("open").dialog("setTitle","编辑用户信息");
		 $("#fm").form("load",row);
		 url="${pageContext.request.contextPath}/UserAdd?userId="+row.userId;
	 }
	 
	 function saveUser(){
		 $("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($("#role").combobox("getValue")==""){
					$.messager.alert("系统提示","请选择用户角色！");
					return false;
				}
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
					$.messager.alert("系统提示",result.errorMsg);
					return;
				}
			}
		 });
	 }
	 
	 function resetValue(){
		 $("#name").val("");
		 $("#pass").val("");
		 $("#head").val("");
		 $("#role").combobox("setValue","");
	 }
	 
	 function closeUserDialog(){
		 $("#dlg").dialog("close");
		 resetValue();
	 }
	 
	 function deleteUser(){
		 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length==0){
			 $.messager.alert("系统提示","请选择要删除的数据！");
			 return;
		 }
		 var strIds=[];
		 for(var i=0;i<selectedRows.length;i++){
			 strIds.push(selectedRows[i].userId);
		 }
		 var ids=strIds.join(",");
		 $.messager.confirm("系统提示","您确定要删除这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("${pageContext.request.contextPath}/UserDelete",{ids:ids},function(result){
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
	 function openUpLoadDialog(){
	 	 var selectedRows=$("#dg").datagrid("getSelections");
		 if(selectedRows.length!=1){
			 $.messager.alert("系统提示","请选择一条要编辑的数据！");
			 return;
		 }
		 var row=selectedRows[0];
		 $("#dlg2").dialog("open").dialog("setTitle","上传用户图片");
		 //$("#fm").form("load",row);
		 url="${pageContext.request.contextPath}/UsersUpLoad?userId="+row.userId;
	 
	 }
	 
	 function saveUpload(){
	 	$("#fm2").form("submit",{
			url:url,
			onSubmit:function(){
				var doc=$("#doc").val();
				if(doc==null||doc.length==0){
					$.messager.alert("系统提示","请添加图片！");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","保存成功！");
					$("#doc").val("");
					$("#preview").css("display","none");
					$("#dlg2").dialog("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("系统提示","保存失败！");
					return;
				}
			}
		 });	
	 }
	 
	 function closeUploadDialog(){
	 	 $("#dlg2").dialog("close");
	 	 $("#doc").val("");
	 	 $("#preview").css("display","none");
	 }
	 
</script>
<title>学生管理</title>
</head>
<body style="margin: 1px">
 <table id="dg" title="用户管理" class="easyui-datagrid"
   fitColumns="true" pagination="true" rownumbers="true"
   url="${pageContext.request.contextPath}/UserList" fit="true" toolbar="#tb">
   <thead>
   	<tr>
   		<th field="cb" checkbox="true" align="center"></th>
   		<th field="userId" width="50" align="center">编号</th>
   		<th field="name" width="50" align="center">用户名</th>
   		<th field="pass" width="50" align="center">密码</th>
   		<th field="role" width="50" align="center">角色</th>
   		<th field="head" width="50" align="center">头像</th>
   	</tr>
   </thead>
 </table>
 <div id="tb">
 	<div>
 		<a href="javascript:openUserAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
 		<a href="javascript:openUserModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
 		<a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
 		<a href="javascript:openUpLoadDialog()" class="easyui-linkbutton" iconCls="icon-jcsjgl" plain="true">上传头像</a>
 	</div>
 	<div>
 		
 		&nbsp;用户ID：&nbsp;<input type="text" id="s_userId" size="20"  onkeydown="if(event.keyCode==13) searchUser()"/>
 		&nbsp;用户名：&nbsp;<input type="text" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
 		&nbsp;权限级别：&nbsp;<input type="text" id="s_role" size="20" onkeydown="if(event.keyCode==13) searchUser()"/>
 		<a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
 	</div>
 </div>
 
 <div id="dlg" class="easyui-dialog" style="width:620px;height:250px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons">
   
   <form id="fm" method="post">
   	<table cellspacing="8px">
   		<tr>
   			<td>用户名：</td>
   			<td><input type="text" id="name" name="name" class="easyui-validatebox" autocomplete="off" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>密码</td>
   			<td><input type="text" id="pass" name="pass" class="easyui-validatebox" autocomplete="off" required="true"/>&nbsp;<font color="red">*</font></td>
   		</tr>
   		<tr>
   			<td>头像URL：</td>
   			<td><input type="text" id="head" name="head" class="easyui-validatebox" autocomplete="off" required="true"/>&nbsp;<font color="red">*</font></td>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
   			<td>用户角色</td>
   			<td>
   				<select class="easyui-combobox" id="role" name="role" style="width: 154px" editable="false" panelHeight="auto">
   					<option value="">权限级别</option>
   					<option value="1">1(消费者)</option>
   					<option value="2">2(客服)</option>
   					<option value="3">3(卖家)</option>
   					<option value="4">4(系统管理员)</option>
   					<option value="5">5(高级管理员)</option>
   				</select>
   				&nbsp;<font color="red">*</font>
   			</td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons">
 	<a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeUserDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
 
 
 <div id="dlg2" class="easyui-dialog" style="width:620px;height:250px;padding: 10px 20px"
   closed="true" buttons="#dlg-buttons2">
   <form id="fm2" method="post"  enctype="multipart/form-data">
   	<table>
   		<tr>
	   		<td>
	   			<input type=file  name="doc" id="doc" onchange="javascript:setImagePreview();"> 
	   		</td>
   		</tr>
   		<tr>
	   		<td>
	   			<div id="localImag" style="text-align:center"> 
					<img id="preview" width=-1 height=-1 style="diplay:none" />
				</div>
	   		</td>
   		</tr>
   	</table>
   </form>
 </div>
 
 <div id="dlg-buttons2">
 	<a href="javascript:saveUpload()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
 	<a href="javascript:closeUploadDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
 </div>
 
 
<script> 
function setImagePreview() { 
	var docObj=document.getElementById("doc"); 
	var imgObjPreview=document.getElementById("preview"); 
	if(docObj.files && docObj.files[0]){ 
		//火狐下，直接设img属性 
		imgObjPreview.style.display = 'block'; 
		imgObjPreview.style.width = '180px'; 
		imgObjPreview.style.height = '160px'; 
		//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
		//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 
		imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]); 
	}else{ 
		//IE下，使用滤镜 
		docObj.select(); 
		var imgSrc = document.selection.createRange().text; 
		var localImagId = document.getElementById("localImag"); 
		//必须设置初始大小 
		localImagId.style.width = "180px"; 
		localImagId.style.height = "160px"; 
		//图片异常的捕捉，防止用户修改后缀来伪造图片 
		try{ 
			localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)"; 
			localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc; 
		}catch(e){ 
		    alert("您上传的图片格式不正确，请重新选择!"); 
		    return false; 
		} 
		imgObjPreview.style.display = 'none'; 
		document.selection.empty(); 
	} 
	return true; 
} 
</script>
<script type="text/javascript">
function changeVal(stext){
	$("#pic").val(stext);
} 
</body>
</html>