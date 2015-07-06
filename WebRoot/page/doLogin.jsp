<%@ page language="java" import="java.util.*,dao.*,dao.impl.*,entity.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String userName = request.getParameter("name");
	String password = request.getParameter("pass");

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
		response.sendRedirect("index.jsp");
	} else {
		request.setAttribute("error", "用户名或密码错误");
		request.getRequestDispatcher("/pinkish_red/index.jsp").forward(request,
				response);
	}
%>