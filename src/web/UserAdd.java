package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.UsersDao;
import dao.impl.UsersDaoImpl;
import util.StringUtil;
import entity.Users;

public class UserAdd extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		
		String userId = request.getParameter("userId");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		int role = Integer.parseInt(request.getParameter("role"));
		String head = request.getParameter("head");
		Users u = new Users();
		u.setName(name);
		u.setPass(pass);
		u.setRole(role);
		u.setHead(head);
		UsersDao usersDao = new UsersDaoImpl();
		JSONObject obj = new JSONObject();
		int result = 0;
		
		if (StringUtil.isNotEmpty(userId)) {
			u.setUserId(Integer.parseInt(userId));
			result = usersDao.updateUsers(u);
		} else {
			result = usersDao.addUsers(u);
		}

		if (result > 0) {
			obj.put("success", true);
		} else {
			obj.put("success", false);
			obj.put("errorMsg", "±£¥Ê ß∞‹");
		}
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();
	}

}
