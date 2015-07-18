<%@ page language="java"
	import="java.util.*,dao.*,dao.impl.*,entity.*,util.*"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("name");
	String password = request.getParameter("pass");
	String check = request.getParameter("check");
	String code = (String) session.getAttribute("check");
	
	
	if (StringUtil.isEmpty(check) || !code.equalsIgnoreCase(check)) {
		request.setAttribute("error", "验证码错误");
		request.setAttribute("name", userName);
		request.setAttribute("pass", password);
		request.getRequestDispatcher("/manageLogin.jsp").forward(
		request, response);
		return;
	}
	
	
	
	UsersDao usersDao = new UsersDaoImpl();
	Users u = new Users();
	u.setName(userName);
	u.setPass(password);

	Users user = usersDao.login(u);
	
	
	if (user != null && user.getRole() >= 2) {
		session.setAttribute("user", user);
		response.sendRedirect("/pinkish_red/manageMain.jsp");
	} else if (user != null && user.getRole() == 1) {
		session.setAttribute("user", user);
		response.sendRedirect("/pinkish_red/manageLogin.jsp");
	} else {
		request.setAttribute("error", "用户名或密码错误");
		request.getRequestDispatcher("/pinkish_red/manageLogin.jsp")
				.forward(request, response);
	}
%>