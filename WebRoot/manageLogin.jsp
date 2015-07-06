<%@ page language="java" import="java.util.*,dao.*,dao.impl.*,entity.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Users users=(Users)session.getAttribute("users");
	if(users!=null){
		response.sendRedirect("manageIndex.jsp");
		return;
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>后台管理--登录页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
	<STYLE type=text/css>
BODY {
	TEXT-ALIGN: center;
	PADDING-BOTTOM: 0px;
	BACKGROUND-COLOR: #ddeef2;
	MARGIN: 0px;
	PADDING-LEFT: 0px;
	PADDING-RIGHT: 0px;
	PADDING-TOP: 0px
}

A:link {
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:visited {
	COLOR: #000000;
	TEXT-DECORATION: none
}

A:hover {
	COLOR: #ff0000;
	TEXT-DECORATION: underline
}

A:active {
	TEXT-DECORATION: none
}

.input {
	BORDER-BOTTOM: #ccc 1px solid;
	BORDER-LEFT: #ccc 1px solid;
	LINE-HEIGHT: 20px;
	WIDTH: 182px;
	HEIGHT: 20px;
	BORDER-TOP: #ccc 1px solid;
	BORDER-RIGHT: #ccc 1px solid
}

.input1 {
	BORDER-BOTTOM: #ccc 1px solid;
	BORDER-LEFT: #ccc 1px solid;
	LINE-HEIGHT: 20px;
	WIDTH: 120px;
	HEIGHT: 20px;
	BORDER-TOP: #ccc 1px solid;
	BORDER-RIGHT: #ccc 1px solid;
}
</STYLE>
<script type="text/javascript">
	function login(){
		var userName=document.getElementById("userName").value;
		var password=document.getElementById("password").value;
		var roleName=document.getElementById("role").value;
		if(userName==null||userName==""){
			alert("用户名不能为空！");
			return;
		}
		if(password==null||password==""){
			alert("密码不能为空！");
			return;
		}
		if(roleName==null||roleName==""){
			alert("请选择用户类型！");
			return;
		}	
		document.adminlogin.submit();			
	}
</script>
</head>
<body>
<FORM id=adminlogin  method=post
	name=adminlogin action="${pageContext.request.contextPath}/page/doLogin.jsp"  >
<DIV></DIV>
<TABLE style="MARGIN: auto; WIDTH: 100%; HEIGHT: 100%" border=0
	cellSpacing=0 cellPadding=0>
	<TBODY>
		<TR>
			<TD height=150>&nbsp;</TD>
		</TR>
		<TR style="HEIGHT: 254px">
			<TD>
			<DIV style="MARGIN: 0px auto; WIDTH: 936px"><IMG
				style="DISPLAY: block" src="${pageContext.request.contextPath}/button/body_03.jpg"></DIV>
			<DIV style="BACKGROUND-COLOR: #278296">
			<DIV style="MARGIN: 0px auto; WIDTH: 936px">
			<DIV
				style="BACKGROUND: url(${pageContext.request.contextPath}/button/body_05.jpg) no-repeat; HEIGHT: 155px">
			<DIV
				style="TEXT-ALIGN: left; WIDTH: 265px; FLOAT: right; HEIGHT: 125px; _height: 95px">
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
				<TBODY>
					<TR>
						<TD style="HEIGHT: 45px"><INPUT type="text" class=input value="${user.name }" name="name" id="userName"></TD>
					</TR>
					<TR>
						<TD><INPUT type="password" class=input value="${user.pass }" name="pass" id="password"/></TD>
					</TR>
					<TR>
						<td>
							<select id="role" name="role" class="input" style="margin-top: 15px;height: 24px">
								<option value="">请选择用户类型...</option>
								<option value="管理员"  }>系统管理员</option>
								<option value="主管"  }>主管</option>
								<option value="经理"  }>经理</option>
								<option value="高管"  >高管</option>
							</select>
						</td>
					</TR>
				</TBODY>
			</TABLE>
			</DIV>
			<DIV style="HEIGHT: 1px; CLEAR: both"></DIV>
			<DIV style="WIDTH: 380px; FLOAT: right; CLEAR: both">
			<TABLE border=0 cellSpacing=0 cellPadding=0 width=300>
				<TBODY>
					<TR>
						<TD width=100 align=right><INPUT
							style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
							id=btnLogin src="${pageContext.request.contextPath}/button/btn1.jpg" type=image name=btnLogin onclick="javascript:login();return false;"></TD>
						<TD width=100 align=middle><INPUT
							style="BORDER-RIGHT-WIDTH: 0px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px"
							id=btnReset src="${pageContext.request.contextPath}/button/btn2.jpg" type=image name=btnReset onclick="javascript:adminlogin.reset();return false;"></TD>
					</TR>
				</TBODY>
			</TABLE>
			</DIV>
			</DIV>
			</DIV>
			</DIV>
			<DIV style="MARGIN: 0px auto; WIDTH: 936px"><IMG
				src="${pageContext.request.contextPath}/button/body_06.jpg"></DIV>
			</TD>
		</TR>
		<TR style="HEIGHT: 30%">
			<TD>&nbsp;</TD>
		</TR>
	</TBODY>
</TABLE>
</FORM>
</body>
</html>