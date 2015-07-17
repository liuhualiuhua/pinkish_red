<%@ page language="java" import="java.util.*,dao.*,dao.impl.*,entity.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
Users user=(Users)session.getAttribute("user");
 if(user==null||user.getRole()<2){
 response.sendRedirect("/pinkish_red/index.jsp");
 return;
 }
  %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>品红商城管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function openTab(text,url,iconCls){
		if($("#tabs").tabs("exists",text)){
			$("#tabs").tabs("select",text);
		}else{
			var content="<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/page/"+url+"'></iframe>";
			$("#tabs").tabs("add",{
				title:text,
				iconCls:iconCls,
				closable:true,
				content:content
			});
		}
	}
	
	function logout(){
		$.messager.confirm("系统提示","您确定要退出系统吗",function(r){
			if(r){
				window.location.href="${pageContext.request.contextPath}/page/doLogout.jsp";
			}
		});
	}
	
	function openPasswordModifyDialog(){
		$("#dlg").dialog("open").dialog("setTitle","修改密码");
		url="${pageContext.request.contextPath}/PassChange?userId=${currentUser.id}";
	}
	function closePasswordModifyDialog(){
		$("#dlg").dialog("close");
		$("#oldPassword").val("");
		$("#newPassword").val("");
		$("#newPassword2").val("");
	}
	
	function modifyPassword(){
		$("#fm").form("submit",{
			url:"PassChange",
			onSubmit:function(){
				var oldPassword=$("#oldPassword").val();
				var newPassword=$("#newPassword").val();
				var newPassword2=$("#newPassword2").val();
				if(!$(this).form("validate")){
					return false;
				}
				/* if(oldPassword!='${currentUser.password}'){
					$.messager.alert("系统提示","用户密码输入错误！");
					return false;
				} */
				if(newPassword!=newPassword2){
					$.messager.alert("系统提示","确认密码输入错误！");
					return false;
				}
				return true;
			},
			success:function(result){
				var result=eval('('+result+')');
				if(result.success){
					$.messager.alert("系统提示","密码修改成功，下一次登录生效！");
					closePasswordModifyDialog();
				}else{
					$.messager.alert("系统提示","密码修改失败");
					return;
				}
			}
		});
	}
</script>
</head>
<body class="easyui-layout">
<div region="north" style="height: 78px;background-color: #E0ECFF">
	<table style="padding: 5px" width="100%">
		<tr>
			<td width="50%">
				<img alt="logo" src="${pageContext.request.contextPath}/button/logo3.jpg">
			</td>
			<td valign="bottom" align="right" width="50%">
				<font size="3">&nbsp;&nbsp;<strong>欢迎：</strong>${user.name }</font>  权限等级：【${user.role }】用户ID：【${user.userId }】
			</td>
		</tr>
	</table>
</div>
<div region="center">
	<div class="easyui-tabs" fit="true" border="false" id="tabs">
		<div title="首页" data-options="iconCls:'icon-home'">
			<div align="center" style="padding-top: 100px"><font color="red" size="10">欢迎使用</font></div>
		</div>
	</div>
</div>
<div region="west" style="width: 200px" title="导航菜单" split="true">
	<div class="easyui-accordion" data-options="fit:true,border:false">
		<div title="新闻管理" data-options="selected:true,iconCls:'icon-yxgl'" style="padding: 10px">
			<a href="javascript:openTab('新闻信息管理','newsManage.jsp','icon-yxjhgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-yxjhgl'" style="width: 150px">新闻信息管理</a>
			<a href="javascript:openTab('留言信息管理','topicManage.jsp','icon-khkfjh')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khkfjh'" style="width: 150px">留言信息管理</a>
		</div>
		<% if(user.getRole()>=3){%>
		<div title="商品管理"  data-options="iconCls:'icon-khgl'" style="padding:10px;">
			<a href="javascript:openTab('商品信息管理','goodsManage.jsp','icon-khxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khxxgl'" style="width: 150px;">商品信息管理</a>
			<a href="javascript:openTab('订单信息管理','orderManage.jsp','icon-khlsgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsgl'" style="width: 150px;">订单信息管理</a>
		</div>
		<% }%>
		<% if(user.getRole()>=6){%>
		<div title="服务管理" data-options="iconCls:'icon-tjbb'" style="padding:10px">
			<a href="javascript:openTab('服务创建','customerServiceCreate.jsp','icon-fwcj')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwcj'" style="width: 150px;">服务创建</a>
			<a href="javascript:openTab('服务分配','customerServiceAssign.jsp','icon-fwfp')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwfp'" style="width: 150px;">服务分配</a>
			<a href="javascript:openTab('服务处理','customerServiceProce.jsp','icon-fwcl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwcl'" style="width: 150px;">服务处理</a>
			<a href="javascript:openTab('服务反馈','customerServiceFeedback.jsp','icon-fwfk')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwfk'" style="width: 150px;">服务反馈</a>
			<a href="javascript:openTab('服务归档','customerServiceFile.jsp','icon-fwgd')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwgd'" style="width: 150px;">服务归档</a>
		</div>
		<% }%>
		<div title="客服专区"  data-options="iconCls:'icon-fwgl'" style="padding:10px">
			<a href="javascript:openTab('前台聊天室','chatroom.jsp','icon-khgcfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khgcfx'" style="width: 150px;">前台聊天室</a>
			<a href="javascript:openTab('前台聊天信息管理','messageManage.jsp','icon-khgxfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khgxfx'" style="width: 150px;">前台聊天信息管理</a>
			<a href="javascript:openTab('客服聊天室','serviceChatroom.jsp','icon-khfwfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khfwfx'" style="width: 150px;">客服聊天室</a>
			<a href="javascript:openTab('客服聊天信息管理','noteManage.jsp','icon-khlsfx')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-khlsfx'" style="width: 150px;">客服聊天信息管理</a>
		</div>
		<% if(user.getRole()>=4){%>
		<div title="基础数据管理"  data-options="iconCls:'icon-jcsjgl'" style="padding:10px">
			<a href="javascript:openTab('404页面','404.jsp','icon-sjzdgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-sjzdgl'" style="width: 150px;">404页面</a>
			<a href="javascript:openTab('500页面','500.jsp','icon-cpxxgl')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cpxxgl'" style="width: 150px;">500页面</a>
			<a href="javascript:openTab('网站简介','../about.jsp','icon-fwcj')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-fwcj'" style="width: 150px;">网站简介</a>
			<a href="javascript:openTab('用户信息管理','userManage.jsp','icon-user')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-user'" style="width: 150px;">用户信息管理</a>
		</div>
		 <% }%>
		<div title="系统管理"  data-options="iconCls:'icon-item'" style="padding:10px">
			<a href="javascript:openPasswordModifyDialog()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-modifyPassword'" style="width: 150px;">修改密码</a>
			<a href="javascript:logout()" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-exit'" style="width: 150px;">安全退出</a>
		</div>
	</div>
</div>
<div region="south" style="height: 25px;padding: 5px" align="center">
	版本所有--品红电子商务 <a href="#" target="_blank">品红</a>(2014-2016)
</div>


<div id="dlg" class="easyui-dialog" style="width: 400px;height:250px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 	<form id="fm" method="post">
 		<table cellspacing="8px">
 			<tr>
 				<td>用户名：</td>
 				<td><input type="text" id="userName" name="name" value="${sessionScope.user.name }" readonly="readonly" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>原密码：</td>
 				<td><input type="password" id="oldPassword" name="pass" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>新密码：</td>
 				<td><input type="password" id="newPassword" name="password" class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 			<tr>
 				<td>确认新密码：</td>
 				<td><input type="password" id="newPassword2"   class="easyui-validatebox" required="true" style="width: 200px"/></td>
 			</tr>
 		</table>
 	</form>
</div>

<div id="dlg-buttons">
	<a href="javascript:modifyPassword()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closePasswordModifyDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>


</body>
</html>